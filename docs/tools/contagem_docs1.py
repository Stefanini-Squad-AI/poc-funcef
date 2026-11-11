#!/usr/bin/env python3
"""PFC-26 — Total consolidado de linhas de código de CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV + dependências.

Uso (a partir da raiz do repositório):
    python3 docs/tools/contagem_docs1.py            # imprime o resumo e valida
    python3 docs/tools/contagem_docs1.py --write    # (re)gera as seções no docs1
    python3 docs/tools/contagem_docs1.py --check    # falha se o docs1 estiver desatualizado

Reuso:
  * PFC-18 (contagem_delphi5.py): regras de contagem por linha (código/comentário/vazia), confirmação
    por conteúdo, exclusão de DFM binário, cópias/backups e duplicatas.
  * PFC-19 (loc_migravel.py): leitura das cláusulas uses (sem comentários).

Escopo da contagem:
  1. Módulos: todas as pastas CONTRIBUICAOPREV/, FOLHA/ e BENEFICIOPREV/ (mesmo recorte do inventário
     de 830 artefatos do docs1), com as regras do PFC-18.
  2. Dependências necessárias para executar os três programas, fora das pastas dos módulos:
     a) pacotes de runtime próprios (CM/FUNCEF): pacotes da lista Packages= do .dof de cada programa e,
        recursivamente, os pacotes da cláusula requires de cada .dpk. "Próprio" = pacote compilado pelos
        grupos de build da raiz (1-BPL.Padrao.bpg, 2-BPL.Negocio.bpg, Previdenciario.bpg). Conta-se o .dpk
        e as units da cláusula contains (com o .dfm de mesmo nome na mesma pasta);
     b) units compiladas dentro do .exe que ficam fora da pasta do módulo: units do .dpr com caminho
        explícito (in '..\\..\\Cm\\...') e units alcançadas pelas cláusulas uses e encontradas na pasta do
        .dpr ou no SearchPath do .dof (C:\\ProjetosCM5\\ = raiz do repositório), quando não são fornecidas
        por um pacote de runtime.
  3. Fora: VCL/RTL da Borland e componentes de terceiros (pacotes que não estão nos grupos de build
     próprios, ex.: Developer Express, InfoPower, ReportBuilder, Indy, Multilizer, Toolbar97, TopGrid, JCL).
  4. Cada arquivo entra uma única vez: um arquivo usado por mais de um módulo/pacote é atribuído à
     primeira linha da tabela em que aparece (módulos primeiro; depois dependências em ordem alfabética).
"""
import argparse
import html
import os
import posixpath
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import contagem_delphi5 as c18  # noqa: E402
import loc_migravel as c19  # noqa: E402

ROOT = c18.ROOT
PROGRAMS = [
    # chave, nome, pasta do módulo, .dpr, .dof
    ("contribuicao", "CONTRIBUIÇÃO", "CONTRIBUICAOPREV",
     "CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr", "CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dof"),
    ("folha", "FOLHA", "FOLHA", "FOLHA/Fontes/Folha.dpr", "FOLHA/Fontes/Folha.dof"),
    ("beneficioprev", "BENEFICIOPREV", "BENEFICIOPREV",
     "BENEFICIOPREV/Fontes/BeneficioPrev.dpr", "BENEFICIOPREV/Fontes/BeneficioPrev.dof"),
]
BUILD_GROUPS = ["1-BPL.Padrao.bpg", "2-BPL.Negocio.bpg", "Previdenciario.bpg"]
SEARCH_ROOT = "c:\\projetoscm5\\"
# Pastas de fontes de terceiros/Borland no repositório (só para separar units não resolvidas).
THIRD_PARTY_DIRS = ("cm/componentesxt/", "cm/jcl/", "cm/ems.quick.export/", "cm/packages", "stk/",
                    "cm/tradução msgdelphi/", "cm/traduçao msgdelphi/")
PAGES = {
    "inventario": "docs1/visao-geral/inventario.html",
    "index": "docs1/index.html",
}
BEGIN = "<!-- PFC-26:inicio — gerado por docs/tools/contagem_docs1.py; não editar manualmente -->"
END = "<!-- PFC-26:fim -->"
ANCHOR = "</main>"
METRICS = ("total", "code", "comment", "blank")


# ── Índice do repositório (resolução de caminhos Windows, sem diferenciar maiúsculas) ──────────

def build_path_index():
    index = {}
    for dirpath, dirnames, filenames in os.walk(ROOT):
        rel_dir = Path(dirpath).relative_to(ROOT).as_posix()
        if rel_dir == ".":
            rel_dir = ""
            dirnames[:] = [d for d in dirnames if d not in (".git", "docs", "docs1")]
        for name in filenames:
            rel = f"{rel_dir}/{name}" if rel_dir else name
            index.setdefault(rel.lower(), rel)
    return index


def resolve(index, base_dir, win_path):
    """Resolve um caminho Windows relativo a base_dir (posix, relativo à raiz)."""
    p = win_path.replace("\\", "/")
    joined = posixpath.normpath(posixpath.join(base_dir, p)) if base_dir else posixpath.normpath(p)
    return index.get(joined.lower())


def sibling(index, rel, ext):
    stem = posixpath.splitext(rel)[0]
    return index.get((stem + ext).lower())


def read(rel):
    return (ROOT / rel).read_text(encoding="cp1252", errors="replace")


# ── Leitura de .bpg, .dof, .dpk e .dpr ───────────────────────────────────────────────────────────

def parse_build_groups(index):
    """Pacotes próprios: nome.lower() -> .dpk, a partir dos grupos de build da raiz."""
    own = {}
    for bpg in BUILD_GROUPS:
        for m in re.finditer(r"^(\S+)\.bpl:\s*(\S+\.dpk)\s*$", read(bpg), re.I | re.M):
            rel = resolve(index, "", m.group(2))
            if rel:
                own.setdefault(m.group(1).lower(), rel)
    return own


def parse_dof(rel):
    text = read(rel)
    pk = re.search(r"^Packages=(.*)$", text, re.M)
    sp = re.search(r"^SearchPath=(.*)$", text, re.M)
    packages = [x.strip().lower() for x in pk.group(1).split(";") if x.strip()] if pk else []
    search = []
    for d in (sp.group(1).split(";") if sp else []):
        d = d.strip()
        if d.lower().startswith(SEARCH_ROOT):
            search.append(d[len(SEARCH_ROOT):])
    return packages, search


def clause(text, keyword):
    m = re.search(r"\b" + keyword + r"\b(.*?);", c19.strip_comments(text), re.I | re.S)
    return m.group(1) if m else ""


def parse_units_clause(body):
    """Itens 'Nome' ou "Nome in 'caminho'" de uma cláusula uses/contains."""
    items = []
    for part in body.split(","):
        m = re.match(r"\s*([\w.]+)(?:\s+in\s+'([^']+)')?", part, re.I)
        if m:
            items.append((m.group(1).lower(), m.group(2)))
    return items


def used_units(text):
    """Units de todas as cláusulas uses (interface e implementation) de uma unit. Diretivas
    {$IFDEF}/{$ENDIF} são removidas junto com os comentários: os dois ramos condicionais entram."""
    clean = re.sub(r"\{[^}]*\}|\(\*.*?\*\)|//[^\n]*", " ", text, flags=re.S)
    clean = re.sub(r"'[^'\n]*'", "''", clean)
    units = []
    for m in re.finditer(r"\buses\b(.*?);", clean, re.I | re.S):
        for part in m.group(1).split(","):
            m2 = re.match(r"\s*([A-Za-z_][\w.]*)(?:\s+in\s+'')?\s*$", part, re.I)
            if m2 and m2.group(1).lower() not in units:
                units.append(m2.group(1).lower())
    return units


def parse_dpk(rel):
    text = read(rel)
    requires = [n for n, _ in parse_units_clause(clause(text, "requires"))]
    return requires, parse_units_clause(clause(text, "contains"))


def all_dpks(index):
    found = {}
    for low, rel in sorted(index.items()):
        if low.endswith(".dpk"):
            found.setdefault(posixpath.basename(low)[:-4], rel)
    return found


# ── Fechamento de dependências por programa ──────────────────────────────────────────────────────

def package_closure(start, own, every_dpk):
    """BFS em requires. Retorna {pacote: {"dpk", "own", "requires", "contains"}} e pacotes sem fonte."""
    seen, missing, queue = {}, [], list(start)
    while queue:
        name = queue.pop(0)
        if name in seen or name in missing:
            continue
        dpk = own.get(name) or every_dpk.get(name)
        if not dpk:
            missing.append(name)
            continue
        requires, contains = parse_dpk(dpk)
        seen[name] = {"dpk": dpk, "own": name in own, "requires": requires, "contains": contains}
        queue += requires
    return seen, missing


def package_folder(dpk):
    """Pasta raiz de um pacote: a pasta do .dpk, ou a pasta-mãe quando o .dpk fica em Package(s)/."""
    d = posixpath.dirname(dpk)
    return posixpath.dirname(d) if posixpath.basename(d).lower() in ("package", "packages") else d


def unit_files(index, base_dir, unit, path):
    """Arquivos (.pas e .dfm de mesmo nome) de uma unit declarada com caminho."""
    rel = resolve(index, base_dir, path) if path else None
    if not rel:
        return []
    files = [rel]
    dfm = sibling(index, rel, ".dfm")
    if dfm:
        files.append(dfm)
    return files


def analyze_program(index, own, every_dpk, prog):
    key, nome, folder, dpr, dof = prog
    packages, search = parse_dof(dof)
    closure, missing = package_closure(packages, own, every_dpk)
    provided = {}  # unit -> pacote (próprio ou de terceiros)
    for pname, info in closure.items():
        for unit, _ in info["contains"]:
            provided.setdefault(unit, pname)
    dpr_dir = posixpath.dirname(dpr)
    search_dirs = [dpr_dir] + [d.replace("\\", "/") for d in search]

    own_roots = sorted({package_folder(i["dpk"]).lower() + "/" for i in closure.values() if i["own"]})

    def find_unit(unit):
        for d in search_dirs:
            rel = resolve(index, d, unit + ".pas")
            if rel:
                return rel
        # Fonte fora do caminho declarado: aceita um único arquivo com o nome da unit dentro das
        # pastas dos pacotes próprios usados pelo programa (ex.: CM/CMADMPREV/Fontes).
        name = "/" + unit + ".pas"
        cands = [rel for low, rel in index.items() if low.endswith(name) and low.startswith(tuple(own_roots))]
        if len(cands) == 1:
            fallback.add(cands[0])
            return cands[0]
        return None

    exe_units, unresolved, queue, fallback = {}, {}, [], set()
    missing_dpr = []  # units do .dpr com caminho explícito e sem arquivo no repositório
    for unit, path in parse_units_clause(clause(read(dpr), "uses")):
        if unit in provided:
            continue  # fornecida por pacote de runtime: contada no pacote
        rel = (resolve(index, dpr_dir, path) if path else None) or find_unit(unit)
        if rel:
            exe_units[unit] = (rel, "dpr")
            queue.append(rel)
        elif path:
            missing_dpr.append(f"{unit} in '{path}'")
        else:
            unresolved.setdefault(unit, dpr)
    while queue:
        rel = queue.pop(0)
        for unit in used_units(read(rel)):
            if unit in exe_units or unit in provided:
                continue
            found = find_unit(unit)
            if found:
                exe_units[unit] = (found, "searchpath")
                queue.append(found)
            else:
                unresolved.setdefault(unit, rel)
    # Units próprias usadas e sem fonte única no repositório (as demais não resolvidas são VCL/terceiros).
    ambiguous = {}
    for unit in sorted(unresolved):
        cands = [rel for low, rel in index.items() if low.endswith("/" + unit + ".pas")
                 and not low.startswith(THIRD_PARTY_DIRS)]
        if cands:
            ambiguous[unit] = cands
    return {"key": key, "nome": nome, "folder": folder, "dpr": dpr, "ambiguous": ambiguous, "dof": dof, "packages": packages,
            "search": search_dirs, "closure": closure, "missing": missing, "exe_units": exe_units,
            "unresolved": unresolved, "missing_dpr": missing_dpr, "fallback": sorted(fallback)}


# ── Contagem de arquivos (regras PFC-18) ─────────────────────────────────────────────────────────

def count_file(rel):
    """Retorna (registro, motivo_exclusão) para um arquivo, com as regras do PFC-18."""
    path = ROOT / rel
    data = path.read_bytes()
    reason = c18.confirm(path, data)
    if reason:
        return None, reason
    ext = path.suffix.lower()
    text = data.decode("cp1252", errors="replace")
    if text.endswith("\n"):
        text = text[:-1]
    if ext == ".dfm":
        lines = text.split("\n") if text else []
        blank = sum(1 for line in lines if not line.strip())
        code, comment = len(lines) - blank, 0
    else:
        code, comment, blank = c18.classify_pascal(text) if text else (0, 0, 0)
    return {"path": rel, "ext": ext, "total": code + comment + blank, "code": code,
            "comment": comment, "blank": blank, "hash": c18.normalized_hash(data)}, None


def label(g):
    return g["name"] if g["kind"] == "pkg" else g["folder"]


def in_folder(rel, folder):
    return rel.lower().startswith(folder.lower() + "/")


def consolidate():
    index = build_path_index()
    own = parse_build_groups(index)
    every_dpk = all_dpks(index)
    programs = [analyze_program(index, own, every_dpk, p) for p in PROGRAMS]
    folders = [p["folder"] for p in programs]

    # 1) Módulos: pasta inteira, regras do PFC-18.
    modules = []
    for p in programs:
        r = c18.count_module(p["key"], {"nome": p["nome"], "dirs": [p["folder"]]})
        modules.append({"key": p["key"], "nome": p["nome"], "folder": p["folder"], "files": r["files"],
                        "excluded": r["excluded"]})
    hashes = {}
    for m in modules:
        for f in m["files"]:
            hashes.setdefault(c18.normalized_hash((ROOT / f["path"]).read_bytes()), f["path"])

    # 2) Grupos de dependência: pacotes próprios e units compiladas no .exe (por pasta).
    groups = {}
    third_party = {}
    for p in programs:
        for pname, info in p["closure"].items():
            if not info["own"]:
                third_party.setdefault(pname, {"dpk": info["dpk"], "users": []})["users"].append(p["nome"])
                continue
            g = groups.setdefault(("pkg", pname), {
                "kind": "pkg", "name": posixpath.splitext(posixpath.basename(info["dpk"]))[0],
                "folder": package_folder(info["dpk"]),
                "dpk": info["dpk"], "users": [], "candidates": []})
            g["users"].append(p["nome"])
            if not g["candidates"]:
                cands = [info["dpk"]]
                base = posixpath.dirname(info["dpk"])
                for unit, path in info["contains"]:
                    files = unit_files(index, base, unit, path)
                    if not files:
                        g.setdefault("missing", []).append(f"{unit} in '{path}'")
                    cands += files
                g["candidates"] = cands
        for unit, (rel, how) in sorted(p["exe_units"].items()):
            if any(in_folder(rel, f) for f in folders):
                continue
            d = posixpath.dirname(rel)
            g = groups.setdefault(("exe", d.lower()), {
                "kind": "exe", "name": "Units compiladas no executável", "folder": d, "dpk": None,
                "users": [], "candidates": []})
            if p["nome"] not in g["users"]:
                g["users"].append(p["nome"])
            files = [rel] + ([sibling(index, rel, ".dfm")] if sibling(index, rel, ".dfm") else [])
            for f in files:
                if f not in g["candidates"]:
                    g["candidates"].append(f)

    order = sorted(groups.values(), key=lambda g: (g["kind"] != "pkg", g["name"].lower(), g["folder"].lower()))
    handled = {}  # arquivo de dependência -> dependência que o tratou primeiro
    for g in order:
        g["files"], g["excluded"], g["shared_with"] = [], [], []
        for rel in g["candidates"]:
            owner = next((m["nome"] for m in modules if in_folder(rel, m["folder"])), None)
            if owner:
                g["excluded"].append((rel, f"já contado na linha {owner}"))
                if owner not in g["shared_with"]:
                    g["shared_with"].append(owner)
                continue
            if rel in handled:
                g["excluded"].append((rel, f"já tratado em {handled[rel]}"))
                if handled[rel] not in g["shared_with"]:
                    g["shared_with"].append(handled[rel])
                continue
            handled[rel] = label(g)
            rec, reason = count_file(rel)
            if not reason and rec["hash"] in hashes:
                reason = f"duplicata de conteúdo de {hashes[rec['hash']]} (contado uma vez)"
            if reason:
                g["excluded"].append((rel, reason))
                continue
            hashes[rec["hash"]] = rel
            g["files"].append(rec)
        g["users"] = [p["nome"] for p in programs if p["nome"] in g["users"]]
    return {"programs": programs, "modules": modules, "deps": order, "third_party": third_party}


# ── Totais, validação e HTML ─────────────────────────────────────────────────────────────────────

def totals(files):
    return {"n": len(files), **{k: sum(f[k] for f in files) for k in METRICS}}


def summary(res):
    rows = [(m["nome"], totals(m["files"])) for m in res["modules"]]
    dep_files = [f for g in res["deps"] for f in g["files"]]
    rows.append(("Dependências compartilhadas", totals(dep_files)))
    all_files = [f for m in res["modules"] for f in m["files"]] + dep_files
    return rows, totals(all_files), all_files


def validate(res):
    errors = []
    rows, grand, all_files = summary(res)
    for k in ("n",) + METRICS:
        diff = grand[k] - sum(t[k] for _, t in rows)
        if diff:
            errors.append(f"total geral difere da soma das linhas em {k}: {diff}")
    for f in all_files:
        if f["total"] != f["code"] + f["comment"] + f["blank"]:
            errors.append(f"{f['path']}: total != código + comentários + vazias")
    paths = [f["path"].lower() for f in all_files]
    if len(paths) != len(set(paths)):
        errors.append("arquivo contado mais de uma vez")
    dep_sum = totals([f for g in res["deps"] for f in g["files"]])
    if sum(totals(g["files"])["total"] for g in res["deps"]) != dep_sum["total"]:
        errors.append("soma das dependências listadas difere da linha de dependências")
    for m in res["modules"]:
        for f in m["files"]:
            if not in_folder(f["path"], m["folder"]):
                errors.append(f"{f['path']} fora da pasta {m['folder']}")
    for g in res["deps"]:
        for f in g["files"]:
            if any(in_folder(f["path"], m["folder"]) for m in res["modules"]):
                errors.append(f"dependência {f['path']} dentro de pasta de módulo")
    return errors


def fmt(n):
    return c18.fmt(n)


def row(cells, strong=False):
    return c18.row(cells, strong)


def esc(s):
    return html.escape(s)


def nums(t):
    return [fmt(t["n"]), fmt(t["total"]), fmt(t["code"]), fmt(t["comment"]), fmt(t["blank"])]


HEAD = ("<thead><tr><th>{0}</th><th>Arquivos Delphi 5</th><th>Linhas totais</th>"
        "<th>Linhas de código</th><th>Comentários</th><th>Linhas vazias</th></tr></thead>")


def stats_block(grand):
    return "\n".join([
        '<div class="stats">',
        f'  <div class="stat"><div class="n">{fmt(grand["total"])}</div><div class="l">Total geral de linhas de código (CONTRIBUIÇÃO + FOLHA + BENEFICIOPREV + dependências)</div></div>',
        f'  <div class="stat"><div class="n">{fmt(grand["code"])}</div><div class="l">Linhas efetivas de código (sem comentários e linhas vazias)</div></div>',
        f'  <div class="stat"><div class="n">{fmt(grand["n"])}</div><div class="l">Arquivos Delphi 5 contados (.pas, .dfm, .dpr, .dpk)</div></div>',
        '</div>',
    ])


def summary_table(rows, grand):
    o = ['<div class="table-wrap"><table>' + HEAD.format("Parcela") + "<tbody>"]
    for nome, t in rows:
        o.append(row([esc(nome)] + nums(t)))
    o.append(row(["Total geral"] + nums(grand), strong=True))
    o.append("</tbody></table></div>")
    return "\n".join(o)


def render_inventario(res):
    rows, grand, _ = summary(res)
    progs = res["programs"]
    o = [BEGIN, '<section id="linhas-de-codigo"><div class="section-title">🧮 Linhas de Código — Total Consolidado (PFC-26)</div>']
    o.append(stats_block(grand))
    o.append('<p style="margin-top:1rem">Tamanho do sistema em linhas de código Delphi 5: as pastas dos três módulos e as dependências fora dessas pastas que os programas '
             '<code>ContribuicaoPREV.dpr</code>, <code>Folha.dpr</code> e <code>BeneficioPrev.dpr</code> precisam para rodar. '
             'Cada arquivo entra uma única vez no total. <span class="ev ev-comprovado">COMPROVADO</span>: valores gerados e conferidos por <code>docs/tools/contagem_docs1.py</code>.</p>')
    o.append(summary_table(rows, grand))
    diff = grand["total"] - sum(t["total"] for _, t in rows)
    o.append(f'<div class="note-info">Conferência: soma das quatro linhas acima = {fmt(sum(t["total"] for _, t in rows))} linhas; total geral = {fmt(grand["total"])} linhas; diferença = {diff}. '
             'As linhas por arquivo já publicadas (por exemplo, a coluna “Linhas .pas” do <a href="../folha/inventario-tecnico.html">inventário da FOLHA</a>) não foram alteradas; esta seção só acrescenta os totais.</div>')

    # Conciliação com o inventário de artefatos (que inclui .dof/.cfg e não exclui cópias)
    o.append('<p>Conciliação das linhas de módulo com o inventário de artefatos acima: o inventário conta também <code>.dof</code> e <code>.cfg</code> (configuração, sem código) e não exclui cópias, duplicatas nem DFM binário.</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Módulo</th><th>Fontes Delphi na pasta (.pas/.dfm/.dpr/.dpk)</th>'
             '<th>Não contados (cópia, duplicata ou DFM binário)</th><th>Arquivos contados</th></tr></thead><tbody>')
    for m in res["modules"]:
        n_ex = len(m["excluded"])
        o.append(row([esc(m["nome"]), fmt(len(m["files"]) + n_ex), fmt(n_ex), fmt(len(m["files"]))]))
    o.append("</tbody></table></div>")

    # Dependências
    dep_t = totals([f for g in res["deps"] for f in g["files"]])
    o.append(f'<h3 style="margin-top:1.5rem">Dependências somadas ({sum(1 for g in res["deps"] if g["files"])} itens com linhas, {fmt(dep_t["total"])} linhas)</h3>')
    o.append('<p>Pacotes de runtime próprios (CM/FUNCEF) e units compiladas no executável que ficam fora das pastas dos módulos. '
             'Quando a mesma dependência é usada por mais de um módulo, ela aparece uma vez, com todos os módulos na coluna “Usado por”, e suas linhas entram no total uma única vez. '
             'Pacotes que ficam dentro da pasta FOLHA (por exemplo, <code>CMFBCOMUM50</code>, usado também pela CONTRIBUIÇÃO) já estão na linha FOLHA e aparecem aqui com 0 linhas adicionais.</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Dependência</th><th>Pasta</th><th>Tipo</th><th>Usado por</th>'
             '<th>Arquivos</th><th>Linhas totais</th><th>Linhas de código</th><th>Observação</th></tr></thead><tbody>')
    for g in res["deps"]:
        t = totals(g["files"])
        tipo = "Pacote de runtime (.bpl)" if g["kind"] == "pkg" else "Units no .exe (via .dpr / SearchPath)"
        obs = []
        if g["shared_with"]:
            obs.append("arquivos já contados em " + ", ".join(g["shared_with"]))
        others = [r for r in g["excluded"] if not r[1].startswith(("já contado na linha", "já tratado em"))]
        if others:
            obs.append(f"{len(others)} arquivo(s) não somados (ver lista de exclusões)")
        if g.get("missing"):
            obs.append(f"{len(g['missing'])} unit(s) do contains sem fonte no repositório")
        o.append(row([f"<code>{esc(g['name'])}</code>", f"<code>{esc(g['folder'])}</code>", tipo, ", ".join(g["users"]),
                      fmt(t["n"]), fmt(t["total"]), fmt(t["code"]), esc("; ".join(obs)) or "—"]))
    o.append(row(["Total das dependências", "", "", "", fmt(dep_t["n"]), fmt(dep_t["total"]), fmt(dep_t["code"]), ""], strong=True))
    o.append("</tbody></table></div>")

    # Por programa: o que cada um usa
    o.append('<p>Pacotes de runtime e pastas de dependência usados por programa (lista <code>Packages=</code> do <code>.dof</code> + <code>requires</code> recursivo; units do <code>.dpr</code> e do <code>SearchPath</code>):</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Programa</th><th>Dependências próprias somadas</th><th>Pacotes de terceiros/Borland (fora do total)</th></tr></thead><tbody>')
    for p in progs:
        mine = [g["name"] if g["kind"] == "pkg" else g["folder"] for g in res["deps"] if p["nome"] in g["users"]]
        tp = sorted([n for n, i in p["closure"].items() if not i["own"]] + p["missing"])
        o.append(row([f"{esc(p['nome'])}<br><small><code>{esc(p['dpr'])}</code></small>",
                      ", ".join(f"<code>{esc(x)}</code>" for x in mine),
                      ", ".join(f"<code>{esc(x)}</code>" for x in tp)]))
    o.append("</tbody></table></div>")

    # Metodologia
    o.append('<div class="note"><strong>Critério da contagem (como recontar):</strong> '
             'entram apenas fontes Delphi 5 <code>.pas</code>, <code>.dfm</code>, <code>.dpr</code> e <code>.dpk</code>, confirmados pelo conteúdo do arquivo. '
             '<em>Linhas totais</em> = linhas físicas = código + comentários + linhas vazias. Nos <code>.pas</code>/<code>.dpr</code>/<code>.dpk</code>, uma linha com qualquer código conta como código; uma linha só com comentário (<code>//</code>, <code>{ }</code>, <code>(* *)</code>) conta como comentário; uma linha só com espaços conta como vazia. '
             'Nos <code>.dfm</code> texto, toda linha não vazia é declaração e conta como código. '
             'Ficam fora: DFM binário, cópias e backups (<code>Cópia de</code>, <code>Copy of</code>, <code>OLD_</code>, <code>_x</code>, <code>x_old</code>, <code>x_NNNNN_NNNNNN</code>, quando o original existe), arquivos com conteúdo idêntico a outro já contado, backups do IDE (<code>.~pas</code>, <code>.~dfm</code>), <code>.dof</code>, <code>.cfg</code>, <code>.res</code> e qualquer outro tipo de arquivo. '
             'Essas são as regras do PFC-18 (<code>docs/tools/contagem_delphi5.py</code>).</div>')
    o.append('<div class="note"><strong>Até onde vão as dependências:</strong> '
             '(1) as linhas dos módulos são as pastas inteiras <code>CONTRIBUICAOPREV/</code>, <code>FOLHA/</code> e <code>BENEFICIOPREV/</code>, o mesmo recorte do inventário de artefatos acima; '
             '(2) entram os <strong>pacotes de runtime próprios</strong> da lista <code>Packages=</code> do <code>.dof</code> de cada programa e, de forma recursiva, os pacotes da cláusula <code>requires</code> de cada <code>.dpk</code>. Um pacote é próprio quando é compilado pelos grupos de build da raiz (<code>1-BPL.Padrao.bpg</code>, <code>2-BPL.Negocio.bpg</code>, <code>Previdenciario.bpg</code>), que também indicam qual <code>.dpk</code> usar quando há mais de uma cópia. De cada pacote somam-se o <code>.dpk</code> e as units da cláusula <code>contains</code>, com o <code>.dfm</code> de mesmo nome; '
             '(3) entram as <strong>units compiladas dentro do executável</strong> que ficam fora da pasta do módulo: units do <code>.dpr</code> com caminho explícito (por exemplo, <code>..\\..\\Cm\\Forms\\Source\\FPai.pas</code>) e units alcançadas pelas cláusulas <code>uses</code> e encontradas no <code>SearchPath</code> do <code>.dof</code> (<code>C:\\ProjetosCM5\\</code> = raiz do repositório), quando nenhum pacote de runtime as fornece; '
             '(4) <strong>ficam fora</strong> a VCL/RTL da Borland e os componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, TeeChart, Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL e similares), que não são código do sistema. '
             'O banco Oracle (packages, procedures) também fica fora porque não é fonte Delphi.</div>')
    tp = sorted(res["third_party"].items())
    o.append(f'<p class="desc">Pacotes de terceiros/Borland com fonte no repositório e fora do total ({len(tp)}): '
             + ", ".join(f"<code>{esc(posixpath.splitext(posixpath.basename(i['dpk']))[0])}</code> (<code>{esc(posixpath.dirname(i['dpk']))}</code>)" for _, i in tp)
             + '. Os demais pacotes Borland/terceiros listados nos <code>.dof</code> não têm fonte no repositório.</p>')
    o.append('<p class="desc">Para recontar: <code>python3 docs/tools/contagem_docs1.py</code> (imprime os totais e confere a soma). '
             '<code>python3 docs/tools/contagem_docs1.py --check</code> falha se os números do docs1 forem diferentes da recontagem.</p>')

    # Exclusões das dependências
    excl = [(g, rel, why) for g in res["deps"] for rel, why in g["excluded"]
            if not why.startswith(("já contado na linha", "já tratado em"))]
    missing = [(g, m) for g in res["deps"] for m in g.get("missing", [])]
    mod_excl = [(m, rel, why) for m in res["modules"] for rel, why in m["excluded"]]
    ambiguous = {}
    for p in progs:
        for unit, cands in p["ambiguous"].items():
            ambiguous.setdefault(unit, {"cands": cands, "users": []})["users"].append(p["nome"])
    if ambiguous:
        o.append('<div class="note"><strong>Units próprias sem fonte única (fora do total):</strong> ' + "; ".join(
            f'<code>{esc(u)}</code> (usada por {", ".join(a["users"])}; fontes diferentes em '
            + ", ".join(f"<code>{esc(c)}</code>" for c in a["cands"]) + ")"
            for u, a in sorted(ambiguous.items()))
            + '. Nenhum pacote, <code>.dpr</code> ou <code>SearchPath</code> indica qual versão é compilada, então ela não foi somada.</div>')
    o.append(f'<details><summary><strong>Arquivos não somados: {len(mod_excl)} nas pastas dos módulos, {len(excl)} nas dependências; units do contains sem fonte: {len(missing)}</strong></summary>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Módulo / dependência</th><th>Arquivo</th><th>Motivo</th></tr></thead><tbody>')
    for m, rel, why in mod_excl:
        o.append(row([esc(m["nome"]), f"<code>{esc(rel)}</code>", esc(why)]))
    for g, rel, why in excl:
        o.append(row([f"<code>{esc(g['name'] if g['kind'] == 'pkg' else g['folder'])}</code>", f"<code>{esc(rel)}</code>", esc(why)]))
    for g, m in missing:
        o.append(row([f"<code>{esc(g['name'])}</code>", f"<code>{esc(m)}</code>", "unit do contains sem arquivo no repositório"]))
    o.append("</tbody></table></div></details>")

    # Detalhe por arquivo das dependências
    o.append(f'<details><summary><strong>Tabela detalhada das dependências por arquivo ({fmt(dep_t["n"])} arquivos)</strong>. A soma confere com a linha “Dependências compartilhadas”.</summary>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Dependência</th><th>Arquivo</th><th>Linhas totais</th><th>Linhas de código</th><th>Comentários</th><th>Linhas vazias</th></tr></thead><tbody>')
    for g in res["deps"]:
        label = g["name"] if g["kind"] == "pkg" else g["folder"]
        for f in g["files"]:
            o.append(row([f"<code>{esc(label)}</code>", f"<code>{esc(f['path'])}</code>", fmt(f["total"]), fmt(f["code"]), fmt(f["comment"]), fmt(f["blank"])]))
    o.append(row(["Soma", f"{fmt(dep_t['n'])} arquivos"] + nums(dep_t)[1:], strong=True))
    o.append("</tbody></table></div></details>")
    o.append("</section>")
    o.append(END)
    return "\n".join(o) + "\n"


def render_index(res):
    rows, grand, _ = summary(res)
    o = [BEGIN, '<section id="linhas-de-codigo"><div class="section-title">🧮 Tamanho do Sistema em Linhas de Código (PFC-26)</div>']
    o.append(stats_block(grand))
    o.append(summary_table(rows, grand))
    o.append('<p class="desc">Inclui as dependências próprias necessárias para executar os três programas (pacotes CM/FUNCEF como <code>CM/CMPrevMT50</code>, <code>CM/CMADMPREV</code> e o framework CM), contadas uma única vez; '
             'exclui VCL/Borland e componentes de terceiros. Lista das dependências, critério de contagem e conferência da soma: '
             '<a href="visao-geral/inventario.html#linhas-de-codigo">Inventário de Artefatos → Linhas de Código</a>.</p>')
    o.append("</section>")
    o.append(END)
    return "\n".join(o) + "\n"


def apply(page_text, fragment, anchor):
    if BEGIN in page_text:
        start = page_text.index(BEGIN)
        end = page_text.index(END, start) + len(END) + 1
        return page_text[:start] + fragment + page_text[end:]
    if page_text.count(anchor) != 1:
        raise SystemExit(f"âncora {anchor!r} não encontrada de forma única")
    return page_text.replace(anchor, fragment + anchor)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    res = consolidate()
    errors = validate(res)
    rows, grand, _ = summary(res)
    for nome, t in rows:
        print(f"{nome}: arquivos={t['n']} total={t['total']} codigo={t['code']} comentarios={t['comment']} vazias={t['blank']}")
    print(f"Total geral: arquivos={grand['n']} total={grand['total']} codigo={grand['code']} "
          f"comentarios={grand['comment']} vazias={grand['blank']}")
    for g in res["deps"]:
        t = totals(g["files"])
        print(f"  dep {g['kind']:3} {g['name']:<32} {g['folder']:<40} usado_por={'/'.join(g['users'])} "
              f"arquivos={t['n']} total={t['total']}")
    stale = []
    renders = {"inventario": (render_inventario(res), ANCHOR), "index": (render_index(res), ANCHOR)}
    for key, rel in PAGES.items():
        page = ROOT / rel
        current = page.read_text(encoding="utf-8")
        fragment, anchor = renders[key]
        updated = apply(current, fragment, anchor)
        if updated != current:
            if args.write:
                page.write_text(updated, encoding="utf-8")
                print(f"atualizado: {rel}")
            else:
                stale.append(rel)
    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: total geral = soma das linhas (diferença 0); nenhum arquivo contado duas vezes; "
          "dependências fora das pastas dos módulos.")
    if args.check and stale:
        print("Páginas desatualizadas: " + ", ".join(stale))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
