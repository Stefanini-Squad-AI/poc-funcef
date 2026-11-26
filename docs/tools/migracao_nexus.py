#!/usr/bin/env python3
"""PFC-75 — Pasta "Migração NEXUS": BENEFICIOPREV, FOLHA e CONTRIBUICAOPREV isolados com as suas dependências.

Uso (a partir da raiz do repositório):
    python3 -B docs/tools/migracao_nexus.py            # simula: imprime o recorte e valida a análise PFC-44
    python3 -B docs/tools/migracao_nexus.py --write    # (re)cria a pasta "Migração NEXUS" e valida o resultado
    python3 -B docs/tools/migracao_nexus.py --check    # só valida a pasta existente (integridade + inventário)

O que entra na pasta (caminhos relativos idênticos aos da raiz do repositório = C:\\ProjetosCM5\\):
  1. Módulos: as pastas inteiras BENEFICIOPREV/, FOLHA/ e CONTRIBUICAOPREV/ (todos os arquivos versionados:
     Fontes, CtrlObjects, DBObjects, Relatorios, .dpr/.dof/.cfg/.res/.bpg ...), sem alteração.
  2. Dependências: as 31 dependências do estudo PFC-44 (Analise_linhas_dependencias.md), obtidas com o mesmo
     fechamento do PFC-26 (contagem_docs1.py: Packages= do .dof + requires recursivo + units do .dpr/SearchPath).
     De cada dependência entram só as units do FECHAMENTO DE COMPILAÇÃO dos três programas (compile_closure: uses
     transitivos a partir do .dpr — inclusive os itens "X in 'caminho'" — e dos fontes da pasta do módulo), com o
     .dfm de mesmo nome, os recursos {$R}/{$I} e o .dpk. O fechamento contém as units alcançáveis do PFC-44 e também
     as units importadas implicitamente (fora do contains/SearchPath). Uma unit entra inteira: cortar rotinas dentro
     de um .pas quebraria a compilação; a parte efetivamente usada continua medida pelo PFC-44.
  3. .dpk com units fora do fechamento: a cláusula contains é reduzida às units copiadas (comentário PFC-75 na
     linha do contains); requires não muda — todo pacote próprio requerido também está na pasta.
  4. Grupos de build da raiz (1-BPL.Padrao.bpg, 2-BPL.Negocio.bpg, Previdenciario.bpg): só os projetos cujos
     fontes estão na pasta.
  5. Complemento: units importadas implicitamente que ficam fora das pastas das 31 dependências (no ambiente
     original vêm do Library Path do Delphi); quando há mais de um arquivo candidato, a escolha está em COMPLEMENTS.
  6. INVENTARIO.md e inventario-arquivos.csv (AC5).

Validação (--write e --check), rodando as próprias ferramentas PFC-26/PFC-44 com a raiz apontando para a pasta:
  * só as 3 pastas de módulo (cópias byte a byte) e pastas que contêm apenas arquivos de dependência;
  * mesmo fechamento de pacotes, mesmas units do .exe, mesmo fechamento de compilação e nenhum
    contains/uses/requires próprio de fonte compilado sem arquivo dentro da pasta (nenhuma referência para fora);
  * linhas efetivas recalculadas sobre a pasta iguais ao PFC-44 arquivo a arquivo; somadas às linhas retiradas
    do contains dos .dpk reduzidos = 1.025.183 / 832.014, e por módulo 682.504 / 448.145 / 871.832;
  * INVENTARIO.md e inventario-arquivos.csv iguais ao que o script gera.
"""
import argparse
import csv
import io
import posixpath
import re
import shutil
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import contagem_delphi5 as c18  # noqa: E402
import contagem_docs1 as c26  # noqa: E402
import loc_migravel as c19  # noqa: E402
import uso_efetivo_dependencias as ue  # noqa: E402

REPO = c18.ROOT
NEXUS = "Migração NEXUS"
INVENTORY = "INVENTARIO.md"
CSV_FILE = "inventario-arquivos.csv"
MODULE_FOLDERS = ["BENEFICIOPREV", "FOLHA", "CONTRIBUICAOPREV"]
EXCLUDED_EXAMPLES = ["CONTAB", "ORCAMENTO", "EMPRESTIMO", "INVESTIMENTOS"]
# Totais do estudo PFC-44 que a pasta deve reproduzir (AC3/AC5).
EXPECTED = {"deps": 31, "total": 1632702, "code": 1363291, "eff_total": 1025183, "eff_code": 832014,
            "removed_total": 607519, "removed_code": 531277,
            "per_module": {"contribuicao": 682504, "folha": 448145, "beneficioprev": 871832}}
# Units usadas por fontes compilados de um módulo, ausentes do .dof/SearchPath (no ambiente original são achadas
# pelo Library Path do Delphi). unit -> (programa, arquivo escolhido, justificativa).
COMPLEMENTS = {
    "uctrlfuncoesrh": ("CMRHOBJ50/CtrlObjetos/uCtrlFuncoesRH.pas",
                       "usada por FOLHA/Fontes/FRemessaEletronica.pas (TCtrlFuncoesRH.QuebrarListaFiltro); CMRHOBJ50 é a "
                       "dependência direta de FOLHA indicada no system-overview (CMRHOBJUTIL50 tem outra versão do arquivo)"),
    "uctrlglobalrh": ("CMRHOBJ50/CtrlObjetos/uCtrlGlobalRH.pas",
                      "usada por CM/CMADMPREV/Relatorios/FParamComparaTx.pas (pacote CMAdmPrev); mesma escolha de "
                      "CMRHOBJ50 (CMRHOBJUTIL50 tem outra versão do arquivo)"),
}
RES_RE = re.compile(r"\{\$R\s+'?([^'}\s]+)'?\s*\}", re.I)
INC_RE = re.compile(r"\{\$I(?:NCLUDE)?\s+'?([^'}\s]+)'?\s*\}", re.I)
PFC75_MARK = "{ PFC-75 (Migração NEXUS): cláusula contains reduzida às units alcançadas por CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV"
TOP_BPG = ue.c26.BUILD_GROUPS


def set_root(root):
    """Aponta as ferramentas PFC-18/19/26/44 para outra raiz (repositório ou pasta NEXUS)."""
    for mod in (c18, c19, c26, ue):
        mod.ROOT = root


def tracked_files(prefix):
    out = subprocess.run(["git", "-C", str(REPO), "ls-files", "-z", "--", prefix], check=True,
                         capture_output=True).stdout.decode("utf-8")
    return sorted(p for p in out.split("\0") if p)


# ── Seleção ──────────────────────────────────────────────────────────────────────────────────────

def resources(index, rel):
    """Arquivos de recurso/inclusão citados por {$R} e {$I} que existem ao lado do fonte."""
    text = c26.read(rel)
    base = posixpath.dirname(rel)
    stem = posixpath.splitext(posixpath.basename(rel))[0]
    out = []
    for rx in (RES_RE, INC_RE):
        for m in rx.finditer(text):
            name = m.group(1).replace("*", stem)
            found = c26.resolve(index, base, name)
            if found and found not in out:
                out.append(found)
    return out


def program_map(index, p, module_files):
    """unit -> arquivo no programa: units dos pacotes próprios do fechamento, units do .exe e fontes do módulo
    (mesmo mapa de uso_efetivo_dependencias.analyze)."""
    fmap = {}
    for info in p["closure"].values():
        if not info["own"]:
            continue
        base = posixpath.dirname(info["dpk"])
        for unit, path in info["contains"]:
            rel = c26.resolve(index, base, path) if path else None
            if rel and rel.lower().endswith(".pas"):
                fmap.setdefault(unit, rel)
    for unit, (rel, _) in p["exe_units"].items():
        fmap.setdefault(unit, rel)
    for rel in sorted(module_files):
        if rel.lower().endswith(".pas"):
            fmap.setdefault(posixpath.splitext(posixpath.basename(rel))[0].lower(), rel)
    return fmap


def top_folder(rel):
    parts = rel.lower().split("/")
    return "/".join(parts[:2] if parts[0] == "cm" else parts[:1]) + "/"


def compile_closure(index, p, module_files, own_names):
    """Fechamento de compilação de um programa, seguindo as cláusulas uses (interface e implementation) de forma
    transitiva. Fase 1 (compilado): a partir do .dpr (inclusive os itens "X in 'caminho'") e dos .dpk da pasta do
    módulo. Fase 2: demais fontes da pasta do módulo (mesmas sementes do PFC-44, para a pasta reproduzir o estudo).
    Diferente do PFC-44, inclui as units que o compilador importa implicitamente: units usadas por fontes compilados
    que não estão no contains de nenhum pacote nem no SearchPath (o Delphi as acha pelo Library Path). Elas são
    resolvidas por COMPLEMENTS, pela pasta do fonte que as usa, por arquivo único na pasta-raiz do fonte (ex.:
    CM/CMADMPREV) ou por arquivo único nas pastas dos pacotes próprios do programa.
    Retorna {"files", "compiled", "implicit": {rel: (unit, quem usa)}, "unresolved", "broken"}."""
    fmap = program_map(index, p, module_files)
    roots = tuple(sorted({c26.package_folder(i["dpk"]).lower() + "/" for i in p["closure"].values() if i["own"]}
                         | {posixpath.dirname(rel).lower() + "/" for rel, _ in p["exe_units"].values()}))
    by_name, by_name_all = {}, {}
    for low, rel in index.items():
        if low.endswith(".pas"):
            name = posixpath.basename(low)[:-4]
            by_name_all.setdefault(name, []).append(rel)
            if low.startswith(roots):
                by_name.setdefault(name, []).append(rel)
    modset = set(module_files)
    seen, queue, implicit, unresolved, broken = set(), [], {}, [], []

    def push(rel):
        if rel not in seen:
            seen.add(rel)
            queue.append(rel)

    def implicit_unit(src, unit):
        if unit in COMPLEMENTS:
            return index.get(COMPLEMENTS[unit][0].lower())
        same = index.get((posixpath.dirname(src) + "/" + unit + ".pas").lower())
        if same:
            return same
        top = top_folder(src)
        cands = [r for r in by_name_all.get(unit, []) if r.lower().startswith(top)]
        if len(cands) == 1:
            return cands[0]
        cands = by_name.get(unit, [])
        return cands[0] if len(cands) == 1 else None

    def drain():
        while queue:
            src = queue.pop()
            text = c26.read(src)
            if src.lower().endswith((".dpr", ".dpk")):
                base = posixpath.dirname(src)
                kw = "uses" if src.lower().endswith(".dpr") else "contains"
                for unit, path in c26.parse_units_clause(c26.clause(text, kw)):
                    if not path:
                        continue
                    rel = c26.resolve(index, base, path)
                    if rel:
                        if rel not in modset and rel != fmap.get(unit) and rel not in implicit:
                            implicit[rel] = (unit, src)  # caminho explícito no .dpr, fora do contains
                        push(rel)
                    elif unit in fmap:
                        broken.append((src, unit, path, fmap[unit]))
                    else:
                        unresolved.append((src, unit, path))
            for unit in c26.used_units(text):
                rel = fmap.get(unit)
                if not rel:
                    rel = implicit_unit(src, unit)
                    if rel and rel not in modset and rel not in implicit:
                        implicit[rel] = (unit, src)
                if rel:
                    push(rel)
                elif unit in own_names:
                    unresolved.append((src, unit, own_names[unit]))

    for rel in module_files:
        if rel.lower() == p["dpr"].lower() or rel.lower().endswith(".dpk"):
            push(rel)
    while True:
        drain()
        # pacote próprio sem nenhuma unit alcançada fica inteiro (o requires continua válido): as suas units
        # também precisam compilar.
        added = False
        for info in p["closure"].values():
            if not info["own"] or any(c26.in_folder(info["dpk"], f) for f in MODULE_FOLDERS):
                continue
            base = posixpath.dirname(info["dpk"])
            rels = [r for r in (c26.resolve(index, base, path) for _, path in info["contains"] if path) if r]
            if rels and not any(r in seen for r in rels):
                for r in rels:
                    push(r)
                added = True
        if not added:
            break
    compiled = set(seen)
    for rel in module_files:
        if rel.lower().endswith((".pas", ".dpr", ".dpk")):
            push(rel)
    drain()
    return {"files": {r for r in seen if r not in modset}, "compiled": compiled, "implicit": implicit,
            "unresolved": [u + (u[0] in compiled,) for u in unresolved],
            "broken": sorted(set(b for b in broken if b[0] in compiled))}


def select():
    """Roda a análise PFC-44 no repositório e escolhe os arquivos da pasta NEXUS."""
    set_root(REPO)
    res, runs, units = ue.analyze()
    deps = ue.aggregate(res, runs, units)
    errors = ue.validate(deps, res["modules"])
    if errors:
        raise SystemExit("análise PFC-44 inválida:\n  " + "\n  ".join(errors))
    index = c26.build_path_index()
    module_files = {f: tracked_files(f + "/") for f in MODULE_FOLDERS}
    closure, implicit, unresolved, broken = set(), {}, [], []
    per_prog = {}
    for p in res["programs"]:
        cc = compile_closure(index, p, module_files[p["folder"]], OWN_NAMES)
        per_prog[p["key"]] = cc
        closure |= cc["files"]
        for rel, v in cc["implicit"].items():
            implicit.setdefault(rel, v)
        unresolved += [(p["nome"],) + u for u in cc["unresolved"]]
        broken += [(p["nome"],) + b for b in cc["broken"]]
    by_label = {d["label"]: d for d in deps}

    def in_module(rel):
        return any(c26.in_folder(rel, f) for f in MODULE_FOLDERS)

    files = {}  # rel -> (dependência, papel)
    for f in MODULE_FOLDERS:
        for rel in module_files[f]:
            files[rel] = (f, "módulo")
    groups, dpk_edits = [], {}
    for g in res["deps"]:
        lbl = g["name"] if g["kind"] == "pkg" else g["folder"]
        if in_module(g["dpk"] or g["folder"] + "/"):
            continue  # pacote dentro da pasta FOLHA (CMFBCOMUM50, CMFBOBJ50, CMFolhaObjMT): já copiado
        info = {"label": lbl, "kind": g["kind"], "folder": g["folder"], "users": g["users"], "dpk": g["dpk"],
                "kept": [], "dropped": [], "implicit": [], "dep": by_label.get(lbl)}
        if g["kind"] == "pkg":
            base = posixpath.dirname(g["dpk"])
            requires, contains = c26.parse_dpk(g["dpk"])
            for unit, path in contains:
                rel = c26.resolve(index, base, path) if path else None
                (info["kept"] if rel and rel in closure else info["dropped"]).append((unit, rel or path))
            if info["dropped"]:
                dpk_edits[g["dpk"]] = {u for u, _ in info["kept"]}
            files[g["dpk"]] = (lbl, "pacote (.dpk)")
            for extra in resources(index, g["dpk"]) + [c26.sibling(index, g["dpk"], e) for e in (".dof", ".cfg")]:
                if extra and not in_module(extra):
                    files.setdefault(extra, (lbl, "recurso do pacote"))
        else:
            for rel in g["candidates"]:
                if rel.lower().endswith(".pas"):
                    unit = posixpath.splitext(posixpath.basename(rel))[0]
                    (info["kept"] if rel in closure else info["dropped"]).append((unit, rel))
        groups.append(info)
    owner = {}
    for info in groups:
        for _, rel in info["kept"]:
            if rel and rel.lower().endswith(".pas"):
                owner[rel] = (info["label"], "unit")
    folders = sorted((((c26.package_folder(i["dpk"]) if i["dpk"] else i["folder"]).lower() + "/", i)
                      for i in groups), key=lambda x: x[0])
    complements = []
    for rel in sorted(closure):
        if rel in owner or in_module(rel):
            continue
        unit, src = implicit.get(rel, (posixpath.splitext(posixpath.basename(rel))[0], "?"))
        home = [i for i in groups if unit.lower() in {u for u, _ in i["kept"] + i["dropped"]}]
        home = home or [i for f, i in folders if rel.lower().startswith(f)]
        label = home[-1]["label"] if home else "Complemento (Library Path)"
        if home:
            home[-1]["implicit"].append((unit, rel))
        why = COMPLEMENTS.get(unit.lower(), (None, ""))[1]
        complements.append({"unit": unit, "path": rel, "src": src, "label": label, "why": why})
        owner[rel] = (label, "unit importada implicitamente (fora do contains/SearchPath)")
    for rel, (lbl, role) in owner.items():
        files[rel] = (lbl, role)
        dfm = c26.sibling(index, rel, ".dfm")
        if dfm:
            files.setdefault(dfm, (lbl, "formulário (.dfm)"))
        for extra in resources(index, rel):
            if not in_module(extra):
                files.setdefault(extra, (lbl, "recurso da unit"))
    return {"res": res, "runs": runs, "deps": deps, "groups": groups, "files": files, "dpk_edits": dpk_edits,
            "complements": complements, "closure": per_prog, "unresolved": unresolved, "broken": broken,
            "module_files": module_files}


# ── Escrita da pasta ─────────────────────────────────────────────────────────────────────────────

def trim_contains(text, keep, removed):
    """Reescreve a cláusula contains de um .dpk mantendo só as units de `keep` (formatação original)."""
    m = re.search(r"^\s*contains\b", text, re.I | re.M)
    if not m:
        raise SystemExit("contains não encontrado")
    start = m.end()
    end = text.index(";", start)  # comentários de item ({frmX: TForm}) não contêm ';' (conferido abaixo)
    nl = "\r\n" if "\r\n" in text else "\n"
    items = [p for p in text[start:end].split(",")]
    kept = []
    for raw in items:
        mm = re.match(r"\s*([\w.]+)", raw)
        if mm and mm.group(1).lower() in keep:
            kept.append(raw.strip())
    # comentário na própria linha do contains: o arquivo não ganha linha nova
    note = f" {PFC75_MARK}; {removed} unit(s) não alcançada(s) removida(s) — ver Migração NEXUS/{INVENTORY} }}"
    out = text[:start] + note + nl + ("," + nl).join("  " + k for k in kept) + text[end:]
    got = {u for u, _ in c26.parse_units_clause(c26.clause(out, "contains"))}
    if got != keep:
        raise SystemExit(f"contains reescrito diverge: {sorted(got ^ keep)}")
    return out


def filter_bpg(text, present):
    """Mantém num .bpg só os projetos cujo fonte existe na pasta."""
    rules = dict((t.lower(), src) for t, src in re.findall(r"^(\S+\.(?:bpl|exe|dll)):\s*(\S+)\s*$", text, re.I | re.M))
    nl = "\r\n" if "\r\n" in text else "\n"
    m = re.search(r"^PROJECTS\s*=.*?(?<!\\)$(?:" + re.escape(nl) + r")?", text, re.M | re.S)
    order = m.group(0).split("=", 1)[1].replace("\\", " ").split()  # ordem original de PROJECTS
    keep = [t for t in order if rules.get(t.lower(), "").replace("\\", "/").lower() in present]
    lines, cur = [], "PROJECTS ="
    for t in keep:
        if len(cur) + len(t) + 1 > 76:
            lines.append(cur + " \\")
            cur = " "
        cur += " " + t
    lines.append(cur)
    out = text[:m.start()] + nl.join(lines) + nl + text[m.end():]
    keepl = {t.lower() for t in keep}
    blocks = re.split(r"(?=^\S+\.(?:bpl|exe|dll):)", out, flags=re.I | re.M)
    out = "".join(b for b in blocks
                  if not re.match(r"^(\S+\.(?:bpl|exe|dll)):", b, re.I) or
                  re.match(r"^(\S+):", b).group(1).lower() in keepl)
    removed = sorted(t for t in rules if t not in keepl)
    return out, keep, removed


def write_folder(sel):
    dest = REPO / NEXUS
    if dest.exists():
        shutil.rmtree(dest)
    for rel in sorted(sel["files"]):
        target = dest / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(REPO / rel, target)
    for dpk, keep in sel["dpk_edits"].items():
        raw = (REPO / dpk).read_bytes().decode("cp1252")
        _, contains = c26.parse_dpk(dpk)
        out = trim_contains(raw, keep, len(contains) - len(keep))
        (dest / dpk).write_bytes(out.encode("cp1252"))
    present = {rel.lower() for rel in sel["files"]}
    bpgs = {}
    for bpg in TOP_BPG:
        raw = (REPO / bpg).read_bytes().decode("cp1252")
        out, keep, removed = filter_bpg(raw, present)
        (dest / bpg).write_bytes(out.encode("cp1252"))
        bpgs[bpg] = (keep, removed)
    return bpgs


# ── Contagem física e validação sobre a pasta ────────────────────────────────────────────────────

def nexus_analysis():
    """Roda PFC-26 + PFC-44 com a raiz na pasta NEXUS. Pacotes de terceiros não são copiados (são pré-requisito
    do ambiente Delphi 5), mas os seus .dpk participam do fechamento de requires — ex.: ip50_d5 (InfoPower)
    requer CmSql50 —, então os manifestos de terceiros são lidos do repositório."""
    set_root(REPO)
    third = {n: rel for n, rel in c26.all_dpks(c26.build_path_index()).items() if n not in OWN_PACKAGES}
    orig_all, orig_parse = c26.all_dpks, c26.parse_dpk

    def all_dpks(index):
        found = orig_all(index)
        for n, rel in third.items():
            found.setdefault(n, rel)
        return found

    def parse_dpk(rel):
        if (c26.ROOT / rel).is_file():
            return orig_parse(rel)
        text = (REPO / rel).read_text(encoding="cp1252", errors="replace")
        requires = [n for n, _ in c26.parse_units_clause(c26.clause(text, "requires"))]
        return requires, c26.parse_units_clause(c26.clause(text, "contains"))

    set_root(REPO / NEXUS)
    c26.all_dpks, c26.parse_dpk = all_dpks, parse_dpk
    try:
        res, runs, units = ue.analyze()
        deps = ue.aggregate(res, runs, units)
    finally:
        c26.all_dpks, c26.parse_dpk = orig_all, orig_parse
        set_root(REPO)
    return res, runs, deps


def own_unit_names(index, own_packages):
    """Nomes de units com fonte próprio no repositório inteiro: units dos pacotes próprios (grupos de build) e
    demais .pas fora das pastas de terceiros/Borland."""
    names = {}
    for dpk in own_packages.values():
        base = posixpath.dirname(dpk)
        for unit, path in c26.parse_dpk(dpk)[1]:
            rel = c26.resolve(index, base, path) if path else None
            if rel:
                names.setdefault(unit, rel)
    for low, rel in index.items():
        if low.endswith(".pas") and not low.startswith(c26.THIRD_PARTY_DIRS):
            names.setdefault(posixpath.basename(low)[:-4], rel)
    return names


def closure_check(sel, res_n, root):
    """AC2: o fechamento de compilação calculado dentro da pasta é o mesmo do repositório e nenhuma referência
    própria (uses/requires/contains/"in 'caminho'") de fonte compilado fica sem arquivo dentro da pasta."""
    set_root(root)
    try:
        index = c26.build_path_index()
        problems = []
        for p in res_n["programs"]:
            for name in p["missing"]:
                if name in OWN_PACKAGES:
                    problems.append(f"{p['nome']}: pacote próprio {name} (Packages=/requires) fora da pasta")
            for info in p["closure"].values():
                if not info["own"]:
                    continue
                base = posixpath.dirname(info["dpk"])
                for unit, path in info["contains"]:
                    if not (path and c26.resolve(index, base, path)):
                        problems.append(f"{p['nome']}: {info['dpk']} contains {unit} in '{path}' sem arquivo")
            mf = sorted(q.relative_to(root).as_posix() for q in (root / p["folder"]).rglob("*") if q.is_file())
            cc = compile_closure(index, p, mf, OWN_NAMES)
            ref = sel["closure"][p["key"]]
            if cc["files"] != ref["files"]:
                diff = sorted(cc["files"] ^ ref["files"])
                problems.append(f"{p['nome']}: fechamento de compilação diferente do repositório: {diff[:10]}")
            for src, unit, target, compiled in cc["unresolved"]:
                if compiled:
                    problems.append(f"{p['nome']}: {src} uses {unit} → {target} (fora da pasta)")
            if sorted(set(cc["unresolved"])) != sorted(set(ref["unresolved"])):
                problems.append(f"{p['nome']}: referências sem arquivo diferentes do repositório")
            if cc["broken"] != ref["broken"]:
                problems.append(f"{p['nome']}: caminhos do .dpr diferentes do repositório")
        return sorted(set(problems))
    finally:
        set_root(REPO)


OWN_NAMES, OWN_PACKAGES = {}, {}


def validate_folder(sel, res_n, runs_n, deps_n):
    errors = []
    root = REPO / NEXUS
    top = sorted(p.name for p in root.iterdir() if p.is_dir())
    expected_top = sorted({rel.split("/")[0] for rel in sel["files"]})
    if top != expected_top:
        errors.append(f"pastas na raiz {top} != {expected_top}")
    for f in MODULE_FOLDERS:
        if f not in top:
            errors.append(f"pasta de módulo {f} ausente")
    for rel, (lbl, _) in sel["files"].items():
        top = rel.split("/")[0]
        if (top in MODULE_FOLDERS) != (lbl in MODULE_FOLDERS):
            errors.append(f"{rel}: arquivo de {lbl} na pasta {top}")
    for f in EXCLUDED_EXAMPLES:
        if (root / f).exists():
            errors.append(f"pasta de módulo fora do escopo presente: {f}")
    # AC4: estrutura dos módulos idêntica (todos os arquivos versionados, byte a byte)
    for f in MODULE_FOLDERS:
        src = tracked_files(f + "/")
        got = sorted(p.relative_to(root).as_posix() for p in (root / f).rglob("*") if p.is_file())
        if src != got:
            errors.append(f"{f}: arquivos diferentes da origem ({len(src)} × {len(got)})")
        for rel in src:
            if (root / rel).is_file() and (REPO / rel).read_bytes() != (root / rel).read_bytes():
                errors.append(f"{rel}: conteúdo alterado")
    for rel in sel["files"]:
        if not (root / rel).is_file():
            errors.append(f"{rel}: ausente na pasta")
            continue
        if rel in sel["dpk_edits"]:
            continue
        if (REPO / rel).read_bytes() != (root / rel).read_bytes():
            errors.append(f"{rel}: conteúdo alterado")
    for bpg in TOP_BPG:
        if not (root / bpg).is_file():
            errors.append(f"grupo de build {bpg} ausente")
    # AC2: mesmo fechamento e nada fora da pasta
    res_o = sel["res"]
    for po, pn in zip(res_o["programs"], res_n["programs"]):
        if set(po["closure"]) != set(pn["closure"]):
            errors.append(f"{po['nome']}: fechamento de pacotes diferente: {sorted(set(po['closure']) ^ set(pn['closure']))}")
        eo = {u: r for u, (r, _) in po["exe_units"].items()}
        en = {u: r for u, (r, _) in pn["exe_units"].items()}
        if eo != en:
            errors.append(f"{po['nome']}: units do .exe diferentes: {sorted(set(eo.items()) ^ set(en.items()))}")
        ro, rn = sel["runs"][po["key"]].reachable, runs_n[po["key"]].reachable
        if ro != rn:
            errors.append(f"{po['nome']}: units alcançáveis diferentes ({len(ro)} × {len(rn)})")
    errors += closure_check(sel, res_n, root)
    # AC3: linhas efetivas recalculadas sobre a pasta = PFC-44, arquivo a arquivo. Única diferença admitida: as
    # linhas dos itens retirados do contains dos .dpk reduzidos (referências a units não alcançáveis).
    if len(deps_n) != EXPECTED["deps"]:
        errors.append(f"esperadas {EXPECTED['deps']} dependências; encontradas {len(deps_n)}")

    def per_file(deps):
        return {f["path"]: (f["eff"], f["total"], f["code"]) for d in deps for f in d["files"]}
    fo, fn = per_file(sel["deps"]), per_file(deps_n)
    delta = {k: [0, 0] for k in ue.KEYS + ["all"]}
    phys_delta = [0, 0]
    for path in sorted(set(fo) | set(fn)):
        eo, en = fo.get(path, ({}, 0, 0)), fn.get(path, ({}, 0, 0))
        if path in sel["dpk_edits"]:
            phys_delta[0] += eo[1] - en[1]
            phys_delta[1] += eo[2] - en[2]
            for k in delta:
                a_, b_ = eo[0].get(k, [0, 0]), en[0].get(k, [0, 0])
                delta[k][0] += a_[0] - b_[0]
                delta[k][1] += a_[1] - b_[1]
        elif eo[0] != en[0]:
            errors.append(f"{path}: linhas efetivas na pasta {en[0]} != PFC-44 {eo[0]}")
    eff = [sum(d["eff"]["all"][i] for d in deps_n) + delta["all"][i] for i in (0, 1)]
    if eff != [EXPECTED["eff_total"], EXPECTED["eff_code"]]:
        errors.append(f"linhas efetivas na pasta + .dpk reduzidos {eff} != PFC-44 "
                      f"{[EXPECTED['eff_total'], EXPECTED['eff_code']]}")
    for k, v in EXPECTED["per_module"].items():
        got = sum(d["eff"][k][0] for d in deps_n) + delta[k][0]
        if got != v:
            errors.append(f"linhas efetivas {k} na pasta + .dpk reduzidos {got} != {v}")
    sel["dpk_delta"], sel["dpk_phys_delta"] = delta, phys_delta
    mods_o = [ue.c26.totals(m["files"]) for m in res_o["modules"]]
    mods_n = [ue.c26.totals(m["files"]) for m in res_n["modules"]]
    if mods_o != mods_n:
        errors.append("linhas dos módulos na pasta diferentes do PFC-26")
    return errors


# ── Inventário (AC5) ─────────────────────────────────────────────────────────────────────────────

def fmt(n):
    return c18.fmt(n)


def pct(a, b):
    return ue.pct(a, b)


def physical(files):
    """Linhas físicas (regras PFC-18) de arquivos .pas/.dfm/.dpk/.dpr; arquivos não contáveis ficam com 0."""
    t = c = n = 0
    for rel in files:
        if posixpath.splitext(rel)[1].lower() not in (".pas", ".dfm", ".dpk", ".dpr") or not (c26.ROOT / rel).is_file():
            continue
        rec, reason = c26.count_file(rel)
        if rec:
            t, c, n = t + rec["total"], c + rec["code"], n + 1
    return t, c, n


def render_inventory(sel, res_n, bpgs):
    root = REPO / NEXUS
    orig = {d["label"]: d for d in sel["deps"]}
    by_label = {}
    for rel, (lbl, _) in sel["files"].items():
        by_label.setdefault(lbl, []).append(rel)
    set_root(root)
    try:
        mods = {m["key"]: c26.totals(m["files"]) for m in res_n["modules"]}
        phys = {lbl: physical(files) for lbl, files in by_label.items()}
    finally:
        set_root(REPO)
    comp_lbl = "Complemento (Library Path)"
    delta, pdelta = sel["dpk_delta"], sel["dpk_phys_delta"]
    L = []
    a = L.append
    a("# Migração NEXUS — inventário (PFC-75)")
    a("")
    a("> PFC-75 · Gerado por `docs/tools/migracao_nexus.py --write` — não editar manualmente.")
    a("> Conferência: `python3 -B docs/tools/migracao_nexus.py --check`.")
    a("> Base: estudo PFC-44 (`Analise_linhas_dependencias.md`, `docs/tools/uso_efetivo_dependencias.py`) sobre o")
    a("> fechamento de dependências do PFC-26 (`docs/tools/contagem_docs1.py`).")
    a("")
    a("Esta pasta isola o escopo da migração (.NET 10 + React 19 + Oracle 23ai): os três módulos previdenciários —")
    a("**BENEFICIOPREV**, **FOLHA** e **CONTRIBUICAOPREV** — e as 31 dependências necessárias para compilá-los e executá-los.")
    a("O restante do sistema CM Contabilidade fica fora. A raiz desta pasta faz o papel de `C:\\ProjetosCM5\\` (raiz dos")
    a("`SearchPath` dos `.dof`) e cada arquivo mantém o caminho que tem na raiz do repositório, por isso os caminhos relativos")
    a("dos `.dpr`/`.dpk` (`in '..\\..\\Cm\\...'`) e os grupos de build continuam válidos.")
    a("")
    a("## 1. Módulos")
    a("")
    a("| Módulo | Pasta | Programa (`.dpr`) | Arquivos copiados | Fontes contados (PFC-26) | Linhas totais | Linhas de código | Linhas efetivas das dependências (PFC-44) |")
    a("|---|---|---|---:|---:|---:|---:|---:|")
    for key, nome, folder, dpr, _ in c26.PROGRAMS[::-1]:
        t = mods[key]
        a(f"| {nome} | `{folder}/` | `{dpr}` | {fmt(len(sel['module_files'][folder]))} | {fmt(t['n'])} | "
          f"{fmt(t['total'])} | {fmt(t['code'])} | {fmt(EXPECTED['per_module'][key])} |")
    mt = sum(m["total"] for m in mods.values())
    mc = sum(m["code"] for m in mods.values())
    a(f"| **Total** | | | **{fmt(sum(len(v) for v in sel['module_files'].values()))}** | "
      f"**{fmt(sum(m['n'] for m in mods.values()))}** | **{fmt(mt)}** | **{fmt(mc)}** | "
      f"**{fmt(EXPECTED['eff_total'])}** (cada linha uma vez) |")
    a("")
    a("Cada pasta de módulo é cópia integral dos arquivos versionados (`Fontes`, `CtrlObjects`, `DBObjects`, `Relatorios`,")
    a("`.dpr`, `.dof`, `.cfg`, `.res`, `.bpg` ...), byte a byte. Os pacotes `CMFBCOMUM50`, `CMFBOBJ50` e `CMFolhaObjMT`")
    a("ficam dentro de `FOLHA/` e vêm junto com o módulo.")
    a("")
    a("### 1.1 Pastas na raiz")
    a("")
    a("Só três pastas são módulos. As demais existem apenas para manter o caminho original dos arquivos das dependências")
    a("(os `.dpk`/`.dpr` os citam por caminho relativo) e contêm somente esses arquivos — nenhuma é um módulo completo.")
    a("")
    a("| Pasta | Papel | Arquivos | Dependências |")
    a("|---|---|---:|---|")
    tops = {}
    for rel, (lbl, _) in sel["files"].items():
        t = tops.setdefault(rel.split("/")[0], [0, set()])
        t[0] += 1
        t[1].add(lbl)
    for top in sorted(tops, key=lambda x: (x not in MODULE_FOLDERS, x.lower())):
        n, lbls = tops[top]
        if top in MODULE_FOLDERS:
            a(f"| `{top}/` | **módulo** | {fmt(n)} | — |")
        else:
            a(f"| `{top}/` | dependência | {fmt(n)} | {', '.join(f'`{x}`' for x in sorted(lbls, key=str.lower))} |")
    a("")
    a("## 2. Dependências incluídas (31)")
    a("")
    a("* **Units copiadas** — units do `contains` (ou do `.exe`) alcançadas pelo fechamento de compilação dos três programas;")
    a("  **implícitas** — units fora do `contains` que o compilador importa por estarem no `uses` de uma unit copiada;")
    a("  **removidas** — units do `contains` que nenhum dos três programas alcança.")
    a("* **Linhas físicas** — arquivos `.pas`/`.dfm`/`.dpk` copiados, inteiros (regras de contagem do PFC-18).")
    a("* **Linhas efetivas** — rotinas, classes e units realmente referenciadas pelos módulos (PFC-44); conferidas arquivo a")
    a("  arquivo com a análise refeita sobre esta pasta.")
    a("")
    a("| # | Dependência | Pasta | Usado por | Units copiadas | Implícitas | Removidas | Linhas totais (PFC-26) | Linhas físicas copiadas | Efetivas CONTRIBUIÇÃO | Efetivas FOLHA | Efetivas BENEFICIOPREV | Efetivas (3 módulos) | Código efetivo (3 módulos) |")
    a("|---:|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    tot = dict.fromkeys(("kept", "imp", "dropped", "total", "phys", "pcode", "c", "f", "b", "all", "code"), 0)
    for i, g in enumerate(sel["groups"], 1):
        d = orig[g["label"]]
        ph = phys.get(g["label"], (0, 0, 0))
        vals = {"kept": len(g["kept"]), "imp": len(g["implicit"]), "dropped": len(g["dropped"]), "total": d["total"],
                "phys": ph[0], "pcode": ph[1], "c": d["eff"]["contribuicao"][0], "f": d["eff"]["folha"][0],
                "b": d["eff"]["beneficioprev"][0], "all": d["eff"]["all"][0], "code": d["eff"]["all"][1]}
        for k, v in vals.items():
            tot[k] += v

        def cell(k, nome):
            return fmt(vals[k]) if nome in g["users"] else "—"
        a(f"| {i} | `{g['label']}` | `{g['folder']}/` | {', '.join(g['users'])} | {fmt(vals['kept'])} | {fmt(vals['imp'])} | "
          f"{fmt(vals['dropped'])} | {fmt(vals['total'])} | {fmt(vals['phys'])} | {cell('c', 'CONTRIBUIÇÃO')} | "
          f"{cell('f', 'FOLHA')} | {cell('b', 'BENEFICIOPREV')} | {fmt(vals['all'])} | {fmt(vals['code'])} |")
    a(f"| | **Total** | | | **{fmt(tot['kept'])}** | **{fmt(tot['imp'])}** | **{fmt(tot['dropped'])}** | "
      f"**{fmt(tot['total'])}** | **{fmt(tot['phys'])}** | **{fmt(tot['c'])}** | **{fmt(tot['f'])}** | **{fmt(tot['b'])}** | "
      f"**{fmt(tot['all'])}** | **{fmt(tot['code'])}** |")
    a("")
    a("## 3. Totais (AC3)")
    a("")
    cp = phys.get(comp_lbl, (0, 0, 0))
    a("| Recorte | Linhas totais | Linhas de código |")
    a("|---|---:|---:|")
    a(f"| Dependências compartilhadas inteiras no sistema (PFC-26) | {fmt(EXPECTED['total'])} | {fmt(EXPECTED['code'])} |")
    a(f"| Dependências copiadas para esta pasta (arquivos inteiros) | {fmt(tot['phys'])} | {fmt(tot['pcode'])} |")
    a(f"| **Dependências sob análise — uso efetivo (PFC-44)** | **{fmt(tot['all'])}** | **{fmt(tot['code'])}** |")
    a(f"| Removido do escopo (não utilizado pelos três módulos) | {fmt(EXPECTED['total'] - tot['all'])} | "
      f"{fmt(EXPECTED['code'] - tot['code'])} |")
    a(f"| Pastas dos três módulos (PFC-26) | {fmt(mt)} | {fmt(mc)} |")
    a(f"| **Total a migrar (módulos + dependências efetivas)** | **{fmt(mt + tot['all'])}** | **{fmt(mc + tot['code'])}** |")
    a(f"| Complemento fora das 31 dependências (seção 4, arquivos inteiros) | {fmt(cp[0])} | {fmt(cp[1])} |")
    a("")
    a(f"* As dependências sob análise caem de {fmt(EXPECTED['total'])} para **{fmt(tot['all'])} linhas** "
      f"({pct(tot['all'], EXPECTED['total'])}; {fmt(tot['code'])} de código): **{fmt(EXPECTED['total'] - tot['all'])} "
      f"linhas totais ({fmt(EXPECTED['code'] - tot['code'])} de código) ficam fora do escopo**.")
    a(f"* Fisicamente, {fmt(tot['dropped'])} units não alcançáveis não foram copiadas. Uma unit alcançável entra inteira,")
    a("  porque cortar rotinas dentro de um `.pas` quebraria a compilação; as rotinas sem uso dentro dela (diferença entre")
    a("  linhas físicas e efetivas) estão identificadas pelo PFC-44 e não precisam ser migradas.")
    a(f"* Efetivas por módulo: CONTRIBUIÇÃO {fmt(tot['c'])}; FOLHA {fmt(tot['f'])}; BENEFICIOPREV {fmt(tot['b'])}. A soma é maior")
    a("  que o total porque a maior parte das linhas é compartilhada; no total cada linha entra uma única vez.")
    a(f"* Refeita sobre esta pasta, a análise PFC-44 dá os mesmos números arquivo a arquivo; a única diferença são as "
      f"{fmt(delta['all'][0])} linhas ({fmt(delta['all'][1])} de código) dos itens retirados do `contains` dos `.dpk` "
      "reduzidos (seção 5), que só citavam units removidas.")
    a("")
    a("## 4. Units importadas implicitamente e complemento")
    a("")
    a("Units usadas por fontes compilados que não estão no `contains` de nenhum pacote nem no `SearchPath` do `.dof` (no")
    a("ambiente original o Delphi as acha pelo Library Path ou as importa implicitamente no pacote). Foram copiadas para")
    a("que nenhum `uses` compilado aponte para fora desta pasta. As que ficam fora das pastas das 31 dependências formam o")
    a("**complemento** (não entram nos totais do PFC-44).")
    a("")
    a("| Unit | Arquivo | Dependência | Usada por | Observação |")
    a("|---|---|---|---|---|")
    for c in sel["complements"]:
        a(f"| `{c['unit']}` | `{c['path']}` | {c['label']} | `{c['src']}` | {c['why'] or '—'} |")
    a("")
    a("## 5. Alterações em relação aos originais")
    a("")
    a("Todos os arquivos são cópias byte a byte, exceto:")
    a("")
    for g in sel["groups"]:
        if g["dpk"] in sel["dpk_edits"]:
            a(f"* `{g['dpk']}` — `contains` reduzido a {len(g['kept'])} de {len(g['kept']) + len(g['dropped'])} units "
              "(comentário PFC-75 no arquivo; `requires` inalterado).")
    for bpg, (keep, removed) in bpgs.items():
        a(f"* `{bpg}` — {len(keep)} projeto(s) mantido(s); retirado(s) por não ter(em) fonte na pasta: "
          + (", ".join(f"`{r}`" for r in removed) if removed else "nenhum") + ".")
    a("")
    a(f"Units removidas por pacote e todos os arquivos copiados (origem, dependência, papel): `{CSV_FILE}`.")
    a("")
    a("## 6. Observações herdadas do original (não alteradas)")
    a("")
    broken = sorted({(b[1], b[2], b[3], b[4]) for b in sel["broken"]})
    a(f"* {len(broken)} item(ns) `X in 'caminho'` dos `.dpr` apontam para arquivos que não existem já no repositório original;")
    a("  a unit é fornecida pelo pacote de runtime indicado e está na pasta:")
    a("")
    a("| Programa | Unit | Caminho no `.dpr` (inexistente) | Arquivo usado (pacote) |")
    a("|---|---|---|---|")
    for src, unit, path, rel in broken:
        a(f"| `{src}` | `{unit}` | `{path}` | `{rel}` |")
    a("")
    stray = sorted({(u[1], u[2], u[3]) for u in sel["unresolved"] if not u[-1]})
    if stray:
        a("* Fontes da pasta do módulo que não são compilados pelo `.dpr` e citam units de outros módulos (não copiadas):")
        for src, unit, target in stray:
            a(f"  `{src}` → `{unit}` (`{target}`).")
        a("")
    a("## 7. Fora da pasta")
    a("")
    a("* Todos os demais módulos e pacotes do sistema (ex.: `CONTAB`, `ORCAMENTO`, `EMPRESTIMO`, `INVESTIMENTOS`, `CFINAN`,")
    a("  `CPAGAR`, `CRECEBER`, `CADASTROPREV`, `IRRF` ...) e os demais grupos de build (`3-Sistemas.bpg`, `CapCar.bpg` ...).")
    a("* VCL/RTL da Borland e componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, TeeChart,")
    a("  Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL): pré-requisitos do ambiente Delphi 5, não código a")
    a("  migrar (mesmo recorte do PFC-26/PFC-44). Continuam citados em `Packages=`/`requires`.")
    a("* Packages/procedures Oracle (não são fonte Delphi).")
    a("")
    a("## 8. Limitações")
    a("")
    a("* A alcançabilidade é estática (cláusulas `uses`). Uma unit removida de um pacote cujo `initialization` registrasse")
    a("  classes usadas só por nome (`FindClass`/`GetClass`) não seria vista.")
    a("* Units implícitas com mais de um arquivo candidato no repositório foram escolhidas manualmente (seção 4, coluna")
    a("  Observação); as demais pela pasta do fonte que as usa.")
    a("")
    a("## 9. Como reproduzir")
    a("")
    a("```bash")
    a("python3 -B docs/tools/migracao_nexus.py --write   # recria esta pasta e valida")
    a("python3 -B docs/tools/migracao_nexus.py --check   # valida integridade, totais e este inventário")
    a("```")
    a("")
    return "\n".join(L)


def render_csv(sel):
    buf = io.StringIO()
    w = csv.writer(buf, lineterminator="\n")
    w.writerow(["situacao", "arquivo", "dependencia", "papel"])
    for rel in sorted(sel["files"], key=str.lower):
        lbl, role = sel["files"][rel]
        if rel in sel["dpk_edits"]:
            role += " — contains reduzido (PFC-75)"
        w.writerow(["copiado", rel, lbl, role])
    for g in sel["groups"]:
        for unit, rel in g["dropped"]:
            w.writerow(["removido (unit não alcançável)", rel, g["label"], "unit"])
    return buf.getvalue()


# ── main ─────────────────────────────────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    global OWN_NAMES, OWN_PACKAGES
    set_root(REPO)
    idx = c26.build_path_index()
    OWN_PACKAGES = c26.parse_build_groups(idx)
    OWN_NAMES = own_unit_names(idx, OWN_PACKAGES)
    sel = select()
    nfiles = len(sel["files"])
    print(f"arquivos selecionados: {nfiles}; dependências: {len(sel['groups'])} (+3 pacotes dentro de FOLHA); "
          f".dpk com contains reduzido: {len(sel['dpk_edits'])}")
    for g in sel["groups"]:
        print(f"  {g['label']:<26} units copiadas={len(g['kept']):>4} removidas={len(g['dropped']):>4}")
    if not (args.write or args.check):
        return 0
    if args.write:
        bpgs = write_folder(sel)
    else:
        if not (REPO / NEXUS).is_dir():
            print(f"pasta {NEXUS} ausente; rode --write")
            return 1
        bpgs = {}
        present = {rel.lower() for rel in sel["files"]}
        for bpg in TOP_BPG:
            _, keep, removed = filter_bpg((REPO / bpg).read_bytes().decode("cp1252"), present)
            bpgs[bpg] = (keep, removed)
    res_n, runs_n, deps_n = nexus_analysis()
    errors = validate_folder(sel, res_n, runs_n, deps_n)
    outputs = {INVENTORY: render_inventory(sel, res_n, bpgs), CSV_FILE: render_csv(sel)}
    for name, content in outputs.items():
        path = REPO / NEXUS / name
        if args.write:
            path.write_text(content, encoding="utf-8")
            print(f"escrito: {NEXUS}/{name}")
        elif not path.is_file() or path.read_text(encoding="utf-8") != content:
            errors.append(f"{NEXUS}/{name} desatualizado")
    eff = [sum(d["eff"]["all"][i] for d in deps_n) for i in (0, 1)]
    dd = sel.get("dpk_delta", {}).get("all", [0, 0])
    print(f"linhas efetivas das dependências na pasta: {eff[0]} totais / {eff[1]} de código "
          f"(+ {dd[0]} / {dd[1]} dos itens retirados do contains dos .dpk = {eff[0] + dd[0]} / {eff[1] + dd[1]})")
    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: 3 módulos íntegros; 31 dependências; nenhum uses/requires/contains próprio fora da pasta; "
          "linhas efetivas = PFC-44; inventário atualizado.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
