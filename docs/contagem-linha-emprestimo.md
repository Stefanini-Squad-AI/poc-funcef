# Contagem de linhas de código migráveis — FUNCEF.WebEmprestimo (.NET Framework 4.8)

> PFC-20 · Gerado por `docs/tools/contagem_dotnet48_emprestimo.py` — não editar manualmente.
> Para regenerar: `python3 -B docs/tools/contagem_dotnet48_emprestimo.py --write`.
> Caminhos de arquivo são relativos a `FUNCEF.WebEmprestimo/`. Detalhe por arquivo em `docs/contagem-linha-emprestimo.csv`.

## 1. Resultado

| Métrica | Valor |
|---|---:|
| **Total de linhas efetivas de código** | **83.431** |
| **Arquivos contados** | **604** |
| Linhas físicas desses arquivos | 117.025 |
| Linhas só de comentário (desconsideradas) | 17.491 |
| Linhas em branco (desconsideradas) | 16.103 |

### 1.1 Tabela por extensão

| Extensão | Arquivos | Linhas de código | Comentário | Em branco | Linhas físicas |
|---|---:|---:|---:|---:|---:|
| `.cs` | 415 | 66.351 | 16.421 | 14.434 | 97.206 |
| `.aspx` | 74 | 12.824 | 859 | 905 | 14.588 |
| `.ascx` | 1 | 254 | 6 | 5 | 265 |
| `.asax` | 0 | 0 | 0 | 0 | 0 |
| `.master` | 5 | 333 | 5 | 12 | 350 |
| `.cshtml` | 0 | 0 | 0 | 0 | 0 |
| `.js` | 2 | 948 | 165 | 214 | 1.327 |
| `.ts` | 0 | 0 | 0 | 0 | 0 |
| `.css` | 1 | 18 | 0 | 4 | 22 |
| `.html` | 0 | 0 | 0 | 0 | 0 |
| `.sql` | 106 | 2.703 | 35 | 529 | 3.267 |
| **Total** | **604** | **83.431** | **17.491** | **16.103** | **117.025** |

### 1.2 Distribuição por projeto (arquivos contados)

| Projeto | Arquivos | Linhas de código |
|---|---:|---:|
| `FUNCEF.Planus.WebEmprestimo.Web` | 178 | 38.102 |
| `FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos` | 124 | 23.815 |
| `FUNCEF.Planus.WebEmprestimo.Negocio` | 159 | 9.433 |
| `FUNCEF.Planus.WebEmprestimo.Tipos` | 83 | 5.368 |
| `FUNCEF.Planus.WebEmprestimo.Servicos.Objetos` | 6 | 1.684 |
| `FUNCEF.Planus.WebEmprestimo.Conector` | 6 | 1.428 |
| `FUNCEF.Planus.WebEmprestimo.Servicos` | 7 | 936 |
| `FUNCEF.Planus.WebEmprestimo.AcessoDados` | 19 | 788 |
| `FUNCEF.Planus.WebEmprestimo.ObjetosNegocio` | 3 | 720 |
| `FUNCEF.Planus.WebEmprestimo.Web.Componentes` | 8 | 570 |
| `FUNCEF.Planus.WebEmprestimo.Web.Proxies` | 8 | 549 |
| `FUNCEF.WebEmprestimo.Bibliotecas` | 1 | 15 |
| `FUNCEF.Planus.WebEmprestimo.Testes` | 1 | 15 |
| `FUNCEF.Planus.WebEmprestimo.ServicosWeb` | 1 | 8 |

> O arquivo `AssemblyInfoComum.cs` é compartilhado por vários projetos (`..\AssemblyInfoComum.cs`) e é contado uma única vez, atribuído ao primeiro projeto que o referencia.

## 2. Escopo e confirmação da pasta-base

- **Pasta-base analisada:** `FUNCEF.WebEmprestimo/` (e somente seus subdiretórios).
- **Versão do .NET:** 19 arquivos `.csproj` na pasta — 18 em `v4.8`, 1 em `v4.6`.
  - `FUNCEF.WebEmprestimo.Web/FUNCEF.Planus.WebEmprestimoOLD.Web.csproj` declara `v4.6` (projeto legado, fora da solução).
- **Solução de referência:** `FUNCEF.WebEmprestimo/FUNCEF.WebEmprestimo.sln` — 14 projetos dentro da pasta-alvo usados para decidir o que é código ativo.
- **Links simbólicos:** 0 encontrados; não seguidos.
- **Confirmação:** nenhuma pasta fora de `FUNCEF.WebEmprestimo/` foi lida, analisada ou incluída no total. O script percorre apenas a pasta-alvo (`os.walk` sem seguir links) e valida que cada arquivo resolvido está dentro dela. Código .NET 10, Delphi 5 e demais pastas do repositório não foram considerados.
- A `.sln` referencia 9 projetos **fora** da pasta-alvo; foram registrados e **não** analisados:
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.AcessoDados/FUNCEF.Planus.GlobalWeb.AcessoDados.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.AcessoDados.Objetos/FUNCEF.Planus.GlobalWeb.AcessoDados.Objetos.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.Cliente/FUNCEF.Planus.GlobalWeb.Cliente.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.Servicos/FUNCEF.Planus.GlobalWeb.Servicos.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.Tipos/FUNCEF.Planus.GlobalWeb.Tipos.csproj`
  - `../FUNCEF.Planus/FUNCEF.Planus.Componentes/FUNCEF.Planus.Componentes.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.Web.Componentes/FUNCEF.Planus.GlobalWeb.Web.Componentes.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.Web.IU/FUNCEF.Planus.GlobalWeb.Web.IU.csproj`
  - `../FUNCEF.GlobalWeb/FUNCEF.GlobalWeb.ServicosGlobalWeb/FUNCEF.Planus.GlobalWeb.ServicosGlobalWeb.csproj`

## 3. Extensões encontradas × incluídas

| Extensão | Arquivos encontrados | Incluída? | Observação |
|---|---:|---|---|
| `.cs` | 537 | Sim | Código-fonte (lista autorizada) |
| `.sql` | 108 | Sim | Código-fonte (lista autorizada) |
| `.png` | 97 | Não | imagem |
| `.aspx` | 76 | Sim | Código-fonte (lista autorizada) |
| `.dll` | 34 | Não | binário |
| `.gif` | 26 | Não | imagem |
| `.js` | 25 | Sim | Código-fonte (lista autorizada); 10 minificado(s) excluído(s) |
| `.css` | 21 | Sim | Código-fonte (lista autorizada); 1 minificado(s) excluído(s) |
| `.config` | 20 | Não | configuração |
| `.csproj` | 19 | Não | solução/projeto |
| `.gitignore` | 16 | Não | controle de versão |
| `.rdlc` | 16 | Não | definição de relatório (XML) |
| `.map` | 14 | Não | source map gerado |
| `.datasource` | 13 | Não | metadado do Visual Studio |
| `.xsd` | 12 | Não | esquema XML / DataSet |
| `.pubxml` | 10 | Não | configuração (perfil de publicação) |
| `.md` | 9 | Não | documentação |
| `.xsc` | 8 | Não | layout do designer de DataSet |
| `.xss` | 8 | Não | layout do designer de DataSet |
| `.bat` | 6 | Não | script de instalação/ambiente |
| `.txt` | 6 | Não | documentação/anotação |
| `.master` | 5 | Sim | Código-fonte (lista autorizada) |
| `.ps1` | 4 | Não | script de diagnóstico/ambiente |
| `.svc` | 4 | Não | Contém código, mas não está na lista autorizada — ver §7 |
| `.svcinfo` | 4 | Não | metadado de Service Reference |
| `.htm` | 2 | Não | Contém código, mas não está na lista autorizada — ver §7 |
| `.jpg` | 2 | Não | imagem |
| `.svcmap` | 2 | Não | metadado de Service Reference |
| `.wsdl` | 2 | Não | contrato WCF gerado |
| `.ascx` | 1 | Sim | Código-fonte (lista autorizada) |
| `.ashx` | 1 | Não | Contém código, mas não está na lista autorizada — ver §7 |
| `.asmx` | 1 | Não | Contém código, mas não está na lista autorizada — ver §7 |
| `.backup` | 1 | Não | cópia de segurança |
| `.disco` | 1 | Não | contrato WCF gerado |
| `.json` | 1 | Não | configuração |
| `.sitemap` | 1 | Não | mapa do site (XML) |
| `.sln` | 1 | Não | solução/projeto |
| `.ts` | 1 | Sim | Código-fonte (lista autorizada) |

Extensões da lista autorizada **não encontradas** na pasta: `.asax`, `.cshtml`, `.html`.

## 4. Exclusões aplicadas

| Exclusão | Regra | Ocorrências |
|---|---|---:|
| Diretório `bin/` | Artefato gerado / dependência | 0 |
| Diretório `obj/` | Artefato gerado / dependência | 0 |
| Diretório `packages/` | Artefato gerado / dependência | 0 |
| Diretório `.git/` | Artefato gerado / dependência | 0 |
| Diretório `node_modules/` | Artefato gerado / dependência | 0 |
| Arquivos `*.min.js` / `*.min.css` | Minificados | 11 |
| Extensões não autorizadas | Configuração, documentação, recursos, imagens, binários etc. (§3) | 341 |
| Links simbólicos | Não seguidos | 0 |
| Classificação incerta | Listados à parte, fora do total (§5) | 159 |

Arquivos minificados excluídos:

- `FUNCEF.WebEmprestimo.Web/CssDinamico/jquery-ui.min.css`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-1.10.2.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.slim.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/jquery-ui.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/popper.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper-utils.min.js`
- `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper.min.js`

## 5. Arquivos de classificação incerta (fora do total)

Arquivos com extensão autorizada cuja condição de *passível de migração* é duvidosa. Não entram no total da §1; se forem considerados migráveis, some as linhas abaixo.

| Motivo | Por que é incerto | Arquivos | Linhas de código |
|---|---|---:|---:|
| `fora-da-solucao` | Não é compilado/publicado pela solução ativa (testes avulsos, cópias, versões antigas); pode ser código morto. | 37 | 12.013 |
| `terceiros` | Não é código da FUNCEF; numa migração é substituído por versão/pacote atualizado, não reescrito. | 33 | 22.431 |
| `gerado` | Recriado pela ferramenta (designer Web Forms, proxies WCF/Service Reference, DataSets); o esforço é regenerar/substituir, não migrar linha a linha. | 89 | 16.533 |
| **Total incerto** | | **159** | **50.977** |

Total contado + incerto (cenário máximo): **763 arquivos / 134.408 linhas de código**.

### 5.1 `fora-da-solucao` — Não referenciado por nenhum projeto da solução FUNCEF.WebEmprestimo.sln

| Arquivo | Linhas de código | Detalhe |
|---|---:|---|
| `DemonstrativoQryValorAtualizado.cs` | 7 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `ExemploCorrecaoAcessoInadimplencia.cs` | 99 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `ExemploSolucaoOracle.cs` | 124 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `FUNCEF.WebEmprestimo.AcessoDados.Objetos/Scripts/Procedures/PR_EMP_REGRA_26433.sql` | 33 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.AcessoDados.Objetos/Scripts/Procedures/PR_EMP_REGRA_26761.sql` | 28 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoAmortizacao.cs` | 64 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoBeneficiario.cs` | 76 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoConcessao.cs` | 817 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoContrato.cs` | 2.600 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoHistorico.cs` | 1.499 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoHistoricoSuspensao.cs` | 182 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoMoeda.cs` | 44 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoMutuario.cs` | 1.438 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoQuitacao.cs` | 262 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoRegra.cs` | 2.883 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoTipoContrato.cs` | 308 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/AcessoTipoSuspensao.cs` | 91 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/Estado/AcessoEstado.cs` | 18 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/FabricaOracle.cs` | 64 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/ObjetoAcessoDados.cs` | 40 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Bibliotecas/FUNCEF.WebEmprestimo.AcessoDados.Objetos/Properties/AssemblyInfo.cs` | 15 | Cópia do projeto AcessoDados.Objetos dentro de Bibliotecas (fora da .sln) |
| `FUNCEF.WebEmprestimo.Tipos/RelatorioRenegociacao.cs` | 159 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Tipos/UF.cs` | 16 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/Componentes/Versao/VersaoAplicacao_.cs` | 16 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/Componentes/Versao/VersaoAplicacaoWebEmprestimo.cs` | 16 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/CRMService/CRMService.cs` | 102 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/old-Visualizacao.aspx` | 464 | Versão antiga (prefixo old-) |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/old-Visualizacao.aspx.designer.cs` | 63 | Versão antiga (prefixo old-) |
| `FUNCEF.WebEmprestimo.Web/Paginas/Quitacao/Listagem.aspx` | 74 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/Paginas/Quitacao/Listagem.aspx.cs` | 68 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/Paginas/Quitacao/Listagem.aspx.designer.cs` | 18 | Presente em disco, não incluído em nenhum .csproj da solução |
| `FUNCEF.WebEmprestimo.Web/SqlServerTypes/Loader.cs` | 31 | Presente em disco, não incluído em nenhum .csproj da solução |
| `Program.cs` | 15 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `Regra26919.cs` | 47 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `Regra26921.cs` | 34 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `TesteOracle.cs` | 150 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |
| `TesteOracleComponentes.cs` | 48 | Arquivo avulso na raiz (teste/exemplo de diagnóstico) |

### 5.2 `terceiros` — Biblioteca de terceiros copiada para o projeto

| Arquivo | Linhas de código | Detalhe |
|---|---:|---|
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery-ui.css` | 386 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.accordion.css` | 6 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.all.css` | 2 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.autocomplete.css` | 6 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.base.css` | 14 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.button.css` | 21 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.core.css` | 10 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.datepicker.css` | 51 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.dialog.css` | 12 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.menu.css` | 13 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.progressbar.css` | 2 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.resizable.css` | 11 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.selectable.css` | 1 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.slider.css` | 13 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.spinner.css` | 10 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.tabs.css` | 8 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.theme.css` | 210 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/CssDinamico/themes/base/jquery.ui.tooltip.css` | 12 | jQuery UI (tema CSS) |
| `FUNCEF.WebEmprestimo.Web/Scripts/Cores/Cores.css` | 190 | DHTMLGoodies Color Picker |
| `FUNCEF.WebEmprestimo.Web/Scripts/Cores/NucleoCores.js` | 452 | DHTMLGoodies Color Picker |
| `FUNCEF.WebEmprestimo.Web/Scripts/Cores/UtilidadesCores.js` | 141 | DHTMLGoodies Color Picker |
| `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper-utils.js` | 616 | Popper.js |
| `FUNCEF.WebEmprestimo.Web/Scripts/esm/popper.js` | 1.198 | Popper.js |
| `FUNCEF.WebEmprestimo.Web/Scripts/index.d.ts` | 108 | Popper.js (tipos TypeScript) |
| `FUNCEF.WebEmprestimo.Web/Scripts/JQuery-1.3.2.js` | 2 | jQuery |
| `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0-vsdoc.js` | 3.367 | jQuery |
| `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.js` | 6.512 | jQuery |
| `FUNCEF.WebEmprestimo.Web/Scripts/jquery-3.0.0.slim.js` | 5.116 | jQuery |
| `FUNCEF.WebEmprestimo.Web/Scripts/jquery.blockUI.js` | 424 | jQuery blockUI |
| `FUNCEF.WebEmprestimo.Web/Scripts/popper-utils.js` | 576 | Popper.js |
| `FUNCEF.WebEmprestimo.Web/Scripts/popper.js` | 1.086 | Popper.js |
| `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper-utils.js` | 651 | Popper.js |
| `FUNCEF.WebEmprestimo.Web/Scripts/umd/popper.js` | 1.204 | Popper.js |

### 5.3 `gerado` — Código gerado por ferramenta (regenerado, não migrado manualmente)

| Arquivo | Linhas de código | Detalhe |
|---|---:|---|
| `FUNCEF.WebEmprestimo.ServicosWeb/Service References/ServicoETLEnvio/Reference.cs` | 4.377 | Proxy/artefato <auto-generated> |
| `FUNCEF.WebEmprestimo.Web/Boleto/DataSetBoleto.Designer.cs` | 1.922 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Boleto/Pdf.aspx.designer.cs` | 7 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Default.aspx.designer.cs` | 4 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Login.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Logoff.aspx.designer.cs` | 5 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Cancelamento/Listagem.aspx.designer.cs` | 27 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Cancelamento/Visualizacao.aspx.designer.cs` | 72 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/ImpressaoContrato.aspx.designer.cs` | 5 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/Listagem.aspx.designer.cs` | 23 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/ListagemAvalista.aspx.designer.cs` | 20 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/ListagemNovoAvalista.aspx.designer.cs` | 22 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/ListagemPesquisarNovoAvalista.aspx.designer.cs` | 21 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/PopupAvalista.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/PopupImpressaoContrato.aspx.designer.cs` | 25 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/PopupInputRegra.aspx.designer.cs` | 12 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/PopupNovoAvalista.aspx.designer.cs` | 113 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/PopupRenegociacao.aspx.designer.cs` | 28 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/Visualizacao.aspx.designer.cs` | 139 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Envio/popUpContrato.aspx.designer.cs` | 27 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Envio/popUpEnvio.aspx.designer.cs` | 13 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Envio/Visualizacao.aspx.designer.cs` | 27 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/Listagem.aspx.designer.cs` | 27 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopupChaveMestre.aspx.designer.cs` | 10 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopupEditHistorico.aspx.designer.cs` | 51 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopupHistorico.aspx.designer.cs` | 81 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopupHistoricoCobranca.aspx.designer.cs` | 8 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopUpImpressaoContratos.aspx.designer.cs` | 10 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/PopUpObservacaoHistorico.aspx.designer.cs` | 7 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Consultas/Contratos/Visualizacao.aspx.designer.cs` | 141 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Erros/AcessoNegado.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Erros/Erro.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Erros/TokenInvalido.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Home/Default.aspx.designer.cs` | 4 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/Consultas/Listagem.aspx.designer.cs` | 25 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/Consultas/PopupHistoricoCobranca.aspx.designer.cs` | 10 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/Consultas/viewer.aspx.designer.cs` | 6 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/Consultas/Visualizacao.aspx.designer.cs` | 60 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/RelatorioDemonstrativoValorAberto/Listagem.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/RelatorioDemonstrativoValorAberto/RelDemonstrativoValorAberto.aspx.designer.cs` | 8 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Inadimplencia/RelatorioInadimplencia/Visualizacao.aspx.designer.cs` | 57 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mensagens/Confirmacao.aspx.designer.cs` | 7 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/DialogoMestre.Master.designer.cs` | 13 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/Erro.Master.designer.cs` | 11 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/FormularioMestre.master.designer.cs` | 9 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/Mestre.Master.designer.cs` | 11 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Mestre/VisualizacaoMestre.Master.designer.cs` | 13 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Popup/PopupDesconto.aspx.designer.cs` | 5 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Amortizacao/Itens.aspx.designer.cs` | 19 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Amortizacao/Listagem.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Amortizacao/Valores.aspx.designer.cs` | 18 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Amortizacao/Visualizacao.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Quitacao/ImpressaoContrato.aspx.designer.cs` | 5 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Quitacao/Itens.aspx.designer.cs` | 11 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Quitacao/Listagem.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Quitacao/Valores.aspx.designer.cs` | 17 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Transacoes/Quitacao/Visualizacao.aspx.designer.cs` | 32 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Assinatura/Edicao.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Assinatura/Listagem.aspx.designer.cs` | 19 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/ContaCorrente/Listagem.aspx.designer.cs` | 30 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/ContaCorrente/Visualizacao.aspx.designer.cs` | 37 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/Itens.aspx.designer.cs` | 37 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/Listagem.aspx.designer.cs` | 29 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/Parcelas.aspx.designer.cs` | 15 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/PopupConfirmacao.aspx.designer.cs` | 8 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/PopupMotivoAbono.aspx.designer.cs` | 8 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/Valores.aspx.designer.cs` | 11 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Individual/Visualizacao.aspx.designer.cs` | 35 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx.designer.cs` | 15 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/ModeloContrato/ImpressaoModelo.aspx.designer.cs` | 5 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/ModeloContrato/Listagem.aspx.designer.cs` | 16 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parametrizacao/Inclusao.aspx.designer.cs` | 18 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parametrizacao/Listagem.aspx.designer.cs` | 16 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parcela/Alteracao.aspx.designer.cs` | 11 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parcela/FormularioParcelas.ascx.designer.cs` | 41 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parcela/Inclusao.aspx.designer.cs` | 10 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parcela/Listagem.aspx.designer.cs` | 27 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Parcela/Visualizacao.aspx.designer.cs` | 14 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Serasa/DesfazerRemessa.aspx.designer.cs` | 17 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Paginas/Tratamentos/Serasa/Listagem.aspx.designer.cs` | 30 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Relatorio/Inadimplencia/headerRelInadimplenciaContrato.Designer.cs` | 885 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Relatorio/Inadimplencia/headerRelInadimplenciaMutuario.Designer.cs` | 737 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Relatorio/Inadimplencia/itensPrestacaoRelInadimplencia.Designer.cs` | 1.285 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Relatorio/Renegociacao/DataSetRenegociacao.Designer.cs` | 2.812 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Relatorio/Renegociacao/RenegociacaoPDF.aspx.designer.cs` | 8 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Reports/headerContrato.Designer.cs` | 811 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Reports/headerMutuario.Designer.cs` | 737 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Reports/itensPrestacao.Designer.cs` | 1.035 | Designer de página/relatório |
| `FUNCEF.WebEmprestimo.Web/Service References/ServicoAssinaturaContrato/Reference.cs` | 34 | Proxy/artefato <auto-generated> |

## 6. Método

1. **Pasta-base:** `FUNCEF.WebEmprestimo/` confirmada como projeto .NET Framework 4.8 pelos `<TargetFrameworkVersion>` dos `.csproj` (§2).
2. **Inventário:** varredura recursiva da pasta-alvo (sem seguir links simbólicos), podando `bin/`, `obj/`, `packages/`, `.git/`, `node_modules/`; levantamento de todas as extensões (§3).
3. **Código ativo:** leitura da `.sln` e dos `.csproj` dos projetos dentro da pasta-alvo; itens `Compile`, `Content`, `None` e `TypeScriptCompile` definem o que é compilado/publicado. Arquivos fora desse conjunto, bibliotecas de terceiros (identificadas pelo cabeçalho de licença) e código gerado (cabeçalho `<auto-generated>` ou `*.designer.cs`) vão para a lista de incertos (§5).
4. **Contagem por análise de conteúdo** (sem estimativa visual): analisador léxico por linguagem que marca, para cada linha física, se ela contém código e/ou comentário:
   - **C#** (`.cs` e blocos `<% %>` / `<script runat="server">`): `//`, `///`, `/* */`; strings normais, verbatim (`@""`) e interpoladas; diretivas `#region`/`#if` contam como código.
   - **JavaScript/TypeScript** (`.js`, `.ts` e `<script>` em páginas): `//`, `/* */`; strings `'`, `"`, `` ` ``; literais de regex identificados por contexto.
   - **CSS** (`.css` e `<style>`): `/* */`.  **SQL** (`.sql`, Oracle PL/SQL): `--`, `/* */`; strings `'...'`.
   - **Markup ASP.NET/HTML** (`.aspx`, `.ascx`, `.asax`, `.master`, `.html`, `.cshtml`): `<!-- -->`, `<%-- --%>`, `@* *@` (Razor); comentários condicionais do IE contam como código.
5. **Regra da linha:** linha com qualquer caractere de código (inclusive dentro de string) = código, mesmo que também tenha comentário; linha só com comentário = desconsiderada; linha vazia ou só com espaços = desconsiderada.

## 7. Limitações

- A classificação de linha é léxica, não um compilador: literais de regex em JavaScript são identificados por heurística e `%>`/`</script>` dentro de strings encerram o bloco embutido (mesmo comportamento do parser ASP.NET/HTML). O impacto esperado é de poucas linhas.
- Marcação HTML/ASP.NET é contada como código (cada linha não vazia fora de comentário); páginas Web Forms costumam ser reescritas, não convertidas linha a linha, na migração.
- Extensões com código fora da lista autorizada **não** entram no total; contagem informativa:

| Arquivo | Linhas de código |
|---|---:|
| `FUNCEF.WebEmprestimo.Conector/ConectorWeb.asmx` | 1 |
| `FUNCEF.WebEmprestimo.ServicosWeb/ServicoConcessao.svc` | 1 |
| `FUNCEF.WebEmprestimo.ServicosWeb/ServicoContrato.svc` | 1 |
| `FUNCEF.WebEmprestimo.ServicosWeb/ServicoEstado.svc` | 1 |
| `FUNCEF.WebEmprestimo.ServicosWeb/ServicoMutuario.svc` | 1 |
| `FUNCEF.WebEmprestimo.Web/Paginas/CicloNormal/Emprestimo/Progresso.ashx` | 1 |
| `FUNCEF.WebEmprestimo.Web/Paginas/Erros/AcessoNegado.htm` | 12 |
| `FUNCEF.WebEmprestimo.Web/SqlServerTypes/readme.htm` | 57 |

- `.htm` não foi tratado como `.html` porque a lista autorizada cita apenas `.html`.
- Arquivos `.rdlc`, `.xsd` e `.config` contêm lógica declarativa (relatórios, DataSets, configuração WCF) relevante para a migração, mas foram excluídos por não serem código-fonte.
- O relatório reflete o estado do repositório no momento da execução; regenere com `--write` após mudanças.
