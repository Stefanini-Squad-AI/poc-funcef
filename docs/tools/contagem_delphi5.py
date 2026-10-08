#!/usr/bin/env python3
"""PFC-18 — Contagem de linhas de código Delphi 5 dos módulos Empréstimo e Contabilidade.

Uso (a partir da raiz do repositório):
    python3 docs/tools/contagem_delphi5.py            # imprime o resumo e valida
    python3 docs/tools/contagem_delphi5.py --write    # (re)gera a seção nas páginas de módulo
    python3 docs/tools/contagem_delphi5.py --check    # falha se as páginas estiverem desatualizadas

Regras:
  * Somente .pas, .dfm, .dpr e .dpk, confirmados por conteúdo (cabeçalho unit/program/library/
    package ou raiz object/inherited/inline do .dfm texto).
  * Excluídos: DFM binário (recurso TPF0), cópias/backups (Cópia de, Copy of, OLD_, _x, x_old,
    x_NNNNN_NNNNNN — só quando o original existe no módulo) e duplicatas de conteúdo (contadas uma vez).
  * Pascal: linha com qualquer token de código = código (diretivas {$...} contam como código);
    linha só com comentário (//, { }, (* *)) = comentário; linha só com espaços = vazia.
  * DFM texto: o formato não tem sintaxe de comentário; linha não vazia = código (declaração).
"""
import argparse
import hashlib
import html
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXTS = (".pas", ".dfm", ".dpr", ".dpk")
MODULES = {
    "emprestimo": {
        "nome": "Empréstimo",
        "dirs": ["EMPRESTIMO/Fontes", "EMPRESTIMOBPL/Integra", "EMPRESTIMOBPL/Interface", "EMPRESTIMOBPL/Objetos"],
        "page": "docs/site/modules/emprestimo/index.html",
    },
    "contab": {
        "nome": "Contabilidade",
        "dirs": ["CONTAB/Fontes", "CONTAB/CtrlObjects", "CONTAB/DbObjects", "CONTAB/FontesMT", "CONTAB/Reports"],
        "page": "docs/site/modules/contab/index.html",
    },
}
BEGIN = "<!-- PFC-18:inicio — gerado por docs/tools/contagem_delphi5.py; não editar manualmente -->"
END = "<!-- PFC-18:fim -->"
ANCHOR = '    <section id="user-stories">'
COPY_PATTERNS = [
    re.compile(r"^c[oó]pia(?: \(\d+\))? de (.+)$", re.I),
    re.compile(r"^copy(?: \(\d+\))? of (.+)$", re.I),
    re.compile(r"^old_(.+)$", re.I),
    re.compile(r"^_(.+)$"),
    re.compile(r"^(.+?)_?old$", re.I),
    re.compile(r"^(.+)_\d{5}_\d{6}$"),
]


def classify_pascal(text):
    """Retorna (codigo, comentario, vazias) por linha física de um fonte Pascal."""
    code = comment = blank = 0
    state = None  # None | "{" | "(*" | "{$" | "(*$"
    for line in text.split("\n"):
        line = line.rstrip("\r")
        has_code = has_comment = False
        i, n = 0, len(line)
        while i < n:
            if state in ("{", "{$"):
                j = line.find("}", i)
                has_comment |= state == "{"
                has_code |= state == "{$"
                if j < 0:
                    i = n
                else:
                    state, i = None, j + 1
                continue
            if state in ("(*", "(*$"):
                j = line.find("*)", i)
                has_comment |= state == "(*"
                has_code |= state == "(*$"
                if j < 0:
                    i = n
                else:
                    state, i = None, j + 2
                continue
            c = line[i]
            if c.isspace():
                i += 1
            elif line.startswith("//", i):
                has_comment, i = True, n
            elif c == "{":
                state, i = ("{$", i + 2) if line.startswith("{$", i) else ("{", i + 1)
            elif line.startswith("(*", i):
                state, i = ("(*$", i + 3) if line.startswith("(*$", i) else ("(*", i + 2)
            elif c == "'":
                j = line.find("'", i + 1)  # '' (aspas escapadas) reabre a string na iteração seguinte
                has_code, i = True, (n if j < 0 else j + 1)
            else:
                has_code, i = True, i + 1
        if has_code:
            code += 1
        elif has_comment:
            comment += 1
        else:
            blank += 1
    return code, comment, blank


def strip_pascal_comments(text):
    text = re.sub(r"\{[^}]*\}|\(\*.*?\*\)|//[^\n]*", " ", text, flags=re.S)
    return text.lstrip().lower()


def confirm(path, data):
    """Confirma por conteúdo que o arquivo é fonte Delphi 5 texto. Retorna motivo de exclusão ou None."""
    ext = path.suffix.lower()
    if ext == ".dfm" and data.startswith(b"\xff\x0a\x00") and b"TPF0" in data[:512]:
        return "DFM binário (recurso TPF0) — linhas físicas não se aplicam"
    if b"\x00" in data:
        return "conteúdo binário"
    text = data.decode("cp1252", errors="replace")
    if ext == ".dfm":
        ok = re.match(r"\s*(object|inherited|inline)\s", text, re.I)
    else:
        head = strip_pascal_comments(text)
        expected = {".pas": ("unit",), ".dpr": ("program", "library"), ".dpk": ("package",)}[ext]
        ok = any(re.match(kw + r"\s", head) for kw in expected)
    return None if ok else f"conteúdo não confirma {ext} Delphi"


def normalized_hash(data):
    lines = [l.rstrip() for l in data.decode("cp1252", errors="replace").splitlines()]
    while lines and not lines[-1]:
        lines.pop()
    return hashlib.sha1("\n".join(lines).encode("utf-8")).hexdigest()


def copy_base(path, stems):
    for pat in COPY_PATTERNS:
        m = pat.match(path.stem)
        if m and m.group(1).lower() in stems and m.group(1).lower() != path.stem.lower():
            return m.group(1)
    return None


def count_module(key):
    cfg = MODULES[key]
    files, others = [], {}
    for d in cfg["dirs"]:
        for p in sorted((ROOT / d).rglob("*"), key=lambda x: str(x).lower()):
            if not p.is_file():
                continue
            if p.suffix.lower() in EXTS:
                files.append(p)
            else:
                ext = p.suffix.lower() or "(sem extensão)"
                others[ext] = others.get(ext, 0) + 1
    stems = {}
    for p in files:
        stems.setdefault(p.suffix.lower(), set()).add(p.stem.lower())

    included, excluded, seen = [], [], {}
    for p in files:
        rel = p.relative_to(ROOT).as_posix()
        data = p.read_bytes()
        reason = confirm(p, data)
        if not reason:
            base = copy_base(p, stems[p.suffix.lower()])
            if base:
                reason = f"cópia/backup de {base}{p.suffix} (fora do build)"
        if not reason:
            h = normalized_hash(data)
            if h in seen:
                reason = f"duplicata de conteúdo de {seen[h]} (contado uma vez)"
            else:
                seen[h] = rel
        if reason:
            excluded.append((rel, reason))
            continue
        ext = p.suffix.lower()
        text = data.decode("cp1252", errors="replace")
        if text.endswith("\n"):
            text = text[:-1]
        if ext == ".dfm":
            lines = text.split("\n") if text else []
            vazias = sum(1 for l in lines if not l.strip())
            cod, com = len(lines) - vazias, 0
        else:
            cod, com, vazias = classify_pascal(text) if text else (0, 0, 0)
        included.append({"path": rel, "ext": ext, "total": cod + com + vazias,
                         "code": cod, "comment": com, "blank": vazias})
    return {"key": key, "nome": cfg["nome"], "dirs": cfg["dirs"], "files": included,
            "excluded": excluded, "others": others}


def totals(files, ext=None):
    sel = [f for f in files if ext is None or f["ext"] == ext]
    return {"n": len(sel), **{k: sum(f[k] for f in sel) for k in ("total", "code", "comment", "blank")}}


def validate(results):
    errors = []
    for r in results.values():
        for f in r["files"]:
            if f["total"] != f["code"] + f["comment"] + f["blank"]:
                errors.append(f"{f['path']}: total != código + comentários + vazias")
        t = totals(r["files"])
        by_ext = [totals(r["files"], e) for e in EXTS]
        for k in ("n", "total", "code", "comment", "blank"):
            if sum(b[k] for b in by_ext) != t[k]:
                errors.append(f"{r['nome']}: soma por tipo difere do total em {k}")
        paths = [f["path"] for f in r["files"]]
        if len(paths) != len(set(paths)):
            errors.append(f"{r['nome']}: arquivo contado mais de uma vez")
    a, b = results["emprestimo"], results["contab"]
    for da in a["dirs"]:
        for db in b["dirs"]:
            if da == db or da.startswith(db + "/") or db.startswith(da + "/"):
                errors.append(f"sobreposição de diretórios: {da} x {db}")
    if {f["path"] for f in a["files"]} & {f["path"] for f in b["files"]}:
        errors.append("arquivo presente nos dois módulos")
    return errors


def fmt(n):
    return f"{n:,}".replace(",", ".")


def row(cells, strong=False):
    if strong:
        cells = [f"<strong>{c}</strong>" for c in cells]
    return "<tr>" + "".join(f"<td>{c}</td>" for c in cells) + "</tr>"


def nums(t):
    return [fmt(t["n"]), fmt(t["total"]), fmt(t["code"]), fmt(t["comment"]), fmt(t["blank"])]


HEAD = ("<thead><tr><th>{0}</th><th>Arquivos Delphi 5</th><th>Linhas totais</th>"
        "<th>Linhas de código</th><th>Comentários</th><th>Linhas vazias</th></tr></thead>")
EXT_LABEL = {".pas": "Units <code>.pas</code>", ".dfm": "Forms <code>.dfm</code> (texto)",
             ".dpr": "Projetos <code>.dpr</code>", ".dpk": "Pacotes <code>.dpk</code>"}


def render(results, key):
    r = results[key]
    files = r["files"]
    t = totals(files)
    pas = [f for f in files if f["ext"] != ".dfm"]
    tp = totals(pas)
    all_files = results["emprestimo"]["files"] + results["contab"]["files"]
    dirs = ", ".join(f"<code>{d}</code>" for d in r["dirs"])
    o = []
    o.append(BEGIN)
    o.append('    <section id="quantidade-codigo">')
    o.append('      <div class="section-title">📊 Quantidade de Código Delphi 5</div>')
    o.append('<div class="stats">')
    o.append(f'  <div class="stat"><div class="n">{fmt(t["n"])}</div><div class="l">arquivos Delphi 5 contados</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(t["total"])}</div><div class="l">linhas totais</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(t["code"])}</div><div class="l">linhas de código</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(tp["code"])}</div><div class="l">linhas de código Pascal (.pas/.dpr/.dpk)</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(t["comment"])}</div><div class="l">linhas de comentário</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(t["blank"])}</div><div class="l">linhas vazias</div></div>')
    o.append('</div>')
    o.append(f'<p>Contagem de linhas que considera <strong>exclusivamente código Delphi 5</strong> (<code>.pas</code>, <code>.dfm</code>, <code>.dpr</code>, <code>.dpk</code>, confirmados por conteúdo) em {dirs}. '
             'Não entram C#, .NET, JavaScript, TypeScript, HTML, CSS, SQL, XML, JSON, Python, scripts, configuração (<code>.cfg</code>, <code>.dof</code>), documentação, binários e artefatos de build. '
             'Os valores vêm do repositório e são gerados e validados por <code>docs/tools/contagem_delphi5.py</code> (PFC-18).</p>')
    o.append('<div class="table-wrap"><table>' + HEAD.format("Módulo") + "<tbody>")
    for k in ("emprestimo", "contab"):
        cells = nums(totals(results[k]["files"]))
        o.append(row([results[k]["nome"] + (" (esta página)" if k == key else "")] + cells, strong=(k == key)))
    o.append(row(["Total (Empréstimo + Contabilidade)"] + nums(totals(all_files)), strong=True))
    o.append("</tbody></table></div>")
    o.append(f'<p>Composição de {r["nome"]} por tipo de arquivo:</p>')
    o.append('<div class="table-wrap"><table>' + HEAD.format("Tipo") + "<tbody>")
    for e in EXTS:
        o.append(row([EXT_LABEL[e]] + nums(totals(files, e))))
    o.append(row([f"Total {r['nome']}"] + nums(t), strong=True))
    o.append("</tbody></table></div>")
    o.append(f'<p>Composição de {r["nome"]} por diretório:</p>')
    o.append('<div class="table-wrap"><table>' + HEAD.format("Diretório") + "<tbody>")
    for d in r["dirs"]:
        o.append(row([f"<code>{d}</code>"] + nums(totals([f for f in files if f["path"].startswith(d + "/")]))))
    o.append(row([f"Total {r['nome']}"] + nums(t), strong=True))
    o.append("</tbody></table></div>")
    o.append('<div class="note"><strong>Critério de contagem:</strong> <em>linhas totais</em> = linhas físicas = código + comentários + vazias. '
             'Nas units, projetos e pacotes, uma linha com qualquer token de código conta como código (inclusive diretivas <code>{$...}</code> e linhas com código e comentário). '
             'Uma linha só com comentário (<code>//</code>, <code>{ }</code>, <code>(* *)</code>, inclusive o interior de blocos de várias linhas) conta como comentário. Uma linha só com espaços conta como vazia. '
             'Literais de string são respeitados, então <code>\'{\'</code> não abre comentário. '
             'Nos <code>.dfm</code> em texto, o formato não tem sintaxe de comentário: as linhas não vazias são declarações de objetos e propriedades e contam como código. Por isso, a coluna Comentários é 0 nesses arquivos. '
             'O card “linhas de código Pascal” mostra só a lógica (<code>.pas</code>/<code>.dpr</code>/<code>.dpk</code>), sem as declarações de forms.</div>')
    o.append(f'<p><strong>Exclusões ({len(r["excluded"])} arquivos com extensão Delphi não contados).</strong> '
             'Cópias e backups só são excluídos quando o arquivo original existe no módulo e a cópia não está no build. '
             'Duplicatas são arquivos com conteúdo idêntico (ignorando espaços no fim da linha) e são contadas uma única vez. '
             'Arquivos com o mesmo nome e conteúdo diferente (por exemplo, versões em <code>EMPRESTIMO/Fontes</code> e no BPL) são versões distintas e entram na contagem. '
             'DFM binário não tem linhas de texto e fica fora da contagem de linhas.</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Arquivo excluído</th><th>Motivo</th></tr></thead><tbody>')
    for path, reason in r["excluded"]:
        o.append(row([f"<code>{html.escape(path)}</code>", html.escape(reason)]))
    o.append("</tbody></table></div>")
    other = ", ".join(f"<code>{html.escape(e)}</code> ({n})" for e, n in sorted(r["others"].items()))
    o.append(f'<p class="desc">Outros arquivos nos mesmos diretórios, fora da contagem por não serem fonte Delphi 5: {other}. '
             'Backups do IDE (<code>.~*</code>, <code>.p__</code>, <code>.d__</code>), recursos compilados (<code>.res</code>, <code>.dcr</code>), configurações (<code>.cfg</code>, <code>.dof</code>), planilhas, logs e dados também ficam fora.</p>')
    o.append(f'<details><summary><strong>Tabela detalhada por arquivo ({fmt(t["n"])} arquivos)</strong>. A linha de soma confere com o total do módulo.</summary>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Arquivo</th><th>Linhas totais</th><th>Linhas de código</th><th>Comentários</th><th>Linhas vazias</th></tr></thead><tbody>')
    for f in files:
        o.append(row([f"<code>{html.escape(f['path'])}</code>", fmt(f["total"]), fmt(f["code"]), fmt(f["comment"]), fmt(f["blank"])]))
    o.append(row([f"Soma da tabela detalhada ({fmt(t['n'])} arquivos)"] + nums(t)[1:], strong=True))
    o.append("</tbody></table></div>")
    o.append("</details>")
    o.append("    </section>")
    o.append(END)
    return "\n".join(o) + "\n"


def apply(page_text, fragment):
    if BEGIN in page_text:
        start = page_text.index(BEGIN)
        end = page_text.index(END, start) + len(END) + 1
        return page_text[:start] + fragment + page_text[end:]
    if page_text.count(ANCHOR) != 1:
        raise SystemExit("âncora da seção 'Guia para User Stories' não encontrada de forma única")
    return page_text.replace(ANCHOR, fragment + ANCHOR)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    results = {k: count_module(k) for k in MODULES}
    errors = validate(results)
    for k, r in results.items():
        t = totals(r["files"])
        print(f"{r['nome']}: arquivos={t['n']} total={t['total']} codigo={t['code']} "
              f"comentarios={t['comment']} vazias={t['blank']} excluidos={len(r['excluded'])}")
    g = totals(results["emprestimo"]["files"] + results["contab"]["files"])
    print(f"Total: arquivos={g['n']} total={g['total']} codigo={g['code']} comentarios={g['comment']} vazias={g['blank']}")
    print("Contagem considera exclusivamente código Delphi 5 (.pas, .dfm, .dpr, .dpk).")
    stale = []
    for k in MODULES:
        page = ROOT / MODULES[k]["page"]
        current = page.read_text(encoding="utf-8")
        updated = apply(current, render(results, k))
        if updated != current:
            if args.write:
                page.write_text(updated, encoding="utf-8")
                print(f"atualizado: {MODULES[k]['page']}")
            else:
                stale.append(MODULES[k]["page"])
    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: somas por arquivo = totais; módulos sem sobreposição; nenhum arquivo contado duas vezes.")
    if args.check and stale:
        print("Páginas desatualizadas: " + ", ".join(stale))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
