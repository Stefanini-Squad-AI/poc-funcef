#!/usr/bin/env python3
"""PFC-44 — Conferência da quantidade de linhas: uso efetivo de dependências compartilhadas.

Para cada uma das 31 dependências compartilhadas (PFC-26) e para cada módulo
(CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV), separa as linhas totais das linhas efetivamente
referenciadas por análise estática de cláusulas `uses` (fechamento transitivo a partir do
.dpr e das units do módulo). Gera:

  * `Analise_linhas_dependencias.md` (raiz do repositório) — o estudo.
  * seção "Uso efetivo de dependências (PFC-44)" em `docs1/visao-geral/inventario.html`.

Uso (a partir da raiz do repositório):
    python3 docs/tools/analise_linhas_dependencias.py            # imprime o resumo e valida
    python3 docs/tools/analise_linhas_dependencias.py --write    # (re)gera o .md e a seção HTML
    python3 docs/tools/analise_linhas_dependencias.py --check    # falha se os arquivos estiverem desatualizados

Reuso:
  * PFC-26 (contagem_docs1.py): estrutura consolidada (módulos, dependências, arquivos contados).
  * PFC-18 (contagem_delphi5.py): regras de contagem de linhas e helpers de formatação.
  * PFC-19 (loc_migravel.py): STD_UNITS (VCL/RTL) para filtrar units não-dependência.

Granularidade da análise: a UNIT Delphi (arquivo .pas). Uma dependência é composta de N units;
uma unit é "referenciada por um módulo" se aparece no fechamento transitivo das cláusulas `uses`
partindo do .dpr e das units do módulo. As linhas efetivas = soma das linhas das units
referenciadas (+ .dfm pareado + .dpk do pacote, se o módulo o requer). Isso respeita a regra da
issue (5 de 20 funções ⇒ fração das linhas, não o arquivo inteiro) na granularidade compilável.
"""
import argparse
import html
import os
import posixpath
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import contagem_docs1 as c26  # noqa: E402
import contagem_delphi5 as c18  # noqa: E402
import loc_migravel as c19  # noqa: E402

ROOT = c18.ROOT
MD_OUT = ROOT / "Analise_linhas_dependencias.md"
HTML_OUT = ROOT / "docs1/visao-geral/inventario.html"
HTML_BEGIN = "<!-- PFC-44:inicio — gerado por docs/tools/analise_linhas_dependencias.py; não editar manualmente -->"
HTML_END = "<!-- PFC-44:fim -->"
HTML_ANCHOR = '<section id="analista">'
MODULES = ["CONTRIBUIÇÃO", "FOLHA", "BENEFICIOPREV"]
BASELINE_TOTAL = 1632702
BASELINE_CODE = 1363291


# ── Migration readiness classification (AC5) ────────────────────────────────────
# Categoria -> (rótulo, descrição). Por dependência (name ou folder).
# equivalente  = equivalente direto na stack-alvo (biblioteca padrão .NET/Oracle)
# reimpl-net   = reimplementação em .NET 10 (regras de negócio / domínio / acesso a dados)
# reimpl-react = reimplementação em React 19 (UI: forms, dialogs, menus, relatórios)
# reimpl-oracle= reimplementação em Oracle 23ai (SQL/PL-SQL)
# reimpl-misto = reimplementação .NET 10 + React 19 (lógica + UI)
MIG_CATS = {
    "equivalente":  ("Equivalente direto", "Equivalente direto na stack-alvo (.NET 10 BCL / Oracle 23ai) — mapear a biblioteca, não reescrever"),
    "reimpl-net":   ("Reimplementação .NET 10", "Reimplementação em .NET 10 (regras de negócio / domínio / acesso a dados)"),
    "reimpl-react": ("Reimplementação React 19", "Reimplementação em React 19 (UI: forms, dialogs, menus, relatórios)"),
    "reimpl-oracle":("Reimplementação Oracle 23ai", "Reimplementação em Oracle 23ai (SQL/PL-SQL)"),
    "reimpl-misto": ("Reimplementação .NET 10 + React 19", "Reimplementação .NET 10 (lógica) + React 19 (UI)"),
}
# Chave = nome do pacote (pkg) ou pasta (exe). Justificativa curta.
MIG_CLASSIFICATION = {
    "CMAdd50":            ("equivalente",   "Zip/Unzip, RIPEMD, TWOFISH, serial port, tray icon → System.IO.Compression, System.Security.Cryptography, lib de serial/porta do .NET 10"),
    "CMAdmPrev":          ("reimpl-misto",  "Núcleo de administração previdenciária: forms de concessão, contribuição, reembolso + datamodules de negócio → lógica em .NET 10, telas em React 19"),
    "CmBack50":           ("reimpl-net",    "Backup/restore e sincronização (processo de backend, sem UI) → .NET 10 (serviço/hosted)"),
    "CMBussines50":       ("reimpl-net",    "Objetos de negócio genéricos (sem UI) → .NET 10 (camada de domínio)"),
    "CMCapCarObj50":      ("reimpl-net",    "Objetos de captação/carga (domínio, sem UI) → .NET 10"),
    "CmCapCarUtilObj50":  ("reimpl-misto",  "Utilitários de captação + forms de lançamento MT → lógica em .NET 10, telas em React 19"),
    "CMCfinanObj50":      ("reimpl-net",    "Objetos financeiros (domínio, sem UI) → .NET 10"),
    "CMCompo50":          ("reimpl-misto",  "Componentes CM compartilhados: base de dados, mensagens, procura, teclado + forms → lógica em .NET 10, UI em React 19"),
    "CMContabObj50":      ("reimpl-net",    "Objetos de contabilidade (domínio, sem UI) → .NET 10"),
    "CMCrypto":           ("equivalente",   "Criptografia própria (hash/cifra) → System.Security.Cryptography (.NET 10)"),
    "CMForms50":          ("reimpl-react",  "Framework de forms base: login, cadastro, procura, relatórios, menus → reescrito como design system React 19"),
    "CmGlobalObj50":      ("reimpl-net",    "Objetos globais / datamodule de configuração → .NET 10 (config/global state)"),
    "CMIntBancoMT50":     ("reimpl-net",    "Camada de integração com banco (MT) → .NET 10 (EF Core / ADO.NET + Oracle 23ai driver)"),
    "CMIntegraEP50":      ("reimpl-net",    "Integração de empréstimo (serviços, sem UI) → .NET 10 (integration services)"),
    "CMIRRFobj50":        ("reimpl-net",    "Cálculo de IRRF (regras tributárias, sem UI) → .NET 10 (motor de cálculo)"),
    "CMOld50":            ("reimpl-react",  "Componentes CM antigos (UI legada) → reescrita seletiva em React 19 ou descarte"),
    "CmParser50":         ("reimpl-net",    "Parser de expressões (motor, sem UI) → .NET 10 (parser/evaluator)"),
    "CMPlaneOrcObj50":    ("reimpl-net",    "Objetos de planejamento/orçamento (domínio, sem UI) → .NET 10"),
    "CMPrevMT50":         ("reimpl-misto",  "Previdência MT: objetos + forms multi-thread → lógica em .NET 10, UI em React 19"),
    "CMPrincipal50":      ("reimpl-react",  "Form principal / menu do sistema → shell React 19"),
    "CMRad50":            ("reimpl-misto",  "Framework RAD (UI dirigida a metadados) → motor de metadados em .NET 10 + UI dinâmica em React 19"),
    "CMRegra50":          ("reimpl-misto",  "Motor de regras + forms de parâmetros/passos → motor em .NET 10, telas de parâmetro em React 19"),
    "CMRegra50MT":        ("reimpl-misto",  "Motor de regras MT + forms → motor em .NET 10, UI em React 19"),
    "CmRelatsOld50":      ("reimpl-react",  "Relatórios antigos (UI de relatório) → React 19 + biblioteca de relatórios"),
    "CMResource50":       ("equivalente",   "Recursos (strings/imagens) → .resx/.NET 10 + i18n React 19 (mapeamento direto)"),
    "CmSql50":            ("reimpl-oracle", "Utilitários de SQL dinâmico → portar para PL/SQL/Oracle 23ai + Dapper/EF Core no .NET 10"),
    "CMTotalPrev50":      ("reimpl-net",    "Totalização de previdência (cálculo, sem UI) → .NET 10"),
    "CMWebComum50":       ("reimpl-misto",  "Camada comum do autoatendimento web (controle + forms web) → API .NET 10 + UI React 19"),
    "CM/CMADMPREV/Fontes":          ("reimpl-misto",  "Units de negócio/UI compiladas no .exe (contribuição, INSS) → lógica em .NET 10, telas em React 19"),
    "CM/CMADMPREV/Relatorios":      ("reimpl-react",  "Units de relatório compiladas no .exe → React 19 + biblioteca de relatórios"),
    "SHARED/Folhas":               ("reimpl-misto",  "Forms compartilhados de folha (geração de listas) → lógica em .NET 10, UI em React 19"),
    # Zero-line (dentro de FOLHA) — não entram nas 31, mas classificadas para referência.
    "CMFBCOMUM50":        ("reimpl-misto",  "Pacote comum da folha (fontes já contadas em FOLHA) → .NET 10 + React 19"),
    "CMFBOBJ50":          ("reimpl-net",    "Objetos da folha (fontes já contadas em FOLHA) → .NET 10"),
    "CMFolhaObjMT":       ("reimpl-net",    "Objetos MT da folha (fontes já contadas em FOLHA) → .NET 10"),
}


def fmt(n):
    return c18.fmt(n)


def esc(s):
    return html.escape(str(s))


# ── Unit-name resolution per module ─────────────────────────────────────────────

def module_own_pas(mod):
    return [f["path"] for f in mod["files"] if f["ext"] == ".pas"]


def module_dpr(prog):
    return prog["dpr"]


def build_resolver(prog, index):
    """Constrói um resolvedor de unit fiel ao Delphi para o programa:
    (1) unit fornecida por pacote próprio (cláusula contains) → source no pacote;
    (2) SearchPath do .dof (dpr_dir + SearchPath) — primeiro match vence;
    (3) fallback: arquivo único com o nome da unit nas pastas dos pacotes próprios.
    Tudo determinístico (sorted nos empates). Retorna (find, own_roots)."""
    provided = {}
    for pname, info in sorted(prog["closure"].items()):
        if not info["own"]:
            continue
        base = posixpath.dirname(info["dpk"])
        for unit, path in info["contains"]:
            rel = c26.resolve(index, base, path) if path else None
            if rel:
                provided.setdefault(unit, rel)
    search_dirs = prog["search"]
    own_roots = sorted({c26.package_folder(i["dpk"]).lower() + "/"
                        for i in prog["closure"].values() if i["own"]})

    def find(unit):
        if unit in provided:
            return provided[unit]
        for d in search_dirs:
            rel = c26.resolve(index, d, unit + ".pas")
            if rel:
                return rel
        name = "/" + unit + ".pas"
        cands = sorted(rel for low, rel in index.items()
                       if low.endswith(name) and low.startswith(tuple(own_roots)))
        if len(cands) == 1:
            return cands[0]
        return None

    return find, own_roots


def transitive_closure(seeds, find):
    """Fechamento transitivo de `uses` a partir dos arquivos semente (paths relativos).
    Retorna o conjunto de paths alcançáveis (inclui as sementes). Usa cache global de uses."""
    reachable = set()
    queue = []
    for s in seeds:
        if s and s not in reachable:
            reachable.add(s)
            queue.append(s)
    while queue:
        rel = queue.pop(0)
        for unit in uses_of(rel):
            if unit in c19.STD_UNITS:
                continue
            target = find(unit)
            if target and target not in reachable:
                reachable.add(target)
                queue.append(target)
    return reachable


_USES_CACHE = {}

def uses_of(rel):
    """Lista de units (lower) das cláusulas uses de um .pas/.dpr, com cache."""
    if rel in _USES_CACHE:
        return _USES_CACHE[rel]
    try:
        text = c26.read(rel)
    except Exception:
        _USES_CACHE[rel] = []
        return []
    units = c26.used_units(text)
    _USES_CACHE[rel] = units
    return units


# ── Effective-line computation ──────────────────────────────────────────────────

def dep_label(g):
    return g["name"] if g["kind"] == "pkg" else g["folder"]


def dep_files_by_ext(g):
    pas, dfm, dpk = [], [], []
    for f in g["files"]:
        if f["ext"] == ".pas":
            pas.append(f)
        elif f["ext"] == ".dfm":
            dfm.append(f)
        elif f["ext"] == ".dpk":
            dpk.append(f)
    return pas, dfm, dpk


def dfm_of(pas_path, dfm_files):
    stem = posixpath.splitext(pas_path)[0]
    d = stem + ".dfm"
    for f in dfm_files:
        if f["path"].lower() == d.lower():
            return f
    return None


def effective_for_dep(g, reachable, module_uses_dep):
    """Retorna (units_total, units_ref, eff_total, eff_code, ref_pas_paths)."""
    pas, dfm, dpk = dep_files_by_ext(g)
    units_total = len(pas)
    ref_pas = [f for f in pas if f["path"] in reachable]
    units_ref = len(ref_pas)
    eff_files = list(ref_pas)
    for f in ref_pas:
        d = dfm_of(f["path"], dfm)
        if d:
            eff_files.append(d)
    # .dpk do pacote: se o módulo requer o pacote, o descritor entra.
    if module_uses_dep:
        eff_files.extend(dpk)
    eff_total = sum(f["total"] for f in eff_files)
    eff_code = sum(f["code"] for f in eff_files)
    return units_total, units_ref, eff_total, eff_code, [f["path"] for f in ref_pas]


# ── Main analysis ───────────────────────────────────────────────────────────────

def analyze():
    res = c26.consolidate()
    programs = res["programs"]
    modules = res["modules"]
    deps = res["deps"]

    # Mapa nome do módulo -> (prog, mod)
    by_name = {}
    for p, m in zip(programs, modules):
        by_name[m["nome"]] = (p, m)

    # Índice global de caminhos (resolução Windows sem diferenciar maiúsculas).
    index = c26.build_path_index()

    # Para cada módulo: resolvedor fiel ao Delphi (contains + SearchPath) e
    # fechamento transitivo de uses a partir do .dpr + units do módulo.
    module_reach = {}
    for nome in MODULES:
        prog, mod = by_name[nome]
        own_pas = module_own_pas(mod)
        find, _own_roots = build_resolver(prog, index)
        seeds = [module_dpr(prog)] + own_pas
        module_reach[nome] = transitive_closure(seeds, find)

    # Por dependência x módulo.
    rows = []
    for g in deps:
        label = dep_label(g)
        pas, dfm, dpk = dep_files_by_ext(g)
        dep_total = sum(f["total"] for f in g["files"])
        dep_code = sum(f["code"] for f in g["files"])
        units_total = len(pas)
        per_module = {}
        ref_pas_union = set()
        for nome in MODULES:
            uses = nome in g["users"]
            ut, ur, et, ec, rp = effective_for_dep(g, module_reach[nome], uses)
            per_module[nome] = {"uses": uses, "units_total": ut, "units_ref": ur,
                                "eff_total": et, "eff_code": ec}
            if uses:
                ref_pas_union.update(rp)
        # Consolidado (contado uma vez): union de units referenciadas por qualquer módulo.
        eff_files_union = []
        for f in pas:
            if f["path"] in ref_pas_union:
                eff_files_union.append(f)
                d = dfm_of(f["path"], dfm)
                if d:
                    eff_files_union.append(d)
        if g["users"]:  # algum módulo usa -> .dpk entra
            eff_files_union.extend(dpk)
        eff_total_union = sum(f["total"] for f in eff_files_union)
        eff_code_union = sum(f["code"] for f in eff_files_union)
        units_ref_union = len(ref_pas_union)
        cat_key, cat_reason = MIG_CLASSIFICATION.get(label, ("reimpl-misto", "Dependência Delphi sem equivalente direto — reimplementação .NET 10 + React 19"))
        rows.append({
            "label": label, "name": g["name"], "folder": g["folder"], "kind": g["kind"],
            "users": g["users"], "n_files": len(g["files"]),
            "dep_total": dep_total, "dep_code": dep_code,
            "units_total": units_total, "per_module": per_module,
            "units_ref_union": units_ref_union,
            "eff_total_union": eff_total_union, "eff_code_union": eff_code_union,
            "cat_key": cat_key, "cat_reason": cat_reason,
        })
    return {"rows": rows, "module_reach": module_reach, "deps": deps}


def summarize(a):
    rows = a["rows"]
    # Por módulo: soma das linhas efetivas das deps que o módulo usa.
    per_module = {}
    for nome in MODULES:
        et = sum(r["per_module"][nome]["eff_total"] for r in rows if r["per_module"][nome]["uses"])
        ec = sum(r["per_module"][nome]["eff_code"] for r in rows if r["per_module"][nome]["uses"])
        # Total atual atribuído ao módulo (soma das deps que ele usa — shared deps contam em cada módulo)
        at = sum(r["dep_total"] for r in rows if r["per_module"][nome]["uses"])
        ac = sum(r["dep_code"] for r in rows if r["per_module"][nome]["uses"])
        per_module[nome] = {"eff_total": et, "eff_code": ec, "attr_total": at, "attr_code": ac,
                            "delta_total": at - et, "delta_code": ac - ec}
    # Consolidado (contado uma vez).
    eff_total = sum(r["eff_total_union"] for r in rows)
    eff_code = sum(r["eff_code_union"] for r in rows)
    delta_total = BASELINE_TOTAL - eff_total
    delta_code = BASELINE_CODE - eff_code
    # Por categoria de migração (sobre o efetivo consolidado).
    by_cat = {}
    for r in rows:
        if r["n_files"] == 0:
            continue  # zero-line deps (dentro de FOLHA) não contam nas 31
        c = r["cat_key"]
        by_cat.setdefault(c, {"eff_total": 0, "eff_code": 0, "n": 0})
        by_cat[c]["eff_total"] += r["eff_total_union"]
        by_cat[c]["eff_code"] += r["eff_code_union"]
        by_cat[c]["n"] += 1
    return {"per_module": per_module, "eff_total": eff_total, "eff_code": eff_code,
            "delta_total": delta_total, "delta_code": delta_code, "by_cat": by_cat}


# ── Markdown rendering ──────────────────────────────────────────────────────────

def md_table(headers, rows_md, aligns=None):
    if aligns is None:
        aligns = ["left"] + ["right"] * (len(headers) - 1)
    sep = {"left": ":---", "right": "---:", "center": ":---:"}
    lines = ["| " + " | ".join(headers) + " |",
             "| " + " | ".join(sep[a] for a in aligns) + " |"]
    for r in rows_md:
        lines.append("| " + " | ".join(r) + " |")
    return "\n".join(lines)


def render_md(a, s):
    rows = [r for r in a["rows"] if r["n_files"] > 0]  # as 31 com linhas
    zero_rows = [r for r in a["rows"] if r["n_files"] == 0]
    n_deps = len(rows)
    o = []
    o.append("# Análise de linhas efetivas de dependências compartilhadas — PFC-44")
    o.append("")
    o.append("> **PFC-44** · Conferência da quantidade de linhas de dependências dos módulos "
             "CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV.")
    o.append("> Gerado por `docs/tools/analise_linhas_dependencias.py` — não editar manualmente.")
    o.append("> Para regenerar: `python3 -B docs/tools/analise_linhas_dependencias.py --write`.")
    o.append("")
    o.append("---")
    o.append("")

    # 1. Resultado
    o.append("## 1. Resultado")
    o.append("")
    o.append("A cifra de **1.632.702 linhas totais / 1.363.291 linhas de código** de dependências "
             "compartilhadas (PFC-26) soma o conteúdo integral de cada arquivo de dependência. "
             "Esta análise mede, por análise estática de cláusulas `uses` (fechamento transitivo), "
             "quantas units de cada dependência os módulos **efetivamente referenciam** e quantas "
             "linhas isso representa — separando o uso real do volume total do arquivo.")
    o.append("")
    o.append("### 1.1 Total consolidado (dependências contadas uma única vez)")
    o.append("")
    o.append(md_table(
        ["Métrica", "Linhas totais", "Linhas de código"],
        [["Total atual (PFC-26, 31 dependências)", fmt(BASELINE_TOTAL), fmt(BASELINE_CODE)],
         ["Total efetivamente referenciado (união dos 3 módulos)", fmt(s["eff_total"]), fmt(s["eff_code"])],
         ["**Delta (linhas não efetivamente utilizadas)**", f"**{fmt(s['delta_total'])}**", f"**{fmt(s['delta_code'])}**"],
         ["% efetivo do total", f"{s['eff_total']/BASELINE_TOTAL*100:.1f}%", f"{s['eff_code']/BASELINE_CODE*100:.1f}%"]],
        ["left", "right", "right"]))
    o.append("")
    o.append(f"Conclusão: dos {fmt(BASELINE_TOTAL)} linhas totais de dependências, "
             f"**{fmt(s['eff_total'])}** ({s['eff_total']/BASELINE_TOTAL*100:.1f}%) são efetivamente "
             f"referenciadas por ao menos um dos três módulos; **{fmt(s['delta_total'])}** linhas "
             f"({s['delta_total']/BASELINE_TOTAL*100:.1f}%) não são referenciadas por nenhum módulo "
             f"em escopo. A cifra de 1,6 milhão **superestima** o volume real de dependência a migrar.")
    o.append("")

    # 1.2 Por módulo
    o.append("### 1.2 Por módulo")
    o.append("")
    o.append("Atribuição por módulo: para cada módulo, somam-se as linhas efetivas das dependências "
             "que ele utiliza. Dependências compartilhadas por mais de um módulo contribuem com suas "
             "linhas efetivas em cada módulo que as referencia (visão por módulo, não soma consolidada).")
    o.append("")
    md_rows = []
    for nome in MODULES:
        pm = s["per_module"][nome]
        md_rows.append([nome, fmt(pm["attr_total"]), fmt(pm["eff_total"]), fmt(pm["delta_total"]),
                        fmt(pm["attr_code"]), fmt(pm["eff_code"]), fmt(pm["delta_code"])])
    o.append(md_table(
        ["Módulo", "Total atual atribuído", "Efetivo (totais)", "Delta (totais)",
         "Total atual código", "Efetivo (código)", "Delta (código)"],
        md_rows))
    o.append("")
    o.append("> O “total atual atribuído” por módulo soma as dependências que o módulo usa; como há "
             "dependências compartilhadas, a soma dos totais atribuídos dos três módulos é maior que "
             f"{fmt(BASELINE_TOTAL)} (cada dependência é contada uma vez no consolidado, mas aparece em "
             "cada módulo que a usa). O consolidado (§1.1) é a base de comparação com o PFC-26.")
    o.append("")

    # 2. Tabela por dependência (AC1)
    o.append("## 2. Uso efetivo por dependência (AC1)")
    o.append("")
    o.append(f"Uma linha para cada uma das **{n_deps} dependências compartilhadas** com linhas listadas "
             f"em `docs1/visao-geral/inventario.html` (PFC-26). Colunas: dependência, linhas totais atuais, "
             "units existentes, units referenciadas e linhas efetivas por módulo.")
    o.append("")
    headers = ["Dependência", "Linhas totais atuais", "Units existentes",
               "Units ref. CONTRIBUIÇÃO", "Units ref. FOLHA", "Units ref. BENEFICIOPREV",
               "Linhas efetivas CONTRIBUIÇÃO", "Linhas efetivas FOLHA", "Linhas efetivas BENEFICIOPREV"]
    md_rows = []
    for r in rows:
        pm = r["per_module"]
        md_rows.append([
            f"`{r['label']}`", fmt(r["dep_total"]), fmt(r["units_total"]),
            fmt(pm["CONTRIBUIÇÃO"]["units_ref"]) if pm["CONTRIBUIÇÃO"]["uses"] else "—",
            fmt(pm["FOLHA"]["units_ref"]) if pm["FOLHA"]["uses"] else "—",
            fmt(pm["BENEFICIOPREV"]["units_ref"]) if pm["BENEFICIOPREV"]["uses"] else "—",
            fmt(pm["CONTRIBUIÇÃO"]["eff_total"]) if pm["CONTRIBUIÇÃO"]["uses"] else "—",
            fmt(pm["FOLHA"]["eff_total"]) if pm["FOLHA"]["uses"] else "—",
            fmt(pm["BENEFICIOPREV"]["eff_total"]) if pm["BENEFICIOPREV"]["uses"] else "—",
        ])
    # Total
    tot = ["**Total**", fmt(BASELINE_TOTAL), fmt(sum(r["units_total"] for r in rows))]
    for nome in MODULES:
        tot.append(fmt(sum(r["per_module"][nome]["units_ref"] for r in rows if r["per_module"][nome]["uses"])))
    for nome in MODULES:
        tot.append(fmt(sum(r["per_module"][nome]["eff_total"] for r in rows if r["per_module"][nome]["uses"])))
    md_rows.append(tot)
    o.append(md_table(headers, md_rows))
    o.append("")
    if zero_rows:
        o.append(f"Nota: {len(zero_rows)} pacote(s) listado(s) em PFC-26 com 0 linhas adicionais "
                 "(fontes já contadas dentro da pasta FOLHA): "
                 + ", ".join(f"`{r['label']}`" for r in zero_rows) + ". Não entram nas 31 dependências acima.")
        o.append("")

    # 2.1 Detalhe por dependência (consolidado + código)
    o.append("### 2.1 Detalhe consolidado (união dos 3 módulos) e linhas de código")
    o.append("")
    o.append(md_table(
        ["Dependência", "Linhas totais", "Linhas código", "Units exist.", "Units ref. (união)",
         "Efetivo total (união)", "Efetivo código (união)", "% efetivo (total)"],
        [[f"`{r['label']}`", fmt(r["dep_total"]), fmt(r["dep_code"]), fmt(r["units_total"]),
          fmt(r["units_ref_union"]), fmt(r["eff_total_union"]), fmt(r["eff_code_union"]),
          f"{r['eff_total_union']/r['dep_total']*100:.1f}%" if r["dep_total"] else "—"]
         for r in rows]))
    o.append("")

    # 3. Escopo
    o.append("## 3. Escopo")
    o.append("")
    o.append("- **Dependências:** as 31 dependências compartilhadas com linhas em `docs1/visao-geral/inventario.html` "
             "(PFC-26): 28 pacotes de runtime próprios (CM/FUNCEF) com linhas + 3 grupos de units compiladas no executável.")
    o.append("- **Módulos:** CONTRIBUIÇÃO (`CONTRIBUICAOPREV/`), FOLHA (`FOLHA/`), BENEFICIOPREV (`BENEFICIOPREV/`).")
    o.append("- **Recorte herdado do PFC-26/PFC-18:** contam-se apenas `.pas`, `.dfm`, `.dpr`, `.dpk`; "
             "ficam fora DFM binário, cópias/backups, duplicatas de conteúdo, `.dof`/`.cfg`/`.res`, "
             "VCL/RTL da Borland e componentes de terceiros (Developer Express, InfoPower, ReportBuilder, "
             "QuickReport, TeeChart, Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL) e "
             "packages/procedures do Oracle. A análise de uso efetivo respeita o mesmo recorte para ser comparável.")
    o.append("- **Baseline preservada:** os totais consolidados do PFC-26 (2.479.602 / 2.091.675 / 2.531 arquivos) "
             "não são alterados; esta análise é aditiva.")
    o.append("")

    # 4. Método (AC4)
    o.append("## 4. Método (AC4)")
    o.append("")
    o.append("A redução de linhas totais para linhas efetivas baseia-se em **evidência de uso real** "
             "(análise estática), não em estimativa visual:")
    o.append("")
    o.append("1. **Estrutura PFC-26:** `docs/tools/contagem_docs1.py` produz a lista de dependências, "
             "seus arquivos contados (com linhas totais/código) e o mapeamento “Usado por” (qual módulo usa cada dependência).")
    o.append("2. **Granularidade:** a unit Delphi (arquivo `.pas`) é a unidade de análise — é a granularidade "
             "compilável (uma unit é o que o `uses` referencia). O `.dfm` pareado (form de mesmo nome) acompanha "
             "a unit; o `.dpk` (descritor do pacote) acompanha o pacote quando o módulo o requer.")
    o.append("3. **Resolvedor fiel ao Delphi por módulo:** para cada módulo, a resolução de um nome de "
             "unit em `uses` segue a ordem do compilador: (a) unit fornecida por pacote próprio (cláusula "
             "`contains` do `.dpk` dos pacotes da lista `Packages=` do `.dof` + `requires` recursivo) → "
             "source da unit na pasta do pacote; (b) `SearchPath` do `.dof` (`C:\\ProjetosCM5\\` = raiz do "
             "repositório) — o primeiro match vence; (c) fallback determinístico quando há fonte única do "
             "nome nas pastas dos pacotes próprios. A escolha é determinística e estável entre execuções.")
    o.append("4. **Fechamento transitivo de `uses`:** a partir das sementes — o `.dpr` do módulo e todas as "
             "units `.pas` da pasta do módulo — percorre-se recursivamente as cláusulas `uses` (interface e "
             "implementation) de cada arquivo, resolvendo cada nome de unit com o resolvedor acima (entrando "
             "nas units das dependências). O conjunto alcançável é tudo que o módulo efetivamente referencia "
             "(direta ou indiretamente). Diretivas `{$IFDEF}`/`{$ENDIF}` são removidas junto dos comentários, "
             "de modo que **ambos os ramos condicionais entram** (superset conservador). Units da VCL/RTL "
             "(lista `STD_UNITS` do PFC-19) são desconsideradas.")
    o.append("5. **Units referenciadas por dependência×módulo:** para cada dependência, as units cujo `.pas` "
             "está no conjunto alcançável do módulo. As **linhas efetivas** = soma das linhas dessas units "
             "(+ `.dfm` pareado + `.dpk` do pacote se o módulo o requer).")
    o.append("6. **Consolidado (contado uma vez):** para cada dependência, a união das units referenciadas "
             "por qualquer dos três módulos. O total efetivo consolidado é comparado com 1.632.702 (totais) / "
             "1.363.291 (código); o delta = linhas não efetivamente utilizadas por nenhum módulo.")
    o.append("")
    o.append("**Regra de negócio (exemplo da issue):** um arquivo de dependência com 1.000 linhas e 20 funções, "
             "se apenas 5 funções são referenciadas, contribui com uma fração dessas linhas — não com as 1.000 "
             "inteiras. Aqui a granularidade é a unit (não a função individual): uma unit referenciada contribui "
             "com suas linhas inteiras; uma unit não referenciada não contribui. Isso é um **limite superior** "
             "do uso real (uma unit referenciada pode ter funções nem todas chamadas) e um **limite inferior** "
             "do volume total do arquivo — tornando o número defensável para a decisão de migração.")
    o.append("")

    # 5. Nota de prontidão para migração (AC5)
    o.append("## 5. Nota de prontidão para migração (AC5)")
    o.append("")
    o.append("Stack-alvo: **.NET 10 + React 19 + Oracle 23ai**. Para cada dependência, indica-se se as "
             "units efetivamente usadas têm equivalente direto na stack-alvo ou exigem reimplementação, "
             "com o total de linhas efetivas (consolidado, união dos 3 módulos) em cada categoria.")
    o.append("")
    cat_rows = []
    for cat_key in ["equivalente", "reimpl-net", "reimpl-react", "reimpl-oracle", "reimpl-misto"]:
        rot, desc = MIG_CATS[cat_key]
        c = s["by_cat"].get(cat_key, {"n": 0, "eff_total": 0, "eff_code": 0})
        cat_rows.append([f"**{rot}**", fmt(c["n"]), fmt(c["eff_total"]), fmt(c["eff_code"]), desc])
    tot_n = sum(s["by_cat"].get(k, {"n": 0})["n"] for k in MIG_CATS)
    tot_t = sum(s["by_cat"].get(k, {"eff_total": 0})["eff_total"] for k in MIG_CATS)
    tot_c = sum(s["by_cat"].get(k, {"eff_code": 0})["eff_code"] for k in MIG_CATS)
    cat_rows.append(["**Total**", fmt(tot_n), fmt(tot_t), fmt(tot_c), ""])
    o.append(md_table(
        ["Categoria", "Dependências", "Linhas efetivas (total)", "Linhas efetivas (código)", "Descrição"],
        cat_rows, ["left", "right", "right", "right", "left"]))
    o.append("")
    o.append("### 5.1 Classificação por dependência")
    o.append("")
    o.append(md_table(
        ["Dependência", "Categoria", "Linhas efetivas (total)", "Linhas efetivas (código)", "Justificativa"],
        [[f"`{r['label']}`", MIG_CATS[r["cat_key"]][0], fmt(r["eff_total_union"]),
          fmt(r["eff_code_union"]), r["cat_reason"]] for r in rows],
        ["left", "left", "right", "right", "left"]))
    o.append("")
    o.append("> A maior parte das linhas efetivas exige **reimplementação** (.NET 10 e/ou React 19): "
             "as dependências são código de negócio e UI próprios da FUNCEF, sem equivalente comercial direto. "
             "A categoria “Equivalente direto” (criptografia, zip, recursos) concentra o esforço de mapeamento "
             "— não de reescrita — e representa fração pequena do total.")
    o.append("")

    # 6. Limitações
    o.append("## 6. Limitações")
    o.append("")
    o.append("- **Granularidade unit, não função:** a análise identifica quais units (`.pas`) são referenciadas, "
             "não quais funções/procedures dentro de cada unit. Uma unit referenciada contribui com todas as suas "
             "linhas; o uso efetivo real (em nível de função) pode ser menor. Refinar para granularidade de função "
             "exigiria um analisador semântico de Pascal (resolução de escopo, sobrecarga, métodos de classe) — "
             "o ganho de precisão sobre o limite superior unit não justifica o risco de erro do analisador.")
    o.append("- **Resolução de nomes:** a resolução de `uses` segue a ordem do Delphi — units fornecidas "
             "por pacote próprio (cláusula `contains`), depois o `SearchPath` do `.dof` (`C:\\ProjetosCM5\\` = raiz), "
             "com fallback determinístico quando há fonte única nas pastas dos pacotes próprios. Nomes ambíguos "
             "(mesmo nome de unit em mais de uma pasta) são resolvidos pela ordem de SearchPath; a escolha é "
             "determinística e estável entre execuções.")
    o.append("- **Diretivas condicionais:** ambos os ramos de `{$IFDEF}`/`{$ENDIF}` entram no fechamento (superset). "
             "Em produção, só um ramo é compilado; o uso efetivo real pode ser ligeiramente menor.")
    o.append("- **Referência dinâmica:** units carregadas por nome em tempo de execução (RTTI, `RegisterClass`, "
             "fábricas) não aparecem em `uses` e não são capturadas. O RAD CM (`CMRad50`) e o motor de regras "
             "(`CMRegra50`) usam metadados; suas units de UI podem ser subcontadas.")
    o.append("- **Packages do Oracle:** ficam fora (não são fonte Delphi); sua reimplementação em Oracle 23ai é "
             "tratada à parte.")
    o.append("- O estudo reflete o estado do repositório no momento da execução; regenere com `--write` após mudanças.")
    o.append("")
    o.append("---")
    o.append("")
    o.append(f"*Gerado por `docs/tools/analise_linhas_dependencias.py` (PFC-44). "
             f"Baseline PFC-26: {fmt(BASELINE_TOTAL)} linhas totais / {fmt(BASELINE_CODE)} linhas de código em 31 dependências.*")
    return "\n".join(o) + "\n"


# ── HTML section rendering ──────────────────────────────────────────────────────

def html_table(headers, rows_html, aligns=None):
    if aligns is None:
        aligns = ["left"] + ["right"] * (len(headers) - 1)
    th = "".join(f"<th>{h}</th>" for h in headers)
    body = []
    for r in rows_html:
        body.append("<tr>" + "".join(f"<td>{c}</td>" for c in r) + "</tr>")
    return ('<div class="table-wrap"><table><thead><tr>' + th + '</tr></thead><tbody>'
            + "".join(body) + '</tbody></table></div>')


def render_html(a, s):
    rows = [r for r in a["rows"] if r["n_files"] > 0]
    o = [HTML_BEGIN,
         '<section id="uso-efetivo-dependencias"><div class="section-title">🎯 Uso efetivo de dependências (PFC-44)</div>']
    o.append('<div class="stats">'
             f'<div class="stat"><div class="n">{fmt(BASELINE_TOTAL)}</div><div class="l">Total atual de dependências (PFC-26)</div></div>'
             f'<div class="stat"><div class="n">{fmt(s["eff_total"])}</div><div class="l">Total efetivamente referenciado (união dos 3 módulos)</div></div>'
             f'<div class="stat"><div class="n">{fmt(s["delta_total"])}</div><div class="l">Delta — linhas não efetivamente utilizadas</div></div>'
             f'<div class="stat"><div class="n">{s["eff_total"]/BASELINE_TOTAL*100:.1f}%</div><div class="l">% efetivo do total</div></div>'
             '</div>')
    o.append('<p>Conferência da quantidade de linhas de dependências dos módulos CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV. '
             'O inventário PFC-26 soma o conteúdo integral de cada arquivo de dependência; esta seção mede, por análise '
             'estática de cláusulas <code>uses</code> (fechamento transitivo a partir do <code>.dpr</code> e das units de cada módulo), '
             'quantas units de cada dependência os módulos <strong>efetivamente referenciam</strong>. '
             f'Dos {fmt(BASELINE_TOTAL)} linhas totais, <strong>{fmt(s["eff_total"])}</strong> ({s["eff_total"]/BASELINE_TOTAL*100:.1f}%) '
             f'são referenciadas por ao menos um módulo; <strong>{fmt(s["delta_total"])}</strong> ({s["delta_total"]/BASELINE_TOTAL*100:.1f}%) '
             'não são referenciadas por nenhum módulo em escopo. <span class="ev ev-comprovado">COMPROVADO</span>: '
             'valores gerados por <code>docs/tools/analise_linhas_dependencias.py</code>. Estudo completo: '
             '<a href="../../Analise_linhas_dependencias.md"><code>Analise_linhas_dependencias.md</code></a>.</p>')

    # Por módulo
    o.append('<h3>Por módulo</h3>')
    o.append(html_table(
        ["Módulo", "Total atual atribuído", "Efetivo (totais)", "Delta (totais)", "Efetivo (código)", "Delta (código)"],
        [[esc(nome), fmt(s["per_module"][nome]["attr_total"]), fmt(s["per_module"][nome]["eff_total"]),
          fmt(s["per_module"][nome]["delta_total"]), fmt(s["per_module"][nome]["eff_code"]),
          fmt(s["per_module"][nome]["delta_code"])] for nome in MODULES]))
    o.append('<p class="desc">Dependências compartilhadas por mais de um módulo contribuem com suas linhas efetivas em cada módulo que as referencia (visão por módulo). O consolidado abaixo é a base de comparação com o PFC-26.</p>')

    # Tabela por dependência (AC1)
    o.append(f'<h3>Uso efetivo por dependência ({len(rows)} dependências com linhas)</h3>')
    o.append('<p>Uma linha por dependência compartilhada com linhas em PFC-26: linhas totais atuais, units existentes, '
             'units referenciadas e linhas efetivas por módulo. “—” indica que o módulo não usa a dependência.</p>')
    headers = ["Dependência", "Linhas totais", "Units exist.", "Un. CONTRIB", "Un. FOLHA", "Un. BENEF",
               "Efic. CONTRIB", "Efic. FOLHA", "Efic. BENEF"]
    body = []
    for r in rows:
        pm = r["per_module"]
        def cell(nome, key):
            return "—" if not pm[nome]["uses"] else fmt(pm[nome][key])
        body.append([f"<code>{esc(r['label'])}</code>", fmt(r["dep_total"]), fmt(r["units_total"]),
                     cell("CONTRIBUIÇÃO", "units_ref"), cell("FOLHA", "units_ref"), cell("BENEFICIOPREV", "units_ref"),
                     cell("CONTRIBUIÇÃO", "eff_total"), cell("FOLHA", "eff_total"), cell("BENEFICIOPREV", "eff_total")])
    # total
    tot = ["Total", fmt(BASELINE_TOTAL), fmt(sum(r["units_total"] for r in rows))]
    for nome in MODULES:
        tot.append(fmt(sum(r["per_module"][nome]["units_ref"] for r in rows if r["per_module"][nome]["uses"])))
    for nome in MODULES:
        tot.append(fmt(sum(r["per_module"][nome]["eff_total"] for r in rows if r["per_module"][nome]["uses"])))
    body.append([f"<strong>{c}</strong>" for c in tot])
    o.append(html_table(headers, body))

    # Prontidão migração (AC5)
    o.append('<h3>Prontidão para migração (.NET 10 + React 19 + Oracle 23ai)</h3>')
    o.append('<p>Por dependência, se as units efetivamente usadas têm equivalente direto na stack-alvo ou exigem '
             'reimplementação. Totais de linhas efetivas (consolidado) por categoria:</p>')
    cat_body = []
    for cat_key in ["equivalente", "reimpl-net", "reimpl-react", "reimpl-oracle", "reimpl-misto"]:
        rot, desc = MIG_CATS[cat_key]
        c = s["by_cat"].get(cat_key, {"n": 0, "eff_total": 0, "eff_code": 0})
        cat_body.append([f"<strong>{esc(rot)}</strong>", fmt(c["n"]), fmt(c["eff_total"]), fmt(c["eff_code"]), esc(desc)])
    tot_n = sum(s["by_cat"].get(k, {"n": 0})["n"] for k in MIG_CATS)
    tot_t = sum(s["by_cat"].get(k, {"eff_total": 0})["eff_total"] for k in MIG_CATS)
    tot_c = sum(s["by_cat"].get(k, {"eff_code": 0})["eff_code"] for k in MIG_CATS)
    cat_body.append([f"<strong>Total</strong>", f"<strong>{fmt(tot_n)}</strong>", f"<strong>{fmt(tot_t)}</strong>", f"<strong>{fmt(tot_c)}</strong>", ""])
    o.append(html_table(["Categoria", "Dependências", "Linhas efetivas (total)", "Linhas efetivas (código)", "Descrição"], cat_body))

    o.append('<div class="note"><strong>Método (AC4):</strong> análise estática do fechamento transitivo de cláusulas '
             '<code>uses</code> a partir do <code>.dpr</code> e das units de cada módulo, resolvendo nomes de unit no '
             'universo de dependências que o módulo usa (PFC-26). Granularidade = unit Delphi (<code>.pas</code>); o '
             '<code>.dfm</code> pareado e o <code>.dpk</code> do pacote acompanham a unit/pacote referenciados. Diretivas '
             '<code>{$IFDEF}</code> têm ambos os ramos incluídos (superset conservador); VCL/RTL desconsiderada. '
             'A granularidade unit é um limite superior do uso real em nível de função e um limite inferior do volume '
             'total do arquivo — número defensável para dimensionar a migração pelo código realmente utilizado.</div>')
    o.append('<p class="desc">Para recontar: <code>python3 docs/tools/analise_linhas_dependencias.py</code>. '
             'A seção PFC-26 acima não foi alterada; esta seção é aditiva.</p>')
    o.append('</section>')
    o.append(HTML_END)
    return "\n".join(o) + "\n"


# ── Apply to files ──────────────────────────────────────────────────────────────

def apply_md(current, fragment):
    return fragment


def apply_html(current, fragment):
    if HTML_BEGIN in current:
        start = current.index(HTML_BEGIN)
        end = current.index(HTML_END, start) + len(HTML_END) + 1
        return current[:start] + fragment + current[end:]
    if current.count(HTML_ANCHOR) != 1:
        raise SystemExit(f"âncora {HTML_ANCHOR!r} não encontrada de forma única em {HTML_OUT}")
    return current.replace(HTML_ANCHOR, fragment + HTML_ANCHOR)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    a = analyze()
    s = summarize(a)
    # Resumo no stdout
    print(f"Consolidado: efetivo total={fmt(s['eff_total'])}/{fmt(BASELINE_TOTAL)} "
          f"({s['eff_total']/BASELINE_TOTAL*100:.1f}%), delta={fmt(s['delta_total'])}")
    print(f"Consolidado: efetivo código={fmt(s['eff_code'])}/{fmt(BASELINE_CODE)} "
          f"({s['eff_code']/BASELINE_CODE*100:.1f}%), delta={fmt(s['delta_code'])}")
    for nome in MODULES:
        pm = s["per_module"][nome]
        print(f"  {nome}: efetivo total={fmt(pm['eff_total'])} (atribuido={fmt(pm['attr_total'])}, delta={fmt(pm['delta_total'])})")
    print("Por categoria (efetivo total / código):")
    for cat_key in ["equivalente", "reimpl-net", "reimpl-react", "reimpl-oracle", "reimpl-misto"]:
        c = s["by_cat"].get(cat_key, {"n": 0, "eff_total": 0, "eff_code": 0})
        print(f"  {MIG_CATS[cat_key][0]:32} n={c['n']:2}  total={fmt(c['eff_total']):>10}  codigo={fmt(c['eff_code']):>10}")

    stale = []
    md_fragment = render_md(a, s)
    if MD_OUT.exists():
        current_md = MD_OUT.read_text(encoding="utf-8")
    else:
        current_md = ""
    if md_fragment != current_md:
        if args.write:
            MD_OUT.write_text(md_fragment, encoding="utf-8")
            print(f"atualizado: {MD_OUT.relative_to(ROOT)}")
        else:
            stale.append(str(MD_OUT.relative_to(ROOT)))
    html_fragment = render_html(a, s)
    current_html = HTML_OUT.read_text(encoding="utf-8")
    updated_html = apply_html(current_html, html_fragment)
    if updated_html != current_html:
        if args.write:
            HTML_OUT.write_text(updated_html, encoding="utf-8")
            print(f"atualizado: {HTML_OUT.relative_to(ROOT)}")
        else:
            stale.append(str(HTML_OUT.relative_to(ROOT)))
    if args.check and stale:
        print("Arquivos desatualizados: " + ", ".join(stale))
        return 1
    print("OK" if not stale else "(stale, use --write)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
