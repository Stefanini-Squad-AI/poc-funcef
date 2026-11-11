#!/usr/bin/env python3
"""PFC-26 — Total consolidado de linhas de código de CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV + dependências.

Uso (a partir da raiz do repositório):
    python3 docs/tools/contagem_docs1.py            # imprime o resumo e valida
    python3 docs/tools/contagem_docs1.py --check    # falha se o docs1 não publicar estas linhas de módulo

Desde o PFC-45 este script não escreve mais no docs1: a seção “Linhas de Código” (inventário e página
inicial) mostra só o código a migrar — pastas dos módulos + parte efetivamente usada das dependências — e
é gerada por docs/tools/uso_efetivo_dependencias.py, que reusa a contagem deste script. Os totais de
dependências inteiras calculados aqui são linha de base interna e não são publicados.

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
# Marcadores da antiga seção PFC-26 (removida no PFC-45; --check falha se reaparecerem).
BEGIN = "<!-- PFC-26:inicio — gerado por docs/tools/contagem_docs1.py; não editar manualmente -->"
END = "<!-- PFC-26:fim -->"
# Seção “Linhas de Código” (PFC-45), escrita por uso_efetivo_dependencias.py.
LOC_BEGIN = "<!-- PFC-45:inicio — gerado por docs/tools/uso_efetivo_dependencias.py; não editar manualmente -->"
LOC_END = "<!-- PFC-45:fim -->"
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


def module_row(nome, t):
    """Linha de módulo da tabela “Linhas de código a migrar” (PFC-45). Usada pelo gerador
    (uso_efetivo_dependencias.py) e pela conferência --check deste script."""
    return row([html.escape(nome), fmt(t["total"]), fmt(t["code"])])


def check_pages(res):
    """Confere que as páginas do docs1 publicam as linhas de módulo desta contagem e que não restou a
    antiga seção PFC-26 (que somava os arquivos de dependência inteiros). As páginas são escritas por
    uso_efetivo_dependencias.py (PFC-45), que precisa também das linhas efetivamente usadas."""
    problems = []
    for rel in PAGES.values():
        page = (ROOT / rel).read_text(encoding="utf-8")
        if BEGIN in page or END in page:
            problems.append(f"{rel}: ainda contém a seção PFC-26 (dependências inteiras)")
        if LOC_BEGIN not in page or LOC_END not in page:
            problems.append(f"{rel}: seção “Linhas de Código” (PFC-45) ausente")
            continue
        block = page[page.index(LOC_BEGIN):page.index(LOC_END)]
        for m in res["modules"]:
            if module_row(m["nome"], totals(m["files"])) not in block:
                problems.append(f"{rel}: linha do módulo {m['nome']} diferente da recontagem")
    return problems


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
    print(f"Total geral (arquivos inteiros, uso interno): arquivos={grand['n']} total={grand['total']} codigo={grand['code']} "
          f"comentarios={grand['comment']} vazias={grand['blank']}")
    for g in res["deps"]:
        t = totals(g["files"])
        print(f"  dep {g['kind']:3} {g['name']:<32} {g['folder']:<40} usado_por={'/'.join(g['users'])} "
              f"arquivos={t['n']} total={t['total']}")
    if args.write:
        print("Nada a escrever: a seção “Linhas de Código” do docs1 é gerada por "
              "python3 -B docs/tools/uso_efetivo_dependencias.py --write (PFC-45).")
    stale = check_pages(res)
    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: total geral = soma das linhas (diferença 0); nenhum arquivo contado duas vezes; "
          "dependências fora das pastas dos módulos.")
    if args.check and stale:
        print("Páginas desatualizadas:\n  " + "\n  ".join(stale))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
