#!/usr/bin/env python3
"""PFC-44 — Uso efetivo das dependências compartilhadas por CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV.

Uso (a partir da raiz do repositório):
    python3 -B docs/tools/uso_efetivo_dependencias.py            # imprime o resumo e valida
    python3 -B docs/tools/uso_efetivo_dependencias.py --write    # (re)gera o estudo e a seção do docs1
    python3 -B docs/tools/uso_efetivo_dependencias.py --check    # falha se os arquivos estiverem desatualizados

PFC-46: a seção do inventário inclui o quadro "Linhas únicas das dependências por quem as usa" (só um módulo,
dois módulos, três módulos), cuja soma é o total usado das dependências, e a conciliação com as colunas por módulo.

Saídas:
  * Analise_linhas_dependencias.md (raiz do repositório) — estudo completo;
  * docs1/visao-geral/inventario.html e docs1/index.html — seção "Linhas de Código" (PFC-45): só o código a
    migrar = pastas dos três módulos + parte efetivamente usada das dependências diretas. Nenhum número que
    soma arquivos de dependência inteiros é publicado no docs1 (essa linha de base fica só no estudo).
    Esta seção substitui as antigas seções PFC-26 e PFC-44 (removidas automaticamente no --write).

Reuso:
  * PFC-26 (contagem_docs1.py): fechamento de dependências por programa (.dof Packages= + requires,
    units do .dpr e do SearchPath) e a lista exata de 1.724 arquivos de dependência contados, com as mesmas
    exclusões (DFM binário, cópias, duplicatas, terceiros/Borland). Assim os números são comparáveis.
  * PFC-18 (contagem_delphi5.py): regra de classificação de linha (código/comentário/vazia).

Método (resumo; detalhado no estudo):
  1. Cada .pas é tokenizado (comentários e strings removidos; os dois ramos de {$IFDEF} entram) e dividido em
     segmentos: rotinas implementadas (procedure/function/constructor/destructor, inclusive métodos e rotinas
     aninhadas), declarações de classe/objeto/interface e "estrutura da unit" (cabeçalho, uses, const/var/type
     soltos, declarações do interface, initialization/finalization).
  2. Para cada programa, as units alcançáveis são obtidas pelas cláusulas uses a partir de todos os fontes da
     pasta do módulo (mesmo recorte do PFC-26), resolvidas pelo mapa unit → arquivo do próprio programa.
  3. Ponto fixo de referências por nome: os identificadores dos fontes do módulo (e, nos .dfm, as classes dos
     componentes e os handlers de evento) são as sementes. Um segmento de uma unit alcançável passa a ser usado
     quando o seu nome é referenciado (método: nome referenciado e classe usada; ou método virtual/override/
     dynamic/abstract/message de classe usada); seus identificadores entram nas referências e o processo se repete.
  4. Linhas efetivas de um arquivo = linhas dos segmentos usados + estrutura da unit (se a unit é usada). O .dfm
     acompanha a sua unit; o .dpk entra se alguma unit do pacote é usada.
"""
import argparse
import html
import posixpath
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import contagem_delphi5 as c18  # noqa: E402
import contagem_docs1 as c26  # noqa: E402

ROOT = c18.ROOT
STUDY = "Analise_linhas_dependencias.md"
PAGE = "docs1/visao-geral/inventario.html"
INDEX_PAGE = "docs1/index.html"
BEGIN, END = c26.LOC_BEGIN, c26.LOC_END  # seção "Linhas de Código" (PFC-45)
# Seções antigas, substituídas pela seção PFC-45 no --write.
LEGACY = [(c26.BEGIN, c26.END),
          ("<!-- PFC-44:inicio — gerado por docs/tools/uso_efetivo_dependencias.py; não editar manualmente -->",
           "<!-- PFC-44:fim -->")]
ANCHORS = {PAGE: '<section id="analista">', INDEX_PAGE: "</main>"}  # onde entra a seção se não houver bloco
ORDER = ["FOLHA", "CONTRIBUIÇÃO", "BENEFICIOPREV"]  # ordem de apresentação (PFC-45)
BASELINE = {"total": 1632702, "code": 1363291, "n": 1724}  # dependências publicadas no PFC-26
BASELINE_ALL = {"total": 2479602, "code": 2091675, "n": 2531}  # totais consolidados do PFC-26

ROUTINE_KW = {"procedure", "function", "constructor", "destructor"}
POLY = {"virtual", "override", "dynamic", "abstract", "message"}
DIRECTIVES = {"overload", "virtual", "override", "dynamic", "abstract", "message", "reintroduce", "stdcall",
              "cdecl", "register", "pascal", "safecall", "far", "near", "export", "assembler", "forward",
              "external", "inline", "platform", "deprecated", "static", "varargs", "local"}
NOT_ROUTINE_PREV = {"=", ":", ",", "(", "of", "array", "to"}
TOKEN_RE = re.compile(r"//[^\n]*|\{[^}]*\}?|\(\*.*?(?:\*\)|\Z)|'[^'\n]*'?|\n|[A-Za-z_]\w*|\$[0-9A-Fa-f]+|"
                      r"#\$?[0-9A-Fa-f]*|\d[\w.]*|[;()=:.,\[\]]|[^\s\w]", re.S)

# ── Prontidão para migração (AC5): juízo por dependência ─────────────────────────────────────────
# "direto": a stack-alvo (.NET 10 + React 19 + Oracle 23ai) já oferece o recurso (biblioteca de componentes
# React, ASP.NET Core, EF Core/ODP.NET, System.Security.Cryptography, bibliotecas de relatório); o código
# Delphi usado é substituído, não traduzido. "reimpl": regra de negócio/integração/workflow própria FUNCEF/CM
# que precisa ser reescrita em C#/React.
READINESS = {
    "CMAdd50": ("direto", "Utilitários técnicos (zip, hash/criptografia, porta serial, ícone de bandeja, grid ordenável) → `System.IO.Compression`, `System.Security.Cryptography`, componentes React 19."),
    "CMAdmPrev": ("reimpl", "Regras de administração previdenciária (cadastros, cálculos, telas de negócio) → serviços .NET 10 + telas React."),
    "CmBack50": ("reimpl", "Cadastros de retaguarda (plano de contas, documentos, impostos, dados bancários) → serviços de domínio .NET + telas React."),
    "CMBussines50": ("reimpl", "Classes-base de objetos de negócio CM → modelo de domínio C#."),
    "CMCapCarObj50": ("reimpl", "Objetos de negócio de captação/carteira → serviços de domínio .NET."),
    "CmCapCarUtilObj50": ("reimpl", "Utilitários e objetos de negócio de captação/carteira (cálculos financeiros) → serviços .NET."),
    "CMCfinanObj50": ("reimpl", "Objetos de negócio do controle financeiro → serviços de domínio .NET."),
    "CMCompo50": ("direto", "Componentes visuais CM (lookups, date pickers, list views, procura, FTP, e-mail) → componentes React 19 e bibliotecas .NET."),
    "CMContabObj50": ("reimpl", "Objetos de negócio contábeis (lançamentos, contabilização) → serviços .NET."),
    "CMCrypto": ("direto", "Criptografia → System.Security.Cryptography (.NET 10)."),
    "CMForms50": ("direto", "Framework de formulários VCL (forms-base de cadastro, login, troca de senha, autorização) → componentes/rotas React 19 e ASP.NET Core Identity."),
    "CmGlobalObj50": ("reimpl", "Cadastros globais (cidade, estado, moeda, feriado, centro de custo, parâmetros, log de tabelas) → serviços de domínio .NET."),
    "CMIntBancoMT50": ("reimpl", "Integração bancária (layouts CNAB, remessa/retorno) → serviços de integração .NET."),
    "CMIntegraEP50": ("reimpl", "Integração com Empréstimo (EMPRESTIMOBPL) → serviços/APIs .NET."),
    "CMIRRFobj50": ("reimpl", "Cálculo de IRRF → serviço de cálculo .NET."),
    "CMOld50": ("direto", "Componentes visuais legados → componentes React 19."),
    "CmParser50": ("direto", "Avaliador de expressões → biblioteca .NET de expressões (ex.: NCalc) ou Roslyn scripting."),
    "CMPlaneOrcObj50": ("reimpl", "Objetos de negócio de planejamento orçamentário → serviços .NET."),
    "CMPrevMT50": ("reimpl", "Camada intermediária (MTS) previdenciária → serviços ASP.NET Core."),
    "CMPrincipal50": ("direto", "Janela principal/menu → shell da aplicação React 19."),
    "CMRad50": ("reimpl", "Workflow RAD de processos, etapas e autorizações → serviço de workflow .NET."),
    "CMRegra50": ("reimpl", "Motor de regras previdenciárias → serviço de regras .NET."),
    "CMRegra50MT": ("reimpl", "Motor de regras (camada MTS) → serviço de regras .NET."),
    "CmRelatsOld50": ("direto", "Relatórios-base legados (cabeçalho/rodapé, preview, mestre-detalhe) → biblioteca de relatórios .NET / PDF."),
    "CMResource50": ("direto", "Leitura/escrita de recursos do executável → assets React / arquivos `.resx`."),
    "CmSql50": ("direto", "Camada de dialetos SQL (Oracle, DB2, MSSQL) → EF Core 10 / Dapper + ODP.NET (Oracle 23ai)."),
    "CMTotalPrev50": ("reimpl", "Totalizações previdenciárias → serviços de cálculo .NET."),
    "CMWebComum50": ("reimpl", "Acesso web, geração de senhas e simulação de benefício do autoatendimento → serviços .NET."),
    "CM/CMADMPREV/Fontes": ("reimpl", "Units de negócio da administração previdenciária compiladas no .exe → serviços .NET."),
    "CM/CMADMPREV/Relatorios": ("reimpl", "Consulta de cargo/função (regra de seleção própria) → serviço .NET + tela React."),
    "SHARED/Folhas": ("reimpl", "Listas de recebedores da folha (geração individual e resultados) → serviços .NET."),
}
CATEGORY = {"direto": "Equivalente direto na stack-alvo", "reimpl": "Exige reimplementação"}


# ── Tokenização e classificação de linhas ────────────────────────────────────────────────────────

def file_text(rel):
    text = (ROOT / rel).read_bytes().decode("cp1252", errors="replace")
    return text[:-1] if text.endswith("\n") else text


def line_kinds(text):
    """Classificação por linha física idêntica a contagem_delphi5.classify_pascal: 'c', 'm' ou 'b'."""
    kinds = []
    state = None
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
                j = line.find("'", i + 1)
                has_code, i = True, (n if j < 0 else j + 1)
            else:
                has_code, i = True, i + 1
        kinds.append("c" if has_code else "m" if has_comment else "b")
    return kinds


def tokenize(text):
    """Tokens (linha, texto em minúsculas): identificadores e pontuação; sem comentários, strings e números."""
    toks, line = [], 0
    for m in TOKEN_RE.finditer(text):
        s = m.group(0)
        c = s[0]
        if c == "\n":
            line += 1
        elif c in "{/(" and (s.startswith(("{", "//", "(*"))):
            line += s.count("\n")
        elif c == "'" or c == "#" or c == "$" or c.isdigit():
            continue
        else:
            toks.append((line, s.lower()))
    return toks


DFM_CLASS_RE = re.compile(r"^\s*(?:object|inherited|inline)\s+(?:\w+\s*:\s*)?(\w+)", re.I | re.M)
DFM_VALUE_RE = re.compile(r"^\s*[\w.]+\s*=\s*([A-Za-z_][\w.]*)\s*$", re.M)


def dfm_idents(text):
    """Referências de um .dfm: classes dos componentes e valores identificadores (handlers, DataSource...)."""
    out = {m.group(1).lower() for m in DFM_CLASS_RE.finditer(text)}
    for m in DFM_VALUE_RE.finditer(text):
        v = m.group(1).lower()
        if v not in ("true", "false"):
            out.update(v.split("."))
    return out


# ── Parser de units Pascal em segmentos ──────────────────────────────────────────────────────────

class Unit:
    """Uma unit .pas dividida em segmentos. owner[linha] = índice do segmento ou -1 (estrutura)."""

    def __init__(self, rel):
        self.rel = rel
        text = file_text(rel)
        self.kinds = line_kinds(text)
        self.nlines = len(self.kinds) if text else 0
        self.toks = tokenize(text)
        self.segs = []  # dicts: kind routine|class, name, cls, idents, start, end, poly, props
        self.struct_idents = set()
        self.declared = set()  # nomes declarados no interface (const/var/type/rotinas)
        self.has_init = False
        self.section = "head"
        self.uses = []
        self.owner = [-1] * self.nlines
        self._parse()
        for i, s in enumerate(self.segs):  # ordem de criação: o aninhado sobrescreve o externo
            for ln in range(s["start"], min(s["end"], self.nlines - 1) + 1):
                self.owner[ln] = i
        self.by_name = {}  # rotinas sem classe e declarações de classe, por nome
        for i, s in enumerate(self.segs):
            if s["kind"] == "class" or not s["cls"]:
                self.by_name.setdefault(s["name"], []).append(i)
        self.lines = {"S": [0, 0]}
        for ln, o in enumerate(self.owner):
            k = "S" if o < 0 else o
            acc = self.lines.setdefault(k, [0, 0])
            acc[0] += 1
            acc[1] += self.kinds[ln] == "c"

    # helpers -------------------------------------------------------------------------------------
    def t(self, i):
        return self.toks[i][1] if 0 <= i < len(self.toks) else ""

    def ln(self, i):
        return self.toks[min(i, len(self.toks) - 1)][0] if self.toks else 0

    def is_type_opener(self, i):
        tok = self.t(i)
        if tok == "record":
            return True
        if tok not in ("class", "object", "interface", "dispinterface"):
            return False
        p = i - 1
        if self.t(p) == "packed":
            p -= 1
        if self.t(p) != "=":
            return False
        nxt = self.t(i + 1)
        if nxt in ("of", ";"):
            return False
        if nxt == "(":
            j = self.match_paren(i + 1)
            if self.t(j + 1) == ";":
                return False
        return True

    def match_paren(self, i):
        depth = 0
        while i < len(self.toks):
            tok = self.t(i)
            if tok == "(":
                depth += 1
            elif tok == ")":
                depth -= 1
                if depth == 0:
                    return i
            i += 1
        return len(self.toks) - 1

    def skip_block(self, i):
        """i aponta para um abridor de tipo (record/class/...). Retorna o índice do 'end' correspondente."""
        stack = []
        while i < len(self.toks):
            tok = self.t(i)
            if tok == "record" or (tok in ("class", "object", "interface", "dispinterface") and self.is_type_opener(i)):
                stack.append(tok)
            elif tok == "case" and stack and stack[-1] == "record":
                pass  # registro variante: o case não tem end próprio
            elif tok == "end":
                stack.pop()
                if not stack:
                    return i
            i += 1
        return len(self.toks) - 1

    def header_end(self, i):
        """i = após o nome da rotina. Retorna (índice após cabeçalho+diretivas, diretivas)."""
        depth, n = 0, len(self.toks)
        while i < n:
            tok = self.t(i)
            if tok == "(":
                depth += 1
            elif tok == ")":
                depth -= 1
            elif tok == ";" and depth <= 0:
                break
            i += 1
        i += 1
        dirs = set()
        while i < n and self.t(i) in DIRECTIVES:
            dirs.add(self.t(i))
            while i < n and self.t(i) != ";":
                i += 1
            i += 1
        return i, dirs

    def read_name(self, i):
        parts = [self.t(i)]
        i += 1
        while self.t(i) == "." and re.match(r"[a-z_]", self.t(i + 1)):
            parts.append(self.t(i + 1))
            i += 2
        return parts, i

    def idents(self, a, b, exclude=()):
        return {tok for _, tok in self.toks[a:b + 1] if (tok[0].isalpha() or tok[0] == "_")} - set(exclude)

    # parsing -------------------------------------------------------------------------------------
    def parse_routine(self, i, impl):
        """i aponta para 'class' ou palavra de rotina. Retorna índice seguinte."""
        start = i
        if self.t(i) == "class":
            i += 1
        i += 1
        parts, i = self.read_name(i)
        i, dirs = self.header_end(i)
        if not impl or "forward" in dirs or "external" in dirs:
            if not impl:
                self.declared.add(parts[-1])
            self.struct_idents |= self.idents(start, i - 1, exclude=parts[-1:])
            return i
        seg = {"kind": "routine", "name": parts[-1], "cls": parts[-2] if len(parts) > 1 else None,
               "start": self.ln(start), "end": None, "idents": set()}
        self.segs.append(seg)
        n = len(self.toks)
        # declarações locais (com rotinas aninhadas) até begin/asm
        while i < n and self.t(i) not in ("begin", "asm"):
            tok = self.t(i)
            if tok in ROUTINE_KW and self.t(i - 1) not in NOT_ROUTINE_PREV:
                i = self.parse_routine(i, True)
                continue
            if tok == "record" or self.is_type_opener(i):
                i = self.skip_block(i) + 1
                continue
            if tok in ("implementation", "initialization", "finalization"):
                break  # cabeçalho sem corpo (estrutura inesperada): encerra aqui
            i += 1
        if self.t(i) == "asm":
            while i < n and self.t(i) != "end":
                i += 1
        elif self.t(i) == "begin":
            depth = 0
            while i < n:
                tok = self.t(i)
                if tok in ("begin", "case", "try", "asm"):
                    depth += 1
                elif tok == "end":
                    depth -= 1
                    if depth == 0:
                        break
                i += 1
        seg["idents"] = self.idents(start, i, exclude=parts[-1:])
        if self.t(i + 1) == ";":
            i += 1
        seg["end"] = self.ln(i)
        return i + 1

    def parse_class(self, i):
        """i = abridor 'class'/'object'/'interface'. Cria segmento da declaração. Retorna índice seguinte."""
        p = i - 1
        if self.t(p) == "packed":
            p -= 1
        name = self.t(p - 1)
        start = p - 1
        end = self.skip_block(i)
        members, poly, props = set(), set(), {}
        j, n = i + 1, end
        while j < n:
            tok = self.t(j)
            if tok == "class" and self.t(j + 1) in ROUTINE_KW:
                j += 1
                continue
            if tok in ROUTINE_KW and self.t(j - 1) not in NOT_ROUTINE_PREV:
                mname = self.t(j + 1)
                members.add(mname)
                k, dirs = self.header_end(j + 2)
                if dirs & POLY:
                    poly.add(mname)
                j = k
                continue
            if tok == "property":
                pname = self.t(j + 1)
                members.add(pname)
                k, acc = j + 2, set()
                depth = 0
                while k < n:
                    tk = self.t(k)
                    if tk in ("(", "["):
                        depth += 1
                    elif tk in (")", "]"):
                        depth -= 1
                    elif tk == ";" and depth <= 0:
                        break
                    elif tk in ("read", "write", "stored") and self.t(k + 1)[:1].isalpha():
                        acc.add(self.t(k + 1))
                    k += 1
                props.setdefault(pname, set()).update(acc)
                members |= acc
                j = k + 1
                continue
            j += 1
        k = end + 1 if self.t(end + 1) == ";" else end
        self.segs.append({"kind": "class", "name": name, "cls": None, "start": self.ln(start), "end": self.ln(k),
                          "idents": self.idents(i, end, exclude=members | {name}), "poly": poly, "props": props})
        if self.section == "interface":
            self.declared.add(name)
        return k + 1

    def _parse(self):
        toks, n = self.toks, len(self.toks)
        if not n or self.t(0) != "unit":
            self.struct_idents = self.idents(0, n - 1)
            return
        section = self.section = "head"
        i = 0
        stmt_start = True
        while i < n:
            tok = self.t(i)
            if tok == "interface" and section == "head":
                section = self.section = "interface"
            elif tok == "implementation" and section in ("head", "interface"):
                section = self.section = "impl"
            elif tok in ("initialization", "finalization") or (tok == "begin" and section == "impl"):
                self.has_init = self.has_init or self.t(i + 1) not in ("end",)
                self.struct_idents |= self.idents(i, n - 1)
                break
            elif tok == "uses":
                j = i + 1
                while j < n and self.t(j) != ";":
                    if self.t(j)[:1].isalpha() and self.t(j - 1) in ("uses", ","):
                        self.uses.append(self.t(j))
                    j += 1
                i = j + 1
                stmt_start = True
                continue
            elif tok == "class" and self.t(i + 1) in ROUTINE_KW and section in ("interface", "impl"):
                i = self.parse_routine(i, section == "impl")
                stmt_start = True
                continue
            elif tok in ROUTINE_KW and self.t(i - 1) not in NOT_ROUTINE_PREV and section in ("interface", "impl"):
                i = self.parse_routine(i, section == "impl")
                stmt_start = True
                continue
            elif tok in ("class", "object", "interface", "dispinterface") and self.is_type_opener(i):
                i = self.parse_class(i)
                stmt_start = True
                continue
            elif tok == "record":
                end = self.skip_block(i)
                self.struct_idents |= self.idents(i, end)
                i = end + 1
                continue
            if stmt_start and section == "interface" and tok[:1].isalpha() and self.t(i + 1) in ("=", ":", ","):
                self.declared.add(tok)
            elif tok[:1].isalpha() or tok[:1] == "_":
                self.struct_idents.add(tok)
            stmt_start = tok in (";", "const", "var", "type", "resourcestring", "threadvar")
            i += 1


# ── Análise por programa ─────────────────────────────────────────────────────────────────────────

class Program:
    """Ponto fixo de referências de um programa, respeitando o escopo Pascal: um nome usado na unit A só
    alcança declarações da própria A (inclusive as do implementation) ou do interface das units que A lista
    em uses. Métodos e propriedades são resolvidos por nome (a classe do objeto pode vir de qualquer unit),
    mas só em classes já usadas."""

    def __init__(self, prog, units, file_unit, module_files):
        self.p = prog
        self.units = units          # rel -> Unit (cache compartilhado)
        self.file_unit = file_unit  # unit -> rel no mapa deste programa
        self.module_files = module_files
        self.ref_self, self.ref_ext, self.gref = {}, {}, set()
        self.queue = []
        self.used_units = set()
        self.used_classes = set()   # (rel, classe)
        self.used_segs = set()      # (rel, idx)
        self.reachable = set()
        self._scope = {}

    def unit(self, rel):
        if rel not in self.units:
            self.units[rel] = Unit(rel)
        return self.units[rel]

    def scope(self, src):
        if src not in self._scope:
            out = [src]
            for name in self.unit(src).uses:
                f = self.file_unit.get(name)
                if f and f not in out:
                    out.append(f)
            self._scope[src] = [f for f in out if f in self.reachable]
        return self._scope[src]

    def add(self, src, idents):
        for t in self.scope(src):
            refs = (self.ref_self if t == src else self.ref_ext).setdefault(t, set())
            for x in idents:
                if x not in refs:
                    refs.add(x)
                    self.queue.append((t, x, t == src))
        self.add_global(idents)

    def add_global(self, idents):
        for x in idents:
            if x not in self.gref:
                self.gref.add(x)
                self.queue.append((None, x, False))

    def run(self, dfm_cache):
        self.dfm_cache = dfm_cache
        seeds = [f for f in self.module_files if f.lower().endswith((".pas", ".dpr", ".dpk"))]
        # 1) alcançabilidade pelas cláusulas uses
        todo = list(seeds)
        seen = set(todo)
        while todo:
            rel = todo.pop()
            for u in self.unit(rel).uses:
                f = self.file_unit.get(u)
                if f and f not in seen:
                    seen.add(f)
                    todo.append(f)
        self.reachable = seen - set(self.module_files)
        # índices: métodos por nome e por classe (a implementação fica na unit da declaração da classe)
        self.meth, self.cls_methods, self.props = {}, {}, {}
        for rel in self.reachable:
            u = self.unit(rel)
            for idx, s in enumerate(u.segs):
                if s["kind"] == "class":
                    for pname, acc in s["props"].items():
                        self.props.setdefault(pname, []).append(((rel, s["name"]), acc))
                elif s["cls"]:
                    self.meth.setdefault(s["name"], []).append((rel, idx))
                    self.cls_methods.setdefault((rel, s["cls"]), []).append((rel, idx))
        # 2) sementes: todos os fontes da pasta do módulo (mesmo recorte do PFC-26)
        for rel in self.module_files:
            if rel.lower().endswith(".dfm"):
                pas = c26.sibling(INDEX, rel, ".pas")
                if pas and pas in self.module_files:
                    self.add(pas, dfm_cache(rel))
                else:
                    self.add_global(dfm_cache(rel))
            else:
                u = self.unit(rel)
                self.add(rel, u.idents(0, len(u.toks) - 1))
        for rel in sorted(self.reachable):  # initialization/finalization executam na carga
            if self.unit(rel).has_init:
                self.use_unit(rel)
        # 3) ponto fixo
        while self.queue:
            t, x, is_self = self.queue.pop()
            if t is None:
                for key in self.meth.get(x, ()):
                    if (key[0], self.seg(key)["cls"]) in self.used_classes:
                        self.use_seg(key)
                for ckey, acc in self.props.get(x, ()):
                    if ckey in self.used_classes:
                        self.add_global(acc)
                continue
            u = self.units[t]
            visible = is_self or x in u.declared
            if not visible:
                continue
            for idx in u.by_name.get(x, ()):
                if u.segs[idx]["kind"] == "class":
                    self.use_class((t, idx))
                else:
                    self.use_seg((t, idx))
            if not is_self:
                self.use_unit(t)

    def seg(self, key):
        return self.units[key[0]].segs[key[1]]

    def use_unit(self, rel):
        if rel in self.used_units:
            return
        self.used_units.add(rel)
        self.add(rel, self.unit(rel).struct_idents)
        dfm = c26.sibling(INDEX, rel, ".dfm")
        if dfm:
            self.add(rel, self.dfm_cache(dfm))

    def use_seg(self, key):
        if key in self.used_segs:
            return
        self.used_segs.add(key)
        self.use_unit(key[0])
        self.add(key[0], self.seg(key)["idents"])

    def use_class(self, key):
        if key in self.used_segs:
            return
        s = self.seg(key)
        self.used_segs.add(key)
        ckey = (key[0], s["name"])
        self.used_classes.add(ckey)
        self.use_unit(key[0])
        self.add(key[0], s["idents"])
        for mk in self.cls_methods.get(ckey, ()):
            m = self.seg(mk)
            if m["name"] in self.gref or m["name"] in s["poly"]:
                self.use_seg(mk)
        for pname, acc in s["props"].items():
            if pname in self.gref:
                self.add_global(acc)


INDEX = None


def analyze():
    global INDEX
    res = c26.consolidate()
    INDEX = c26.build_path_index()
    units, dfm_store = {}, {}

    def dfm_cache(rel):
        if rel not in dfm_store:
            data = (ROOT / rel).read_bytes()
            dfm_store[rel] = set() if c18.confirm(ROOT / rel, data) else dfm_idents(data.decode("cp1252", "replace"))
        return dfm_store[rel]

    module_files = {m["key"]: [f["path"] for f in m["files"]] for m in res["modules"]}
    runs = {}
    for p in res["programs"]:
        fmap = {}
        for pname, info in p["closure"].items():
            if not info["own"]:
                continue
            base = posixpath.dirname(info["dpk"])
            for unit, path in info["contains"]:
                rel = c26.resolve(INDEX, base, path) if path else None
                if rel and rel.lower().endswith(".pas"):
                    fmap.setdefault(unit, rel)
        for unit, (rel, _) in p["exe_units"].items():
            fmap.setdefault(unit, rel)
        for rel in sorted(module_files[p["key"]]):
            if rel.lower().endswith(".pas"):
                fmap.setdefault(posixpath.splitext(posixpath.basename(rel))[0].lower(), rel)
        prog = Program(p, units, fmap, module_files[p["key"]])
        prog.run(dfm_cache)
        runs[p["key"]] = prog
    return res, runs, units


# ── Agregação ────────────────────────────────────────────────────────────────────────────────────


def aggregate(res, runs, units):
    """Uma linha por dependência com linhas no PFC-26 (31). Linhas efetivas por módulo e na união dos três."""
    deps = []
    for g in res["deps"]:
        if not g["files"]:
            continue
        lbl = g["name"] if g["kind"] == "pkg" else g["folder"]
        d = {"label": lbl, "kind": g["kind"], "folder": g["folder"], "users": g["users"],
             "total": sum(f["total"] for f in g["files"]), "code": sum(f["code"] for f in g["files"]),
             "n": len(g["files"]), "units": 0, "routines": 0,
             "ref_units": {k: 0 for k in KEYS}, "ref_routines": {k: 0 for k in KEYS},
             "eff": {k: [0, 0] for k in KEYS + ["all"]}, "groups": {}, "files": []}
        any_unit = {k: False for k in KEYS}
        pas = [f for f in g["files"] if f["ext"] == ".pas"]
        others = [f for f in g["files"] if f["ext"] != ".pas"]
        d["units"] = len(pas)
        for f in pas:
            u = units.get(f["path"]) or Unit(f["path"])
            units[f["path"]] = u
            if u.nlines != f["total"] or sum(k == "c" for k in u.kinds) != f["code"]:
                raise SystemExit(f"linhas divergentes do PFC-26 em {f['path']}")
            d["routines"] += sum(1 for s in u.segs if s["kind"] == "routine")
            used = {}
            for k in KEYS:
                r = runs[k]
                if f["path"] in r.used_units:
                    any_unit[k] = True
                    d["ref_units"][k] += 1
                    used[k] = {i for i in range(len(u.segs)) if (f["path"], i) in r.used_segs}
                    d["ref_routines"][k] += sum(1 for i in used[k] if u.segs[i]["kind"] == "routine")
            if used:
                used["all"] = set().union(*used.values())
            groups = {}  # PFC-46: linhas únicas por conjunto de módulos que as usam (segmentos são disjuntos)
            if used:
                add_group(groups, tuple(k for k in KEYS if k in used), u.lines["S"])
                for i in used["all"]:
                    if i in u.lines:
                        add_group(groups, tuple(k for k in KEYS if i in used.get(k, ())), u.lines[i])
            eff = {}
            for k, idx in used.items():
                lines = list(u.lines["S"])
                for i in idx:
                    if i in u.lines:
                        lines[0] += u.lines[i][0]
                        lines[1] += u.lines[i][1]
                eff[k] = lines
            d["files"].append({"path": f["path"], "total": f["total"], "code": f["code"], "eff": eff, "groups": groups,
                               "routines": sum(1 for s in u.segs if s["kind"] == "routine"),
                               "ref": len([i for i in used.get("all", ()) if u.segs[i]["kind"] == "routine"])})
        for f in others:
            if f["ext"] == ".dfm":  # o .dfm acompanha a sua unit
                pas_rel = c26.sibling(INDEX, f["path"], ".pas")
                flags = {k: pas_rel in runs[k].used_units for k in KEYS}
            else:  # .dpk: entra se alguma unit do pacote é usada pelo módulo
                flags = dict(any_unit)
            eff = {k: [f["total"], f["code"]] for k in KEYS if flags[k]}
            groups = {}
            if eff:
                eff["all"] = [f["total"], f["code"]]
                add_group(groups, tuple(k for k in KEYS if flags[k]), eff["all"])
            d["files"].append({"path": f["path"], "total": f["total"], "code": f["code"], "eff": eff, "groups": groups,
                               "routines": 0, "ref": 0})
        for f in d["files"]:
            for k, (t, c) in f["eff"].items():
                d["eff"][k][0] += t
                d["eff"][k][1] += c
            for g, tc in f["groups"].items():
                add_group(d["groups"], g, tc)
        d["category"], d["why"] = READINESS.get(lbl, ("?", ""))
        deps.append(d)
    return deps


KEYS = ["contribuicao", "folha", "beneficioprev"]
NOMES = ["CONTRIBUIÇÃO", "FOLHA", "BENEFICIOPREV"]


def add_group(groups, key, lines):
    """Soma [total, código] no grupo `key` (tupla dos módulos, na ordem de KEYS, que usam essas linhas)."""
    if not key or not (lines[0] or lines[1]):
        return
    acc = groups.setdefault(key, [0, 0])
    acc[0] += lines[0]
    acc[1] += lines[1]


def sums(deps):
    """Linhas atuais × efetivas por módulo e no total (sem dupla contagem)."""
    out = []
    for k, nome in zip(KEYS, NOMES):
        sel = [d for d in deps if nome in d["users"]]
        out.append((nome, sum(d["total"] for d in sel), sum(d["code"] for d in sel),
                    sum(d["eff"][k][0] for d in deps), sum(d["eff"][k][1] for d in deps)))
    out.append(("Total dos três módulos (cada linha uma única vez)", sum(d["total"] for d in deps),
                sum(d["code"] for d in deps), sum(d["eff"]["all"][0] for d in deps),
                sum(d["eff"]["all"][1] for d in deps)))
    return out


def by_category(deps):
    cats = {}
    for c in CATEGORY:
        sel = [d for d in deps if d["category"] == c]
        cats[c] = {"n": len(sel), "total": sum(d["total"] for d in sel),
                   **{k: sum(d["eff"][k][0] for d in sel) for k in KEYS + ["all"]},
                   "code": sum(d["eff"]["all"][1] for d in sel)}
    return cats


def validate(deps, modules):
    errors = []
    if len(deps) != 31:
        errors.append(f"esperadas 31 dependências com linhas; encontradas {len(deps)}")
    tot, code, n = (sum(d[x] for d in deps) for x in ("total", "code", "n"))
    if (tot, code, n) != (BASELINE["total"], BASELINE["code"], BASELINE["n"]):
        errors.append(f"linha de base divergente do PFC-26: {tot}/{code}/{n}")
    mod = [sum(f[x] for m in modules for f in m["files"]) for x in ("total", "code")]
    mod_n = sum(len(m["files"]) for m in modules)
    if (mod[0] + tot, mod[1] + code, mod_n + n) != (BASELINE_ALL["total"], BASELINE_ALL["code"], BASELINE_ALL["n"]):
        errors.append("totais consolidados do PFC-26 divergentes")
    for d in deps:
        for k in KEYS + ["all"]:
            if d["eff"][k][0] > d["total"] or d["eff"][k][1] > d["code"]:
                errors.append(f"{d['label']}: linhas efetivas maiores que as totais ({k})")
        for k, nome in zip(KEYS, NOMES):
            if d["eff"][k][0] > d["eff"]["all"][0]:
                errors.append(f"{d['label']}: módulo {nome} maior que a união")
            if d["eff"][k][0] and nome not in d["users"]:
                errors.append(f"{d['label']}: uso efetivo por {nome}, que não consta em 'Usado por'")
        if d["category"] not in CATEGORY:
            errors.append(f"{d['label']}: sem classificação de prontidão")
    cats = by_category(deps)
    if sum(c["all"] for c in cats.values()) != sum(d["eff"]["all"][0] for d in deps):
        errors.append("soma das categorias de prontidão difere do total efetivo")
    return errors


# ── Saídas ───────────────────────────────────────────────────────────────────────────────────────

def fmt(n):
    return c18.fmt(n)


def pct(a, b):
    return (f"{100 * a / b:.1f}".replace(".", ",") + "%") if b else "—"


def cell_eff(d, k, nome):
    return fmt(d["eff"][k][0]) if nome in d["users"] else "—"


def cell_ref(d, k, nome):
    return f"{fmt(d['ref_units'][k])} / {fmt(d['ref_routines'][k])}" if nome in d["users"] else "—"


def top_files(d, n=10):
    files = [f for f in d["files"] if f["path"].lower().endswith(".pas")]
    used = sorted((f for f in files if "all" in f["eff"]), key=lambda f: -f["eff"]["all"][0])
    unused = [f for f in files if "all" not in f["eff"]]
    return used[:n], used, unused


def render_md(res, runs, deps):
    S = sums(deps)
    tot = S[-1]
    cats = by_category(deps)
    mods = {m["nome"]: sum(f["total"] for f in m["files"]) for m in res["modules"]}
    mods_code = {m["nome"]: sum(f["code"] for f in m["files"]) for m in res["modules"]}
    mod_t, mod_c = sum(mods.values()), sum(mods_code.values())
    zero = [g for g in res["deps"] if not g["files"]]
    o = []
    w = o.append
    w("# Análise de linhas de dependências — uso efetivo pelos módulos (PFC-44)")
    w("")
    w("> PFC-44 · Gerado por `docs/tools/uso_efetivo_dependencias.py` — não editar manualmente.")
    w("> Para regenerar: `python3 -B docs/tools/uso_efetivo_dependencias.py --write` (também atualiza a seção")
    w("> “Linhas de Código” de `docs1/visao-geral/inventario.html` e `docs1/index.html`, que desde o PFC-45 mostra só o código a migrar).")
    w("> Linha de base: contagem PFC-26 (`docs/tools/contagem_docs1.py`), arquivos de dependência inteiros — usada só neste estudo.")
    w("")
    w("## 1. Resultado")
    w("")
    w(f"A cifra de **{fmt(BASELINE['total'])} linhas totais / {fmt(BASELINE['code'])} linhas de código** de dependências "
      "compartilhadas soma o conteúdo integral de cada arquivo de dependência. Considerando apenas as rotinas, classes e units "
      "efetivamente referenciadas por CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV, as dependências somam "
      f"**{fmt(tot[3])} linhas totais / {fmt(tot[4])} linhas de código** — {pct(tot[3], tot[1])} e {pct(tot[4], tot[2])} "
      f"da cifra atual. **{fmt(tot[1] - tot[3])} linhas totais ({fmt(tot[2] - tot[4])} de código) não são usadas pelos três módulos** "
      "e não precisam ser migradas.")
    w("")
    w("### 1.1 Por módulo e total (AC2)")
    w("")
    w("| Parcela | Linhas totais atuais | Linhas efetivas | Delta (não utilizadas) | % efetivo | Linhas de código atuais | Código efetivo | Delta de código | % efetivo (código) |")
    w("|---|---:|---:|---:|---:|---:|---:|---:|---:|")
    for nome, t, c, et, ec in S:
        b = "**" if nome.startswith("Total") else ""
        w(f"| {b}{nome}{b} | {b}{fmt(t)}{b} | {b}{fmt(et)}{b} | {b}{fmt(t - et)}{b} | {b}{pct(et, t)}{b} | "
          f"{b}{fmt(c)}{b} | {b}{fmt(ec)}{b} | {b}{fmt(c - ec)}{b} | {b}{pct(ec, c)}{b} |")
    w("")
    w("* *Linhas atuais por módulo* = soma das dependências que têm o módulo na coluna “Usado por” do inventário PFC-26. "
      "*Total* = as 31 dependências, cada arquivo uma única vez (= 1.632.702 / 1.363.291 do PFC-26).")
    w("* A soma das três linhas de módulo é maior que o total porque a maior parte das dependências é compartilhada; "
      "no total, uma linha usada por mais de um módulo entra uma única vez.")
    w(f"* Efeito no tamanho de migração (visão PFC-44): pastas dos módulos {fmt(mod_t)} linhas ({fmt(mod_c)} de código) + "
      f"dependências efetivas {fmt(tot[3])} ({fmt(tot[4])}) = **{fmt(mod_t + tot[3])} linhas totais / {fmt(mod_c + tot[4])} "
      f"linhas de código**, contra {fmt(BASELINE_ALL['total'])} / {fmt(BASELINE_ALL['code'])} do total consolidado PFC-26. "
      f"Os totais consolidados do PFC-26 ({fmt(BASELINE_ALL['total'])} / {fmt(BASELINE_ALL['code'])} / {fmt(BASELINE_ALL['n'])} "
      "arquivos) continuam válidos como inventário AS-IS e não foram alterados.")
    w("")
    w("### 1.2 Dependências de maior peso")
    w("")
    for lbl in ("CMAdmPrev", "CmCapCarUtilObj50"):
        d = next(x for x in deps if x["label"] == lbl)
        top, used, unused = top_files(d)
        w(f"**`{lbl}`** ({', '.join(d['users'])}) — {fmt(d['total'])} linhas totais; efetivas {fmt(d['eff']['all'][0])} "
          f"({pct(d['eff']['all'][0], d['total'])}). {len(used)} de {d['units']} units são usadas; as {len(unused)} units não "
          f"alcançadas somam {fmt(sum(f['total'] for f in unused))} linhas (sem contar os .dfm).")
        w("")
        w("| Unit mais usada | Linhas totais | Rotinas (existentes / referenciadas) | Linhas efetivas |")
        w("|---|---:|---:|---:|")
        for f in top:
            w(f"| `{f['path']}` | {fmt(f['total'])} | {fmt(f['routines'])} / {fmt(f['ref'])} | {fmt(f['eff']['all'][0])} |")
        w("")
    w("Em `CMAdmPrev` a redução é pequena porque o pacote é o núcleo de negócio dos três programas: os menus principais "
      "(`FPrincipal.pas` de cada módulo) abrem diretamente a maior parte dos seus formulários (por exemplo, "
      "`AbrirFormModal(frmRetroativoPrev, TfrmRetroativoPrev)` em `BENEFICIOPREV/Fontes/FPrincipal.pas`), e um formulário aberto "
      "leva junto o seu `.dfm` e todos os seus handlers de evento. Em `CmCapCarUtilObj50` a redução é grande: o pacote entra no "
      "programa CONTRIBUIÇÃO pela cláusula `requires`, mas o código do módulo só alcança poucas units dele.")
    w("")
    w("## 2. Uso efetivo por dependência (AC1)")
    w("")
    w("Units / rotinas: units = arquivos `.pas` contados; rotinas = procedures, functions, constructors e destructors "
      "implementados (inclusive métodos e rotinas aninhadas). “—” = o módulo não usa a dependência segundo o PFC-26.")
    w("")
    w("| # | Dependência | Usado por | Linhas totais atuais | Linhas de código atuais | Units / rotinas existentes | "
      "Units / rotinas ref. CONTRIBUIÇÃO | Units / rotinas ref. FOLHA | Units / rotinas ref. BENEFICIOPREV | "
      "Linhas efetivas CONTRIBUIÇÃO | Linhas efetivas FOLHA | Linhas efetivas BENEFICIOPREV | Linhas efetivas (3 módulos) | "
      "Código efetivo (3 módulos) | % efetivo |")
    w("|---:|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    for i, d in enumerate(deps, 1):
        w(f"| {i} | `{d['label']}` | {', '.join(d['users'])} | {fmt(d['total'])} | {fmt(d['code'])} | "
          f"{fmt(d['units'])} / {fmt(d['routines'])} | "
          + " | ".join(cell_ref(d, k, n) for k, n in zip(KEYS, NOMES)) + " | "
          + " | ".join(cell_eff(d, k, n) for k, n in zip(KEYS, NOMES))
          + f" | {fmt(d['eff']['all'][0])} | {fmt(d['eff']['all'][1])} | {pct(d['eff']['all'][0], d['total'])} |")
    tu, tr = sum(d["units"] for d in deps), sum(d["routines"] for d in deps)
    w(f"| | **Total** | | **{fmt(tot[1])}** | **{fmt(tot[2])}** | **{fmt(tu)} / {fmt(tr)}** | "
      + " | ".join(f"**{fmt(sum(d['ref_units'][k] for d in deps))} / {fmt(sum(d['ref_routines'][k] for d in deps))}**" for k in KEYS)
      + " | " + " | ".join(f"**{fmt(x[3])}**" for x in S[:3])
      + f" | **{fmt(tot[3])}** | **{fmt(tot[4])}** | **{pct(tot[3], tot[1])}** |")
    w("")
    w(f"As outras {len(zero)} linhas da tabela de dependências do PFC-26 ("
      + ", ".join(f"`{g['name']}`" for g in zero)
      + ") têm 0 linhas adicionais porque os seus fontes ficam dentro da pasta FOLHA e já são contados na linha do módulo; "
      "por isso o estudo cobre as 31 dependências com linhas.")
    w("")
    w("## 3. Prontidão para migração (AC5)")
    w("")
    w("Classificação por dependência das units/rotinas efetivamente usadas, frente à stack-alvo **.NET 10 + React 19 + Oracle 23ai**:")
    w("")
    w(f"* **{CATEGORY['direto']}** — a stack-alvo já oferece o recurso (componentes React, ASP.NET Core, EF Core/ODP.NET, "
      "`System.Security.Cryptography`, `System.IO.Compression`, bibliotecas de relatório/expressões). O código Delphi usado é "
      "substituído por configuração/uso da biblioteca, não traduzido linha a linha.")
    w(f"* **{CATEGORY['reimpl']}** — regra de negócio ou integração própria FUNCEF/CM (previdência, contribuição, folha, "
      "contábil, financeiro, integração bancária, IRRF, motor de regras, workflow RAD) que precisa ser reescrita em C#/React.")
    w("")
    w("| Categoria | Dependências | Linhas efetivas CONTRIBUIÇÃO | Linhas efetivas FOLHA | Linhas efetivas BENEFICIOPREV | "
      "Linhas efetivas (3 módulos) | Código efetivo (3 módulos) | % do efetivo |")
    w("|---|---:|---:|---:|---:|---:|---:|---:|")
    for c, v in cats.items():
        w(f"| {CATEGORY[c]} | {v['n']} | {fmt(v['contribuicao'])} | {fmt(v['folha'])} | {fmt(v['beneficioprev'])} | "
          f"{fmt(v['all'])} | {fmt(v['code'])} | {pct(v['all'], tot[3])} |")
    w(f"| **Total** | **{len(deps)}** | **{fmt(S[0][3])}** | **{fmt(S[1][3])}** | **{fmt(S[2][3])}** | **{fmt(tot[3])}** | "
      f"**{fmt(tot[4])}** | **100,0%** |")
    w("")
    w("| Dependência | Categoria | Equivalente / destino na stack-alvo | Linhas efetivas (3 módulos) | Código efetivo |")
    w("|---|---|---|---:|---:|")
    for d in sorted(deps, key=lambda x: (x["category"] != "reimpl", -x["eff"]["all"][0])):
        w(f"| `{d['label']}` | {CATEGORY[d['category']]} | {d['why']} | {fmt(d['eff']['all'][0])} | {fmt(d['eff']['all'][1])} |")
    w("")
    w("A classificação é um juízo de arquitetura por dependência (o conteúdo de cada pacote foi verificado pelos nomes e pela "
      "natureza das suas units). Dependências “equivalente direto” ainda exigem configuração e testes; dependências "
      "“reimplementação” podem conter partes de UI que serão refeitas com componentes React — o número indica o volume de código "
      "Delphi a ser lido e reescrito, não o tamanho final em C#.")
    w("")
    w("## 4. Escopo")
    w("")
    w("* **Mesmo recorte do PFC-26**: os 1.724 arquivos das 31 dependências (pacotes de runtime próprios da lista `Packages=` "
      "do `.dof` + `requires` recursivo, e units compiladas no executável via `.dpr`/`SearchPath`), com as mesmas linhas por "
      "arquivo. A ferramenta reconfere arquivo a arquivo que linhas totais e de código são idênticas às do PFC-26.")
    w("* Contam-se apenas `.pas`, `.dfm`, `.dpr`, `.dpk`. Ficam fora DFM binário, cópias/backups, duplicatas de conteúdo, "
      "`.dof`/`.cfg`/`.res`, VCL/RTL da Borland, componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, "
      "TeeChart, Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL) e packages/procedures Oracle.")
    w("* As pastas inteiras `CONTRIBUICAOPREV/`, `FOLHA/` e `BENEFICIOPREV/` (mesmo recorte do PFC-26) são o ponto de partida "
      "das referências; as linhas dos módulos não mudam neste estudo.")
    w("")
    w("## 5. Método (AC4)")
    w("")
    w("Regra de negócio da issue: um arquivo de dependência com 1.000 linhas e 20 funções, do qual os módulos usam 5 funções, "
      "contribui com as linhas dessas 5 funções (mais a estrutura mínima da unit), não com as 1.000. A detecção é por análise "
      "estática dos fontes, sem compilar:")
    w("")
    w("1. **Segmentação de cada unit.** Cada `.pas` é tokenizado (comentários e strings removidos; os dois ramos de "
      "`{$IFDEF}` entram) e dividido em segmentos com as suas linhas físicas: (a) cada rotina implementada — procedure, function, "
      "constructor ou destructor, incluindo métodos `TClasse.Metodo` e rotinas aninhadas, do cabeçalho ao `end;` do corpo; "
      "(b) cada declaração de classe/objeto/interface (`TX = class … end;`); (c) a *estrutura da unit* — cabeçalho, cláusulas "
      "`uses`, `const`/`var`/`type` soltos, declarações do `interface`, comentários entre rotinas e "
      "`initialization`/`finalization`. Toda linha pertence a exatamente um segmento.")
    w("2. **Units alcançáveis por módulo.** A partir de todos os `.pas`/`.dpr`/`.dpk` da pasta do módulo, seguem-se as cláusulas "
      "`uses` (interface e implementation) de forma transitiva. Cada nome de unit é resolvido com o mesmo mapa do PFC-26 para o "
      "programa (`ContribuicaoPREV.dpr`, `Folha.dpr`, `BeneficioPrev.dpr`): units da cláusula `contains` dos pacotes próprios "
      "do fechamento do `.dof` e units do `.dpr`/`SearchPath`. Units de terceiros não são seguidas. Uma unit não alcançável "
      "contribui com 0 linhas.")
    w("3. **Referências (ponto fixo).** Sementes: os identificadores de todos os fontes do módulo e, nos `.dfm`, as classes dos "
      "componentes (`object X: TCMDBEdit`) e os valores identificadores (handlers `OnClick = …`, `DataSource = …`). Respeita-se o "
      "escopo do Pascal: um nome usado na unit A só alcança declarações da própria A ou do `interface` das units que A lista em "
      "`uses`. Um segmento passa a ser usado quando:")
    w("   * rotina sem classe: o seu nome é referenciado no escopo;")
    w("   * declaração de classe: o nome da classe é referenciado no escopo;")
    w("   * método: a classe é usada e o nome do método é referenciado (chamada `obj.Metodo`, handler no `.dfm`, acessor "
      "`read`/`write` de propriedade referenciada) **ou** o método é `virtual`/`override`/`dynamic`/`abstract`/`message` "
      "(chamado polimorficamente pelo framework);")
    w("   * qualquer nome do `interface` da unit referenciado por outra unit torna a unit usada (estrutura incluída).")
    w("   Os identificadores de cada segmento usado (inclusive da estrutura da unit e do seu `.dfm`) entram nas referências, e o "
      "processo se repete até não haver segmento novo. Units com `initialization`/`finalization` alcançáveis são usadas desde o "
      "início (o código roda na carga do programa e costuma registrar classes com `RegisterClass`).")
    w("4. **Linhas efetivas.** Por arquivo: linhas dos segmentos usados + estrutura da unit, quando a unit é usada. O `.dfm` entra "
      "inteiro quando a sua unit é usada (o formulário precisa do layout completo); o `.dpk` entra quando alguma unit do pacote é "
      "usada. Linhas de código efetivas seguem a mesma classificação de linha do PFC-18 (código/comentário/vazia).")
    w("5. **Agregação.** Por módulo, somam-se as linhas efetivas do módulo; no total, uma linha usada por qualquer dos três "
      "módulos entra uma única vez. Validações automáticas: 31 dependências; linha de base igual ao PFC-26; linhas por arquivo "
      "idênticas ao PFC-26; efetivas ≤ totais em toda dependência; nenhum uso efetivo por módulo fora do “Usado por”; soma das "
      "categorias de prontidão = total efetivo.")
    w("")
    w("## 6. Limitações")
    w("")
    w("* **Resultado conservador (limite superior do uso).** A resolução de métodos é por nome: um método `Executar` de uma classe "
      "usada conta como usado se qualquer código usado chamar algum `Executar`. Todos os métodos virtuais de uma classe usada, "
      "todos os handlers de um formulário usado e o `.dfm` inteiro entram. Partes de um formulário usado que nunca são acionadas "
      "na prática (botões ocultos, abas desativadas) contam como usadas.")
    w("* As pastas inteiras dos módulos são sementes (mesmo recorte do PFC-26), inclusive fontes que não são compilados no "
      "`.exe`; isso também tende a aumentar o uso efetivo.")
    w("* Referências dinâmicas por texto (`FindClass('TX')`, `GetProcAddress`, nomes de métodos em strings, RTTI) não são vistas; "
      "o caso mais comum no Delphi 5 — `RegisterClass` em `initialization` — é coberto porque essas seções entram sempre.")
    w("* Rotinas declaradas em `{$IFDEF}` inativos entram (os dois ramos são analisados).")
    w("* A classificação de prontidão (seção 3) é um juízo por dependência; dentro de uma dependência pode haver partes das duas "
      "categorias.")
    w("* Packages/procedures Oracle seguem fora (não são fonte Delphi), como no PFC-26.")
    w("")
    w("## 7. Como reproduzir")
    w("")
    w("```bash")
    w("python3 -B docs/tools/uso_efetivo_dependencias.py           # imprime o resumo e valida")
    w("python3 -B docs/tools/uso_efetivo_dependencias.py --write   # regenera este estudo e a seção do inventário")
    w("python3 -B docs/tools/uso_efetivo_dependencias.py --check   # falha se este arquivo ou o inventário estiverem desatualizados")
    w("```")
    return "\n".join(o) + "\n"


def esc(s):
    return html.escape(s)


def row(cells, strong=False):
    return c18.row(cells, strong)


def migration(res, deps):
    """Linhas de código a migrar (PFC-45): módulos (pastas inteiras) + parte usada das dependências diretas."""
    mods = {m["nome"]: c26.totals(m["files"]) for m in res["modules"]}
    used = [d for d in deps if d["eff"]["all"][0] > 0]
    dep = {"total": sum(d["eff"]["all"][0] for d in used), "code": sum(d["eff"]["all"][1] for d in used)}
    mod = {k: sum(mods[n][k] for n in ORDER) for k in ("total", "code")}
    total = {k: mod[k] + dep[k] for k in ("total", "code")}
    per_mod = {n: sum(d["eff"][k][0] for d in used) for k, n in zip(KEYS, NOMES)}
    unused = [d["label"] for d in deps if d["eff"]["all"][0] == 0]
    inside = [g["name"] for g in res["deps"] if not g["files"]]
    return {"mods": mods, "mod": mod, "used": used, "dep": dep, "total": total, "per_mod": per_mod,
            "unused": unused, "inside": inside, "share": sharing(used)}


def sharing(used):
    """PFC-46: linhas únicas das dependências usadas, separadas pela quantidade de módulos que as usam.
    Cada linha usada entra em exatamente um grupo; a soma dos grupos é o total usado (sem dupla contagem)."""
    groups = {}
    for d in used:
        for g, tc in d["groups"].items():
            add_group(groups, g, tc)
    key = dict(zip(NOMES, KEYS))

    def tot(sel):
        return {"total": sum(v[0] for g, v in groups.items() if sel(g)),
                "code": sum(v[1] for g, v in groups.items() if sel(g))}
    only = {n: tot(lambda g, k=key[n]: g == (k,)) for n in ORDER}
    pairs = []
    for i, a in enumerate(ORDER):
        for b in ORDER[i + 1:]:
            pk = {key[a], key[b]}
            pairs.append(((a, b), tot(lambda g, pk=pk: len(g) == 2 and set(g) == pk)))
    two = tot(lambda g: len(g) == 2)
    three = tot(lambda g: len(g) == 3)
    unique = tot(lambda g: True)
    per_mod = {n: {"total": sum(d["eff"][key[n]][0] for d in used), "code": sum(d["eff"][key[n]][1] for d in used)}
               for n in ORDER}
    col_sum = {k: sum(per_mod[n][k] for n in ORDER) for k in ("total", "code")}
    repeated = {k: col_sum[k] - unique[k] for k in ("total", "code")}
    return {"groups": groups, "only": only, "pairs": pairs, "two": two, "three": three, "unique": unique,
            "per_mod": per_mod, "col_sum": col_sum, "repeated": repeated}


def validate_migration(M):
    errors = []
    for k in ("total", "code"):
        rows = sum(M["mods"][n][k] for n in ORDER) + M["dep"][k]
        if rows != M["total"][k]:
            errors.append(f"PFC-45: linhas da tabela ({k}) não somam o total a migrar: {rows} != {M['total'][k]}")
        idx = 0 if k == "total" else 1
        if sum(d["eff"]["all"][idx] for d in M["used"]) != M["dep"][k]:
            errors.append(f"PFC-45: dependências listadas ({k}) não somam a linha de dependências usadas")
    if any(d["eff"]["all"][0] <= 0 for d in M["used"]):
        errors.append("PFC-45: dependência sem linha usada listada")
    # PFC-46: linhas únicas por grupo de uso
    S = M["share"]
    key = dict(zip(NOMES, KEYS))
    for k in ("total", "code"):
        rows = sum(S["only"][n][k] for n in ORDER) + S["two"][k] + S["three"][k]
        if rows != S["unique"][k] or S["unique"][k] != M["dep"][k]:
            errors.append(f"PFC-46: linhas únicas ({k}) não somam o total das dependências usadas: "
                          f"{rows} / {S['unique'][k]} != {M['dep'][k]}")
        if sum(p[1][k] for p in S["pairs"]) != S["two"][k]:
            errors.append(f"PFC-46: pares de módulos ({k}) não somam a linha de dois módulos")
        for n in ORDER:
            mine = sum(v[0 if k == "total" else 1] for g, v in S["groups"].items() if key[n] in g)
            if mine != S["per_mod"][n][k]:
                errors.append(f"PFC-46: grupos com {n} ({k}) = {mine} != linhas usadas por {n} = {S['per_mod'][n][k]}")
        if S["repeated"][k] != S["two"][k] + 2 * S["three"][k]:
            errors.append(f"PFC-46: linhas repetidas ({k}) não conciliam com os grupos")
    for d in M["used"]:
        for i in (0, 1):
            if sum(v[i] for v in d["groups"].values()) != d["eff"]["all"][i]:
                errors.append(f"PFC-46: {d['label']}: grupos não somam a união dos três módulos")
    return errors


def summary_table(M):
    o = ['<div class="table-wrap"><table><thead><tr><th>Parcela</th><th>Linhas totais</th><th>Linhas de código</th></tr></thead><tbody>']
    for n in ORDER:
        o.append(c26.module_row(n, M["mods"][n]))
    o.append(row([f"Dependências diretas — só a parte usada pelos três módulos ({len(M['used'])} dependências)",
                  fmt(M["dep"]["total"]), fmt(M["dep"]["code"])]))
    o.append(row(["Total a migrar", fmt(M["total"]["total"]), fmt(M["total"]["code"])], strong=True))
    o.append("</tbody></table></div>")
    return "\n".join(o)


def unique_table(M):
    """PFC-46: linhas únicas das dependências usadas, por quem as usa, com a conciliação com as colunas por módulo."""
    S = M["share"]
    o = [f'<h3 id="linhas-unicas-dependencias" style="margin-top:1.5rem">Linhas únicas das dependências por quem as usa ({len(M["used"])} dependências)</h3>',
         '<div class="table-wrap"><table><thead><tr><th>Parcela</th><th>Linhas totais</th><th>Linhas de código</th></tr></thead><tbody>']
    for n in ORDER:
        o.append(row([f"Usadas só pela {n}" if n != "BENEFICIOPREV" else f"Usadas só pelo {n}",
                      fmt(S["only"][n]["total"]), fmt(S["only"][n]["code"])]))
    o.append(row(["Compartilhadas por exatamente dois módulos", fmt(S["two"]["total"]), fmt(S["two"]["code"])]))
    o.append(row(["Compartilhadas pelos três módulos", fmt(S["three"]["total"]), fmt(S["three"]["code"])]))
    o.append(row(["Total de linhas únicas das dependências", fmt(S["unique"]["total"]), fmt(S["unique"]["code"])], strong=True))
    o.append("</tbody></table></div>")
    pairs = "; ".join(f"{a} + {b}: {fmt(v['total'])} linhas ({fmt(v['code'])} de código)" for (a, b), v in S["pairs"])
    cols = " + ".join(fmt(S["per_mod"][n]["total"]) for n in ORDER)
    cols_c = " + ".join(fmt(S["per_mod"][n]["code"]) for n in ORDER)
    o.append('<div class="note-info">Cada linha usada das dependências entra em um único grupo, conforme os módulos que a usam; '
             f'o total de linhas únicas é o mesmo da linha “Dependências diretas — só a parte usada pelos três módulos” '
             f'({fmt(M["dep"]["total"])} linhas, {fmt(M["dep"]["code"])} de código). '
             f'<strong>Conciliação:</strong> a soma das colunas por módulo do quadro anterior ({cols} = {fmt(S["col_sum"]["total"])} linhas; '
             f'{cols_c} = {fmt(S["col_sum"]["code"])} linhas de código) menos o total de linhas únicas dá '
             f'<strong>{fmt(S["repeated"]["total"])} linhas ({fmt(S["repeated"]["code"])} de código) que aparecem repetidas entre os módulos</strong>: '
             'cada linha compartilhada por dois módulos aparece uma vez a mais e cada linha compartilhada pelos três aparece duas vezes a mais '
             f'({fmt(S["two"]["total"])} + 2 × {fmt(S["three"]["total"])} = {fmt(S["repeated"]["total"])}). '
             f'Detalhe das linhas compartilhadas por dois módulos — {pairs}. '
             '<span class="ev ev-comprovado">COMPROVADO</span>: gerado e conferido por <code>docs/tools/uso_efetivo_dependencias.py</code>.</div>')
    return "\n".join(o)


def stats(M):
    def card(n, label):
        return f'  <div class="stat"><div class="n">{n}</div><div class="l">{label}</div></div>'
    return "\n".join([
        '<div class="stats">',
        card(fmt(M["total"]["total"]), f'<strong>Total a migrar</strong> — linhas ({fmt(M["total"]["code"])} de código)'),
        card(fmt(M["mod"]["total"]), f'FOLHA + CONTRIBUIÇÃO + BENEFICIOPREV — linhas ({fmt(M["mod"]["code"])} de código)'),
        card(fmt(M["dep"]["total"]), f'Parte usada das dependências diretas — linhas ({fmt(M["dep"]["code"])} de código)'),
        '</div>',
    ])


def render_html(res, deps):
    M = migration(res, deps)
    o = [BEGIN, '<section id="linhas-de-codigo"><div class="section-title">🧮 Linhas de Código a Migrar</div>']
    o.append(stats(M))
    o.append('<p style="margin-top:1rem">Tamanho do código Delphi 5 a migrar: as pastas dos três módulos e, das dependências diretas '
             '(pacotes e units CM/FUNCEF fora dessas pastas), <strong>só a parte que os módulos usam</strong>. '
             'Cada linha entra uma única vez no total. <span class="ev ev-comprovado">COMPROVADO</span>: valores gerados e conferidos por '
             '<code>docs/tools/uso_efetivo_dependencias.py</code>.</p>')
    o.append(summary_table(M))
    o.append(f'<h3 id="uso-efetivo-dependencias" style="margin-top:1.5rem">Linhas usadas por dependência ({len(M["used"])} dependências)</h3>')
    o.append('<div class="table-wrap"><table><thead><tr><th>Dependência</th>'
             + "".join(f"<th>Linhas usadas — {n}</th>" for n in ORDER)
             + '<th>Linhas usadas (3 módulos)</th><th>Linhas de código usadas</th></tr></thead><tbody>')
    key = dict(zip(NOMES, KEYS))
    for d in sorted(M["used"], key=lambda x: (-x["eff"]["all"][0], x["label"].lower())):
        o.append(row([f"<code>{esc(d['label'])}</code>"]
                     + [fmt(d["eff"][key[n]][0]) if d["eff"][key[n]][0] else "—" for n in ORDER]
                     + [fmt(d["eff"]["all"][0]), fmt(d["eff"]["all"][1])]))
    o.append(row(["Total (cada linha uma única vez)"] + [fmt(M["per_mod"][n]) for n in ORDER]
                 + [fmt(M["dep"]["total"]), fmt(M["dep"]["code"])], strong=True))
    o.append("</tbody></table></div>")
    o.append('<div class="note-info">Quase todas as dependências são compartilhadas: a mesma linha pode ser usada por mais de um módulo. '
             'Por isso a soma das colunas por módulo é maior que o total; o número que entra no total a migrar é a coluna '
             f'“Linhas usadas (3 módulos)”, {fmt(M["dep"]["total"])} linhas. “—” = o módulo não usa a dependência. '
             f'Não aparecem: {", ".join(f"<code>{esc(x)}</code>" for x in M["unused"])} (nenhuma linha usada) e '
             f'{", ".join(f"<code>{esc(x)}</code>" for x in M["inside"])} (ficam dentro da pasta FOLHA e já estão na linha FOLHA).</div>')
    o.append(unique_table(M))
    o.append('<p><strong>Critério da contagem:</strong> linhas físicas (código + comentários + linhas vazias) dos fontes Delphi 5 '
             '<code>.pas</code>, <code>.dfm</code>, <code>.dpr</code> e <code>.dpk</code>, com as regras do PFC-18 (sem DFM binário, cópias, backups e duplicatas); '
             '“linhas de código” exclui comentários e linhas vazias. Módulos = pastas inteiras <code>FOLHA/</code>, <code>CONTRIBUICAOPREV/</code> e '
             '<code>BENEFICIOPREV/</code>. Dependências diretas = pacotes de runtime próprios (lista <code>Packages=</code> do <code>.dof</code> + <code>requires</code>) '
             'e units compiladas no executável fora dessas pastas; delas entram só as rotinas, classes e estrutura das units referenciadas pelos módulos '
             '(o <code>.dfm</code> acompanha a sua unit), por análise estática conservadora (limite superior). VCL/Borland e componentes de terceiros ficam fora.</p>')
    o.append('<p class="desc"><strong>Como recontar:</strong> <code>python3 -B docs/tools/uso_efetivo_dependencias.py --write</code> regenera esta seção e a da '
             '<a href="../index.html#linhas-de-codigo">página inicial</a>; <code>--check</code> nesse script e em <code>docs/tools/contagem_docs1.py</code> falha se os números '
             'publicados forem diferentes da recontagem. Método detalhado em <code>Analise_linhas_dependencias.md</code> (raiz do repositório).</p>')
    o.append("</section>")
    o.append(END)
    return "\n".join(o) + "\n"


def render_index(res, deps):
    M = migration(res, deps)
    o = [BEGIN, '<section id="linhas-de-codigo"><div class="section-title">🧮 Linhas de Código a Migrar</div>']
    o.append(stats(M))
    o.append(summary_table(M))
    o.append('<p class="desc">Pastas dos três módulos + só a parte das dependências diretas (pacotes CM/FUNCEF) que os módulos usam, '
             'cada linha uma única vez; exclui VCL/Borland e componentes de terceiros. Linhas usadas por dependência e critério de contagem: '
             '<a href="visao-geral/inventario.html#linhas-de-codigo">Inventário de Artefatos → Linhas de Código</a>.</p>')
    o.append("</section>")
    o.append(END)
    return "\n".join(o) + "\n"


def splice(page, fragment, anchor):
    """Coloca a seção PFC-45 no lugar da seção atual ou das antigas PFC-26/PFC-44 (que são removidas)."""
    blocks = [(BEGIN, END)] + LEGACY
    pos = None
    for b, e in blocks:
        while b in page:
            s = page.index(b)
            t = page.index(e, s) + len(e)
            if page[t:t + 1] == "\n":
                t += 1
            page = page[:s] + page[t:]
            pos = s if pos is None else min(pos, s)
    if pos is None:
        if page.count(anchor) != 1:
            raise SystemExit(f"âncora {anchor!r} não encontrada de forma única")
        pos = page.index(anchor)
    return page[:pos] + fragment + page[pos:]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    res, runs, units = analyze()
    deps = aggregate(res, runs, units)
    errors = validate(deps, res["modules"])
    M = migration(res, deps)
    errors += validate_migration(M)
    for nome, t, c, et, ec in sums(deps):
        print(f"{nome}: atual={t} efetivo={et} delta={t - et} ({pct(et, t)}) | código atual={c} efetivo={ec} delta={c - ec}")
    for d in deps:
        print(f"  {d['label']:<26} total={d['total']:>7} efetivo={d['eff']['all'][0]:>7} "
              + " ".join(f"{k}={d['eff'][k][0]}" for k in KEYS) + f" [{d['category']}]")
    S = M["share"]
    print("PFC-46 — linhas únicas das dependências: "
          + " ".join(f"só {n}={S['only'][n]['total']}/{S['only'][n]['code']}" for n in ORDER)
          + f" dois={S['two']['total']}/{S['two']['code']} três={S['three']['total']}/{S['three']['code']}"
          f" total={S['unique']['total']}/{S['unique']['code']} repetidas={S['repeated']['total']}/{S['repeated']['code']}")
    print(f"PFC-45 — a migrar: módulos={M['mod']['total']}/{M['mod']['code']} dependências usadas "
          f"({len(M['used'])})={M['dep']['total']}/{M['dep']['code']} total={M['total']['total']}/{M['total']['code']}")
    outputs = {STUDY: render_md(res, runs, deps)}
    for rel, frag in ((PAGE, render_html(res, deps)), (INDEX_PAGE, render_index(res, deps))):
        outputs[rel] = splice((ROOT / rel).read_text(encoding="utf-8"), frag, ANCHORS[rel])
    stale = []
    for rel, content in outputs.items():
        path = ROOT / rel
        current = path.read_text(encoding="utf-8") if path.exists() else None
        if current != content:
            if args.write:
                path.write_text(content, encoding="utf-8")
                print(f"atualizado: {rel}")
            else:
                stale.append(rel)
    if errors:
        print("ERROS DE VALIDAÇÃO:\n  " + "\n  ".join(errors))
        return 1
    print("Validação OK: 31 dependências; linha de base = PFC-26; linhas por arquivo idênticas ao PFC-26; "
          "efetivas ≤ totais; soma das categorias = total efetivo; tabela a migrar = soma das linhas (PFC-45); linhas únicas por grupo de uso = total usado (PFC-46).")
    if args.check and stale:
        print("Arquivos desatualizados: " + ", ".join(stale))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
