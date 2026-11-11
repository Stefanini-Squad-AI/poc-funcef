# Análise de linhas de dependências — uso efetivo pelos módulos (PFC-44)

> PFC-44 · Gerado por `docs/tools/uso_efetivo_dependencias.py` — não editar manualmente.
> Para regenerar: `python3 -B docs/tools/uso_efetivo_dependencias.py --write` (também atualiza a seção
> “Linhas de Código” de `docs1/visao-geral/inventario.html` e `docs1/index.html`, que desde o PFC-45 mostra só o código a migrar).
> Linha de base: contagem PFC-26 (`docs/tools/contagem_docs1.py`), arquivos de dependência inteiros — usada só neste estudo.

## 1. Resultado

A cifra de **1.632.702 linhas totais / 1.363.291 linhas de código** de dependências compartilhadas soma o conteúdo integral de cada arquivo de dependência. Considerando apenas as rotinas, classes e units efetivamente referenciadas por CONTRIBUIÇÃO, FOLHA e BENEFICIOPREV, as dependências somam **1.025.183 linhas totais / 832.014 linhas de código** — 62,8% e 61,0% da cifra atual. **607.519 linhas totais (531.277 de código) não são usadas pelos três módulos** e não precisam ser migradas.

### 1.1 Por módulo e total (AC2)

| Parcela | Linhas totais atuais | Linhas efetivas | Delta (não utilizadas) | % efetivo | Linhas de código atuais | Código efetivo | Delta de código | % efetivo (código) |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| CONTRIBUIÇÃO | 1.606.815 | 682.504 | 924.311 | 42,5% | 1.345.180 | 543.344 | 801.836 | 40,4% |
| FOLHA | 1.294.588 | 448.145 | 846.443 | 34,6% | 1.054.711 | 362.895 | 691.816 | 34,4% |
| BENEFICIOPREV | 1.217.753 | 871.832 | 345.921 | 71,6% | 995.140 | 710.680 | 284.460 | 71,4% |
| **Total dos três módulos (cada linha uma única vez)** | **1.632.702** | **1.025.183** | **607.519** | **62,8%** | **1.363.291** | **832.014** | **531.277** | **61,0%** |

* *Linhas atuais por módulo* = soma das dependências que têm o módulo na coluna “Usado por” do inventário PFC-26. *Total* = as 31 dependências, cada arquivo uma única vez (= 1.632.702 / 1.363.291 do PFC-26).
* A soma das três linhas de módulo é maior que o total porque a maior parte das dependências é compartilhada; no total, uma linha usada por mais de um módulo entra uma única vez.
* Efeito no tamanho de migração (visão PFC-44): pastas dos módulos 846.900 linhas (728.384 de código) + dependências efetivas 1.025.183 (832.014) = **1.872.083 linhas totais / 1.560.398 linhas de código**, contra 2.479.602 / 2.091.675 do total consolidado PFC-26. Os totais consolidados do PFC-26 (2.479.602 / 2.091.675 / 2.531 arquivos) continuam válidos como inventário AS-IS e não foram alterados.

### 1.2 Dependências de maior peso

**`CMAdmPrev`** (CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV) — 633.562 linhas totais; efetivas 584.893 (92,3%). 173 de 199 units são usadas; as 26 units não alcançadas somam 15.689 linhas (sem contar os .dfm).

| Unit mais usada | Linhas totais | Rotinas (existentes / referenciadas) | Linhas efetivas |
|---|---:|---:|---:|
| `CM/CMADMPREV/Fontes/UBeneficio.pas` | 28.605 | 100 / 92 | 26.985 |
| `CM/CMADMPREV/Fontes/FRetroativoPrev.pas` | 23.501 | 168 / 139 | 22.019 |
| `CM/CMADMPREV/Fontes/UContribuicaoPrev.pas` | 22.378 | 84 / 72 | 21.036 |
| `CM/CMADMPREV/Fontes/FCadRequerBenefParticip.pas` | 16.660 | 138 / 130 | 16.296 |
| `CM/CMADMPREV/Fontes/FCadRequerBenefBfciario.pas` | 15.013 | 138 / 137 | 14.975 |
| `CM/CMADMPREV/Fontes/FCadDepenBenef.pas` | 13.962 | 249 / 222 | 13.268 |
| `CM/CMADMPREV/Fontes/FCadElegivel.pas` | 12.706 | 193 / 189 | 12.530 |
| `CM/CMADMPREV/Fontes/FCadRequerBenefPensionista.pas` | 9.338 | 85 / 84 | 9.301 |
| `CM/CMADMPREV/Fontes/UMovReserva.pas` | 8.378 | 44 / 36 | 7.900 |
| `CM/CMADMPREV/Fontes/FReverCotas.pas` | 6.316 | 88 / 79 | 5.953 |

**`CmCapCarUtilObj50`** (CONTRIBUIÇÃO) — 336.332 linhas totais; efetivas 7.044 (2,1%). 6 de 213 units são usadas; as 207 units não alcançadas somam 102.351 linhas (sem contar os .dfm).

| Unit mais usada | Linhas totais | Rotinas (existentes / referenciadas) | Linhas efetivas |
|---|---:|---:|---:|
| `CMCAPCARUTILOBJ50/CtrlObjects/uCtrlBaixaDocumentos.pas` | 3.234 | 26 / 17 | 2.653 |
| `CMCAPCARUTILOBJ50/CtrlObjects/uCtrlBaixaRecXPag.pas` | 788 | 9 / 7 | 634 |
| `CMCAPCARUTILOBJ50/CtrlObjects/uCtrlLancAlteradores.pas` | 586 | 12 / 11 | 553 |
| `CMCAPCARUTILOBJ50/Source/UModulo.pas` | 1.052 | 65 / 18 | 383 |
| `CMCAPCARUTILOBJ50/Source/FListaRetencoesMT.pas` | 327 | 10 / 10 | 327 |
| `CMCAPCARUTILOBJ50/Source/DCtrlDocCapCar.pas` | 29 | 0 / 0 | 29 |

Em `CMAdmPrev` a redução é pequena porque o pacote é o núcleo de negócio dos três programas: os menus principais (`FPrincipal.pas` de cada módulo) abrem diretamente a maior parte dos seus formulários (por exemplo, `AbrirFormModal(frmRetroativoPrev, TfrmRetroativoPrev)` em `BENEFICIOPREV/Fontes/FPrincipal.pas`), e um formulário aberto leva junto o seu `.dfm` e todos os seus handlers de evento. Em `CmCapCarUtilObj50` a redução é grande: o pacote entra no programa CONTRIBUIÇÃO pela cláusula `requires`, mas o código do módulo só alcança poucas units dele.

## 2. Uso efetivo por dependência (AC1)

Units / rotinas: units = arquivos `.pas` contados; rotinas = procedures, functions, constructors e destructors implementados (inclusive métodos e rotinas aninhadas). “—” = o módulo não usa a dependência segundo o PFC-26.

| # | Dependência | Usado por | Linhas totais atuais | Linhas de código atuais | Units / rotinas existentes | Units / rotinas ref. CONTRIBUIÇÃO | Units / rotinas ref. FOLHA | Units / rotinas ref. BENEFICIOPREV | Linhas efetivas CONTRIBUIÇÃO | Linhas efetivas FOLHA | Linhas efetivas BENEFICIOPREV | Linhas efetivas (3 módulos) | Código efetivo (3 módulos) | % efetivo |
|---:|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | `CMAdd50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 27.741 | 20.418 | 32 / 736 | 10 / 28 | 10 / 27 | 10 / 27 | 4.789 | 4.784 | 4.784 | 4.789 | 2.866 | 17,3% |
| 2 | `CMAdmPrev` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 633.562 | 534.600 | 199 / 3.968 | 120 / 1.794 | 58 / 465 | 143 / 2.746 | 321.245 | 104.988 | 505.961 | 584.893 | 492.295 | 92,3% |
| 3 | `CmBack50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 34.055 | 29.789 | 34 / 373 | 12 / 115 | 11 / 97 | 15 / 124 | 17.707 | 16.141 | 17.244 | 18.659 | 15.496 | 54,8% |
| 4 | `CMBussines50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2.009 | 1.588 | 3 / 127 | 0 / 0 | 0 / 0 | 0 / 0 | 0 | 0 | 0 | 0 | 0 | 0,0% |
| 5 | `CMCapCarObj50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 50.251 | 35.568 | 61 / 1.311 | 20 / 503 | 17 / 494 | 16 / 452 | 24.175 | 27.001 | 22.936 | 29.485 | 18.326 | 58,7% |
| 6 | `CmCapCarUtilObj50` | CONTRIBUIÇÃO | 336.332 | 306.906 | 213 / 2.474 | 6 / 63 | — | — | 7.044 | — | — | 7.044 | 3.667 | 2,1% |
| 7 | `CMCfinanObj50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 5.803 | 3.762 | 11 / 79 | 9 / 57 | 9 / 36 | 9 / 38 | 5.000 | 2.416 | 2.715 | 5.000 | 3.172 | 86,2% |
| 8 | `CMCompo50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 53.361 | 43.287 | 100 / 1.710 | 73 / 1.015 | 71 / 1.039 | 75 / 1.036 | 34.862 | 35.483 | 35.810 | 36.958 | 29.165 | 69,3% |
| 9 | `CMContabObj50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 15.056 | 10.679 | 22 / 617 | 14 / 235 | 14 / 239 | 14 / 237 | 8.844 | 8.982 | 8.898 | 8.986 | 5.732 | 59,7% |
| 10 | `CMCrypto` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 512 | 382 | 1 / 11 | 0 / 0 | 0 / 0 | 1 / 4 | 0 | 0 | 349 | 349 | 243 | 68,2% |
| 11 | `CMForms50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 105.413 | 89.863 | 157 / 2.172 | 98 / 1.050 | 118 / 1.478 | 99 / 1.047 | 68.388 | 86.903 | 68.353 | 87.705 | 74.932 | 83,2% |
| 12 | `CmGlobalObj50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 26.971 | 19.299 | 85 / 1.224 | 8 / 189 | 8 / 191 | 12 / 219 | 4.653 | 4.712 | 5.657 | 5.716 | 3.591 | 21,2% |
| 13 | `CMIntBancoMT50` | CONTRIBUIÇÃO, FOLHA | 54.512 | 44.808 | 64 / 587 | 0 / 0 | 24 / 332 | — | 0 | 24.110 | — | 24.110 | 17.679 | 44,2% |
| 14 | `CMIntegraEP50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 58.183 | 43.961 | 16 / 280 | 14 / 55 | 0 / 0 | 14 / 113 | 31.318 | 0 | 39.499 | 39.499 | 30.102 | 67,9% |
| 15 | `CMIRRFobj50` | FOLHA | 19.830 | 12.525 | 6 / 262 | — | 3 / 59 | — | — | 3.415 | — | 3.415 | 2.136 | 17,2% |
| 16 | `CMOld50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2.139 | 1.670 | 12 / 81 | 2 / 16 | 1 / 11 | 6 / 29 | 559 | 381 | 983 | 983 | 762 | 46,0% |
| 17 | `CmParser50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2.857 | 2.195 | 2 / 78 | 0 / 0 | 0 / 0 | 0 / 0 | 0 | 0 | 0 | 0 | 0 | 0,0% |
| 18 | `CMPlaneOrcObj50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 13.884 | 9.489 | 25 / 414 | 20 / 194 | 20 / 199 | 20 / 193 | 7.579 | 7.649 | 7.638 | 7.740 | 4.354 | 55,7% |
| 19 | `CMPrevMT50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 16.453 | 13.358 | 42 / 1.338 | 6 / 109 | 10 / 275 | 8 / 156 | 2.393 | 4.190 | 3.237 | 4.990 | 3.877 | 30,3% |
| 20 | `CMPrincipal50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 1.398 | 1.291 | 1 / 7 | 1 / 7 | 1 / 7 | 1 / 7 | 1.398 | 1.398 | 1.398 | 1.398 | 1.291 | 100,0% |
| 21 | `CMRad50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 30.720 | 26.349 | 41 / 564 | 36 / 430 | 36 / 432 | 36 / 429 | 28.690 | 28.698 | 28.686 | 28.698 | 24.732 | 93,4% |
| 22 | `CMRegra50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 30.910 | 21.466 | 10 / 336 | 10 / 308 | 10 / 308 | 10 / 310 | 30.404 | 30.447 | 30.461 | 30.497 | 21.109 | 98,7% |
| 23 | `CMRegra50MT` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 29.972 | 20.983 | 11 / 385 | 10 / 350 | 0 / 0 | 10 / 352 | 29.373 | 0 | 29.430 | 29.430 | 20.547 | 98,2% |
| 24 | `CmRelatsOld50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 1.923 | 1.741 | 7 / 26 | 0 / 0 | 1 / 3 | 0 / 0 | 0 | 331 | 0 | 331 | 281 | 17,2% |
| 25 | `CMResource50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2.232 | 1.555 | 5 / 99 | 3 / 51 | 3 / 51 | 3 / 51 | 1.307 | 1.307 | 1.307 | 1.307 | 1.031 | 58,6% |
| 26 | `CmSql50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 2.798 | 2.066 | 5 / 53 | 5 / 53 | 5 / 53 | 5 / 53 | 2.798 | 2.798 | 2.798 | 2.798 | 2.066 | 100,0% |
| 27 | `CMTotalPrev50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 49.678 | 43.390 | 14 / 263 | 12 / 218 | 10 / 210 | 12 / 222 | 48.856 | 45.231 | 48.313 | 49.067 | 42.904 | 98,8% |
| 28 | `CMWebComum50` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 14.824 | 12.086 | 27 / 414 | 0 / 0 | 1 / 0 | 4 / 37 | 0 | 383 | 1.941 | 2.020 | 1.447 | 13,6% |
| 29 | `CM/CMADMPREV/Fontes` | CONTRIBUIÇÃO, FOLHA, BENEFICIOPREV | 3.266 | 2.631 | 3 / 57 | 1 / 19 | 2 / 37 | 1 / 29 | 1.122 | 2.122 | 1.659 | 3.266 | 2.631 | 100,0% |
| 30 | `CM/CMADMPREV/Relatorios` | BENEFICIOPREV | 1.782 | 1.674 | 1 / 10 | — | — | 1 / 9 | — | — | 1.775 | 1.775 | 1.668 | 99,6% |
| 31 | `SHARED/Folhas` | FOLHA | 4.275 | 3.912 | 3 / 51 | — | 3 / 51 | — | — | 4.275 | — | 4.275 | 3.912 | 100,0% |
| | **Total** | | **1.632.702** | **1.363.291** | **1.213 / 20.107** | **490 / 6.859** | **446 / 6.094** | **525 / 7.920** | **682.504** | **448.145** | **871.832** | **1.025.183** | **832.014** | **62,8%** |

As outras 3 linhas da tabela de dependências do PFC-26 (`CMFBCOMUM50`, `CMFBOBJ50`, `CMFolhaObjMT`) têm 0 linhas adicionais porque os seus fontes ficam dentro da pasta FOLHA e já são contados na linha do módulo; por isso o estudo cobre as 31 dependências com linhas.

## 3. Prontidão para migração (AC5)

Classificação por dependência das units/rotinas efetivamente usadas, frente à stack-alvo **.NET 10 + React 19 + Oracle 23ai**:

* **Equivalente direto na stack-alvo** — a stack-alvo já oferece o recurso (componentes React, ASP.NET Core, EF Core/ODP.NET, `System.Security.Cryptography`, `System.IO.Compression`, bibliotecas de relatório/expressões). O código Delphi usado é substituído por configuração/uso da biblioteca, não traduzido linha a linha.
* **Exige reimplementação** — regra de negócio ou integração própria FUNCEF/CM (previdência, contribuição, folha, contábil, financeiro, integração bancária, IRRF, motor de regras, workflow RAD) que precisa ser reescrita em C#/React.

| Categoria | Dependências | Linhas efetivas CONTRIBUIÇÃO | Linhas efetivas FOLHA | Linhas efetivas BENEFICIOPREV | Linhas efetivas (3 módulos) | Código efetivo (3 módulos) | % do efetivo |
|---|---:|---:|---:|---:|---:|---:|---:|
| Equivalente direto na stack-alvo | 10 | 114.101 | 133.385 | 115.782 | 136.618 | 112.637 | 13,3% |
| Exige reimplementação | 21 | 568.403 | 314.760 | 756.050 | 888.565 | 719.377 | 86,7% |
| **Total** | **31** | **682.504** | **448.145** | **871.832** | **1.025.183** | **832.014** | **100,0%** |

| Dependência | Categoria | Equivalente / destino na stack-alvo | Linhas efetivas (3 módulos) | Código efetivo |
|---|---|---|---:|---:|
| `CMAdmPrev` | Exige reimplementação | Regras de administração previdenciária (cadastros, cálculos, telas de negócio) → serviços .NET 10 + telas React. | 584.893 | 492.295 |
| `CMTotalPrev50` | Exige reimplementação | Totalizações previdenciárias → serviços de cálculo .NET. | 49.067 | 42.904 |
| `CMIntegraEP50` | Exige reimplementação | Integração com Empréstimo (EMPRESTIMOBPL) → serviços/APIs .NET. | 39.499 | 30.102 |
| `CMRegra50` | Exige reimplementação | Motor de regras previdenciárias → serviço de regras .NET. | 30.497 | 21.109 |
| `CMCapCarObj50` | Exige reimplementação | Objetos de negócio de captação/carteira → serviços de domínio .NET. | 29.485 | 18.326 |
| `CMRegra50MT` | Exige reimplementação | Motor de regras (camada MTS) → serviço de regras .NET. | 29.430 | 20.547 |
| `CMRad50` | Exige reimplementação | Workflow RAD de processos, etapas e autorizações → serviço de workflow .NET. | 28.698 | 24.732 |
| `CMIntBancoMT50` | Exige reimplementação | Integração bancária (layouts CNAB, remessa/retorno) → serviços de integração .NET. | 24.110 | 17.679 |
| `CmBack50` | Exige reimplementação | Cadastros de retaguarda (plano de contas, documentos, impostos, dados bancários) → serviços de domínio .NET + telas React. | 18.659 | 15.496 |
| `CMContabObj50` | Exige reimplementação | Objetos de negócio contábeis (lançamentos, contabilização) → serviços .NET. | 8.986 | 5.732 |
| `CMPlaneOrcObj50` | Exige reimplementação | Objetos de negócio de planejamento orçamentário → serviços .NET. | 7.740 | 4.354 |
| `CmCapCarUtilObj50` | Exige reimplementação | Utilitários e objetos de negócio de captação/carteira (cálculos financeiros) → serviços .NET. | 7.044 | 3.667 |
| `CmGlobalObj50` | Exige reimplementação | Cadastros globais (cidade, estado, moeda, feriado, centro de custo, parâmetros, log de tabelas) → serviços de domínio .NET. | 5.716 | 3.591 |
| `CMCfinanObj50` | Exige reimplementação | Objetos de negócio do controle financeiro → serviços de domínio .NET. | 5.000 | 3.172 |
| `CMPrevMT50` | Exige reimplementação | Camada intermediária (MTS) previdenciária → serviços ASP.NET Core. | 4.990 | 3.877 |
| `SHARED/Folhas` | Exige reimplementação | Listas de recebedores da folha (geração individual e resultados) → serviços .NET. | 4.275 | 3.912 |
| `CMIRRFobj50` | Exige reimplementação | Cálculo de IRRF → serviço de cálculo .NET. | 3.415 | 2.136 |
| `CM/CMADMPREV/Fontes` | Exige reimplementação | Units de negócio da administração previdenciária compiladas no .exe → serviços .NET. | 3.266 | 2.631 |
| `CMWebComum50` | Exige reimplementação | Acesso web, geração de senhas e simulação de benefício do autoatendimento → serviços .NET. | 2.020 | 1.447 |
| `CM/CMADMPREV/Relatorios` | Exige reimplementação | Consulta de cargo/função (regra de seleção própria) → serviço .NET + tela React. | 1.775 | 1.668 |
| `CMBussines50` | Exige reimplementação | Classes-base de objetos de negócio CM → modelo de domínio C#. | 0 | 0 |
| `CMForms50` | Equivalente direto na stack-alvo | Framework de formulários VCL (forms-base de cadastro, login, troca de senha, autorização) → componentes/rotas React 19 e ASP.NET Core Identity. | 87.705 | 74.932 |
| `CMCompo50` | Equivalente direto na stack-alvo | Componentes visuais CM (lookups, date pickers, list views, procura, FTP, e-mail) → componentes React 19 e bibliotecas .NET. | 36.958 | 29.165 |
| `CMAdd50` | Equivalente direto na stack-alvo | Utilitários técnicos (zip, hash/criptografia, porta serial, ícone de bandeja, grid ordenável) → `System.IO.Compression`, `System.Security.Cryptography`, componentes React 19. | 4.789 | 2.866 |
| `CmSql50` | Equivalente direto na stack-alvo | Camada de dialetos SQL (Oracle, DB2, MSSQL) → EF Core 10 / Dapper + ODP.NET (Oracle 23ai). | 2.798 | 2.066 |
| `CMPrincipal50` | Equivalente direto na stack-alvo | Janela principal/menu → shell da aplicação React 19. | 1.398 | 1.291 |
| `CMResource50` | Equivalente direto na stack-alvo | Leitura/escrita de recursos do executável → assets React / arquivos `.resx`. | 1.307 | 1.031 |
| `CMOld50` | Equivalente direto na stack-alvo | Componentes visuais legados → componentes React 19. | 983 | 762 |
| `CMCrypto` | Equivalente direto na stack-alvo | Criptografia → System.Security.Cryptography (.NET 10). | 349 | 243 |
| `CmRelatsOld50` | Equivalente direto na stack-alvo | Relatórios-base legados (cabeçalho/rodapé, preview, mestre-detalhe) → biblioteca de relatórios .NET / PDF. | 331 | 281 |
| `CmParser50` | Equivalente direto na stack-alvo | Avaliador de expressões → biblioteca .NET de expressões (ex.: NCalc) ou Roslyn scripting. | 0 | 0 |

A classificação é um juízo de arquitetura por dependência (o conteúdo de cada pacote foi verificado pelos nomes e pela natureza das suas units). Dependências “equivalente direto” ainda exigem configuração e testes; dependências “reimplementação” podem conter partes de UI que serão refeitas com componentes React — o número indica o volume de código Delphi a ser lido e reescrito, não o tamanho final em C#.

## 4. Escopo

* **Mesmo recorte do PFC-26**: os 1.724 arquivos das 31 dependências (pacotes de runtime próprios da lista `Packages=` do `.dof` + `requires` recursivo, e units compiladas no executável via `.dpr`/`SearchPath`), com as mesmas linhas por arquivo. A ferramenta reconfere arquivo a arquivo que linhas totais e de código são idênticas às do PFC-26.
* Contam-se apenas `.pas`, `.dfm`, `.dpr`, `.dpk`. Ficam fora DFM binário, cópias/backups, duplicatas de conteúdo, `.dof`/`.cfg`/`.res`, VCL/RTL da Borland, componentes de terceiros (Developer Express, InfoPower, ReportBuilder, QuickReport, TeeChart, Indy, Multilizer, Toolbar97, TopGrid, ip2000, 1stClass, JCL) e packages/procedures Oracle.
* As pastas inteiras `CONTRIBUICAOPREV/`, `FOLHA/` e `BENEFICIOPREV/` (mesmo recorte do PFC-26) são o ponto de partida das referências; as linhas dos módulos não mudam neste estudo.

## 5. Método (AC4)

Regra de negócio da issue: um arquivo de dependência com 1.000 linhas e 20 funções, do qual os módulos usam 5 funções, contribui com as linhas dessas 5 funções (mais a estrutura mínima da unit), não com as 1.000. A detecção é por análise estática dos fontes, sem compilar:

1. **Segmentação de cada unit.** Cada `.pas` é tokenizado (comentários e strings removidos; os dois ramos de `{$IFDEF}` entram) e dividido em segmentos com as suas linhas físicas: (a) cada rotina implementada — procedure, function, constructor ou destructor, incluindo métodos `TClasse.Metodo` e rotinas aninhadas, do cabeçalho ao `end;` do corpo; (b) cada declaração de classe/objeto/interface (`TX = class … end;`); (c) a *estrutura da unit* — cabeçalho, cláusulas `uses`, `const`/`var`/`type` soltos, declarações do `interface`, comentários entre rotinas e `initialization`/`finalization`. Toda linha pertence a exatamente um segmento.
2. **Units alcançáveis por módulo.** A partir de todos os `.pas`/`.dpr`/`.dpk` da pasta do módulo, seguem-se as cláusulas `uses` (interface e implementation) de forma transitiva. Cada nome de unit é resolvido com o mesmo mapa do PFC-26 para o programa (`ContribuicaoPREV.dpr`, `Folha.dpr`, `BeneficioPrev.dpr`): units da cláusula `contains` dos pacotes próprios do fechamento do `.dof` e units do `.dpr`/`SearchPath`. Units de terceiros não são seguidas. Uma unit não alcançável contribui com 0 linhas.
3. **Referências (ponto fixo).** Sementes: os identificadores de todos os fontes do módulo e, nos `.dfm`, as classes dos componentes (`object X: TCMDBEdit`) e os valores identificadores (handlers `OnClick = …`, `DataSource = …`). Respeita-se o escopo do Pascal: um nome usado na unit A só alcança declarações da própria A ou do `interface` das units que A lista em `uses`. Um segmento passa a ser usado quando:
   * rotina sem classe: o seu nome é referenciado no escopo;
   * declaração de classe: o nome da classe é referenciado no escopo;
   * método: a classe é usada e o nome do método é referenciado (chamada `obj.Metodo`, handler no `.dfm`, acessor `read`/`write` de propriedade referenciada) **ou** o método é `virtual`/`override`/`dynamic`/`abstract`/`message` (chamado polimorficamente pelo framework);
   * qualquer nome do `interface` da unit referenciado por outra unit torna a unit usada (estrutura incluída).
   Os identificadores de cada segmento usado (inclusive da estrutura da unit e do seu `.dfm`) entram nas referências, e o processo se repete até não haver segmento novo. Units com `initialization`/`finalization` alcançáveis são usadas desde o início (o código roda na carga do programa e costuma registrar classes com `RegisterClass`).
4. **Linhas efetivas.** Por arquivo: linhas dos segmentos usados + estrutura da unit, quando a unit é usada. O `.dfm` entra inteiro quando a sua unit é usada (o formulário precisa do layout completo); o `.dpk` entra quando alguma unit do pacote é usada. Linhas de código efetivas seguem a mesma classificação de linha do PFC-18 (código/comentário/vazia).
5. **Agregação.** Por módulo, somam-se as linhas efetivas do módulo; no total, uma linha usada por qualquer dos três módulos entra uma única vez. Validações automáticas: 31 dependências; linha de base igual ao PFC-26; linhas por arquivo idênticas ao PFC-26; efetivas ≤ totais em toda dependência; nenhum uso efetivo por módulo fora do “Usado por”; soma das categorias de prontidão = total efetivo.

## 6. Limitações

* **Resultado conservador (limite superior do uso).** A resolução de métodos é por nome: um método `Executar` de uma classe usada conta como usado se qualquer código usado chamar algum `Executar`. Todos os métodos virtuais de uma classe usada, todos os handlers de um formulário usado e o `.dfm` inteiro entram. Partes de um formulário usado que nunca são acionadas na prática (botões ocultos, abas desativadas) contam como usadas.
* As pastas inteiras dos módulos são sementes (mesmo recorte do PFC-26), inclusive fontes que não são compilados no `.exe`; isso também tende a aumentar o uso efetivo.
* Referências dinâmicas por texto (`FindClass('TX')`, `GetProcAddress`, nomes de métodos em strings, RTTI) não são vistas; o caso mais comum no Delphi 5 — `RegisterClass` em `initialization` — é coberto porque essas seções entram sempre.
* Rotinas declaradas em `{$IFDEF}` inativos entram (os dois ramos são analisados).
* A classificação de prontidão (seção 3) é um juízo por dependência; dentro de uma dependência pode haver partes das duas categorias.
* Packages/procedures Oracle seguem fora (não são fonte Delphi), como no PFC-26.

## 7. Como reproduzir

```bash
python3 -B docs/tools/uso_efetivo_dependencias.py           # imprime o resumo e valida
python3 -B docs/tools/uso_efetivo_dependencias.py --write   # regenera este estudo e a seção do inventário
python3 -B docs/tools/uso_efetivo_dependencias.py --check   # falha se este arquivo ou o inventário estiverem desatualizados
```
