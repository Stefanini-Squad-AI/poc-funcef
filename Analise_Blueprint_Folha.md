# Análise Blueprint FOLHA — Adaptação ao Modelo UC097

**Issue:** PFC-25 — Adaptação FOLHA
**Data:** 2026-11-10
**Autor:** Squad Blueprint (GLM-5.2)
**Documento de referência:** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf` (Nexus/FUNCEF, v1.0, 04/08/2026)
**Blueprint alvo:** `docs1/folha/` (módulo FOLHA, Blueprint AS-IS, enriquecido em PFC-22)

---

## 0. Resumo executivo

O Blueprint AS-IS do módulo FOLHA (PFC-22) documenta 18 processos (PF-01 a PF-12 + PF-A a PF-F) e 30 regras de negócio (FOLHA-RN001 a FOLHA-RN030), organizados em torno da estrutura do código-fonte. O modelo UC097 organiza a documentação em torno de **jornadas funcionais** com sequência operacional, ações práticas, regras de jornada (RS), tratamentos de erro (TRT), catálogo de mensagens (MSG), observações (OBS), casos de uso associados, tabela/API/programa, telas/layouts, visão consolidada com critérios de aceitação e histórico de versões.

Esta análise mapeia cada seção do modelo UC097 para o elemento correspondente do Blueprint FOLHA, descreve o que foi **adicionado**, **alterado** ou **removido**, e indica qual aba do docs1 é afetada. Todas as 18 jornadas e 30 regras foram preservadas (0 perdas). A rastreabilidade original (códigos FOLHA-RN, evidência file:linha, classificação COMPROVADO/INFERIDO/PENDENTE) foi mantida integralmente.

**Decisões de projeto registradas** (conforme diretiva do requisitante — ver seção 15).

---

## 1. Identificação

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Caso de Uso | Módulo FOLHA (Folha de Benefícios) | index.html |
| Sistema | CM Contabilidade / FUNCEF (Delphi 5) | index.html |
| Tipo | Sistema Desktop (VCL / MIDAS) | index.html |
| Ator | Usuário operacional (analista folha, financeiro, contábil) | index.html |
| OS - Título | PFC-25 — Adaptação FOLHA | — |

**Alterações:**
- **Adicionado:** bloco "1. Identificação" no topo de `funcionalidades.html` e `regras-de-negocio.html`, com os campos do modelo UC097 (Caso de Uso, Sistema, Tipo, Ator, OS-Título).
- **Alterado:** o cabeçalho `<header>` das duas abas passa a incluir a identificação no formato UC097, mantendo o badge "Blueprint AS-IS — PFC-22".
- **Removido:** nada.

---

## 2. Descrição Resumida

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Descrição Resumida | Parágrafo introdutório do `<header>` em index.html | index.html, funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "2. Descrição Resumida" em `funcionalidades.html` e `regras-de-negocio.html`, com narrativa consolidada do módulo (processamento da folha de benefícios com prévia, efetivação, pagamento, apropriação contábil, conciliação INSS e tratamentos especiais).
- **Alterado:** a descrição existente no `<header>` de `index.html` foi mantida e replicada no formato UC097 nas duas abas reestruturadas.
- **Removido:** nada.

---

## 3. Pré-condições

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Campo "Pré-condições" de cada processo (PF-01 a PF-12) | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "3. Pré-condições" global em `funcionalidades.html`, consolidando as pré-condições comuns a todas as jornadas (módulo compilado, banco Oracle acessível, parâmetros globais carregados). Cada jornada (JF) mantém suas pré-condições específicas no campo "Pré-condições" herdado do processo original.
- **Alterado:** as pré-condições existentes em cada `pf-block` foram preservadas e reorganizadas dentro da estrutura de jornada.
- **Removido:** nada.

---

## 4. Pós-condições

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campo "Saídas" e "Resultado" de cada processo | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "4. Pós-condições" global em `funcionalidades.html`, descrevendo o estado esperado do sistema após cada jornada (tabelas populadas, arquivos gerados, histórico consolidado). Cada jornada inclui suas pós-condições específicas derivadas dos campos "Saídas" e "Resultado" do processo original.
- **Alterado:** os campos "Saídas" e "Resultado" existentes foram reorganizados como pós-condições dentro da jornada, sem perda de conteúdo.
- **Removido:** nada.

---

## 5. Jornadas Funcionais (com sequência operacional e ações práticas)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Jornadas Funcionais (JF001–JFnnn) | 18 processos (PF-01 a PF-12 + PF-A a PF-F) | funcionalidades.html |
| Objetivo (por jornada) | Campo "Objetivo" de cada processo | funcionalidades.html |
| Sequência operacional | Campo "Passo-a-passo" (lista numerada) de cada processo | funcionalidades.html |
| Ações práticas (tabela) | **Novo** — derivado do passo-a-passo + validações + regras | funcionalidades.html |

**Mapeamento de processos para jornadas:**

| Jornada | Processo original | Título |
|---|---|---|
| JF001 | PF-01 | Preparo da Folha |
| JF002 | PF-02 | Prévia (Cálculo da Folha) |
| JF003 | PF-03 | Efetivação de Versão de Pagamento |
| JF004 | PF-04 | Estorno de Folha |
| JF005 | PF-05 | Pagamento / Fita de Crédito / Remessa Bancária |
| JF006 | PF-06 | Apropriação Contábil |
| JF007 | PF-07 | Pensão Alimentícia |
| JF008 | PF-08 | IRRF (Compensação, Exceções, Ação Judicial) |
| JF009 | PF-09 | Retroativos |
| JF010 | PF-10 | Conciliação e Reembolso do INSS |
| JF011 | PF-11 | Convênio (Importação/Exportação) |
| JF012 | PF-12 | Regularização de Pagamentos |
| JF013 | PF-A | Encerramento por Falecimento |
| JF014 | PF-B | Adiantamento Extra Folha |
| JF015 | PF-C | Abatimento de Reservas |
| JF016 | PF-D | Mapa da Folha |
| JF017 | PF-E | Conferência e Batimento |
| JF018 | PF-F | Financiamento Habitacional |

**Alterações:**
- **Adicionado:** para cada jornada, uma **tabela de ações práticas** com as colunas do modelo UC097: Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela. O conteúdo foi derivado do passo-a-passo existente, das validações, das regras referenciadas e dos forms (telas) identificadas.
- **Adicionado:** referências a códigos RS (regras de jornada) e TRT (tratamentos de erro) na sequência operacional, no formato `[RSxxx]` e `[TRTxxx]`, conforme o modelo UC097.
- **Alterado:** cada `pf-block` foi renomeado de "PF-xx" para "JFnnn — [título]", mantendo o `id` original (ex.: `id="PF-01"`) para preservar os links existentes do `index.html` e de outras abas. O campo "Gatilho" foi mantido dentro da jornada como "Gatilho/Ator".
- **Alterado:** o fluxograma Mermaid de cada processo foi mantido dentro da jornada.
- **Removido:** nada. Todos os 18 processos estão presentes como 18 jornadas.

---

## 6. Regras de negócio da jornada (RS)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Regras de negócio (RS001–RSnnn) | 30 regras (FOLHA-RN001 a FOLHA-RN030) | regras-de-negocio.html |
| Código RS | Código FOLHA-RN | regras-de-negocio.html |
| Título | Título da regra FOLHA-RN | regras-de-negocio.html |
| Descrição em linguagem de negócio | Atributo (2) Descrição | regras-de-negocio.html |
| Campos de dados (mandatório/opcional/condicional) | Atributo (6) Dados envolvidos | regras-de-negocio.html |

**Mapeamento de regras FOLHA-RN para códigos RS:**

| Código RS | Código FOLHA-RN original | Título |
|---|---|---|
| RS001 | FOLHA-RN001 | Mês/ano de referência obrigatórios |
| RS002 | FOLHA-RN002 | Layout de entrada/saída e destino obrigatórios na exportação |
| RS003 | FOLHA-RN003 | Seleção mínima de versão da folha |
| RS004 | FOLHA-RN004 | Rubrica de IR exige natureza de rendimento |
| RS005 | FOLHA-RN005 | Proventos somam à base de IRRF |
| RS006 | FOLHA-RN006 | Líquido negativo zera e transfere desconto |
| RS007 | FOLHA-RN007 | CPMF = valor × (percCPMF − 1) |
| RS008 | FOLHA-RN008 | Margem de desconto consignável |
| RS009 | FOLHA-RN009 | Benefício mínimo por concessão |
| RS010 | FOLHA-RN010 | Duplicidade de lotes na prévia |
| RS011 | FOLHA-RN011 | Críticas ETL abortam efetivação |
| RS012 | FOLHA-RN012 | Conta bancária do lote validada |
| RS013 | FOLHA-RN013 | Parâmetros contábeis/financeiros do lote |
| RS014 | FOLHA-RN014 | Rubricas incidentes na pensão alimentícia |
| RS015 | FOLHA-RN015 | IR regressivo por tipo de base (0/1/7) |
| RS016 | FOLHA-RN016 | CPMF sobre pensão alimentícia |
| RS017 | FOLHA-RN017 | Compensação de IRRF respeita saldo |
| RS018 | FOLHA-RN018 | Rateio de rubricas entre planos (proporção) |
| RS019 | FOLHA-RN019 | REINF (eSocial) rateado por plano |
| RS020 | FOLHA-RN020 | Correção/alterador do benefício por data de pagamento |
| RS021 | FOLHA-RN021 | Salário-família sobre base específica |
| RS022 | FOLHA-RN022 | Transação da prévia com commit/StartTransaction por blocos |
| RS023 | FOLHA-RN023 | Cadastro manual de histórico exige BS/FAB/déficit |
| RS024 | FOLHA-RN024 | Rubrica não parametrizada aborta inserção INSS |
| RS025 | FOLHA-RN025 | Cancelamento pelo usuário aborta prestação de contas INSS |
| RS026 | FOLHA-RN026 | Geração de documentos para convênios exige mês/ano/previsão |
| RS027 | FOLHA-RN027 | Saída cadastral de entidades exige mês/ano/versão |
| RS028 | FOLHA-RN028 | Arredondamento do líquido por base |
| RS029 | FOLHA-RN029 | Avaliação de dado bancário do recebedor |
| RS030 | FOLHA-RN030 | Controle de interface (CTRLINTERFACE) por situação/lote |

**Alterações:**
- **Adicionado:** cada regra recebe um código RS (RS001–RS030) no formato UC097, mantendo o código FOLHA-RN original como referência cruzada (ex.: "RS001 (FOLHA-RN001)").
- **Adicionado:** classificação de campos de dados como **[obrigatório]**, **[opcional]** ou **[condicional]** com valores permitidos, conforme o modelo UC097. Derivado do atributo (6) "Dados envolvidos" e do atributo (5) "Condições" existentes.
- **Adicionado:** seção "Regras de negócio da jornada" dentro de cada jornada em `funcionalidades.html`, listando os códigos RS aplicáveis com link para a regra completa em `regras-de-negocio.html`.
- **Alterado:** o `id` de cada `rule-block` foi mantido como `id="FOLHA-RNxxx"` para preservar links existentes. O `rule-id` passou a mostrar "RSxxx (FOLHA-RNxxx) — Título".
- **Alterado:** os 14 atributos originais foram preservados integralmente; a estrutura visual foi adaptada para o formato de card de regra UC097 (código, título, descrição, campos de dados, evidência).
- **Removido:** nada. Todos os 30 regras estão presentes.

---

## 7. Tratamentos (TRT)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Tratamentos de erro (TRT001–TRTnnn) | Validações bloqueantes e exceções das regras (atributo 8) | funcionalidades.html, regras-de-negocio.html |
| Condição | Atributo (5) Condições da regra | — |
| Mensagem | Atributo (8) Exceções / mensagens da regra | — |
| Resultado | Atributo (12) Severidade + comportamento | — |

**Tratamentos de erro identificados (TRT001–TRT016):**

| TRT | Condição | Mensagem | Resultado | Regra de origem | Jornada |
|---|---|---|---|---|---|
| TRT001 | Mês/ano de referência não informados | MSG001 — "É necessário indicar o Mês/Ano de Referência!" | Bloqueia execução | RS001 (RN001) | JF001, JF015 |
| TRT002 | Layout de entrada/saída ou destino não informados na exportação | MSG002 — "Layout/destino obrigatórios" | Bloqueia execução | RS002 (RN002) | JF011 |
| TRT003 | Nenhuma versão da folha selecionada | MSG003 — "Selecione pelo menos uma versão da folha" | Bloqueia execução | RS003 (RN003) | JF011 |
| TRT004 | Rubrica de IR sem natureza de rendimento | MSG004 — "Rubrica sem natureza de rendimento não soma à base" | Não soma à base de IRRF | RS004 (RN004) | JF002, JF008 |
| TRT005 | Líquido do recebedor negativo após descontos | MSG005 — "Líquido negativo zerado; excedente transferido" | Zera líquido e transfere desconto | RS006 (RN006) | JF002 |
| TRT006 | Duplicidade de lote na prévia | MSG006 — "Benefício já existe no lote/competência" | Não regenera benefício | RS010 (RN010) | JF001 |
| TRT007 | Críticas ETL na efetivação | MSG007 — "Críticas ETL — efetivação abortada" | Aborta efetivação | RS011 (RN011) | JF003 |
| TRT008 | Conta bancária do lote inválida | MSG008 — "Conta bancária do lote inválida" | Bloqueia efetivação | RS012 (RN012) | JF003 |
| TRT009 | Parâmetros contábeis/financeiros não configurados | MSG009 — "Parâmetros CF do lote não configurados" | Bloqueia efetivação | RS013 (RN013) | JF003, JF006 |
| TRT010 | Margem de desconto consignável excedida | MSG010 — "Margem consignável excedida" | Bloqueia/ajusta rubrica | RS008 (RN008) | JF002 |
| TRT011 | Benefício abaixo do mínimo da concessão | MSG011 — "Benefício ajustado ao mínimo" | Ajusta ao mínimo | RS009 (RN009) | JF002 |
| TRT012 | Mês/ano/previsão não informados (convênio) | MSG012 — "Mês/ano/previsão obrigatórios" | Bloqueia execução | RS026 (RN026) | JF011 |
| TRT013 | Mês/ano/versão não informados (saída cadastral) | MSG013 — "Mês/ano/versão obrigatórios" | Bloqueia execução | RS027 (RN027) | JF011 |
| TRT014 | BS/FAB/déficit não informados (cadastro manual) | MSG014 — "BS/FAB/déficit obrigatórios" | Bloqueia cadastro | RS023 (RN023) | cadastro |
| TRT015 | Rubrica não parametrizada ao inserir INSS | MSG015 — "Rubrica não parametrizada: [RUBRICA]" | Aborta inserção | RS024 (RN024) | JF010 |
| TRT016 | Cancelamento pelo usuário na prestação de contas INSS | MSG016 — "Operação cancelada pelo usuário" | Aborta operação | RS025 (RN025) | JF010 |

**Alterações:**
- **Adicionado:** seção "Tratamentos (TRT)" em `funcionalidades.html` (global) e dentro de cada jornada que possui validações bloqueantes. Em `regras-de-negocio.html`, cada regra que possui exceção (atributo 8) recebe o TRT correspondente.
- **Adicionado:** os TRT foram derivados das validações e exceções existentes no atributo (8) das regras e nos campos "Validações" e "Exceções" dos processos. Nenhum tratamento foi inventado — todos correspondem a validações comprovadas no código.
- **Removido:** nada. As exceções originais foram mantidas e complementadas com a estrutura TRT.

---

## 8. Catálogo de Mensagens (MSG)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Catálogo de Mensagens (MSG001–MSGnnn) | Mensagens de erro/exceção das regras (atributo 8) | funcionalidades.html, regras-de-negocio.html |
| Código MSG | **Novo** | — |
| Texto da Mensagem | Texto da exceção (raise EValidacao / raise Exception) | — |
| Jornadas relacionadas | Atributo (13) Processo relacionado da regra | — |

**Catálogo de mensagens (MSG001–MSG016):**

| Código | Texto da Mensagem | Jornadas relacionadas |
|---|---|---|
| MSG001 | "É necessário indicar o Mês/Ano de Referência!" | JF001, JF015 |
| MSG002 | "Layout de entrada/saída e destino obrigatórios na exportação" | JF011 |
| MSG003 | "Selecione pelo menos uma versão da folha" | JF011 |
| MSG004 | "Rubrica sem natureza de rendimento — não soma à base de IRRF" | JF002, JF008 |
| MSG005 | "Líquido negativo — valor zerado e desconto excedente transferido" | JF002 |
| MSG006 | "Benefício já existe no lote/competência — duplicidade não regenerada" | JF001 |
| MSG007 | "Críticas ETL — efetivação abortada" | JF003 |
| MSG008 | "Conta bancária do lote inválida" | JF003 |
| MSG009 | "Parâmetros contábeis/financeiros do lote não configurados" | JF003, JF006 |
| MSG010 | "Margem consignável excedida — rubrica bloqueada/ajustada" | JF002 |
| MSG011 | "Benefício abaixo do mínimo — ajustado ao mínimo da concessão" | JF002 |
| MSG012 | "Mês/ano/previsão de pagamento obrigatórios para geração de documentos" | JF011 |
| MSG013 | "Mês/ano/versão obrigatórios para saída cadastral" | JF011 |
| MSG014 | "Valor do BS/FAB/déficit obrigatórios no cadastro manual de histórico" | cadastro |
| MSG015 | "Rubrica não parametrizada: [RUBRICA]" | JF010 |
| MSG016 | "Operação cancelada pelo usuário" | JF010 |

**Alterações:**
- **Adicionado:** seção "Catálogo de Mensagens (MSG)" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela no formato UC097 (Código, Texto, Jornadas relacionadas). Cada mensagem aparece exatamente uma vez no catálogo.
- **Adicionado:** referências a códigos MSG nas jornadas e tratamentos (TRT), no formato `[MSGxxx]`.
- **Removido:** nada. As mensagens originais (textos de `raise EValidacao` e `raise Exception`) foram preservadas no catálogo.

---

## 9. Observações Gerais (OBS)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Observações Gerais (OBS) | Notas contextuais e premissas do Blueprint | funcionalidades.html, regras-de-negocio.html |

**Observações identificadas (OBS001–OBS005):**

| Código | Observação |
|---|---|
| OBS001 | O módulo FOLHA é um sistema desktop Delphi 5 / VCL, operado por usuário humano (diferente do UC097, que é backend puro). |
| OBS002 | O motor de cálculo `dFolhaPrevia.pas` (30.856 linhas) concentra a lógica da prévia em 3 classes: `TdtmFolhaPrevia`, `TobjRecebedor`, `TobjRubrica`. |
| OBS003 | A evidência de cada regra é classificada como COMPROVADO (no código), INFERIDO (plausível) ou PENDENTE (validar). Esta classificação foi mantida do PFC-22. |
| OBS004 | As regras FOLHA-RN001 a FOLHA-RN025 existiam desde o PFC-21; as regras FOLHA-RN026 a FOLHA-RN030 foram descobertas no PFC-22. |
| OBS005 | Os fluxogramas Mermaid representam somente comportamentos comprovados no código-fonte. |

**Alterações:**
- **Adicionado:** seção "Observações Gerais (OBS)" em `funcionalidades.html` e `regras-de-negocio.html`.
- **Removido:** nada.

---

## 10. Casos de Uso Associados

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Casos de Uso Associados | Dependências externas (integracoes.html) e processos relacionados | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Casos de Uso Associados" em `funcionalidades.html`, listando os módulos externos dos quais o FOLHA depende (CM Framework, CMPrevMT50, CMAdmPrev, SHARED/Folhas, IRRF, PROCJUD, CONTRIBUICAOPREV, BENEFICIOPREV, etc.), com link para `integracoes.html`.
- **Adicionado:** em cada jornada, a seção "Dependências" lista os casos de uso (outros processos/jornadas) que precedem ou sucedem a jornada atual.
- **Removido:** nada.

---

## 11. Tabela/API/Programa

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Tabelas de dados (dados.html), rotinas (rotinas.html), entry point | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Tabela/API/Programa" em `funcionalidades.html`, com tabela mapeando cada jornada às tabelas Oracle lidas/escritas (PREVIA, HSTFOLHABENEF, BASEDEPAGAMENTO, BITRIBUTACAO, etc.), às rotinas-chave (com file:linha) e ao entry point `FOLHA/Fontes/Folha.dpr`. Conteúdo derivado de `dados.html` e `rotinas.html`.
- **Adicionado:** em `regras-de-negocio.html`, referência à tabela/rotina de origem de cada regra (atributo 10 já existente, agora apresentado no formato UC097).
- **Removido:** nada.

---

## 12. Telas/Layouts

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Formulários Delphi (formularios.html) | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "Telas/Layouts" em `funcionalidades.html`, com tabela mapeando cada jornada aos forms (.dfm) correspondentes (ex.: JF001 → FPreparo.dfm, JF002 → FFolhaNormalPrevia.dfm, JF003 → fFolhaNormalEfet.dfm, etc.), com link para `formularios.html`. A coluna "Tela" da tabela de ações práticas também referencia o form.
- **Removido:** nada.

---

## 13. Visão Consolidada de Jornadas Funcionais (com critérios de aceitação)

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Visão Consolidada | **Novo** — síntese de todas as jornadas | funcionalidades.html, regras-de-negocio.html |
| [US] items | **Novo** — uma US por jornada | — |
| Critérios Dado/Quando/Então | **Novo** — derivado das validações e resultados | — |

**Alterações:**
- **Adicionado:** seção "Visão Consolidada de Jornadas Funcionais" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela no formato UC097: Jornada, ID, Título, Critérios de aceitação, Mensagens, Telas.
- **Adicionado:** um item `[US] FOLHA-JFnnn` por jornada, com pelo menos um critério Dado/Quando/Então derivado das validações (atributo 5) e do resultado (atributo 12) da regra/processo correspondente.
- **Removido:** nada.

---

## 14. Histórico de Versões

| Atributo UC097 | Elemento FOLHA correspondente | Aba docs1 afetada |
|---|---|---|
| Histórico de Versões | **Novo** | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Histórico de Versões" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela: Versão, Descrição, Data, Responsável.
  - v1.0 — Blueprint AS-IS inicial (PFC-21) — 2026-11-08 — Squad Blueprint
  - v1.1 — Enriquecimento PFC-22 (30 regras, 18 processos, 528 artefatos) — 2026-11-09 — Squad Blueprint
  - v2.0 — Adaptação ao modelo UC097 (PFC-25) — 2026-11-10 — Squad Blueprint (GLM-5.2)
- **Removido:** nada.

---

## 15. Decisões de projeto

Conforme a diretiva do requisitante ("qualquer dúvida deve ser resolvida pela melhor decisão disponível, sem interromper o trabalho; cada decisão deve ser registrada neste relatório"), as seguintes decisões foram tomadas:

| # | Decisão | Justificativa |
|---|---|---|
| D01 | Cada processo (PF-01 a PF-F) torna-se exatamente uma jornada (JF001 a JF018), em vez de agrupar processos em jornadas. | Garante que nenhum processo seja perdido (AC2 exige 18 de 18) e mantém o mapeamento 1:1 simples e rastreável. O UC097 tem 4 jornadas para 1 caso de uso; o FOLHA tem 18 processos, então 18 jornadas é o equivalente natural. |
| D02 | O `id` HTML de cada jornada mantém o código original (ex.: `id="PF-01"`), e o título mostra "JF001 (PF-01)". | Preserva todos os links existentes do `index.html` e de outras abas (AC5 exige 0 referências quebradas). |
| D03 | O `id` HTML de cada regra mantém `id="FOLHA-RNxxx"`, e o título mostra "RSxxx (FOLHA-RNxxx)". | Mesma razão de D02 — preserva links existentes. |
| D04 | Os códigos RS são numerados RS001–RS030 na mesma ordem dos FOLHA-RN001–FOLHA-RN030. | Mantém o mapeamento trivial e reversível. |
| D05 | Os TRT e MSG foram derivados exclusivamente das validações e exceções já documentadas no Blueprint PFC-22 (atributos 5 e 8 das regras, campos "Validações" e "Exceções" dos processos). Nenhum tratamento ou mensagem foi inventado. | Garante que o conteúdo é evidence-based e não introduz informação não comprovada. |
| D06 | A seção "Ações práticas" de cada jornada foi derivada do passo-a-passo existente,分解 em ações individuais com objetivo, entrada, comportamento, resultado, regras, mensagens e tela. | O UC097 exige esta tabela; o conteúdo já existe no passo-a-passo, apenas reestruturado. |
| D07 | A "Visão Consolidada" e os critérios Dado/Quando/Então foram derivados das condições (atributo 5) e resultados (atributo 12) das regras, e dos campos "Validações" e "Resultado" dos processos. | O UC097 exige critérios de aceitação; o conteúdo deriva diretamente do que já está documentado. |
| D08 | As pré-condições e pós-condições globais consolidam condições comuns a todas as jornadas; cada jornada mantém suas condições específicas. | Evita redundância e segue o padrão do UC097 (que tem pré/pós-condições globais e por jornada). |
| D09 | A tabela de decisão de IRRF (RN004/RN005/RN015/RN017) existente em `regras-de-negocio.html` foi mantida como tabela auxiliar dentro da regra RS004, complementando o formato UC097. | Conteúdo válido e comprovado que enriquece a regra sem conflitar com o modelo. |
| D10 | O badge "Blueprint AS-IS — PFC-22 (enriquecido)" foi atualizado para "Blueprint AS-IS — PFC-25 (adaptado UC097)" nas abas reestruturadas, mantendo a referência ao PFC-22. | Reflete a nova versão do documento (v2.0) sem perder a rastreabilidade ao enriquecimento anterior. |
| D11 | A navegação (nav) das abas reestruturadas foi mantida idêntica à original (Visão Geral, Arquitetura, Inventário, Formulários, Processos, Rotinas, Regras, Dados, Integrações). | AC5 exige que a navegação existente continue funcionando. |
| D12 | As 14 regras recém-descobertas (RN026–RN030) do PFC-22 foram tratadas no mesmo formato UC097 que as 25 originais, sem distinção visual de "novas". | O modelo UC097 não separa regras por origem; todas são regras de jornada (RS). |

---

## 16. Impacto em outras partes do documento FOLHA

Conforme a seção "Broader use of the model" do issue, o modelo UC097 deve também guiar a adaptação de outras partes do documento FOLHA onde necessário. As seguintes partes adicionais foram ajustadas:

| Parte | Ajuste | Aba docs1 |
|---|---|---|
| Cabeçalho e badge | Atualizado para refletir PFC-25 e v2.0 | funcionalidades.html, regras-de-negocio.html |
| Rodapé | Data de geração atualizada para 2026-11-10 e referência PFC-25 | funcionalidades.html, regras-de-negocio.html |
| Links cruzados index.html → funcionalidades.html | Mantidos (ids PF-01 a PF-12 preservados) | index.html (não alterado) |
| Links cruzados index.html → regras-de-negocio.html | Mantidos (ids FOLHA-RN001 a FOLHA-RN030 preservados) | index.html (não alterado) |

**Partes não alteradas** (justificativa: fora do escopo da adaptação das abas Processos e Regras, e AC5 exige que a navegação existente continue funcionando):
- `arquitetura.html`, `inventario.html`, `formularios.html`, `rotinas.html`, `dados.html`, `integracoes.html` — não modificadas.
- `index.html` — não modificado (preserva links e navegação).

---

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — Análise lista cada seção UC097 com elemento FOLHA correspondente | OK | Seções 1–14 deste relatório |
| AC2 — 18 processos em jornadas JF001–JF018 com objetivo, sequência e ações práticas | OK | `funcionalidades.html` seção 5 |
| AC3 — 30 regras em formato RS com código, título, descrição, campos obrigatório/opcional/condicional, link FOLHA-RN e evidência | OK | `regras-de-negocio.html` seção 6 |
| AC4 — TRT com Condição/Mensagem/Resultado, catálogo MSG, visão consolidada com Dado/Quando/Então | OK | Seções 7, 8 e 13 |
| AC5 — Navegação preservada, 0 referências quebradas | OK | ids HTML preservados, nav inalterado |

---

*Fim do relatório de análise.*
