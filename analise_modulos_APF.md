# Análise de módulos para contagem de pontos de função — método SFP (PFC-49)

> **Arquivo:** `analise_modulos_APF.md`. O nome do arquivo mantém a sigla APF, mas **o método adotado é SFP (Simple Function Points / Ponto de Função Simples)**, não a APF tradicional.
> **Issue:** PFC-49 — Geração prompts pontos de função — Todos os módulos.
> **Sistema:** legado Delphi 5 (suíte CM Contabilidade / FUNCEF). A tecnologia futura (.NET 10 + React 19 + Oracle 23ai) e o Delphi 5 são só contexto técnico; **não são fatores de contagem**.
> **Data do levantamento:** 2026-11-12. **Escopo desta entrega:** inventário, classificação, mapa de dependências e prompts. **Nenhuma contagem SFP foi executada aqui.**

## Sumário

1. [Objetivo](#1-objetivo)
2. [Método SFP](#2-método-sfp)
3. [Critérios de classificação](#3-critérios-de-classificação)
4. [Resumo](#4-resumo)
5. [Inventário de módulos](#5-inventário-de-módulos)
6. [Mapa de dependências](#6-mapa-de-dependências)
7. [Padrão da análise SFP de Folha de Benefícios](#7-padrão-da-análise-sfp-de-folha-de-benefícios)
8. [Localização das abas na navegação](#8-localização-das-abas-na-navegação)
9. [Ordem de execução](#9-ordem-de-execução)
10. [Estado das análises existentes](#10-estado-das-análises-existentes)
11. [Prompts individuais](#11-prompts-individuais)
12. [Pendências](#12-pendências)
13. [Premissas](#13-premissas)

## 1. Objetivo

Este documento:

1. Lista **todas as pastas de primeiro nível do repositório** (119) e quatro subcomponentes de negócio que ficam dentro de `CM/`, indicando para cada uma se deve ser contada individualmente pelo método SFP.
2. Classifica cada pasta em uma de cinco categorias (seção 3), com justificativa baseada em evidência do repositório.
3. Mapeia as dependências entre módulos e os riscos de **dupla contagem** de Arquivos Lógicos e Processos Elementares.
4. Descreve o padrão metodológico e visual da análise SFP de Folha de Benefícios (`docs1/pontos-de-funcao/folha.html`), que serve de modelo, e registra os problemas encontrados nela para que não sejam copiados.
5. Traz **um prompt autônomo e personalizado para cada módulo recomendado para contagem individual** (45 prompts). Cada prompt conta um único módulo por execução e cria ou atualiza a aba desse módulo na área "Análise de pontos de função".

Valor de negócio: uma base auditável para dimensionar a modernização, comparar sistemas e sustentar auditorias, sem contar duas vezes a mesma função ou o mesmo dado entre módulos.

**Fora do escopo:** executar as contagens; alterar código-fonte; alterar a documentação funcional dos módulos (`docs/`, `docs1/`). Esta entrega cria apenas este arquivo.

## 2. Método SFP

### 2.1 O que é contado

| Elemento | Sigla | Definição usada nos prompts | Peso |
|---|---|---|---|
| Processo Elementar | PE | Menor atividade funcional com significado para o usuário, completa em si e que deixa o negócio em estado consistente. Entradas, saídas e consultas são todas PE; não há subtipos. | **4,6 SFP** |
| Arquivo Lógico | AL | Grupo de dados logicamente relacionado, reconhecido pelo usuário, que a aplicação mantém ou apenas lê. Dados mantidos e dados lidos de outra aplicação são todos AL; não há subtipos. | **7 SFP** |

**Fórmula:** `Total SFP = (qtd_PE × 4,6) + (qtd_AL × 7)`, sem fator de ajuste.

### 2.2 Diferença entre SFP e APF tradicional

| Aspecto | SFP (adotado) | APF tradicional (não usada) |
|---|---|---|
| Tipos de elemento | Só dois: PE e AL | Cinco tipos de função, separando entradas, saídas e consultas, e arquivos internos e externos |
| Complexidade | Não existe — peso fixo por elemento | Cada função recebe complexidade calculada a partir da contagem de campos, registros e arquivos referenciados |
| Pesos | 4,6 por PE e 7 por AL | Tabela de pesos por tipo e por complexidade |
| Esforço de contagem | Menor e mais reproduzível | Maior, com mais decisões subjetivas |

Os prompts deste documento **proíbem** a classificação de PE ou AL em subtipos, níveis de complexidade, contagem de campos/registros/arquivos referenciados e as tabelas de peso da APF tradicional. Também não se convertem linhas de código, units, formulários `.dfm`, procedures ou tabelas físicas em SFP.

### 2.3 Fontes e versões consultadas

| Fonte | Versão / local | Uso |
|---|---|---|
| IFPUG — Simple Function Points (SFP) | Método SFP publicado pelo IFPUG (versão registrada em `docs1/pontos-de-funcao/metodologia.html`) | Definições de PE e AL e pesos 4,6 / 7 |
| Roteiro de Métricas de Software do SISP | Versão 3.0 | Confirma os pesos 4,6 SFP/PE e 7 SFP/AL |
| Metodologia interna da contagem | `docs1/pontos-de-funcao/metodologia.html` (PFC-48) | Critérios, fronteiras, dupla contagem, exemplo didático |
| Modelo de análise | `docs1/pontos-de-funcao/folha.html` (PFC-48) | Estrutura e visual (seção 7) |

Este levantamento não consultou fontes externas pela internet. Os pesos e as referências são os mesmos já registrados na metodologia PFC-48, e nenhuma divergência foi encontrada entre eles.

## 3. Critérios de classificação

| Nº | Categoria | Quando se aplica |
|---|---|---|
| 1 | **Contar individualmente** | Pasta com programa executável próprio (`.dpr`), título de aplicação de negócio (`Application.Title`), menu com funções de negócio e fronteira definível. |
| 2 | **Contar junto com outro módulo** | Parte inseparável de outro módulo: pacote usado só por ele, variante do mesmo programa ou "casca" cujo menu abre formulários de outro módulo. |
| 3 | **Dependência ou serviço compartilhado** | Pacote ou biblioteca de negócio usado por várias aplicações. Não é contado como aplicação; seus dados e funções são avaliados **na fronteira** de cada módulo consumidor (contam no dono funcional e são referenciados nos demais). |
| 4 | **Excluir da contagem funcional** | Só infraestrutura: framework, componentes de terceiros, servidores de aplicação (MIDAS/MTS), binários, ajuda, scripts SQL, modelos, exemplos, lançadores de menu, documentação, tecnologia futura. |
| 5 | **Requer validação** | A evidência não basta para fixar a fronteira ou o dono (cópias sem projeto, programas de cliente específico, sobreposição forte com outro módulo). |

### 3.1 Evidências usadas

| Evidência | Onde | Para quê |
|---|---|---|
| Programas e títulos | `*.dpr` (`Application.Title`) | Identificar aplicação de negócio |
| Grupos de build | `1-BPL.Padrao.bpg`, `2-BPL.Negocio.bpg`, `3-Sistemas.bpg`, `CapCar.bpg`, `Contábeis.bpg`, `Imobiliario.bpg`, `Login.bpg`, `Previdenciario.bpg` | Separar infraestrutura (BPL padrão), pacotes de negócio e sistemas |
| Pacotes de runtime | linha `Packages=` dos `.dof` de cada aplicação | Dependências declaradas (seção 6) |
| Search path / `uses ... in` | `.dpr` e `.dof` | Fontes reaproveitados de outras pastas |
| Menus | legendas (`Caption`) do `FPrincipal.dfm` de cada aplicação | Áreas funcionais citadas nos prompts (é evidência, não inventário de PE) |
| Documentação | `docs1/` (3 módulos), `docs/site/modules/*/index.html` (25 IDs do PFC-3), `docs/system-overview.html`, `Analise_*.md` | Estado da documentação e propósito |
| Duplicidade de fontes | Comparação de nomes de arquivos entre pastas | Cópias (EPIM, ALMOX&COMPRAS, CMRHOBJUTIL50, CAF / CAFMT, jurídico) |

## 4. Resumo

- **Arquivo:** `analise_modulos_APF.md` **criado** nesta entrega (não existia).
- **Pastas de primeiro nível inventariadas:** 119 (todas as pastas do repositório, exceto `.git`), mais 4 subcomponentes de negócio de `CM/` → **123 linhas** no inventário.
- **Recomendados para contagem individual:** **45** módulos, com **45 prompts** na seção 11. Destes, 3 já têm análise SFP (Folha, Contribuição e Benefício Previdenciário), e o prompt deles é de revisão.

| Categoria | Linhas no inventário | Pastas de 1º nível |
|---|---:|---:|
| 1. Contar individualmente | 45 | 45 |
| 2. Contar junto com outro módulo | 6 | 6 |
| 3. Dependência ou serviço compartilhado | 26 | 22 |
| 4. Excluir da contagem funcional | 30 | 30 |
| 5. Requer validação | 16 | 16 |
| **Total** | **123** | **119** |

- **Contar junto com outro módulo:** `EMPRESTIMOBPL`, `CAFMT`, `CMINDICADORESOBJ50`, `RECMERC`, `EXECUTAREGRA`, `MODATN`.
- **Dependência ou serviço compartilhado:** `CM/CMADMPREV`, `CM/CMPrevMT50`, `CM/TotalPrev`, `CM/Regra + CM/RegraMT`, `CMGLOBALOBJ50`, `CMBACK`, `BACK`, `GERAL`, `CMCONTABOBJ50`, `CMCFINANOBJ50`, `CMCAPCAROBJ50`, `CMCAPCARUTILOBJ50`, `CMINTBANCOMT50`, `CMIRRFOBJ50`, `CMLIVROOBJ50`, `CMPLANEORCOBJ50`, `CMRELATORIOOBJ50`, `CMAGENDAMENTOOBJ50`, `CMALMOXCOMPRAOBJ50`, `ALMOX&COMPRAS`, `CMCAFOBJ50`, `CMIMOBILIARIOOBJ50`, `CMRHOBJ50`, `CMRHOBJUTIL50`, `OBJRAD`, `SHARED`.
- **Excluir da contagem funcional:** `CM`, `BIN`, `HELP`, `HELP_PLANUS`, `SCRIPT`, `__SCRIPTS__`, `STK`, `CMCRYPTO`, `CMCOMPORH`, `APPSERVERCFINAN`, `APPSERVERDLL`, `APPSERVERIRRFDLL`, `APPSERVERLIVRODLL`, `APPSERVERORCAMENTO`, `APPSRVCAPCAR`, `CMALMOXCOMPRASRVR50`, `CMMODAVASVR50`, `CMMODBENSVR50`, `CMPADORESSVR50`, `CMMTSOBJRH`, `MTSMESTREDETALHE`, `PROJETOCM`, `PROJETOSCM5`, `ATUVERSAOCM`, `SISTJUR`, `SRHCS`, `docs`, `docs1`, `Funcef-kit`, `poc-contabil`.
- **Requer validação:** `PROCJUD`, `PROCPREV`, `MODCON`, `FINANCIAMENTO`, `INVESTFDO`, `FLASHRPT`, `INTEGRASAF`, `FUNCEF`, `REFER`, `EXPORTFCRT`, `SIMULADORFCRT`, `EPIM`, `EPIMIMOB`, `FUNCOESGERAIS`, `FUNCEF.WebEmprestimo`, `RELATORIOSCM`.

- **Modelo:** a análise SFP de Folha de Benefícios (`docs1/pontos-de-funcao/folha.html`) é o modelo de estrutura e visual de todos os prompts. Os problemas encontrados nela estão na seção 7.3 e os prompts mandam **não** repeti-los.
- **Abas:** todos os prompts mandam criar ou atualizar uma página própria em `docs1/pontos-de-funcao/` e incluí-la na navegação "Análise de pontos de função" (seção 8).
- **Repositório preservado:** nenhum código-fonte e nenhuma documentação funcional foi alterada; o único arquivo novo é este.

## 5. Inventário de módulos

Uma linha por pasta de primeiro nível do repositório, mais os subcomponentes de `CM/` com papel de negócio (marcados `CM/...`). "Estado da documentação" indica se existe documentação funcional; "PFC-3" é o portal `docs/`, "docs1" é o Blueprint AS-IS.

### 5.1 Previdenciário, atendimento e canais

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 1 | Folha de Benefícios | `FOLHA/` | **1. Contar individualmente** | docs1 completo (casos de uso, dados, integrações) + análise SFP PFC-48 | CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMIRRFOBJ50, CMGLOBALOBJ50, CMINTBANCOMT50; dados de CONTRIBUICAOPREV e BENEFICIOPREV | Revisar análise existente (prompt 11.1) — corrigir problemas da seção 7.3 | `Folha.dpr` (título "Folha de Benefícios"); em `3-Sistemas.bpg` e `Previdenciario.bpg` |
| 2 | Contribuição Previdenciária | `CONTRIBUICAOPREV/` | **1. Contar individualmente** | docs1 completo (casos de uso, dados, integrações) + análise SFP PFC-48 | CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, FOLHA/CMFbComum50, CMCAPCARUTILOBJ50, EMPRESTIMOBPL/Integra, CMWebComum50 | Revisar análise existente (prompt 11.2) | `ContribuicaoPREV.dpr` (título "Manutenção e Cobrança de Contribuição"); em `3-Sistemas.bpg` |
| 3 | Benefício Previdenciário | `BENEFICIOPREV/` | **1. Contar individualmente** | docs1 completo (casos de uso, dados, integrações) + análise SFP PFC-48 | CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMCAPCAROBJ50, CMCONTABOBJ50, EMPRESTIMOBPL/Integra; dados de FOLHA | Revisar análise existente (prompt 11.3) | `BeneficioPrev.dpr` (título "Concessão e Manut de Benefícios Previdenciários"); em `3-Sistemas.bpg` |
| 4 | Cadastro Previdenciário | `CADASTROPREV/` | **1. Contar individualmente** | `docs/site/modules/cadastro-prev/index.html` (PFC-3) | CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, GLOBALCM, EMPRESTIMOBPL/Integra | Executar prompt 11.4 | `CadastroPrev.dpr`; menu de eventos cadastrais (inscrição, transferências, desligamentos) |
| 5 | Parametrização Previdenciária | `PARAMPREV/` | **1. Contar individualmente** | `docs/site/modules/param-prev/index.html` (PFC-3) | CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMCONTABOBJ50, CMCAPCAROBJ50, EMPRESTIMOBPL/Integra | Executar prompt 11.5 | `ParamPrev.dpr`; menu de planos, contribuições, benefícios, reservas, reajustes |
| 6 | Interface com Instituições Previdenciárias | `INTERFACEPREV/` | **1. Contar individualmente** | Sem documentação funcional | CM/TotalPrev, FOLHA/CMFbComum50; dados de CONTRIBUICAOPREV (rubricas, salários) | Executar prompt 11.6 | `InterfacePrev.dpr`; menu "Interface com Instituições Previdenciárias" (lay-outs, envio/recebimento patrocinadora, SPC) |
| 7 | Projeto Atuarial (Cálculo Atuarial) | `PROJETOATUARIAL/` | **1. Contar individualmente** | Sem documentação funcional | CMGLOBALOBJ50, FOLHA/CMFbObj50, CMIRRFOBJ50, CMRELATORIOOBJ50, AUTOATENDIMENTO/CMAutoAtendimentoObj50, CM/TotalPrev | Executar prompt 11.7 | `ProjetoAtuarial.dpr`; menu "Cálculo Atuarial" (tábuas biométricas, versões, fórmulas) |
| 8 | Administração Assistencial | `ASSISTENCIAL/` | **1. Contar individualmente** | Sem documentação funcional | CM/TotalPrev, FOLHA/CMFbComum50, CMCAPCAROBJ50 | Executar prompt 11.8 | `assistencial.dpr` (título "Administração Assistencial"); planos, participantes, contribuições assistenciais |
| 9 | Empréstimo | `EMPRESTIMO/` | **1. Contar individualmente** | `docs/site/modules/emprestimo/index.html` (PFC-3) + `docs/contagem-linha-emprestimo.md` (linhas, não funcional) | EMPRESTIMOBPL (junto), CENTRALAP, FOLHA (search path), CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMIRRFOBJ50 | Executar prompt 11.9 | `emprestimo.dpr`; em `3-Sistemas.bpg`; pacotes `CMObjetosEP50`/`CMExecEP50`/`CMIntegraEP50` |
| 10 | Central de Atendimento ao Público | `CENTRALAP/` | **1. Contar individualmente** | `docs/site/modules/central-ap/index.html` (PFC-3) — descreve como "contas a pagar/AP" (divergência) | CM/CMADMPREV, EMPRESTIMOBPL, CMAGENDAMENTOOBJ50, CMRELATORIOOBJ50, FOLHA/CMFolhaObjMt, CMIRRFOBJ50, CMWebComum50 | Executar prompt 11.10 | `CentralAP.dpr` (título "Central de Atendimento ao Público"); atendimento, protocolo, RUBS, consultas |
| 11 | Autoatendimento (web + gerência + autoempréstimo) | `AUTOATENDIMENTO/` | **1. Contar individualmente** | Sem documentação funcional | AUTOATENDIMENTO/CMAutoAtendimentoObj50 e CMWebComum50 (junto), CM/CMADMPREV, FOLHA/CMFolhaObjMt, CMIRRFOBJ50, CMGLOBALOBJ50 | Executar prompt 11.11 | 3 programas: `AutoAtendimento.dpr` (CGI WebBroker), `GerenciaAA.dpr`, `AutoEmprestimo.dpr` |
| 12 | Agendamento de Atendimentos | `AGENDAMENTO/` | **1. Contar individualmente** | Sem documentação funcional | CMAGENDAMENTOOBJ50, AUTOATENDIMENTO/CMAutoAtendimentoObj50, CMWebComum50 | Executar prompt 11.12 | `Agendamento.dpr` (título "Agendamento de Atendimentos") |
| 13 | Pacotes de negócio do Empréstimo | `EMPRESTIMOBPL/` | 2. Contar junto com outro módulo | `docs/site/modules/emprestimo/index.html` (PFC-3) (inventariado) | Consumido por EMPRESTIMO, CENTRALAP, CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV | Contar junto com EMPRESTIMO (prompt 11.9) | `CMObjetosEP50`, `CMExecEP50`, `CMIntegraEP50` (`2-BPL.Negocio.bpg`); sem executável próprio |
| 14 | Núcleo de negócio previdenciário (CMAdmPrev) | `CM/CMADMPREV/` | 3. Dependência ou serviço compartilhado | Citado em `Analise_linhas_dependencias.md` | Consumido por FOLHA, CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV, CENTRALAP, AUTOATENDIMENTO, SIMULADORFCRT, FUNCEF | Avaliar na fronteira de cada módulo previdenciário (formulários abertos pelos menus dos módulos) | 223 units; `FPrincipal.pas` dos módulos abre formulários do pacote (PFC-44) |
| 15 | Objetos de dados previdenciários (CMPrevMT50) | `CM/CMPrevMT50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | FOLHA, CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV, IRRF, FUNCEF | Avaliar na fronteira; não é aplicação | DbObjects de BENEFBFCIARIO, HSTCONTRIBPREV, PLANPREV, PATRO etc. |
| 16 | Consultas comuns TotalPrev (CMTotalPrev50) | `CM/TotalPrev/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | Declarado por quase todas as aplicações | Avaliar na fronteira; não é aplicação | Consulta de participante, 2ª via de contracheque, cálculo IRRF |
| 17 | Objetos de negócio de agendamento | `CMAGENDAMENTOOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | AGENDAMENTO, CENTRALAP, FUNCEF | Avaliar na fronteira; dono funcional = AGENDAMENTO | Pacote `CmAgendamentoObj50` |
| 18 | Contencioso Previdenciário | `PROCPREV/` | 5. Requer validação | Sem documentação funcional | SISTJURCONS (12 units em comum), CMRHOBJ50, SHARED | Validar P-02 | `ProcPrev.dpr`; menu quase idêntico ao de PROCJUD |
| 19 | Customizações FUNCEF | `FUNCEF/` | 5. Requer validação | Sem documentação funcional | Quase todos os pacotes de negócio (CMAdmPrev, CMFBOBJ50, CMAgendamentoObj50...) | Validar P-08: extensão do cliente — distribuir funções aos módulos donos ou contar à parte | `Funcef.dpr`; saldamento, SIAFI, arquivos CAIXA, DARF judicial |
| 20 | Customizações REFER | `REFER/` | 5. Requer validação | Sem documentação funcional | FOLHA/CMFbObj50, CM/TotalPrev | Validar P-08 | `Refer.dpr` (6 units): recebimento assistencial, contracheque trimestral, SIPC-CAP |
| 21 | TotalPREV — exportações FCRT | `EXPORTFCRT/` | 5. Requer validação | Sem documentação funcional | FOLHA/CMFbObj50, CMIRRFOBJ50, CMGLOBALOBJ50, CM/TotalPrev | Validar P-08 (cliente FCRT; pode estar obsoleto) | `FCRT.dpr` (exportação p/ simulador e avaliação atuarial) |
| 22 | Simulador BrTPREV (FCRT) | `SIMULADORFCRT/` | 5. Requer validação | Sem documentação funcional | CM/CMADMPREV, CM/TotalPrev | Validar P-08 (migração de plano específica; pode estar obsoleto) | `SimuladorBrTPREV.dpr` |
| 23 | Web Empréstimo (.NET Framework 4.8) | `FUNCEF.WebEmprestimo/` | 5. Requer validação | Citado em `docs/dotnet-versions.html` | EMPRESTIMO (mesmo domínio e dados) | Validar P-12: aplicação própria ou canal do Empréstimo | Solução .NET (`FUNCEF.WebEmprestimo.sln`), 1.115 arquivos |

### 5.2 Contábil, financeiro e administrativo

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 24 | Contabilidade | `CONTAB/` | **1. Contar individualmente** | `docs/site/modules/contab/index.html` (PFC-3) — cobertura aprofundada | CMCONTABOBJ50, CMPLANEORCOBJ50; recebe lançamentos de FOLHA, CPAGAR, CRECEBER, CFINAN e outros | Executar prompt 11.13 | `Contab.dpr`; em `3-Sistemas.bpg`; POC de migração em `poc-contabil/` |
| 25 | Contas a Pagar | `CPAGAR/` | **1. Contar individualmente** | `docs/site/modules/contas-a-pagar/index.html` (PFC-3) | CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMCONTABOBJ50, CMGLOBALOBJ50, IRRF (search path) | Executar prompt 11.14 | `ContasaPagar.dpr`; em `CapCar.bpg` e `3-Sistemas.bpg` |
| 26 | Contas a Receber | `CRECEBER/` | **1. Contar individualmente** | `docs/site/modules/contas-a-receber/index.html` (PFC-3) | CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMCONTABOBJ50, CMGLOBALOBJ50 | Executar prompt 11.15 | `ContasaReceber.dpr`; em `CapCar.bpg` e `3-Sistemas.bpg` |
| 27 | Controle Financeiro | `CFINAN/` | **1. Contar individualmente** | `docs/site/modules/cfinan/index.html` (PFC-3) | CMCFINANOBJ50, CMCAPCAROBJ50, CMINTBANCOMT50, CMGLOBALOBJ50, CMIMOBILIARIOOBJ50 (search path) | Executar prompt 11.16 | `CFINAN.dpr` (título "Controle Financeiro") |
| 28 | Planejamento e Orçamento | `ORCAMENTO/` | **1. Contar individualmente** | `docs/site/modules/orcamento/index.html` (PFC-3) | CMPLANEORCOBJ50, CMCONTABOBJ50, CMGLOBALOBJ50 | Executar prompt 11.17 | `Orcamento.dpr` (título "Planejamento e Orçamento") |
| 29 | Impostos e Tributos (IRRF) | `IRRF/` | **1. Contar individualmente** | `docs/site/modules/irrf/index.html` (PFC-3) | CMIRRFOBJ50, CMLIVROOBJ50, CMCFINANOBJ50, CMCAPCAROBJ50, CMPLANEORCOBJ50, FOLHA/CMFbObj50, CM/CMPrevMT50 | Executar prompt 11.18 | `Impostos.dpr` (título "Impostos e Tributos"); DARF, GPS, DCTF, DIRF |
| 30 | Contratos e Projetos | `CONTRATO/` | **1. Contar individualmente** | `docs/site/modules/contrato/index.html` (PFC-3) | CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMPLANEORCOBJ50 | Executar prompt 11.19 | `contrato.dpr` (título "Contratos e Projetos") |
| 31 | Controle do Ativo Fixo | `CAF/` | **1. Contar individualmente** | `docs/site/modules/caf/index.html` (PFC-3) — cita CAFMT | CMCAFOBJ50, CMCONTABOBJ50; variante CAFMT | Executar prompt 11.20 após decidir CAF × CAFMT (P-03) | `Caf.dpr` referenciado por `3-Sistemas.bpg` (CAF\Fontes) |
| 32 | Ativo Fixo — variante MT | `CAFMT/` | 2. Contar junto com outro módulo | `docs/site/modules/caf/index.html` (PFC-3) (citado) | CMCAFOBJ50, CMCONTABOBJ50 | Contar junto com CAF; decidir versão vigente (P-03) | Segundo `Caf.dpr` com o mesmo título "Ativo Fixo"; 412 diferenças de arquivo em relação a `CAF/Fontes` |
| 33 | Almoxarifado e Custos | `ALMOXARIFADO/` | **1. Contar individualmente** | `docs/site/modules/almoxarifado/index.html` (PFC-3) | CMALMOXCOMPRAOBJ50, CMCAFOBJ50, CMCONTABOBJ50, CMGLOBALOBJ50, CMINTBANCOMT50, SHARED (search path) | Executar prompt 11.21 | `Almoxarifado.dpr` (título "Almoxarifado e Custos") |
| 34 | Compras | `COMPRAS2000/` | **1. Contar individualmente** | `docs/site/modules/compras/index.html` (PFC-3) | CMALMOXCOMPRAOBJ50, CMCONTABOBJ50, CMCAPCAROBJ50, CMCFINANOBJ50, CMPLANEORCOBJ50, CMGLOBALOBJ50, SHARED | Executar prompt 11.22 | `Compras.dpr` (título "Compras") |
| 35 | Recebimento de Mercadoria | `RECMERC/` | 2. Contar junto com outro módulo | Sem documentação funcional | ALMOXARIFADO, ALMOX&COMPRAS, CMALMOXCOMPRAOBJ50, CMCAPCAROBJ50, CMCAFOBJ50, GERAL | Contar junto com ALMOXARIFADO / COMPRAS2000 (o menu reaproveita funções deles) | `RecMerc.dpr` com apenas 2 units próprias; formulários vêm de ALMOXARIFADO e ALMOX&COMPRAS (search path) |
| 36 | Controle de Qualidade de Fornecedores | `SCQ/` | **1. Contar individualmente** | Sem documentação funcional | CM (framework); cópia do menu em `SHARED/Almox_Compras` | Executar prompt 11.23 | `SCQ.dpr` (título "Sistema de Controle de Qualidade") |
| 37 | Cadastros Globais (GlobalCM) | `GLOBALCM/` | **1. Contar individualmente** | `docs/site/modules/global-cm/index.html` (PFC-3) | CMGLOBALOBJ50, CMBACK, CMINTBANCOMT50, CMIRRFOBJ50, FOLHA/CMFbComum50 | Executar prompt 11.24 (onda 1 — dono de dados mestres) | `GlobalCM.dpr`; menu de moedas, centros de custo, bancos, patrocinadoras, planos |
| 38 | Regras de Negócio | `REGRA/` | **1. Contar individualmente** | `docs/site/modules/regra/index.html` (PFC-3) | CM/Regra e CM/RegraMT (motor), FOLHA/CMFbComum50; EXECUTAREGRA (junto) | Executar prompt 11.25 | `Regra.dpr` (título "Regras de Negócio") |
| 39 | Executor de Regras de Negócio | `EXECUTAREGRA/` | 2. Contar junto com outro módulo | Sem documentação funcional | REGRA, CM/Regra | Contar junto com REGRA (prompt 11.25) | `ExecutaRegra.dpr` (4 units; executa regras cadastradas em REGRA) |
| 40 | Motor de regras (CMRegra50/CMRegra50MT) | `CM/Regra/` + `CM/RegraMT/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | Declarado por quase todas as aplicações; manutenção das regras em REGRA | Avaliar na fronteira; a manutenção de regras é contada em REGRA | Units de interpretação de fórmulas e passo a passo |
| 41 | RAD — Registro de Alçadas e Decisões | `RADG/` | **1. Contar individualmente** | Sem documentação funcional | OBJRAD (objetos RAD), CMGLOBALOBJ50, FOLHA/CMFbComum50 | Executar prompt 11.26 | `RADg.dpr` (título "RAD - Registro de Alçadas e Decisões") |
| 42 | Objetos RAD (alçadas) | `OBJRAD/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | RADG (dono funcional); pacote `CMObjRAD` | Avaliar na fronteira; dono funcional = RADG | 6 units (processo, etapa, autorização RAD) |
| 43 | Indicadores de Shoppings, Hotéis e Parques | `INDICADORES/` | **1. Contar individualmente** | `docs/site/modules/indicadores/index.html` (PFC-3) | CMINDICADORESOBJ50 (junto), CMIMOBILIARIOOBJ50 | Executar prompt 11.27 | `Indicadores.dpr`; pacote próprio `INDICADORES/Packages` |
| 44 | Pacote de negócio de Indicadores | `CMINDICADORESOBJ50/` | 2. Contar junto com outro módulo | Sem documentação funcional | Consumido por INDICADORES | Contar junto com INDICADORES (prompt 11.27) | Pacote `CMIndicadoresObj50` declarado apenas por `Indicadores.dof` |
| 45 | Gerador de Flash Report (hotelaria) | `FLASHRPT/` | 5. Requer validação | Sem documentação funcional | CM (framework) | Validar P-06: relatório gerencial próprio ou parte de INDICADORES | `FlashRpt.dpr` (7 units; POA, Department Revenue) |
| 46 | Integração CM × SAF | `INTEGRASAF/` | 5. Requer validação | Sem documentação funcional | CONTAB (CONTAB também tem menu de importação SAF) | Validar P-07: aplicação própria ou parte de CONTAB | `IntegraSAF.dpr` (9 units) |
| 47 | Gerador de Relatórios, Consultas e Gráficos | `RELATORIOSCM/` | 5. Requer validação | `docs/site/modules/relatorios-cm/index.html` (PFC-3) | CMRELATORIOOBJ50, CMGLOBALOBJ50, FOLHA/CMFbComum50 | Validar P-13: ferramenta genérica ou requisito funcional | `RelatoriosCm.dpr`; relatórios configuráveis pelo usuário |
| 48 | Objetos de negócio globais | `CMGLOBALOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | GLOBALCM, FOLHA, CPAGAR, CRECEBER, ORCAMENTO, ALMOXARIFADO, IRRF, MODBAS e outros | Avaliar na fronteira; dono funcional = GLOBALCM | Pacote `CmGlobalObj50` (`2-BPL.Negocio.bpg`) |
| 49 | Objetos de negócio base (CmBack50) | `CMBACK/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | Maioria das aplicações (moeda, centro de custo, banco) | Avaliar na fronteira; não é aplicação | Pacote `CmBack50`; pastas Source/SourceMT/SourceOld |
| 50 | Objetos base (cópia avulsa) | `BACK/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | Sem consumidor declarado em .dof | Avaliar na fronteira; confirmar se é cópia de CMBACK | 16 units Ctrl/Db (moeda, centro de custo, subconta); sem projeto |
| 51 | Objetos gerais (orçamento, moeda, centro de custo) | `GERAL/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | RECMERC (search path) | Avaliar na fronteira; não é aplicação | 27 units Ctrl/Db; sem projeto |
| 52 | Objetos de negócio contábeis | `CMCONTABOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | CONTAB, BENEFICIOPREV, CADASTROPREV, PARAMPREV, CPAGAR, CRECEBER, CAF, INVESTIMENTOS, ADMINIMOB e outros | Avaliar na fronteira; dono funcional = CONTAB | Pacote `CMContabObj50`; servidor `APPSERVERDLL` |
| 53 | Objetos de negócio financeiros | `CMCFINANOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | CFINAN, COMPRAS2000, IRRF, PROJETOATUARIAL, FUNCEF | Avaliar na fronteira; dono funcional = CFINAN | Pacote `CMCfinanObj50` |
| 54 | Objetos de negócio CP/CR | `CMCAPCAROBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | CPAGAR, CRECEBER, BENEFICIOPREV, CADASTROPREV, PARAMPREV, CFINAN, CONTRATO, ADMINIMOB, INVEST* e outros | Avaliar na fronteira; dono funcional = CPAGAR / CRECEBER | Pacote `CMCapCarObj50` (`CapCar.bpg`) |
| 55 | Utilitários de negócio CP/CR | `CMCAPCARUTILOBJ50/` | 3. Dependência ou serviço compartilhado | Citado em `Analise_linhas_dependencias.md` | CPAGAR, CRECEBER, CONTRIBUICAOPREV, CONTRATO, ADMINIMOB, EMPRESTIMO, MODAUTO, SISTJURCONS | Avaliar na fronteira; não é aplicação | Pacote `CmCapCarUtilObj50` (156 .dfm) |
| 56 | Integração bancária | `CMINTBANCOMT50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | CPAGAR, CRECEBER, CFINAN, FOLHA, EMPRESTIMO, IRRF, GLOBALCM, ALMOXARIFADO, módulos RH | Avaliar na fronteira; formulários de lay-out bancário | Pacote `CMIntBancoMT50` (34 .dfm; pasta `Forms`) |
| 57 | Objetos de negócio IRRF | `CMIRRFOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | IRRF, FOLHA, GLOBALCM, EMPRESTIMO, CENTRALAP, AUTOATENDIMENTO, PROJETOATUARIAL | Avaliar na fronteira; dono funcional = IRRF | Pacote `CMIRRFobj50`; servidor `APPSERVERIRRFDLL` |
| 58 | Objetos de negócio Livro | `CMLIVROOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | IRRF, FUNCEF | Avaliar na fronteira; confirmar dono funcional | Pacote `cmLivroObj50`; servidor `APPSERVERLIVRODLL` |
| 59 | Objetos de negócio de planejamento orçamentário | `CMPLANEORCOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | ORCAMENTO, CONTAB, CONTRATO, COMPRAS2000, IRRF, FUNCEF | Avaliar na fronteira; dono funcional = ORCAMENTO | Pacote `CMPlaneOrcObj50`; servidor `APPSERVERORCAMENTO` |
| 60 | Objetos do gerador de relatórios | `CMRELATORIOOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | RELATORIOSCM, CENTRALAP, IRRF, PROJETOATUARIAL, FUNCEF | Avaliar na fronteira; não é aplicação | Pacote `CmRelatorioObj50` |
| 61 | Objetos de negócio almoxarifado/compras | `CMALMOXCOMPRAOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | ALMOXARIFADO, COMPRAS2000, RECMERC, FUNCEF, PROJETOATUARIAL | Avaliar na fronteira; donos = ALMOXARIFADO / COMPRAS2000 | Pacote `CMAlmoxCompraObj50` |
| 62 | Fontes de almoxarifado/compras (biblioteca) | `ALMOX&COMPRAS/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | RECMERC (search path); 156 units em comum com `SHARED/Almox_Compras` | Avaliar na fronteira; confirmar se é cópia de SHARED/Almox_Compras | Sem projeto; CtrlObjetos/DbObjetos/Fontes/FontesMT |
| 63 | Objetos de negócio do Ativo Fixo | `CMCAFOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | CAF, CAFMT, ALMOXARIFADO, RECMERC, INVESTIMOB, FUNCEF | Avaliar na fronteira; dono funcional = CAF | Pacote `CMCAFObj50` |
| 64 | Funções gerais (ativo fixo, investimentos) | `FUNCOESGERAIS/` | 5. Requer validação | Sem documentação funcional | Nenhum projeto referencia a pasta | Validar P-11 | Formulários de depreciação e movimentação sem projeto |

### 5.3 Imobiliário e investimentos

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 65 | Administração Imobiliária | `ADMINIMOB/` | **1. Contar individualmente** | `docs/site/modules/imobiliario/index.html` (PFC-3) | CMIMOBILIARIOOBJ50, CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMCONTABOBJ50 | Executar prompt 11.28 | `AdminImob.dpr`; em `Imobiliario.bpg` e `3-Sistemas.bpg` |
| 66 | Investimentos Imobiliários | `INVESTIMOB/` | **1. Contar individualmente** | `docs/site/modules/imobiliario/index.html` (PFC-3) (compartilhada) | CMIMOBILIARIOOBJ50, CMCAFOBJ50, CMCAPCAROBJ50, CMGLOBALOBJ50 | Executar prompt 11.29 | `InvestImob.dpr` (título "Investimentos Imobiliários") |
| 67 | Alienação de Imóveis | `ALIENACAO/` | **1. Contar individualmente** | `docs/site/modules/imobiliario/index.html` (PFC-3) (compartilhada) | CMIMOBILIARIOOBJ50, CMCAPCAROBJ50, CMGLOBALOBJ50; documentos de ADMINIMOB | Executar prompt 11.30 | `Alienacao.dpr` (título "Alienação") |
| 68 | Financiamento (proposta e contrato de venda) | `FINANCIAMENTO/` | 5. Requer validação | Sem documentação funcional | CM (framework) | Validar P-04: módulo próprio ou parte de ALIENACAO | `Financiamento.dpr` (7 units); menu repete "Geração de Contrato de Venda/Parcelas" de ALIENACAO |
| 69 | Objetos de negócio imobiliários | `CMIMOBILIARIOOBJ50/` | 3. Dependência ou serviço compartilhado | `docs/site/modules/imobiliario/index.html` (PFC-3) (citado) | ADMINIMOB, INVESTIMOB, ALIENACAO, INDICADORES, CFINAN, MODATN | Avaliar na fronteira de cada módulo imobiliário | Pacote `CMImobiliarioObj50` (205 .dfm; inclui `FontesEpim`) |
| 70 | Fontes avulsas imobiliário/empréstimo | `EPIM/` | 5. Requer validação | Sem documentação funcional | 57 de 89 arquivos repetem `CMIMOBILIARIOOBJ50/FontesEpim` | Validar P-11: cópia órfã (excluir) ou fonte vigente | Sem projeto; nenhum .dpr/.dof/.dpk referencia a pasta |
| 71 | Fontes avulsas imobiliário | `EPIMIMOB/` | 5. Requer validação | Sem documentação funcional | 71 de 84 arquivos repetem `CMIMOBILIARIOOBJ50/FontesEpim` | Validar P-11 | Sem projeto; nenhum projeto referencia a pasta |
| 72 | Sistema de Investimentos | `INVESTIMENTOS/` | **1. Contar individualmente** | `docs/site/modules/investimentos/index.html` (PFC-3) | Pacotes próprios CMInvestObj50/CMInvFIObj50/CMInvRFObj50/CMInvRVObj50 (junto), CMCONTABOBJ50, CMCAPCAROBJ50 | Executar prompt 11.31 | `Investimentos.dpr`; em `3-Sistemas.bpg` |
| 73 | Sistema de Cotas de Investimentos | `INVESTCOTAS/` | **1. Contar individualmente** | `docs/site/modules/investimentos/index.html` (PFC-3) (citado) | INVESTIMENTOS/CMInvFIObj50, CMInvRFObj50, CMInvRVObj50; CMCONTABOBJ50, CMCAPCAROBJ50 | Executar prompt 11.32 | `InvestCotas.dpr` (título "Sistema de Cotas do Investimento") |
| 74 | Fundos de Investimento | `INVESTFDO/` | 5. Requer validação | `docs/site/modules/investimentos/index.html` (PFC-3) (citado) | INVESTIMENTOS (search path), CMCONTABOBJ50, CMCAPCAROBJ50 | Validar P-05: aplicação própria ou parte de INVESTIMENTOS | `InvestFDO.dpr` (8 units); fora de `3-Sistemas.bpg` |
| 75 | Controle de Cotas & Informações SPC | `COTAS/` | **1. Contar individualmente** | `docs/site/modules/investimentos/index.html` (PFC-3) (citado) | CMCONTABOBJ50 | Executar prompt 11.33 | `Cotas.dpr` (título "Controle de Cotas & Informações SPC") |
| 76 | Controle de Cotas Patrimoniais | `COTASPATRIM/` | **1. Contar individualmente** | Sem documentação funcional | CMCONTABOBJ50 | Executar prompt 11.34 | `CotasPatrim.dpr` (título "Controle de Cotas Patrimoniais") |

### 5.4 Jurídico

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 77 | Sistema Jurídico Consolidado | `SISTJURCONS/` | **1. Contar individualmente** | `docs/site/modules/juridico/index.html` (PFC-3) | CMRHOBJ50, CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, SHARED; fontes reutilizadas por PROCJUD, PROCPREV e MODCON | Executar prompt 11.35 após decisão P-02 | `SistJurCons.dpr`; em `3-Sistemas.bpg` |
| 78 | Processos Judiciais | `PROCJUD/` | 5. Requer validação | `docs/site/modules/juridico/index.html` (PFC-3) (citado) | SISTJURCONS (15 units em comum), CMRHOBJ50, CMCAPCAROBJ50, SHARED | Validar P-02: aplicação própria ou visão por matéria de SISTJURCONS | `ProcJud.dpr`; em `3-Sistemas.bpg`; menu quase idêntico ao de SISTJURCONS |
| 79 | RH — Contencioso Trabalhista | `MODCON/` | 5. Requer validação | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | SISTJURCONS (15 units em comum), CMRHOBJ50, CMCAPCAROBJ50, SHARED | Validar P-02 | `ModCon.dpr` (título "RH - Contencioso Trabalhista"); menu quase idêntico ao de SISTJURCONS |
| 80 | Lançador do Sistema Jurídico | `SISTJUR/` | 4. Excluir da contagem funcional | Sem documentação funcional | PROCJUD, MODCON, PROCPREV | Excluir (só menu de navegação) | `SistJur.dpr`; menu com 3 itens que abrem outros programas |

### 5.5 Recursos Humanos

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 81 | RH — Módulo Básico | `MODBAS/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) — rotulado como previdenciário (divergência P-09) | CMRHOBJ50, CMGLOBALOBJ50, SHARED | Executar prompt 11.36 (primeiro do RH — cadastro de pessoal) | `ModBas.dpr` (título "RH - Módulo Básico") |
| 82 | RH — Folha de Pagamento | `MODFOL/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMCAPCAROBJ50, CMINTBANCOMT50, FOLHA (search path), SHARED | Executar prompt 11.37 | `ModFol.dpr` (título "Folha de Pagamento") |
| 83 | RH — Cargos e Salários | `MODCES/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMINTBANCOMT50, SHARED | Executar prompt 11.38 | `ModCes.dpr` (título "RH - Cargos e Salários") |
| 84 | RH — Benefícios Sociais | `MODBEN/` | **1. Contar individualmente** | Sem documentação funcional | CMRHOBJ50, CMINTBANCOMT50, SHARED; servidor CMMODBENSVR50 | Executar prompt 11.39 | `ModBen.dpr` (título "RH - Benefícios Sociais") |
| 85 | RH — Administração de Desempenho | `MODAVA/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMINTBANCOMT50, SHARED; servidor CMMODAVASVR50 | Executar prompt 11.40 | `ModAva.dpr` (título "RH - Administração de Desempenho") |
| 86 | RH — Treinamento | `MODTRN/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, SHARED | Executar prompt 11.41 | `ModTrn.dpr` (título "Treinamento") |
| 87 | RH — Recrutamento e Seleção | `MODRES/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMINTBANCOMT50, SHARED | Executar prompt 11.42 | `ModRes.dpr` (título "RH - Recrutamento e Seleção") |
| 88 | RH — Medicina do Trabalho | `MODASM/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMRHOBJUTIL50 (search path), SHARED | Executar prompt 11.43 | `ModAsm.dpr` (título "RH - Medicina de Trabalho"); contém cópia `MODASM/Fontes/Fontes/ModAcesso.dpr` |
| 89 | RH — Controle de Ponto e Acesso | `MODACESSO/` | **1. Contar individualmente** | Sem documentação funcional | CMRHOBJUTIL50 (search path), SHARED | Executar prompt 11.44 | `ModAcesso.dpr` (título "Controle de Ponto e Acesso"); fora de `3-Sistemas.bpg` |
| 90 | RH — Autoatendimento do Empregado | `MODAUTO/` | **1. Contar individualmente** | `docs/site/modules/modulos-previdenciarios/index.html` (PFC-3) (citado) | CMRHOBJ50, CMCAPCARUTILOBJ50, MODTRN (search path), SHARED | Executar prompt 11.45 | `ModAuto.dpr` (título "RH - Auto Atendimento") |
| 91 | RH — Módulo de Atendimento | `MODATN/` | 2. Contar junto com outro módulo | Sem documentação funcional | MODASM, MODAVA, MODBAS, MODBEN, MODCES, MODFOL, MODRES, MODTRN (search path) | Não contar à parte; funções contadas nos módulos RH de origem | `ModAtn.dpr` com 4 units próprias; o menu abre formulários dos módulos RH |
| 92 | Objetos de negócio de RH | `CMRHOBJ50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | MODBAS, MODFOL, MODCES, MODBEN, MODAVA, MODTRN, MODRES, MODASM, MODAUTO, SISTJURCONS, PROCJUD, PROCPREV, MODCON, SRHCS | Avaliar na fronteira de cada módulo RH; dono do cadastro de pessoal = MODBAS (P-10) | Pacote `CmRHObj50` (452 units) |
| 93 | Objetos de RH — versão alternativa | `CMRHOBJUTIL50/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | MODACESSO, MODASM (search path) | Avaliar na fronteira; confirmar se é versão paralela de CMRHOBJ50 | Pacote `CmRHObj70.dpk`; 351 units com o mesmo nome em CMRHOBJ50; pasta Biometria |
| 94 | Componentes visuais de RH | `CMCOMPORH/` | 4. Excluir da contagem funcional | Sem documentação funcional | Módulos RH | Excluir (componentes) | `CMCompoRH.dpk` (2 units) |
| 95 | Lançador do Sistema de RH | `SRHCS/` | 4. Excluir da contagem funcional | Sem documentação funcional | Módulos RH | Excluir (só menu de navegação) | `SrhCs.dpr`; 1 unit; menu que abre os módulos RH |
| 96 | Fontes compartilhadas (ModComp, Folhas, Almox_Compras) | `SHARED/` | 3. Dependência ou serviço compartilhado | Sem documentação funcional | FOLHA, ALMOXARIFADO, COMPRAS2000, módulos RH, SISTJURCONS, PROCJUD, PROCPREV | Avaliar na fronteira; `SHARED/Almox_Compras` repete o menu de SCQ | `ModComp.dpr` (assinatura), lista de recebedores, cópia almox/compras |

### 5.6 Infraestrutura, tecnologia e documentação

| # | Módulo | Caminho | Recomendação | Estado da documentação | Dependências | Próxima ação | Evidência / justificativa |
|---:|---|---|---|---|---|---|---|
| 97 | Framework CM (componentes, forms base, terceiros, demos) | `CM/` | 4. Excluir da contagem funcional | Sem documentação funcional | Base técnica de todas as aplicações | Excluir; subcomponentes de negócio tratados à parte (CMADMPREV, CMPrevMT50, TotalPrev, Regra) | 7.639 arquivos; ComponentesXT (terceiros), Demos, Forms, Parser, Instaladores |
| 98 | Binários e arquivos de execução | `BIN/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir | DLLs, logs, recursos (sem fonte) |
| 99 | Ajuda de componentes de terceiros | `HELP/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir | .hlp/.chm de 1stClass, Indy, JCL, RAP |
| 100 | Ajuda HTML do Orçamento | `HELP_PLANUS/` | 4. Excluir da contagem funcional | Sem documentação funcional | ORCAMENTO (documentação de usuário) | Excluir da contagem; pode servir de evidência auxiliar para ORCAMENTO | 2.474 arquivos HTML (`ORCAMENTO_HTML`) |
| 101 | Scripts SQL de manutenção | `SCRIPT/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir; evidência auxiliar de modelo de dados | DDL/DML por solicitação (SIG/SOL) |
| 102 | Scripts SQL por ano | `__SCRIPTS__/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir; evidência auxiliar de modelo de dados | Pastas 2023–2026 |
| 103 | Componente de terceiros EMS Quick Export | `STK/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir | Pacotes QExport3 (fonte de terceiro) |
| 104 | Pacote de criptografia | `CMCRYPTO/` | 4. Excluir da contagem funcional | Sem documentação funcional | Várias aplicações | Excluir (infraestrutura) | `CMCrypto.dpk` (1 unit) |
| 105 | Servidor de aplicação do CFINAN | `APPSERVERCFINAN/` | 4. Excluir da contagem funcional | Sem documentação funcional | CFINAN, CMCFINANOBJ50 | Excluir (servidor MIDAS; funções contadas em CFINAN) | `AppServerCFinan.dpr` (DLL/TLB) |
| 106 | Servidor de aplicação contábil | `APPSERVERDLL/` | 4. Excluir da contagem funcional | Sem documentação funcional | CMCONTABOBJ50 | Excluir (servidor MIDAS) | `CMContabSvr50.dpr` |
| 107 | Servidor de aplicação IRRF | `APPSERVERIRRFDLL/` | 4. Excluir da contagem funcional | Sem documentação funcional | IRRF | Excluir (servidor MIDAS) | `CMIRRFSvr50.dpr` |
| 108 | Servidor de aplicação Livro | `APPSERVERLIVRODLL/` | 4. Excluir da contagem funcional | Sem documentação funcional | CMLIVROOBJ50 | Excluir (servidor MIDAS) | `CMLivroSvr50.dpr` |
| 109 | Servidor de aplicação Orçamento | `APPSERVERORCAMENTO/` | 4. Excluir da contagem funcional | Sem documentação funcional | ORCAMENTO, CMPLANEORCOBJ50 | Excluir (servidor MIDAS) | `OrcamentoSvr50.dpr` |
| 110 | Servidor de aplicação CP/CR | `APPSRVCAPCAR/` | 4. Excluir da contagem funcional | Sem documentação funcional | CPAGAR, CRECEBER | Excluir (servidor MIDAS) | `CMCAPCARSvr50.dpr` + ArquivosComuns |
| 111 | Servidor de aplicação almox/compras | `CMALMOXCOMPRASRVR50/` | 4. Excluir da contagem funcional | Sem documentação funcional | CMALMOXCOMPRAOBJ50 | Excluir (servidor MIDAS) | `CMAlmoxComprasSrvr50.dpr` |
| 112 | Servidor de aplicação MODAVA | `CMMODAVASVR50/` | 4. Excluir da contagem funcional | Sem documentação funcional | MODAVA | Excluir (servidor MIDAS) | `CmModAvaSvr50.dpr` |
| 113 | Servidor de aplicação MODBEN | `CMMODBENSVR50/` | 4. Excluir da contagem funcional | Sem documentação funcional | MODBEN | Excluir (servidor MIDAS) | `CmModBenSvr50.dpr` |
| 114 | Servidor de aplicação de padrões | `CMPADORESSVR50/` | 4. Excluir da contagem funcional | Sem documentação funcional | Framework CM | Excluir (servidor MIDAS) | `CMPadroesSrvr50.dpr` |
| 115 | Objeto MTS de RH | `CMMTSOBJRH/` | 4. Excluir da contagem funcional | Sem documentação funcional | CMRHOBJ50 | Excluir (servidor MTS) | `CmMtsObjRH.dpr` |
| 116 | Exemplo MTS mestre-detalhe | `MTSMESTREDETALHE/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir (exemplo técnico) | `MtsMestreDetalhe.dpr`, `CriaXml.dpr`, tabelas TBLMESTRE/TBLDETALHE |
| 117 | Projeto padrão CM (modelo) | `PROJETOCM/` | 4. Excluir da contagem funcional | Sem documentação funcional | Framework CM | Excluir (modelo de projeto) | `CMProject.dpr` (título "Projeto Padrão CM") |
| 118 | Configuração de projeto avulsa | `PROJETOSCM5/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir | Só `AdminImob.cfg` e `AdminImob.dof` |
| 119 | Atualizador de versão | `ATUVERSAOCM/` | 4. Excluir da contagem funcional | Sem documentação funcional | Framework CM | Excluir (utilitário de implantação) | `AtuVersaoCM.dpr` (2 units) |
| 120 | Documentação gerada (portal PFC-3) | `docs/` | 4. Excluir da contagem funcional | — | — | Excluir; fonte de evidência | HTML/MD de documentação e ferramentas de contagem de linhas |
| 121 | Portal Blueprint AS-IS (docs1) | `docs1/` | 4. Excluir da contagem funcional | — | — | Excluir; recebe as abas SFP | Documentação funcional e `pontos-de-funcao/` |
| 122 | Kit de integração .NET 10 / React | `Funcef-kit/` | 4. Excluir da contagem funcional | Sem documentação funcional | — | Excluir (tecnologia futura, não legado) | Feeds NuGet/npm, templates e manuais |
| 123 | POC de migração contábil | `poc-contabil/` | 4. Excluir da contagem funcional | Sem documentação funcional | CONTAB (reimplementa `FCadContasContabMT`) | Excluir (evita dupla contagem com CONTAB) | README: POC .NET 10 + React 19 do cadastro de contas contábeis |

## 6. Mapa de dependências

### 6.1 Pacotes de negócio × aplicações que os declaram

Fonte: linha `Packages=` dos arquivos `.dof` das aplicações (framework e componentes visuais omitidos). Um pacote declarado por várias aplicações é **serviço compartilhado**: seus dados contam como AL no dono funcional e como AL referenciado nos demais, e suas telas contam como PE apenas no módulo cujo menu as expõe ao usuário.

| Pacote | Pasta | Dono funcional (proposto) | Aplicações que o declaram |
|---|---|---|---|
| `CMRegra50` | `CM/Regra/` | REGRA (cadastro de regras) | ADMINIMOB, AGENDAMENTO, ALIENACAO, ALMOXARIFADO, ASSISTENCIAL, ATUVERSAOCM, AUTOATENDIMENTO, BENEFICIOPREV, CADASTROPREV, CENTRALAP, COMPRAS2000, CONTAB, CONTRATO, CONTRIBUICAOPREV, COTAS, COTASPATRIM, CPAGAR, CRECEBER, EMPRESTIMO, EXPORTFCRT, FOLHA, FUNCEF, GLOBALCM, INDICADORES, INTERFACEPREV, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, INVESTIMOB, MODACESSO, MODASM, MODATN, MODAUTO, MODAVA, MODBAS, MODBEN, MODCES, MODCON, MODFOL, MODRES, MODTRN, MTSMESTREDETALHE, ORCAMENTO, PARAMPREV, PROCJUD, PROCPREV, PROJETOATUARIAL, RADG, RECMERC, REFER, RELATORIOSCM, SHARED, SIMULADORFCRT, SISTJUR, SISTJURCONS, SRHCS (56) |
| `CMTotalPrev50` | `CM/TotalPrev/` | — (consultas comuns) | ADMINIMOB, AGENDAMENTO, ALMOXARIFADO, ASSISTENCIAL, ATUVERSAOCM, AUTOATENDIMENTO, BENEFICIOPREV, CADASTROPREV, CENTRALAP, COMPRAS2000, CONTAB, CONTRATO, CONTRIBUICAOPREV, COTAS, COTASPATRIM, CPAGAR, CRECEBER, EMPRESTIMO, EXPORTFCRT, FOLHA, FUNCEF, GLOBALCM, INDICADORES, INTERFACEPREV, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, INVESTIMOB, IRRF, MODACESSO, MODASM, MODATN, MODBAS, MODFOL, MTSMESTREDETALHE, ORCAMENTO, PARAMPREV, PROCPREV, PROJETOATUARIAL, RADG, RECMERC, REFER, RELATORIOSCM, SHARED, SIMULADORFCRT, SISTJURCONS (46) |
| `CmBack50` | `CMBACK/` | GLOBALCM (validar) | ADMINIMOB, ALIENACAO, ALMOXARIFADO, ATUVERSAOCM, BENEFICIOPREV, CADASTROPREV, CAFMT, CENTRALAP, CFINAN, COMPRAS2000, CPAGAR, CRECEBER, EMPRESTIMO, FUNCEF, GLOBALCM, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, INVESTIMOB, MODACESSO, MODASM, MODATN, MODAUTO, MODAVA, MODBAS, MODBEN, MODCES, MODCON, MODFOL, MODRES, MODTRN, ORCAMENTO, PARAMPREV, PROCJUD, PROCPREV, RECMERC, RELATORIOSCM, SIMULADORFCRT, SISTJUR, SISTJURCONS, SRHCS (41) |
| `CMRegra50MT` | `CM/RegraMT/` | REGRA (cadastro de regras) | ADMINIMOB, AGENDAMENTO, ALIENACAO, ASSISTENCIAL, AUTOATENDIMENTO, BENEFICIOPREV, CADASTROPREV, CENTRALAP, COMPRAS2000, COTAS, COTASPATRIM, EMPRESTIMO, EXPORTFCRT, FOLHA, FUNCEF, INDICADORES, INTERFACEPREV, INVESTIMENTOS, MODATN, MODFOL, PARAMPREV, PROJETOATUARIAL, RADG, RELATORIOSCM, SHARED (25) |
| `CMCapCarObj50` | `CMCAPCAROBJ50/` | CPAGAR / CRECEBER (P-16) | ADMINIMOB, ALIENACAO, ASSISTENCIAL, BENEFICIOPREV, CADASTROPREV, CFINAN, COMPRAS2000, CONTRATO, CPAGAR, CRECEBER, FUNCEF, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, INVESTIMOB, IRRF, MODATN, MODCON, MODFOL, PARAMPREV, PROCJUD, PROCPREV, SISTJURCONS (23) |
| `CMFBCOMUM50` | `FOLHA/CMFbComum50/` | FOLHA (parcial) / framework | AGENDAMENTO, ASSISTENCIAL, AUTOATENDIMENTO, COMPRAS2000, CONTRIBUICAOPREV, EMPRESTIMO, EXECUTAREGRA, EXPORTFCRT, FOLHA, FUNCEF, GLOBALCM, INTERFACEPREV, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, IRRF, PROJETOATUARIAL, RADG, REFER, REGRA, RELATORIOSCM, SHARED (22) |
| `CmGlobalObj50` | `CMGLOBALOBJ50/` | GLOBALCM | ALIENACAO, ALMOXARIFADO, AUTOATENDIMENTO, CENTRALAP, CFINAN, COMPRAS2000, CPAGAR, CRECEBER, EXPORTFCRT, FOLHA, FUNCEF, GLOBALCM, INVESTIMOB, IRRF, MODBAS, ORCAMENTO, PROJETOATUARIAL, RADG, RECMERC, RELATORIOSCM (20) |
| `CmIntBancoMT50` | `CMINTBANCOMT50/` | — (lay-outs bancários; validar) | ALMOXARIFADO, CFINAN, CPAGAR, CRECEBER, EMPRESTIMO, FOLHA, FUNCEF, GLOBALCM, IRRF, MODAVA, MODBEN, MODCES, MODCON, MODFOL, MODRES, PROCJUD, PROCPREV, RECMERC, RELATORIOSCM, SISTJURCONS (20) |
| `CMContabObj50` | `CMCONTABOBJ50/` | CONTAB | ADMINIMOB, ALMOXARIFADO, BENEFICIOPREV, CADASTROPREV, CAF, CAFMT, COMPRAS2000, CONTAB, COTAS, COTASPATRIM, CPAGAR, CRECEBER, INVESTCOTAS, INVESTFDO, INVESTIMENTOS, MODATN, ORCAMENTO, PARAMPREV, RECMERC (19) |
| `CmRHObj50` | `CMRHOBJ50/` | Módulos RH; cadastro de pessoal em MODBAS (P-10) | MODASM, MODAUTO, MODAVA, MODBAS, MODBEN, MODCES, MODCON, MODFOL, MODRES, MODTRN, PROCJUD, PROCPREV, SISTJUR, SISTJURCONS, SRHCS (15) |
| `CmCapCarUtilObj50` | `CMCAPCARUTILOBJ50/` | CPAGAR / CRECEBER (P-16) | CONTRATO, CONTRIBUICAOPREV, CPAGAR, CRECEBER, FUNCEF, IRRF, MODCON, PROCJUD, PROCPREV, SISTJURCONS (10) |
| `CMIRRFobj50` | `CMIRRFOBJ50/` | IRRF | AUTOATENDIMENTO, CENTRALAP, COMPRAS2000, EMPRESTIMO, EXPORTFCRT, FOLHA, FUNCEF, GLOBALCM, IRRF, PROJETOATUARIAL (10) |
| `CMWebComum50` | `AUTOATENDIMENTO/CMWebComum50/` | AUTOATENDIMENTO | AGENDAMENTO, AUTOATENDIMENTO, BENEFICIOPREV, CADASTROPREV, CENTRALAP, CONTRIBUICAOPREV, FUNCEF, IRRF, PARAMPREV, PROJETOATUARIAL (10) |
| `CMAdmPrev` | `CM/CMADMPREV/` | Distribuído entre FOLHA, CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV (pelo menu) | AUTOATENDIMENTO, BENEFICIOPREV, CADASTROPREV, CENTRALAP, CONTRIBUICAOPREV, FOLHA, FUNCEF, PARAMPREV, SIMULADORFCRT (9) |
| `CMFBOBJ50` | `FOLHA/CMFbObj50/` | FOLHA | COMPRAS2000, EXPORTFCRT, FOLHA, FUNCEF, IRRF, PROJETOATUARIAL, REFER (7) |
| `CMFolhaObjMT` | `FOLHA/CMFolhaObjMt/` | FOLHA | AUTOATENDIMENTO, CENTRALAP, COMPRAS2000, FOLHA, FUNCEF, IRRF, PROJETOATUARIAL (7) |
| `CMPrevMT50` | `CM/CMPrevMT50/` | Por tabela: ver dupla contagem | BENEFICIOPREV, CADASTROPREV, CONTRIBUICAOPREV, FOLHA, FUNCEF, IRRF, PARAMPREV (7) |
| `CMCAFObj50` | `CMCAFOBJ50/` | CAF | ALMOXARIFADO, CAF, CAFMT, FUNCEF, INVESTIMOB, RECMERC (6) |
| `CMIntegraEP50` | `EMPRESTIMOBPL/Integra/` | EMPRESTIMO | BENEFICIOPREV, CADASTROPREV, CENTRALAP, CONTRIBUICAOPREV, EMPRESTIMO, PARAMPREV (6) |
| `CMPlaneOrcObj50` | `CMPLANEORCOBJ50/` | ORCAMENTO | COMPRAS2000, CONTAB, CONTRATO, FUNCEF, IRRF, ORCAMENTO (6) |
| `CMAlmoxCompraObj50` | `CMALMOXCOMPRAOBJ50/` | ALMOXARIFADO / COMPRAS2000 (P-17) | ALMOXARIFADO, COMPRAS2000, FUNCEF, PROJETOATUARIAL, RECMERC (5) |
| `CMAutoAtendimentoObj50` | `AUTOATENDIMENTO/CMAutoAtendimentoObj50/` | AUTOATENDIMENTO | AGENDAMENTO, AUTOATENDIMENTO, FUNCEF, IRRF, PROJETOATUARIAL (5) |
| `CMCfinanObj50` | `CMCFINANOBJ50/` | CFINAN | CFINAN, COMPRAS2000, FUNCEF, IRRF, PROJETOATUARIAL (5) |
| `CMImobiliarioObj50` | `CMIMOBILIARIOOBJ50/` | ADMINIMOB / INVESTIMOB / ALIENACAO (P-18) | ADMINIMOB, ALIENACAO, INDICADORES, INVESTIMOB, MODATN (5) |
| `CmRelatorioObj50` | `CMRELATORIOOBJ50/` | RELATORIOSCM (P-13) | CENTRALAP, FUNCEF, IRRF, PROJETOATUARIAL, RELATORIOSCM (5) |
| `CmAgendamentoObj50` | `CMAGENDAMENTOOBJ50/` | AGENDAMENTO | AGENDAMENTO, CENTRALAP, FUNCEF (3) |
| `CMExecEP50` | `EMPRESTIMOBPL/Interface/` | EMPRESTIMO | CENTRALAP, EMPRESTIMO (2) |
| `CmIntBanco50` | `CMINTBANCOMT50/` | — (versão antiga de CMIntBancoMT50) | ATUVERSAOCM, CAFMT (2) |
| `cmLivroObj50` | `CMLIVROOBJ50/` | IRRF (validar) | FUNCEF, IRRF (2) |
| `CMObjetosEP50` | `EMPRESTIMOBPL/Objetos/` | EMPRESTIMO | CENTRALAP, EMPRESTIMO (2) |
| `CMIndicadoresObj50` | `CMINDICADORESOBJ50/` | INDICADORES | INDICADORES (1) |
| `CMInvFIObj50` | `INVESTIMENTOS/CMInvFIObj50/` | INVESTIMENTOS | INVESTCOTAS (1) |
| `CMInvRFObj50` | `INVESTIMENTOS/CMInvRFObj50/` | INVESTIMENTOS | INVESTCOTAS (1) |
| `CMInvRVObj50` | `INVESTIMENTOS/CMInvRVObj50/` | INVESTIMENTOS | INVESTCOTAS (1) |

### 6.2 Reuso de fontes entre pastas (search path)

| Aplicação | Usa fontes de | Leitura para a contagem |
|---|---|---|
| EMPRESTIMO | `EMPRESTIMOBPL/`, `CENTRALAP/`, `FOLHA/`, `CMCAPCARUTILOBJ50/` | EMPRESTIMOBPL conta junto; FOLHA e CENTRALAP ficam na fronteira |
| MODATN | `MODASM/`, `MODAVA/`, `MODBAS/`, `MODBEN/`, `MODCES/`, `MODFOL/`, `MODRES/`, `MODTRN/` | Casca: funções contadas nos módulos de origem |
| RECMERC | `ALMOXARIFADO/`, `ALMOX&COMPRAS/`, `GERAL/`, `CMALMOXCOMPRAOBJ50/`, `CMCAPCAROBJ50/`, `CMCAPCARUTILOBJ50/`, `CMCONTABOBJ50/` | Conta junto com ALMOXARIFADO / COMPRAS2000 |
| PROCJUD, PROCPREV, MODCON | `SISTJURCONS/` (12–15 units em comum cada) | P-02 — fronteira jurídica |
| MODFOL | `FOLHA/`, `CMCAPCARUTILOBJ50/` | Aplicações diferentes; não juntar |
| MODAUTO | `MODTRN/`, `CMCAPCARUTILOBJ50/` | Canal para MODTRN |
| MODACESSO, MODASM | `CMRHOBJUTIL50/` | Versão paralela de CMRHOBJ50 |
| INVESTFDO | `INVESTIMENTOS/` | P-05 |
| CFINAN | `CMIMOBILIARIOOBJ50/` | Verificar função imobiliária exposta |
| CPAGAR | `IRRF/`, `CMINTBANCOMT50/` | Retenções são de IRRF |
| ADMINIMOB | `CMIMOBILIARIOOBJ50/`, `CMCAPCARUTILOBJ50/` | Imobiliário compartilhado (P-18) |
| CADASTROPREV | `GLOBALCM/` | Dono de pessoa/patrocinadora (P-14) |
| FOLHA, ALMOXARIFADO, COMPRAS2000, MOD*, SISTJURCONS, PROCJUD, PROCPREV | `SHARED/` | Fontes comuns; avaliar na fronteira |

### 6.3 Dados com risco de dupla contagem entre módulos

| Dado / grupo | Módulos envolvidos | Situação atual | Decisão necessária |
|---|---|---|---|
| `BENEFBFCIARIO` | FOLHA, BENEFICIOPREV (mantêm); CONTRIBUICAOPREV (lê) | Contado como AL nos dois módulos que mantêm (7 SFP em risco) | Dono único (P-01) |
| `PROCESSOBENEF` | FOLHA, BENEFICIOPREV | Contado nos dois (7 SFP em risco); metodologia recomenda BENEFICIOPREV | Dono único (P-01) |
| `PESSOA` / `PARTICIPANTE` | CADASTROPREV, GLOBALCM, FOLHA, CENTRALAP, AUTOATENDIMENTO, PROJETOATUARIAL | FOLHA trata como externo (PENDENTE) | Dono = CADASTROPREV ou GLOBALCM (P-14) |
| `PATRO` / `PLANPREV` | PARAMPREV, GLOBALCM, FOLHA, BENEFICIOPREV, CONTRIBUICAOPREV | FOLHA trata como externo (PENDENTE) | Dono único (P-14) |
| `BANCO` / agência | GLOBALCM, FOLHA, CPAGAR, CRECEBER, CFINAN | FOLHA trata como externo | Dono = GLOBALCM |
| Tabelas de IR | IRRF, FOLHA, EMPRESTIMO | FOLHA trata como AL-23 INFERIDO | Dono = IRRF |
| `CTRLINTERFACE` / controle de interface | FOLHA, INTERFACEPREV | Contado em FOLHA (AL-12) | Confirmar se é o mesmo grupo |
| Lançamentos contábeis | CONTAB + todos os módulos que apropriam | FOLHA conta PE de apropriação | Geração no módulo de origem; AL contábil em CONTAB |
| Documentos a pagar/receber | CPAGAR, CRECEBER, CONTRATO, ADMINIMOB, ALIENACAO, SISTJURCONS, MODAUTO, CFINAN | — | Dono = CPAGAR / CRECEBER (P-16) |
| Produto / fornecedor | ALMOXARIFADO, COMPRAS2000, RECMERC, SCQ, GLOBALCM, CONTRATO | — | Dono único (P-17) |
| Imóvel | ADMINIMOB, INVESTIMOB, ALIENACAO, INDICADORES | — | Dono único (P-18) |
| Bens patrimoniais | CAF / CAFMT, INVESTIMOB, ADMINIMOB, ALMOXARIFADO, MODASM | — | Dono = CAF (P-03) |
| Processo judicial | SISTJURCONS, PROCJUD, PROCPREV, MODCON | — | Fronteira jurídica (P-02) |
| Pessoal / cargos (RH) | MODBAS, MODFOL, MODCES, MODAVA, MODATN, MODAUTO | — | Dono = MODBAS (P-10) |
| Cotas e carteiras | INVESTIMENTOS, INVESTCOTAS, COTAS, COTASPATRIM, INVESTFDO | — | P-05 e P-19 |
| Consultas de atendimento | CENTRALAP, AUTOATENDIMENTO, módulos previdenciários, ASSISTENCIAL, EMPRESTIMO | — | Contar no canal só o PE com resultado distinto |

## 7. Padrão da análise SFP de Folha de Benefícios

Fonte examinada: `docs1/pontos-de-funcao/folha.html` (PFC-48), com `docs1/pontos-de-funcao/index.html` e `docs1/pontos-de-funcao/metodologia.html`. Este padrão é o que os prompts mandam replicar. O conteúdo funcional e os totais da Folha **não** devem ser copiados para outros módulos.

### 7.1 Padrão metodológico (estrutura das seções)

| Seção (id HTML) | Conteúdo obrigatório |
|---|---|
| 1. Identificação da contagem (`s1-identificacao`) | Tabela atributo/valor: nome, código, pasta, entry point (`.dpr`), tecnologia ("contexto técnico, não fator de contagem SFP"), propósito, tipo de fronteira, fronteira, escopo, data, método (link para a metodologia), versão do método e pesos, fontes (casos de uso, modelo de dados, integrações). |
| 2. Sumário executivo | Cartões `stats` (PE, AL, elementos, SFP) + tabela elemento/quantidade/peso/subtotal + parágrafo de memória de cálculo + interpretação + comparação com método anterior (só quando houver). |
| 3. Inventário de Processos Elementares (PE) | Tabela: ID (`PE-nn`), nome, objetivo, caso de uso/jornada, justificativa de distinção, fonte (unit/form), situação (COMPROVADO / INFERIDO / PENDENTE) + linha de total `n PE × 4,6`. |
| 4. Inventário de Arquivos Lógicos (AL) | Tabela: ID (`AL-nn`), nome, descrição, fronteira ("Mantido em X" ou "Referenciado (dono)"), PE relacionados, fonte, situação + total `n AL × 7`. |
| 5. Memória de cálculo | Fórmula, conta aplicada, tabela com referência IFPUG SFP / SISP v3.0 e verificação de coincidência com a seção 2. |
| 6. Rastreabilidade | PE × caso de uso × jornada × regras de negócio × fonte no código; AL ligados ao modelo de dados. |
| 7. Integrações e dupla contagem | Tabela dado compartilhado / papel no módulo / quem mais usa / decisão de contagem / risco; lista de dependências externas que não geram elemento próprio (por exemplo stored procedures como implementação de um PE). |
| 8. Pendências | Tabela elemento / tipo / o que falta / impacto se confirmado / validação necessária + total de pendências e efeito possível sobre o total. |
| Navegação | Bloco `doc-links` com links para a entrada da área, as outras abas de módulo, a metodologia, o módulo no Blueprint e o Blueprint. |

**Tratamento de dependências no modelo:** dado mantido por outro módulo entra como AL com fronteira "Referenciado (dono)"; dado mantido por dois módulos é sinalizado como risco de dupla contagem, com o impacto em SFP; integrações e chamadas entre módulos não geram SFP sozinhas.

### 7.2 Padrão visual

- HTML5 `lang="pt-BR"`, folha de estilo comum `../assets/css/style.css` (sem CSS embutido).
- `<header>` com `div.badge` ("Blueprint AS-IS — Delphi 5 — <issue>"), `<h1>` "📐 Simple Function Points — <Módulo>" e subtítulo com PE, AL e total.
- `<nav>` igual em todas as páginas da área: "📐 Entrada", uma aba por módulo, "📜 Metodologia da contagem", "⬅ Voltar ao Blueprint".
- `<main>` com uma `<section id="sN-...">` por seção, título em `div.section-title`, tabelas dentro de `div.table-wrap`, notas em `p.note` / `p.note-info`, cartões em `div.stats > div.stat > div.n + div.l`, fórmula em `div.pf-block`.
- Situação da evidência com `span.ev.ev-comprovado`, `span.ev.ev-inferido` e `span.ev.ev-pendente`.
- `<footer>` com issue, nome do módulo, "Sistema legado Delphi 5", "pt-BR" e data de geração.

### 7.3 Problemas encontrados na análise de Folha (não replicar)

| # | Problema | Onde | Orientação para os novos prompts |
|---|---|---|---|
| F-1 | A página tem **8 seções numeradas** (Identificação, Sumário, PE, AL, Memória, Rastreabilidade, Integrações e dupla contagem, Pendências) + Navegação. A descrição do card fala em 10 (com Premissas, Validação e Conclusão separadas), mas essas seções não existem na página; premissas e limitações ficam no `index.html` e na metodologia. | Estrutura | Replicar as 8 seções. Premissas, validação e conclusão do módulo entram em notas das seções 1, 7 e 8; não criar estrutura diferente por módulo. |
| F-2 | PE-08 "Conciliar e reembolsar INSS" e PE-15 "Reembolso INSS" têm o mesmo caso de uso (UC105/JF010) e as mesmas regras — risco de contar duas vezes a mesma capacidade. | Seção 3 | Não contar duas vezes a mesma capacidade; justificar a distinção com objetivo diferente para o usuário. |
| F-3 | PE-22, PE-23 e PE-25 são lookups (benefício, rubrica, conta) sem caso de uso próprio. | Seção 3 | Lista de seleção que só apoia outro PE não é PE; conte consulta só quando é um processo completo para o usuário. |
| F-4 | A fonte de PE-06 "Importar convênios" é `FExportaTxT` (nome de exportação). | Seção 3 | A fonte citada deve corresponder ao processo. |
| F-5 | O total de 276 SFP mistura elementos COMPROVADO com PENDENTE/INFERIDO (AL-03, AL-07, AL-09–AL-11, AL-16–AL-23) sem subtotal separado. | Seções 2 e 5 | Apresentar subtotal confirmado e subtotal preliminar, além do total. |
| F-6 | Vários PE com fonte "—" (PE-07, PE-08, PE-10, PE-11, PE-15, PE-17, PE-21) e PE-19/PE-20 sem caso de uso na rastreabilidade. | Seções 3 e 6 | Todo PE precisa de fonte; sem fonte → PENDENTE. |
| F-7 | `BENEFBFCIARIO` e `PROCESSOBENEF` contados como AL em FOLHA e em BENEFICIOPREV (14 SFP), embora a metodologia recomende BENEFICIOPREV como dono de `PROCESSOBENEF`. | Seção 7 | Aplicar a regra do dono único e registrar o dado como referenciado nos outros módulos. |
| F-8 | O `index.html` e o `<nav>` listam só 3 módulos, e o total geral (749,4 SFP, 64 PE, 65 AL) está fixo no texto. | Navegação | Cada novo módulo atualiza nav, cartões, tabela comparativa e totais (seção 8). |
| F-9 | `docs/system-overview.html` descreve FOLHA como folha "com lançamentos RM/Dinâmica/SRH", o que mistura a Folha de Benefícios com a folha de RH (MODFOL / CONTAB). | Documentação de apoio | Usar `docs1/folha/` como fonte de FOLHA; não juntar com MODFOL. |

## 8. Localização das abas na navegação

- **Portal:** `docs1/index.html` → cartão "Análise de pontos de função" → `docs1/pontos-de-funcao/index.html`.
- **Área:** `docs1/pontos-de-funcao/` — `index.html` (entrada), `metodologia.html` e uma página por módulo (`folha.html`, `contribuicao.html`, `beneficioprev.html`).
- **Nova aba:** `docs1/pontos-de-funcao/<slug>.html` (slug na tabela abaixo), criada a partir da estrutura de `folha.html`.

Ao criar uma aba, o prompt manda atualizar (e só isso fora da página nova):

1. O `<nav>` de `index.html`, `metodologia.html` e de **todas** as páginas de módulo existentes, inserindo o link na ordem da tabela abaixo.
2. Em `index.html`: um cartão do módulo em "Análises por módulo", uma linha na tabela "Resumo comparativo", os cartões e o texto da "Visão geral da contagem" (módulos analisados, PE, AL, total SFP e memória de cálculo do total). Os totais dos outros módulos **não** mudam.
3. Em `metodologia.html`: uma linha na tabela "Escopo, fronteiras e dupla contagem" e, se houver, linhas novas na tabela de dupla contagem.
4. Nos blocos "🔗 Navegação" das páginas de módulo: o link para a nova aba.

| Ordem no nav | Módulo | Aba (`docs1/pontos-de-funcao/...`) | Situação | Prompt |
|---:|---|---|---|---|
| 1 | Folha de Benefícios | `folha.html` | Existe (PFC-48) | 11.1 |
| 2 | Contribuição Previdenciária | `contribuicao.html` | Existe (PFC-48) | 11.2 |
| 3 | Benefício Previdenciário | `beneficioprev.html` | Existe (PFC-48) | 11.3 |
| 4 | Cadastro Previdenciário | `cadastroprev.html` | A criar | 11.4 |
| 5 | Parametrização Previdenciária | `paramprev.html` | A criar | 11.5 |
| 6 | Interface com Instituições Previdenciárias | `interfaceprev.html` | A criar | 11.6 |
| 7 | Projeto Atuarial (Cálculo Atuarial) | `projetoatuarial.html` | A criar | 11.7 |
| 8 | Administração Assistencial | `assistencial.html` | A criar | 11.8 |
| 9 | Empréstimo | `emprestimo.html` | A criar | 11.9 |
| 10 | Central de Atendimento ao Público | `centralap.html` | A criar | 11.10 |
| 11 | Autoatendimento (web + gerência + autoempréstimo) | `autoatendimento.html` | A criar | 11.11 |
| 12 | Agendamento de Atendimentos | `agendamento.html` | A criar | 11.12 |
| 13 | Contabilidade | `contab.html` | A criar | 11.13 |
| 14 | Contas a Pagar | `cpagar.html` | A criar | 11.14 |
| 15 | Contas a Receber | `creceber.html` | A criar | 11.15 |
| 16 | Controle Financeiro | `cfinan.html` | A criar | 11.16 |
| 17 | Planejamento e Orçamento | `orcamento.html` | A criar | 11.17 |
| 18 | Impostos e Tributos (IRRF) | `irrf.html` | A criar | 11.18 |
| 19 | Contratos e Projetos | `contrato.html` | A criar | 11.19 |
| 20 | Controle do Ativo Fixo | `caf.html` | A criar | 11.20 |
| 21 | Almoxarifado e Custos | `almoxarifado.html` | A criar | 11.21 |
| 22 | Compras | `compras.html` | A criar | 11.22 |
| 23 | Controle de Qualidade de Fornecedores | `scq.html` | A criar | 11.23 |
| 24 | Cadastros Globais (GlobalCM) | `globalcm.html` | A criar | 11.24 |
| 25 | Regras de Negócio | `regra.html` | A criar | 11.25 |
| 26 | RAD — Registro de Alçadas e Decisões | `radg.html` | A criar | 11.26 |
| 27 | Indicadores de Shoppings, Hotéis e Parques | `indicadores.html` | A criar | 11.27 |
| 28 | Administração Imobiliária | `adminimob.html` | A criar | 11.28 |
| 29 | Investimentos Imobiliários | `investimob.html` | A criar | 11.29 |
| 30 | Alienação de Imóveis | `alienacao.html` | A criar | 11.30 |
| 31 | Sistema de Investimentos | `investimentos.html` | A criar | 11.31 |
| 32 | Sistema de Cotas de Investimentos | `investcotas.html` | A criar | 11.32 |
| 33 | Controle de Cotas & Informações SPC | `cotas.html` | A criar | 11.33 |
| 34 | Controle de Cotas Patrimoniais | `cotaspatrim.html` | A criar | 11.34 |
| 35 | Sistema Jurídico Consolidado | `sistjurcons.html` | A criar | 11.35 |
| 36 | RH — Módulo Básico | `modbas.html` | A criar | 11.36 |
| 37 | RH — Folha de Pagamento | `modfol.html` | A criar | 11.37 |
| 38 | RH — Cargos e Salários | `modces.html` | A criar | 11.38 |
| 39 | RH — Benefícios Sociais | `modben.html` | A criar | 11.39 |
| 40 | RH — Administração de Desempenho | `modava.html` | A criar | 11.40 |
| 41 | RH — Treinamento | `modtrn.html` | A criar | 11.41 |
| 42 | RH — Recrutamento e Seleção | `modres.html` | A criar | 11.42 |
| 43 | RH — Medicina do Trabalho | `modasm.html` | A criar | 11.43 |
| 44 | RH — Controle de Ponto e Acesso | `modacesso.html` | A criar | 11.44 |
| 45 | RH — Autoatendimento do Empregado | `modauto.html` | A criar | 11.45 |

Com 45 abas, o `<nav>` ficará longo. Recomenda-se agrupar os links por domínio (Previdenciário, Contábil/Financeiro, Imobiliário/Investimentos, Jurídico, RH) dentro do próprio `<nav>`, mantendo `📐 Entrada` e `📜 Metodologia` nas pontas. O primeiro prompt que passar de 10 abas deve fazer esse agrupamento uma vez, sem mudar o CSS comum.

## 9. Ordem de execução

### 9.1 Fases desta entrega (PFC-49)

| Fase | Atividade | Situação |
|---|---|---|
| 1. Explorar | Listar as 119 pastas, programas (`.dpr`), títulos, grupos `.bpg`, pacotes (`.dof`), menus (`FPrincipal.dfm`), documentação e análises SFP existentes | Concluída |
| 2. Avaliar | Classificar cada pasta nas 5 categorias (seções 3 e 5) | Concluída |
| 3. Padronizar | Descrever o padrão da análise de Folha e seus problemas (seção 7) | Concluída |
| 4. Gerar | Escrever este documento com inventário, mapa e 45 prompts | Concluída |
| 5. Validar | Conferir cobertura (todas as pastas), personalização dos prompts, uso só de terminologia SFP, existência dos caminhos citados e que só este arquivo foi alterado (seção 12.3) | Concluída |

### 9.2 Ordem recomendada para executar os prompts

Primeiro os donos de dados mestres, para que os módulos seguintes referenciem esses AL em vez de recontá-los. Antes de cada onda, resolva as pendências que mudam a fronteira (seção 12).

| Onda | Antes, resolver | Prompts (seção 11) |
|---|---|---|
| 1 | P-14 (patrocinadora/plano) | 11.4 CADASTROPREV, 11.5 PARAMPREV, 11.24 GLOBALCM, 11.25 REGRA |
| 2 | P-01 (BENEFBFCIARIO/PROCESSOBENEF), P-12, P-15 | 11.1 FOLHA, 11.2 CONTRIBUICAOPREV, 11.3 BENEFICIOPREV, 11.6 INTERFACEPREV, 11.7 PROJETOATUARIAL, 11.8 ASSISTENCIAL, 11.9 EMPRESTIMO |
| 3 | P-15 | 11.10 CENTRALAP, 11.11 AUTOATENDIMENTO, 11.12 AGENDAMENTO |
| 4 | P-07, P-16 | 11.13 CONTAB, 11.14 CPAGAR, 11.15 CRECEBER, 11.16 CFINAN, 11.17 ORCAMENTO, 11.18 IRRF, 11.19 CONTRATO, 11.26 RADG |
| 5 | P-03, P-17 | 11.20 CAF, 11.21 ALMOXARIFADO, 11.22 COMPRAS2000, 11.23 SCQ |
| 6 | P-04, P-05, P-06, P-18, P-19 | 11.27 INDICADORES, 11.28 ADMINIMOB, 11.29 INVESTIMOB, 11.30 ALIENACAO, 11.31 INVESTIMENTOS, 11.32 INVESTCOTAS, 11.33 COTAS, 11.34 COTASPATRIM |
| 7 | P-02 | 11.35 SISTJURCONS |
| 8 | P-09, P-10 | 11.36 MODBAS, 11.37 MODFOL, 11.38 MODCES, 11.39 MODBEN, 11.40 MODAVA, 11.41 MODTRN, 11.42 MODRES, 11.43 MODASM, 11.44 MODACESSO, 11.45 MODAUTO |

Os módulos da categoria 5 (Requer validação) não têm prompt. Depois de validados, se algum passar para "Contar individualmente", gere o prompt dele a partir de um prompt do mesmo domínio, trocando caminhos, dependências e pendências — sem reaproveitar o conteúdo funcional.

## 10. Estado das análises existentes

| Módulo | Aba | Issue | PE | AL | Total SFP | Pendências registradas | Casos de uso (fonte) | Observações |
|---|---|---|---:|---:|---:|---|---|---|
| Folha de Benefícios | `docs1/pontos-de-funcao/folha.html` | PFC-48 (refaz PFC-47) | 25 | 23 | 276,0 | 8 itens (AL a confirmar + dupla contagem) | 12 (UC101–UC112) | Modelo de padronização. Problemas F-1 a F-7 (seção 7.3). Total sem dupla contagem: 262 SFP. |
| Contribuição Previdenciária | `docs1/pontos-de-funcao/contribuicao.html` | PFC-48 | 19 | 22 | 241,4 | 7 itens (inclui `FAIXASPROVISAOPERDACONTRIB`, +7 SFP se confirmado) | 9 (UC201–UC209) | Mesma estrutura de 8 seções. |
| Benefício Previdenciário | `docs1/pontos-de-funcao/beneficioprev.html` | PFC-48 | 20 | 20 | 232,0 | 9 itens (inclui dupla contagem com FOLHA) | 10 (UC301–UC310) | Total sem dupla contagem, se FOLHA ficar dona: 218 SFP. |
| **Total da área** | `docs1/pontos-de-funcao/index.html` | PFC-48 | **64** | **65** | **749,4** | — | 31 | 735,4 SFP descontando os 14 SFP de dupla contagem. A contagem anterior em APF tradicional (PFC-47: 764) está só como referência histórica. |

Nenhum outro módulo do repositório tem análise SFP. Os outros 42 módulos recomendados ainda não foram contados.

Outros documentos de dimensionamento que **não** são contagem funcional: `Analise_linhas_dependencias.md` (linhas das dependências, PFC-44), `docs/contagem-linha-emprestimo.md` (linhas do Empréstimo) e `docs1/visao-geral/inventario.html` (inventário de artefatos). Nenhum deve ser convertido em SFP.

## 11. Prompts individuais

Cada prompt abaixo é **autônomo**: pode ser colado sozinho numa nova sessão. Todos seguem o mesmo esqueleto (contexto → caminhos → dependências → modelo → método SFP → navegação → pendências → restrições → relatório), mas caminhos, áreas funcionais, dependências, riscos de dupla contagem e pendências são próprios de cada módulo.

### 11.1 Folha de Benefícios (`FOLHA/`)

> Categoria: **Contar individualmente** · Onda 2 (revisão) · Aba: `docs1/pontos-de-funcao/folha.html` (existe — revisão)

```text
Você é analista sênior de métricas de software. REVISAR e ATUALIZAR a contagem SFP já existente de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Folha de Benefícios — código FOLHA. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): FOLHA/Fontes/Folha.dpr.
- Evidência de aplicação própria: Folha.dpr (título "Folha de Benefícios"); em 3-Sistemas.bpg e Previdenciario.bpg.
- Áreas funcionais (legendas do menu de FOLHA/Fontes/FPrincipal.pas ou fonte indicada): Use os 12 casos de uso UC101–UC112 de docs1/folha/funcionalidades.html como fonte primária (preparo, prévia, efetivação/estorno, pagamento CNAB/SIACC, apropriação contábil, IRRF / pensão, conciliação INSS, convênios, retroativos, falecimento, adiantamento extra folha, abatimento de reservas).
  As áreas são pista para localizar processos; não as copie como lista de PE.
- Já existe a análise docs1/pontos-de-funcao/folha.html (PFC-48). Leia a página inteira antes de mudar algo.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: FOLHA/
- Entry point(s): FOLHA/Fontes/Folha.dpr
- Menu principal: FOLHA/Fontes/FPrincipal.pas
- Subpastas e componentes: FOLHA/CtrlObjects/, FOLHA/DBObjects/, FOLHA/Fontes/, FOLHA/FontesMT/, FOLHA/CMFbComum50/, FOLHA/CMFbObj50/, FOLHA/CMFolhaObjMt/
- Configuração de pacotes: FOLHA/Fontes/Folha.dof
- Documentação funcional disponível (fonte primária): docs1/folha/funcionalidades.html, docs1/folha/dados.html, docs1/folha/integracoes.html, docs1/folha/relatorios.html, docs1/folha/uc101.html, Analise_Blueprint_Folha.md
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Os pacotes FOLHA/CMFbComum50 (CMFBCOMUM50), FOLHA/CMFbObj50 (CMFBOBJ50) e FOLHA/CMFolhaObjMt (CMFolhaObjMT) ficam na pasta FOLHA, mas são declarados por outras aplicações (REGRA, GLOBALCM, COMPRAS2000, IRRF, CENTRALAP, AUTOATENDIMENTO, FUNCEF...). Conte em FOLHA somente as funções que o usuário da Folha de Benefícios reconhece; o que é infraestrutura comum não vira PE.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMRegra50MT (CM/RegraMT/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMFBOBJ50 (FOLHA/CMFbObj50/); CMIRRFobj50 (CMIRRFOBJ50/); CmGlobalObj50 (CMGLOBALOBJ50/); CMTotalPrev50 (CM/TotalPrev/); CMIntBancoMT50 (CMINTBANCOMT50/); CMPrevMT50 (CM/CMPrevMT50/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/); CmAdmPrev (CM/CMADMPREV/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMIRRFOBJ50, CMGLOBALOBJ50, CMINTBANCOMT50; dados de CONTRIBUICAOPREV e BENEFICIOPREV.
- Riscos de dupla contagem específicos deste módulo:
  * BENEFBFCIARIO e PROCESSOBENEF mantidos por FOLHA e BENEFICIOPREV — hoje contados nos dois (14 SFP em risco). A metodologia já recomenda que BENEFICIOPREV seja o dono de PROCESSOBENEF.
  * HSTCONTRIBPREV (dono CONTRIBUICAOPREV), PESSOA/PARTICIPANTE (CADASTROPREV / GLOBALCM), PLANPREV (PARAMPREV), BANCO (GLOBALCM), tabelas de IR (IRRF): manter como AL referenciado e indicar o dono.
  * MODFOL (RH — Folha de Pagamento) referencia a pasta FOLHA no search path, mas é outra aplicação (folha de empregados). Não junte as duas.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Atualize docs1/pontos-de-funcao/folha.html (página existente). Mantenha o histórico: registre o que mudou e por quê na seção 8 ou numa nota da seção 2.
- Insira o link "Folha de Benefícios" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 1
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Fundir ou justificar PE-08 "Conciliar e reembolsar INSS" e PE-15 "Reembolso INSS" (mesmo UC105/JF010 e mesmas regras).
- Revisar se PE-22, PE-23 e PE-25 (lookups de benefício, rubrica e conta) são processos elementares reconhecidos pelo usuário ou listas de seleção de apoio a outro PE.
- Corrigir a fonte de PE-06 "Importar convênios" (cita FExportaTxT, nome de exportação).
- Separar subtotal confirmado (COMPROVADO) de subtotal preliminar (INFERIDO/PENDENTE) — hoje AL-16 a AL-23 entram no total de 276 SFP sem distinção.
- Dar fonte às colunas "—" de PE-07, PE-08, PE-10, PE-11, PE-15, PE-17 e PE-21 (seção 3) e ligar PE-19/PE-20 a caso de uso (seção 6).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/folha.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.2 Contribuição Previdenciária (`CONTRIBUICAOPREV/`)

> Categoria: **Contar individualmente** · Onda 2 (revisão) · Aba: `docs1/pontos-de-funcao/contribuicao.html` (existe — revisão)

```text
Você é analista sênior de métricas de software. REVISAR e ATUALIZAR a contagem SFP já existente de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Contribuição Previdenciária — código CONTRIBUICAOPREV. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr.
- Evidência de aplicação própria: ContribuicaoPREV.dpr (título "Manutenção e Cobrança de Contribuição"); em 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de CONTRIBUICAOPREV/Fontes/FPrincipal.pas ou fonte indicada): Use os 9 casos de uso UC201–UC209 de docs1/contribuicao/funcionalidades.html (cobrança e recebimento por canais, reservas, bitributação/IR regressivo, portabilidade, benefício saldado/FAB, provisão para perdas).
  As áreas são pista para localizar processos; não as copie como lista de PE.
- Já existe a análise docs1/pontos-de-funcao/contribuicao.html (PFC-48). Leia a página inteira antes de mudar algo.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CONTRIBUICAOPREV/
- Entry point(s): CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr
- Menu principal: CONTRIBUICAOPREV/Fontes/FPrincipal.pas
- Subpastas e componentes: CONTRIBUICAOPREV/CtrlObjects/, CONTRIBUICAOPREV/DBObjects/, CONTRIBUICAOPREV/Fontes/, CONTRIBUICAOPREV/Relatorios/
- Configuração de pacotes: CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dof
- Documentação funcional disponível (fonte primária): docs1/contribuicao/funcionalidades.html, docs1/contribuicao/dados.html, docs1/contribuicao/integracoes.html, docs1/contribuicao/relatorios.html, Analise_Blueprint_Contribuicao_Folha.md
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. CM/CMADMPREV (UContribuicaoPrev.pas, UMovReserva.pas) implementa grande parte das telas abertas pelo menu de CONTRIBUICAOPREV: conte a função no módulo cujo menu a expõe ao usuário, sem contar o pacote à parte.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CmCapCarUtilObj50 (CMCAPCARUTILOBJ50/); CMPrevMT50 (CM/CMPrevMT50/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMAdmPrev (CM/CMADMPREV/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, FOLHA/CMFbComum50, CMCAPCARUTILOBJ50, EMPRESTIMOBPL/Integra, CMWebComum50.
- Riscos de dupla contagem específicos deste módulo:
  * HSTCONTRIBPREV: CONTRIBUICAOPREV é o dono; FOLHA e BENEFICIOPREV só referenciam.
  * HISTRUBSAL e TMPDESC (dono FOLHA): manter como AL referenciado.
  * O pacote EMPRESTIMOBPL/Integra (CMIntegraEP50) é declarado no .dof: se houver desconto de prestação de empréstimo, o dado é de EMPRESTIMO (referenciado).
  * INTERFACEPREV (lay-outs de envio/recebimento de patrocinadora, rubricas financeiras) pode alimentar contribuições: confirme quem mantém os arquivos de interface.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Atualize docs1/pontos-de-funcao/contribuicao.html (página existente). Mantenha o histórico: registre o que mudou e por quê na seção 8 ou numa nota da seção 2.
- Insira o link "Contribuição Previdenciária" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 2
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Confirmar o AL FAIXASPROVISAOPERDACONTRIB (+7 SFP se confirmado — pendência já registrada na análise atual).
- Separar subtotal confirmado de preliminar, como recomendado para Folha.
- Conferir se os 19 PE cobrem as telas do menu CONTRIBUICAOPREV/Fontes/FPrincipal.pas que abrem formulários de CM/CMADMPREV e não estão em UC201–UC209.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/contribuicao.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.3 Benefício Previdenciário (`BENEFICIOPREV/`)

> Categoria: **Contar individualmente** · Onda 2 (revisão) · Aba: `docs1/pontos-de-funcao/beneficioprev.html` (existe — revisão)

```text
Você é analista sênior de métricas de software. REVISAR e ATUALIZAR a contagem SFP já existente de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Benefício Previdenciário — código BENEFICIOPREV. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): BENEFICIOPREV/Fontes/BeneficioPrev.dpr.
- Evidência de aplicação própria: BeneficioPrev.dpr (título "Concessão e Manut de Benefícios Previdenciários"); em 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de BENEFICIOPREV/Fontes/FPrincipal.pas ou fonte indicada): Use os 10 casos de uso UC301–UC310 de docs1/beneficioprev/funcionalidades.html (concessão, manutenção, desfazimento, reajustes, eventos geradores, conciliação INSS, desdobramento, controle de dívidas).
  As áreas são pista para localizar processos; não as copie como lista de PE.
- Já existe a análise docs1/pontos-de-funcao/beneficioprev.html (PFC-48). Leia a página inteira antes de mudar algo.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: BENEFICIOPREV/
- Entry point(s): BENEFICIOPREV/Fontes/BeneficioPrev.dpr
- Menu principal: BENEFICIOPREV/Fontes/FPrincipal.pas
- Subpastas e componentes: BENEFICIOPREV/CtrlObjects/, BENEFICIOPREV/DBObjects/, BENEFICIOPREV/Fontes/, BENEFICIOPREV/Relatorios/
- Configuração de pacotes: BENEFICIOPREV/Fontes/BeneficioPrev.dof
- Documentação funcional disponível (fonte primária): docs1/beneficioprev/funcionalidades.html, docs1/beneficioprev/dados.html, docs1/beneficioprev/integracoes.html, docs1/beneficioprev/relatorios.html, Analise_Blueprint_BeneficioPrev_Folha.md, Analise_Blueprint_Beneficioprev_Folha.md
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. O menu abre formulários de CM/CMADMPREV (por exemplo TfrmRetroativoPrev, FCadRequerBenefParticip.pas): conte a função em BENEFICIOPREV quando é este o menu que a expõe.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMAdmprev (CM/CMADMPREV/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMCapCarObj50 (CMCAPCAROBJ50/); CMContabObj50 (CMCONTABOBJ50/); CMPrevMT50 (CM/CMPrevMT50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMCAPCAROBJ50, CMCONTABOBJ50, EMPRESTIMOBPL/Integra; dados de FOLHA.
- Riscos de dupla contagem específicos deste módulo:
  * BENEFBFCIARIO e PROCESSOBENEF: decidir com FOLHA quem é o dono (hoje 14 SFP em risco). Se BENEFICIOPREV ficar com PROCESSOBENEF, FOLHA passa a referenciá-lo.
  * PREVIA: BENEFICIOPREV faz DELETE no desfazimento, mas o dono é FOLHA. Manter como referenciado.
  * Eventos gerados em CADASTROPREV (aposentadoria, falecimento, invalidez) e regras de reajuste em PARAMPREV: identificar dono de EVENTOGERADOR e das regras de reajuste.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Atualize docs1/pontos-de-funcao/beneficioprev.html (página existente). Mantenha o histórico: registre o que mudou e por quê na seção 8 ou numa nota da seção 2.
- Insira o link "Benefício Previdenciário" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 3
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Resolver as 9 pendências registradas em docs1/pontos-de-funcao/beneficioprev.html (seção 8).
- Separar subtotal confirmado de preliminar.
- Validar a fronteira com CADASTROPREV: o menu de CADASTROPREV também registra eventos de benefício (Tempo de Contribuição, Invalidez, Falecimento).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/beneficioprev.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.4 Cadastro Previdenciário (`CADASTROPREV/`)

> Categoria: **Contar individualmente** · Onda 1 · Aba: `docs1/pontos-de-funcao/cadastroprev.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Cadastro Previdenciário — código CADASTROPREV. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CADASTROPREV/Fontes/CadastroPrev.dpr.
- Evidência de aplicação própria: CadastroPrev.dpr; menu de eventos cadastrais (inscrição, transferências, desligamentos).
- Áreas funcionais (legendas do menu de CADASTROPREV/Fontes/FPrincipal.pas ou fonte indicada): Eventos (Benefícios: Tempo de Contribuição, Idade, Invalidez, Falecimento, Aposentadoria INSS); Cadastrais (Inscrição, Reinscrição, Manutenção Parcial, Retorno de Mantido para Ativo); Transferências (de Reserva, de Plano, de Patrocinadora); Afastamentos; Demissões; Cancelamentos; Requerimento de Benefícios do INSS em Lote; Cálculo de tempo de serviço em lote; Cartas de Recadastramento.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CADASTROPREV/
- Entry point(s): CADASTROPREV/Fontes/CadastroPrev.dpr
- Menu principal: CADASTROPREV/Fontes/FPrincipal.pas
- Subpastas e componentes: CADASTROPREV/CtrlObjects/, CADASTROPREV/DBObjects/, CADASTROPREV/Fontes/, CADASTROPREV/Relatorios/
- Configuração de pacotes: CADASTROPREV/Fontes/CadastroPrev.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/cadastro-prev/index.html, UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. CM/CMADMPREV e CM/CMPrevMT50 são avaliados na fronteira.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMAdmprev (CM/CMADMPREV/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMCapCarObj50 (CMCAPCAROBJ50/); CMContabObj50 (CMCONTABOBJ50/); CMPrevMT50 (CM/CMPrevMT50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, GLOBALCM, EMPRESTIMOBPL/Integra.
- Riscos de dupla contagem específicos deste módulo:
  * PESSOA e PARTICIPANTE: as análises de FOLHA tratam como "mantido por CADASTROPREV / externo". Confirmar se CADASTROPREV é o dono (AL contado aqui) ou se PESSOA pertence a GLOBALCM.
  * Eventos de benefício: o mesmo evento pode aparecer em BENEFICIOPREV (concessão). Contar o registro do evento só no módulo que o mantém.
  * Transferência de plano e migração também aparecem em SIMULADORFCRT (classificado "Requer validação").
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/cadastroprev.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Cadastro Previdenciário" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 4
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Confirmar se o PDF UC097_...pdf na raiz é caso de uso de CADASTROPREV (elegibilidade/adesão) e usá-lo como fonte, se for.
- Distinguir eventos que só registram dados de eventos que calculam (tempo de serviço em lote).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/cadastroprev.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.5 Parametrização Previdenciária (`PARAMPREV/`)

> Categoria: **Contar individualmente** · Onda 1 · Aba: `docs1/pontos-de-funcao/paramprev.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Parametrização Previdenciária — código PARAMPREV. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): PARAMPREV/Fontes/ParamPrev.dpr.
- Evidência de aplicação própria: ParamPrev.dpr; menu de planos, contribuições, benefícios, reservas, reajustes.
- Áreas funcionais (legendas do menu de PARAMPREV/Fontes/FPrincipal.pas ou fonte indicada): Fundação; Contribuição (tipos, associação benefício × contribuição, contribuição por evento gerador); Benefício (planos, grupos, perfil de investimento, DE-PARA); Reserva (por plano, contribuição, benefício, padrão de movimentação); Patrocinadora (filial, plano por patrocinadora, órgãos e setores); Dotação Inicial (parametrização, geração, importação); Parâmetros do 13º; Reajustes (benefício, INSS, salarial); Plano de Cargos e Salários.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: PARAMPREV/
- Entry point(s): PARAMPREV/Fontes/ParamPrev.dpr
- Menu principal: PARAMPREV/Fontes/FPrincipal.pas
- Subpastas e componentes: PARAMPREV/CtrlObjects/, PARAMPREV/DBObjects/, PARAMPREV/Fontes/, PARAMPREV/FontesMT/, PARAMPREV/Relatorios/
- Configuração de pacotes: PARAMPREV/Fontes/ParamPrev.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/param-prev/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMAdmprev (CM/CMADMPREV/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMCapCarObj50 (CMCAPCAROBJ50/); CMContabObj50 (CMCONTABOBJ50/); CMPrevMT50 (CM/CMPrevMT50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, CM/CMPrevMT50, CM/TotalPrev, CMCONTABOBJ50, CMCAPCAROBJ50, EMPRESTIMOBPL/Integra.
- Riscos de dupla contagem específicos deste módulo:
  * PLANPREV: as análises de FOLHA e BENEFICIOPREV indicam "mantido por PARAMPREV / externo". Confirmar o dono e contar o AL só aqui.
  * PATRO (patrocinadora) também aparece no menu de GLOBALCM ("Patrocinadora", "Plano Previdenciário", "Plano Previdenciário X Patrocinadora"). Escolher um único dono.
  * O menu inclui "Plano de Cargos e Salários" (PCS): não confundir com MODCES (RH — Cargos e Salários).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/paramprev.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Parametrização Previdenciária" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 5
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Decidir com GLOBALCM o dono de patrocinadora e plano previdenciário (P-14).
- Confirmar se "Geração de Dotação Inicial" é processo elementar próprio ou parte da parametrização.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/paramprev.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.6 Interface com Instituições Previdenciárias (`INTERFACEPREV/`)

> Categoria: **Contar individualmente** · Onda 2 · Aba: `docs1/pontos-de-funcao/interfaceprev.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Interface com Instituições Previdenciárias — código INTERFACEPREV. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): INTERFACEPREV/Fontes/InterfacePrev.dpr.
- Evidência de aplicação própria: InterfacePrev.dpr; menu "Interface com Instituições Previdenciárias" (lay-outs, envio/recebimento patrocinadora, SPC).
- Áreas funcionais (legendas do menu de INTERFACEPREV/Fontes/FPrincipal.pas ou fonte indicada): Geração de Arquivos SERPROS; Patrocinadora (Cadastro de Lay-Out, Lay-Out de Envio/Recebimento, Separação de Arquivos, Envio para e Recebimento da Patrocinadora, Rubricas Financeiras, Dados Cadastrais, Consultas de Verificação do Arquivo Financeiro); SPC (Gerar Arquivo para SPC, Registro de operações, Cobranças/Pagamentos); Controle de Interface; Histórico de Salários Participação; Rubricas da Patrocinadora; Parâmetros de Envio por Contribuição.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: INTERFACEPREV/
- Entry point(s): INTERFACEPREV/Fontes/InterfacePrev.dpr
- Menu principal: INTERFACEPREV/Fontes/FPrincipal.pas
- Subpastas e componentes: INTERFACEPREV/CtrlObjetos/, INTERFACEPREV/DbObjetos/, INTERFACEPREV/Fontes/, INTERFACEPREV/FontesMT/
- Configuração de pacotes: INTERFACEPREV/Fontes/InterfacePrev.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMRegra50MT (CM/RegraMT/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/TotalPrev, FOLHA/CMFbComum50; dados de CONTRIBUICAOPREV (rubricas, salários).
- Riscos de dupla contagem específicos deste módulo:
  * Rubricas e salários recebidos da patrocinadora alimentam CONTRIBUICAOPREV: confirmar quem mantém histórico de salários e rubricas da patrocinadora.
  * CTRLINTERFACE está contado como AL mantido em FOLHA (AL-12). Se "Controle de Interface" de INTERFACEPREV mantiver o mesmo grupo de dados, decidir o dono.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/interfaceprev.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Interface com Instituições Previdenciárias" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 6
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Sem documentação funcional: usar o código como fonte principal e marcar INFERIDO o que não tiver confirmação.
- Verificar se "Visualizador de Arquivos Texto" é função de negócio ou utilitário técnico (utilitário não conta).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/interfaceprev.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.7 Projeto Atuarial (Cálculo Atuarial) (`PROJETOATUARIAL/`)

> Categoria: **Contar individualmente** · Onda 2 · Aba: `docs1/pontos-de-funcao/projetoatuarial.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Projeto Atuarial (Cálculo Atuarial) — código PROJETOATUARIAL. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): PROJETOATUARIAL/FONTES/ProjetoAtuarial.dpr.
- Evidência de aplicação própria: ProjetoAtuarial.dpr; menu "Cálculo Atuarial" (tábuas biométricas, versões, fórmulas).
- Áreas funcionais (legendas do menu de PROJETOATUARIAL/FONTES/FPrincipal.pas ou fonte indicada): Importa Tabelas Biométricas; Txt de Aferições; Versões (inclui, seleciona, importa da versão anterior, compara, associa a processo); Importar/Exportar e Lay-out de arquivo; Importar TOTALPREV; Participante e Grupo de Participante; Crítica de Participante; tabelas de domínio (Entidade, Patrocinadora, Plano, Situações, Estado Civil, Grau de Dependência, Tipos de Benefício/Tábua/Tempo/Valor); Tabelas Biométricas e de Comutação; Cálculo da Tábua de Serviço; Regras de Ajuste; Fórmulas.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: PROJETOATUARIAL/
- Entry point(s): PROJETOATUARIAL/FONTES/ProjetoAtuarial.dpr
- Menu principal: PROJETOATUARIAL/FONTES/FPrincipal.pas
- Subpastas e componentes: PROJETOATUARIAL/FONTES/
- Configuração de pacotes: PROJETOATUARIAL/FONTES/ProjetoAtuarial.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. Toda a pasta está em PROJETOATUARIAL/FONTES/ (sem CtrlObjects/DbObjects separados).
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CmGlobalObj50 (CMGLOBALOBJ50/); CMIRRFobj50 (CMIRRFOBJ50/); CmRelatorioObj50 (CMRELATORIOOBJ50/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMFBOBJ50 (FOLHA/CMFbObj50/); CMAutoAtendimentoObj50 (AUTOATENDIMENTO/CMAutoAtendimentoObj50/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CmRegra50MT (CM/RegraMT/); CMCfinanObj50 (CMCFINANOBJ50/); CMRegra50 (CM/Regra/); CMAlmoxCompraObj50 (CMALMOXCOMPRAOBJ50/); CMTotalPrev50 (CM/TotalPrev/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMGLOBALOBJ50, FOLHA/CMFbObj50, CMIRRFOBJ50, CMRELATORIOOBJ50, AUTOATENDIMENTO/CMAutoAtendimentoObj50, CM/TotalPrev.
- Riscos de dupla contagem específicos deste módulo:
  * "Importar TOTALPREV" e "Participante" copiam dados de participantes de CADASTROPREV / CONTRIBUICAOPREV para a base atuarial. Confirmar se a cópia é um grupo de dados próprio (AL mantido aqui) ou leitura do dado de origem (AL referenciado).
  * EXPORTFCRT também exporta "Arquivos para Avaliação Atuarial": não contar a mesma exportação nos dois.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/projetoatuarial.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Projeto Atuarial (Cálculo Atuarial)" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 7
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Separar tabelas de domínio simples (se forem só código/descrição, verificar se são grupo lógico reconhecido pelo usuário) de dados atuariais.
- Confirmar se "Fórmulas" e "Regras de Ajuste" usam o motor CM/Regra (avaliado na fronteira) ou têm dados próprios.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/projetoatuarial.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.8 Administração Assistencial (`ASSISTENCIAL/`)

> Categoria: **Contar individualmente** · Onda 2 · Aba: `docs1/pontos-de-funcao/assistencial.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Administração Assistencial — código ASSISTENCIAL. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): ASSISTENCIAL/Fontes/assistencial.dpr.
- Evidência de aplicação própria: assistencial.dpr (título "Administração Assistencial"); planos, participantes, contribuições assistenciais.
- Áreas funcionais (legendas do menu de ASSISTENCIAL/Fontes/FPrincipal.pas ou fonte indicada): Produto; Plano; Contribuições e Alteradores por Contribuição; Participantes (incluir/alterar, cancelar, dependentes, grupo familiar, consulta geral); Controle de Sinistros; Capitais e associação plano × tabela de capitais; Integração Financeira/Contábil e Previdenciária; Rubricas; Calendário Contribuição/Pagamento; Exportação/Importação por lay-out; Contribuições (Preparo normal/manual, Aplicar Diferença, Envio, Desfazer Envio, Recebimento); Modifica Arquivo Remessa; Migração de Plano.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: ASSISTENCIAL/
- Entry point(s): ASSISTENCIAL/Fontes/assistencial.dpr
- Menu principal: ASSISTENCIAL/Fontes/FPrincipal.pas
- Subpastas e componentes: ASSISTENCIAL/CtrlObjects/, ASSISTENCIAL/DbObjects/, ASSISTENCIAL/Fontes/, ASSISTENCIAL/FontesMT/, ASSISTENCIAL/Reports/
- Configuração de pacotes: ASSISTENCIAL/Fontes/assistencial.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMRegra50MT (CM/RegraMT/); CMCapCarObj50 (CMCAPCAROBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/TotalPrev, FOLHA/CMFbComum50, CMCAPCAROBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * A integração "Previdenciário" e as rubricas podem gerar descontos na Folha de Benefícios (TMPDESC, dono FOLHA): manter como referenciado.
  * REFER tem "Recebimento Assistencial" (classificado "Requer validação"): se REFER for absorvido, essa função pode ser duplicata de "Recebimento de Contribuição".
  * CENTRALAP oferece consultas assistenciais (inscrição, estimativa de contribuições, beneficiários): contar as consultas no módulo que é dono do dado só se forem PE distintos para o usuário.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/assistencial.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Administração Assistencial" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 8
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Sem documentação funcional: usar o código como fonte principal.
- Confirmar se "Modifica Arquivo Remessa" e "Migração de Plano" são funções de negócio ou acertos técnicos pontuais.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/assistencial.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.9 Empréstimo (`EMPRESTIMO/`)

> Categoria: **Contar individualmente** · Onda 2 · Aba: `docs1/pontos-de-funcao/emprestimo.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Empréstimo — código EMPRESTIMO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): EMPRESTIMO/Fontes/emprestimo.dpr.
- Evidência de aplicação própria: emprestimo.dpr; em 3-Sistemas.bpg; pacotes CMObjetosEP50/CMExecEP50/CMIntegraEP50.
- Áreas funcionais (legendas do menu de EMPRESTIMO/Fontes/FPrincipal.pas ou fonte indicada): Concessão (inclui "Concessão REFER"); Resgate de Reserva e Cancela Resgate; Quitação Morte; Importação de Arquivo de Suspensões e de Crítica; SIAFI (importar/gravar); Margens de 13º; Lançamento de Prestações Atualizadas; Rubrica Informativa de Valor Máximo Permitido; Manutenção do Arquivo Contratoad; Importação de IR de Financiamento Habitacional; Alteração em lote do vencimento; SICOV; Informe de IR.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: EMPRESTIMO/
- Entry point(s): EMPRESTIMO/Fontes/emprestimo.dpr
- Menu principal: EMPRESTIMO/Fontes/FPrincipal.pas
- Subpastas e componentes: EMPRESTIMO/Fontes/, EMPRESTIMOBPL/Objetos/, EMPRESTIMOBPL/Interface/, EMPRESTIMOBPL/Integra/
- Configuração de pacotes: EMPRESTIMO/Fontes/emprestimo.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/emprestimo/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: EMPRESTIMOBPL/ (pacotes CMObjetosEP50, CMExecEP50 e CMIntegraEP50), que não tem executável próprio. CMIntegraEP50 também é declarado por CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV e CENTRALAP: lá, o dado de empréstimo é referenciado.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMObjetosEP50 (EMPRESTIMOBPL/Objetos/); CmRegra50MT (CM/RegraMT/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMExecEP50 (EMPRESTIMOBPL/Interface/); CMIntBancoMT50 (CMINTBANCOMT50/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMIRRFobj50 (CMIRRFOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): EMPRESTIMOBPL (junto), CENTRALAP, FOLHA (search path), CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMIRRFOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * O .dof e o search path apontam para FOLHA e CENTRALAP: desconto de prestação na Folha de Benefícios (TMPDESC, dono FOLHA) é AL referenciado.
  * FUNCEF.WebEmprestimo (.NET) e AUTOATENDIMENTO/AutoEmprestimo atuam sobre o mesmo domínio: não contar aqui as funções desses canais (pendências P-12 e P-15).
  * FUNCEF tem itens "Empréstimo" e SIAFI; EMPRESTIMO também tem SIAFI. Contar SIAFI de empréstimo só aqui.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/emprestimo.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Empréstimo" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 9
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/contagem-linha-emprestimo.md conta linhas de código, não funções: não usar como base de SFP.
- Verificar se "Concessão REFER" é variante de concessão (mesmo PE) ou processo próprio de cliente.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/emprestimo.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.10 Central de Atendimento ao Público (`CENTRALAP/`)

> Categoria: **Contar individualmente** · Onda 3 · Aba: `docs1/pontos-de-funcao/centralap.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Central de Atendimento ao Público — código CENTRALAP. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CENTRALAP/Fontes/CentralAP.dpr.
- Evidência de aplicação própria: CentralAP.dpr (título "Central de Atendimento ao Público"); atendimento, protocolo, RUBS, consultas.
- Áreas funcionais (legendas do menu de CENTRALAP/Fontes/FPrincipal.pas ou fonte indicada): Atender/Atendimento; R.U.B.S. (configuração do modelo); Carta/Aviso (manutenção, configuração, emissão); Recadastramento; Protocolo; Recebimento de Documentos; Total Prev; Previdenciário (inscrição, simulação de benefícios, consultas de contribuições, benefícios, histórico de reservas, extrato); Assistencial (inscrição, estimativa, consultas, estatística); Benefícios (consulta, rubricas, contracheque); Empréstimo (contrato, simulação de parcelas, estatística, participantes em débito); Forma de Atendimento.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CENTRALAP/
- Entry point(s): CENTRALAP/Fontes/CentralAP.dpr
- Menu principal: CENTRALAP/Fontes/FPrincipal.pas
- Subpastas e componentes: CENTRALAP/Fontes/, CENTRALAP/FontesComuns/, CENTRALAP/AllForms/
- Configuração de pacotes: CENTRALAP/Fontes/CentralAP.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/central-ap/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmRegra50MT (CM/RegraMT/); CmRelatorioObj50 (CMRELATORIOOBJ50/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/); CmBack50 (CMBACK/); CMAdmPrev (CM/CMADMPREV/); CmGlobalObj50 (CMGLOBALOBJ50/); CMIRRFobj50 (CMIRRFOBJ50/); CMIntegraEP50 (EMPRESTIMOBPL/Integra/); CMObjetosEP50 (EMPRESTIMOBPL/Objetos/); CMExecEP50 (EMPRESTIMOBPL/Interface/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CmAgendamentoObj50 (CMAGENDAMENTOOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/CMADMPREV, EMPRESTIMOBPL, CMAGENDAMENTOOBJ50, CMRELATORIOOBJ50, FOLHA/CMFolhaObjMt, CMIRRFOBJ50, CMWebComum50.
- Riscos de dupla contagem específicos deste módulo:
  * A maior parte das consultas (contribuições, benefícios, reservas, empréstimo, contracheque) repete funções de CONTRIBUICAOPREV, BENEFICIOPREV, FOLHA, ASSISTENCIAL e EMPRESTIMO. Conte aqui só os PE com resultado distinto para o usuário de atendimento e marque cada caso com o módulo de origem.
  * Todos os dados previdenciários, assistenciais e de empréstimo são AL referenciados (donos em outros módulos). Os AL mantidos aqui tendem a ser atendimento, protocolo, RUBS e cartas.
  * Agendamento de atendimento é do módulo AGENDAMENTO (CmAgendamentoObj50).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/centralap.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Central de Atendimento ao Público" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 10
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html descreve CENTRALAP como "contas a pagar / AP", mas o título do programa é "Central de Atendimento ao Público". Registrar a correção na aba.
- Confirmar o significado de "R.U.B.S." no negócio antes de nomear os PE.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/centralap.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.11 Autoatendimento (web + gerência + autoempréstimo) (`AUTOATENDIMENTO/`)

> Categoria: **Contar individualmente** · Onda 3 · Aba: `docs1/pontos-de-funcao/autoatendimento.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Autoatendimento (web + gerência + autoempréstimo) — código AUTOATENDIMENTO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dpr; AUTOATENDIMENTO/GerenciaAA/Fontes/GerenciaAA.dpr; AUTOATENDIMENTO/AutoEmprestimo/Fontes/AutoEmprestimo.dpr.
- Evidência de aplicação própria: 3 programas: AutoAtendimento.dpr (CGI WebBroker), GerenciaAA.dpr, AutoEmprestimo.dpr.
- Áreas funcionais (legendas do menu de AUTOATENDIMENTO/Aplicacao/Fontes/DPrincipal.pas ou fonte indicada): Portal web (CGI WebBroker, units uWeb*.pas de AutoAtendimento.dpr): dados cadastrais, tempo de serviço, contribuições, reserva, eventos previdenciários, quadro salarial, contracheque, histórico de benefício, consignação, endereços, telefones, dependentes, senha, relatório dinâmico, simulação/inscrição de empréstimo, transferência de plano, benefício, informe de rendimentos, extrato de reserva. GerenciaAA (AUTOATENDIMENTO/GerenciaAA/Fontes/FPrincipal.pas): páginas e campos, parâmetros, simulação de benefícios, informe de rendimentos, senhas, exportação/importação de dados, sincronização.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: AUTOATENDIMENTO/
- Entry point(s): AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dpr, AUTOATENDIMENTO/GerenciaAA/Fontes/GerenciaAA.dpr, AUTOATENDIMENTO/AutoEmprestimo/Fontes/AutoEmprestimo.dpr
- Menu principal: AUTOATENDIMENTO/Aplicacao/Fontes/DPrincipal.pas
- Subpastas e componentes: AUTOATENDIMENTO/Aplicacao/Fontes/, AUTOATENDIMENTO/GerenciaAA/, AUTOATENDIMENTO/AutoEmprestimo/, AUTOATENDIMENTO/CMAutoAtendimentoObj50/, AUTOATENDIMENTO/CMWebComum50/
- Configuração de pacotes: AUTOATENDIMENTO/Aplicacao/Fontes/AutoAtendimento.dof, AUTOATENDIMENTO/GerenciaAA/Fontes/GerenciaAA.dof, AUTOATENDIMENTO/AutoEmprestimo/Fontes/AutoEmprestimo.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: AUTOATENDIMENTO/CMAutoAtendimentoObj50 e AUTOATENDIMENTO/CMWebComum50. Atenção: CMWebComum50 também é declarado por CONTRIBUICAOPREV, BENEFICIOPREV, CADASTROPREV, PARAMPREV, CENTRALAP e AGENDAMENTO, e CMAutoAtendimentoObj50 por AGENDAMENTO, PROJETOATUARIAL, IRRF e FUNCEF; nesses módulos ficam na fronteira.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMAutoAtendimentoObj50 (AUTOATENDIMENTO/CMAutoAtendimentoObj50/); CMTotalPrev50 (CM/TotalPrev/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/); CMAdmPrev (CM/CMADMPREV/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CmGlobalObj50 (CMGLOBALOBJ50/); CMIRRFobj50 (CMIRRFOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): AUTOATENDIMENTO/CMAutoAtendimentoObj50 e CMWebComum50 (junto), CM/CMADMPREV, FOLHA/CMFolhaObjMt, CMIRRFOBJ50, CMGLOBALOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Quase todas as consultas web repetem dados de CADASTROPREV, CONTRIBUICAOPREV, BENEFICIOPREV, FOLHA e EMPRESTIMO, que são AL referenciados. Um PE web só conta aqui quando é um processo distinto para o participante (por exemplo, manutenção de endereço feita pelo próprio participante).
  * AutoEmprestimo.dpr (2 units) pode ser canal de EMPRESTIMO: decidir antes (P-15) e registrar.
  * Não confundir com MODAUTO (autoatendimento do empregado, RH).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/autoatendimento.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Autoatendimento (web + gerência + autoempréstimo)" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 11
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Fronteira: confirmar se portal web, GerenciaAA e AutoEmprestimo formam uma única aplicação para o usuário (P-15).
- GerenciaAA tem funções de configuração do portal (páginas, campos, conexão, limpeza): separar parametrização de negócio (conta) de configuração técnica (não conta).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/autoatendimento.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.12 Agendamento de Atendimentos (`AGENDAMENTO/`)

> Categoria: **Contar individualmente** · Onda 3 · Aba: `docs1/pontos-de-funcao/agendamento.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Agendamento de Atendimentos — código AGENDAMENTO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): AGENDAMENTO/Fontes/Agendamento.dpr.
- Evidência de aplicação própria: Agendamento.dpr (título "Agendamento de Atendimentos").
- Áreas funcionais (legendas do menu de AGENDAMENTO/Fontes/FPrincipal.pas ou fonte indicada): Assunto para Agendamento; Atendente; Grupo de Atendentes; Período de Agendamento; Ausência de Atendente; Agenda; Agendamento; Calendário.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: AGENDAMENTO/
- Entry point(s): AGENDAMENTO/Fontes/Agendamento.dpr
- Menu principal: AGENDAMENTO/Fontes/FPrincipal.pas
- Subpastas e componentes: AGENDAMENTO/Fontes/, CMAGENDAMENTOOBJ50/CtrlObjects/, CMAGENDAMENTOOBJ50/DbObjects/, CMAGENDAMENTOOBJ50/Fontes/
- Configuração de pacotes: AGENDAMENTO/Fontes/Agendamento.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Os dados ficam no pacote CMAGENDAMENTOOBJ50 (serviço compartilhado também declarado por CENTRALAP e FUNCEF). AGENDAMENTO é o dono funcional: os AL de agenda contam aqui e são referenciados em CENTRALAP.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50MT (CM/RegraMT/); CMAutoAtendimentoObj50 (AUTOATENDIMENTO/CMAutoAtendimentoObj50/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CmAgendamentoObj50 (CMAGENDAMENTOOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMAGENDAMENTOOBJ50, AUTOATENDIMENTO/CMAutoAtendimentoObj50, CMWebComum50.
- Riscos de dupla contagem específicos deste módulo:
  * CENTRALAP declara CmAgendamentoObj50: se CENTRALAP também marcar atendimento, contar o PE só onde o usuário o executa e o AL só aqui.
  * O portal web (CMWebComum50, CMAutoAtendimentoObj50) pode oferecer agendamento: verificar e não contar duas vezes.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/agendamento.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Agendamento de Atendimentos" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 12
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Módulo pequeno (14 units próprias): confirmar com o negócio se é aplicação própria ou função de CENTRALAP. A evidência atual (executável e título próprios) indica aplicação própria.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/agendamento.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.13 Contabilidade (`CONTAB/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/contab.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Contabilidade — código CONTAB. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CONTAB/Fontes/Contab.dpr.
- Evidência de aplicação própria: Contab.dpr; em 3-Sistemas.bpg; POC de migração em poc-contabil/.
- Áreas funcionais (legendas do menu de CONTAB/Fontes/FPrincipal.pas ou fonte indicada): Importações (Lançamentos, EXCEL, Folha RM, Folha Dinâmica, SRH Plus, Valores Orçados, Plano de Contas, Saldo Anterior, Fidélio, SAF); Exportações (Exportação Contábil e exclusão); Planilhas (lançamentos, alteração de data, exclusão por faixa, numeração); Atualiza Moeda, saldos e códigos reduzidos; Dias Bloqueados; Cadastro de Eventos. Pelo catálogo: plano de contas, períodos, saldos, demonstrativos, rateios, segregação, encerramentos e exportações regulatórias (SIPC-CAP/SICADI).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CONTAB/
- Entry point(s): CONTAB/Fontes/Contab.dpr
- Menu principal: CONTAB/Fontes/FPrincipal.pas
- Subpastas e componentes: CONTAB/CtrlObjects/, CONTAB/DbObjects/, CONTAB/Fontes/, CONTAB/FontesMT/, CONTAB/Reports/, CMCONTABOBJ50/CtrlObjects/, CMCONTABOBJ50/DbObjects/
- Configuração de pacotes: CONTAB/Fontes/Contab.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/contab/index.html, docs/migration-contabil.html, docs/business-rules-catalog.html, docs/database-model.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMCONTABOBJ50 é declarado por cerca de 15 aplicações. CONTAB é o dono funcional dos dados contábeis (plano de contas, planilhas, saldos): conte os AL aqui e trate-os como referenciados nos demais.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMContabObj50 (CMCONTABOBJ50/); CMPlaneOrcObj50 (CMPLANEORCOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCONTABOBJ50, CMPLANEORCOBJ50; recebe lançamentos de FOLHA, CPAGAR, CRECEBER, CFINAN e outros.
- Riscos de dupla contagem específicos deste módulo:
  * Lançamentos contábeis gerados por FOLHA (PE-12 "Apropriar folha na contabilidade"), CPAGAR, CRECEBER, CFINAN, INVESTIMENTOS etc.: a geração conta no módulo de origem; a importação/recepção conta aqui só se for um processo distinto para o usuário contábil.
  * INTEGRASAF ("Requer validação") e o item de menu "SAF" de CONTAB podem ser a mesma função: decidir com P-07.
  * poc-contabil/ reimplementa o cadastro de contas contábeis (FCadContasContabMT) em .NET: não conte a POC.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/contab.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Contabilidade" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 13
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- A documentação de CONTAB é a mais extensa do portal (docs/site/modules/contab/index.html, ~450 KB): usar as regras e entidades de lá como fonte primária.
- Separar demonstrativos/relatórios com lógica própria (contam como PE) de simples impressões de tela.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/contab.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.14 Contas a Pagar (`CPAGAR/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/cpagar.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Contas a Pagar — código CPAGAR. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CPAGAR/FontesMT/ContasaPagar.dpr.
- Evidência de aplicação própria: ContasaPagar.dpr; em CapCar.bpg e 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de CPAGAR/FontesMT/FPrincipal.pas ou fonte indicada): Históricos Contábeis; Simulação de Cálculos; Variação Monetária/Cambial; Exclusão de Movimentos; Altera Operação de Parcela/Engloba; Dados Bancários; Transferência de Classificação; Acerta Contabilização de Baixas; Importação/Exportação de Lançamentos; Lançamento; Documentos (registra, agrupa/parcela, alteradores, eventos, planilha modelo rateio); Contratos/Previsões; Adiantamentos; Orçamento; Retenção de INSS de Fornecedores; Dados de NFS; Tesouraria (regulariza, estorna/exclui).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CPAGAR/
- Entry point(s): CPAGAR/FontesMT/ContasaPagar.dpr
- Menu principal: CPAGAR/FontesMT/FPrincipal.pas
- Subpastas e componentes: CPAGAR/CtrlObjects/, CPAGAR/DbObjects/, CPAGAR/FontesMT/, CPAGAR/Reports/, CMCAPCAROBJ50/, CMCAPCARUTILOBJ50/
- Configuração de pacotes: CPAGAR/FontesMT/ContasaPagar.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/contas-a-pagar/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Os pacotes CMCAPCAROBJ50 e CMCAPCARUTILOBJ50 (grupo CapCar.bpg) são compartilhados com CRECEBER. Conte em CPAGAR só os documentos a pagar; os grupos de dados comuns a CP e CR (alteradores, históricos) precisam de dono único decidido com o prompt de CRECEBER.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMINTBANCOMT50 (CMINTBANCOMT50/); CmGlobalObj50 (CMGLOBALOBJ50/); CMContabOBJ50 (CMCONTABOBJ50/); CMCapCarObj50 (CMCAPCAROBJ50/); CMCapCarUtilObj50 (CMCAPCARUTILOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMCONTABOBJ50, CMGLOBALOBJ50, IRRF (search path).
- Riscos de dupla contagem específicos deste módulo:
  * CRECEBER tem menu quase simétrico (históricos, alteradores, agrupa/parcela, contratos/previsões, adiantamentos). Dados comuns: um único dono.
  * Retenções de impostos ligam-se a IRRF (o search path aponta para IRRF): DARF, GPS etc. são de IRRF.
  * Títulos gerados por outros módulos (CONTRATO, ADMINIMOB, SISTJURCONS — "Manutenção de Documentos AP") entram como dado referenciado ou PE do módulo de origem.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/cpagar.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Contas a Pagar" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 14
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Decidir com CRECEBER o dono dos dados comuns de CP/CR (P-16).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/cpagar.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.15 Contas a Receber (`CRECEBER/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/creceber.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Contas a Receber — código CRECEBER. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CRECEBER/FontesMT/ContasaReceber.dpr.
- Evidência de aplicação própria: ContasaReceber.dpr; em CapCar.bpg e 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de CRECEBER/FontesMT/FPrincipal.pas ou fonte indicada): Históricos Contábeis; Altera Operação de Parcela/Engloba; Dados Bancários; Transferência de Classificação; Importação/Exportação de Lançamentos; Lançamento; Documentos (agrupa/parcela, alteradores, eventos, taxas para correção); Contratos/Previsões; Adiantamentos; Cobrança (regulariza, estorna/exclui, documentos × cobrança, cobrança bancária, mensagens); Emissão (boletos pré-impressos, arquivos IntBanco, ficha de compensação).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CRECEBER/
- Entry point(s): CRECEBER/FontesMT/ContasaReceber.dpr
- Menu principal: CRECEBER/FontesMT/FPrincipal.pas
- Subpastas e componentes: CRECEBER/CtrlObjects/, CRECEBER/FontesMT/, CRECEBER/Reports/, CMCAPCAROBJ50/, CMCAPCARUTILOBJ50/
- Configuração de pacotes: CRECEBER/FontesMT/ContasaReceber.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/contas-a-receber/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Compartilha CMCAPCAROBJ50 / CMCAPCARUTILOBJ50 com CPAGAR (ver P-16).
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMINTBANCOMT50 (CMINTBANCOMT50/); CmGlobalObj50 (CMGLOBALOBJ50/); CMContabOBJ50 (CMCONTABOBJ50/); CMCapCarObj50 (CMCAPCAROBJ50/); CMCapCarUtilObj50 (CMCAPCARUTILOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, CMCONTABOBJ50, CMGLOBALOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Cobrança bancária usa CMINTBANCOMT50 (serviço compartilhado): lay-outs bancários são avaliados na fronteira.
  * ADMINIMOB e ALIENACAO têm cobrança e boletos próprios: verificar se usam os documentos de CRECEBER (referenciado) ou dados próprios.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/creceber.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Contas a Receber" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 15
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Decidir com CPAGAR o dono dos dados comuns (P-16).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/creceber.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.16 Controle Financeiro (`CFINAN/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/cfinan.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Controle Financeiro — código CFINAN. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CFINAN/Fontes/CFINAN.dpr.
- Evidência de aplicação própria: CFINAN.dpr (título "Controle Financeiro").
- Áreas funcionais (legendas do menu de CFINAN/Fontes/FPrincipal.pas ou fonte indicada): Movimento Financeiro; Transferência entre Contas; Conciliação Bancária; Bloqueios Judiciais; Conciliação de Tarifas Bancárias; Regularização de Lançamentos Não Identificados (exclusivo do financeiro / do CAR ou CAP); Conferência de Documentos Regularizados; Empréstimo Bancário; Disponibilidade Financeira; Consultas (várias versões); Fluxo (previsto, geração a partir do orçamento).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CFINAN/
- Entry point(s): CFINAN/Fontes/CFINAN.dpr
- Menu principal: CFINAN/Fontes/FPrincipal.pas
- Subpastas e componentes: CFINAN/CtrlObjects/, CFINAN/DBObjects/, CFINAN/Fontes/, CFINAN/FontesMT/, CFINAN/Reports/, CMCFINANOBJ50/
- Configuração de pacotes: CFINAN/Fontes/CFINAN.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/cfinan/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMCFINANOBJ50 é compartilhado (COMPRAS2000, IRRF, PROJETOATUARIAL, FUNCEF); CFINAN é o dono funcional. O servidor APPSERVERCFINAN/ está excluído (técnico).
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CmBack50 (CMBACK/); CMGlobalObj50 (CMGLOBALOBJ50/); CMCfinanObj50 (CMCFINANOBJ50/); CMCapCarObj50 (CMCAPCAROBJ50/); CmIntBancoMT50 (CMINTBANCOMT50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCFINANOBJ50, CMCAPCAROBJ50, CMINTBANCOMT50, CMGLOBALOBJ50, CMIMOBILIARIOOBJ50 (search path).
- Riscos de dupla contagem específicos deste módulo:
  * "Regularização do CAR ou CAP" trabalha sobre documentos de CRECEBER / CPAGAR (referenciados).
  * "Geração a partir do Orçamento" lê ORCAMENTO (referenciado).
  * O search path aponta para CMIMOBILIARIOOBJ50: verificar qual função imobiliária é exposta e se ela já conta em ADMINIMOB / INVESTIMOB.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/cfinan.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Controle Financeiro" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 16
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- O menu tem várias "Consulta" (Nova, Operacional, em Stored, Conta Corrente): verificar se são PE distintos ou versões da mesma consulta (contar uma vez).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/cfinan.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.17 Planejamento e Orçamento (`ORCAMENTO/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/orcamento.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Planejamento e Orçamento — código ORCAMENTO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): ORCAMENTO/FontesMT/Orcamento.dpr.
- Evidência de aplicação própria: Orcamento.dpr (título "Planejamento e Orçamento").
- Áreas funcionais (legendas do menu de ORCAMENTO/FontesMT/FPrincipal.pas ou fonte indicada): Entrada de Dados (por período, diária, especial); Execução de Fórmulas de Apuração; Cenários (cadastro, entrada de dados, efetiva, manipula, geração de dados); Processos (compromisso orçamentário, reserva orçamentária, efetivação de reservas, transferência, ajuste, suplementação — cada um com variante "Especial"); Busca de dados contábeis; Importação via Excel e de grupos orçamentários.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: ORCAMENTO/
- Entry point(s): ORCAMENTO/FontesMT/Orcamento.dpr
- Menu principal: ORCAMENTO/FontesMT/FPrincipal.pas
- Subpastas e componentes: ORCAMENTO/CtrlObjects/, ORCAMENTO/DBObjects/, ORCAMENTO/FontesMT/, ORCAMENTO/Reports/, CMPLANEORCOBJ50/
- Configuração de pacotes: ORCAMENTO/FontesMT/Orcamento.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/orcamento/index.html, HELP_PLANUS/ORCAMENTO_HTML/
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMPLANEORCOBJ50 é compartilhado (CONTAB, CONTRATO, COMPRAS2000, IRRF, FUNCEF); ORCAMENTO é o dono funcional. APPSERVERORCAMENTO/ está excluído (técnico). A ajuda HELP_PLANUS/ORCAMENTO_HTML/ serve só como evidência auxiliar.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CMTotalPrev50 (CM/TotalPrev/); CmGlobalObj50 (CMGLOBALOBJ50/); CMPlaneOrcObj50 (CMPLANEORCOBJ50/); CmContabObj50 (CMCONTABOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMPLANEORCOBJ50, CMCONTABOBJ50, CMGLOBALOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Reservas e compromissos orçamentários feitos por COMPRAS2000 e CONTRATO ("Apuração/Lançamento Orçamentário"): o AL é de ORCAMENTO; nos outros módulos é referenciado.
  * CFINAN gera fluxo "a partir do Orçamento": leitura (referenciado).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/orcamento.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Planejamento e Orçamento" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 17
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Variantes "Especial" de cada processo: verificar se a lógica é diferente (PE próprio) ou só muda o filtro (mesmo PE).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/orcamento.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.18 Impostos e Tributos (IRRF) (`IRRF/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/irrf.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Impostos e Tributos (IRRF) — código IRRF. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): IRRF/Fontes/Impostos.dpr.
- Evidência de aplicação própria: Impostos.dpr (título "Impostos e Tributos"); DARF, GPS, DCTF, DIRF.
- Áreas funcionais (legendas do menu de IRRF/Fontes/FPrincipal.pas ou fonte indicada): Lançamentos (manual de impostos, no DARF, alteração/exclusão de GPS, DARM, DARF, manutenção de documentos AP); Gerações (lançamentos de outros sistemas: folhas de pagamento, empréstimos/IOF, folha de benefícios, busca no contas a pagar; preparar/gerar DARF da folha de benefícios); DARF; DARM; GPS; DCTF; DIRF; GFIP; DPrev; DACON.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: IRRF/
- Entry point(s): IRRF/Fontes/Impostos.dpr
- Menu principal: IRRF/Fontes/FPrincipal.pas
- Subpastas e componentes: IRRF/CtrlObjects/, IRRF/DbObjects/, IRRF/Fontes/, IRRF/FontesMT/, IRRF/Reports/, CMIRRFOBJ50/
- Configuração de pacotes: IRRF/Fontes/Impostos.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/irrf/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMIRRFOBJ50 é compartilhado (FOLHA, GLOBALCM, EMPRESTIMO, CENTRALAP, AUTOATENDIMENTO...); IRRF é o dono funcional das tabelas de IR. APPSERVERIRRFDLL/ e APPSERVERLIVRODLL/ estão excluídos (técnicos); CMLIVROOBJ50 fica na fronteira.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CmGlobalObj50 (CMGLOBALOBJ50/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMIntBancoMT50 (CMINTBANCOMT50/); CMCapCarObj50 (CMCAPCAROBJ50/); CMPlaneOrcObj50 (CMPLANEORCOBJ50/); CMCfinanObj50 (CMCFINANOBJ50/); cmLivroObj50 (CMLIVROOBJ50/); CmRelatorioObj50 (CMRELATORIOOBJ50/); CMWebComum50 (AUTOATENDIMENTO/CMWebComum50/); CMFBOBJ50 (FOLHA/CMFbObj50/); CMIRRFobj50 (CMIRRFOBJ50/); CMTotalPrev50 (CM/TotalPrev/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/); CMAutoAtendimentoObj50 (AUTOATENDIMENTO/CMAutoAtendimentoObj50/); CMPrevMT50 (CM/CMPrevMT50/); CMCapCarUtilObj50 (CMCAPCARUTILOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMIRRFOBJ50, CMLIVROOBJ50, CMCFINANOBJ50, CMCAPCAROBJ50, CMPLANEORCOBJ50, FOLHA/CMFbObj50, CM/CMPrevMT50.
- Riscos de dupla contagem específicos deste módulo:
  * A Folha de Benefícios conta "Tabelas de IRRF" como AL-23 referenciado (INFERIDO). Aqui elas são AL mantido: confirmar o grupo lógico.
  * Buscas de lançamentos de FOLHA, MODFOL, EMPRESTIMO e CPAGAR: os dados de origem são referenciados; o PE de busca conta aqui.
  * FUNCEF tem "Geração de Arquivo de Darf Judicial" (classificado "Requer validação"): não contar em dobro.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/irrf.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Impostos e Tributos (IRRF)" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 18
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Identificar o papel funcional de CMLIVROOBJ50 (livro fiscal?) antes de contar algum AL relacionado.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/irrf.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.19 Contratos e Projetos (`CONTRATO/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/contrato.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Contratos e Projetos — código CONTRATO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CONTRATO/Fontes/contrato.dpr.
- Evidência de aplicação própria: contrato.dpr (título "Contratos e Projetos").
- Áreas funcionais (legendas do menu de CONTRATO/Fontes/FPrincipal.pas ou fonte indicada): Parâmetros de Aditamento; Operação; Medição; Alteração de Vencimento de AP; Geração de Contrato; Exclusão/Estorno de Parcelas sem Medição; Reajustes Contratuais e procedimentos de cálculo; Nota Fiscal (modelo, impressão, cancelamento); Apuração e Lançamento Orçamentário; Serviço/Produto e Item Contratual; Alçadas; Contratos (aditamento, encerramento, imagens/anexos, usuários); Responsável; Projetos; Cliente; Fornecedor.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CONTRATO/
- Entry point(s): CONTRATO/Fontes/contrato.dpr
- Menu principal: CONTRATO/Fontes/FPrincipal.pas
- Subpastas e componentes: CONTRATO/CtrlObjects/, CONTRATO/DbObjects/, CONTRATO/Fontes/, CONTRATO/FontesMT/, CONTRATO/Reports/
- Configuração de pacotes: CONTRATO/Fontes/contrato.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/contrato/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMCapCarObj50 (CMCAPCAROBJ50/); CMPlaneOrcObj50 (CMPLANEORCOBJ50/); CmCapCarUtilObj50 (CMCAPCARUTILOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMPLANEORCOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Parcelas viram documentos de CPAGAR ("Alteração de Data Venc. AP"): documento AP é referenciado.
  * Apuração/lançamento orçamentário usa CMPLANEORCOBJ50 (dono ORCAMENTO).
  * "Alçadas" pode coincidir com RADG (Registro de Alçadas e Decisões): verificar se usa o mesmo grupo de dados.
  * Fornecedor e Cliente aparecem também no menu de GLOBALCM ("Fornecedores/Favorecido", "Clientes"): dono único.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/contrato.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Contratos e Projetos" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 19
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Confirmar se "Projetos" aqui é o mesmo cadastro de "Atividades/Projetos" de GLOBALCM.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/contrato.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.20 Controle do Ativo Fixo (`CAF/`)

> Categoria: **Contar individualmente** · Onda 5 · Aba: `docs1/pontos-de-funcao/caf.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Controle do Ativo Fixo — código CAF. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): CAF/Fontes/Caf.dpr; CAFMT/Fontes/Caf.dpr.
- Evidência de aplicação própria: Caf.dpr referenciado por 3-Sistemas.bpg (CAF\Fontes).
- Áreas funcionais (legendas do menu de CAF/Fontes/FPrincipal.pas ou fonte indicada): Cadastros (situações físicas, tipos de áreas, motivos de baixa/saída temporária, etapas de obras, responsáveis, terceiros, destinatários de bens alienados, localizações, grupos contábeis, classes de bens, parametrização contábil, conjuntos de bens, bens, taxa de depreciação/vida útil); Placas de Patrimônio; Dados Contábeis; Bens SRF IN 86; Reavaliação; Interface SISPRO × OFA; Implantação; Lançamentos de Ajuste; Reconstruir Saldo/Fechamentos; Exportação de Dados. CAFMT acrescenta Inventário, Processamento, Movimentações, Entrada de Bens Pendentes, Transferência de Bens.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: CAF/
- Entry point(s): CAF/Fontes/Caf.dpr, CAFMT/Fontes/Caf.dpr
- Menu principal: CAF/Fontes/FPrincipal.pas
- Subpastas e componentes: CAF/Fontes/, CAF/Reports/, CAFMT/Fontes/, CAFMT/FontesMT/, CAFMT/Reports/, CMCAFOBJ50/
- Configuração de pacotes: CAF/Fontes/Caf.dof, CAFMT/Fontes/Caf.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/caf/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: CAFMT (mesmo título "Ativo Fixo"). Conte a funcionalidade de Ativo Fixo uma só vez, usando a versão definida em P-03. 3-Sistemas.bpg aponta para CAF\Fontes\Caf.dpr, mas CAFMT tem mais funções no menu.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CmContabObj50 (CMCONTABOBJ50/); CMCAFObj50 (CMCAFOBJ50/); CmBack50 (CMBACK/); CmIntBanco50 (CMINTBANCOMT50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCAFOBJ50, CMCONTABOBJ50; variante CAFMT.
- Riscos de dupla contagem específicos deste módulo:
  * CMCAFOBJ50 também é declarado por ALMOXARIFADO, RECMERC, INVESTIMOB e FUNCEF: bens patrimoniais são de CAF; nos outros são referenciados.
  * INVESTIMOB e ADMINIMOB têm "Recálculo dos Saldos dos Bens (Ativo Fixo)" e "Depreciação": verificar se mantêm dados próprios de imóveis ou os bens de CAF.
  * MODASM tem "PPRA — Classes de Bens Patrimoniais / Bens Patrimoniais (Equip. Proteção)": verificar se lê bens de CAF.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/caf.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Controle do Ativo Fixo" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 20
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-03: definir a versão vigente (CAF ou CAFMT) antes da contagem.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/caf.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.21 Almoxarifado e Custos (`ALMOXARIFADO/`)

> Categoria: **Contar individualmente** · Onda 5 · Aba: `docs1/pontos-de-funcao/almoxarifado.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Almoxarifado e Custos — código ALMOXARIFADO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): ALMOXARIFADO/Fontes/Almoxarifado.dpr.
- Evidência de aplicação própria: Almoxarifado.dpr (título "Almoxarifado e Custos").
- Áreas funcionais (legendas do menu de ALMOXARIFADO/Fontes/FPrincipal.pas ou fonte indicada): As legendas de ALMOXARIFADO/Fontes/FPrincipal.dfm não trazem itens de menu (o menu é montado de outra forma). Levante as funções pelo catálogo (docs/site/modules/almoxarifado/index.html: estoque e movimentações) e pelos formulários de ALMOXARIFADO/Fontes/ e ALMOXARIFADO/FontesMT/.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: ALMOXARIFADO/
- Entry point(s): ALMOXARIFADO/Fontes/Almoxarifado.dpr
- Menu principal: ALMOXARIFADO/Fontes/FPrincipal.pas
- Subpastas e componentes: ALMOXARIFADO/Fontes/, ALMOXARIFADO/FontesMT/, ALMOXARIFADO/Reports/, CMALMOXCOMPRAOBJ50/, RECMERC/Fontes/
- Configuração de pacotes: ALMOXARIFADO/Fontes/Almoxarifado.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/almoxarifado/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: RECMERC (RecMerc.dpr, 2 units próprias, que reaproveita formulários de ALMOXARIFADO / ALMOX&COMPRAS — recebimento de mercadoria com/sem O.C., devolução, produtos, almoxarifados). Dados em CMALMOXCOMPRAOBJ50, compartilhado com COMPRAS2000.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); cmGlobalObj50 (CMGLOBALOBJ50/); CMContabObj50 (CMCONTABOBJ50/); CMAlmoxCompraObj50 (CMALMOXCOMPRAOBJ50/); CMIntBancoMT50 (CMINTBANCOMT50/); CMCAFObj50 (CMCAFOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMALMOXCOMPRAOBJ50, CMCAFOBJ50, CMCONTABOBJ50, CMGLOBALOBJ50, CMINTBANCOMT50, SHARED (search path).
- Riscos de dupla contagem específicos deste módulo:
  * Produto, grupo de produto, unidade de medida e fornecedor aparecem também nos menus de COMPRAS2000 e RECMERC: escolher um único dono.
  * Recebimento com O.C. lê a ordem de compra de COMPRAS2000 (referenciado).
  * ALMOX&COMPRAS e SHARED/Almox_Compras são cópias de fontes (156 units em comum): não contar.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/almoxarifado.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Almoxarifado e Custos" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 21
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Decidir com COMPRAS2000 o dono dos cadastros de produto/fornecedor (P-17).
- Menu sem legendas: confirmar as funções com usuário ou com as ações registradas em ALMOXARIFADO/Fontes/FPrincipal.pas.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/almoxarifado.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.22 Compras (`COMPRAS2000/`)

> Categoria: **Contar individualmente** · Onda 5 · Aba: `docs1/pontos-de-funcao/compras.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Compras — código COMPRAS2000. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): COMPRAS2000/Fontes/Compras.dpr.
- Evidência de aplicação própria: Compras.dpr (título "Compras").
- Áreas funcionais (legendas do menu de COMPRAS2000/Fontes/FPrincipal.pas ou fonte indicada): Solicitação de Compra (avulsa, pré-pronta, exclusão de itens pendentes da SCI); Atribuir Comprador; Processo de Compras; Cotação e Sumário de Cotação; O.C. sem Cotação; Cancelamento de O.C.; Caixa Pequeno (cadastro, usuários, lançamentos, consulta, efetivação e exclusão de efetivação); Produto, Grupo de Produto, Artigos × Fornecedores, Insumos, Itens de Venda, Unidade de Medida, Tamanho; Usuários por Almoxarifado/Grupo de Produto.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: COMPRAS2000/
- Entry point(s): COMPRAS2000/Fontes/Compras.dpr
- Menu principal: COMPRAS2000/Fontes/FPrincipal.pas
- Subpastas e componentes: COMPRAS2000/Fontes/, COMPRAS2000/fontesMT/, CMALMOXCOMPRAOBJ50/
- Configuração de pacotes: COMPRAS2000/Fontes/Compras.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/compras/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto (dados em CMALMOXCOMPRAOBJ50, compartilhado com ALMOXARIFADO).
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50MT (CM/RegraMT/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMRegra50 (CM/Regra/); CMFBOBJ50 (FOLHA/CMFbObj50/); CMFolhaObjMT (FOLHA/CMFolhaObjMt/); CMIRRFobj50 (CMIRRFOBJ50/); CmGlobalObj50 (CMGLOBALOBJ50/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMPlaneOrcObj50 (CMPLANEORCOBJ50/); CMCfinanObj50 (CMCFINANOBJ50/); CMCapCarObj50 (CMCAPCAROBJ50/); CMAlmoxCompraObj50 (CMALMOXCOMPRAOBJ50/); CMContabObj50 (CMCONTABOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMALMOXCOMPRAOBJ50, CMCONTABOBJ50, CMCAPCAROBJ50, CMCFINANOBJ50, CMPLANEORCOBJ50, CMGLOBALOBJ50, SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * Cadastros de produto/fornecedor duplicados com ALMOXARIFADO e RECMERC (P-17).
  * Reserva/compromisso orçamentário da compra: dado de ORCAMENTO (CMPLANEORCOBJ50), referenciado.
  * Avaliação de fornecedor fica em SCQ.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/compras.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Compras" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 22
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Confirmar se "Caixa Pequeno" é função de compras ou do financeiro (CFINAN).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/compras.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.23 Controle de Qualidade de Fornecedores (`SCQ/`)

> Categoria: **Contar individualmente** · Onda 5 · Aba: `docs1/pontos-de-funcao/scq.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Controle de Qualidade de Fornecedores — código SCQ. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): SCQ/Fontes/SCQ.dpr.
- Evidência de aplicação própria: SCQ.dpr (título "Sistema de Controle de Qualidade").
- Áreas funcionais (legendas do menu de SCQ/Fontes/FPrincipal.pas ou fonte indicada): Restrições dos Fornecedores; Tipo de Avaliação; avaliação de fornecedores (FAvaliacao.pas, uAvaliForn.pas), critérios e itens de avaliação (uDbCritAvaliacao.pas, uDbItemavaliacao.pas), parâmetros (FParamSCQ.pas).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: SCQ/
- Entry point(s): SCQ/Fontes/SCQ.dpr
- Menu principal: SCQ/Fontes/FPrincipal.pas
- Subpastas e componentes: SCQ/CtrlObjetos/, SCQ/DbObjetos/, SCQ/Fontes/, SCQ/FontesMT/
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. SHARED/Almox_Compras/Fontes/FPrincipal.dfm repete o menu de SCQ: é cópia, não outra aplicação.
- Pacotes de negócio declarados: nenhum .dof encontrado — confirme as dependências pelo .dpr e pelo search path.
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM (framework); cópia do menu em SHARED/Almox_Compras.
- Riscos de dupla contagem específicos deste módulo:
  * Fornecedor é referenciado (dono a definir em P-17 / GLOBALCM).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/scq.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Controle de Qualidade de Fornecedores" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 23
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Não foi encontrado .dof em SCQ/Fontes/: os pacotes de runtime não puderam ser confirmados.
- Módulo pequeno: confirmar que continua em uso.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/scq.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.24 Cadastros Globais (GlobalCM) (`GLOBALCM/`)

> Categoria: **Contar individualmente** · Onda 1 · Aba: `docs1/pontos-de-funcao/globalcm.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Cadastros Globais (GlobalCM) — código GLOBALCM. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): GLOBALCM/FONTES/GlobalCM.dpr.
- Evidência de aplicação própria: GlobalCM.dpr; menu de moedas, centros de custo, bancos, patrocinadoras, planos.
- Áreas funcionais (legendas do menu de GLOBALCM/FONTES/FPrincipal.pas ou fonte indicada): Log de Tabelas (consultar/excluir); Pessoa × Módulo Responsável; Importação de Cotações; De/Para de Exportações; Moeda, Cotação, Qualificação; Centro de Responsabilidade e Centro de Custo (planos e usuários); País, Estado, Cidades, Feriados; Tipo de Operação; Atividades/Projetos; Tipo de Documentação; Ramo de Fornecedores; Fornecedores/Favorecido; Tipo de Cliente e Clientes; Bancos, Praça de Compensação, Agência; Patrocinadora; Plano Previdenciário; Programas Previdenciários; Plano Previdenciário Contábil; Plano × Patrocinadora.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: GLOBALCM/
- Entry point(s): GLOBALCM/FONTES/GlobalCM.dpr
- Menu principal: GLOBALCM/FONTES/FPrincipal.pas
- Subpastas e componentes: GLOBALCM/CtrlObjects/, GLOBALCM/DbObjects/, GLOBALCM/FONTES/, GLOBALCM/FONTESMT/, GLOBALCM/FONTESOUTROS/, GLOBALCM/REPORTS/, CMGLOBALOBJ50/
- Configuração de pacotes: GLOBALCM/FONTES/GlobalCM.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/global-cm/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMGLOBALOBJ50 é o serviço de dados globais; GLOBALCM é o dono funcional. Execute esta contagem cedo (onda 1) para que os demais módulos possam referenciar estes AL.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CmIntBancoMT50 (CMINTBANCOMT50/); CMGlobalObj50 (CMGLOBALOBJ50/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMIRRFobj50 (CMIRRFOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMGLOBALOBJ50, CMBACK, CMINTBANCOMT50, CMIRRFOBJ50, FOLHA/CMFbComum50.
- Riscos de dupla contagem específicos deste módulo:
  * BANCO (FOLHA AL-22), PATRO/PLANPREV (FOLHA AL-18/AL-19): decidir com PARAMPREV quem mantém patrocinadora e plano (P-14).
  * Fornecedor/cliente e projetos também aparecem em CONTRATO, COMPRAS2000 e ALMOXARIFADO.
  * Log de tabelas e Pessoa × Módulo Responsável podem ser apoio técnico: só contam se forem reconhecidos pelo usuário como dado de negócio.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/globalcm.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Cadastros Globais (GlobalCM)" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 24
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-14: dono de patrocinadora e plano previdenciário (GLOBALCM × PARAMPREV).
- Confirmar se PESSOA é mantida aqui ou em CADASTROPREV / MODBAS.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/globalcm.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.25 Regras de Negócio (`REGRA/`)

> Categoria: **Contar individualmente** · Onda 1 · Aba: `docs1/pontos-de-funcao/regra.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Regras de Negócio — código REGRA. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): REGRA/Fontes/Regra.dpr; EXECUTAREGRA/Fontes/ExecutaRegra.dpr.
- Evidência de aplicação própria: Regra.dpr (título "Regras de Negócio").
- Áreas funcionais (legendas do menu de REGRA/Fontes/FPrincipal.pas ou fonte indicada): Relatório SRB; Controle de Acesso a Grupos/Tipos de Regras e Tabelas Genéricas; Dicionário de Dados (atualizar, exportar/importar); Importar Tabelas Genéricas/Longas; Exportar/Importar Regras; Testes do Regra; Grupos de Regras; Tipos de Regras; Grupos de Fórmulas; Fórmulas; Variáveis; Regras de Negócio; Tabelas Genéricas/Longas; Processos; Executar Regra; Detalhes de Regras.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: REGRA/
- Entry point(s): REGRA/Fontes/Regra.dpr, EXECUTAREGRA/Fontes/ExecutaRegra.dpr
- Menu principal: REGRA/Fontes/FPrincipal.pas
- Subpastas e componentes: REGRA/CtrlObjects/, REGRA/DbObjects/, REGRA/Fontes/, REGRA/FontesMT/, EXECUTAREGRA/Fontes/, CM/Regra/, CM/RegraMT/
- Configuração de pacotes: REGRA/Fontes/Regra.dof, EXECUTAREGRA/Fontes/ExecutaRegra.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/regra/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: EXECUTAREGRA (ExecutaRegra.dpr, 4 units — executa as regras cadastradas aqui). O motor CM/Regra + CM/RegraMT é usado por quase todas as aplicações e fica na fronteira: o cálculo que usa a regra conta no módulo de negócio; o cadastro da regra conta aqui.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMFBCOMUM50 (FOLHA/CMFbComum50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CM/Regra e CM/RegraMT (motor), FOLHA/CMFbComum50; EXECUTAREGRA (junto).
- Riscos de dupla contagem específicos deste módulo:
  * Regras e tabelas genéricas são lidas por FOLHA, CONTRIBUICAOPREV, BENEFICIOPREV, PROJETOATUARIAL etc. Nesses módulos são AL referenciados.
  * Dicionário de dados interno e controle de acesso podem ser técnicos: só contam se o usuário de negócio os mantém.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/regra.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Regras de Negócio" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 25
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Decidir se "Tabelas Genéricas" formam um único AL ou vários grupos lógicos reconhecidos pelo usuário.
- Avaliar se "Relatório SRB" é PE de REGRA ou relatório de outro módulo publicado neste menu.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/regra.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.26 RAD — Registro de Alçadas e Decisões (`RADG/`)

> Categoria: **Contar individualmente** · Onda 4 · Aba: `docs1/pontos-de-funcao/radg.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RAD — Registro de Alçadas e Decisões — código RADG. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): RADG/Fontes/RADg.dpr.
- Evidência de aplicação própria: RADg.dpr (título "RAD - Registro de Alçadas e Decisões").
- Áreas funcionais (legendas do menu de RADG/Fontes/FPrincipal.pas ou fonte indicada): Processo e Processos Pendentes; Grupo Aprovador; Grupo de Autorização; Grupo de Processo; Referências; Andamentos; Tipo de Processo; Tipo de Etapa; Fluxo de Processos; Etapa × Grupo de Autorização; Tipo Processo/Etapa × Objetos RAD; Consulta de Processos; Gerenciamento de Execução de Etapa e de Processos; Processos Pendentes × Usuário.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: RADG/
- Entry point(s): RADG/Fontes/RADg.dpr
- Menu principal: RADG/Fontes/FPrincipal.pas
- Subpastas e componentes: RADG/CtrlObjetos/, RADG/DbObjetos/, RADG/Fontes/, RADG/FontesMT/, RADG/Reports/, OBJRAD/
- Configuração de pacotes: RADG/Fontes/RADg.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: OBJRAD/ (pacote CMObjRAD, objetos de processo, etapa e autorização RAD) é a camada de dados; RADG é o dono funcional.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMFBCOMUM50 (FOLHA/CMFbComum50/); CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMRegra50MT (CM/RegraMT/); cmglobalobj50 (CMGLOBALOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): OBJRAD (objetos RAD), CMGLOBALOBJ50, FOLHA/CMFbComum50.
- Riscos de dupla contagem específicos deste módulo:
  * Outros módulos podem consultar alçadas (por exemplo, "Alçadas" em CONTRATO): o dado de alçada é de RADG.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/radg.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RAD — Registro de Alçadas e Decisões" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 26
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Sem documentação funcional: usar o código como fonte principal.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/radg.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.27 Indicadores de Shoppings, Hotéis e Parques (`INDICADORES/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/indicadores.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Indicadores de Shoppings, Hotéis e Parques — código INDICADORES. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): INDICADORES/Fontes/Indicadores.dpr.
- Evidência de aplicação própria: Indicadores.dpr; pacote próprio INDICADORES/Packages.
- Áreas funcionais (legendas do menu de INDICADORES/Fontes/FPrincipal.pas ou fonte indicada): Apuração de Indicadores (manual e calculados); Importação (planilha, texto, layout, sinônimos); Exclusão em Lote; Conciliação e Checagem das Apurações; Encerramento de Contrato; Correção dos Lançamentos de Imóveis; Lojas, Atividades e Segmentos, Marcas e Franquias; Contratos (lojas, hotéis, negócios terceirizados); Situação Contratual; Dados Complementares; Indicadores; Grupo de Apuração; Configuração de Relatórios; Eventos de Marketing.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: INDICADORES/
- Entry point(s): INDICADORES/Fontes/Indicadores.dpr
- Menu principal: INDICADORES/Fontes/FPrincipal.pas
- Subpastas e componentes: INDICADORES/CtrlObjects/, INDICADORES/DbObjects/, INDICADORES/Fontes/, INDICADORES/Packages/, CMINDICADORESOBJ50/
- Configuração de pacotes: INDICADORES/Fontes/Indicadores.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/indicadores/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: CMINDICADORESOBJ50 (pacote CMIndicadoresObj50, declarado só por INDICADORES).
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CMIndicadoresObj50 (CMINDICADORESOBJ50/); CMImobiliarioObj50 (CMIMOBILIARIOOBJ50/); CMRegra50MT (CM/RegraMT/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMINDICADORESOBJ50 (junto), CMIMOBILIARIOOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Imóveis e contratos de locação podem ser de ADMINIMOB (CMIMOBILIARIOOBJ50): verificar se "Contratos de Lojas/Hotéis" mantém dados próprios ou referencia ADMINIMOB.
  * "Correção dos Lançamentos de Imóveis" também aparece no menu de ALIENACAO.
  * FLASHRPT (hotelaria, "Requer validação") pode ser parte deste domínio (P-06).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/indicadores.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Indicadores de Shoppings, Hotéis e Parques" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 27
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html descreve INDICADORES como "indicadores gerenciais da organização", mas o título do programa é "Indicadores de Shoppings, Hotéis e Parques". Registrar a correção.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/indicadores.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.28 Administração Imobiliária (`ADMINIMOB/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/adminimob.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Administração Imobiliária — código ADMINIMOB. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): ADMINIMOB/Fontes/AdminImob.dpr.
- Evidência de aplicação própria: AdminImob.dpr; em Imobiliario.bpg e 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de ADMINIMOB/Fontes/FPrincipal.pas ou fonte indicada): Contratos; Despesas; Imóveis; Receitas; Quadro de Avisos; Itens por Processo; Grupos de Rateio; Agrupa Documentos; Recomposição/Recálculo (carteiras de investimento, saldos dos bens); Cobrança (aviso, desenho, emissão, carta de reajuste, recibo, etiquetas, recálculo); Conciliação; Mensagens para Boletos; Lançamentos (múltiplo, despesas, receitas).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: ADMINIMOB/
- Entry point(s): ADMINIMOB/Fontes/AdminImob.dpr
- Menu principal: ADMINIMOB/Fontes/FPrincipal.pas
- Subpastas e componentes: ADMINIMOB/CtrlObjects/, ADMINIMOB/DBObjects/, ADMINIMOB/Fontes/, ADMINIMOB/FontesMT/, CMIMOBILIARIOOBJ50/
- Configuração de pacotes: ADMINIMOB/Fontes/AdminImob.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/imobiliario/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMIMOBILIARIOOBJ50 é compartilhado por ADMINIMOB, INVESTIMOB, ALIENACAO, INDICADORES e CFINAN; fica na fronteira. ADMINIMOB/Fontes/AdminImobOLD.dpr e PROJETOSCM5/ADMINIMOB/ são versões antigas/configuração: não contar.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMContabObj50 (CMCONTABOBJ50/); CmCapCarObj50 (CMCAPCAROBJ50/); CMImobiliarioObj50 (CMIMOBILIARIOOBJ50/); CMRegra50MT (CM/RegraMT/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMIMOBILIARIOOBJ50, CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMCONTABOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Cadastro de imóveis: ADMINIMOB, INVESTIMOB e ALIENACAO têm "Imóveis" no menu. Decidir o dono (P-18).
  * Documentos de cobrança e receitas podem virar títulos de CRECEBER; despesas, de CPAGAR.
  * ALIENACAO tem "Associação de Documentos do Adminimob": o dado é de ADMINIMOB.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/adminimob.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Administração Imobiliária" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 28
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-18: dono do cadastro de imóveis entre os três módulos imobiliários.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/adminimob.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.29 Investimentos Imobiliários (`INVESTIMOB/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/investimob.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Investimentos Imobiliários — código INVESTIMOB. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): INVESTIMOB/Fontes/InvestImob.dpr.
- Evidência de aplicação própria: InvestImob.dpr (título "Investimentos Imobiliários").
- Áreas funcionais (legendas do menu de INVESTIMOB/Fontes/FPrincipal.pas ou fonte indicada): Parâmetros do Patrimônio; Ajustes (bens por imóvel, saldo contábil de imóvel baixado, saldo de implantação); Grupos de Imóveis; Reconstrução de Saldos e Recálculo das Carteiras; Movimentações de Imóveis (aquisição parcelada/à vista, alienação à vista, acréscimo/decréscimo de valor, depreciação e desfazer, desmembramento, remembramento, reavaliação, retificação, transferência, baixa individual de bem); Obras (despesas, ressarcimentos, encerramento); Integração Financeira.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: INVESTIMOB/
- Entry point(s): INVESTIMOB/Fontes/InvestImob.dpr
- Menu principal: INVESTIMOB/Fontes/FPrincipal.pas
- Subpastas e componentes: INVESTIMOB/CtrlObjects/, INVESTIMOB/DbObjects/, INVESTIMOB/Fontes/, INVESTIMOB/FontesMT/, CMIMOBILIARIOOBJ50/
- Configuração de pacotes: INVESTIMOB/Fontes/InvestImob.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/imobiliario/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: INVESTIMOB/Fontes/InvestImobOLD.dpr e INVESTIMOB/Fontes/CMProject.dof são versões antigas/modelo: não contar.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CmGlobalObj50 (CMGLOBALOBJ50/); CmCapCarObj50 (CMCAPCAROBJ50/); CMImobiliarioObj50 (CMIMOBILIARIOOBJ50/); CMCAFObj50 (CMCAFOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMIMOBILIARIOOBJ50, CMCAFOBJ50, CMCAPCAROBJ50, CMGLOBALOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Cadastro de imóveis compartilhado com ADMINIMOB e ALIENACAO (P-18).
  * "Alienação à Vista" aqui e o módulo ALIENACAO: verificar se é o mesmo processo.
  * Depreciação e bens usam CMCAFOBJ50 (dono CAF).
  * "Desfazer ..." de cada movimentação: verificar se é PE distinto (desfazer com regra própria) ou parte do mesmo PE.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/investimob.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Investimentos Imobiliários" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 29
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-18.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/investimob.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.30 Alienação de Imóveis (`ALIENACAO/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/alienacao.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Alienação de Imóveis — código ALIENACAO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): ALIENACAO/Fontes/Alienacao.dpr.
- Evidência de aplicação própria: Alienacao.dpr (título "Alienação").
- Áreas funcionais (legendas do menu de ALIENACAO/Fontes/FPrincipal.pas ou fonte indicada): Contratos; Importação de Baixas de Parcelas; Associação de Documentos do Adminimob; Geração do Contrato de Venda e Desfaz; Encerramento Contratual; Geração de Parcelas; Amortização do Saldo Devedor; Baixa Manual; Cobrança/Abono de Resíduo; Integração, Estorno e Conciliação das Parcelas; Repactuação, Antecipação e Recálculo de Parcelas (com desfazer); Acréscimos e Descontos; Carta de Reajuste; Devolução de Sinal; Distrato; Previsões Diárias; Encerramento do Mês; Propostas e Contratos de Alienação; Compradores, Responsáveis, Fiadores, Imóveis; Mensagens para Boleto.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: ALIENACAO/
- Entry point(s): ALIENACAO/Fontes/Alienacao.dpr
- Menu principal: ALIENACAO/Fontes/FPrincipal.pas
- Subpastas e componentes: ALIENACAO/CtrlObjects/, ALIENACAO/Fontes/, ALIENACAO/FontesMT/, CMIMOBILIARIOOBJ50/
- Configuração de pacotes: ALIENACAO/Fontes/Alienacao.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/imobiliario/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: ALIENACAO/Fontes/AlienacaoOLD.dpr é versão antiga: não contar.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmGlobalObj50 (CMGLOBALOBJ50/); CmCapCarObj50 (CMCAPCAROBJ50/); CMRegra50MT (CM/RegraMT/); CMImobiliarioObj50 (CMIMOBILIARIOOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMIMOBILIARIOOBJ50, CMCAPCAROBJ50, CMGLOBALOBJ50; documentos de ADMINIMOB.
- Riscos de dupla contagem específicos deste módulo:
  * FINANCIAMENTO ("Requer validação", P-04) tem "Geração de Contrato de Venda" e "Geração das Parcelas": provável sobreposição.
  * Imóveis compartilhados com ADMINIMOB e INVESTIMOB (P-18).
  * Integração das parcelas gera dados em CRECEBER / CONTAB (referenciados).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/alienacao.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Alienação de Imóveis" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 30
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-04 e P-18.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/alienacao.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.31 Sistema de Investimentos (`INVESTIMENTOS/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/investimentos.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Sistema de Investimentos — código INVESTIMENTOS. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): INVESTIMENTOS/FontesProducao/Investimentos.dpr.
- Evidência de aplicação própria: Investimentos.dpr; em 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de INVESTIMENTOS/FontesProducao/FPrincipal.pas ou fonte indicada): Módulos Renda Variável, BM&F, Fundos de Investimento e Renda Fixa; Parâmetros do Sistema e de Cotação RV; Importações (cotações, Excel, Beta, carteira de fundos, caixa e cota); Exportação de dados e MAPS; Implantação de Saldos; Feriados de investimento; Cotações por período e indexadas; Acesso às Carteiras; Plano Contábil × Patrocinadora; Gestores de Carteiras.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: INVESTIMENTOS/
- Entry point(s): INVESTIMENTOS/FontesProducao/Investimentos.dpr
- Menu principal: INVESTIMENTOS/FontesProducao/FPrincipal.pas
- Subpastas e componentes: INVESTIMENTOS/FontesProducao/, INVESTIMENTOS/CMInvestObj50/, INVESTIMENTOS/CMInvFIObj50/, INVESTIMENTOS/CMInvRFObj50/, INVESTIMENTOS/CMInvRVObj50/
- Configuração de pacotes: INVESTIMENTOS/FontesProducao/Investimentos.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/investimentos/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Contar junto: os pacotes CMInvestObj50, CMInvFIObj50, CMInvRFObj50 e CMInvRVObj50, que ficam na pasta INVESTIMENTOS. INVESTCOTAS também declara CMInvFIObj50/CMInvRFObj50/CMInvRVObj50; lá esses dados são referenciados. INVESTIMENTOS/DCU/ e INVESTIMENTOS/ALINHAMENTO/ não são fonte funcional.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMContabObj50 (CMCONTABOBJ50/); CMCapCarObj50 (CMCAPCAROBJ50/); CMRegra50MT (CM/RegraMT/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): Pacotes próprios CMInvestObj50/CMInvFIObj50/CMInvRFObj50/CMInvRVObj50 (junto), CMCONTABOBJ50, CMCAPCAROBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * INVESTFDO ("Requer validação", P-05) repete fundos de investimento.
  * COTAS calcula cotas por segmento (Renda Fixa, Variável, BM&F, Fundos): verificar se lê as carteiras daqui (referenciado).
  * Cotações de moeda também são importadas em GLOBALCM ("Importação de Cotações").
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/investimentos.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Sistema de Investimentos" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 31
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- Maior pasta funcional do repositório (1.322 arquivos): planejar a contagem por submódulo (RV, RF, BM&F, Fundos) dentro de uma única fronteira, sem criar fronteiras novas.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/investimentos.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.32 Sistema de Cotas de Investimentos (`INVESTCOTAS/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/investcotas.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Sistema de Cotas de Investimentos — código INVESTCOTAS. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): INVESTCOTAS/Fontes/InvestCotas.dpr.
- Evidência de aplicação própria: InvestCotas.dpr (título "Sistema de Cotas do Investimento").
- Áreas funcionais (legendas do menu de INVESTCOTAS/Fontes/FPrincipal.pas ou fonte indicada): Índice Atuarial; Feriado de Investimento; Cotações por período e indexadas; Acerto no Histórico; Carteira (parâmetros); Evento Caixa/Cota e Carteira × Evento; Lançamentos de Caixa, Cota, Depósito e Retirada; Apuração de Caixa e de Cota; Evolução Patrimonial; Gráficos; Participante.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: INVESTCOTAS/
- Entry point(s): INVESTCOTAS/Fontes/InvestCotas.dpr
- Menu principal: INVESTCOTAS/Fontes/FPrincipal.pas
- Subpastas e componentes: INVESTCOTAS/CtrlObjects/, INVESTCOTAS/DbObjects/, INVESTCOTAS/Fontes/, INVESTCOTAS/Reports/
- Configuração de pacotes: INVESTCOTAS/Fontes/InvestCotas.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/investimentos/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. Pacotes de INVESTIMENTOS (CMInvFIObj50, CMInvRFObj50, CMInvRVObj50) na fronteira.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CMFBCOMUM50 (FOLHA/CMFbComum50/); CMContabObj50 (CMCONTABOBJ50/); CmCapCarObj50 (CMCAPCAROBJ50/); CMInvFIObj50 (INVESTIMENTOS/CMInvFIObj50/); CMInvRFObj50 (INVESTIMENTOS/CMInvRFObj50/); CMInvRVObj50 (INVESTIMENTOS/CMInvRVObj50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): INVESTIMENTOS/CMInvFIObj50, CMInvRFObj50, CMInvRVObj50; CMCONTABOBJ50, CMCAPCAROBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Feriados e cotações também são mantidos em INVESTIMENTOS ("Cadastra Feriado Investimento", "Cotações por Período/Indexadas"): dono único.
  * Cotas de COTAS e COTASPATRIM: verificar se são o mesmo conceito de cota (P-19).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/investcotas.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Sistema de Cotas de Investimentos" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 32
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-19: relação entre INVESTCOTAS, COTAS e COTASPATRIM.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/investcotas.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.33 Controle de Cotas & Informações SPC (`COTAS/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/cotas.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Controle de Cotas & Informações SPC — código COTAS. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): COTAS/Fontes/Cotas.dpr.
- Evidência de aplicação própria: Cotas.dpr (título "Controle de Cotas & Informações SPC").
- Áreas funcionais (legendas do menu de COTAS/Fontes/FPrincipal.pas ou fonte indicada): Exporta DAIEA; Importar Lançamentos; Excluir Cotas; Primeiras Cotas por segmento (Empréstimo, Imobiliário, Renda Fixa/Variável, BM&F, Fundos RF/RV/Imobiliários/Direito Creditório); Carteira SPC; Ativos; Perfil; Parâmetros de Movimentação; Movimentações Manuais; Receitas e Despesas para Lançamento Manual; Cálculo de Cotas e da Primeira Cota; Fechamento de Período; Perfil Consolidado; Evolução de Cotas.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: COTAS/
- Entry point(s): COTAS/Fontes/Cotas.dpr
- Menu principal: COTAS/Fontes/FPrincipal.pas
- Subpastas e componentes: COTAS/CtrlObjects/, COTAS/DbObjects/, COTAS/Fontes/
- Configuração de pacotes: COTAS/Fontes/Cotas.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/investimentos/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMTotalPrev50 (CM/TotalPrev/); CMContabObj50 (CMCONTABOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCONTABOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Segmentos Empréstimo e Imobiliário leem dados de EMPRESTIMO e dos módulos imobiliários (referenciados).
  * Relação com INVESTCOTAS e COTASPATRIM (P-19).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/cotas.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Controle de Cotas & Informações SPC" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 33
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-19.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/cotas.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.34 Controle de Cotas Patrimoniais (`COTASPATRIM/`)

> Categoria: **Contar individualmente** · Onda 6 · Aba: `docs1/pontos-de-funcao/cotaspatrim.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Controle de Cotas Patrimoniais — código COTASPATRIM. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): COTASPATRIM/Fontes/CotasPatrim.dpr.
- Evidência de aplicação própria: CotasPatrim.dpr (título "Controle de Cotas Patrimoniais").
- Áreas funcionais (legendas do menu de COTASPATRIM/Fontes/FPrincipal.pas ou fonte indicada): Abertura de Ativo; Ativo; Conta/Fundo; Tipo de Entrada; Tipo de Movimentação; Roteiros; Operação; Apuração Manual; Execução de Roteiros; Gerenciamento de Cotas; Roteiros Apurados.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: COTASPATRIM/
- Entry point(s): COTASPATRIM/Fontes/CotasPatrim.dpr
- Menu principal: COTASPATRIM/Fontes/FPrincipal.pas
- Subpastas e componentes: COTASPATRIM/CtrlObjects/, COTASPATRIM/DbObjects/, COTASPATRIM/Fontes/, COTASPATRIM/Reports/
- Configuração de pacotes: COTASPATRIM/Fontes/CotasPatrim.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmRegra50MT (CM/RegraMT/); CMTotalPrev50 (CM/TotalPrev/); CMContabObj50 (CMCONTABOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMCONTABOBJ50.
- Riscos de dupla contagem específicos deste módulo:
  * Relação com COTAS e INVESTCOTAS (P-19).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/cotaspatrim.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Controle de Cotas Patrimoniais" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 34
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-19.
- Sem documentação funcional: usar o código como fonte principal.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/cotaspatrim.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.35 Sistema Jurídico Consolidado (`SISTJURCONS/`)

> Categoria: **Contar individualmente** · Onda 7 · Aba: `docs1/pontos-de-funcao/sistjurcons.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): Sistema Jurídico Consolidado — código SISTJURCONS. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): SISTJURCONS/Fontes/SistJurCons.dpr.
- Evidência de aplicação própria: SistJurCons.dpr; em 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de SISTJURCONS/Fontes/FPrincipal.pas ou fonte indicada): Verificação e Acerto do Custo; Alteração de Responsável e de Escritório/Advogado; Advogados, Assistentes e Peritos; Honorários Advocatícios e Contratuais; Órgãos Jurisdicionais; Tipos de Processo, Ação, Sentença, Etapa, Objeto Reclamado; Motivos de Exclusão de Litisconsortes; Rateio de Custos por Estabelecimento; Parametrização Contábil; Processo e Etapas; Rateio de Despesas Judiciais; Correção Monetária; Ajuste da Estimativa aos Depósitos e Penhoras; Documentos AP/GR; Despesas Administrativas (importação e manutenção); Ordem Judicial; Reembolso de Honorários a Ex-Funcionários; Consultas, Follow-up, Gráficos e Estatísticas; Distribuição de Processos (trabalhistas).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: SISTJURCONS/
- Entry point(s): SISTJURCONS/Fontes/SistJurCons.dpr
- Menu principal: SISTJURCONS/Fontes/FPrincipal.pas
- Subpastas e componentes: SISTJURCONS/CtrlObjetos/, SISTJURCONS/Fontes/, SISTJURCONS/FontesMT/, SISTJURCONS/Reports/
- Configuração de pacotes: SISTJURCONS/Fontes/SistJurCons.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/juridico/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Depende da decisão P-02. Se PROCJUD, PROCPREV e MODCON forem visões por matéria de SISTJURCONS, conte as funções delas aqui uma única vez, citando PROCJUD/Fontes/, PROCPREV/Fontes/ e MODCON/Fontes/. Se forem aplicações próprias, conte só SISTJURCONS e registre que as outras têm prompt próprio a criar.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmRHObj50 (CMRHOBJ50/); CMTotalPrev50 (CM/TotalPrev/); CmCapCarUtilObj50 (CMCAPCARUTILOBJ50/); CMIntBancoMT50 (CMINTBANCOMT50/); CMCapCarObj50 (CMCAPCAROBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMCAPCAROBJ50, CMCAPCARUTILOBJ50, CMINTBANCOMT50, SHARED; fontes reutilizadas por PROCJUD, PROCPREV e MODCON.
- Riscos de dupla contagem específicos deste módulo:
  * PROCJUD, PROCPREV e MODCON têm menus quase iguais e compartilham units (15, 12 e 15 em comum com SISTJURCONS). O processo judicial é um único AL, mesmo que três programas o mantenham.
  * Documentos AP/GR: títulos de CPAGAR / CRECEBER (referenciados).
  * CMRHOBJ50 é declarado: dados de empregado (contencioso trabalhista) são de MODBAS (referenciados).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/sistjurcons.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "Sistema Jurídico Consolidado" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 35
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- P-02: fronteira do domínio jurídico.
- docs/system-overview.html agrupa só SISTJURCONS + PROCJUD em "juridico"; PROCPREV e MODCON não estão lá.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/sistjurcons.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.36 RH — Módulo Básico (`MODBAS/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modbas.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Módulo Básico — código MODBAS. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODBAS/Fontes/ModBas.dpr.
- Evidência de aplicação própria: ModBas.dpr (título "RH - Módulo Básico").
- Áreas funcionais (legendas do menu de MODBAS/Fontes/fPrincipal.pas ou fonte indicada): Estabelecimentos e Centros de Custo por Usuário; Queries Diversas; Importação Direta de Dados; Pessoal; Histórico de Alterações Cadastrais; Situação Funcional; Cargos; Profissões; Graus de Instrução; Estabelecimentos; Sindicatos; Segmentos; Motivos e Ações; Cartas ou Comunicados; Browse do Cadastro de Pessoas; Gráficos Fixos; Estatísticas do Quadro de Pessoal.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODBAS/
- Entry point(s): MODBAS/Fontes/ModBas.dpr
- Menu principal: MODBAS/Fontes/fPrincipal.pas
- Subpastas e componentes: MODBAS/CtrlObjetos/, MODBAS/DbObjetos/, MODBAS/Fontes/, MODBAS/Reports/, CMRHOBJ50/
- Configuração de pacotes: MODBAS/Fontes/ModBas.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: O pacote CMRHOBJ50 (452 units) é a camada de dados de todo o RH e fica na fronteira. MODBAS/CompoRH.dpk é pacote de componentes (não conta). Conte MODBAS primeiro no RH: é o provável dono do cadastro de pessoal.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CmGlobalObj50 (CMGLOBALOBJ50/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMGLOBALOBJ50, SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * Pessoal, cargos, profissões, graus de instrução, estabelecimentos e sindicatos também aparecem no menu de MODFOL e de MODCES. Fixe aqui o dono (P-10) para que os outros módulos referenciem.
  * "Queries Diversas" e "Importação Direta de Dados" podem ser ferramentas técnicas (não contam).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modbas.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Módulo Básico" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 36
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- P-10: dono do cadastro de pessoal e das tabelas básicas de RH.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modbas.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.37 RH — Folha de Pagamento (`MODFOL/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modfol.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Folha de Pagamento — código MODFOL. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODFOL/Fontes/ModFol.dpr.
- Evidência de aplicação própria: ModFol.dpr (título "Folha de Pagamento").
- Áreas funcionais (legendas do menu de MODFOL/Fontes/FPrincipal.pas ou fonte indicada): Relatórios; Layout e Importação de Arquivos TXT; Acerto da Quantidade de Dependentes; Eliminação de Lançamentos; Importação Direta de Dados; Verificação de Relatórios e Meios Magnéticos (RAIS: MODFOL/fParamRAISMagnetico.pas); Cadastros (Pessoal, Benefício por Período, Histórico de Alterações, Dependentes, Favorecidos, Transferência de Subordinação, Fotos, Centro de Custo, Situações Funcionais, Cargos, CBO, Profissões, Tipos de Trabalhador, Faixas Salariais, Graus de Instrução, Estabelecimentos, Sindicatos, Motivos e Ações).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODFOL/
- Entry point(s): MODFOL/Fontes/ModFol.dpr
- Menu principal: MODFOL/Fontes/FPrincipal.pas
- Subpastas e componentes: MODFOL/CtrlObjetos/, MODFOL/Fontes/, MODFOL/FontesMT/, MODFOL/Reports/, CMRHOBJ50/
- Configuração de pacotes: MODFOL/Fontes/ModFol.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. MODFOL/fParamRAISMagnetico_OLD.pas é versão antiga.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/); CmRHObj50 (CMRHOBJ50/); CMRegra50MT (CM/RegraMT/); CMIntBancoMT50 (CMINTBANCOMT50/); CMCapCarObj50 (CMCAPCAROBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMCAPCAROBJ50, CMINTBANCOMT50, FOLHA (search path), SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * É a folha de pagamento de empregados (RH), não a Folha de Benefícios (FOLHA). O search path aponta para a pasta FOLHA: o que vier de lá é dado referenciado ou componente, nunca motivo para juntar os módulos.
  * Cadastros repetidos de MODBAS (P-10).
  * Lançamentos contábeis da folha são importados por CONTAB ("Folha RM/Dinâmica/SRH Plus") e impostos por IRRF ("Folhas de Pagamento").
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modfol.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Folha de Pagamento" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 37
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Maior módulo de RH (708 arquivos): separar processamento de folha (cálculo, fechamento, obrigações) de cadastros.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modfol.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.38 RH — Cargos e Salários (`MODCES/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modces.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Cargos e Salários — código MODCES. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODCES/Fontes/ModCes.dpr.
- Evidência de aplicação própria: ModCes.dpr (título "RH - Cargos e Salários").
- Áreas funcionais (legendas do menu de MODCES/Fontes/FPrincipal.pas ou fonte indicada): Cargos; Grupos Funcionais; Fatores de Avaliação e Pesos; Graus dos Cargos; Classes e Faixas Salariais; Tabela Hay; Empresas/Entidades; Pesquisas Salariais; Fatores de Ajuste; Sindicatos; Encargos Sociais; Orçamento de Pessoal (Manpower); Alteração Funcional (registro, solicitação, análise); Simulação/Implementação de Aumentos; Correção Coletiva de Faixas; Pesquisa Salarial (dados, frequências e tendências, eliminação); Evolução Funcional; Distribuição de Pontuação e por Faixa; Orçamento do Custo de Pessoal.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODCES/
- Entry point(s): MODCES/Fontes/ModCes.dpr
- Menu principal: MODCES/Fontes/FPrincipal.pas
- Subpastas e componentes: MODCES/CtrlObjetos/, MODCES/DbObjetos/, MODCES/Fontes/, MODCES/FontesMT/, MODCES/Reports/
- Configuração de pacotes: MODCES/Fontes/ModCes.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmIntBancoMT50 (CMINTBANCOMT50/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMINTBANCOMT50, SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * "Solicitação/Análise de Alteração Funcional" também está em MODAUTO e MODATN: o PE é do módulo que o mantém; nos outros é canal.
  * Cargos e fatores de avaliação também estão em MODAVA e MODBAS (P-10).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modces.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Cargos e Salários" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 38
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modces.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.39 RH — Benefícios Sociais (`MODBEN/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modben.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Benefícios Sociais — código MODBEN. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODBEN/Fontes/ModBen.dpr.
- Evidência de aplicação própria: ModBen.dpr (título "RH - Benefícios Sociais").
- Áreas funcionais (legendas do menu de MODBEN/Fontes/FPrincipal.pas ou fonte indicada): Tipos de Benefício; Rubricas Salariais; Rubricas por Empresa; Registro de Benefícios; Relatórios; Histórico de Benefícios; Gráficos Fixos; Estatística de Benefícios.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODBEN/
- Entry point(s): MODBEN/Fontes/ModBen.dpr
- Menu principal: MODBEN/Fontes/FPrincipal.pas
- Subpastas e componentes: MODBEN/CtrlObjetos/, MODBEN/DbObjetos/, MODBEN/Fontes/, MODBEN/FontesMT/, MODBEN/Reports/
- Configuração de pacotes: MODBEN/Fontes/ModBen.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. CMMODBENSVR50/ (servidor de aplicação) está excluído.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmIntBancoMT50 (CMINTBANCOMT50/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMINTBANCOMT50, SHARED; servidor CMMODBENSVR50.
- Riscos de dupla contagem específicos deste módulo:
  * Benefícios sociais de empregados (RH) não são benefícios previdenciários (BENEFICIOPREV).
  * Rubricas salariais podem ser de MODFOL: dono único.
  * Solicitações de benefício em MODAUTO ("Plano de Saúde", "Ticket", "Benefício APCEF") são canal.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modben.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Benefícios Sociais" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 39
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Módulo pequeno (13 units): confirmar a fronteira própria.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modben.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.40 RH — Administração de Desempenho (`MODAVA/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modava.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Administração de Desempenho — código MODAVA. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODAVA/Fontes/ModAva.dpr.
- Evidência de aplicação própria: ModAva.dpr (título "RH - Administração de Desempenho").
- Áreas funcionais (legendas do menu de MODAVA/Fontes/FPrincipal.pas ou fonte indicada): Cargos; Grupos Funcionais; Grupos de Fatores e Fatores de Avaliação; Pesos Grupos × Fatores; Tipos de Avaliação; Registro de Avaliações de Desempenho e de Outras Avaliações; Histórico; Evolução e Potencial; Gráficos Fixos; Estatística de Avaliações.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODAVA/
- Entry point(s): MODAVA/Fontes/ModAva.dpr
- Menu principal: MODAVA/Fontes/FPrincipal.pas
- Subpastas e componentes: MODAVA/CtrlObjetos/, MODAVA/DbObjetos/, MODAVA/Fontes/, MODAVA/FontesMT/, MODAVA/Reports/
- Configuração de pacotes: MODAVA/Fontes/ModAva.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. CMMODAVASVR50/ (servidor de aplicação) está excluído.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmIntBancoMT50 (CMINTBANCOMT50/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMINTBANCOMT50, SHARED; servidor CMMODAVASVR50.
- Riscos de dupla contagem específicos deste módulo:
  * Cargos, grupos funcionais e fatores repetidos em MODCES (P-10).
  * MODATN registra avaliações por formulários deste módulo (canal).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modava.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Administração de Desempenho" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 40
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modava.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.41 RH — Treinamento (`MODTRN/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modtrn.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Treinamento — código MODTRN. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODTRN/Fontes/ModTrn.dpr.
- Evidência de aplicação própria: ModTrn.dpr (título "Treinamento").
- Áreas funcionais (legendas do menu de MODTRN/Fontes/FPrincipal.pas ou fonte indicada): Cursos; Instrutores Internos; Orçamento; Certificado; Pacotes de Cursos; Grupos de Treinamento; Cursos Requeridos por Cargo; Tipos de Cursos; Siglas; Fatores de Avaliação de Treinamento; Escalas de Conceitos; Assinaturas; Empresas/Entidades; Localizações; Registro de Incentivos e de Treinamento; Lista de Presença; Avaliações dos Participantes; Registro de Certificado; Histórico; Gráficos e Estatísticas; Avaliações dos Cursos.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODTRN/
- Entry point(s): MODTRN/Fontes/ModTrn.dpr
- Menu principal: MODTRN/Fontes/FPrincipal.pas
- Subpastas e componentes: MODTRN/CtrlObjetos/, MODTRN/DBobjects/, MODTRN/Fontes/, MODTRN/FontesMT/, MODTRN/Reports/
- Configuração de pacotes: MODTRN/Fontes/ModTrn.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * MODAUTO referencia MODTRN no search path (registro individual/coletivo de treinamento): canal.
  * "Assinaturas" pode ser o mesmo dado de SHARED/ModComp (uDbAssinatura).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modtrn.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Treinamento" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 41
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modtrn.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.42 RH — Recrutamento e Seleção (`MODRES/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modres.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Recrutamento e Seleção — código MODRES. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODRES/Fontes/ModRes.dpr.
- Evidência de aplicação própria: ModRes.dpr (título "RH - Recrutamento e Seleção").
- Áreas funcionais (legendas do menu de MODRES/Fontes/FPrincipal.pas ou fonte indicada): Importa TXT de Candidatos; Candidatos; Fontes de Recrutamento; Instituição de Ensino; Agente de Integração; Tipos de Experiência e de Avaliação/Teste/Entrevista; Experiências e Avaliações Requeridas por Cargo; Requisição de Pessoal; Testes e Entrevistas; Experiências; Cursos de Candidatos; Eliminação de Candidatos e Requisições; Histórico; Seleção de Candidatos; Estatísticas (fonte de recrutamento, demissões).
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODRES/
- Entry point(s): MODRES/Fontes/ModRes.dpr
- Menu principal: MODRES/Fontes/FPrincipal.pas
- Subpastas e componentes: MODRES/CtrlObjetos/, MODRES/Fontes/, MODRES/FontesMT/, MODRES/Reports/
- Configuração de pacotes: MODRES/Fontes/ModRes.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmIntBancoMT50 (CMINTBANCOMT50/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMINTBANCOMT50, SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * Candidatos e requisição de pessoal também em MODAUTO e MODATN (canal).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modres.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Recrutamento e Seleção" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 42
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modres.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.43 RH — Medicina do Trabalho (`MODASM/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modasm.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Medicina do Trabalho — código MODASM. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODASM/Fontes/ModAsm.dpr.
- Evidência de aplicação própria: ModAsm.dpr (título "RH - Medicina de Trabalho"); contém cópia MODASM/Fontes/Fontes/ModAcesso.dpr.
- Áreas funcionais (legendas do menu de MODASM/Fontes/FPrincipal.pas ou fonte indicada): Ocorrências e Exames Médicos; CID; Periodicidade dos Exames; PPRA (ações recomendadas, agentes de risco, meios de propagação, classes de bens e bens patrimoniais, localizações, avaliações); CIPA e funções dos membros; Registro de Ocorrência Médica; Condição Diferenciada de Trabalho; Histórico; Gráficos; Análise Multidimensional; Estatística.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODASM/
- Entry point(s): MODASM/Fontes/ModAsm.dpr
- Menu principal: MODASM/Fontes/FPrincipal.pas
- Subpastas e componentes: MODASM/CtrlObjetos/, MODASM/DbObjetos/, MODASM/Fontes/, MODASM/FontesMT/, MODASM/Reports/
- Configuração de pacotes: MODASM/Fontes/ModAsm.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. MODASM/Fontes/Fontes/ModAcesso.dpr é cópia do programa de MODACESSO: não contar aqui.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMRHOBJUTIL50 (search path), SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * "Ocorrências e Exames (Motivos de Abono)" também está em MODACESSO: dono único.
  * Bens patrimoniais do PPRA podem ser de CAF.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modasm.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Medicina do Trabalho" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 43
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modasm.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.44 RH — Controle de Ponto e Acesso (`MODACESSO/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modacesso.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Controle de Ponto e Acesso — código MODACESSO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODACESSO/Fontes/ModAcesso.dpr.
- Evidência de aplicação própria: ModAcesso.dpr (título "Controle de Ponto e Acesso"); fora de 3-Sistemas.bpg.
- Áreas funcionais (legendas do menu de MODACESSO/Fontes/fPrincipal.pas ou fonte indicada): Gravação de Cartões; Estação; Localização; Ocorrências e Exames (Motivos de Abono); Registro de Acesso; Quantidade Permitida de Acessos; Quem Marca Ponto; Registro Individual de Acesso; Controle Individual do Ponto; Lançamento Coletivo do Ponto; Banco de Horas; Revezamento de Horários; Estatística de Motivos de Ausência.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODACESSO/
- Entry point(s): MODACESSO/Fontes/ModAcesso.dpr
- Menu principal: MODACESSO/Fontes/fPrincipal.pas
- Subpastas e componentes: MODACESSO/CtrlObjetos/, MODACESSO/Fontes/, MODACESSO/FontesMT/, MODACESSO/Reports/, CMRHOBJUTIL50/
- Configuração de pacotes: MODACESSO/Fontes/ModAcesso.dof
- Documentação funcional: NÃO existe para este módulo. Use o código como fonte principal; o que não puder ser confirmado no código fica INFERIDO ou PENDENTE.
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto. Usa CMRHOBJUTIL50 (search path; pasta Biometria), versão paralela de CMRHOBJ50.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CMTotalPrev50 (CM/TotalPrev/); CmBack50 (CMBACK/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJUTIL50 (search path), SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * Motivos de abono compartilhados com MODASM.
  * Horas extras e atrasos também aparecem em MODATN ("Horas Extras e Atrasos"): canal.
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modacesso.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Controle de Ponto e Acesso" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 44
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Fora de 3-Sistemas.bpg: confirmar que o módulo continua em uso.
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modacesso.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

### 11.45 RH — Autoatendimento do Empregado (`MODAUTO/`)

> Categoria: **Contar individualmente** · Onda 8 · Aba: `docs1/pontos-de-funcao/modauto.html` (a criar)

```text
Você é analista sênior de métricas de software. EXECUTAR a contagem SFP de UM único módulo do sistema legado Delphi 5
(suíte CM Contabilidade / FUNCEF): RH — Autoatendimento do Empregado — código MODAUTO. Não conte nenhum outro módulo nesta execução.

1. CONTEXTO DO MÓDULO (evidência do repositório)
- Programa(s): MODAUTO/Fontes/ModAuto.dpr.
- Evidência de aplicação própria: ModAuto.dpr (título "RH - Auto Atendimento").
- Áreas funcionais (legendas do menu de MODAUTO/Fontes/FPrincipal.pas ou fonte indicada): Admissão; Candidatos; Pessoal; Destacamento (tarifas, diárias, táxi, hospedagem, locação de veículo, aeroportos, itens de despesa, hotéis); Bloqueio de Usuários; Parâmetros de Integração; Serviços; Requisição de Pessoal; Treinamento (individual/coletivo); Alteração Funcional; Solicitações (férias, vale transporte, destacamento, plano de saúde, ticket, benefício APCEF, serviço ou produto de manutenção); Manutenção de APs e GRs; Integração de Destacamento; Desligamento; Reembolsos para a Empresa.
  As áreas são pista para localizar processos; não as copie como lista de PE.

2. CAMINHOS REAIS A ANALISAR
- Pasta do módulo: MODAUTO/
- Entry point(s): MODAUTO/Fontes/ModAuto.dpr
- Menu principal: MODAUTO/Fontes/FPrincipal.pas
- Subpastas e componentes: MODAUTO/CtrlObjetos/, MODAUTO/Fontes/, MODAUTO/FontesMT/, MODAUTO/Reports/
- Configuração de pacotes: MODAUTO/Fontes/ModAuto.dof
- Documentação funcional disponível (fonte primária): docs/site/modules/modulos-previdenciarios/index.html
- Documentação transversal (apoio): docs/business-rules-catalog.html, docs/database-model.html, docs/system-overview.html.

3. DEPENDÊNCIAS E FRONTEIRA
- Contagem junto/fronteira: Nada é contado junto.
- Pacotes de negócio declarados no .dof (avaliar na fronteira; não contar o pacote como aplicação): CMRegra50 (CM/Regra/); CmBack50 (CMBACK/); CmRHObj50 (CMRHOBJ50/).
- Componentes de framework também declarados (CMAdd50, CmCompo50, CmOld50, CmBussines50, CmForms50, CmRelatsOld50, CMResource50, CMPrincipal50, CMRad50, CMCrypto) são infraestrutura: não geram PE nem AL.
- Dependências registradas no inventário (analise_modulos_APF.md, seção 5): CMRHOBJ50, CMCAPCARUTILOBJ50, MODTRN (search path), SHARED.
- Riscos de dupla contagem específicos deste módulo:
  * Muitas solicitações são canal para MODTRN, MODCES, MODRES e MODBEN: conte aqui só o que tem dado próprio (por exemplo, destacamento e reembolsos) ou processo distinto para o empregado.
  * Não confundir com AUTOATENDIMENTO (portal do participante da previdência).
  * APs/GRs viram documentos de CPAGAR / CRECEBER (referenciados).
- Regra geral: um AL conta como "Mantido" só no módulo dono; nos demais aparece como "Referenciado (dono)". Uma chamada ou
  integração entre módulos não gera SFP sozinha. A mesma capacidade não é contada duas vezes por aparecer em telas ou canais diferentes.

4. MODELO A SEGUIR
- Estrutura e visual: docs1/pontos-de-funcao/folha.html. Replique as 8 seções numeradas (1 Identificação da contagem,
  2 Sumário executivo, 3 Inventário de PE, 4 Inventário de AL, 5 Memória de cálculo, 6 Rastreabilidade, 7 Integrações e
  dupla contagem, 8 Pendências) e o bloco "🔗 Navegação"; use ../assets/css/style.css e as classes section-title, table-wrap,
  stats/stat, pf-block, note, ev ev-comprovado / ev ev-inferido / ev ev-pendente. Badge: "Blueprint AS-IS — Delphi 5 — <issue desta execução>".
- Critérios: docs1/pontos-de-funcao/metodologia.html.
- NÃO copie PE, AL, textos funcionais, totais ou interpretação da Folha. Só a estrutura e o visual.
- NÃO repita os problemas F-1 a F-8 da seção 7.3 de analise_modulos_APF.md: sem capacidade contada duas vezes; lookup de apoio não é PE;
  a fonte citada tem de corresponder ao processo; subtotal confirmado separado do preliminar; todo PE com fonte; dono único para dado compartilhado.

5. MÉTODO — EXCLUSIVAMENTE SFP
- Identifique apenas Processos Elementares (PE) e Arquivos Lógicos (AL).
- Pesos: 4,6 SFP por PE e 7 SFP por AL (IFPUG SFP; Roteiro de Métricas do SISP v3.0). Total = (qtd_PE × 4,6) + (qtd_AL × 7), sem fator de ajuste.
- Não classifique PE ou AL em subtipos, não aplique níveis de complexidade, não conte campos, registros ou arquivos referenciados,
  não use tabelas de peso nem siglas da APF tradicional.
- Delphi 5 é contexto técnico: não converta linhas, units, .dfm, procedures, botões, telas ou tabelas físicas em SFP.
- Cada elemento recebe situação COMPROVADO, INFERIDO ou PENDENTE, com fonte (documento ou unit/form). Mostre subtotal confirmado,
  subtotal preliminar e total.

6. ABA NA NAVEGAÇÃO "ANÁLISE DE PONTOS DE FUNÇÃO"
- Crie docs1/pontos-de-funcao/modauto.html (aba individual deste módulo). Se a página já existir, atualize-a em vez de criar outra.
- Insira o link "RH — Autoatendimento do Empregado" no <nav> de docs1/pontos-de-funcao/index.html, metodologia.html e de todas as páginas de módulo, na posição 45
  da tabela da seção 8 de analise_modulos_APF.md. Atualize o bloco "🔗 Navegação" das outras páginas de módulo.
- Em index.html: cartão do módulo, linha na tabela "Resumo comparativo" e totais da "Visão geral" (módulos, PE, AL, SFP, memória de
  cálculo). Não altere os números dos outros módulos.
- Em metodologia.html: linha deste módulo na tabela de escopo/fronteiras e, se houver, na tabela de dupla contagem.

7. PENDÊNCIAS ESPECÍFICAS A INVESTIGAR
- docs/system-overview.html e docs/site/modules/modulos-previdenciarios/index.html classificam os módulos MOD* como "módulos previdenciários", mas os títulos dos programas (Application.Title) dizem "RH - ...". Trate como Recursos Humanos e registre a correção (P-09).
- Sem evidência suficiente → registre como PENDENTE na seção 8 da aba. Não invente funções, dados, fronteiras ou dependências.

8. RESTRIÇÕES
- Não altere código-fonte (nenhum .pas, .dfm, .dpr, .dpk, .dof, .cfg, .sql).
- Não altere a documentação funcional dos módulos (docs/, docs1/<módulo>/, Analise_*.md).
- Arquivos que podem ser alterados: docs1/pontos-de-funcao/modauto.html e, só para navegação e totais, docs1/pontos-de-funcao/index.html,
  docs1/pontos-de-funcao/metodologia.html e as demais páginas de módulo em docs1/pontos-de-funcao/.

9. RELATÓRIO FINAL (responda no fim da execução)
- Arquivos criados e alterados (caminho completo), confirmando que nenhum código-fonte nem documentação funcional foi alterado.
- Quantidade de PE e AL, subtotal confirmado, subtotal preliminar e total SFP, com a memória de cálculo.
- AL referenciados e seus donos; riscos de dupla contagem e a decisão tomada em cada um.
- Pendências abertas e o impacto possível de cada uma no total.
```

## 12. Pendências

### 12.1 Pendências de validação (afetam fronteira ou dono)

| ID | Pendência | Pastas | Por que importa | Quem valida |
|---|---|---|---|---|
| P-01 | Dono funcional de `BENEFBFCIARIO` e `PROCESSOBENEF` | FOLHA, BENEFICIOPREV | 14 SFP contados em dobro hoje | Especialista previdenciário |
| P-02 | PROCJUD, PROCPREV e MODCON são aplicações próprias ou visões por matéria (judicial, previdenciária, trabalhista) do jurídico consolidado SISTJURCONS? | SISTJURCONS, PROCJUD, PROCPREV, MODCON | Menus quase iguais e units compartilhadas; risco alto de contar o processo judicial quatro vezes | Área jurídica |
| P-03 | Versão vigente do Ativo Fixo: CAF (em `3-Sistemas.bpg`) ou CAFMT (mais funções no menu)? | CAF, CAFMT | Mesmo título "Ativo Fixo"; contar uma vez | TI / patrimônio |
| P-04 | FINANCIAMENTO é módulo próprio ou parte de ALIENACAO? | FINANCIAMENTO, ALIENACAO | Menus repetem contrato de venda e parcelas | Área imobiliária |
| P-05 | INVESTFDO é aplicação própria ou parte de INVESTIMENTOS (submódulo Fundos)? | INVESTFDO, INVESTIMENTOS | Fora de `3-Sistemas.bpg`; usa fontes de INVESTIMENTOS | Área de investimentos |
| P-06 | FLASHRPT (Flash Report de hotelaria) é aplicação própria, parte de INDICADORES ou obsoleto? | FLASHRPT, INDICADORES | Domínio hoteleiro comum | Área imobiliária |
| P-07 | INTEGRASAF é aplicação própria ou a mesma função do menu "SAF" de CONTAB? | INTEGRASAF, CONTAB | Possível duplicidade de importação | Contabilidade |
| P-08 | Programas de cliente específico (FUNCEF, REFER, EXPORTFCRT, SIMULADORFCRT): vigentes? Suas funções vão para os módulos donos ou formam fronteira própria? | FUNCEF, REFER, EXPORTFCRT, SIMULADORFCRT | Repetem funções de EMPRESTIMO, IRRF, CONTRIBUICAOPREV, ASSISTENCIAL, PROJETOATUARIAL | Negócio / TI |
| P-09 | Corrigir a classificação dos módulos MOD* como "previdenciários" em `docs/system-overview.html` e `docs/site/modules/modulos-previdenciarios/` (os títulos dizem "RH - ...") | MOD* | Classificação de domínio errada na documentação de apoio | Documentação (fora deste escopo) |
| P-10 | Dono do cadastro de pessoal e das tabelas básicas de RH (cargos, profissões, estabelecimentos, sindicatos) | MODBAS, MODFOL, MODCES, MODAVA | Cadastros repetidos em vários menus de RH | RH |
| P-11 | EPIM, EPIMIMOB e FUNCOESGERAIS: cópias órfãs (sem projeto que as referencie) ou fonte vigente? | EPIM, EPIMIMOB, FUNCOESGERAIS | Se vigentes, entram como fronteira de CMIMOBILIARIOOBJ50 ou de CAF / INVESTIMENTOS | TI |
| P-12 | FUNCEF.WebEmprestimo (.NET) é aplicação com fronteira própria ou canal web do EMPRESTIMO? | FUNCEF.WebEmprestimo, EMPRESTIMO | Mesmos dados de empréstimo | Negócio / TI |
| P-13 | RELATORIOSCM (gerador genérico de relatórios, consultas e gráficos): os relatórios configurados são requisitos funcionais de alguma aplicação ou ferramenta técnica? | RELATORIOSCM, CMRELATORIOOBJ50 | Ferramenta genérica pode não ter PE de negócio próprio | Negócio |
| P-14 | Dono de patrocinadora, plano previdenciário e pessoa: GLOBALCM, PARAMPREV ou CADASTROPREV? | GLOBALCM, PARAMPREV, CADASTROPREV | Os três têm esses cadastros no menu; FOLHA os trata como externos | Especialista previdenciário |
| P-15 | AUTOATENDIMENTO: portal web, GerenciaAA e AutoEmprestimo formam uma aplicação? AutoEmprestimo é canal de EMPRESTIMO? | AUTOATENDIMENTO, EMPRESTIMO | Fronteira do canal web | Negócio / TI |
| P-16 | Dono dos dados comuns de contas a pagar e a receber (alteradores, históricos, documentos) | CPAGAR, CRECEBER, CMCAPCAROBJ50, CMCAPCARUTILOBJ50 | Menus simétricos e pacotes compartilhados | Financeiro |
| P-17 | Dono de produto, grupo de produto, unidade de medida e fornecedor | ALMOXARIFADO, COMPRAS2000, RECMERC, SCQ, GLOBALCM | Cadastros repetidos em vários menus | Suprimentos |
| P-18 | Dono do cadastro de imóveis | ADMINIMOB, INVESTIMOB, ALIENACAO, INDICADORES | "Imóveis" aparece em três menus | Área imobiliária |
| P-19 | Relação entre INVESTCOTAS, COTAS e COTASPATRIM (mesmo conceito de cota?) | INVESTCOTAS, COTAS, COTASPATRIM | Possível sobreposição de cálculo de cotas | Área de investimentos |

### 12.2 Limitações do inventário

- A classificação usa evidência estática (projetos, títulos, menus, pacotes, nomes de arquivos). Nenhum programa foi executado e nenhum usuário foi consultado.
- As legendas de menu foram lidas dos `.dfm` principais. Menus montados em tempo de execução (por exemplo `ALMOXARIFADO/Fontes/FPrincipal.dfm`, sem legendas) não aparecem.
- Os pacotes vêm da linha `Packages=` dos `.dof`, que pode estar desatualizada em relação ao que é implantado; `SCQ/Fontes/` não tem `.dof`.
- Cópias e versões antigas (`*OLD.dpr`, `Packages - Cópia`, `SourceOld`) foram identificadas por nome, sem comparar conteúdo linha a linha.
- `docs/site/modules/*` (PFC-3) tem cobertura desigual: CONTAB e EMPRESTIMO são aprofundados, os demais são resumos de cerca de 22 KB.
- Os nomes funcionais dos módulos sem documentação vêm do `Application.Title` e do menu; o significado de siglas (por exemplo R.U.B.S., SIACC, DAIEA) não foi confirmado.

### 12.3 Validação desta entrega

- **Cobertura:** as 119 pastas de primeiro nível (listagem do repositório sem `.git`) estão no inventário — conferido por script (conjunto da listagem = conjunto do inventário).
- **Personalização:** 45 prompts, um por módulo da categoria 1. Cada um traz entry point, menu, subpastas, pacotes declarados no próprio `.dof`, riscos de dupla contagem e pendências próprios.
- **Método:** o documento usa só os termos PE e AL. As siglas, a complexidade e as tabelas de peso da APF tradicional não aparecem como componentes de contagem (conferido por busca textual).
- **Caminhos:** todos os caminhos de repositório citados entre crases foram conferidos por script. As abas novas, ainda inexistentes, estão marcadas "(a criar)".
- **Preservação:** `git status` após a geração mostra só `analise_modulos_APF.md` como arquivo novo.

## 13. Premissas

1. **Método:** SFP com pesos 4,6 (PE) e 7 (AL), conforme IFPUG SFP e Roteiro SISP v3.0, como em `docs1/pontos-de-funcao/metodologia.html`. O nome do arquivo (APF) não muda o método.
2. **Fronteira = aplicação de negócio percebida pelo usuário.** O ponto de partida é um programa `.dpr` com título de negócio. Pacotes, bibliotecas, servidores de aplicação e pastas de fontes não são fronteiras.
3. **Dono único:** cada grupo de dados conta como AL "Mantido" em um só módulo e como "Referenciado" nos demais; cada capacidade conta como PE no módulo que a expõe e a mantém.
4. **Canais** (CENTRALAP, AUTOATENDIMENTO, MODAUTO, MODATN) contam só os PE com resultado distinto para o seu usuário; a consulta igual à do módulo dono não é recontada.
5. **Documentação funcional é a fonte primária**; o código Delphi 5 é evidência auxiliar e vira fonte principal só onde não há documentação (com situação INFERIDO quando não houver confirmação).
6. **Delphi 5 e a tecnologia futura não influenciam a contagem.**
7. **Nada foi contado nesta entrega.** Números citados (276, 241,4, 232, 749,4 SFP) são das análises PFC-48 já existentes.
8. **Classificações da categoria 5** são provisórias e não têm prompt até a validação; a recomendação de cada uma está na coluna "Próxima ação" (seção 5).
9. **Data de referência:** 2026-11-12, branch `incident/pfc-49`.
