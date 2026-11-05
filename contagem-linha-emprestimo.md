# Contagem de Linhas de Código Migráveis — FUNCEF.WebEmprestimo

> **Issue:** [PFC-20](https://stefaninisophiedelivery.atlassian.net/browse/PFC-20)
> **Data da análise:** 2026-10-13 21:16:27
> **Pasta-alvo:** `/workspace/repo/FUNCEF.WebEmprestimo`

## 1. Resumo executivo

| Métrica | Valor |
|---|---|
| **Total de linhas efetivas de código** | **134,382** |
| **Total de arquivos contados** | **759** |
| **Extensões incluídas** | .cs, .aspx, .ascx, .asax, .master, .cshtml, .js, .ts, .css, .html, .sql |
| **Arquivos minificados excluídos** | 11 |
| **Arquivos de classificação incerta** | 8 |

## 2. Confirmação de escopo

A análise foi restrita **exclusivamente** à pasta `/workspace/repo/FUNCEF.WebEmprestimo` e seus subdiretórios. Nenhuma pasta fora de `FUNCEF.WebEmprestimo` foi analisada, percorrida ou incluída no total. Links simbólicos não foram seguidos (`followlinks=False`).

O projeto foi confirmado como **.NET Framework 4.8**: 18 projetos(s) com `<TargetFrameworkVersion>v4.8</TargetFrameworkVersion>` e 1 projeto legado com `v4.6` (FUNCEF.WebEmprestimo.Web), totalizando 19 projetos .NET na solução.

## 3. Extensões encontradas vs. incluídas

### Extensões incluídas na contagem

| Extensão | Descrição |
|---|---|
| `.cs` | Código C# |
| `.aspx` | ASP.NET Web Forms (páginas) |
| `.ascx` | ASP.NET Web Forms (controles de usuário) |
| `.asax` | ASP.NET Global Application Class |
| `.master` | ASP.NET Master Page |
| `.cshtml` | Razor MVC View |
| `.js` | JavaScript |
| `.ts` | TypeScript |
| `.css` | CSS (folhas de estilo) |
| `.html` | HTML |
| `.sql` | Scripts SQL |

### Todas as extensões encontradas na pasta-alvo

`.ascx, .ashx, .asmx, .aspx, .backup, .bat, .config, .cs, .csproj, .css, .datasource, .disco, .dll, .gif, .htm, .jpg, .js, .json, .map, .master, .md, .png, .ps1, .pubxml, .rdlc, .sitemap, .sln, .sql, .svc, .svcinfo, .svcmap, .ts, .txt, .wsdl, .xsc, .xsd, .xss`

### Extensões encontradas mas **não incluídas** (não-código ou fora do escopo)

`.ashx, .asmx, .backup, .bat, .config, .csproj, .datasource, .disco, .dll, .gif, .htm, .jpg, .json, .map, .md, .png, .ps1, .pubxml, .rdlc, .sitemap, .sln, .svc, .svcinfo, .svcmap, .txt, .wsdl, .xsc, .xsd, .xss`

## 4. Contagem por extensão

| Extensão | Arquivos | Linhas efetivas |
|---|---:|---:|
| `.cs` | 537 | 94,392 |
| `.aspx` | 76 | 13,534 |
| `.ascx` | 1 | 254 |
| `.asax` | 0 | 0 |
| `.master` | 1 | 38 |
| `.cshtml` | 0 | 0 |
| `.js` | 15 | 22,296 |
| `.ts` | 1 | 108 |
| `.css` | 20 | 996 |
| `.html` | 0 | 0 |
| `.sql` | 108 | 2,764 |
| **TOTAL** | **759** | **134,382** |

## 5. Exclusões aplicadas

### 5.1 Diretórios excluídos

| Diretório | Motivo |
|---|---|
| `bin` | Artefatos de build compilados |
| `obj` | Artefatos temporários de build |
| `packages` | Pacotes NuGet restaurados |
| `.git` | Metadados de controle de versão |
| `node_modules` | Dependências Node.js |

> **Nota:** No momento da análise, nenhum destes diretórios foi encontrado dentro de `FUNCEF.WebEmprestimo`. A exclusão foi aplicada preventivamente.

### 5.2 Arquivos minificados excluídos

**11 arquivo(s) minificado(s) excluído(s):**

- `FUNCEF.WebEmprestimo.Web/CssDinamico/jquery-ui.min.css`
- `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-1.10.2.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.slim.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-ui.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/popper.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper.min.js`

### 5.3 Arquivos não-código excluídos (por extensão)

Arquivos com extensões não listadas na seção 3 foram automaticamente excluídos (configuração, documentação, recursos, imagens, fontes, binários, etc.).

## 6. Método utilizado

A contagem foi realizada por um script Python (`count_lines_emprestimo.py`) que:

1. Percorre **exclusivamente** a pasta `FUNCEF.WebEmprestimo` e seus subdiretórios, sem seguir links simbólicos.
2. Poda diretórios excluídos (`bin`, `obj`, `packages`, `.git`, `node_modules`).
3. Exclui arquivos minificados (`*.min.js`, `*.min.css`).
4. Seleciona apenas arquivos com extensões incluídas.
5. Para cada arquivo, conta **linhas efetivas de código**, desconsiderando:
   - Linhas em branco
   - Linhas compostas exclusivamente por comentários
   - Linhas dentro de blocos de comentário multi-linha
6. Linhas que contêm código **e** comentário simultaneamente são contadas como código.

### Sintaxe de comentários por linguagem

| Linguagem | Extensões | Comentário de linha | Comentário de bloco |
|---|---|---|---|
| C# / JavaScript / TypeScript | `.cs`, `.js`, `.ts` | `//` | `/* */` |
| CSS | `.css` | — | `/* */` |
| SQL | `.sql` | `--` | `/* */` |
| ASP.NET Web Forms | `.aspx`, `.ascx`, `.asax`, `.master` | — | `<%-- --%>`, `<!-- -->` |
| Razor | `.cshtml` | — | `@* *@`, `<!-- -->` |
| HTML | `.html` | — | `<!-- -->` |

## 7. Arquivos de classificação incerta

Arquivos cuja classificação como "passível de migração" é incerta (extensão não listada explicitamente, mas potencialmente migrável). Estes arquivos **não foram incluídos no total** e são listados abaixo para revisão.

| Extensão | Quantidade | Motivo da incerteza |
|---|---:|---|
| `.ashx` | 1 | ASP.NET Generic Handler; não listado nas extensões incluídas |
| `.asmx` | 1 | ASP.NET Web Service; não listado nas extensões incluídas |
| `.htm` | 2 | Extensão `.htm` (variante de `.html`); não listada explicitamente |
| `.master` | 4 | Extensão `.Master` (maiúscula) em filesystem case-sensitive; equivalente a `.master` |

### Lista detalhada

**.ashx** (1 arquivo(s)):

- `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/Progresso.ashx`

**.asmx** (1 arquivo(s)):

- `FUNCEF.WebEmprestimo.Conector/ConectorWeb.asmx`

**.htm** (2 arquivo(s)):

- `FUNCEF.WebEmprestimo.Web/Paginas/Erros/AcessoNegado.htm`
- `FUNCEF.WebEmprestimo.Web/SqlServerTypes/readme.htm`

**.master** (4 arquivo(s)):

- `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/DialogoMestre.Master`
- `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/Erro.Master`
- `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/Mestre.Master`
- `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/VisualizacaoMestre.Master`

## 8. Limitações encontradas

1. **Strings verbatim C# (`@"..."`)**: Strings verbatim que ocupam múltiplas linhas podem ter linhas intermediárias contadas como código (limitação do parser).
2. **Template literals JavaScript/TypeScript (`` `...` ``)**: Template literals multi-linha podem ter linhas intermediárias contadas como código.
3. **Código C# embutido em `.aspx`/`.ascx`/`.master`**: Comentários `//` e `/* */` dentro de blocos `<script runat="server">` em arquivos de markup não são tratados como comentários (apenas `<%-- --%>` e `<!-- -->` são reconhecidos).
4. **Diretivas de pré-processador C# (`#if`, `#region`, etc.)**: Contadas como código (são instruções funcionais do compilador).
5. **Arquivos `.Master` (maiúscula)**: Em filesystems case-sensitive (Linux), `.Master` ≠ `.master`. Estes arquivos foram listados como classificação incerta.
6. **Encoding**: Arquivos lidos com encoding UTF-8; caracteres inválidos são substituídos (errors=replace).

## 9. Confirmação dos critérios de aceitação

| AC | Descrição | Status |
|---|---|---|
| AC1 | Relatório com total de linhas, arquivos e tabela por extensão | OK |
| AC2 | Exclusão de diretórios gerados e arquivos minificados listada | OK |
| AC3 | Linhas em branco e comentários excluídas; código+comentário contado | OK |
| AC4 | Confirmação de escopo, método, extensões e limitações | OK |
| AC5 | Arquivos de classificação incerta listados separadamente | OK |

---

*Relatório gerado automaticamente em 2026-10-13 21:16:27*
