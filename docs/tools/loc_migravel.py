#!/usr/bin/env python3
"""PFC-19 — Linha de Base de Código Migrável (LOC Migrável) dos módulos Empréstimo e Contabilidade.

Uso (a partir da raiz do repositório):
    python3 docs/tools/loc_migravel.py            # imprime o resumo e valida
    python3 docs/tools/loc_migravel.py --write    # (re)gera a seção nas páginas de módulo + planilha CSV
    python3 docs/tools/loc_migravel.py --check    # falha se as páginas estiverem desatualizadas

Reuso:
  * PFC-18 (contagem_delphi5.py): inventário de arquivos, contagem de linhas, exclusões.
  * PFC-8 (seções HTML "Inventário funcional"): lista de telas, relatórios e complexidade.
  * Análise de dependências: cláusulas uses (interface + implementation) dos .pas.

Categorias A–L (classificação de cada arquivo):
  A Forms/Telas  B Regras de negócio  C Acesso a dados  D DataModules
  E Integrações  F Compartilhados     G Utilitários      H Processos/Batches
  I Relatórios   J Fora do escopo     K Não utilizado/Órfão  L Indeterminado

Nove números A–I (resumo):
  A LOC total  B LOC telas  C Dependências  D Compartilhados  E Relatórios
  F Fora escopo  G Não utilizada  H Indeterminada  I LOC Migrável
"""
import argparse
import csv
import hashlib
import html
import io
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import contagem_delphi5 as c18

ROOT = c18.ROOT
MODULES = c18.MODULES
BEGIN = "<!-- PFC-19:inicio — gerado por docs/tools/loc_migravel.py; não editar manualmente -->"
END = "<!-- PFC-19:fim -->"
ANCHOR = c18.END  # PFC-18:fim — inserimos logo depois

CATEGORIES = [
    ("A", "Forms/Telas"),
    ("B", "Regras de negócio"),
    ("C", "Acesso a dados"),
    ("D", "DataModules"),
    ("E", "Integrações"),
    ("F", "Serviços/Componentes compartilhados"),
    ("G", "Utilitários"),
    ("H", "Processos/Batches"),
    ("I", "Relatórios"),
    ("J", "Fora do escopo"),
    ("K", "Não utilizado/Órfão"),
    ("L", "Indeterminado"),
]
CAT_LETTER = {name: letter for letter, name in CATEGORIES}
CAT_NAME = {letter: name for letter, name in CATEGORIES}
MIGRABLE_CATS = {"A", "B", "C", "D", "E", "F", "G", "H"}

EXTERNAL_DIRS = ("CMCONTABOBJ50", "GLOBALCM", "SHARED", "FUNCOESGERAIS", "CMGLOBALOBJ50",
                 "CMRELATORIOOBJ50", "CMIMOBILIARIOOBJ50", "CMCFINANOBJ50", "OBJRAD",
                 "CMRHOBJ50", "CMLIVROOBJ50", "CMIRRFOBJ50", "CMPLANEORCOBJ50",
                 "CMINDICADORESOBJ50", "CMCAPCAROBJ50", "CMMTSOBJRH", "CMCOMPORH",
                 "CMINTBANCOMT50", "CMCRYPTO", "FUNCEF", "GERAL", "MODBAS", "MODCON")


# ── PFC-8 inventory parsing (extract form names + block from HTML) ──────────────

def parse_pfc8_inventory(page_text):
    """Extrai do HTML o inventário PFC-8: form var name, dfm filename, bloco, processo, complexidade."""
    forms = {}
    blocks = [("telas", "telas-funcionais"), ("relatorios", "relatorios"),
              ("outros", "outros-arquivos")]
    for i, (block, block_id) in enumerate(blocks):
        start = page_text.find(f'id="{block_id}"')
        if start < 0:
            continue
        next_block_start = len(page_text)
        if i + 1 < len(blocks):
            nxt = page_text.find(f'id="{blocks[i+1][1]}"', start)
            if nxt > 0:
                next_block_start = nxt
        sec_end = page_text.find("</section>", start)
        if sec_end > 0:
            next_block_start = min(next_block_start, sec_end)
        section = page_text[start:next_block_start]
        for m in re.finditer(r"<tr>\s*<td>\s*<code>([^<]+)</code>\s*(?:<br>\s*<small>([^<]+)</small>)?", section):
            var_name = m.group(1).strip()
            dfm_file = (m.group(2) or "").strip()
            processo = ""
            pm = re.search(r"<td>([^<]+)</td>", section[m.end():m.end() + 600])
            if pm:
                processo = pm.group(1).strip()
            entry = {"var": var_name, "dfm": dfm_file, "block": block, "processo": processo}
            forms[var_name.lower()] = entry
            if dfm_file:
                dfm_stem = dfm_file.rsplit(".", 1)[0].lower()
                forms.setdefault(dfm_stem, entry)
    return forms


# ── Dependency analysis (parse uses clauses from .pas) ──────────────────────────

UNIT_RE = re.compile(r"^\s*unit\s+([\w.]+)\s*;", re.I | re.M)
IMPLEMENT_RE = re.compile(r"^implementation\b", re.I | re.M)
USES_KW_RE = re.compile(r"^\s*uses\s+(.*?);", re.I | re.S | re.M)
STD_UNITS = frozenset((
    "windows", "messages", "sysutils", "classes", "graphics", "controls", "forms",
    "dialogs", "stdctrls", "buttons", "extctrls", "comctrls", "db", "dbtables",
    "dbclient", "variants", "types", "math", "dateutils", "actnlist", "menus",
    "imglist", "comobj", "activex", "registry", "inifiles", "filectrl", "mask",
    "grids", "wwdbgrid", "wwquery", "wwtable", "wwdlg", "tb97", "tb97tlbr",
    "tb97tbc", "tb97cmbo", "ivdictio", "ivmulti", "ivemulti", "mahlpbtn",
    "qrintport", "quickrpt", "qrprnsu", "qrctrls", "ppprod", "pparchiv",
    "ppmodule", "ppclass", "ppbnd", "pprpt", "ppview", "ppdsgn", "ppclint",
    "ppdpo", "ppdevice", "ppdrwng", "ppchrt", "ppctrl", "ppcomm", "ppparams",
    "ppbarcod", "pprptexp", "pphtmlexp", "shellapi", "shlobj", "comserv",
    "midas", "sconnect", "objbrkr", "corbacon", "corbav40", "httpsrvr",
    "webbrok", "dispconn", "scktsrvr", "bde", "bdeconst", "swgraph",
    "oleconst", "checklst", "tabs", "outline", "diroutln", "mplayer",
    "graphutil", "chartfx", "teengine", "series", "teeprocs", "teechart",
    "chart", "vcl", "system", "system.classes", "system.sysutils",
    "system.math", "system.strutils", "system.dateutils", "system.types",
    "system.uitypes", "system.variants", "system.rtlconsts", "system.maskutils",
    "vcl.forms", "vcl.controls", "vcl.graphics", "vcl.dialogs", "vcl.stdctrls",
    "vcl.extctrls", "vcl.comctrls", "vcl.buttons", "vcl.grids", "vcl.db",
    "vcl.dbgrids", "vcl.dbedit", "data.win", "data.db", "data.ds", "data.sql",
    "vcl.threads", "system.threads", "winapi.windows", "winapi.messages",
    "winapi.shellapi", "winapi.shlobj", "const", "toolwin", "extactns",
    "actnman", "actnctrls", "xpman", "themes", "uxtheme", "flatpanel",
    "cport", "cportctl", "spin", "calendar", "placemnt", "presrvmnt",
    "system.contnrs", "system.generics.collections", "system.syncobjs",
    "system.io.utils", "system.hash", "vcl.imagelist", "vcl.actnlist",
    "vcl.menus", "vcl.imglist", "vcl.toolwin", "vcl.extactns", "vcl.themes",
    "vcl.xpman", "data.db.common", "webreq", "webdisp", "webcnst",
))


def strip_comments(text):
    """Remove comentários Pascal (//, { }, (* *)) mas preserva diretivas {$} e (*$)."""
    out = []
    i, n = 0, len(text)
    state = None
    while i < n:
        if state == "{":
            j = text.find("}", i)
            if j < 0:
                i = n
            else:
                out.append(" ")
                i = j + 1
                state = None
            continue
        if state == "(*":
            j = text.find("*)", i)
            if j < 0:
                i = n
            else:
                out.append(" ")
                i = j + 2
                state = None
            continue
        c = text[i]
        if c == "{":
            if text.startswith("{$", i):
                out.append(text[i:i + 2])
                i += 2
                j = text.find("}", i)
                if j < 0:
                    out.append(text[i:])
                    i = n
                else:
                    out.append(text[i:j + 1])
                    i = j + 1
            else:
                state = "{"
                i += 1
            continue
        if text.startswith("(*", i):
            if text.startswith("(*$", i):
                out.append(text[i:i + 3])
                i += 3
                j = text.find("*)", i)
                if j < 0:
                    out.append(text[i:])
                    i = n
                else:
                    out.append(text[i:j + 2])
                    i = j + 2
            else:
                state = "(*"
                i += 2
            continue
        if text.startswith("//", i):
            j = text.find("\n", i)
            if j < 0:
                i = n
            else:
                out.append(" ")
                i = j
            continue
        out.append(c)
        i += 1
    return "".join(out)


def parse_uses(text):
    """Retorna (unit_name, interface_uses, implementation_uses) de um fonte Pascal."""
    clean = strip_comments(text)
    m = UNIT_RE.search(clean)
    unit_name = m.group(1).lower() if m else ""
    impl_match = IMPLEMENT_RE.search(clean)
    impl_pos = impl_match.start() if impl_match else len(clean)
    iface_text = clean[:impl_pos]
    impl_text = clean[impl_pos:] if impl_match else ""
    iface_uses = set()
    impl_uses = set()
    for m in USES_KW_RE.finditer(iface_text):
        for u in m.group(1).split(","):
            u = u.strip().lower().split(".")[-1]
            if u and u not in STD_UNITS:
                iface_uses.add(u)
    for m in USES_KW_RE.finditer(impl_text):
        for u in m.group(1).split(","):
            u = u.strip().lower().split(".")[-1]
            if u and u not in STD_UNITS and u not in iface_uses:
                impl_uses.add(u)
    return unit_name, iface_uses, impl_uses


def build_unit_index(files):
    """Mapa unit_name.lower() -> path relativo, para resolver dependências."""
    index = {}
    for f in files:
        if f["ext"] == ".pas":
            stem = Path(f["path"]).stem.lower()
            index.setdefault(stem, f["path"])
    return index


def parse_all_uses(files):
    """Lê todos os .pas e retorna {path: (unit_name, iface_uses, impl_uses)}."""
    result = {}
    for f in files:
        if f["ext"] != ".pas":
            continue
        try:
            text = (ROOT / f["path"]).read_text(encoding="cp1252", errors="replace")
        except Exception:
            continue
        result[f["path"]] = parse_uses(text)
    return result


def resolve_dep(dep_name, unit_index, module_dirs):
    """Resolve um nome de unit para um path do módulo, ou None se externa."""
    if not dep_name or len(dep_name) > 200 or "\n" in dep_name or " " in dep_name:
        return None
    if dep_name in unit_index:
        return unit_index[dep_name]
    for d in module_dirs:
        candidate = ROOT / d / (dep_name + ".pas")
        try:
            if candidate.exists():
                return candidate.relative_to(ROOT).as_posix()
        except OSError:
            continue
    return None


def transitive_deps(form_path, uses_data, unit_index, module_dirs):
    """Cadeia de dependências diretas e indiretas de uma tela (form .pas)."""
    direct = set()
    indirect = set()
    visited = {form_path}
    queue = []
    if form_path in uses_data:
        _, iface, impl = uses_data[form_path]
        for u in iface | impl:
            resolved = resolve_dep(u, unit_index, module_dirs)
            if resolved and resolved not in visited:
                direct.add(resolved)
                queue.append(resolved)
                visited.add(resolved)
    while queue:
        current = queue.pop(0)
        if current in uses_data:
            _, iface, impl = uses_data[current]
            for u in iface | impl:
                resolved = resolve_dep(u, unit_index, module_dirs)
                if resolved and resolved not in visited:
                    indirect.add(resolved)
                    queue.append(resolved)
                    visited.add(resolved)
    return direct, indirect


# ── Classification A–L ──────────────────────────────────────────────────────────

REPORT_PATTERNS = [
    re.compile(r"\bRpt\b", re.I), re.compile(r"\bRel\b", re.I), re.compile(r"^R[A-Z]", re.I),
    re.compile(r"\bReport\b", re.I), re.compile(r"^cfg", re.I), re.compile(r"^FParam", re.I),
    re.compile(r"^frmParam", re.I), re.compile(r"^FRParam", re.I),
]
INTEGRATION_PATTERNS = [
    re.compile(r"\bImport", re.I), re.compile(r"\bExport", re.I), re.compile(r"\bGera", re.I),
    re.compile(r"\bIntegra", re.I), re.compile(r"\bSIPC", re.I), re.compile(r"\bSICADI", re.I),
    re.compile(r"\bSaf\b", re.I), re.compile(r"\bFidelio", re.I), re.compile(r"\bSPC\b", re.I),
]
BATCH_PATTERNS = [
    re.compile(r"\bBatch\b", re.I), re.compile(r"\bProcess\b", re.I), re.compile(r"\bJob\b", re.I),
    re.compile(r"\bAtu\b", re.I), re.compile(r"\bAtualiz", re.I), re.compile(r"\bFecha", re.I),
    re.compile(r"\bExecut", re.I),
]
ORPHAN_PATTERNS = [
    re.compile(r"^c[oó]pia", re.I), re.compile(r"^copy", re.I), re.compile(r"^old_", re.I),
    re.compile(r"^_", re.I), re.compile(r"_old$", re.I), re.compile(r"_\d{5}_\d{6}$"),
]


def is_form_pas(text, path=None):
    """Um .pas é form se tem {$R *.DFM} ou declara class(T...Form...) ou tem .dfm correspondente."""
    if re.search(r"\{\$R\s+\*\.DFM\}", text, re.I):
        return True
    if re.search(r"\bclass\s*\(\s*T\w*Form\w*\b", text, re.I):
        return True
    if path and Path(path).with_suffix(".dfm").exists():
        return True
    return False


def is_datamodule_pas(text):
    return bool(re.search(r"\bclass\s*\(\s*TDataModule\b", text, re.I))


def has_data_access(text):
    return bool(re.search(r"\b(TQuery|TADOQuery|TSQLQuery|TwwQuery|TTable|TStoredProc|"
                          r"TClientDataSet|TDataSet|TDataSource|TSQLDataSet|TADODataSet|"
                          r"TSQLStoredProc|TADOCommand|TSQLConnection|TADOConnection|"
                          r"TDatabase|TSession)\b", text, re.I))


def classify_file(f, pfc8_forms, uses_data, unit_index, module_dirs, all_deps_users):
    """Classifica um arquivo do inventário PFC-18 numa categoria A–L com justificativa."""
    path = f["path"]
    ext = f["ext"]
    stem = Path(path).stem
    stem_lower = stem.lower()
    dir_part = str(Path(path).parent).replace("\\", "/")

    reason = None

    # .dfm files
    if ext == ".dfm":
        form_info = pfc8_forms.get(stem_lower)
        if form_info:
            block = form_info["block"]
            if block == "telas":
                return "A", f"tela interativa em uso (PFC-8: {form_info['var']})"
            elif block == "relatorios":
                return "I", f"tela de filtro de relatório em uso (PFC-8: {form_info['var']})"
            elif block == "outros":
                if re.search(r"\bclass\s*\(\s*TDataModule\b", "", re.I) or stem_lower.startswith("d") or stem_lower.startswith("dtm"):
                    return "D", f"data module / componente não visual (PFC-8: outros)"
                return "J", f"fora do build / infraestrutura / form-base (PFC-8: outros)"
        # .dfm não está no PFC-8 — verificar padrões
        if any(p.search(stem) for p in ORPHAN_PATTERNS):
            return "J", "cópia/backup/fora do build (padrão de nome)"
        if any(p.search(stem) for p in REPORT_PATTERNS):
            return "I", "relatório (padrão de nome)"
        return "L", "não classificado pelo PFC-8 nem por padrão — indeterminado"

    # .pas files
    text = ""
    try:
        text = (ROOT / path).read_text(encoding="cp1252", errors="replace")
    except Exception:
        pass

    # 1. Form .pas (tem class(TForm) ou {$R *.DFM}) — segue a classificação do .dfm correspondente
    if is_form_pas(text, ROOT / path):
        form_info = pfc8_forms.get(stem_lower)
        if form_info:
            block = form_info["block"]
            if block == "telas":
                return "A", f"código da tela interativa em uso (PFC-8: {form_info['var']})"
            elif block == "relatorios":
                return "I", f"código do filtro de relatório em uso (PFC-8: {form_info['var']})"
            elif block == "outros":
                return "J", f"fora do build / infraestrutura / form-base (PFC-8: outros)"
        if any(p.search(stem) for p in ORPHAN_PATTERNS):
            return "J", "cópia/backup/fora do build (padrão de nome)"
        if any(p.search(stem) for p in REPORT_PATTERNS):
            return "I", "código de relatório (padrão de nome)"
        return "L", "form não classificado pelo PFC-8 — indeterminado"

    # 2. DataModule .pas
    if is_datamodule_pas(text):
        if any(p.search(stem) for p in ORPHAN_PATTERNS):
            return "J", "data module cópia/backup/fora do build"
        if any(p.search(stem) for p in REPORT_PATTERNS):
            return "I", "data module de relatório"
        return "D", "data module (class(TDataModule))"

    # 3. Regras de negócio: uCtrl*
    if stem_lower.startswith("uctrl"):
        if any(p.search(stem) for p in REPORT_PATTERNS):
            return "I", "controle de relatório (uCtrlRpt*)"
        return "B", "regra de negócio / objeto de controle (uCtrl*)"

    # 4. Acesso a dados: uDb*, uData*
    if stem_lower.startswith("udb") or stem_lower.startswith("udata") or stem_lower.startswith("udao"):
        return "C", "acesso a dados (uDb*/uData*)"

    # 5. Integrações
    if any(p.search(stem) for p in INTEGRATION_PATTERNS):
        return "E", "integração/importação/exportação (padrão de nome)"

    # 6. Processos/Batches
    if any(p.search(stem) for p in BATCH_PATTERNS):
        return "H", "processo/batch (padrão de nome)"

    # 7. Relatórios
    if any(p.search(stem) for p in REPORT_PATTERNS):
        return "I", "relatório (padrão de nome)"

    # 8. Cópias/backups
    if any(p.search(stem) for p in ORPHAN_PATTERNS):
        return "J", "cópia/backup/fora do build (padrão de nome)"

    # 9. Compartilhado vs utilitário: se usado por >1 tela → F, senão G
    users = all_deps_users.get(path, set())
    tela_users = {u for u in users if _is_tela_path(u, pfc8_forms)}
    if len(tela_users) > 1:
        return "F", f"compartilhado por {len(tela_users)} telas"

    # 10. Acesso a dados por conteúdo
    if has_data_access(text):
        if len(tela_users) >= 1:
            return "C", "acesso a dados (componentes TQuery/TTable/TDataSet no código)"
        return "G", "utilitário com acesso a dados, sem uso direto por tela"

    # 11. Verificar uso por telas
    if len(tela_users) == 1:
        return "F", f"dependência de 1 tela ({list(tela_users)[0]})"

    # 12. Sem uso por telas — verificar se é referenciado por qualquer unit do módulo
    if len(users) == 0:
        # Pode ser órfão ou utilitário global
        if stem_lower.startswith("u") or stem_lower.startswith("f"):
            return "K", "sem evidência de uso por telas ou units do módulo (possível órfão)"
        return "G", "utilitário sem uso direto por tela"

    # 13. Default: utilitário
    return "G", "utilitário / função comum"


def _is_tela_path(path, pfc8_forms):
    stem = Path(path).stem.lower()
    info = pfc8_forms.get(stem)
    return info is not None and info["block"] == "telas"


def compute_deps_users(files, uses_data, unit_index, module_dirs):
    """Para cada unit, o conjunto de paths que a referenciam (uses)."""
    users = {}
    for f in files:
        if f["ext"] != ".pas":
            continue
        path = f["path"]
        if path not in uses_data:
            continue
        _, iface, impl = uses_data[path]
        for u in iface | impl:
            resolved = resolve_dep(u, unit_index, module_dirs)
            if resolved:
                users.setdefault(resolved, set()).add(path)
    return users


# ── Main analysis ───────────────────────────────────────────────────────────────

def analyze_module(key, pfc8_forms):
    """Análise completa de um módulo: contagem, dependências, classificação."""
    result = c18.count_module(key)
    files = result["files"]
    cfg = MODULES[key]
    module_dirs = cfg["dirs"]

    unit_index = build_unit_index(files)
    uses_data = parse_all_uses(files)
    deps_users = compute_deps_users(files, uses_data, unit_index, module_dirs)

    classified = []
    for f in files:
        cat, reason = classify_file(f, pfc8_forms, uses_data, unit_index, module_dirs, deps_users)
        f2 = dict(f)
        f2["category"] = cat
        f2["cat_reason"] = reason
        f2["migravel"] = cat in MIGRABLE_CATS
        classified.append(f2)

    # Dependências das telas
    tela_deps = {}
    for f in classified:
        if f["category"] != "A" or f["ext"] != ".pas":
            continue
        direct, indirect = transitive_deps(f["path"], uses_data, unit_index, module_dirs)
        tela_deps[f["path"]] = {"direct": direct, "indirect": indirect}

    # Compartilhados: units usadas por >1 tela
    shared = {}
    for unit_path, users in deps_users.items():
        tela_users = {u for u in users if _is_tela_path(u, pfc8_forms)}
        if len(tela_users) > 1:
            shared[unit_path] = tela_users

    return {
        "key": key,
        "nome": cfg["nome"],
        "dirs": module_dirs,
        "files": classified,
        "excluded": result["excluded"],
        "others": result["others"],
        "uses_data": uses_data,
        "deps_users": deps_users,
        "tela_deps": tela_deps,
        "shared": shared,
        "pfc8_forms": pfc8_forms,
    }


def compute_numbers(r):
    """Computa os nove números A–I e métricas por categoria."""
    files = r["files"]
    total_code = sum(f["code"] for f in files)
    total_total = sum(f["total"] for f in files)
    total_comment = sum(f["comment"] for f in files)
    total_blank = sum(f["blank"] for f in files)

    by_cat = {}
    for f in files:
        cat = f["category"]
        by_cat.setdefault(cat, {"n": 0, "total": 0, "code": 0, "comment": 0, "blank": 0})
        by_cat[cat]["n"] += 1
        by_cat[cat]["total"] += f["total"]
        by_cat[cat]["code"] += f["code"]
        by_cat[cat]["comment"] += f["comment"]
        by_cat[cat]["blank"] += f["blank"]

    # B: LOC das telas em escopo (categoria A, só .pas code)
    loc_telas = sum(f["code"] for f in files if f["category"] == "A" and f["ext"] == ".pas")
    # DFM das telas (artefato de interface, não somado à LOC de código)
    dfm_telas = sum(f["total"] for f in files if f["category"] == "A" and f["ext"] == ".dfm")

    # C: Dependências necessárias (categorias B, C, D, E, H — code de .pas)
    loc_deps = sum(f["code"] for f in files if f["category"] in ("B", "C", "D", "E", "H") and f["ext"] == ".pas")

    # D: Compartilhados (categoria F — code de .pas)
    loc_shared = sum(f["code"] for f in files if f["category"] == "F" and f["ext"] == ".pas")

    # E: Relatórios (categoria I — code de .pas + .dfm)
    loc_reports = sum(f["code"] for f in files if f["category"] == "I" and f["ext"] != ".dfm")
    dfm_reports = sum(f["total"] for f in files if f["category"] == "I" and f["ext"] == ".dfm")

    # F: Fora do escopo (categoria J — code)
    loc_out = sum(f["code"] for f in files if f["category"] == "J" and f["ext"] != ".dfm")
    dfm_out = sum(f["total"] for f in files if f["category"] == "J" and f["ext"] == ".dfm")

    # G: Não utilizada (categoria K — code)
    loc_orphan = sum(f["code"] for f in files if f["category"] == "K" and f["ext"] != ".dfm")
    dfm_orphan = sum(f["total"] for f in files if f["category"] == "K" and f["ext"] == ".dfm")

    # H: Indeterminada (categoria L — code)
    loc_indet = sum(f["code"] for f in files if f["category"] == "L" and f["ext"] != ".dfm")
    dfm_indet = sum(f["total"] for f in files if f["category"] == "L" and f["ext"] == ".dfm")

    # G (Utilitários) — code
    loc_util = sum(f["code"] for f in files if f["category"] == "G" and f["ext"] == ".pas")

    # I: LOC Migrável = A(telas .pas) + B + C + D + E + F + G(util) + H
    loc_migravel = sum(f["code"] for f in files if f["category"] in MIGRABLE_CATS and f["ext"] == ".pas")

    # Validação AC2: soma por categoria = total
    sum_code = sum(by_cat.get(c, {}).get("code", 0) for c in "ABCDEFGHIJKL")
    # .dfm code é contado como code no PFC-18, mas aqui separamos
    sum_all = sum(by_cat.get(c, {}).get("total", 0) for c in "ABCDEFGHIJKL")

    return {
        "A_total": total_total,
        "A_code": total_code,
        "A_comment": total_comment,
        "A_blank": total_blank,
        "B_telas": loc_telas,
        "B_dfm": dfm_telas,
        "C_deps": loc_deps,
        "D_shared": loc_shared,
        "D_util": loc_util,
        "E_reports": loc_reports,
        "E_dfm_reports": dfm_reports,
        "F_out": loc_out,
        "F_dfm_out": dfm_out,
        "G_orphan": loc_orphan,
        "G_dfm_orphan": dfm_orphan,
        "H_indet": loc_indet,
        "H_dfm_indet": dfm_indet,
        "I_migravel": loc_migravel,
        "by_cat": by_cat,
        "sum_code": sum_code,
        "sum_all": sum_all,
        "diff_code": total_code - sum_code,
        "diff_all": total_total - sum_all,
    }


# ── HTML rendering ──────────────────────────────────────────────────────────────

def fmt(n):
    return c18.fmt(n)


def row(cells, strong=False):
    return c18.row(cells, strong=strong)


def esc(s):
    return html.escape(str(s))


def render_section(r, nums, all_results):
    files = r["files"]
    by_cat = nums["by_cat"]
    o = []
    o.append(BEGIN)
    o.append('    <section id="loc-migravel">')
    o.append('      <div class="section-title">📐 Linha de Base de Código Migrável (LOC Migrável) — PFC-19</div>')

    # Stats A-I
    o.append('<div class="stats">')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["A_code"])}</div><div class="l">A — LOC total do módulo (código)</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["B_telas"])}</div><div class="l">B — LOC das telas em escopo</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["C_deps"])}</div><div class="l">C — Dependências necessárias</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["D_shared"] + nums["D_util"])}</div><div class="l">D — Compartilhados + utilitários</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["E_reports"])}</div><div class="l">E — Relatórios (fora do baseline)</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["F_out"])}</div><div class="l">F — Fora do escopo</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["G_orphan"])}</div><div class="l">G — Não utilizada/Órfão</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["H_indet"])}</div><div class="l">H — Indeterminada</div></div>')
    o.append(f'  <div class="stat"><div class="n">{fmt(nums["I_migravel"])}</div><div class="l">I — LOC Migrável</div></div>')
    o.append('</div>')

    o.append('<p>Esta seção mostra a <strong>Linha de Base de Código Migrável</strong>: quais arquivos e linhas são '
             'necessários para reproduzir as telas funcionais em escopo, incluindo dependências diretas e indiretas, '
             'quais ficam de fora e por quê, e o número final de LOC Migrável. Os valores vêm do repositório e são '
             'gerados e validados por <code>docs/tools/loc_migravel.py</code> (PFC-19), reusando a contagem do PFC-18.</p>')

    # Nove números A-I — tabela
    o.append('<div class="table-wrap"><table><thead><tr><th>Nº</th><th>Descrição</th><th>LOC (código .pas)</th>'
             '<th>Linhas físicas</th><th>Comentários</th><th>Vazias</th></tr></thead><tbody>')
    nine = [
        ("A", "LOC total do módulo", nums["A_code"], nums["A_total"], nums["A_comment"], nums["A_blank"]),
        ("B", "LOC das telas em escopo (cat. A, .pas)", nums["B_telas"], nums["B_telas"], 0, 0),
        ("C", "Dependências necessárias (cat. B+C+D+E+H)", nums["C_deps"], nums["C_deps"], 0, 0),
        ("D", "Compartilhados + utilitários (cat. F+G)", nums["D_shared"] + nums["D_util"], nums["D_shared"] + nums["D_util"], 0, 0),
        ("E", "Relatórios (cat. I, fora do baseline)", nums["E_reports"], nums["E_reports"], 0, 0),
        ("F", "Fora do escopo (cat. J)", nums["F_out"], nums["F_out"], 0, 0),
        ("G", "Não utilizada/Órfão (cat. K)", nums["G_orphan"], nums["G_orphan"], 0, 0),
        ("H", "Indeterminada (cat. L)", nums["H_indet"], nums["H_indet"], 0, 0),
        ("I", "<strong>LOC Migrável</strong> (cat. A–H, .pas)", nums["I_migravel"], nums["I_migravel"], 0, 0),
    ]
    for letter, desc, code, total, comment, blank in nine:
        o.append(row([letter, desc, fmt(code), fmt(total), fmt(comment), fmt(blank)], strong=(letter == "I")))
    o.append("</tbody></table></div>")

    # DFM separado
    o.append(f'<p class="desc">Forms <code>.dfm</code> (artefatos de interface, não somados à LOC de código): '
             f'telas {fmt(nums["B_dfm"])} linhas, relatórios {fmt(nums["E_dfm_reports"])} linhas, '
             f'fora do escopo {fmt(nums["F_dfm_out"])} linhas, órfão {fmt(nums["G_dfm_orphan"])} linhas, '
             f'indeterminado {fmt(nums["H_dfm_indet"])} linhas.</p>')

    # Fórmula
    o.append('<div class="note"><strong>Fórmula:</strong> LOC Migrável = telas em escopo + dependências necessárias '
             '+ regras de negócio + acesso a dados + integrações do módulo + compartilhados necessários '
             '− relatórios − fora do escopo − não utilizado − duplicidades. '
             f'<strong>LOC Migrável = {fmt(nums["I_migravel"])} linhas de código.</strong></div>')

    # AC2: Métricas por categoria (A–L)
    o.append('<div class="inv-group-title">Métricas por categoria (A–L)</div>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Cat.</th><th>Descrição</th><th>Arquivos</th>'
             '<th>LOC total</th><th>LOC código</th><th>Comentários</th><th>Vazias</th><th>% do total</th>'
             '<th>Migrável?</th></tr></thead><tbody>')
    total_code = nums["A_code"]
    for letter, name in CATEGORIES:
        c = by_cat.get(letter, {"n": 0, "total": 0, "code": 0, "comment": 0, "blank": 0})
        pct = f"{c['code'] / total_code * 100:.1f}%" if total_code else "0%"
        mig = "Sim" if letter in MIGRABLE_CATS else "Não"
        o.append(row([letter, name, fmt(c["n"]), fmt(c["total"]), fmt(c["code"]),
                      fmt(c["comment"]), fmt(c["blank"]), pct, mig]))
    o.append(row(["", "Total", fmt(sum(by_cat.get(l, {}).get("n", 0) for l in "ABCDEFGHIJKL")),
                  fmt(nums["A_total"]), fmt(nums["A_code"]), fmt(nums["A_comment"]),
                  fmt(nums["A_blank"]), "100%", ""], strong=True))
    o.append("</tbody></table></div>")
    o.append(f'<p class="desc">Diferença (total − soma por categoria): código = {fmt(nums["diff_code"])}, '
             f'total = {fmt(nums["diff_all"])}. Deve ser zero (AC2).</p>')

    # AC3: Tabela de funcionalidades (telas)
    tela_files = [f for f in files if f["category"] == "A" and f["ext"] == ".pas"]
    o.append(f'<div class="inv-group-title">Funcionalidades — telas em escopo ({fmt(len(tela_files))})</div>')
    o.append('<p>Cada tela interativa em uso do inventário PFC-8 com ID, form, processo, complexidade, '
             'LOC do form (.pas), LOC das dependências diretas e indiretas e LOC compartilhada.</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>ID</th><th>Form</th><th>Processo</th>'
             '<th>LOC form (.pas)</th><th>LOC deps diretas</th><th>LOC deps indiretas</th>'
             '<th>LOC compartilhada</th><th>Total atribuído</th></tr></thead><tbody>')
    for i, f in enumerate(sorted(tela_files, key=lambda x: x["path"]), 1):
        form_path = f["path"]
        deps = r["tela_deps"].get(form_path, {"direct": set(), "indirect": set()})
        path_to_file = {ff["path"]: ff for ff in files}
        loc_direct = sum(path_to_file[d]["code"] for d in deps["direct"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
        loc_indirect = sum(path_to_file[d]["code"] for d in deps["indirect"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
        shared_deps = {d for d in deps["direct"] | deps["indirect"] if d in r["shared"]}
        loc_shared_dep = sum(path_to_file[d]["code"] for d in shared_deps if d in path_to_file and path_to_file[d]["ext"] == ".pas")
        form_info = r["pfc8_forms"].get(Path(form_path).stem.lower(), {})
        processo = form_info.get("processo", "")
        total_attr = f["code"] + loc_direct + loc_indirect
        o.append(row([str(i), f"<code>{esc(Path(form_path).stem)}</code>", esc(processo),
                      fmt(f["code"]), fmt(loc_direct), fmt(loc_indirect),
                      fmt(loc_shared_dep), fmt(total_attr)]))
    o.append("</tbody></table></div>")
    o.append('<p class="desc">A coluna "Total atribuído" é para rastreabilidade e não para soma simples: '
             'units compartilhadas aparecem em múltiplas telas mas a LOC compartilhada não é somada de novo no total.</p>')

    # Componentes compartilhados
    shared_items = sorted(r["shared"].items(), key=lambda x: -sum(
        path_to_file[x[0]]["code"] for x in [x] if x[0] in path_to_file))
    o.append(f'<div class="inv-group-title">Componentes compartilhados ({fmt(len(r["shared"]))})</div>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Unit</th><th>LOC código</th>'
             '<th>Qtde telas</th><th>Telas que usam</th><th>Categoria</th><th>Migrável?</th></tr></thead><tbody>')
    path_to_file = {ff["path"]: ff for ff in files}
    for unit_path, tela_users in shared_items[:200]:
        ff = path_to_file.get(unit_path)
        if not ff:
            continue
        tela_names = sorted(Path(u).stem for u in tela_users)
        o.append(row([f"<code>{esc(unit_path)}</code>", fmt(ff["code"]), fmt(len(tela_users)),
                      esc(", ".join(tela_names[:8]) + ("…" if len(tela_names) > 8 else "")),
                      ff["category"], "Sim" if ff["migravel"] else "Não"]))
    o.append("</tbody></table></div>")

    # AC4: Tabela de exclusões
    excl_files = [f for f in files if f["category"] in ("I", "J", "K", "L")]
    o.append(f'<div class="inv-group-title">Exclusões — fora do baseline ({fmt(len(excl_files))})</div>')
    o.append('<p>Relatórios, fora do build, não utilizado/órfão, código de outro módulo, duplicatas e indeterminados. '
             'Cada item com arquivo, LOC, motivo e evidência.</p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Arquivo</th><th>Cat.</th><th>LOC código</th>'
             '<th>Motivo</th></tr></thead><tbody>')
    for f in sorted(excl_files, key=lambda x: (x["category"], x["path"])):
        o.append(row([f"<code>{esc(f['path'])}</code>", f["category"], fmt(f["code"]), esc(f["cat_reason"])]))
    o.append("</tbody></table></div>")

    # Tabela de dependências (amostra: top telas por LOC)
    o.append('<div class="inv-group-title">Cadeia de dependências (amostra — top 20 telas por LOC)</div>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Tela</th><th>Dep. diretas</th><th>Dep. indiretas</th>'
             '<th>LOC diretas</th><th>LOC indiretas</th></tr></thead><tbody>')
    top_telas = sorted(tela_files, key=lambda x: -x["code"])[:20]
    for f in top_telas:
        form_path = f["path"]
        deps = r["tela_deps"].get(form_path, {"direct": set(), "indirect": set()})
        loc_direct = sum(path_to_file[d]["code"] for d in deps["direct"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
        loc_indirect = sum(path_to_file[d]["code"] for d in deps["indirect"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
        direct_names = sorted(Path(d).stem for d in deps["direct"])
        indirect_names = sorted(Path(d).stem for d in deps["indirect"])
        o.append(row([f"<code>{esc(Path(form_path).stem)}</code>",
                      esc(", ".join(direct_names[:6]) + ("…" if len(direct_names) > 6 else "")),
                      esc(", ".join(indirect_names[:6]) + ("…" if len(indirect_names) > 6 else "")),
                      fmt(loc_direct), fmt(loc_indirect)]))
    o.append("</tbody></table></div>")

    # AC5: Resumo executivo
    o.append('<div class="inv-group-title">Resumo executivo</div>')

    # Top 20 units migráveis por LOC
    migravel_files = [f for f in files if f["migravel"] and f["ext"] == ".pas"]
    top_migravel = sorted(migravel_files, key=lambda x: -x["code"])[:20]
    o.append('<p><strong>Top 20 units migráveis por LOC:</strong></p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>#</th><th>Unit</th><th>Cat.</th><th>LOC código</th></tr></thead><tbody>')
    for i, f in enumerate(top_migravel, 1):
        o.append(row([str(i), f"<code>{esc(f['path'])}</code>", f["category"], fmt(f["code"])]))
    o.append("</tbody></table></div>")

    # Top 20 telas por volume de código
    top_tela_loc = sorted(tela_files, key=lambda x: -x["code"])[:20]
    o.append('<p><strong>Top 20 telas por volume de código:</strong></p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>#</th><th>Tela</th><th>LOC código</th><th>LOC .dfm</th></tr></thead><tbody>')
    for i, f in enumerate(top_tela_loc, 1):
        dfm_path = str(Path(f["path"]).with_suffix(".dfm"))
        dfm_file = path_to_file.get(dfm_path)
        dfm_loc = dfm_file["total"] if dfm_file else 0
        o.append(row([str(i), f"<code>{esc(Path(f['path']).stem)}</code>", fmt(f["code"]), fmt(dfm_loc)]))
    o.append("</tbody></table></div>")

    # Top 20 units compartilhadas
    top_shared = sorted(r["shared"].items(),
                        key=lambda x: -path_to_file[x[0]]["code"] if x[0] in path_to_file else 0)[:20]
    o.append('<p><strong>Top 20 units compartilhadas:</strong></p>')
    o.append('<div class="table-wrap"><table><thead><tr><th>#</th><th>Unit</th><th>LOC código</th><th>Qtde telas</th></tr></thead><tbody>')
    for i, (unit_path, tela_users) in enumerate(top_shared, 1):
        ff = path_to_file.get(unit_path)
        if not ff:
            continue
        o.append(row([str(i), f"<code>{esc(unit_path)}</code>", fmt(ff["code"]), fmt(len(tela_users))]))
    o.append("</tbody></table></div>")

    # Distribuição por complexidade (do PFC-8)
    o.append('<p><strong>Comparação com o inventário funcional (PFC-8):</strong></p>')
    n_telas = len({id(v) for v in r["pfc8_forms"].values() if v["block"] == "telas"})
    n_reports = len({id(v) for v in r["pfc8_forms"].values() if v["block"] == "relatorios"})
    n_outros = len({id(v) for v in r["pfc8_forms"].values() if v["block"] == "outros"})
    o.append('<div class="table-wrap"><table><thead><tr><th>Métrica</th><th>PFC-8 (inventário funcional)</th>'
             '<th>PFC-19 (LOC Migrável)</th></tr></thead><tbody>')
    o.append(row(["Telas interativas em uso", fmt(n_telas), fmt(len(tela_files))]))
    o.append(row(["Relatórios/filtros", fmt(n_reports), fmt(sum(1 for f in files if f["category"] == "I" and f["ext"] == ".pas"))]))
    o.append(row(["Outros arquivos (não-tela)", fmt(n_outros), fmt(sum(1 for f in files if f["category"] in ("J", "K", "L", "D") and f["ext"] == ".pas"))]))
    o.append(row(["LOC Migrável (código .pas)", "—", fmt(nums["I_migravel"])]))
    o.append(row(["LOC total do módulo (código)", "—", fmt(nums["A_code"])]))
    o.append(row(["% migrável do total", "—", f"{nums['I_migravel'] / nums['A_code'] * 100:.1f}%" if nums["A_code"] else "—"]))
    o.append("</tbody></table></div>")

    # Riscos e pendências
    o.append('<p><strong>Riscos e pendências:</strong></p>')
    o.append('<ul>')
    n_indet = sum(1 for f in files if f["category"] == "L")
    n_orphan = sum(1 for f in files if f["category"] == "K")
    n_shared = len(r["shared"])
    if n_indet:
        o.append(f'<li>{fmt(n_indet)} arquivos classificados como <strong>Indeterminado (L)</strong> — '
                 'não foi possível determinar a dependência real; marcados para revisão.</li>')
    if n_orphan:
        o.append(f'<li>{fmt(n_orphan)} arquivos sem evidência de uso por telas ou units do módulo '
                 '(<strong>Órfão/K</strong>) — confirmar com menus e perfis de produção (SAD).</li>')
    if n_shared:
        o.append(f'<li>{fmt(n_shared)} units compartilhadas entre múltiplas telas — '
                 'a LOC compartilhada não é somada de novo no total.</li>')
    o.append('<li>Dependências externas (CMCONTABOBJ50, GLOBALCM, SHARED, FUNCOESGERAIS etc.) '
             'não contam como LOC migrável — registradas como "Dependência externa — fora do escopo".</li>')
    o.append('<li>Numbers IFPUG/SFP não encontrados nas páginas atuais — precisam ser fornecidos pelo time de dimensionamento.</li>')
    o.append('</ul>')

    # Inventário classificado (details)
    o.append(f'<details><summary><strong>Inventário de arquivos classificado ({fmt(len(files))} arquivos)</strong>. '
             'Cada arquivo recebe exatamente uma categoria A–L.</summary>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Arquivo</th><th>Ext.</th><th>Cat.</th>'
             '<th>LOC total</th><th>LOC código</th><th>Coment.</th><th>Vazias</th><th>Migrável?</th>'
             '<th>Motivo</th></tr></thead><tbody>')
    for f in sorted(files, key=lambda x: (x["category"], x["path"])):
        o.append(row([f"<code>{esc(f['path'])}</code>", f["ext"], f["category"],
                      fmt(f["total"]), fmt(f["code"]), fmt(f["comment"]), fmt(f["blank"]),
                      "Sim" if f["migravel"] else "Não", esc(f["cat_reason"])]))
    o.append("</tbody></table></div>")
    o.append("</details>")

    o.append(f'<p class="desc">Gerado por <code>docs/tools/loc_migravel.py</code> (PFC-19). '
             f'Todos os números saem de um processo que pode ser repetido a partir do repositório.</p>')
    o.append("    </section>")
    o.append(END)
    return "\n".join(o) + "\n"


# ── Spreadsheet (CSV) ───────────────────────────────────────────────────────────

def write_spreadsheet(r, nums, outdir):
    """Escreve a planilha CSV com 8 abas (separadas por linhas em branco)."""
    files = r["files"]
    path_to_file = {f["path"]: f for f in files}
    outpath = ROOT / outdir
    outpath.parent.mkdir(parents=True, exist_ok=True)
    with open(outpath, "w", encoding="utf-8", newline="") as fh:
        w = csv.writer(fh)

        # Aba 1: Resumo executivo
        w.writerow(["=== Aba 1: Resumo executivo ==="])
        w.writerow(["Métrica", "Valor"])
        for letter, desc, code in [
            ("A", "LOC total do módulo (código)", nums["A_code"]),
            ("B", "LOC das telas em escopo", nums["B_telas"]),
            ("C", "Dependências necessárias", nums["C_deps"]),
            ("D", "Compartilhados + utilitários", nums["D_shared"] + nums["D_util"]),
            ("E", "Relatórios", nums["E_reports"]),
            ("F", "Fora do escopo", nums["F_out"]),
            ("G", "Não utilizada/Órfão", nums["G_orphan"]),
            ("H", "Indeterminada", nums["H_indet"]),
            ("I", "LOC Migrável", nums["I_migravel"]),
        ]:
            w.writerow([f"{letter} — {desc}", code])
        w.writerow([])

        # Aba 2: Inventário de arquivos
        w.writerow(["=== Aba 2: Inventário de arquivos ==="])
        w.writerow(["Arquivo", "Extensão", "Diretório", "Tipo", "LOC total", "Código",
                    "Comentário", "Branco", "Status", "Migrável?", "Motivo", "Funcionalidade", "Observação"])
        for f in sorted(files, key=lambda x: x["path"]):
            p = Path(f["path"])
            w.writerow([f["path"], f["ext"], str(p.parent), CAT_NAME[f["category"]],
                        f["total"], f["code"], f["comment"], f["blank"],
                        "incluído" if f["migravel"] else "excluído",
                        "Sim" if f["migravel"] else "Não", f["cat_reason"], "", ""])
        w.writerow([])

        # Aba 3: Dependências
        w.writerow(["=== Aba 3: Dependências ==="])
        w.writerow(["Funcionalidade", "Form", "Unit dependente", "Unit utilizada", "Tipo",
                    "LOC", "Compartilhada?", "Outras funcionalidades", "Migrável?", "Evidência"])
        for form_path, deps in r["tela_deps"].items():
            form_stem = Path(form_path).stem
            for dep in sorted(deps["direct"]):
                ff = path_to_file.get(dep)
                w.writerow([form_stem, form_stem, form_path, dep, "direta",
                            ff["code"] if ff else 0,
                            "Sim" if dep in r["shared"] else "Não", "",
                            "Sim" if ff and ff["migravel"] else "Não", "uses"])
            for dep in sorted(deps["indirect"]):
                ff = path_to_file.get(dep)
                w.writerow([form_stem, form_stem, form_path, dep, "indireta",
                            ff["code"] if ff else 0,
                            "Sim" if dep in r["shared"] else "Não", "",
                            "Sim" if ff and ff["migravel"] else "Não", "uses (transitivo)"])
        w.writerow([])

        # Aba 4: Funcionalidades
        w.writerow(["=== Aba 4: Funcionalidades ==="])
        w.writerow(["ID", "Form", "Descrição", "Processo", "Complexidade",
                    "LOC form", "Dep. diretas", "Dep. indiretas", "Compartilhadas", "Total atribuído", "Observações"])
        tela_files = [f for f in files if f["category"] == "A" and f["ext"] == ".pas"]
        for i, f in enumerate(sorted(tela_files, key=lambda x: x["path"]), 1):
            deps = r["tela_deps"].get(f["path"], {"direct": set(), "indirect": set()})
            loc_direct = sum(path_to_file[d]["code"] for d in deps["direct"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
            loc_indirect = sum(path_to_file[d]["code"] for d in deps["indirect"] if d in path_to_file and path_to_file[d]["ext"] == ".pas")
            shared_deps = {d for d in deps["direct"] | deps["indirect"] if d in r["shared"]}
            loc_shared = sum(path_to_file[d]["code"] for d in shared_deps if d in path_to_file and path_to_file[d]["ext"] == ".pas")
            form_info = r["pfc8_forms"].get(Path(f["path"]).stem.lower(), {})
            w.writerow([i, Path(f["path"]).stem, "", form_info.get("processo", ""), "",
                        f["code"], loc_direct, loc_indirect, loc_shared,
                        f["code"] + loc_direct + loc_indirect, ""])
        w.writerow([])

        # Aba 5: Componentes compartilhados
        w.writerow(["=== Aba 5: Componentes compartilhados ==="])
        w.writerow(["Unit", "LOC", "Qtde funcionalidades", "Lista de funcionalidades", "Categoria", "Migrável?", "Justificativa"])
        for unit_path, tela_users in sorted(r["shared"].items()):
            ff = path_to_file.get(unit_path)
            w.writerow([unit_path, ff["code"] if ff else 0, len(tela_users),
                        ", ".join(sorted(Path(u).stem for u in tela_users)),
                        ff["category"] if ff else "", "Sim" if ff and ff["migravel"] else "Não",
                        ff["cat_reason"] if ff else ""])
        w.writerow([])

        # Aba 6: Exclusões
        w.writerow(["=== Aba 6: Exclusões ==="])
        w.writerow(["Arquivo", "LOC", "Motivo", "Evidência"])
        for f in sorted(files, key=lambda x: (x["category"], x["path"])):
            if f["category"] in ("I", "J", "K", "L"):
                w.writerow([f["path"], f["code"], f["cat_reason"], f["category"]])
        w.writerow([])

        # Aba 7: Relatórios
        w.writerow(["=== Aba 7: Relatórios ==="])
        w.writerow(["Arquivo", "LOC código", "LOC .dfm", "Processo"])
        for f in sorted(files, key=lambda x: x["path"]):
            if f["category"] == "I":
                w.writerow([f["path"], f["code"], f["total"] if f["ext"] == ".dfm" else 0, ""])
        w.writerow([])

        # Aba 8: Métricas por categoria
        w.writerow(["=== Aba 8: Métricas por categoria ==="])
        w.writerow(["Categoria", "Arquivos", "LOC", "% do total"])
        total_code = nums["A_code"]
        for letter, name in CATEGORIES:
            c = nums["by_cat"].get(letter, {"n": 0, "code": 0})
            pct = f"{c['code'] / total_code * 100:.1f}%" if total_code else "0%"
            w.writerow([f"{letter} — {name}", c["n"], c["code"], pct])
    return outpath


# ── Apply to HTML ───────────────────────────────────────────────────────────────

def apply_section(page_text, fragment):
    if BEGIN in page_text:
        start = page_text.index(BEGIN)
        end = page_text.index(END, start) + len(END) + 1
        return page_text[:start] + fragment + page_text[end:]
    if page_text.count(ANCHOR) != 1:
        raise SystemExit("âncora PFC-18:fim não encontrada de forma única")
    return page_text.replace(ANCHOR, ANCHOR + "\n" + fragment)


# ── Validation ──────────────────────────────────────────────────────────────────

def validate(r, nums):
    errors = []
    files = r["files"]
    # AC2: soma por categoria = total
    if nums["diff_code"] != 0:
        errors.append(f"{r['nome']}: soma de código por categoria difere do total em {nums['diff_code']}")
    if nums["diff_all"] != 0:
        errors.append(f"{r['nome']}: soma de total por categoria difere do total em {nums['diff_all']}")
    # Nenhuma unit contada duas vezes
    paths = [f["path"] for f in files]
    if len(paths) != len(set(paths)):
        errors.append(f"{r['nome']}: arquivo contado mais de uma vez")
    # Cada arquivo tem exatamente uma categoria
    for f in files:
        if f["category"] not in "ABCDEFGHIJKL":
            errors.append(f"{f['path']}: categoria inválida {f['category']}")
    return errors


# ── Main ────────────────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    all_results = {}
    all_nums = {}
    for key in MODULES:
        page = ROOT / MODULES[key]["page"]
        page_text = page.read_text(encoding="utf-8")
        pfc8_forms = parse_pfc8_inventory(page_text)
        r = analyze_module(key, pfc8_forms)
        nums = compute_numbers(r)
        all_results[key] = r
        all_nums[key] = nums
        n_telas = len({id(v) for v in pfc8_forms.values() if v["block"] == "telas"})
        n_reports = len({id(v) for v in pfc8_forms.values() if v["block"] == "relatorios"})
        print(f"{r['nome']}: arquivos={len(r['files'])} telas_PFC8={n_telas} rel_PFC8={n_reports} "
              f"LOC_migravel={fmt(nums['I_migravel'])} LOC_total={fmt(nums['A_code'])} "
              f"diff_code={nums['diff_code']} diff_all={nums['diff_all']}")

    errors = []
    for key in MODULES:
        errors.extend(validate(all_results[key], all_nums[key]))

    stale = []
    for key in MODULES:
        page = ROOT / MODULES[key]["page"]
        current = page.read_text(encoding="utf-8")
        fragment = render_section(all_results[key], all_nums[key], all_results)
        updated = apply_section(current, fragment)
        if updated != current:
            if args.write:
                page.write_text(updated, encoding="utf-8")
                print(f"atualizado: {MODULES[key]['page']}")
                csv_path = f"docs/site/modules/{key}/loc-migravel.csv"
                written = write_spreadsheet(all_results[key], all_nums[key], csv_path)
                print(f"planilha: {written.relative_to(ROOT)}")
            else:
                stale.append(MODULES[key]["page"])

    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: somas por categoria = totais; nenhum arquivo contado duas vezes; "
          "cada arquivo tem exatamente uma categoria A–L.")
    if args.check and stale:
        print("Páginas desatualizadas: " + ", ".join(stale))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
