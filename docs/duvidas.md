# Dúvidas — O que são as "113 telas" do Contábil e as "422 telas" do Empréstimos

**Referência:** PFC-7 — Análise FUNCEF Empréstimos
**Data da análise:** 2026-09-30
**Base:** código-fonte legado deste repositório (`CONTAB/`, `EMPRESTIMO/`, `EMPRESTIMOBPL/`) e inventários já publicados em `docs/site/modules/contab/index.html`, `docs/site/modules/emprestimo/index.html`, `docs/migration-contabil.html` (revisão PFC-4) e `docs/system-overview.html`.

---

## Resposta curta

| Pergunta | Resposta |
|---|---|
| **1. Todas essas "telas" são arquivos .dfm?** | **Sim.** Os dois números são contagens de arquivos `.dfm` (o arquivo em que o Delphi guarda o desenho de um form ou de um data module). Não foi contado nenhum outro tipo de arquivo. Mas **nem todo .dfm é uma tela**: data modules, objetos de negócio e layouts de impressão também usam .dfm. |
| **2. O Empréstimos tem mesmo 422 telas?** | **Tem 422 arquivos .dfm, não 422 telas.** A contagem de arquivos está correta (344 em `EMPRESTIMO/Fontes` + 78 em `EMPRESTIMOBPL`). Mas só 173 desses arquivos são telas interativas, e só **131** delas estão realmente compiladas no sistema em uso. |
| **3. O usuário interage com todas?** | **Não.** No Contábil, o usuário interage com **85** das 113. No Empréstimos, com **131** telas das 422, e mais **79** telas simples de filtro de relatório. Os outros arquivos são componentes sem interface, forms-base, cópias antigas ou arquivos que não entram no executável. |

**Número final de telas com que o usuário interage de verdade (AC4):**

| Módulo | Número documentado | Telas interativas em uso | Telas de filtro de relatório em uso (à parte) |
|---|---:|---:|---:|
| Contábil | 113 | **85** | 48 (em `CONTAB/Reports`, **fora** das 113) |
| Empréstimos | 422 | **131** | 79 (dentro das 422) |

**Dimensionamento da migração (PFC-8):** somando as telas interativas e os filtros de relatório, o usuário vê **343 telas funcionais** (Contábil 133 + Empréstimos 210). A ~1 semana por tela com 1 desenvolvedor, são **343 semanas-equivalentes**. O cálculo e as premissas estão na [seção 8](#8-dimensionamento-da-migração--inventário-de-telas-para-a-proposta-comercial).

---

## 1. De onde vêm os números

### 1.1 Contábil — 113

- O número aparece em `docs/migration-contabil.html` ("113/113 telas", revisão PFC-4) e em `docs/site/modules/contab/index.html` ("Inventário exaustivo dos 113 arquivos .dfm de `CONTAB/FontesMT`").
- **Pasta contada:** só `CONTAB/FontesMT`. Ela tem exatamente **113 arquivos .dfm**, todos em texto (nenhum binário).
- **O que ficou de fora:** a pasta `CONTAB` tem **229** arquivos .dfm. Os **116** não contados são:

| Pasta | .dfm | O que são |
|---|---:|---|
| `CONTAB/FontesMT` | **113** | **Contados** |
| `CONTAB/Reports` | 110 | 52 telas de parâmetros/filtro de relatório (`TfrmParam*`) + 58 layouts de impressão ReportBuilder (`Trpt*`) |
| `CONTAB/Fontes` | 4 | `FPrincipal` (janela principal/menu), `dContab` (data module), `fLancaContabMT` (cópia não usada; o projeto compila a versão de `FontesMT`), `rDemo2_Anal` (layout de impressão fora do build) |
| `CONTAB/CtrlObjects` | 1 | `FPrincipal` — cópia não usada da janela principal |
| `CONTAB/DbObjects` | 1 | `FPrincipal` — cópia não usada da janela principal |
| **Total** | **229** | |

> Atenção: as **telas de filtro de relatório do Contábil ficaram fora das 113**. Das 52 telas de parâmetros em `CONTAB/Reports`, **48 estão compiladas** no `Contab.exe` e são usadas (Balancete, Razão, Diário, Demonstrativos etc.). Se o objetivo for dimensionar tudo o que o usuário vê, elas precisam ser somadas à parte.

### 1.2 Empréstimos — 422

- O número aparece em `docs/site/modules/emprestimo/index.html` ("Inventário exaustivo dos 422 arquivos .dfm") e em `docs/system-overview.html` ("Forms/DFM 422 (344 + 78)").
- **Confirmado: são 422 arquivos .dfm**, sem nenhum outro .dfm nessas pastas fora da contagem:

| Pasta | .dfm |
|---|---:|
| `EMPRESTIMO/Fontes` | 344 |
| `EMPRESTIMOBPL/Integra` | 10 |
| `EMPRESTIMOBPL/Interface` | 35 |
| `EMPRESTIMOBPL/Objetos` | 33 |
| **Total** | **422** |

- 9 desses arquivos estão em **formato binário**: `FAjusteFormaEnvio`, `FCadastroPai`, `FEventoCobrancaContrato`, `FExecGeraParcela`, `FExecQuitacao`, `FMapaMovimentacao`, `RResumoCarteiraAnalCaixa`, `dRelItensGeradosAnal`, `dRelItensNaoEnviados`. Todos foram lidos à mão (cabeçalho `TPF0` + lista de componentes) e classificados; nenhum ficou sem classificação.

---

## 2. Por que ".dfm" não quer dizer "tela"

No Delphi, o arquivo `.dfm` guarda as propriedades de tudo o que foi montado no designer. Isso inclui:

| Classe raiz (prefixo) | O que é | O usuário vê? |
|---|---|---|
| `Tfrm…` / `TFrm…` | Form (janela) | Sim, se for aberto por algum menu ou botão |
| `Tcfg…` | Tela de configuração/filtro de relatório (período, plano, patrocinadora… e botão Imprimir) | Sim, mas é uma tela simples e repetitiva |
| `Trpt…` / `Trel…` | Layout de impressão (ReportBuilder/QuickReport) | Só vê o relatório impresso, não interage |
| `Tdtm…` | Data module: contêiner de queries, conexões e relatórios | **Não** — não tem interface |
| `Tmol…` | Objeto de negócio (camada de regras) | **Não** — não tem interface |

Ou seja: um data module ou um objeto de negócio tem .dfm, mas nunca aparece na tela.

---

## 3. Método da classificação

Cada arquivo contado foi colocado em **exatamente uma** das quatro categorias:

1. **Tela interativa** — form com o qual o usuário trabalha: cadastros, lançamentos, processamentos, consultas e diálogos de seleção.
2. **Filtro/impressão de relatório** — tela que só coleta parâmetros para imprimir um relatório (`Tcfg*`, `CRel*`, `FParam*`, `R*`, `FPRel*`, título "Relatório …") e layouts de impressão (`Trpt*`, `Trel*`).
3. **Componente não visual** — data modules (`Tdtm*`), objetos de negócio (`Tmol*`) e forms sem nenhum controle visual, usados só como contêiner de queries para impressão (`fImpressaoContrato`, `fImpressaoInscricao`, `fImpressaoSimulacao`).
4. **Indeterminado / infraestrutura** — forms visuais que não são uma tela de negócio por si mesmos: forms-base herdados por outras telas (`FCadastroPai`, `FCadastroGridMTImob`, `FWizard*`, `CRel`…), janelas genéricas ("Aguarde", progresso, OK/Cancelar), a janela principal/menu (`FPrincipal`) e o designer genérico de relatório (`FDRel`). Entram no esforço como **componentes de layout/framework**, não como telas. Todos os binários foram resolvidos, então esta categoria não tem nenhum arquivo "sem leitura".

Depois, cada arquivo foi comparado com o que o projeto **realmente compila** (coluna "Situação no build" do apêndice):

- **compilado** — a unit está no `Contab.dpr` / `emprestimo.dpr` / nos pacotes `CMIntegraEP50`, `CMExecEP50`, `CMObjetosEP50`, ou é usada (cláusula `uses`, sem contar comentários) por uma unit que está.
- **fora do build** — nenhum projeto do módulo usa a unit. São versões antigas (`_old`, `Cópia de …`, sufixos de chamado como `_81962_X`, `_90359_379854`) ou funções desativadas.
- **sombreado pelo BPL** — cópia em `EMPRESTIMO/Fontes` de uma unit que já existe em um pacote BPL usado pelo `emprestimo.exe` (runtime packages no `emprestimo.dof`). Vale a versão do pacote; a cópia não é uma tela a mais.
- **cópia não usada / cópia não empacotada** — o projeto aponta explicitamente para outro arquivo com o mesmo nome.

Os scripts leem a primeira linha de cada .dfm (`object|inherited Nome: TClasse`) e o `Caption`. Os 9 binários, o conteúdo dos forms de filtro e os forms-base foram conferidos à mão.

---

## 4. Resultado — Contábil (113)

### 4.1 Classificação (AC3)

| Categoria | Qtde | Observação |
|---|---:|---|
| 1 - Tela interativa | 107 | Cadastros, lançamentos, fechamentos, importações/exportações, rateios, consultas |
| 2 - Filtro/impressão de relatório | 0 | Os filtros de relatório do Contábil estão em `CONTAB/Reports`, fora das 113 |
| 3 - Componente não visual | 1 | `dTermoDiario` (data module) |
| 4 - Indeterminado / infraestrutura | 5 | `FCadastroGridMTImob`, `FCadastroMestreDetMTImob` (forms-base), `FWizardMT` (cópia não usada; o projeto usa a versão de `CM/Forms/SourceMT`), `FrmWizRenumPlanil` e `FConfigRelatorioMT` (forms-base fora do build) |
| **Total** | **113** | |

### 4.2 Das 107 telas interativas, quantas o usuário realmente usa (AC4)

| | Qtde |
|---|---:|
| Telas interativas (categoria 1) | 107 |
| (−) fora do build — não compiladas no `Contab.exe` | −22 |
| **= Telas interativas em uso** | **85** |

As 22 fora do build são:
- **Cópias/duplicatas:** `Cópia de FRentabilidadeContabilMT`, `FCadSaldoAnterioMT` (cópia de `FCadSaldoAnteriorMT`), `FAtuIntegraDiasMT` (mesma classe de `FAtuSaldoAnaMT`), `FCadDem2ColunasMT` (duplica `FCadDemo2ColunasMT`), `FCadDiasBloqMod` (variante de `FCadDiasBloqModMT`), `FExcluiExportContab` (variante de `FExcluiExportContabMT`).
- **Funções desativadas / sem uso:** `FCadPercentRateioAPMT`, `FCadRegrasContabMT`, `FCadSaldoAntAtivProjMT`, `FExpPosadasMT`, `FGeraConsolidadoMT`, `FGeraLancRateioAdminMT`, `FGeraLancRateioMT`, `FGeraRateioAtivProjMT`, `FImpFidelioMT`, `FImportaDinamicaMT`, `FImportaRMMT`, `FImportaSAFMT`, `FImportaSRHMT`, `FLancMeiaNoiteMT`, `FRegDepositoVHFMT`, `fCadEventoSrhMT`. Nas cópias de `FPrincipal.pas` em `CtrlObjects`/`DbObjects`, vários desses nomes (por exemplo `FCadEventoSrhMT`, `FImportaDinamicaMT`, `FImportaRMMT`, `FImpFidelioMT`, `FExpPosadasMT`) aparecem dentro de um comentário: "menus retirados pelo desenvolvimento da nova segregação".

**Número final do Contábil: 85 telas interativas**, mais 48 telas de filtro de relatório que estão fora das 113.

---

## 5. Resultado — Empréstimos (422)

### 5.1 Classificação por pasta (AC2 + AC3)

| Pasta | .dfm | 1 - Tela interativa | 2 - Filtro/impressão de relatório | 3 - Não visual | 4 - Indeterminado / infraestrutura |
|---|---:|---:|---:|---:|---:|
| `EMPRESTIMO/Fontes` | 344 | 139 | 99 | 99 | 7 |
| `EMPRESTIMOBPL/Integra` | 10 | 0 | 0 | 9 | 1 |
| `EMPRESTIMOBPL/Interface` | 35 | 28 | 2 | 5 | 0 |
| `EMPRESTIMOBPL/Objetos` | 33 | 6 | 1 | 17 | 9 |
| **Total** | **422** | **173** | **102** | **130** | **17** |

Detalhe das categorias:
- **2 - Filtro/impressão (102):** 86 telas de configuração de relatório `Tcfg*`, 15 forms de filtro/parâmetros de relatório (`CRelInadimplencia`, `FEvolucaoContrato`, `FSaldoResidual`, `FMapaMovimentacao`, `R*`, `FPRel*`…) e 1 layout QuickReport (`rcarta`).
- **3 - Não visual (130):** 104 data modules `Tdtm*` (muitos só carregam o layout ReportBuilder de um relatório), 22 objetos de negócio `Tmol*` e 4 forms sem controles usados só para impressão.
- **4 - Indeterminado / infraestrutura (17):** `FPrincipal`, `FProgresso`, `FEspera`, `FEsperaEP`, `FCadastroPai`, `FCadastroCSImob` (2), `FCadastroGridCSImob`, `FCadastroMestreDetImob`, `FCadastroDetalhe`, `FOkCancelarImob`, `FCadItem` (cópia de `FOkCancelarImob`), `FSairAjudaImob`, `FWizard`, `FWizardMTEP`, `FDRel`, `FExecBuscaPadraoContratos` (form-base de busca), `CRel` (base dos `Tcfg*`).

### 5.2 Das 173 telas interativas, quantas o usuário realmente usa (AC4)

| | Qtde |
|---|---:|
| Telas interativas (categoria 1) | 173 |
| (−) fora do build — versões antigas e funções sem uso | −31 |
| (−) cópias em `EMPRESTIMO/Fontes` sombreadas pelo BPL (a versão real está em `EMPRESTIMOBPL/Interface`) | −10 |
| (−) cópia não empacotada (`EMPRESTIMOBPL/Interface/FExecBuscaSolicitante`; vale a de `Objetos`) | −1 |
| **= Telas interativas em uso** | **131** |

Das 131: 106 em `EMPRESTIMO/Fontes`, 20 em `EMPRESTIMOBPL/Interface`, 5 em `EMPRESTIMOBPL/Objetos`.

Exemplos das 42 descartadas: `FExecAlteraConcessao_81962_379367`, `FExecAlteraConcessao_81962_X`, `FCancAmortizacao_90359_379854`, `FCancAmortizacao_90859_383197`, `FExecAmortizacao_92695_395894`, `RContrato_92695_395894`, `fCancQuitacao_90359_379854`, `FExecGeraParcela_old`, `FExecTrataParcela_old`, `FExecQuitacaoNovo`, `FExecRecebimentoNovo`, `FExecTrataDiverg` (substituída por `FExecTrataDivergNovo`) e as cópias locais de `FExecQuitacao`, `FExecAmortizacao`, `FExecTrataParcela`, `FExecAlteraContrato`, `RContrato`, `fCancQuitacao` etc. A lista completa está no apêndice.

**Número final do Empréstimos: 131 telas interativas**, mais 79 telas de filtro de relatório em uso (70 `Tcfg*` + 9 forms de filtro), que são simples e seguem o mesmo padrão.

---

## 6. O que isso muda no dimensionamento da migração

- **"422 telas" superdimensiona o Empréstimos em mais de 3 vezes.** O número real de telas de negócio em uso é **131**. Os 422 arquivos se dividem assim:

| Parcela dos 422 | Qtde | Como tratar na migração |
|---|---:|---|
| Telas interativas em uso | 131 | Telas React, uma a uma. É a base da estimativa de frontend. |
| Filtros de relatório em uso | 79 | Telas pequenas e repetitivas. Podem virar **um componente genérico de filtro + relatório** configurado por relatório, e não 79 telas feitas uma a uma. |
| Componentes não visuais em uso | 94 | Não viram telas. Viram **queries/serviços no backend** (APIs C#) e definições de relatório. O esforço existe, mas entra no backend. |
| Infraestrutura em uso | 14 | Viram **layout, navegação e componentes base** do frontend (menu, modal de confirmação, "aguarde", mestre-detalhe genérico). São feitos uma vez só. |
| Fora do build, cópias e versões antigas (todas as categorias) | 104 | **Não precisam ser migrados.** Precisam só de uma confirmação de que estão desativados. |
| **Total** | **422** | |

- **O Contábil está superdimensionado nas telas e subdimensionado nos relatórios.** Das 113, só **85** são telas em uso. Por outro lado, as **48 telas de filtro de relatório** em `CONTAB/Reports` (e os layouts de impressão delas) **não fazem parte das 113** e precisam entrar na estimativa à parte.
- **Base de estimativa sugerida:**

| Módulo | Telas interativas em uso | Filtros de relatório em uso | Total do que o usuário vê |
|---|---:|---:|---:|
| Contábil | 85 | 48 | 133 |
| Empréstimos | 131 | 79 | 210 |

Para estimar, use as **telas interativas** como unidade de esforço de frontend e trate os **filtros de relatório** como itens de baixa complexidade ou como um único componente reaproveitável.

---

## 7. Limitações e pontos para validar com a FUNCEF

- "Compilado" quer dizer que o arquivo **entra no executável**. Não garante que exista um item de menu liberado para algum perfil (o acesso é controlado pelo menu/SAD em tempo de execução). A lista de 85/131 deve ser conferida com os menus e perfis de produção.
- A análise vale para o **snapshot deste repositório**. Se a produção roda um executável gerado de outra versão das fontes, os números de "fora do build" podem mudar.
- Diálogos pequenos (seleção de contrato/mutuário, justificativa, observação, simulação de prazo) foram contados como telas interativas porque o usuário interage com eles, mas são de baixa complexidade.
- A classificação das categorias 1 e 2 usa nome do arquivo, classe raiz e título. Casos de fronteira (por exemplo `RContrato`, que é uma consulta completa de contratos e parcelas, e `FParamEmptmo`, que é a tela de parâmetros do sistema e não um filtro de relatório) foram revisados à mão.

---

## 8. Dimensionamento da migração — inventário de telas para a proposta comercial

**Referência:** PFC-8 — Levantamento telas migração
**Data:** 2026-09-30
**Base:** resultado das seções 4 a 6 (análise PFC-7). Nenhuma nova varredura de código foi feita; os números abaixo são uma síntese auditável do apêndice.

### 8.1 O que conta como tela

Um arquivo `.dfm` só é contado como **tela funcional** quando expõe uma interface com a qual o usuário interage:

- **Conta:** cadastro, lançamento, processamento, consulta, diálogo de seleção/confirmação de negócio **e tela de filtro de relatório** (a tela em que o usuário digita os parâmetros para gerar um relatório).
- **Não conta:** data modules (`Tdtm*`), objetos de negócio (`Tmol*`), layouts de impressão (`Trpt*`/`Trel*`), forms-base herdados por outras telas, janelas genéricas ("Aguarde", progresso, OK/Cancelar), a janela principal/menu, cópias não usadas, versões antigas, cópias sombreadas pelo BPL e qualquer arquivo fora do build.

Os itens excluídos continuam tendo esforço de migração (serviços/queries no backend, definições de relatório, layout e navegação do frontend — ver seção 6), mas **não são telas** e não entram na conta de "semanas por tela".

### 8.2 Inventário por módulo

| Módulo | Arquivos .dfm documentados | Telas interativas em uso | Telas de filtro de relatório em uso | **Total de telas funcionais** |
|---|---:|---:|---:|---:|
| Contábil | 113 (`CONTAB/FontesMT`) | **85** | **48** (`CONTAB/Reports`, **fora** das 113) | **133** |
| Empréstimos | 422 (`EMPRESTIMO/Fontes` + `EMPRESTIMOBPL`) | **131** | **79** (dentro das 422) | **210** |
| **Total** | **535** | **216** | **127** | **343** |

De onde saem os números:

- **Contábil (133):** 113 arquivos − 1 data module (`dTermoDiario`) − 5 forms-base/infraestrutura − 22 telas fora do build = **85** telas interativas (seção 4). Somam-se as **48** telas `TfrmParam*` compiladas no `Contab.exe`, que ficam em `CONTAB/Reports` (seção 1.1). 85 + 48 = **133**.
- **Empréstimos (210):** 173 telas interativas − 42 fora do build, sombreadas pelo BPL ou não empacotadas = **131** (seção 5.2), mais **79** telas de filtro de relatório em uso (70 `Tcfg*` + 9 forms de filtro). 131 + 79 = **210**. Os outros **212** arquivos dos 422 (data modules, objetos de negócio, layouts de impressão, infraestrutura, cópias e versões fora do build) **não são telas**.

### 8.3 Cálculo de prazo

**Premissa do cliente (a validar antes da proposta):** ~**1 semana de migração por tela**, com **1 desenvolvedor**.

| Módulo | Telas funcionais | × semanas/tela | ÷ desenvolvedores | = Semanas-equivalentes |
|---|---:|---:|---:|---:|
| Contábil | 133 | 1 | 1 | 133 |
| Empréstimos | 210 | 1 | 1 | 210 |
| **Total** | **343** | 1 | 1 | **343** |

**343 telas funcionais × 1 semana/tela ÷ 1 desenvolvedor = 343 semanas-equivalentes (≈ 6,6 anos com 1 desenvolvedor**, considerando 52 semanas/ano, sem férias nem feriados). O prazo cai de forma proporcional ao número de desenvolvedores em paralelo. Por exemplo, com 4 desenvolvedores são ≈ 86 semanas, sem contar o custo de coordenação.

Para comparar: usar os números brutos de arquivos (113 + 422 = 535) daria 535 semanas, ou seja, **192 semanas a mais** do que o escopo real de telas.

### 8.4 Nota de otimização — filtros de relatório

Das 343 telas, **127 são filtros de relatório** (48 no Contábil + 79 no Empréstimos). São telas pequenas e repetitivas: período, plano, patrocinadora e outros parâmetros, mais um botão de imprimir. Como sugerido na seção 6, elas podem ser migradas como **um único componente genérico de filtro + relatório, configurado por relatório**, e não como 127 telas feitas uma a uma. Isso reduz o esforço efetivo de frontend:

| Cenário | Telas contadas a 1 semana | Semanas-equivalentes |
|---|---:|---:|
| Bruto (todas as telas a 1 semana) | 343 | 343 |
| Só telas interativas a 1 semana; filtros no componente genérico | 216 | 216 + esforço do componente genérico e da configuração dos 127 relatórios |

O número bruto (**343**) continua sendo a contagem oficial de telas funcionais. O cenário otimizado é só uma alternativa de esforço para negociar com o cliente.

### 8.5 Pontos a validar com a FUNCEF antes da proposta

- A premissa de **1 semana/tela/desenvolvedor** é do cliente e deve ser confirmada, ou ajustada por faixa de complexidade (ver os diálogos simples citados na seção 7).
- A lista de 85/131 telas interativas usa o critério "compilado no executável". Ela deve ser conferida com os **menus e perfis de produção** (controle de acesso em tempo de execução via SAD).
- Os números valem para o **snapshot deste repositório** (seção 7).
- Fora do escopo desta contagem, com esforço a estimar à parte: backend (serviços/APIs C# que substituem os data modules e objetos de negócio), layouts de impressão dos relatórios, infraestrutura de frontend (menu, navegação, modais) e migração de dados.

---

## Apêndice — Classificação arquivo a arquivo

Cada linha é um arquivo .dfm contado. As quantidades por categoria somam exatamente 113 (Contábil) e 422 (Empréstimos).

### A. Contábil — 113 arquivos de `CONTAB/FontesMT`

| # | Pasta | Arquivo | Classe raiz | Título (Caption) | Categoria | Situação no build |
|---:|---|---|---|---|---|---|
| 1 | `CONTAB/FontesMT` | Cópia de FRentabilidadeContabilMT.dfm | `TFrmRentabilidadeContabilMT` | Rentabilidade Contábil | 1 - Tela interativa | fora do build (não compilado) |
| 2 | `CONTAB/FontesMT` | dTermoDiario.dfm | `TdtmTermo` | dtmTermoDiario | 3 - Componente não visual | compilado |
| 3 | `CONTAB/FontesMT` | FAcertaCodRedMT.dfm | `TfrmAcertaCodRedMT` | Atualiza Códigos Reduzidos | 1 - Tela interativa | compilado |
| 4 | `CONTAB/FontesMT` | FAcertaNumPlanilhaMT.dfm | `TfrmAcertaNumPlanilhaMT` | Atualiza Numeração das Planilhas | 1 - Tela interativa | compilado |
| 5 | `CONTAB/FontesMT` | fAjustaSegregacaoMT.dfm | `TFrmAjustaSegregacaoMT` | Ajuste de planilhas divergentes | 1 - Tela interativa | compilado |
| 6 | `CONTAB/FontesMT` | FAlteraDataMT.dfm | `TfrmAlteraDataMT` | Alteração de Datas de Planilha | 1 - Tela interativa | compilado |
| 7 | `CONTAB/FontesMT` | FAlteraPlanoContabilMT.dfm | `TfrmAlteraPlanoContabilMT` | Alteração do Plano Contábil | 1 - Tela interativa | compilado |
| 8 | `CONTAB/FontesMT` | FAtualizaMoedaMT.dfm | `TfrmAtualizaMoedaMT` | Atualização de Moeda | 1 - Tela interativa | compilado |
| 9 | `CONTAB/FontesMT` | FAtualizaSinMT.dfm | `TfrmAtualizaSinMT` | Atualiza Sintéticas | 1 - Tela interativa | compilado |
| 10 | `CONTAB/FontesMT` | FAtuIntegraDiasMT.dfm | `TfrmAtuSaldoAnaMT` | Atualiza Saldo das Contas Analíticas | 1 - Tela interativa | fora do build (não compilado) |
| 11 | `CONTAB/FontesMT` | FAtuSaldoAnaMT.dfm | `TfrmAtuSaldoAnaMT` | Atualiza Saldo das Contas Analíticas | 1 - Tela interativa | compilado |
| 12 | `CONTAB/FontesMT` | FAtuSaldoEncerramentoMT.dfm | `TfrmAtuSaldoEncerramentoMT` | Atualiza Saldo de Encerramento das Contas | 1 - Tela interativa | compilado |
| 13 | `CONTAB/FontesMT` | FCadastroGridMTImob.dfm | `TfrmCadastroGridMTImob` | frmCadastroGridMTImob | 4 - Indeterminado / infraestrutura | compilado |
| 14 | `CONTAB/FontesMT` | FCadastroMestreDetMTImob.dfm | `TFrmCadastroMestreDetMTImob` | FrmCadastroMestreDetMTImob | 4 - Indeterminado / infraestrutura | compilado |
| 15 | `CONTAB/FontesMT` | FCadColunasDemoMT.dfm | `TfrmCadColunasDemoMT` | Colunas do Demonstrativo de Resultados | 1 - Tela interativa | compilado |
| 16 | `CONTAB/FontesMT` | FCadContasContabMT.dfm | `TfrmCadContasContabMT` | Cadastro de Contas Contábeis | 1 - Tela interativa | compilado |
| 17 | `CONTAB/FontesMT` | FCadContasporPeriodoMT.dfm | `TfrmCadContasporPeriodoMT` | Agrupamento e Desmembramento de Contas | 1 - Tela interativa | compilado |
| 18 | `CONTAB/FontesMT` | fCadCriterioSegregacao.dfm | `TfrmCadCriterioSegregacao` | Cadastro de Critérios para Segregação | 1 - Tela interativa | compilado |
| 19 | `CONTAB/FontesMT` | FCadDem2ColunasMT.dfm | `TfrmCadDem2ColunasMT` | Cadastro dos Elementos do Balanço Patrimonial | 1 - Tela interativa | fora do build (não compilado) |
| 20 | `CONTAB/FontesMT` | FCadDemo2ColunasMT.dfm | `TfrmCadDemo2ColunasMT` | Cadastro dos Elementos do Balanço Patrimonial | 1 - Tela interativa | compilado |
| 21 | `CONTAB/FontesMT` | FCadDemonstrativoMT.dfm | `TFrmCadDemonstrativoMT` | Cadastro de Demonstrativos | 1 - Tela interativa | compilado |
| 22 | `CONTAB/FontesMT` | FCadDeParaContasMT.dfm | `TfrmCadDeParaContasMT` | De/Para de Contas Contábeis | 1 - Tela interativa | compilado |
| 23 | `CONTAB/FontesMT` | FCadDiasBloqMod.dfm | `TfrmCadDiasBloqMod` | Cadastro de Dias Bloqueados por Módulo | 1 - Tela interativa | fora do build (não compilado) |
| 24 | `CONTAB/FontesMT` | FCadDiasBloqModMT.dfm | `TfrmCadDiasBloqModMT` | Cadastro de Dias Bloqueados por Sistema | 1 - Tela interativa | compilado |
| 25 | `CONTAB/FontesMT` | FCadElemDemoMT.dfm | `TfrmCadElemDemoMT` | Cadastro de Elementos do Demonstrativo | 1 - Tela interativa | compilado |
| 26 | `CONTAB/FontesMT` | fCadEventoSrhMT.dfm | `TfrmCadEventoSrhMT` | Evento SRH | 1 - Tela interativa | fora do build (não compilado) |
| 27 | `CONTAB/FontesMT` | FCadFaixaDatasMT.dfm | `TfrmCadFaixaDatasMT` | Faixa de Datas do Plano de Contas | 1 - Tela interativa | compilado |
| 28 | `CONTAB/FontesMT` | FCadHistoricoMT.dfm | `TfrmCadHistoricoMT` | Cadastro de Históricos Padrão | 1 - Tela interativa | compilado |
| 29 | `CONTAB/FontesMT` | FCadLancamAutomMT.dfm | `TfrmCadLancamAutomMT` | Lançamentos automáticos | 1 - Tela interativa | compilado |
| 30 | `CONTAB/FontesMT` | FCadLancPreProntaMT.dfm | `TfrmCadLancPreProntaMT` | Lançamentos - Planilhas Pré-Prontas | 1 - Tela interativa | compilado |
| 31 | `CONTAB/FontesMT` | FCadLancRateioMT.dfm | `TfrmCadLancRateioMT` | Lançamento de Planilha de Rateio | 1 - Tela interativa | compilado |
| 32 | `CONTAB/FontesMT` | FCadLayoutDemoMT.dfm | `TfrmCadLayoutDemoMT` | Cadastro de Layouts dos Demonstrativos de Resultados | 1 - Tela interativa | compilado |
| 33 | `CONTAB/FontesMT` | FCadLinhasDemoMT.dfm | `TfrmCadLinhasDemoMT` | Cadastro de Linhas do Demonstrativo Colunado | 1 - Tela interativa | compilado |
| 34 | `CONTAB/FontesMT` | FCadMovAnteriorMT.dfm | `TfrmCadMovAnteriorMT` | — | 1 - Tela interativa | compilado |
| 35 | `CONTAB/FontesMT` | FCadOrcamentoContabilMT.dfm | `TfrmCadOrcamentoContabilMT` | Cadastro do Orçamento Contábil | 1 - Tela interativa | compilado |
| 36 | `CONTAB/FontesMT` | FCadParamContabMT.dfm | `TfrmCadParamContabMT` | Parâmetros da Contabilidade | 1 - Tela interativa | compilado |
| 37 | `CONTAB/FontesMT` | FCadPercentRateioAPMT.dfm | `TfrmCadPercentRateioAPMT` | Percentuais de Rateio por Atividade/Projeto | 1 - Tela interativa | fora do build (não compilado) |
| 38 | `CONTAB/FontesMT` | FCadPeriodoContabilMT.dfm | `TFrmCadPeriodoContabilMT` | Cadastro de Períodos Contábeis | 1 - Tela interativa | compilado |
| 39 | `CONTAB/FontesMT` | FCadPlanilPreProntaMT.dfm | `TfrmCadPlanilPreProntaMT` | Cadastro de Planilhas Pré-Prontas | 1 - Tela interativa | compilado |
| 40 | `CONTAB/FontesMT` | FCadPlanilRateioMT.dfm | `TfrmCadPlanilRateioMT` | Cadastro de Planilhas de Rateio | 1 - Tela interativa | compilado |
| 41 | `CONTAB/FontesMT` | FCadPlanoContasMT.dfm | `TfrmCadPlanoContasMT` | Cadastro de Plano de Contas | 1 - Tela interativa | compilado |
| 42 | `CONTAB/FontesMT` | FCadRatAdmPlanoPatroMT.dfm | `TfrmCadRatAdmPlanoPatroMT` | Cadastro do Rateio Administrativo por Plano e Patrocinadora | 1 - Tela interativa | compilado |
| 43 | `CONTAB/FontesMT` | FCadRateioPlanPrevMT.dfm | `TfrmCadRateioPlanPrevMT` | Cadastro do Rateio por Plano e Patrocinadora | 1 - Tela interativa | compilado |
| 44 | `CONTAB/FontesMT` | FCadRateioProgMT.dfm | `TfrmCadRateioProgMT` | Cadastro do Rateio por Programa | 1 - Tela interativa | compilado |
| 45 | `CONTAB/FontesMT` | FCadRegrasContabMT.dfm | `TfrmCadRegrasContabMT` | Cadastro de Regras Contábeis | 1 - Tela interativa | fora do build (não compilado) |
| 46 | `CONTAB/FontesMT` | FCadSaldoAntAtivProjMT.dfm | `TfrmCadSaldoAntAtivProjMT` | Saldo Anterior por Atividade/Projeto | 1 - Tela interativa | fora do build (não compilado) |
| 47 | `CONTAB/FontesMT` | FCadSaldoAnterioMT.dfm | `TfrmCadSaldoAnteriorMT` | frmCadSaldoAnteriorMT | 1 - Tela interativa | fora do build (não compilado) |
| 48 | `CONTAB/FontesMT` | FCadSaldoAnteriorMT.dfm | `TfrmCadSaldoAnteriorMT` | Cadastro de Saldos Anteriores | 1 - Tela interativa | compilado |
| 49 | `CONTAB/FontesMT` | FCadSaldoCotasPlanPatroMT.dfm | `TfrmCadSaldoCotasPlanPatroMT` | Cadastro dos Saldos de Cotas por Plano e Patrocinadora | 1 - Tela interativa | compilado |
| 50 | `CONTAB/FontesMT` | fCadSegregaCotacao.dfm | `TfrmCadSegregaCotacao` | Cotação de Critérios para Segregação | 1 - Tela interativa | compilado |
| 51 | `CONTAB/FontesMT` | fCadSPCConsiste.dfm | `TfrmCadSPCConsiste` | Cadastro de Regras de Consistência de Balancetes | 1 - Tela interativa | compilado |
| 52 | `CONTAB/FontesMT` | FCadSubContaMT.dfm | `TfrmCadSubContaMT` | Cadastro de Sub-Contas | 1 - Tela interativa | compilado |
| 53 | `CONTAB/FontesMT` | FCadSubGrupoMT.dfm | `TfrmCadSubGrupoMT` | Cadastro de Sub-Grupos | 1 - Tela interativa | compilado |
| 54 | `CONTAB/FontesMT` | FCadTabelasContabMT.dfm | `TfrmCadTabelasContabMT` | Cadastro de Tabelas da Contabilidade | 1 - Tela interativa | compilado |
| 55 | `CONTAB/FontesMT` | FCadTermoDiarioMT.dfm | `TfrmCadTermoDiarioMT` | Termos do Diário | 1 - Tela interativa | compilado |
| 56 | `CONTAB/FontesMT` | FCadTipoRentabilidade.dfm | `TFrmCadTipoRentabilidade` | Cadastro de Tipo de Rentabilidade | 1 - Tela interativa | compilado |
| 57 | `CONTAB/FontesMT` | fConfereRegraMT.dfm | `TfrmConfereRegraMT` | Consistência de Regras | 1 - Tela interativa | compilado |
| 58 | `CONTAB/FontesMT` | FConfigRelatorioMT.dfm | `TFrmConfigRelatorioMT` | Configuração de Relatórios MT | 4 - Indeterminado / infraestrutura | fora do build (não compilado) |
| 59 | `CONTAB/FontesMT` | FCopiaDemonstrativoMT.dfm | `TfrmCopiaDemonstrativomt` | Copiar Demonstrativos | 1 - Tela interativa | compilado |
| 60 | `CONTAB/FontesMT` | FDataMT.dfm | `TfrmDataMT` | Data do Estorno | 1 - Tela interativa | compilado |
| 61 | `CONTAB/FontesMT` | FDeficitSuperavitMT.dfm | `TfrmDeficitSuperavitMT` | Apuração de Resultado | 1 - Tela interativa | compilado |
| 62 | `CONTAB/FontesMT` | FEncerraExercicioMT.dfm | `TfrmEncerraExercicioMT` | Encerramento do Exercício | 1 - Tela interativa | compilado |
| 63 | `CONTAB/FontesMT` | FEncerraPeriodoMT.dfm | `TfrmEncerraPeriodoMT` | Encerra Período | 1 - Tela interativa | compilado |
| 64 | `CONTAB/FontesMT` | FEncerraResultadosMT.dfm | `TfrmEncerraResultadosMT` | Encerra Contas de Resultado | 1 - Tela interativa | compilado |
| 65 | `CONTAB/FontesMT` | FExcluiApuracao.dfm | `TFrmExcluiApuracao` | Exclusão de Apuração de Resultados | 1 - Tela interativa | compilado |
| 66 | `CONTAB/FontesMT` | FExcluiExportContab.dfm | `TFrmExcluiExportContab` | Exclusão de Exportação Contábil | 1 - Tela interativa | fora do build (não compilado) |
| 67 | `CONTAB/FontesMT` | FExcluiExportContabMT.dfm | `TFrmExcluiExportContabMT` | Exclusão de Exportação Contábil | 1 - Tela interativa | compilado |
| 68 | `CONTAB/FontesMT` | FExcluiPlanilhaFaixaMT.dfm | `TfrmExcluiPlanilhaFaixaMT` | Exclui Planilha por Faixa | 1 - Tela interativa | compilado |
| 69 | `CONTAB/FontesMT` | FExportaContabMT.dfm | `TFrmExportaContabMT` | Exportação Contábil | 1 - Tela interativa | compilado |
| 70 | `CONTAB/FontesMT` | FExpPosadasMT.dfm | `TfrmExpPosadasMT` | Exporta Arquivos para Posadas | 1 - Tela interativa | fora do build (não compilado) |
| 71 | `CONTAB/FontesMT` | FGeraConsolidadoMT.dfm | `TfrmGeraConsolidadoMT` | Geração de Lançamentos Consolidados | 1 - Tela interativa | fora do build (não compilado) |
| 72 | `CONTAB/FontesMT` | FGeraCotaPlanPatroMT.dfm | `TfrmGeraCotaPlanPatroMT` | — | 1 - Tela interativa | compilado |
| 73 | `CONTAB/FontesMT` | FGeraLancRateioAdminMT.dfm | `TfrmGeraLancRateioAdminMT` | Geração dos Lançamentos do Rateio Administrativo | 1 - Tela interativa | fora do build (não compilado) |
| 74 | `CONTAB/FontesMT` | FGeraLancRateioMT.dfm | `TfrmGeraLancRateioMT` | Geração dos Lançamentos do Rateio por Ativ./Proj. | 1 - Tela interativa | fora do build (não compilado) |
| 75 | `CONTAB/FontesMT` | FGeraRatAdmPlanPatroMT.dfm | `TfrmGeraRatAdmPlanPatroMT` | — | 1 - Tela interativa | compilado |
| 76 | `CONTAB/FontesMT` | FGeraRateioAtivProjMT.dfm | `TfrmGeraRateioAtivProjMT` | Geração dos Dados do Rateio por Ativ./Proj. | 1 - Tela interativa | fora do build (não compilado) |
| 77 | `CONTAB/FontesMT` | FGeraSalCont2004MT.dfm | `TfrmGeraSALCONT2004MT` | Geração do Arquivo SIPC-CAP | 1 - Tela interativa | compilado |
| 78 | `CONTAB/FontesMT` | FGeraSalCont2010MT.dfm | `TFrmGeraSalCont2010MT` | SICADI | 1 - Tela interativa | compilado |
| 79 | `CONTAB/FontesMT` | FGeraSalContMT.dfm | `TfrmGeraSALCONTMT` | Geração do Arquivo SIPC-CAP | 1 - Tela interativa | compilado |
| 80 | `CONTAB/FontesMT` | FGeraSaldoCalcMT.dfm | `TfrmGeraSaldoCalcMT` | Geração de Saldos Calculados | 1 - Tela interativa | compilado |
| 81 | `CONTAB/FontesMT` | FImpFidelioMT.dfm | `TfrmImpFidelioMT` | Contabilização da Receita do Front-Office Fidélio | 1 - Tela interativa | fora do build (não compilado) |
| 82 | `CONTAB/FontesMT` | FImportaCorrespMT.dfm | `TfrmImportaCorrespMT` | Importação das Contas Correspondentes | 1 - Tela interativa | compilado |
| 83 | `CONTAB/FontesMT` | FImportaDinamicaMT.dfm | `TfrmImportaDinamicaMT` | Importação da Folha da Dinâmica | 1 - Tela interativa | fora do build (não compilado) |
| 84 | `CONTAB/FontesMT` | FImportaExcelMT.dfm | `TfrmImportaExcelMT` | Importação de Lançamentos Externos - Planilhas Excel | 1 - Tela interativa | compilado |
| 85 | `CONTAB/FontesMT` | FImportaLancamentosMT.dfm | `TfrmImportaLancamentosMT` | Importação de Lançamentos Externos | 1 - Tela interativa | compilado |
| 86 | `CONTAB/FontesMT` | FImportaOrcadoExcelMT.dfm | `TfrmImportaOrcExcelMT` | Importação de Valores Orçados - Planilhas Excel | 1 - Tela interativa | compilado |
| 87 | `CONTAB/FontesMT` | FImportaPlanoContasMT.dfm | `TfrmImportaPlanoContasMT` | Importação dos dados do Plano de Contas | 1 - Tela interativa | compilado |
| 88 | `CONTAB/FontesMT` | FImportaPlanoSaldosMT.dfm | `TfrmImportaSaldosMT` | Importação dos dados dos Saldos Anteriores | 1 - Tela interativa | compilado |
| 89 | `CONTAB/FontesMT` | FImportaRMMT.dfm | `TfrmImportaRMMT` | Importação dos dados da RM | 1 - Tela interativa | fora do build (não compilado) |
| 90 | `CONTAB/FontesMT` | FImportaSAFMT.dfm | `TfrmImportaSAFMT` | Importação de Lançamentos do SAF | 1 - Tela interativa | fora do build (não compilado) |
| 91 | `CONTAB/FontesMT` | FImportaSRHMT.dfm | `TfrmImportaSRHMT` | Importação dos dados da SRH Plus | 1 - Tela interativa | fora do build (não compilado) |
| 92 | `CONTAB/FontesMT` | FIntegraDiasMT.dfm | `TfrmIntegraDiasMT` | Integração por Data | 1 - Tela interativa | compilado |
| 93 | `CONTAB/FontesMT` | FIntegraPlanilhasMT.dfm | `TfrmIntegraPlanilhasMT` | Integração por Planilhas | 1 - Tela interativa | compilado |
| 94 | `CONTAB/FontesMT` | fLancaContabMT.dfm | `TFrmLancaContabMT` | Planilhas & Lançamentos | 1 - Tela interativa | compilado |
| 95 | `CONTAB/FontesMT` | FLancCadAutomMT.dfm | `TfrmLancCadAutomMT` | Lançamento Automático | 1 - Tela interativa | compilado |
| 96 | `CONTAB/FontesMT` | FLancMeiaNoiteMT.dfm | `TfrmLancMeiaNoiteMT` | Apuração de Resultado do Exercício (Lançamento da Meia Noite) | 1 - Tela interativa | fora do build (não compilado) |
| 97 | `CONTAB/FontesMT` | FLancPesqMT.dfm | `TfrmLancPesquisaMT` | Pesquisa de Lançamentos | 1 - Tela interativa | compilado |
| 98 | `CONTAB/FontesMT` | fLancPlanAutomMT.dfm | `TfrmLancPlanAutomMT` | Lançamento Automático | 1 - Tela interativa | compilado |
| 99 | `CONTAB/FontesMT` | FLancSaldosMT.dfm | `TfrmLancSaldosMT` | Exibição de Lançamentos | 1 - Tela interativa | compilado |
| 100 | `CONTAB/FontesMT` | fProcessaSegregacao.dfm | `TfrmProcessaSegregacao` | Processa Segregação de Recursos | 1 - Tela interativa | compilado |
| 101 | `CONTAB/FontesMT` | FRateioPlanoPrevMT.dfm | `TfrmRateioPlanoPrevMT` | Rateio por Plano e Patrocinadora | 1 - Tela interativa | compilado |
| 102 | `CONTAB/FontesMT` | fRateioProgMT.dfm | `TfrmRateioProgMT` | Rateio por Programa | 1 - Tela interativa | compilado |
| 103 | `CONTAB/FontesMT` | FRegDepositoVHFMT.dfm | `TfrmRegDepositoVHFMT` | Regularização de Depósito do VHL | 1 - Tela interativa | fora do build (não compilado) |
| 104 | `CONTAB/FontesMT` | FRentabilidadeContabilMT.dfm | `TFrmRentabilidadeContabilMT` | Rentabilidade Contábil | 1 - Tela interativa | compilado |
| 105 | `CONTAB/FontesMT` | FrmWizRenumPlanil.dfm | `TfrmWizardMT1` | frmWizardMT1 | 4 - Indeterminado / infraestrutura | fora do build (não compilado) |
| 106 | `CONTAB/FontesMT` | FSaldosPesqMT.dfm | `TfrmSaldosPesquisaMT` | Pesquisa de Saldos Contábeis | 1 - Tela interativa | compilado |
| 107 | `CONTAB/FontesMT` | FSegregaPlanPatroMT.dfm | `TfrmSegregaPlanPatroMT` | Geração dos Lançamentos de Segregação por Plano e Patrocinadora | 1 - Tela interativa | compilado |
| 108 | `CONTAB/FontesMT` | FVerificaBloqueadosMT.dfm | `TfrmVerificaBloqueadosMT` | Planilhas não Integradas em Períodos Bloqueados | 1 - Tela interativa | compilado |
| 109 | `CONTAB/FontesMT` | FVerifLancMT.dfm | `TfrmVerifLancMT` | Verifica Lançamentos | 1 - Tela interativa | compilado |
| 110 | `CONTAB/FontesMT` | FWizardMT.dfm | `TfrmWizardMT` | frmWizardMT | 4 - Indeterminado / infraestrutura | cópia não usada (o projeto usa cm/forms/sourcemt/fwizardmt.pas) |
| 111 | `CONTAB/FontesMT` | FWizDesmembraAgrupa.dfm | `TFrmWizDesmembraAgrupa` | Desmembramento/Agrupamento de Contas | 1 - Tela interativa | compilado |
| 112 | `CONTAB/FontesMT` | FWizPlanilhaSPC.dfm | `TfrmWizPlaniSpc` | Gera Planilha Contábil - SPC  (Formato Excel) | 1 - Tela interativa | compilado |
| 113 | `CONTAB/FontesMT` | FWizRenumPlanil.dfm | `TFrmWizRenumPlanil` | Ativação da numeração de planilhas por SEQUENCE | 1 - Tela interativa | compilado |

### B. Empréstimos — 422 arquivos de `EMPRESTIMO/Fontes` + `EMPRESTIMOBPL`

| # | Pasta | Arquivo | Classe raiz | Título (Caption) | Categoria | Situação no build |
|---:|---|---|---|---|---|---|
| 1 | `EMPRESTIMO/Fontes` | CRelAnaliseContabil.dfm | `TcfgRelAnaliseContabil` | Análise Contábil | 2 - Filtro/impressão de relatório | compilado |
| 2 | `EMPRESTIMO/Fontes` | CRelCartaCobrEP.dfm | `TcfgRelCartaCobrEP` | Emissão de Carta de Cobranca | 2 - Filtro/impressão de relatório | compilado |
| 3 | `EMPRESTIMO/Fontes` | CRelConciliaCaPCar.dfm | `TcfgRelConciliaCapCar` | Conciliação de Recebimentos - Financeiro - por Documento | 2 - Filtro/impressão de relatório | compilado |
| 4 | `EMPRESTIMO/Fontes` | CRelConciliaContab.dfm | `TcfgRelConciliaContab` | Conciliação Contábil (diária) - sintético por Conta Contábil | 2 - Filtro/impressão de relatório | compilado |
| 5 | `EMPRESTIMO/Fontes` | CRelConciliaContabCC.dfm | `TcfgRelConciliaContabCC` | Conciliação Contábil (diária) - analítico por Conta Contábil | 2 - Filtro/impressão de relatório | compilado |
| 6 | `EMPRESTIMO/Fontes` | CRelConciliaContabCCDia.dfm | `TcfgRelConciliaContabCCDia` | Conciliação Contábil Diária - analítico por Conta Contábil | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 7 | `EMPRESTIMO/Fontes` | CRelConciliaContabCCPeriodo.dfm | `TcfgRelConciliaContabCCPeriodo` | Conciliação Contábil (período) - analítico por Conta Contábil | 2 - Filtro/impressão de relatório | compilado |
| 8 | `EMPRESTIMO/Fontes` | CRelConciliaContabDia.dfm | `TcfgRelConciliaContabDia` | Conciliação Contábil Diária - sintético por Conta Contábil | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 9 | `EMPRESTIMO/Fontes` | CRelConciliaContabPeriodo.dfm | `TcfgRelConciliaContabPeriodo` | Conciliação Contábil (período) - sintético por Conta Contábil | 2 - Filtro/impressão de relatório | compilado |
| 10 | `EMPRESTIMO/Fontes` | CRelConciliaContabPP.dfm | `TcfgRelConciliaContabPP` | Conciliação Contábil (diária) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 11 | `EMPRESTIMO/Fontes` | CRelConciliaContabPPDia.dfm | `TcfgRelConciliaContabPPDia` | Conciliação Contábil Diária - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 12 | `EMPRESTIMO/Fontes` | CRelConciliaContabPPPeriodo.dfm | `TcfgRelConciliaContabPPPeriodo` | Conciliação Contábil (período) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 13 | `EMPRESTIMO/Fontes` | CRelConciliaFolhaPP.dfm | `TcfgRelConciliaFolhaPP` | — | 2 - Filtro/impressão de relatório | compilado |
| 14 | `EMPRESTIMO/Fontes` | CRelConfereEnvioContrato.dfm | `TcfgRelConfereEnvioContrato` | Conferência de Valores Enviados / Recebidos (por Contrato) | 2 - Filtro/impressão de relatório | compilado |
| 15 | `EMPRESTIMO/Fontes` | CRelConfereEnvioFolha.dfm | `TcfgRelConfereEnvioFolha` | Rubricas Enviadas | 2 - Filtro/impressão de relatório | compilado |
| 16 | `EMPRESTIMO/Fontes` | CRelConfereEnvioFolhaAnal.dfm | `TcfgRelConfereEnvioFolhaAnal` | Conferência de Envio para Folha (analítico por Contrato) | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 17 | `EMPRESTIMO/Fontes` | CRelConfereParcela.dfm | `TcfgRelConfereParcela` | Conferência do Valor das Parcelas Geradas | 2 - Filtro/impressão de relatório | compilado |
| 18 | `EMPRESTIMO/Fontes` | CRelConferePlanilha.dfm | `TcfgRelConferePlanilha` | Conferência de Planilhas | 2 - Filtro/impressão de relatório | compilado |
| 19 | `EMPRESTIMO/Fontes` | CRelContaCorrente.dfm | `TcfgRelContaCorrente` | Conta Corrente | 2 - Filtro/impressão de relatório | compilado |
| 20 | `EMPRESTIMO/Fontes` | CRelContratoDuplicidade.dfm | `TcfgRelContratoDuplicidade` | Contratos Em Duplicidade | 2 - Filtro/impressão de relatório | compilado |
| 21 | `EMPRESTIMO/Fontes` | CRelContratoSemParcela.dfm | `TcfgRelContratoSemParcela` | Contratos Sem Parcelas Geradas | 2 - Filtro/impressão de relatório | compilado |
| 22 | `EMPRESTIMO/Fontes` | CRelContrConc.dfm | `TcfgRelContrConc` | Empréstimos Concedidos (por Plano / Patrocinadora) | 2 - Filtro/impressão de relatório | compilado |
| 23 | `EMPRESTIMO/Fontes` | CRelContrConcSint.dfm | `TcfgRelContrConcSint` | Empréstimos Concedidos (por Tipo de Contrato) | 2 - Filtro/impressão de relatório | compilado |
| 24 | `EMPRESTIMO/Fontes` | CRelDividaDuvidoso.dfm | `TcfgRelDividaDuvidoso` | Provisão para Créditos de Recebimento Duvidoso | 2 - Filtro/impressão de relatório | compilado |
| 25 | `EMPRESTIMO/Fontes` | CRelDividas.dfm | `TcfgRelDividas` | Valores Devidos | 2 - Filtro/impressão de relatório | compilado |
| 26 | `EMPRESTIMO/Fontes` | CRelDividasAnalitico.dfm | `TcfgRelDividasAnalitico` | Valores Devidos (Analítico) | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 27 | `EMPRESTIMO/Fontes` | CRelDividasIndexador.dfm | `TcfgRelDividasIndexador` | Valores Devidos por Indexador | 2 - Filtro/impressão de relatório | compilado |
| 28 | `EMPRESTIMO/Fontes` | CRelDividasMutuario.dfm | `TcfgRelDividasMutuario` | Valores Devidos (Analítico) | 2 - Filtro/impressão de relatório | compilado |
| 29 | `EMPRESTIMO/Fontes` | CRelDividasPP.dfm | `TcfgRelDividasPP` | Valores Devidos - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 30 | `EMPRESTIMO/Fontes` | CRelDividasTipoContrato.dfm | `TcfgRelDividasTipoContrato` | Valores Devidos por Tipo de Contrato | 2 - Filtro/impressão de relatório | compilado |
| 31 | `EMPRESTIMO/Fontes` | CRelFalecimento.dfm | `TcfgRelFalecimento` | Quitações por Falecimento | 2 - Filtro/impressão de relatório | compilado |
| 32 | `EMPRESTIMO/Fontes` | CRelFalecimentoSemQuitacao.dfm | `TcfgRelFalecimentoSemQuitacao` | Mutuários Falecidos com Contratos não Quitados | 2 - Filtro/impressão de relatório | compilado |
| 33 | `EMPRESTIMO/Fontes` | cRelFechaCarteiraLinearPP.dfm | `TcfgRelFechaCarteiraLinearPP` | — | 2 - Filtro/impressão de relatório | compilado |
| 34 | `EMPRESTIMO/Fontes` | cRelFechamentoCarteira.dfm | `TcfgRelFechamentoCarteira` | Resumo da Carteira - Visão Saldo | 2 - Filtro/impressão de relatório | compilado |
| 35 | `EMPRESTIMO/Fontes` | cRelFechamentoCarteiraCaixa.dfm | `TcfgRelFechamentoCarteiraCaixa` | Resumo da Carteira (visão Caixa) | 2 - Filtro/impressão de relatório | compilado |
| 36 | `EMPRESTIMO/Fontes` | cRelFechamentoCarteiraLinear.dfm | `TcfgRelFechamentoCarteiraLinear` | Resumo da Carteira (visão Caixa - Linear) | 2 - Filtro/impressão de relatório | compilado |
| 37 | `EMPRESTIMO/Fontes` | cRelFechamentoCarteiraPP.dfm | `TcfgRelFechamentoCarteiraPP` | Resumo da Carteira - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 38 | `EMPRESTIMO/Fontes` | CRelHistXTmpDesc.dfm | `TcfgRelHistXTmpDesc` | Divergências entre Histórico e TMPDESC | 2 - Filtro/impressão de relatório | compilado |
| 39 | `EMPRESTIMO/Fontes` | CRelInadimplencia.dfm | `TfrmCRelInadimplencia` | Relatório de Inadimplência | 2 - Filtro/impressão de relatório | compilado |
| 40 | `EMPRESTIMO/Fontes` | CRelInscPend.dfm | `TcfgRelInscPend` | Inscrições não Efetivadas | 2 - Filtro/impressão de relatório | compilado |
| 41 | `EMPRESTIMO/Fontes` | CRelInscrConc.dfm | `TcfgRelInscrConc` | Inscrições pendentes por faixa de datas | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 42 | `EMPRESTIMO/Fontes` | CRelItemAnalitico.dfm | `TcfgRelItemAnalitico` | Saldo de Parcelas | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 43 | `EMPRESTIMO/Fontes` | cRelItensAberto.dfm | `TcfgRelItensAberto` | Itens em Aberto - Analítico | 2 - Filtro/impressão de relatório | compilado |
| 44 | `EMPRESTIMO/Fontes` | CRelItensDiverg.dfm | `TcfgRelItensDiverg` | Itens com divergência | 2 - Filtro/impressão de relatório | compilado |
| 45 | `EMPRESTIMO/Fontes` | CRelItensEnviados.dfm | `TcfgRelItensEnviados` | Itens Enviados | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 46 | `EMPRESTIMO/Fontes` | CRelItensEnvioAnal.dfm | `TcfgRelItensEnvioAnal` | — | 2 - Filtro/impressão de relatório | compilado |
| 47 | `EMPRESTIMO/Fontes` | CRelItensEnvioAnalCAPCAR.dfm | `TcfgRelItensEnvioAnalCAPCAR` | Valores Enviados/Recebidos (Financeiro) - analítico | 2 - Filtro/impressão de relatório | compilado |
| 48 | `EMPRESTIMO/Fontes` | CRelItensEnvioAnalContrato.dfm | `TcfgRelItensEnvioAnalContrato` | — | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 49 | `EMPRESTIMO/Fontes` | CRelItensEnvioAnalItem.dfm | `TcfgRelItensEnvioAnalItem` | — | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 50 | `EMPRESTIMO/Fontes` | CRelItensEnvioAnalMutuario.dfm | `TcfgRelItensEnvioAnalMutuario` | — | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 51 | `EMPRESTIMO/Fontes` | CRelItensEnvioCapCarPP.dfm | `TcfgRelItensEnvioCapCarPP` | — | 2 - Filtro/impressão de relatório | compilado |
| 52 | `EMPRESTIMO/Fontes` | CRelItensEnvioContrato.dfm | `TcfgRelItensEnvioContrato` | — | 2 - Filtro/impressão de relatório | compilado |
| 53 | `EMPRESTIMO/Fontes` | CRelItensEnvioContratoCAPCAR.dfm | `TcfgRelItensEnvioContratoCAPCAR` | — | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 54 | `EMPRESTIMO/Fontes` | cRelItensEnvioSint.dfm | `TcfgRelItensEnvioSint` | — | 2 - Filtro/impressão de relatório | compilado |
| 55 | `EMPRESTIMO/Fontes` | cRelItensEnvioSintCAPCAR.dfm | `TcfgRelItensEnvioSintCAPCAR` | Valores Enviados/Recebidos (Financeiro) - sintético por Item | 2 - Filtro/impressão de relatório | compilado |
| 56 | `EMPRESTIMO/Fontes` | cRelItensGeradosAnal.dfm | `TcfgRelItensGeradosAnal` | Itens Gerados (Analítico) | 2 - Filtro/impressão de relatório | compilado |
| 57 | `EMPRESTIMO/Fontes` | cRelItensGeradosDia.dfm | `TcfgRelItensGeradosDia` | Itens Gerados por Dia (Sintético) | 2 - Filtro/impressão de relatório | compilado |
| 58 | `EMPRESTIMO/Fontes` | cRelItensGeradosDiaPP.dfm | `TcfgRelItensGeradosDiaPP` | Itens Gerados por Dia (Sintético) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 59 | `EMPRESTIMO/Fontes` | cRelItensGeradosSint.dfm | `TcfgRelItensGeradosSint` | Itens Gerados por Evento (Sintético) | 2 - Filtro/impressão de relatório | compilado |
| 60 | `EMPRESTIMO/Fontes` | cRelItensGeradosSintPP.dfm | `TcfgRelItensGeradosSintPP` | Itens Gerados por Evento (Sintético) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 61 | `EMPRESTIMO/Fontes` | cRelItensGeradosTipoContr.dfm | `TcfgRelItensGeradosTipoContr` | Itens Gerados por Tipo de Contrato (Sintético) | 2 - Filtro/impressão de relatório | compilado |
| 62 | `EMPRESTIMO/Fontes` | CRelItensNaoEnviados.dfm | `TcfgRelItensNaoEnviados` | Contratos com Itens Não Enviados | 2 - Filtro/impressão de relatório | compilado |
| 63 | `EMPRESTIMO/Fontes` | CRelMovContr.dfm | `TcfgRelMovContr` | Movimentação por Contrato | 2 - Filtro/impressão de relatório | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 64 | `EMPRESTIMO/Fontes` | CRelParamFin.dfm | `TcfgRelParamFin` | Empréstimos - Parametrização Financeira | 2 - Filtro/impressão de relatório | compilado |
| 65 | `EMPRESTIMO/Fontes` | CRelParcGer.dfm | `TcfgRelParcGer` | Parcelas Geradas | 2 - Filtro/impressão de relatório | compilado |
| 66 | `EMPRESTIMO/Fontes` | CRelParcGerPatro.dfm | `TcfgRelParcGerPatro` | Parcelas Geradas - por Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 67 | `EMPRESTIMO/Fontes` | CRelParcGerSint.dfm | `TcfgRelParcGerSint` | Parcelas Geradas (Sintético) | 2 - Filtro/impressão de relatório | compilado |
| 68 | `EMPRESTIMO/Fontes` | CRelProtocolo.dfm | `TcfgRelProtocolo` | Protocolo de Solicitação de Empréstimos | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 69 | `EMPRESTIMO/Fontes` | CRelProvPerdaFUNCEF.dfm | `TcfgRelProvPerdaFUNCEF` | Provisão para Perdas (sintético) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 70 | `EMPRESTIMO/Fontes` | CRelProvPerdaOutros.dfm | `TcfgRelProvPerdaOutros` | Provisão para Perdas (sintético) - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 71 | `EMPRESTIMO/Fontes` | CRelQuitacaoComSaldoDevedor.dfm | `TcfgRelQuitacaoComSaldoDevedor` | Quitações Com Saldo Devedor ou Valores em Aberto | 2 - Filtro/impressão de relatório | compilado |
| 72 | `EMPRESTIMO/Fontes` | CRelQuitacaoNaoEfetivada.dfm | `TcfgRelQuitacaoNaoEfetivada` | Quitações não Efetivadas | 2 - Filtro/impressão de relatório | compilado |
| 73 | `EMPRESTIMO/Fontes` | CRelRepasseSeguro.dfm | `TcfgRelRepasseSeguro` | Relatório de Repasse de Seguro | 2 - Filtro/impressão de relatório | compilado |
| 74 | `EMPRESTIMO/Fontes` | cRelResumoCarteiraPlanoPatro.dfm | `TcfgRelResumoCarteiraPlanoPatro` | Resumo da Carteira | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 75 | `EMPRESTIMO/Fontes` | cRelResumoContratoCaixa.dfm | `TcfgRelResumoContratoCaixa` | Resumo de Contratos (visão Caixa) | 2 - Filtro/impressão de relatório | compilado |
| 76 | `EMPRESTIMO/Fontes` | cRelResumoContratoSaldo.dfm | `TcfgRelResumoContratoSaldo` | Resumo de Contratos - visão Saldo | 2 - Filtro/impressão de relatório | compilado |
| 77 | `EMPRESTIMO/Fontes` | CRelRetencaoIOF.dfm | `TcfgRelRetencaoIOF` | Retenção de IOF | 2 - Filtro/impressão de relatório | compilado |
| 78 | `EMPRESTIMO/Fontes` | CRelRetencaoIOFPP.dfm | `TcfgRelRetencaoIOFPP` | Retenção de IOF - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 79 | `EMPRESTIMO/Fontes` | CRelTotalItem.dfm | `TcfgRelTotalItem` | Empréstimos - Totalização de Items | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 80 | `EMPRESTIMO/Fontes` | CRelValCred.dfm | `TcfgRelValCred` | Valores a Creditar | 2 - Filtro/impressão de relatório | compilado |
| 81 | `EMPRESTIMO/Fontes` | CRelValCredPlanoPatro.dfm | `TcfgRelValCredPlanoPatro` | Valores a Creditar - por Plano e Patrocinadora | 2 - Filtro/impressão de relatório | compilado |
| 82 | `EMPRESTIMO/Fontes` | CRelValorAtualizado.dfm | `TcfgRelValorAtualizado` | Demonstrativo de Valores em Aberto | 2 - Filtro/impressão de relatório | compilado |
| 83 | `EMPRESTIMO/Fontes` | CRelValRecTMPDESC.dfm | `TcfgRelValRecTMPDESC` | Valores a Receber (Analítico) | 2 - Filtro/impressão de relatório | compilado |
| 84 | `EMPRESTIMO/Fontes` | CRelValRecTMPDESCContrato.dfm | `TcfgRelValRecTMPDESCContrato` | Valores a Receber (Analítico) | 2 - Filtro/impressão de relatório | compilado |
| 85 | `EMPRESTIMO/Fontes` | CRelValRecTMPDESCItem.dfm | `TcfgRelValRecTMPDESCItem` | Valores a Receber (Analítico) | 2 - Filtro/impressão de relatório | compilado |
| 86 | `EMPRESTIMO/Fontes` | dCalcEmptmo.dfm | `TdtmCalcEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 87 | `EMPRESTIMO/Fontes` | DDividaEP.dfm | `TdtmDividaEP` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 88 | `EMPRESTIMO/Fontes` | dEmptmo.dfm | `TdtmEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 89 | `EMPRESTIMO/Fontes` | DIntegraEmptmo.dfm | `TdtmIntegraEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 90 | `EMPRESTIMO/Fontes` | DLookEmptmo.dfm | `TdtmLookEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 91 | `EMPRESTIMO/Fontes` | dMS.dfm | `TdtmMS` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Integra) |
| 92 | `EMPRESTIMO/Fontes` | dQuitacao.dfm | `TdtmQuitacao` | — | 3 - Componente não visual | fora do build (não compilado) |
| 93 | `EMPRESTIMO/Fontes` | dQuitacaoEmptmo.dfm | `TdtmQuitacaoEmptmo` | — | 3 - Componente não visual | fora do build (não compilado) |
| 94 | `EMPRESTIMO/Fontes` | dRelAnaliseContabil.dfm | `TdtmRelAnaliseContabil` | dtmRelAnaliseContabil | 3 - Componente não visual | compilado |
| 95 | `EMPRESTIMO/Fontes` | DRelatorios.dfm | `TdtmRelatorios` | — | 3 - Componente não visual | fora do build (não compilado) |
| 96 | `EMPRESTIMO/Fontes` | dRelConciliaCaPCar.dfm | `TdtmRelConciliaCapCar` | dtmRelConciliaCapCar | 3 - Componente não visual | compilado |
| 97 | `EMPRESTIMO/Fontes` | dRelConciliaContab.dfm | `TdtmRelConciliaContab` | dtmRelConciliaContab | 3 - Componente não visual | compilado |
| 98 | `EMPRESTIMO/Fontes` | dRelConciliaContabCC.dfm | `TdtmRelConciliaContabCC` | dtmRelConciliaContabCC | 3 - Componente não visual | compilado |
| 99 | `EMPRESTIMO/Fontes` | dRelConciliaContabCCDia.dfm | `TdtmRelConciliaContabCCDia` | dtmRelConciliaContabCCDia | 3 - Componente não visual | fora do build (não compilado) |
| 100 | `EMPRESTIMO/Fontes` | dRelConciliaContabCCPeriodo.dfm | `TdtmRelConciliaContabCCPeriodo` | dtmRelConciliaContabCCPeriodo | 3 - Componente não visual | compilado |
| 101 | `EMPRESTIMO/Fontes` | dRelConciliaContabDia.dfm | `TdtmRelConciliaContabDia` | dtmRelConciliaContabDia | 3 - Componente não visual | fora do build (não compilado) |
| 102 | `EMPRESTIMO/Fontes` | dRelConciliaContabPeriodo.dfm | `TdtmRelConciliaContabPeriodo` | dtmRelConciliaContabPeriodo | 3 - Componente não visual | compilado |
| 103 | `EMPRESTIMO/Fontes` | dRelConciliaContabPP.dfm | `TdtmRelConciliaContabPP` | dtmRelConciliaContabPP | 3 - Componente não visual | compilado |
| 104 | `EMPRESTIMO/Fontes` | dRelConciliaContabPPDia.dfm | `TdtmRelConciliaContabPPDia` | dtmRelConciliaContabPPDia | 3 - Componente não visual | fora do build (não compilado) |
| 105 | `EMPRESTIMO/Fontes` | dRelConciliaContabPPPeriodo.dfm | `TdtmRelConciliaContabPPPeriodo` | dtmRelConciliaContabPPPeriodo | 3 - Componente não visual | compilado |
| 106 | `EMPRESTIMO/Fontes` | dRelConciliaFolhaPP.dfm | `TdtmRelConciliaFolhaPP` | dtmRelConciliaFolhaPP | 3 - Componente não visual | compilado |
| 107 | `EMPRESTIMO/Fontes` | dRelConfereEnvioContrato.dfm | `TdtmRelConfereEnvioContrato` | dtmRelConfereEnvioContrato | 3 - Componente não visual | compilado |
| 108 | `EMPRESTIMO/Fontes` | dRelConfereEnvioFolha.dfm | `TdtmRelConfereEnvioFolha` | dtmRelConfereEnvioFolha | 3 - Componente não visual | compilado |
| 109 | `EMPRESTIMO/Fontes` | dRelConfereEnvioFolhaAnal.dfm | `TdtmRelConfereEnvioFolhaAnal` | dtmRelConfereEnvioFolhaAnal | 3 - Componente não visual | fora do build (não compilado) |
| 110 | `EMPRESTIMO/Fontes` | dRelConfereParcela.dfm | `TdtmRelConfereParcela` | dtmRelConfereParcela | 3 - Componente não visual | compilado |
| 111 | `EMPRESTIMO/Fontes` | dRelConferePlanilha.dfm | `TdtmRelConferePlanilha` | dtmRelConferePlanilha | 3 - Componente não visual | compilado |
| 112 | `EMPRESTIMO/Fontes` | dRelContaCorrente.dfm | `TdtmRelContaCorrente` | dtmRelContaCorrente | 3 - Componente não visual | compilado |
| 113 | `EMPRESTIMO/Fontes` | dRelContratoDuplicidade.dfm | `TdtmRelContratoDuplicidade` | dtmRelContratoDuplicidade | 3 - Componente não visual | compilado |
| 114 | `EMPRESTIMO/Fontes` | dRelContratoSemParcela.dfm | `TdtmRelContratoSemParcela` | dtmRelContratoSemParcela | 3 - Componente não visual | compilado |
| 115 | `EMPRESTIMO/Fontes` | dRelContrConc.dfm | `TdtmRelContrConc` | dRelContrConc | 3 - Componente não visual | compilado |
| 116 | `EMPRESTIMO/Fontes` | dRelContrConcSint.dfm | `TdtmRelContrConcSint` | dRelContrConc | 3 - Componente não visual | compilado |
| 117 | `EMPRESTIMO/Fontes` | dRelDividaDuvidoso.dfm | `TdtmRelDividaDuvidoso` | dtmRelDividaDuvidoso | 3 - Componente não visual | compilado |
| 118 | `EMPRESTIMO/Fontes` | dRelDividas.dfm | `TdtmRelDividas` | dtmRelDividas | 3 - Componente não visual | compilado |
| 119 | `EMPRESTIMO/Fontes` | dRelDividasAnalitico.dfm | `TdtmRelDividasAnalitico` | dtmRelDividasAnalitico | 3 - Componente não visual | fora do build (não compilado) |
| 120 | `EMPRESTIMO/Fontes` | dRelDividasIndexador.dfm | `TdtmRelDividasIndexador` | dtmRelDividasIndexador | 3 - Componente não visual | compilado |
| 121 | `EMPRESTIMO/Fontes` | dRelDividasMutuario.dfm | `TdtmRelDividasMutuario` | dtmRelDividasMutuario | 3 - Componente não visual | compilado |
| 122 | `EMPRESTIMO/Fontes` | dRelDividasPP.dfm | `TdtmRelDividasPP` | dtmRelDividasPP | 3 - Componente não visual | compilado |
| 123 | `EMPRESTIMO/Fontes` | dRelDividasTipoContrato.dfm | `TdtmRelDividasTipoContrato` | dtmRelDividasTipoContrato | 3 - Componente não visual | compilado |
| 124 | `EMPRESTIMO/Fontes` | dRelFalecimento.dfm | `TdtmRelFalecimento` | dRelRetencaoIOF | 3 - Componente não visual | compilado |
| 125 | `EMPRESTIMO/Fontes` | dRelFalecimentoSemQuitacao.dfm | `TdtmRelFalecimentoSemQuitacao` | dRelRetencaoIOF | 3 - Componente não visual | compilado |
| 126 | `EMPRESTIMO/Fontes` | dRelFechaCarteiraLinearPP.dfm | `TdtmRelFechaCarteiraLinearPP` | dtmRelFechaCarteiraLinearPP | 3 - Componente não visual | compilado |
| 127 | `EMPRESTIMO/Fontes` | dRelFechamentoCarteira.dfm | `TdtmRelFechamentoCarteira` | dtmRelFechamentoCarteira | 3 - Componente não visual | compilado |
| 128 | `EMPRESTIMO/Fontes` | dRelFechamentoCarteira_old.dfm | `TdtmRelFechamentoCarteira_old` | dtmRelFechamentoCarteira_old | 3 - Componente não visual | fora do build (não compilado) |
| 129 | `EMPRESTIMO/Fontes` | dRelFechamentoCarteiraCaixa.dfm | `TdtmRelFechamentoCarteiraCaixa` | dtmRelFechamentoCarteiraCaixa | 3 - Componente não visual | compilado |
| 130 | `EMPRESTIMO/Fontes` | dRelFechamentoCarteiraLinear.dfm | `TdtmRelFechamentoCarteiraLinear` | dtmRelFechamentoCarteiraLinear | 3 - Componente não visual | compilado |
| 131 | `EMPRESTIMO/Fontes` | dRelFechamentoCarteiraPP.dfm | `TdtmRelFechamentoCarteiraPP` | dtmRelFechamentoCarteiraPP | 3 - Componente não visual | compilado |
| 132 | `EMPRESTIMO/Fontes` | dRelHistXTmpDesc.dfm | `TdtmRelHistXTmpDesc` | Divergências entre Histórico e TMPDESC | 3 - Componente não visual | compilado |
| 133 | `EMPRESTIMO/Fontes` | dRelInscPend.dfm | `TdtmRelInscPend` | dRelInscPend - Inscrições Pendentes | 3 - Componente não visual | compilado |
| 134 | `EMPRESTIMO/Fontes` | dRelInscrConc.dfm | `TdtmRelInscrConc` | dtmRelInscrConc | 3 - Componente não visual | fora do build (não compilado) |
| 135 | `EMPRESTIMO/Fontes` | dRelInscricao.dfm | `TdtmRelInscricao` | dtmRelInscricao | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 136 | `EMPRESTIMO/Fontes` | dRelItemAnalitico.dfm | `TdtmRelItemAnalitico` | dtmRelItemAnalitico | 3 - Componente não visual | fora do build (não compilado) |
| 137 | `EMPRESTIMO/Fontes` | dRelItensAberto.dfm | `TdtmRelItensAberto` | dtmRelItensAberto | 3 - Componente não visual | compilado |
| 138 | `EMPRESTIMO/Fontes` | dRelItensDiverg.dfm | `TdtmRelItensDiverg` | dRelInscPend - Inscrições Pendentes | 3 - Componente não visual | compilado |
| 139 | `EMPRESTIMO/Fontes` | dRelItensEnviados.dfm | `TdtmRelItensEnviados` | dtmRelItensEnviados | 3 - Componente não visual | fora do build (não compilado) |
| 140 | `EMPRESTIMO/Fontes` | dRelItensEnvioAnal.dfm | `TdtmRelItensEnvioAnal` | — | 3 - Componente não visual | compilado |
| 141 | `EMPRESTIMO/Fontes` | dRelItensEnvioAnalCAPCAR.dfm | `TdtmRelItensEnvioAnalCAPCAR` | — | 3 - Componente não visual | compilado |
| 142 | `EMPRESTIMO/Fontes` | dRelItensEnvioAnalContrato.dfm | `TdtmRelItensEnvioAnalContrato` | — | 3 - Componente não visual | fora do build (não compilado) |
| 143 | `EMPRESTIMO/Fontes` | dRelItensEnvioAnalItem.dfm | `TdtmRelItensEnvioAnalItem` | — | 3 - Componente não visual | fora do build (não compilado) |
| 144 | `EMPRESTIMO/Fontes` | dRelItensEnvioAnalMutuario.dfm | `TdtmRelItensEnvioAnalMutuario` | — | 3 - Componente não visual | fora do build (não compilado) |
| 145 | `EMPRESTIMO/Fontes` | dRelItensEnvioCapCarPP.dfm | `TdtmRelItensEnvioCapCarPP` | dtmRelItensEnvioCapCarPP | 3 - Componente não visual | compilado |
| 146 | `EMPRESTIMO/Fontes` | dRelItensEnvioContrato.dfm | `TdtmRelItensEnvioContrato` | — | 3 - Componente não visual | compilado |
| 147 | `EMPRESTIMO/Fontes` | dRelItensEnvioContratoCAPCAR.dfm | `TdtmRelItensEnvioContratoCAPCAR` | — | 3 - Componente não visual | fora do build (não compilado) |
| 148 | `EMPRESTIMO/Fontes` | dRelItensEnvioSint.dfm | `TdtmRelItensEnvioSint` | — | 3 - Componente não visual | compilado |
| 149 | `EMPRESTIMO/Fontes` | dRelItensEnvioSintCAPCAR.dfm | `TdtmRelItensEnvioSintCAPCAR` | — | 3 - Componente não visual | compilado |
| 150 | `EMPRESTIMO/Fontes` | dRelItensGeradosAnal.dfm (binário) | `TdtmRelItensGeradosAnal` | dtmRelItensGeradosAnal | 3 - Componente não visual | compilado |
| 151 | `EMPRESTIMO/Fontes` | dRelItensGeradosDia.dfm | `TdtmRelItensGeradosDia` | dtmRelItensGeradosDia | 3 - Componente não visual | compilado |
| 152 | `EMPRESTIMO/Fontes` | dRelItensGeradosDiaPP.dfm | `TdtmRelItensGeradosDiaPP` | dtmRelItensGeradosDiaPP | 3 - Componente não visual | compilado |
| 153 | `EMPRESTIMO/Fontes` | dRelItensGeradosSint.dfm | `TdtmRelItensGeradosSint` | dtmRelItensGeradosSint | 3 - Componente não visual | compilado |
| 154 | `EMPRESTIMO/Fontes` | dRelItensGeradosSintPP.dfm | `TdtmRelItensGeradosSintPP` | dtmRelItensGeradosSintPP | 3 - Componente não visual | compilado |
| 155 | `EMPRESTIMO/Fontes` | dRelItensGeradosTipoContr.dfm | `TdtmRelItensGeradosTipoContr` | dtmRelItensGeradosTipoContr | 3 - Componente não visual | compilado |
| 156 | `EMPRESTIMO/Fontes` | dRelItensNaoEnviados.dfm (binário) | `TdtmRelItensNaoEnviados` | — | 3 - Componente não visual | compilado |
| 157 | `EMPRESTIMO/Fontes` | dRelMovContr.dfm | `TdtmRelMovContr` | dRelMovContr | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 158 | `EMPRESTIMO/Fontes` | dRelParamFin.dfm | `TdtmRelParamFin` | dRelParamFin | 3 - Componente não visual | compilado |
| 159 | `EMPRESTIMO/Fontes` | dRelParcGer.dfm | `TdtmRelParcGer` | dtmRelParcGer | 3 - Componente não visual | compilado |
| 160 | `EMPRESTIMO/Fontes` | dRelParcGerPatro.dfm | `TdtmRelParcGerPatro` | dtmRelParcGerPatro | 3 - Componente não visual | compilado |
| 161 | `EMPRESTIMO/Fontes` | dRelParcGerSint.dfm | `TdtmRelParcGerSint` | dtmRelParcGerSint | 3 - Componente não visual | compilado |
| 162 | `EMPRESTIMO/Fontes` | dRelProtocolo.dfm | `TdtmRelProtocolo` | dtmRelProtocolo | 3 - Componente não visual | fora do build (não compilado) |
| 163 | `EMPRESTIMO/Fontes` | dRelQuitacaoComSaldoDevedor.dfm | `TdtmRelQuitacaoComSaldoDevedor` | dtmRelQuitacaoComSaldoDevedor | 3 - Componente não visual | compilado |
| 164 | `EMPRESTIMO/Fontes` | dRelQuitacaoNaoEfetivada.dfm | `TdtmRelQuitacaoNaoEfetivada` | dtmRelQuitacaoNaoEfetivada | 3 - Componente não visual | compilado |
| 165 | `EMPRESTIMO/Fontes` | DRelRepasseSeguro.dfm | `TdtmRelRepasseSeguro` | dtmRelRepasseSeguro | 3 - Componente não visual | compilado |
| 166 | `EMPRESTIMO/Fontes` | dRelResumoCarteiraPlanoPatro.dfm | `TdtmRelResumoCarteiraPlanoPatro` | dtmRelResumoCarteiraPlanoPatro | 3 - Componente não visual | fora do build (não compilado) |
| 167 | `EMPRESTIMO/Fontes` | dRelResumoContratoCaixa.dfm | `TdtmRelResumoContratoCaixa` | dtmRelResumoContratoCaixa | 3 - Componente não visual | compilado |
| 168 | `EMPRESTIMO/Fontes` | dRelResumoContratoSaldo.dfm | `TdtmRelResumoContratoSaldo` | dtmRelResumoContratoSaldo | 3 - Componente não visual | compilado |
| 169 | `EMPRESTIMO/Fontes` | dRelRetencaoIOF.dfm | `TdtmRelRetencaoIOF` | dRelRetencaoIOF | 3 - Componente não visual | compilado |
| 170 | `EMPRESTIMO/Fontes` | dRelRetencaoIOFPP.dfm | `TdtmRelRetencaoIOFPP` | dRelRetencaoIOFPP | 3 - Componente não visual | compilado |
| 171 | `EMPRESTIMO/Fontes` | dRelTotalItem.dfm | `TdtmRelTotalItem` | dRelTotalItem | 3 - Componente não visual | fora do build (não compilado) |
| 172 | `EMPRESTIMO/Fontes` | dRelValCred.dfm | `TdtmRelValCred` | dtmRelValCred | 3 - Componente não visual | compilado |
| 173 | `EMPRESTIMO/Fontes` | dRelValCred_old.dfm | `TdtmRelValCred_old` | dRelValCred | 3 - Componente não visual | fora do build (não compilado) |
| 174 | `EMPRESTIMO/Fontes` | dRelValCredPlanoPatro.dfm | `TdtmRelValCredPlanoPatro` | dtmRelValCredPlanoPatro | 3 - Componente não visual | compilado |
| 175 | `EMPRESTIMO/Fontes` | dRelValorAtualizado.dfm | `TdtmRelValorAtualizado` | dRelMovContr | 3 - Componente não visual | compilado |
| 176 | `EMPRESTIMO/Fontes` | dRelValRecTMPDESC.dfm | `TdtmRelValRecTMPDESC` | dtmRelValRecTMPDESC | 3 - Componente não visual | compilado |
| 177 | `EMPRESTIMO/Fontes` | dRelValRecTMPDESCContrato.dfm | `TdtmRelValRecTMPDESCContrato` | dtmRelValRecTMPDESCContrato | 3 - Componente não visual | compilado |
| 178 | `EMPRESTIMO/Fontes` | dRelValRecTMPDESCItem.dfm | `TdtmRelValRecTMPDESCItem` | dtmRelValRecTMPDESCItem | 3 - Componente não visual | compilado |
| 179 | `EMPRESTIMO/Fontes` | FAcertaSequence.dfm | `TfrmAcertaSequence` | Acerto de Controles Internos | 1 - Tela interativa | fora do build (não compilado) |
| 180 | `EMPRESTIMO/Fontes` | FAjusteFormaEnvio.dfm (binário) | `TfrmAjusteFormaEnvio` | Ajuste da Forma de Envio | 1 - Tela interativa | compilado |
| 181 | `EMPRESTIMO/Fontes` | FAlteracaoLoteDataVencimento.dfm | `TFrmAlteracaoLoteDataVencimento` | Alteração em Lote da Data de Vencimento | 1 - Tela interativa | compilado |
| 182 | `EMPRESTIMO/Fontes` | FBloqConcessao.dfm | `TFrmBloqConcessao` | Bloqueio de Concessão | 1 - Tela interativa | compilado |
| 183 | `EMPRESTIMO/Fontes` | FCadAssinaturaContrato.dfm | `TfrmAssinaturaContrato` | Assinatura de Contrato Padrão | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 184 | `EMPRESTIMO/Fontes` | FCadastroCSImob.dfm | `TfrmCadastroCSImob` | frmCadastroCSImob | 4 - Indeterminado / infraestrutura | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 185 | `EMPRESTIMO/Fontes` | fCadastroEventoCobrancaEP.dfm | `TfrmCadastroEventoCobrancaEP` | Eventos de Cobrança | 1 - Tela interativa | compilado |
| 186 | `EMPRESTIMO/Fontes` | FCadastroPai.dfm (binário) | `TfrmCadastroPai` | CadastroPai | 4 - Indeterminado / infraestrutura | cópia não usada (o projeto usa cm/forms/source/fcadastropai.pas) |
| 187 | `EMPRESTIMO/Fontes` | FCadAvalista.dfm | `TfrmCadAvalista` | Cadastro de Avalista | 1 - Tela interativa | fora do build (não compilado) |
| 188 | `EMPRESTIMO/Fontes` | FCadBancoPortador.dfm | `TfrmCadBancoPortador` | Banco x Conta de Caixa x Forma de Pagamento | 1 - Tela interativa | compilado |
| 189 | `EMPRESTIMO/Fontes` | FCadCCBaixaXPatro.dfm | `TfrmCadCCBaixaXPatro` | Parâmetros para Integração do Recebimento da(s) Patrocinadora(s) | 1 - Tela interativa | compilado |
| 190 | `EMPRESTIMO/Fontes` | fCadContratoPadrao.dfm | `TfrmCadastroContratoPadrao` | Cadastro de Contrato Padrão | 1 - Tela interativa | compilado |
| 191 | `EMPRESTIMO/Fontes` | FCadDatasPatro.dfm | `TfrmCadDatasPatro` | Datas por Patrocinadora | 1 - Tela interativa | compilado |
| 192 | `EMPRESTIMO/Fontes` | FCadHistMovEmptmo.dfm | `TfrmCadHistMovEmptmo` | — | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 193 | `EMPRESTIMO/Fontes` | FCadInscricaoREFER.dfm | `TfrmCadInscricaoREFER` | Inscrição em Empréstimo REFER | 1 - Tela interativa | fora do build (não compilado) |
| 194 | `EMPRESTIMO/Fontes` | FCadItem.dfm | `TFrmOkCancelarImob1` | FrmOkCancelarImob1 | 4 - Indeterminado / infraestrutura | fora do build (não compilado) |
| 195 | `EMPRESTIMO/Fontes` | FCadItemDetalhe.dfm | `TfrmCadItemDetalhe` | Detalhes | 1 - Tela interativa | compilado |
| 196 | `EMPRESTIMO/Fontes` | FCadItemEmptmo.dfm | `TfrmCadItemEmptmo` | Itens de Empréstimo | 1 - Tela interativa | compilado |
| 197 | `EMPRESTIMO/Fontes` | FCadItemXProcesso.dfm | `TfrmCadItemXProcesso` | Itens por Processo | 1 - Tela interativa | compilado |
| 198 | `EMPRESTIMO/Fontes` | FCadItemxTipoContrato.dfm | `TfrmCadItemxTipoContrato` | Itens do Tipo de Contrato | 1 - Tela interativa | compilado |
| 199 | `EMPRESTIMO/Fontes` | fCadLancaSeguro.dfm | `TfrmLancaDeposito` | Controle de Depósito de Repasse de Seguro | 1 - Tela interativa | compilado |
| 200 | `EMPRESTIMO/Fontes` | FCadMensagemContrato.dfm | `TFrmCadMensagemContrato` | Cadastro Mensagem para Contrato | 1 - Tela interativa | compilado |
| 201 | `EMPRESTIMO/Fontes` | FCadMotivo.dfm | `Tfrmcadmotivo` | Cadastro de Motivo | 1 - Tela interativa | fora do build (não compilado) |
| 202 | `EMPRESTIMO/Fontes` | fCadMotivoConcessao.dfm | `TfrmCadMotivoConcessao` | Motivo de bloqueio de concessão | 1 - Tela interativa | compilado |
| 203 | `EMPRESTIMO/Fontes` | FCadParamIntegraRec.dfm | `TfrmCadParamIntegraRec` | Parâmetros para Integração [Itens] | 1 - Tela interativa | compilado |
| 204 | `EMPRESTIMO/Fontes` | FCadPlanPrevXContabil.dfm | `TfrmCadPlanPrevXContabil` | Plano Previdenciário X Entidade Contábil | 1 - Tela interativa | compilado |
| 205 | `EMPRESTIMO/Fontes` | FCadPlanTipCont.dfm | `TfrmCadPlanTipCont` | Cadastro de Tipos de Contrato por Plano | 1 - Tela interativa | compilado |
| 206 | `EMPRESTIMO/Fontes` | FCadPortFormaxEmptmo.dfm | `TfrmCadPortFormaxEmptmo` | Conta-Caixa x Forma Recebimento do Módulo de Empréstimos | 1 - Tela interativa | compilado |
| 207 | `EMPRESTIMO/Fontes` | FCadProvento.dfm | `TFrmCadProvento` | Cadastro de Rubricas | 1 - Tela interativa | fora do build (não compilado) |
| 208 | `EMPRESTIMO/Fontes` | FCadSuspConcPlaPrev.dfm | `TfrmCadSuspConcPlaPrev` | Suspensão de Concessões por Plano Previdenciário | 1 - Tela interativa | compilado |
| 209 | `EMPRESTIMO/Fontes` | FCadTipoContratoEmptmo.dfm | `TfrmCadTipoContratoEmptmo` | Tipos de Contrato de Empréstimo | 1 - Tela interativa | compilado |
| 210 | `EMPRESTIMO/Fontes` | FCadTipoContrXSusp.dfm | `TfrmCadTipoContrXSusp` | Tipo de Suspensão Por Tipo de Contrato | 1 - Tela interativa | compilado |
| 211 | `EMPRESTIMO/Fontes` | FCadTipoContrXTipoContr.dfm | `TfrmCadTipoContrXTipoContr` | Tipos de Contratos Quitáveis por Tipo de Contrato | 1 - Tela interativa | compilado |
| 212 | `EMPRESTIMO/Fontes` | FCadTipoEmptmo.dfm | `TfrmCadTipoEmptmo` | Tipos de Empréstimo | 1 - Tela interativa | compilado |
| 213 | `EMPRESTIMO/Fontes` | FCadTipoSuspensao.dfm | `TfrmCadTipoSuspensao` | Tipos de Suspensão de Cobrança | 1 - Tela interativa | compilado |
| 214 | `EMPRESTIMO/Fontes` | FCadTMPDESC.dfm | `TfrmCadTMPDESC` | — | 1 - Tela interativa | compilado |
| 215 | `EMPRESTIMO/Fontes` | FCadUnidCentr.dfm | `TfrmCadUnidCentr` | Cadastro de Unidades Centralizadoras | 1 - Tela interativa | compilado |
| 216 | `EMPRESTIMO/Fontes` | FCadVerbaPlano.dfm | `TfrmCadVerbaPlano` | Cadastro de Verbas por Plano | 1 - Tela interativa | compilado |
| 217 | `EMPRESTIMO/Fontes` | FCadVerbas.dfm | `TfrmCadVerbas` | Cadastro de Verbas | 1 - Tela interativa | compilado |
| 218 | `EMPRESTIMO/Fontes` | FCadVerbasNovo.dfm | `TfrmCadVerbasNovo` | Distribuição de Verbas por Unidades Centralizadoras | 1 - Tela interativa | compilado |
| 219 | `EMPRESTIMO/Fontes` | fCancAlteracaoConcessao.dfm | `TfrmCancAlteracaoConcessao` | Cancelamento de Alteração de Concessão | 1 - Tela interativa | compilado |
| 220 | `EMPRESTIMO/Fontes` | FCancAmortizacao.dfm | `TfrmCancAmortizacao` | Cancelamento de Amortização | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 221 | `EMPRESTIMO/Fontes` | FCancAtualizacaoDiaria.dfm | `TfrmCancAtualizacaoDiaria` | Desfazer Atualização Diária | 1 - Tela interativa | fora do build (não compilado) |
| 222 | `EMPRESTIMO/Fontes` | fCancConcessao.dfm | `TfrmCancConcessao` | Cancelamento de Concessão | 1 - Tela interativa | compilado |
| 223 | `EMPRESTIMO/Fontes` | FCancContabLoteAjuste.dfm | `TfrmCancContabLoteAjuste` | Desfazer Contabilização em Lote de Ajustes | 1 - Tela interativa | compilado |
| 224 | `EMPRESTIMO/Fontes` | FCancContabLoteAmortizacao.dfm | `TfrmCancContabLoteAmortizacao` | Desfazer Contabilização em Lote de Amortizações | 1 - Tela interativa | compilado |
| 225 | `EMPRESTIMO/Fontes` | FCancContabLoteAtuDia.dfm | `TfrmCancContabLoteAtuDia` | Desfazer Contabilização em Lote de Atualização | 1 - Tela interativa | compilado |
| 226 | `EMPRESTIMO/Fontes` | FCancContabLoteConcessao.dfm | `TfrmCancContabLoteConcessao` | Desfazer Contabilização em Lote de Concessões | 1 - Tela interativa | compilado |
| 227 | `EMPRESTIMO/Fontes` | FCancContabLoteEncargo.dfm | `TfrmCancContabLoteEncargo` | Desfazer Contabilização em Lote de Encargos | 1 - Tela interativa | compilado |
| 228 | `EMPRESTIMO/Fontes` | FCancContabLotePrestacao.dfm | `TfrmCancContabLotePrestacao` | Desfazer Contabilização em Lote de Prestações | 1 - Tela interativa | compilado |
| 229 | `EMPRESTIMO/Fontes` | FCancContabLoteQuitacao.dfm | `TfrmCancContabLoteQuitacao` | Desfazer Contabilização em Lote de Quitações | 1 - Tela interativa | compilado |
| 230 | `EMPRESTIMO/Fontes` | FCancEnvio.dfm | `TfrmCancEnvio` | Desfazer Envio | 1 - Tela interativa | compilado |
| 231 | `EMPRESTIMO/Fontes` | FCancEnvioLoteConcessao.dfm | `TfrmCancEnvioLoteConcessao` | Desfazer Envio em Lote de Concessões | 1 - Tela interativa | compilado |
| 232 | `EMPRESTIMO/Fontes` | FCancEnvioLoteSeguro.dfm | `TfrmCancEnvioLoteSeguro` | Desfazer Envio em Lote de Seguros | 1 - Tela interativa | compilado |
| 233 | `EMPRESTIMO/Fontes` | FCancGeraParcela.dfm | `TfrmCancGeraParcela` | Geração Mensal de Parcelas | 1 - Tela interativa | compilado |
| 234 | `EMPRESTIMO/Fontes` | FCancInscricao.dfm | `TfrmCancInscricao` | Cancelamento de Inscrições | 1 - Tela interativa | compilado |
| 235 | `EMPRESTIMO/Fontes` | fCancQuitacao.dfm | `TfrmCancQuitacao` | — | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 236 | `EMPRESTIMO/Fontes` | fCancRecebimento.dfm | `TfrmCancRecebimento` | Desfazer Recebimento | 1 - Tela interativa | compilado |
| 237 | `EMPRESTIMO/Fontes` | FCargaFCRT.dfm | `TfrmExecCargaFCRT` | Carga de Empréstimos | 1 - Tela interativa | fora do build (não compilado) |
| 238 | `EMPRESTIMO/Fontes` | FConfereItensEnviados.dfm | `TfrmConfereItensEnviados` | Confere Itens Enviados | 1 - Tela interativa | fora do build (não compilado) |
| 239 | `EMPRESTIMO/Fontes` | FDesbloquearMutuario.dfm | `TfrmDesbloquearMutuario` | Consulta Quitação Financiamento Habitacional | 1 - Tela interativa | compilado |
| 240 | `EMPRESTIMO/Fontes` | FDesvioAutomatico.dfm | `TfrmDesvioAutomatico` | Desvio Automatico de Cobranca de Itens Nao Recebidos | 1 - Tela interativa | fora do build (não compilado) |
| 241 | `EMPRESTIMO/Fontes` | FDRel.dfm | `TfrmDesenhoRel` | frmDesenhoRel | 4 - Indeterminado / infraestrutura | compilado |
| 242 | `EMPRESTIMO/Fontes` | FDRelCartaCobrEP.dfm | `TfrmDesenhoRelCartaCobrEP` | Cartas de Cobrança | 2 - Filtro/impressão de relatório | compilado |
| 243 | `EMPRESTIMO/Fontes` | FEmprestimosQuitados.dfm | `TfrmEmprestimosQuitados` | Análise de Prestação Após Quitação | 1 - Tela interativa | compilado |
| 244 | `EMPRESTIMO/Fontes` | FEmpSicov.dfm | `TFrmEmpSicov` | Importação do Arquivo e Geração do Relatório-SICOV | 1 - Tela interativa | compilado |
| 245 | `EMPRESTIMO/Fontes` | FEventoCobrancaContrato.dfm (binário) | `TFrmEventoCobrancaContrato` | Lançamento e Histórico de Eventos de Cobrança | 1 - Tela interativa | compilado |
| 246 | `EMPRESTIMO/Fontes` | FEvolucaoContrato.dfm | `TfrmEvolucaoContrato` | Relatório de Evolução de Contrato | 2 - Filtro/impressão de relatório | compilado |
| 247 | `EMPRESTIMO/Fontes` | FExecAlteraConcessao.dfm | `TfrmExecAlteraConcessao` | Alteração de Valor de Concessão | 1 - Tela interativa | compilado |
| 248 | `EMPRESTIMO/Fontes` | FExecAlteraConcessao_81962_379367.dfm | `TfrmExecAlteraConcessao_81962_379367` | Alteração de Valor de Concessão_81962_379367 | 1 - Tela interativa | fora do build (não compilado) |
| 249 | `EMPRESTIMO/Fontes` | FExecAlteraConcessao_81962_X.dfm | `TfrmExecAlteraConcessao_81962_X` | Alteração de Valor de Concessão 81962_X | 1 - Tela interativa | fora do build (não compilado) |
| 250 | `EMPRESTIMO/Fontes` | FExecAlteraContrato.dfm | `TfrmExecAlteraContrato` | Alterações Contratuais | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 251 | `EMPRESTIMO/Fontes` | FExecAmortizacao.dfm | `TfrmExecAmortizacao` | — | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 252 | `EMPRESTIMO/Fontes` | FExecArqSupensaoCobranca.dfm | `TfrmExecArqSupensaoCobranca` | Importação de Arquivo de Suspensões | 1 - Tela interativa | compilado |
| 253 | `EMPRESTIMO/Fontes` | FExecAtualizaDiaria.dfm | `TfrmExecAtualizaDiaria` | Atualização de Saldo Devedor | 1 - Tela interativa | compilado |
| 254 | `EMPRESTIMO/Fontes` | FExecAtualizaDiariaNova.dfm | `TfrmExecAtualizaDiariaNova` | Atualização Diária de Saldo Devedor | 1 - Tela interativa | compilado |
| 255 | `EMPRESTIMO/Fontes` | FExecBuscaPadraoContratos.dfm | `TfrmExecBuscaPadraoContratos` | — | 4 - Indeterminado / infraestrutura | compilado |
| 256 | `EMPRESTIMO/Fontes` | fExecCalculaSegCompl.dfm | `TfrmExecCalculaSegCompl` | Calcula Seguro Complementar | 1 - Tela interativa | compilado |
| 257 | `EMPRESTIMO/Fontes` | FExecCalculaValorDevido.dfm | `TfrmCalculaValorDevido` | Calcula Valor Devido de Empréstimo | 1 - Tela interativa | compilado |
| 258 | `EMPRESTIMO/Fontes` | FExecCalculaValorMaximo.dfm | `TfrmCalculaValorMaximo` | Calcula Valor Máximo para Empréstimo | 1 - Tela interativa | compilado |
| 259 | `EMPRESTIMO/Fontes` | FExecCalculoRepasse.dfm | `TfrmCalculoRepasse` | Cálculo de Repasse de Seguro | 1 - Tela interativa | compilado |
| 260 | `EMPRESTIMO/Fontes` | FExecCargaFCRT.dfm | `TfrmExecCargaFCRT` | Carga de Empréstimos | 1 - Tela interativa | fora do build (não compilado) |
| 261 | `EMPRESTIMO/Fontes` | FExecCargaFCRTConfere.dfm | `TfrmExecCargaFCRTConfere` | Carga de Empréstimos | 1 - Tela interativa | fora do build (não compilado) |
| 262 | `EMPRESTIMO/Fontes` | FExecConcessaoAutomatica.dfm | `TfrmExecConcessaoAutomatica` | Concessão Automática | 1 - Tela interativa | fora do build (não compilado) |
| 263 | `EMPRESTIMO/Fontes` | FExecConcessaoREFER.dfm | `TfrmExecConcessaoREFER` | — | 1 - Tela interativa | compilado |
| 264 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteAjuste.dfm | `TfrmExecContabilizaLoteAjuste` | Contabilização de Ajustes por Lote | 1 - Tela interativa | compilado |
| 265 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteAmortizacao.dfm | `TfrmExecContabilizaLoteAmortizacao` | Contabilização de Amortizações por Lote | 1 - Tela interativa | compilado |
| 266 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteAtuDia.dfm | `TfrmExecContabilizaLoteAtuDia` | Contabilização da Atualização Diária por Lote | 1 - Tela interativa | compilado |
| 267 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteConcessao.dfm | `TfrmExecContabilizaLoteConcessao` | Contabilização de Concessões por Lote | 1 - Tela interativa | compilado |
| 268 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteEncargo.dfm | `TfrmExecContabilizaLoteEncargo` | Contabilização de Encargos por Lote | 1 - Tela interativa | compilado |
| 269 | `EMPRESTIMO/Fontes` | FExecContabilizaLotePrestacao.dfm | `TfrmExecContabilizaLotePrestacao` | Contabilização de Prestações por Lote | 1 - Tela interativa | compilado |
| 270 | `EMPRESTIMO/Fontes` | FExecContabilizaLoteQuitacao.dfm | `TfrmExecContabilizaLoteQuitacao` | Contabilização de Quitações por Lote | 1 - Tela interativa | compilado |
| 271 | `EMPRESTIMO/Fontes` | FExecCriticaCaixa.dfm | `TfrmCriticaCaixa` | Recebimento de Arquivo de Crítica da Caixa | 1 - Tela interativa | compilado |
| 272 | `EMPRESTIMO/Fontes` | FExecDevolucaoLote.dfm | `TfrmExecDevolucaoLote` | — | 1 - Tela interativa | compilado |
| 273 | `EMPRESTIMO/Fontes` | FExecEntradaManual.dfm | `TfrmExecEntradaManual` | Entrada Manual de Cobranças e Devoluções | 1 - Tela interativa | compilado |
| 274 | `EMPRESTIMO/Fontes` | FExecEnvio.dfm | `TfrmExecEnvio` | Envio | 1 - Tela interativa | compilado |
| 275 | `EMPRESTIMO/Fontes` | FExecEnvioExcessoCobranca.dfm | `TfrmExecEnvioExcessoCobranca` | Excesso de Débitos | 1 - Tela interativa | compilado |
| 276 | `EMPRESTIMO/Fontes` | FExecEnvioLoteConcessao.dfm | `TfrmExecEnvioLoteConcessao` | Envio de Concessões e Devoluções em Lote | 1 - Tela interativa | compilado |
| 277 | `EMPRESTIMO/Fontes` | FExecEnvioLoteSeguro.dfm | `TfrmExecEnvioLoteSeguro` | Envio de Concessões e Devoluções em Lote | 1 - Tela interativa | compilado |
| 278 | `EMPRESTIMO/Fontes` | FExecEnvioSeguro.dfm | `TfrmExecEnvioSeguro` | Envio de Seguro | 1 - Tela interativa | compilado |
| 279 | `EMPRESTIMO/Fontes` | FExecEstornoIndividual.dfm | `TfrmExecEstornoIndividual` | Estorno Individual de Concessão | 1 - Tela interativa | compilado |
| 280 | `EMPRESTIMO/Fontes` | FExecFechaPatro.dfm | `TfrmExecFechaPatro` | Fechamento por Patrocinadora (pré-Recebimento) | 1 - Tela interativa | fora do build (não compilado) |
| 281 | `EMPRESTIMO/Fontes` | FExecGeraArquivoMargem13.dfm | `TfrmExecGeraArquivoMargem13` | Geração de Arquivo de Margens para 13º | 1 - Tela interativa | compilado |
| 282 | `EMPRESTIMO/Fontes` | FExecGeraArquivoRemessa.dfm | `TfrmExecGeraArquivoRemessa` | Geração de Arquivo Eletrônico de Remessa | 1 - Tela interativa | compilado |
| 283 | `EMPRESTIMO/Fontes` | FExecGeraParcela.dfm (binário) | `TfrmExecGeraParcela` | Geração Mensal de Parcelas | 1 - Tela interativa | compilado |
| 284 | `EMPRESTIMO/Fontes` | FExecGeraParcela_old.dfm | `TfrmExecGeraParcela` | Geração Mensal de Parcelas | 1 - Tela interativa | fora do build (não compilado) |
| 285 | `EMPRESTIMO/Fontes` | FExecGeraREFER.dfm | `TfrmExecGeraREFER` | REFER - Geração de Inscrições em Empréstimos | 1 - Tela interativa | fora do build (não compilado) |
| 286 | `EMPRESTIMO/Fontes` | FExecLancaAlteradorEP.dfm | `TfrmExecLancaAlteradorEP` | — | 1 - Tela interativa | compilado |
| 287 | `EMPRESTIMO/Fontes` | FExecLancParcAtu.dfm | `TfrmExecLancaParcAtu` | Lançamento de Prestações Atualizadas | 1 - Tela interativa | compilado |
| 288 | `EMPRESTIMO/Fontes` | FExecLiberaConcessao.dfm | `TfrmExecLiberaConcessao` | Liberação de Concessão | 1 - Tela interativa | compilado |
| 289 | `EMPRESTIMO/Fontes` | FExecLiberaSuspensao.dfm | `TFrmExecLiberaSuspensao` | Liberação de Suspensão | 1 - Tela interativa | compilado |
| 290 | `EMPRESTIMO/Fontes` | FExecMovimentoMensal.dfm | `TfrmExecMovimentoMensal` | Movimentação Mensal de Empréstimos | 1 - Tela interativa | fora do build (não compilado) |
| 291 | `EMPRESTIMO/Fontes` | FExecQuitacao.dfm (binário) | `TfrmExecQuitacao` | Quitação Antecipada / por Falecimento | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 292 | `EMPRESTIMO/Fontes` | FExecQuitacaoNovo.dfm | `TfrmExecQuitacaoNovo` | Quitação | 1 - Tela interativa | fora do build (não compilado) |
| 293 | `EMPRESTIMO/Fontes` | FExecRecebimento.dfm | `TfrmExecRecebimento` | Recebimento | 1 - Tela interativa | compilado |
| 294 | `EMPRESTIMO/Fontes` | FExecRecebimentoNovo.dfm | `TfrmExecRecebimentoNovo` | — | 1 - Tela interativa | fora do build (não compilado) |
| 295 | `EMPRESTIMO/Fontes` | FExecTrataDiverg.dfm | `TfrmExecTrataDiverg` | Tratamento de Divergências | 1 - Tela interativa | fora do build (não compilado) |
| 296 | `EMPRESTIMO/Fontes` | FExecTrataDivergNovo.dfm | `TfrmExecTrataDivergNovo` | Tratamento de Divergências | 1 - Tela interativa | compilado |
| 297 | `EMPRESTIMO/Fontes` | FExecTrataInesperado.dfm | `TfrmExecTrataInesperado` | Tratamento de Valores Não Programados | 1 - Tela interativa | compilado |
| 298 | `EMPRESTIMO/Fontes` | FExecTrataItemNaoRecebido.dfm | `TfrmExecTrataItemNaoRecebido` | Tratamento de Itens não recebidos | 1 - Tela interativa | compilado |
| 299 | `EMPRESTIMO/Fontes` | FExecTrataParcela.dfm | `TfrmExecTrataParcela` | Tratamento Individual de Parcelas | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 300 | `EMPRESTIMO/Fontes` | FExecTrataParcela_old.dfm | `TfrmExecTrataParcela` | Tratamento Individual de Parcelas | 1 - Tela interativa | fora do build (não compilado) |
| 301 | `EMPRESTIMO/Fontes` | FExecValorAtualizadoArquivo.dfm | `TfrmExecValorAtualizadoArquivo` | Geração de Arquivo de Inadimplentes | 1 - Tela interativa | compilado |
| 302 | `EMPRESTIMO/Fontes` | fGerarArquivoSIAFI.dfm | `TfrmGerarArquivoSIAFI` | Gerar Arquivo para o SIAFI | 1 - Tela interativa | compilado |
| 303 | `EMPRESTIMO/Fontes` | fHistoricoSuspensaoCob.dfm | `TfrmHistoricoSuspensaoCob` | Cadastro de Suspensão de Cobrança | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 304 | `EMPRESTIMO/Fontes` | FImportacaoInformeIR.dfm | `TFrmImportacaoInformeIR` | Importação do Informe de IR | 1 - Tela interativa | compilado |
| 305 | `EMPRESTIMO/Fontes` | FImportacaoIRHabitacional.dfm | `TFrmImportacaoIRHabitacional` | Importação - IR -  Financiamento Habitacional | 1 - Tela interativa | compilado |
| 306 | `EMPRESTIMO/Fontes` | fImpressaoContrato.dfm | `TfrmImpressaoContrato` | frmImpressaoContrato | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 307 | `EMPRESTIMO/Fontes` | fInfoEventoConbranca.dfm | `TFrmInfoEventoCobranca` | Adicionar Informações aos Eventos de Cobrança | 1 - Tela interativa | compilado |
| 308 | `EMPRESTIMO/Fontes` | fLerArquivoSIAFI.dfm | `TfrmLerArquivoSIAFI` | Leitura do Arquivo Gerado Pelo SIAFI | 1 - Tela interativa | compilado |
| 309 | `EMPRESTIMO/Fontes` | FLerCodProvento.dfm | `TfrmLerCodProvento` | Associar Rubrica à Patrocinadora | 1 - Tela interativa | fora do build (não compilado) |
| 310 | `EMPRESTIMO/Fontes` | FManutContratoAd.dfm | `TFrmManutContratoAd` | Manutenção do Arquivo Contratoad | 1 - Tela interativa | compilado |
| 311 | `EMPRESTIMO/Fontes` | FMapaMovimentacao.dfm (binário) | `TfrmMapaMovimentacao` | Mapa de Movimentação | 2 - Filtro/impressão de relatório | compilado |
| 312 | `EMPRESTIMO/Fontes` | FPagtoEmprestimoResgate.dfm | `TfrmPagtoEmprestimoResgate` | Pagamento de Emprestimo com Resgate | 1 - Tela interativa | compilado |
| 313 | `EMPRESTIMO/Fontes` | FParamEmptmo.dfm | `TfrmParamEmptmo` | Parâmetros do Sistema | 1 - Tela interativa | compilado |
| 314 | `EMPRESTIMO/Fontes` | fPessoaBenefSeguro.dfm | `TfrmPessoaBenefSeguro` | Beneficiários de Seguros | 1 - Tela interativa | compilado |
| 315 | `EMPRESTIMO/Fontes` | FPessoaSeguradora.dfm | `TfrmPessoaSeguradora` | Seguradora | 1 - Tela interativa | compilado |
| 316 | `EMPRESTIMO/Fontes` | FPRelContratos.dfm | `TfrmPRelContratos` | Impressao de Contratos | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 317 | `EMPRESTIMO/Fontes` | fpreltabemp.dfm | `TfrmPRelTabEmp` | Relatório das Tabelas de Cadastro | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 318 | `EMPRESTIMO/Fontes` | FPrincipal.dfm | `TfrmPrincipal` | Sistema de Empréstimo | 4 - Indeterminado / infraestrutura | compilado |
| 319 | `EMPRESTIMO/Fontes` | FProcessaEventoCobranca.dfm | `TfrmProcessaEventoCobranca` | Processar Eventos de Cobrança | 1 - Tela interativa | compilado |
| 320 | `EMPRESTIMO/Fontes` | FProgresso.dfm | `TfrmProgresso` | Empréstimo | 4 - Indeterminado / infraestrutura | compilado |
| 321 | `EMPRESTIMO/Fontes` | FProvPerdas.dfm | `TfrmProvPerdas` | Provisão para Perdas | 1 - Tela interativa | compilado |
| 322 | `EMPRESTIMO/Fontes` | fQuitacaoLote.dfm | `TfrmQuitacaoLote` | Quitação em Lote | 1 - Tela interativa | compilado |
| 323 | `EMPRESTIMO/Fontes` | FRecebtoEmprestimoResgate.dfm | `TfrmRecebtoEmprestimoResgate` | Recebimento de Empréstimo com Resgate | 1 - Tela interativa | compilado |
| 324 | `EMPRESTIMO/Fontes` | FRemessaEletronica.dfm | `TFrmRemessaEletronica` | Remessa Eletrônica | 1 - Tela interativa | compilado |
| 325 | `EMPRESTIMO/Fontes` | FRestrCobranca.dfm | `TfrmRestrCobranca` | Restrição de Cobrança | 1 - Tela interativa | compilado |
| 326 | `EMPRESTIMO/Fontes` | FSaldoResidual.dfm | `TFrmSaldoResidual` | Relatório de Saldo Residual | 2 - Filtro/impressão de relatório | compilado |
| 327 | `EMPRESTIMO/Fontes` | FSuspensaoConcessao.dfm | `TfrmSuspensaoConcessao` | Bloqueio de Concessão | 1 - Tela interativa | compilado |
| 328 | `EMPRESTIMO/Fontes` | FTransferePerfilInves.dfm | `TfrmTransferePerfilInvest` | Transferência de Perfil de Investimentos | 1 - Tela interativa | compilado |
| 329 | `EMPRESTIMO/Fontes` | FValorMaximoPrestacao.dfm | `TFrmValorMaximoPrestacao` | Cadastro do Valor Máximo de Prestação por Participante | 1 - Tela interativa | compilado |
| 330 | `EMPRESTIMO/Fontes` | FVerificaMenuSAD.dfm | `TfrmVerificaMenuSAD` | Verificação de Menu | 1 - Tela interativa | compilado |
| 331 | `EMPRESTIMO/Fontes` | mContratoEmptmo.dfm | `TmolContratoEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 332 | `EMPRESTIMO/Fontes` | mInscricaoEmptmo.dfm | `TmolInscricaoEmptmo` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 333 | `EMPRESTIMO/Fontes` | mListaTipoContr.dfm | `TMolListaTipoContr` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 334 | `EMPRESTIMO/Fontes` | mMutuario.dfm | `TmolMutuario` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 335 | `EMPRESTIMO/Fontes` | mPatro.dfm | `TmolPatro` | — | 3 - Componente não visual | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Objetos) |
| 336 | `EMPRESTIMO/Fontes` | rcarta.dfm | `TrelCarta` | Carta | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 337 | `EMPRESTIMO/Fontes` | RContrato.dfm | `TfrmRelContrato` | Contratos e Parcelas | 1 - Tela interativa | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 338 | `EMPRESTIMO/Fontes` | RItensEnviados.dfm | `TfrmRelItensEnviados` | Confere Itens Enviados | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 339 | `EMPRESTIMO/Fontes` | RLogTotalPrev.dfm | `TfrmRelLogTotalPrev` | — | 2 - Filtro/impressão de relatório | compilado |
| 340 | `EMPRESTIMO/Fontes` | RRecebPatro.dfm | `TfrmRelRecebPatro` | Histórico de Recebimentos da(s)s Patrocinadora(s) | 2 - Filtro/impressão de relatório | compilado |
| 341 | `EMPRESTIMO/Fontes` | RResumoCarteiraAnal.dfm | `TfrmRelResumoCarteiraAnal` | Resumo da Carteira (Analítico) | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 342 | `EMPRESTIMO/Fontes` | RResumoCarteiraAnalCaixa.dfm (binário) | `TfrmRelResumoCarteiraAnalCaixa` | Resumo da Carteira (Analítico) - [Visão Caixa] | 2 - Filtro/impressão de relatório | fora do build (não compilado) |
| 343 | `EMPRESTIMO/Fontes` | RSimula.dfm | `TFrmRelSimula` | Simulação do Empréstimo | 2 - Filtro/impressão de relatório | sombreado pelo BPL (cópia local; vale a versão de EMPRESTIMOBPL/Interface) |
| 344 | `EMPRESTIMO/Fontes` | RTMPDESC.dfm | `TfrmRelTMPDESC` | Consulta Valores Folha | 2 - Filtro/impressão de relatório | compilado |
| 345 | `EMPRESTIMOBPL/Integra` | dAtualizacaoDiaria.dfm | `TdtmAtualizacaoDiaria` | — | 3 - Componente não visual | compilado |
| 346 | `EMPRESTIMOBPL/Integra` | dCalcEmptmo.dfm | `TdtmCalcEmptmo` | — | 3 - Componente não visual | compilado |
| 347 | `EMPRESTIMOBPL/Integra` | DDividaEP.dfm | `TdtmDividaEP` | — | 3 - Componente não visual | compilado |
| 348 | `EMPRESTIMOBPL/Integra` | dEmptmo.dfm | `TdtmEmptmo` | — | 3 - Componente não visual | compilado |
| 349 | `EMPRESTIMOBPL/Integra` | DIntegraEmptmo.dfm | `TdtmIntegraEmptmo` | — | 3 - Componente não visual | compilado |
| 350 | `EMPRESTIMOBPL/Integra` | DLookEmptmo.dfm | `TdtmLookEmptmo` | — | 3 - Componente não visual | compilado |
| 351 | `EMPRESTIMOBPL/Integra` | dMS.dfm | `TdtmMS` | — | 3 - Componente não visual | compilado |
| 352 | `EMPRESTIMOBPL/Integra` | DRelatoriosUsu.dfm | `TdtmRelatoriosUsu` | — | 3 - Componente não visual | compilado |
| 353 | `EMPRESTIMOBPL/Integra` | dRelDividas.dfm | `TdtmRelDividas` | dtmRelDividas | 3 - Componente não visual | fora do build (não compilado) |
| 354 | `EMPRESTIMOBPL/Integra` | FEsperaEP.dfm | `TfrmEsperaEP` | Aguarde | 4 - Indeterminado / infraestrutura | compilado |
| 355 | `EMPRESTIMOBPL/Interface` | CRelMovContr.dfm | `TcfgRelMovContr` | Movimentação por Contrato | 2 - Filtro/impressão de relatório | compilado |
| 356 | `EMPRESTIMOBPL/Interface` | dRelInscricao.dfm | `TdtmRelInscricao` | dtmRelInscricao | 3 - Componente não visual | compilado |
| 357 | `EMPRESTIMOBPL/Interface` | dRelMovContr.dfm | `TdtmRelMovContr` | dRelMovContr | 3 - Componente não visual | compilado |
| 358 | `EMPRESTIMOBPL/Interface` | FCadAssinaturaContrato.dfm | `TfrmAssinaturaContrato` | Assinatura de Contrato Padrão | 1 - Tela interativa | compilado |
| 359 | `EMPRESTIMOBPL/Interface` | FCadBenefSeguro.dfm | `TfrmCadBenefSeguro` | Cadastro de Beneficiários de Seguro | 1 - Tela interativa | compilado |
| 360 | `EMPRESTIMOBPL/Interface` | FCadHistMovEmptmo.dfm | `TfrmCadHistMovEmptmo` | — | 1 - Tela interativa | compilado |
| 361 | `EMPRESTIMOBPL/Interface` | FCadInscricao.dfm | `TfrmCadInscricao` | Inscrição em Empréstimo | 1 - Tela interativa | compilado |
| 362 | `EMPRESTIMOBPL/Interface` | FCadObservacao.dfm | `TfrmCadObservacao` | — | 1 - Tela interativa | compilado |
| 363 | `EMPRESTIMOBPL/Interface` | FCancAmortizacao.dfm | `TfrmCancAmortizacao` | Cancelamento de Amortização | 1 - Tela interativa | compilado |
| 364 | `EMPRESTIMOBPL/Interface` | FCancAmortizacao_90359_379854.dfm | `TfrmCancAmortizacao_90359_379854` | Cancelamento de Amortização_90359_379854 | 1 - Tela interativa | fora do build (não compilado) |
| 365 | `EMPRESTIMOBPL/Interface` | FCancAmortizacao_90859_383197.dfm | `TfrmCancAmortizacao_90859_383197` | Cancelamento de Amortização_90859_383197 | 1 - Tela interativa | fora do build (não compilado) |
| 366 | `EMPRESTIMOBPL/Interface` | fCancQuitacao.dfm | `TfrmCancQuitacao` | Cancelamento de Quitação | 1 - Tela interativa | compilado |
| 367 | `EMPRESTIMOBPL/Interface` | fCancQuitacao_90359_379854.dfm | `TfrmCancQuitacao_90359_379854` | Cancelamento de Quitação_90359_379854 | 1 - Tela interativa | fora do build (não compilado) |
| 368 | `EMPRESTIMOBPL/Interface` | FExecAlteraContrato.dfm | `TfrmExecAlteraContrato` | Alterações Contratuais | 1 - Tela interativa | compilado |
| 369 | `EMPRESTIMOBPL/Interface` | FExecAmortizacao.dfm | `TfrmExecAmortizacao` | Amortização / Refinanciamento | 1 - Tela interativa | compilado |
| 370 | `EMPRESTIMOBPL/Interface` | FExecAmortizacao_92695_395894.dfm | `TfrmExecAmortizacao_92695_395894` | Amortização / Refinanciamento_92695_395894 | 1 - Tela interativa | fora do build (não compilado) |
| 371 | `EMPRESTIMOBPL/Interface` | FExecBuscaSolicitante.dfm | `TfrmExecBuscaSolicitante` | Seleciona | 1 - Tela interativa | cópia não empacotada (vale a versão de EMPRESTIMOBPL/Objetos) |
| 372 | `EMPRESTIMOBPL/Interface` | FExecQuitacao.dfm | `TfrmExecQuitacao` | Quitação Antecipada / por Falecimento | 1 - Tela interativa | compilado |
| 373 | `EMPRESTIMOBPL/Interface` | FExecTrata4ParcAtraso.dfm | `TfrmExecTrataParcAtraso` | Tratamento de Parcelas em Atraso | 1 - Tela interativa | fora do build (não compilado) |
| 374 | `EMPRESTIMOBPL/Interface` | FExecTrataParcAtraso.dfm | `TfrmExecTrataParcAtraso` | Tratamento de Parcelas em Atraso | 1 - Tela interativa | compilado |
| 375 | `EMPRESTIMOBPL/Interface` | FExecTrataParcela.dfm | `TfrmExecTrataParcela` | Tratamento Individual de Parcelas | 1 - Tela interativa | compilado |
| 376 | `EMPRESTIMOBPL/Interface` | fHistoricoSuspensaoCob.dfm | `TfrmHistoricoSuspensaoCob` | Cadastro de Suspensão de Cobrança | 1 - Tela interativa | compilado |
| 377 | `EMPRESTIMOBPL/Interface` | fImpressaoContrato.dfm | `TfrmImpressaoContrato` | frmImpressaoContrato | 3 - Componente não visual | compilado |
| 378 | `EMPRESTIMOBPL/Interface` | fImpressaoInscricao.dfm | `TfrmImpressaoInscricao` | frmImpressaoInscricao | 3 - Componente não visual | compilado |
| 379 | `EMPRESTIMOBPL/Interface` | fImpressaoSimulacao.dfm | `TfrmImpressaoSimulacao` | frmImpressaoSimulacao | 3 - Componente não visual | compilado |
| 380 | `EMPRESTIMOBPL/Interface` | FJustificativaNup.dfm | `TfrmJustificativa` | Justificativa | 1 - Tela interativa | compilado |
| 381 | `EMPRESTIMOBPL/Interface` | FMostraDados.dfm | `TfrmMostraDados` | Resultados | 1 - Tela interativa | compilado |
| 382 | `EMPRESTIMOBPL/Interface` | FMostraSuspensaoConcessao.dfm | `TfrmMostraSuspensaoConcessao` | Bloqueio de Concessão | 1 - Tela interativa | compilado |
| 383 | `EMPRESTIMOBPL/Interface` | FNup.dfm | `TfrmNup` | NUP | 1 - Tela interativa | compilado |
| 384 | `EMPRESTIMOBPL/Interface` | FPessoaBenefSeguro.dfm | `TfrmPessoaBenefSeguro` | Beneficiários de Seguros | 1 - Tela interativa | fora do build (não compilado) |
| 385 | `EMPRESTIMOBPL/Interface` | FPessoaFiador.dfm | `TfrmPessoaFiador` | Cadastro de Avalistas | 1 - Tela interativa | compilado |
| 386 | `EMPRESTIMOBPL/Interface` | FPrazoSimula.dfm | `TfrmPrazoSimula` | Simulação | 1 - Tela interativa | compilado |
| 387 | `EMPRESTIMOBPL/Interface` | RContrato.dfm | `TfrmRelContrato` | Contratos e Parcelas | 1 - Tela interativa | compilado |
| 388 | `EMPRESTIMOBPL/Interface` | RContrato_92695_395894.dfm | `TfrmRelContrato_92695_395894` | Consulta Contratos_92695_395894 | 1 - Tela interativa | fora do build (não compilado) |
| 389 | `EMPRESTIMOBPL/Interface` | RSimula.dfm | `TFrmRelSimula` | Simulação do Empréstimo | 2 - Filtro/impressão de relatório | compilado |
| 390 | `EMPRESTIMOBPL/Objetos` | BPlanoConta.dfm | `TbusPlanoconta` | Contas Contábeis | 1 - Tela interativa | compilado |
| 391 | `EMPRESTIMOBPL/Objetos` | CRel.dfm | `TcfgRel` | Configuração de Relatório | 2 - Filtro/impressão de relatório | compilado |
| 392 | `EMPRESTIMOBPL/Objetos` | FCadastroCSImob.dfm | `TfrmCadastroCSImob` | frmCadastroCSImob | 4 - Indeterminado / infraestrutura | compilado |
| 393 | `EMPRESTIMOBPL/Objetos` | FCadastroDetalhe.dfm | `TfrmCadastroDetalhe` | Cadastro de Detalhe | 4 - Indeterminado / infraestrutura | compilado |
| 394 | `EMPRESTIMOBPL/Objetos` | FCadastroGridCSImob.dfm | `TfrmCadastroGridCSImob` | frmCadastroGridCSImob | 4 - Indeterminado / infraestrutura | compilado |
| 395 | `EMPRESTIMOBPL/Objetos` | FCadastroMestreDetImob.dfm | `TfrmCadastroMestreDetImob` | frmCadastroMestreDetImob | 4 - Indeterminado / infraestrutura | compilado |
| 396 | `EMPRESTIMOBPL/Objetos` | FEspera.dfm | `TfrmEspera` | Aguarde | 4 - Indeterminado / infraestrutura | compilado |
| 397 | `EMPRESTIMOBPL/Objetos` | FExecBuscaContrato.dfm | `TfrmExecBuscaContrato` | Seleciona | 1 - Tela interativa | compilado |
| 398 | `EMPRESTIMOBPL/Objetos` | FExecBuscaSolicitante.dfm | `TfrmExecBuscaSolicitante` | Seleciona | 1 - Tela interativa | compilado |
| 399 | `EMPRESTIMOBPL/Objetos` | FExecSelecionaContrato.dfm | `TfrmExecSelecionaContrato` | Seleciona | 1 - Tela interativa | compilado |
| 400 | `EMPRESTIMOBPL/Objetos` | FExecSelecionaMutuario.dfm | `TfrmExecSelecionaMutuario` | Seleciona | 1 - Tela interativa | compilado |
| 401 | `EMPRESTIMOBPL/Objetos` | FOkCancelarImob.dfm | `TFrmOkCancelarImob` | frmOkCancelarImob | 4 - Indeterminado / infraestrutura | compilado |
| 402 | `EMPRESTIMOBPL/Objetos` | FSairAjudaImob.dfm | `TfrmSairAjudaImob` | frmSairAjudaImob | 4 - Indeterminado / infraestrutura | compilado |
| 403 | `EMPRESTIMOBPL/Objetos` | FSQL.dfm | `TfrmSQL` | Consultas Personalizadas | 1 - Tela interativa | fora do build (não compilado) |
| 404 | `EMPRESTIMOBPL/Objetos` | FWizard.dfm | `TfrmWizard` | — | 4 - Indeterminado / infraestrutura | compilado |
| 405 | `EMPRESTIMOBPL/Objetos` | FWizardMTEP.dfm | `TfrmWizardMTEP` | — | 4 - Indeterminado / infraestrutura | compilado |
| 406 | `EMPRESTIMOBPL/Objetos` | mCliente.dfm | `TmolCliente` | — | 3 - Componente não visual | compilado |
| 407 | `EMPRESTIMOBPL/Objetos` | mContratoEmptmo.dfm | `TmolContratoEmptmo` | — | 3 - Componente não visual | compilado |
| 408 | `EMPRESTIMOBPL/Objetos` | mFornecedor.dfm | `TmolFornecedor` | — | 3 - Componente não visual | compilado |
| 409 | `EMPRESTIMOBPL/Objetos` | mInscricaoEmptmo.dfm | `TmolInscricaoEmptmo` | — | 3 - Componente não visual | compilado |
| 410 | `EMPRESTIMOBPL/Objetos` | mListaCodigosCNAB.dfm | `TmolListaCodigosCNAB` | — | 3 - Componente não visual | fora do build (não compilado) |
| 411 | `EMPRESTIMOBPL/Objetos` | mListaPatro.dfm | `TmolListaPatro` | — | 3 - Componente não visual | compilado |
| 412 | `EMPRESTIMOBPL/Objetos` | mListaPlano.dfm | `TmolListaPlano` | — | 3 - Componente não visual | compilado |
| 413 | `EMPRESTIMOBPL/Objetos` | mListaPlanoContab.dfm | `TmolListaPlanoContab` | — | 3 - Componente não visual | compilado |
| 414 | `EMPRESTIMOBPL/Objetos` | mListaTipoContr.dfm | `TMolListaTipoContr` | — | 3 - Componente não visual | compilado |
| 415 | `EMPRESTIMOBPL/Objetos` | mMutuario.dfm | `TmolMutuario` | — | 3 - Componente não visual | compilado |
| 416 | `EMPRESTIMOBPL/Objetos` | mOrigemLanc.dfm | `TmolOrigemLanc` | — | 3 - Componente não visual | compilado |
| 417 | `EMPRESTIMOBPL/Objetos` | mParticipante.dfm | `TmolParticipante` | — | 3 - Componente não visual | compilado |
| 418 | `EMPRESTIMOBPL/Objetos` | mPatro.dfm | `TmolPatro` | — | 3 - Componente não visual | compilado |
| 419 | `EMPRESTIMOBPL/Objetos` | mRegra.dfm | `TmolRegra` | — | 3 - Componente não visual | compilado |
| 420 | `EMPRESTIMOBPL/Objetos` | mRegraDB.dfm | `TmolRegraDB` | — | 3 - Componente não visual | compilado |
| 421 | `EMPRESTIMOBPL/Objetos` | mSeguradoraDB.dfm | `TmolSeguradoraDB` | — | 3 - Componente não visual | compilado |
| 422 | `EMPRESTIMOBPL/Objetos` | mUsuario.dfm | `TmolUsuario` | — | 3 - Componente não visual | compilado |
