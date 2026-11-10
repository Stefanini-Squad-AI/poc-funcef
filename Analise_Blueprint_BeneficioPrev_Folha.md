# Análise Blueprint BENEFICIOPREV — Adaptação ao padrão de jornadas funcionais

**Issue:** PFC-28 — ADAPTACAO BENEFICIOPREV
**Data:** 2026-11-10
**Documento de referência (somente apresentação):** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf`, na raiz do repositório
**Blueprint alvo:** `docs1/beneficioprev/` (módulo Benefício Previdenciário, Blueprint AS-IS PFC-24)
**Precedentes seguidos:** PFC-25 — FOLHA (`Analise_Blueprint_Folha.md`) e PFC-27 — CONTRIBUIÇÃO (`Analise_Blueprint_Contribuicao_Folha.md`)

> **Nome deste arquivo.** A issue pede um documento chamado `Analise_Blueprint_Folha.md`, mas esse arquivo já existe na raiz e é o entregável do PFC-25 (FOLHA). Para não sobrescrevê-lo, este documento segue a convenção adotada no PFC-27 (`Analise_Blueprint_Contribuicao_Folha.md`) e se chama `Analise_Blueprint_BeneficioPrev_Folha.md`.

> O documento de referência foi usado só como modelo de apresentação. Nenhuma página de `docs1/beneficioprev/` o cita: a busca por "UC097" e pelo nome do PDF retorna 0 ocorrências. Este arquivo de análise é o único lugar onde ele é nomeado.

---

## 0. Resumo executivo

Antes desta issue, o Blueprint do módulo BENEFICIOPREV tinha 18 processos (PF-01 a PF-18) e 45 regras (BENEF-RN001 a BENEF-RN045), organizados a partir do código-fonte. Cada processo tinha forms, lógica, saídas, persistência e evidência. Cada regra tinha descrição, condições, dados, resultado/exceção, origem e evidência.

O padrão adotado organiza a documentação em **jornadas funcionais**, com estas seções: identificação, descrição resumida, pré/pós-condições, jornadas com sequência operacional e tabela de ações práticas, regras de jornada (RS), tratamentos de erro (TRT), catálogo de mensagens (MSG), observações (OBS), casos de uso associados, tabela/programa, telas, visão consolidada com critérios de aceitação e histórico de versões.

Resultado:

| Item | Antes | Depois | Perdas |
|---|---|---|---|
| Processos → jornadas | 18 (PF-01..PF-18) | 18 (JF001..JF018), mapeamento 1:1 | 0 |
| Regras → regras de jornada | 45 (BENEF-RN001..045) | 45 (RS001..RS045), mapeamento 1:1 | 0 |
| Tratamentos de erro | — | 29 (TRT001..TRT029); 18 ligados a 17 regras, 7 "validação de tela", 4 "validação técnica" | — |
| Mensagens | — | 39 (MSG001..MSG039), conferidas no código com arquivo:linha | — |
| Ações práticas | — | 50 linhas de ação nas 18 jornadas | — |
| Âncoras usadas pelas outras abas | 18 `#PF-xx` + 45 `#BENEF-RNxxx` | os mesmos 63 `id` mantidos | 0 links quebrados em `docs1/` |

**Abas alteradas:** `funcionalidades.html` (reestruturada), `regras-de-negocio.html` (reestruturada), `index.html` (só rótulos e dois parágrafos; nenhum `href` alterado).
**Abas sem alteração:** `arquitetura.html`, `inventario-tecnico.html`, `procedures-functions.html`, `dados.html`, `relatorios.html`, `integracoes.html`, `tratamento-erros.html`, `diagramas-fluxo.html`, `lacunas.html`, `controle-cobertura.html`.

**Fonte do conteúdo novo.** Os tratamentos (TRT) e as mensagens (MSG) foram derivados **somente** das validações e exceções já documentadas no Blueprint AS-IS PFC-24: atributos "Condições" e "Resultado/Exceção" das 45 regras e a aba `tratamento-erros.html` (mensagens de validação e padrões try/except, RollBack, MostrarErro, raise exception/EValidacao). O código de `BENEFICIOPREV/Fontes` (`.pas` lidos em Latin-1) foi usado só para conferir o texto completo e a linha de cada mensagem, e os títulos das telas vêm da propriedade `Caption` dos `.dfm`. Críticas presentes no código mas não documentadas no AS-IS não viraram TRT/MSG (ver seção 16).

---

## 1. Identificação

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Caso de uso / Sistema / Tipo / Ator / Referência | Painel "Informações" de `index.html` (ID do módulo, DPR, Application.Title, tecnologia) | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "1. Identificação" no topo das duas abas: caso de uso, sistema (`BeneficioPrev.dpr`, Application.Title "Concessão e Manut de Benefícios Previdenciários"), tipo (desktop Delphi 5/VCL/Oracle/MIDAS), ator (analistas de concessão/manutenção, eventos, reajuste e conciliação INSS) e referência (PFC-28, base PFC-24).
- **Alterado:** o badge do `<header>` passou a "Blueprint AS-IS — Delphi 5 — Jornadas Funcionais (v2.0)".
- **Removido:** nada.

## 2. Descrição Resumida

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Descrição resumida | "Visão Geral do Módulo" e "Responsabilidades" de `index.html` | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "2. Descrição Resumida" nas duas abas, com o propósito do módulo e a organização em 18 jornadas e 45 regras de jornada.
- **Alterado:** o subtítulo do `<header>` das duas abas ("18 processos funcionais com entradas…" e o equivalente da aba Regras) foi substituído por um que descreve o novo conteúdo.
- **Removido:** nada além do texto de subtítulo substituído.

## 3. Pré-condições

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Não existiam por processo. Derivadas das dependências (`index.html`, `integracoes.html`), das regras e das validações documentadas | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "3. Pré-condições" (DPR, Oracle, parâmetros PARAMAPREV/fundação, cadastros base, componentes externos CMAdmPrev/UAdmPrev/Folha) e o campo "Pré-condições" em cada jornada. Exemplos: JF004 exige benefício não pago no período (RS028); JF005-falecimento exige dependente elegível (RS035); JF009 exige benefício não processado na folha do mês (RS039).
- **Alterado / Removido:** nada.

## 4. Pós-condições

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campos "Saídas" e "Persistência (tabelas escritas)" de cada processo | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "4. Pós-condições" e o campo "Pós-condições" em cada jornada, derivado de Saídas e Persistência.
- **Alterado / Removido:** nada. Saídas e Persistência continuam no registro original de cada jornada.

## 5. Jornadas Funcionais (objetivo, sequência operacional, ações práticas)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Jornada (código, título, objetivo) | Processo PF-xx (título e lógica de processamento) | funcionalidades.html |
| Sequência operacional numerada | Campo "Lógica de processamento", detalhado com as regras e validações documentadas | funcionalidades.html |
| Ações práticas (Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela) | **Novo.** Derivado dos processos, das regras, das mensagens e do `Caption` das telas | funcionalidades.html |

**Correspondência processos → jornadas:**

| Jornada | Processo original (`id` mantido) | Título | Telas (forms) | Ações práticas | Regras (RS) | TRT | MSG |
|---|---|---|---|---|---|---|---|
| JF001 | PF-01 | Concessão de Benefício | `FPrincipal.dfm`, `fTipoLiberacao.dfm` | 3 | RS001 | 1 | 1 |
| JF002 | PF-02 | Manutenção de Processos de Benefícios | `FPrincipal.dfm` | 2 | RS001 | 0 | 0 |
| JF003 | PF-03 | Simulação / Memória de Cálculo | `FSimulaBeneficio.dfm`, `FConsMemoriaCalculo.dfm` | 3 | RS004, RS005 | 0 | 0 |
| JF004 | PF-04 | Desfazer Operações de Benefícios | `FDesfazConcessaoBenefNOVO.dfm` | 4 | RS010, RS011, RS012, RS013, RS028, RS029, RS030, RS034 | 4 | 3 |
| JF005 | PF-05 | Eventos Previdenciários | `FEventoAposentaBenef.dfm`, `FEventoMorte.dfm`, `FEventoReclusao.dfm`, `FEventoAssistidoBenef.dfm`, `FEventoAssistidoINSS.dfm` | 5 | RS002, RS003, RS006, RS016, RS018, RS019, RS035, RS036, RS037 | 4 | 4 |
| JF006 | PF-06 | Reajuste de Benefícios | `FReajuesteBenef.dfm`, `FCadReajINSS.dfm` | 3 | RS007, RS008, RS009 | 1 | 1 |
| JF007 | PF-07 | Reajuste Judicial | `FReajusteJudicial.dfm` | 2 | RS023, RS038 | 0 | 0 |
| JF008 | PF-08 | Desdobramento de Benefício | `FDesdobramentoBenef.dfm`, `FPedeInfRevisao.dfm` | 4 | RS014, RS017, RS029, RS031, RS032 | 5 | 11 |
| JF009 | PF-09 | Reabertura / Renovação de Benefício | `FReaberturaBeneficio.dfm`, `FReaberturaData.dfm` | 3 | RS020, RS039 | 2 | 2 |
| JF010 | PF-10 | Liberação de Benefício em Exigência ou Retido | `FCadInicioBenefExigencia.dfm` | 3 | RS021, RS033 | 4 | 3 |
| JF011 | PF-11 | Liberação de Benefício Provisório (Adiantamento) | `FLiberaBeneficioProvisorio.dfm` | 1 | — | 0 | 0 |
| JF012 | PF-12 | Conciliação INSS (mantenedoras/extrato/encerramento) | `_FConciliacao.dfm`, `_FExtratoINSS.dfm`, `_FEncerraConciliacao.dfm`, `_FResultConciliacao.dfm`, `_FCadMantenedora.dfm`, `_FAssocRubINSS.dfm`, `_fCadEntrManualINSS.dfm`, `_fCompoeValoresRI.dfm` | 6 | RS022, RS042, RS043, RS044 | 6 | 9 |
| JF013 | PF-13 | Controle / Histórico de Dívidas de Benefícios | `FParamDividaBenef.dfm` | 2 | — | 0 | 0 |
| JF014 | PF-14 | Alteração de Benefício (individual e em lote) | `FAlteraBeneficio.dfm`, `FAlteraBeneficioLote.dfm` | 3 | RS015, RS040, RS041 | 3 | 4 |
| JF015 | PF-15 | Cadastro de Processos INSS (Habilitação) | `FCadProcHabINSS.dfm` | 2 | RS024 | 1 | 1 |
| JF016 | PF-16 | Reconstrução / Cancelamento de Evento INSS | `FReconstruirINSS.dfm` | 2 | — | 1 | 1 |
| JF017 | PF-17 | Cálculo Retroativo de Benefícios | `frmRetroativoPrev` | 1 | — | 0 | 0 |
| JF018 | PF-18 | Registro de Falecimento de Beneficiário | `frmRegFalBenef` | 1 | — | 0 | 0 |

- **Adicionado:** em cada jornada: objetivo, ator/gatilho, pré-condições, pós-condições, sequência operacional numerada com referências `[RSxxx]` e `[TRTxxx]`, tabela de ações práticas com as 8 colunas do padrão, regras da jornada, tratamentos, mensagens, telas e dependências.
- **Alterado:** o título do bloco passou de "PF-xx — título" para "JFnnn (PF-xx) — título". O `id` do bloco foi mantido (`id="PF-01"` … `id="PF-18"`).
- **Alterado:** os campos originais (Forms de entrada, Lógica de processamento, Saídas, Persistência, Evidência) foram para um quadro "Registro original do processo" no fim de cada jornada, com o texto sem alteração.
- **Removido:** nada. 18 de 18 processos estão presentes.

## 6. Regras de negócio da jornada (RS)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Código da regra | Código BENEF-RNxxx (mantido como `id` e mostrado ao lado do RS) | regras-de-negocio.html |
| Título | Rótulo curto da regra (lista de `index.html` para RN001–025; derivado da descrição para RN026–045) | regras-de-negocio.html |
| Descrição em linguagem de negócio | **Novo.** Reescrita a partir da descrição técnica | regras-de-negocio.html |
| Campos de dados [obrigatório]/[opcional]/[condicional] | "Dados envolvidos" + "Condições", detalhados com os campos de tela/tabela | regras-de-negocio.html |
| Regras por jornada | **Novo.** Lista em cada jornada e seção "6. Regras de Negócio por Jornada" | funcionalidades.html |

**Correspondência regras → regras de jornada:**

| Regra de jornada | Código original (`id` mantido) | Título | Jornada(s) | Tratamento (TRT) | Evidência |
|---|---|---|---|---|---|
| RS001 | BENEF-RN001 | Tipo de benefício direciona o fluxo | JF001, JF002 | — (seleção/cálculo) | COMPROVADO |
| RS002 | BENEF-RN002 | Menu de eventos montado pelo cadastro | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS003 | BENEF-RN003 | Falecimento não oferece o evento 346 | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS004 | BENEF-RN004 | Elegibilidade por data na simulação | JF003 | — (seleção/cálculo) | COMPROVADO |
| RS005 | BENEF-RN005 | Valor previsionado por regra numérica | JF003 | — (seleção/cálculo) | COMPROVADO |
| RS006 | BENEF-RN006 | Eventos consideram só benefícios nas situações 4 e 6 | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS007 | BENEF-RN007 | Reajuste só para benefícios vitalícios não-resgate | JF006 | — (seleção/cálculo) | COMPROVADO |
| RS008 | BENEF-RN008 | Reajuste exclui REPLAN não saldado (255 e 358) | JF006 | — (seleção/cálculo) | COMPROVADO |
| RS009 | BENEF-RN009 | Reajuste por fonte pagadora | JF006 | — (seleção/cálculo) | COMPROVADO |
| RS010 | BENEF-RN010 | Desfazimento só atua sobre registros concedidos | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS011 | BENEF-RN011 | Desfazimento restaura o valor do benefício | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS012 | BENEF-RN012 | Desfazimento exclui históricos derivados da concessão | JF004 | TRT005 | COMPROVADO |
| RS013 | BENEF-RN013 | Desfazimento reabre a vigência da contribuição | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS014 | BENEF-RN014 | Dados obrigatórios do desdobramento | JF008 | TRT011 | COMPROVADO |
| RS015 | BENEF-RN015 | Datas no formato DD/MM/AAAA | JF014 | TRT025 | COMPROVADO |
| RS016 | BENEF-RN016 | Evento em aberto bloqueia nova procura | JF005 | TRT007 | COMPROVADO |
| RS017 | BENEF-RN017 | Desdobramento exige regra contábil automática válida | JF008 | TRT012 | COMPROVADO |
| RS018 | BENEF-RN018 | Falecimento grava data da morte e tempo de serviço | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS019 | BENEF-RN019 | Eventos são registrados e auditados | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS020 | BENEF-RN020 | Reabertura atualiza as situações | JF009 | — (seleção/cálculo) | COMPROVADO |
| RS021 | BENEF-RN021 | Liberação em exigência conclui o processo | JF010 | — (seleção/cálculo) | COMPROVADO |
| RS022 | BENEF-RN022 | Rubrica do INSS associada uma única vez | JF012 | TRT019 | COMPROVADO |
| RS023 | BENEF-RN023 | Reajuste judicial só para benefícios ativos em planos ativos | JF007 | — (seleção/cálculo) | COMPROVADO |
| RS024 | BENEF-RN024 | Processo INSS exige benefício ativo e habilitação concedida | JF015 | — (seleção/cálculo) | COMPROVADO |
| RS025 | BENEF-RN025 | Operações auditadas no log do TotalPREV | Transversal | TRT010 | COMPROVADO |
| RS026 | BENEF-RN026 | Instituto troca a nomenclatura das telas | Transversal | — (seleção/cálculo) | COMPROVADO |
| RS027 | BENEF-RN027 | Integração contábil por parâmetro | Transversal | — (seleção/cálculo) | COMPROVADO |
| RS028 | BENEF-RN028 | Benefício já pago não pode ser desfeito | JF004 | TRT003 | COMPROVADO |
| RS029 | BENEF-RN029 | Desdobramento já processado em folha não pode ser desfeito | JF004, JF008 | TRT004 | COMPROVADO |
| RS030 | BENEF-RN030 | Desfazimento conforme o tipo de movimento | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS031 | BENEF-RN031 | Desdobramento gera processo por benefício | JF008 | — (seleção/cálculo) | COMPROVADO |
| RS032 | BENEF-RN032 | Desdobramento acima do limite exige autorização | JF008 | TRT014 | COMPROVADO |
| RS033 | BENEF-RN033 | Liberação acima dos limites exige autorização | JF010 | TRT017, TRT018 | COMPROVADO |
| RS034 | BENEF-RN034 | Percentual da pensão Reg/Replan | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS035 | BENEF-RN035 | Falecimento exige dependente elegível | JF005 | TRT008 | COMPROVADO |
| RS036 | BENEF-RN036 | Eventos de aposentadoria exclusiva do INSS | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS037 | BENEF-RN037 | Evento de invalidez marca a pessoa como inválida | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS038 | BENEF-RN038 | Cálculo do reajuste judicial | JF007 | — (seleção/cálculo) | COMPROVADO |
| RS039 | BENEF-RN039 | Benefício processado na folha do mês não pode ser reaberto | JF009 | TRT015 | COMPROVADO |
| RS040 | BENEF-RN040 | Alteração em lote rejeita divergência de valores | JF014 | TRT027 | COMPROVADO |
| RS041 | BENEF-RN041 | Arquivo de lote não pode ser importado duas vezes | JF014 | TRT026 | COMPROVADO |
| RS042 | BENEF-RN042 | Até 9 rubricas por linha do arquivo do INSS | JF012 | — (seleção/cálculo) | COMPROVADO |
| RS043 | BENEF-RN043 | Máximo de rubricas por mês na composição de valores | JF012 | TRT022 | COMPROVADO |
| RS044 | BENEF-RN044 | Meses fechados não aceitam entrada manual | JF012 | TRT021 | COMPROVADO |
| RS045 | BENEF-RN045 | Dados isolados por fundação | Transversal | — (seleção/cálculo) | COMPROVADO |

- **Adicionado:** código RS (RS001–RS045, mesma numeração dos BENEF-RN), título, descrição de negócio, campos de dados classificados, tratamento de erro (TRT → MSG → resultado) e jornada com link.
- **Adicionado:** na aba Regras, a seção "5. Mapa de Regras por Jornada" e a seção "10. Visão Consolidada — Critérios de Aceitação por Regra" (Dado/Quando/Então para as 45 regras).
- **Adicionado:** quatro regras são **transversais** (RS025 log, RS026 nomenclatura de instituto, RS027 integração contábil, RS045 isolamento por fundação): valem para todas as jornadas.
- **Adicionado:** "Notas de verificação" onde a leitura do código atual completa ou diverge do registro original, sem substituí-lo:
  - **RS004 (BENEF-RN004):** Sem IDRGDATAELEG o código atribui “Elegível” diretamente (FSimulaBeneficio.pas:243).
  - **RS014 (BENEF-RN014):** O código exige também a Data de Início na Fundação (FPedeInfRevisao.pas:288), e o Nº do Processo INSS só é obrigatório quando FLGOBRIGANPROC = 1 (:271-277).
  - **RS015 (BENEF-RN015):** A função CheckDate (FAlteraBeneficio.pas:235-253) existe, mas os seis tratadores SetText que a chamam (:676-721) estão dentro de um bloco de comentário { … }. Validar se a crítica ainda é acionada por outro caminho. Classificação original mantida.
  - **RS016 (BENEF-RN016):** O mesmo bloqueio existe no evento Falecimento (FEventoMorte.pas:520).
  - **RS025 (BENEF-RN025):** Em vários forms a falha do log é engolida por um except vazio (ver TRT010).
  - **RS034 (BENEF-RN034):** A regra 50% + 10% por dependente está descrita no registro de alterações WO18367 (FDesfazConcessaoBenefNOVO.pas:6-15); AtribuiValorAnterior (:5184-5206) restaura os valores BS/FAB do titular usados nesse cálculo.
  - **RS035 (BENEF-RN035):** Mensagem em FEventoMorte.pas:1030-1031.
  - **RS036 (BENEF-RN036):** Tela: Evento Aposentadoria Exclusiva do INSS (FEventoAssistidoINSS.dfm).
  - **RS039 (BENEF-RN039):** Há duas verificações: prévia da folha (FReaberturaBeneficio.pas:838) e cálculo no mês (:843-862); ambas exibem a mensagem de :869.
  - **RS040 (BENEF-RN040):** O código compara valor − (BS + FAB) > 0,02 sem valor absoluto e só quando FLGOBRIGA_BS_FAB = 1 (FAlteraBeneficioLote.pas:322-324, 349-351).
  - **RS041 (BENEF-RN041):** O hash é calculado sobre edtArquivo.text, que recebe o nome do arquivo (FAlteraBeneficioLote.pas:436-439); confirmar se GetCRC32 lê o conteúdo ou só o nome.
  - **RS043 (BENEF-RN043):** A condição no código é iContRubrica >= 20 (_fCompoeValoresRI.pas:862).
- **Alterado:** o `rule-id` passou de "BENEF-RNxxx" para "RSxxx (BENEF-RNxxx) — Título". O `id` HTML foi mantido.
- **Alterado:** os atributos originais (descrição, condições, dados envolvidos, resultado/exceção, origem e evidência) estão em cada bloco com o texto original.
- **Removido:** nada. 45 de 45 regras presentes; classificação mantida (45 COMPROVADO).

## 7. Tratamentos de erro (TRT)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Tratamento (Condição, Mensagem, Resultado) | "Resultado/Exceção" das regras + mensagens e padrões de `tratamento-erros.html` | funcionalidades.html (seção 7 + referências nas jornadas), regras-de-negocio.html (seção 7 + campo em cada regra) |

- **Adicionado:** catálogo TRT001–TRT029 nas duas abas, com Condição, Mensagem, Resultado, Regra e Jornada; cada linha tem `id` (`#TRT001`…).
- **Adicionado:** "validação de tela" para críticas documentadas no AS-IS sem regra BENEF-RN (por exemplo, mantenedora, entrada manual INSS, NB duplicado, moeda); "validação técnica" para falhas técnicas documentadas (datamodule de relatórios, erro de banco com MostrarErro, RollBack, erro na regra de cálculo). Essas críticas **não** foram promovidas a novas regras RS, para manter 45 = 45.
- **Sinalizado:** TRT002 (data de início de liberação) está **inativo** no código atual (trecho comentado) e TRT025 (formato de data) depende de chamadas comentadas. Foram mantidos porque estão no AS-IS, com a situação explícita.
- **Removido:** nada.

| TRT | Condição | Mensagens | Resultado | Regra | Jornada(s) |
|---|---|---|---|---|---|
| TRT001 | Falha ao criar o datamodule de relatórios ao abrir uma tela pelo menu principal (CriaDataModule) | MSG001 | Exibe o erro técnico e orienta contatar o suporte (try/except) | validação técnica | Transversal |
| TRT002 | Data de início de liberação anterior à data de início de pagamento | MSG002 | Inativo no código atual: a crítica está comentada (fTipoLiberacao.pas:154-181); quando ativa, impedia o fechamento da tela (CanClose := False) | validação de tela | JF001 |
| TRT003 | Benefício já pago no período da operação que se quer desfazer (VLBENEFPGTO > 0) | MSG003 | Interrompe o desfazimento (Exit); nada é alterado | RS028 (BENEF-RN028) | JF004 |
| TRT004 | Folha de Benefícios com os acertos do desdobramento já executada (FLGENVIADO = 1 ou VLBENEFPGTO > 0 em lote da folha) | MSG004 | Interrompe o desfazimento do desdobramento (Exit) | RS029 (BENEF-RN029) | JF004 |
| TRT005 | Erro ao excluir a correção monetária durante o desfazimento | MSG005 | Interrompe o desfazimento (Exit) | RS012 (BENEF-RN012) | JF004 |
| TRT006 | Erro de banco em operação de escrita (desfazimento, reabertura, liberação) | — (texto não catalogado) | Transação revertida (RollBack) e mensagem exibida pelo form (padrão try/except + RollBack; texto varia por operação e não está catalogado no AS-IS) | validação técnica | JF004, JF009, JF010 |
| TRT007 | Evento ainda em aberto ao procurar outro participante | MSG006 | Bloqueia a nova procura (Abort); o usuário deve confirmar ou cancelar o evento | RS016 (BENEF-RN016) | JF005 |
| TRT008 | Participante sem dependente elegível a benefício no evento Falecimento | MSG007 | Interrompe o evento (Exit) e orienta usar o Cadastro de Dependentes/Beneficiários | RS035 (BENEF-RN035) | JF005 |
| TRT009 | Erro de banco ao consultar ou gravar dados do evento | MSG009 | Mostra a mensagem da exceção (MostrarErro) e interrompe a operação | validação técnica | JF005 |
| TRT010 | Falha ao gravar o log de operações (Sistema.GravaLogOperacoes retorna falso) | MSG008 | Levanta exceção “Erro ao gravar Log.”; em FEventoMorte, FEventoReclusao, FCadReajINSS e FCadContribParticipante ela é capturada por um except vazio e a operação segue sem log; em FDesdobramentoBenef cai no except externo da transação (:6325-6331) | RS025 (BENEF-RN025) | JF005, JF006, JF008 |
| TRT011 | Dado obrigatório do desdobramento não informado (Nº do Processo INSS quando exigido, Data de Requerimento, Data de Início na Fundação, Data de Início do Pagamento, Tipo de Pagamento) | MSG010, MSG011, MSG012, MSG013, MSG014 | Bloqueia a confirmação (ModalResult := mrNone + Abort) | RS014 (BENEF-RN014) | JF008 |
| TRT012 | Regra contábil automática (entidade, conta débito ou conta crédito) com erro, resultado nulo ou inválido | MSG015, MSG016, MSG017 | Bloqueia o desdobramento | RS017 (BENEF-RN017) | JF008 |
| TRT013 | Erro ao executar a regra de cálculo do benefício no desdobramento | MSG018 | Interrompe o cálculo do desdobramento | validação técnica | JF008 |
| TRT014 | Valor rateado do desdobramento excede o limite e o usuário não tem autorização | MSG019 | Zera o valor rateado e interrompe (Exit) | RS032 (BENEF-RN032) | JF008 |
| TRT015 | Benefício já processado pela prévia da folha ou já calculado no mês de pagamento | MSG020, MSG021 | Bloqueia a renovação/reabertura e desfaz a transação (RollBack) | RS039 (BENEF-RN039) | JF009 |
| TRT016 | Nenhum benefício selecionado para liberação | MSG022 | Não processa a liberação (Exit) | validação de tela | JF010 |
| TRT017 | Valor atualizado excede o limite de valor sem autorização | MSG023 | Desfaz a transação (RollBack) e interrompe a liberação | RS033 (BENEF-RN033) | JF010 |
| TRT018 | Valor atualizado excede o limite percentual sem autorização | MSG024 | Desfaz a transação (RollBack) e interrompe a liberação | RS033 (BENEF-RN033) | JF010 |
| TRT019 | Rubrica do INSS já associada | MSG025 | Não grava a associação duplicada | RS022 (BENEF-RN022) | JF012 |
| TRT020 | Rubrica do INSS, mês de cobrança, mês de referência ou valor não informados na entrada manual | MSG026, MSG027, MSG028, MSG029 | Bloqueia a gravação (EValidacao) e posiciona no campo | validação de tela | JF012 |
| TRT021 | Mês de cobrança da entrada manual com conciliação fechada | MSG030 | Bloqueia a inclusão (EValidacao) e posiciona no mês de cobrança | RS044 (BENEF-RN044) | JF012 |
| TRT022 | 20 ou mais rubricas no mesmo mês na composição de valores | MSG031 | Desfaz a transação (Rollback) e interrompe | RS043 (BENEF-RN043) | JF012 |
| TRT023 | Campos obrigatórios não preenchidos no cadastro de mantenedora (código) ou na consulta de resultado da importação (ano/mês) | MSG032 | Não prossegue (Exit) e posiciona no campo | validação de tela | JF012 |
| TRT024 | Código de mantenedora já cadastrado na inclusão | MSG033 | Não grava (Exit) | validação de tela | JF012 |
| TRT025 | Data digitada fora do formato DD/MM/AAAA na alteração de benefício | MSG034 | CheckDate retorna falso e o campo é rejeitado (Abort) — chamadas comentadas no código atual (ver RS015) | RS015 (BENEF-RN015) | JF014 |
| TRT026 | Arquivo de alteração em lote já importado (hash já existe em HSTARQUIVOALTBENEF) | MSG036 | Limpa o arquivo escolhido e não habilita a validação (Exit) | RS041 (BENEF-RN041) | JF014 |
| TRT027 | Diferença maior que 0,02 entre o valor informado e a soma BS + FAB, para benefício que exige BS/FAB | MSG037 | Registro rejeitado: valor marcado como -1, falha contada e listada no resultado | RS040 (BENEF-RN040) | JF014 |
| TRT028 | Número de benefício (NB) do INSS já cadastrado para outra pessoa | MSG038 | Fecha as consultas e não cadastra o processo | validação de tela | JF015 |
| TRT029 | Moeda não informada na reconstrução do histórico do INSS | MSG039 | Não prossegue (Exit) e posiciona no campo moeda | validação de tela | JF016 |

## 8. Catálogo de Mensagens (MSG)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Mensagens (código, texto, jornadas) | "Mensagens de Validação Significativas" de `tratamento-erros.html` + mensagens citadas no "Resultado/Exceção" das regras, conferidas no código | funcionalidades.html (seção 8), regras-de-negocio.html (seção 8) |

- **Adicionado:** catálogo MSG001–MSG039 nas duas abas, com Código, Texto (grafia original), Tipo, Origem (arquivo:linha) e Jornadas; na aba Regras, também as regras relacionadas. Cada linha tem `id` (`#MSG001`…).
- **Tipos:** Erro 19, Informação 5, Erro (validação) 5, Alerta 3, Erro (exceção) 2, Informação (bloqueio) 2, Erro (exibida como informação) 1, Sucesso 1, Log de processamento 1.
- **Alterado:** textos citados de forma abreviada no AS-IS (por exemplo, "Benefício já foi pago no período… não pode ser desfeita") continuam no "Resultado/Exceção" original da regra; o texto completo está na MSG (MSG003).
- **Removido:** nada.

| MSG | Texto | Tipo | Origem (BENEFICIOPREV/Fontes/) | Jornadas |
|---|---|---|---|---|
| MSG001 | Erro ao criar datamodule "TDtmRelatorios". Mensagem de erro : <mensagem da exceção> Favor contatar o suporte da CM. | Erro | `FPrincipal.pas:790-793 (também FEventoMorte.pas:2228, FEventoAssistidoINSS.pas:1893)` | Transversal |
| MSG002 | A data de início de liberação deve ser igual ou maior a data de início de pagamento. | Erro | `fTipoLiberacao.pas:157` | JF001 |
| MSG003 | Benefício já foi pago no período de <início> a <fim>. <operação> não pode ser desfeita... | Erro | `FDesfazConcessaoBenefNOVO.pas:1531-1532 (também :3256)` | JF004 |
| MSG004 | A Folha de Benefícios com os acertos do desdobramento já foi executada. O desdobramento não pode ser desfeito. | Erro | `FDesfazConcessaoBenefNOVO.pas:4530-4531` | JF004 |
| MSG005 | Erro ao Excluir Correção monetária. Verifique. | Erro (exibida como informação) | `FDesfazConcessaoBenefNOVO.pas:935 (também :957)` | JF004 |
| MSG006 | Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura. | Informação | `FEventoReclusao.pas:245 (também FEventoMorte.pas:520)` | JF005 |
| MSG007 | Este Participante não possui nenhum dependente elegível a benefício cadastrado. Para cadastrar, utilize o Cadastro de Dependentes/Beneficiários. | Informação | `FEventoMorte.pas:1030-1031` | JF005 |
| MSG008 | Erro ao gravar Log. | Erro (exceção) | `FEventoMorte.pas:1441; FEventoReclusao.pas:855; FCadReajINSS.pas:162; FDesdobramentoBenef.pas:6316; FCadContribParticipante.pas:934` | JF005, JF006, JF008 |
| MSG009 | <mensagem da exceção de banco de dados> (exibida por MostrarErro(E)) | Erro (exceção) | `FEventoMorte.pas:1022 (padrão try/except + MostrarErro(E) em FEventoMorte, FEventoAposentaBenef, FEventoReclusao, FEventoAssistidoBenef, FEventoAssistidoINSS)` | JF005 |
| MSG010 | O Nº do Processo no INSS é obrigatório para este benefício. | Erro | `FPedeInfRevisao.pas:274` | JF008 |
| MSG011 | Preencha a Data de Requerimento. | Erro | `FPedeInfRevisao.pas:281` | JF008 |
| MSG012 | Preencha a Data de Início na Fundação. | Erro | `FPedeInfRevisao.pas:288` | JF008 |
| MSG013 | Preencha a Data de Início do Pagamento. | Erro | `FPedeInfRevisao.pas:295` | JF008 |
| MSG014 | Preencha o Tipo de Pagamento do Benefício. | Erro | `FPedeInfRevisao.pas:302` | JF008 |
| MSG015 | Erro na regra para atribuição automática de entidade contábil. | Erro | `FDesdobramentoBenef.pas:5184` | JF008 |
| MSG016 | Erro na regra para atribuição automática de conta para débito. | Erro | `FDesdobramentoBenef.pas:5226` | JF008 |
| MSG017 | Erro na regra para atribuição automática de conta para crédito. | Erro | `FDesdobramentoBenef.pas:5267` | JF008 |
| MSG018 | Erro na Regra de Cálculo - Nº <IdRegraCalculo> | Erro | `FDesdobramentoBenef.pas:2534 (também :2583, :2627, :3656, :3706, :3757)` | JF008 |
| MSG019 | Desdobramento não permitido por exceder valor limite e não ter autorização. Verifique. | Erro | `FDesdobramentoBenef.pas:2650` | JF008 |
| MSG020 | Operação NÃO Permitida. Motivo : Este Benefício já foi processado pela Prévia da Folha de Benefícios do mês <MM/AAAA>. Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. Verifique. | Informação (bloqueio) | `FReaberturaBeneficio.pas:869 (motivo em :838-839)` | JF009 |
| MSG021 | Operação NÃO Permitida. Motivo : Este Benefício já foi calculado para o mês <MM/AAAA>. Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. Verifique. | Informação (bloqueio) | `FReaberturaBeneficio.pas:869 (motivo em :858-859)` | JF009 |
| MSG022 | Nenhum Benefício selecionado para efetuar a liberação. | Erro | `FCadInicioBenefExigencia.pas:965` | JF010 |
| MSG023 | Liberação não permitida por exceder valor limite e não ter autorização. Verifique. | Erro | `FCadInicioBenefExigencia.pas:1589` | JF010 |
| MSG024 | Liberação não permitida por exceder percentual limite e não ter autorização. Verifique. | Erro | `FCadInicioBenefExigencia.pas:1608` | JF010 |
| MSG025 | Rubrica do INSS já associada! | Alerta | `_FAssocRubINSS.pas:290` | JF012 |
| MSG026 | É necessário indicar a Rubrica do INSS! | Erro (validação) | `_fCadEntrManualINSS.pas:314` | JF012 |
| MSG027 | É necessário indicar o Mês de Cobrança! | Erro (validação) | `_fCadEntrManualINSS.pas:317` | JF012 |
| MSG028 | É necessário indicar o Mês de Referência! | Erro (validação) | `_fCadEntrManualINSS.pas:320` | JF012 |
| MSG029 | É necessário indicar o Valor! | Erro (validação) | `_fCadEntrManualINSS.pas:323` | JF012 |
| MSG030 | Não é possível inserir registros em meses fechados! | Erro (validação) | `_fCadEntrManualINSS.pas:326` | JF012 |
| MSG031 | Excesso de rubricas no mesmo mês (20) | Alerta | `_fCompoeValoresRI.pas:863` | JF012 |
| MSG032 | Faltam Preencher Campos ... | Alerta | `_FCadMantenedora.pas:211; _FResultConciliacao.pas:437` | JF012 |
| MSG033 | Código já Cadastrado. | Erro | `_FCadMantenedora.pas:221` | JF012 |
| MSG034 | Os campos de datas devem estar no formato DD/MM/AAAA! | Informação | `FAlteraBeneficio.pas:249` | JF014 |
| MSG035 | Alteração realizada com sucesso! | Sucesso | `FAlteraBeneficio.pas:456` | JF014 |
| MSG036 | Arquivo já Importado | Informação | `FAlteraBeneficioLote.pas:442` | JF014 |
| MSG037 | <matrícula> <processo> Valores divergentes no <coluna da planilha> | Log de processamento | `FAlteraBeneficioLote.pas:326-327, 353-354` | JF014 |
| MSG038 | NB já existe cadastrado | Informação | `FCadProcHabINSS.pas:590 (também :625, :1341)` | JF015 |
| MSG039 | Informar moeda é obrigatório. | Erro | `FReconstruirINSS.pas:270` | JF016 |

## 9. Observações Gerais (OBS)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Observações | Legenda de evidência, padrões de `tratamento-erros.html` e notas de verificação | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:**
- **OBS001:** O módulo é um sistema desktop Delphi 5 / VCL operado por usuários; as jornadas descrevem a operação nas telas e o processamento que elas disparam.
- **OBS002:** Os tratamentos de erro (TRT) e as mensagens (MSG) foram derivados somente das validações e exceções já documentadas no Blueprint AS-IS PFC-24 (condições e resultados das regras e a aba ⚠️ Erros). O código-fonte foi usado só para conferir o texto completo e a linha de cada mensagem. Críticas encontradas no código e não documentadas no AS-IS não foram incorporadas.
- **OBS003:** As mensagens foram transcritas com a grafia original. Trechos variáveis aparecem entre < >.
- **OBS004:** O código original de cada regra (BENEF-RNxxx) e de cada processo (PF-xx) e a classificação de evidência (COMPROVADO / INFERIDO / PENDENTE) foram mantidos. Onde a leitura do código atual completa ou diverge do registro original, há uma “Nota de verificação”, sem alterar o registro.
- **OBS005:** Dois tratamentos documentados no AS-IS estão inativos no código atual: a crítica de data de início de liberação (TRT002, trecho comentado em fTipoLiberacao.pas:154-181) e as chamadas da validação de formato de data (TRT025 / RS015, FAlteraBeneficio.pas:676-721). Foram mantidos e sinalizados.
- **OBS006:** Exceções silenciadas: em _FAssocRubINSS (ExecSQL) e FReajuesteBenef (IncluirNovaLista) o except é vazio; a falha de gravação do log (TRT010) também é engolida na maioria dos forms. Situação PENDENTE no AS-IS (aba Erros).
- **OBS007:** As regras RS025, RS026, RS027 e RS045 são transversais: valem para todas as jornadas e não são repetidas em cada uma.
- **OBS008:** As jornadas JF002, JF011, JF013, JF017 e JF018 não têm regra BENEF-RN catalogada; JF017 e JF018 são executadas por componentes externos (CMAdmPrev e frmRegFalBenef).
- **Alterado / Removido:** nada.

## 10. Casos de Uso Associados

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Casos de uso associados | Painel "Dependências" de `index.html` e `integracoes.html` | funcionalidades.html |

- **Adicionado:** seção "10. Casos de Uso Associados" com CMAdmPrev, CMPrevMT50/CM Framework, UAdmPrev/UBeneficio/UParticipante, FOLHA, CONTRIBUICAOPREV, Contabilidade, `frmRegFalBenef` e LOGTOTALPREV, cada um ligado às jornadas que o usam. Cada jornada ganhou o campo "Dependências".
- **Alterado / Removido:** nada. `integracoes.html` não foi modificada.

## 11. Tabela / Programa

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Campo "Persistência (tabelas escritas)" + rotinas com arquivo:linha; entry point DPR | funcionalidades.html |

- **Adicionado:** seção "11. Tabela / Programa", com tabelas escritas e faixas de rotinas por jornada, e links para `dados.html` e `procedures-functions.html`.
- **Alterado / Removido:** nada.

## 12. Telas

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Campo "Forms de entrada" de cada processo + `Caption` de cada `.dfm` | funcionalidades.html |

- **Adicionado:** seção "12. Telas", com o título de cada tela (por exemplo, "Desfazer Operações de Benefícios" para `FDesfazConcessaoBenefNOVO.dfm` e "Reembolso do INSS - Entrada Manual de Rubricas" para `_fCadEntrManualINSS.dfm`) e o form correspondente. Forms externos (`FConsMemoriaCalculo`, não localizado em `BENEFICIOPREV/Fontes`; `frmRetroativoPrev`; `frmRegFalBenef`) estão indicados como tal.
- **Adicionado:** em JF005 e JF012 entraram telas de apoio citadas pelas regras/erros do AS-IS (`FEventoAssistidoINSS`, `_FAssocRubINSS`, `_fCadEntrManualINSS`, `_fCompoeValoresRI`, `_FCadMantenedora`, `_FResultConciliacao`), que não estavam em "Forms de entrada".
- **Alterado / Removido:** nada.

## 13. Visão Consolidada das Jornadas (critérios de aceitação)

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Visão consolidada com itens [US] e Dado/Quando/Então | **Novo.** Derivado de pré-condições, regras e tratamentos | funcionalidades.html (por jornada), regras-de-negocio.html (por regra) |

- **Adicionado:** em Funcionalidades, um item `[US] BENEF-JFnnn` por jornada, com critério Dado/Quando/Então, regras, mensagens e telas. Em Regras, um critério por regra: as regras com tratamento usam a condição, a mensagem e o resultado do TRT; as de seleção/cálculo usam um critério próprio.
- **Alterado / Removido:** nada.

## 14. Histórico de Versões

| Seção do padrão | Elemento do módulo BENEFICIOPREV | Aba docs1 afetada |
|---|---|---|
| Histórico de versões | Rodapé "Blueprint AS-IS — PFC-24 — Enriquecimento BENEFICIOPREV … Gerado em 2026-11-10" | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** tabela de versões: v1.0 (PFC-24) e v2.0 (PFC-28), ambas em 2026-11-10.
- **Alterado:** o rodapé das duas abas passou a "Blueprint AS-IS — PFC-24 / PFC-28 — Módulo BENEFICIOPREV organizado em jornadas funcionais … Atualizado em 2026-11-10".
- **Removido:** o texto de rodapé anterior (substituído).

---

## 15. Outras abas

| Aba | Ajuste | Motivo |
|---|---|---|
| `index.html` | Cards de processos com "JFnnn (PF-xx) — título"; lista de regras com "RSxxx (BENEF-RNxxx)"; dois parágrafos de introdução atualizados. **Nenhum `href` foi alterado** (lista de `href` idêntica antes e depois, verificada por script). A lista de regras do index continua mostrando só as 25 primeiras, como no AS-IS; o texto agora informa isso. | Manter a Visão Geral coerente com os novos códigos |
| `arquitetura.html`, `inventario-tecnico.html`, `procedures-functions.html`, `dados.html`, `relatorios.html`, `integracoes.html`, `tratamento-erros.html`, `diagramas-fluxo.html`, `lacunas.html`, `controle-cobertura.html` | Sem alteração | Fora do escopo (AC5) |

## 16. Achados para validação (não incorporados como conteúdo novo)

A conferência das mensagens no código encontrou pontos que o AS-IS não registra. Pela restrição de usar só o que já estava documentado, eles **não** viraram TRT/MSG e ficam aqui para triagem (por exemplo, numa atualização de `lacunas.html`):

| # | Achado | Evidência |
|---|---|---|
| A1 | A crítica "data de início de liberação ≥ data de início de pagamento" (documentada no AS-IS) está comentada. A crítica ativa na tela é outra: "Data de Início de Liberação é de preenchimento obrigatório". | `fTipoLiberacao.pas:154-181`, `:197` |
| A2 | Os seis tratadores `SetText` que chamam `CheckDate` (validação DD/MM/AAAA, BENEF-RN015) estão comentados. | `FAlteraBeneficio.pas:676-721` |
| A3 | A falha "Erro ao gravar Log." é engolida por `Except End;` vazio em quatro forms; no desdobramento, cai no except externo, que exibe "Erro ao confirmar a transação no banco de dados". | `FEventoMorte.pas:1440-1443`, `FEventoReclusao.pas:854-857`, `FCadReajINSS.pas:161-164`, `FCadContribParticipante.pas:933-936`, `FDesdobramentoBenef.pas:6325-6331` |
| A4 | Outras críticas ativas não catalogadas no AS-IS, por exemplo em `FLiberaBeneficioProvisorio` ("Informe a Data de Referência da Liberação", "Nenhum lote selecinado…") e `FParamDividaBenef` ("já existe um cadastro ativo…"). Afetam JF011 e JF013, que hoje não têm TRT. | `FLiberaBeneficioProvisorio.pas:384, 452, 519`; `FParamDividaBenef.pas:399` |
| A5 | A divergência da alteração em lote é `valor − (BS + FAB) > 0,02` (sem ABS) e só vale com `FLGOBRIGA_BS_FAB = 1`; o limite de rubricas da composição é `>= 20`. | `FAlteraBeneficioLote.pas:322-324`; `_fCompoeValoresRI.pas:862` |

## 17. Decisões de projeto

| # | Decisão | Justificativa |
|---|---|---|
| D01 | Um processo = uma jornada (PF-01..PF-18 → JF001..JF018). | Rastreabilidade 1:1 e 0 perdas (AC1). Mesma convenção de FOLHA e CONTRIBUIÇÃO. |
| D02 | `id` HTML das jornadas = código PF original; das regras = código BENEF-RN original. | Preserva as âncoras usadas por `index.html` e pelas demais abas (AC5). |
| D03 | RSnnn na mesma numeração de BENEF-RNnnn. | Mapeamento trivial e reversível (AC2). |
| D04 | TRT/MSG só a partir do que o AS-IS documenta; o código serve para conferir texto e linha. | Restrição explícita do AC3: nada inventado. Achados extras estão na seção 16. |
| D05 | Críticas sem regra BENEF-RN viraram TRT "validação de tela"/"validação técnica", e não novas regras RS. | Mantém 45 regras = 45 originais. |
| D06 | Mensagens com variações repetitivas (regra contábil: erro/nulo/inválido; "NB já existe cadastrado" em três pontos) foram agrupadas numa MSG com as demais linhas indicadas. | Catálogo de tamanho controlado sem perder a rastreabilidade. |
| D07 | Texto original de processos e regras mantido ("Registro original" / "Descrição original…"); correções do código atual entram como "Nota de verificação"; a classificação de evidência não foi alterada. | Nenhuma perda de conteúdo e nenhuma edição silenciosa da evidência PFC-24. |
| D08 | Regras RS025, RS026, RS027 e RS045 tratadas como transversais. | Valem para todo o módulo; repeti-las em cada jornada só criaria ruído. |
| D09 | As duas abas são geradas a partir de uma única estrutura de dados (jornadas, regras, TRT, MSG), com verificações automáticas de consistência (toda regra/MSG citada numa jornada pertence a ela; todo TRT/MSG é referenciado). | Referências cruzadas consistentes nas duas abas. |
| D10 | Nome do modelo não aparece em nenhuma página do docs1; navegação mantida como "⚙️ Funcionalidades" / "📏 Regras". | Mesma restrição dos precedentes; não alterar a navegação publicada (AC5). |
| D11 | Arquivo de análise nomeado `Analise_Blueprint_BeneficioPrev_Folha.md`. | `Analise_Blueprint_Folha.md` é o entregável do PFC-25 e seria sobrescrito; segue a convenção do PFC-27. |

## 18. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — 18 jornadas com identificação, objetivo, sequência, ações práticas (8 colunas), pré/pós-condições, TRT e dependências; `id` PF-01..PF-18 mantidos | OK | 18 `pf-block` em `funcionalidades.html`; 50 linhas de ações práticas |
| AC2 — 45 regras RS com código BENEF-RN, título, descrição de negócio, campos classificados, evidência e classificação; `id` BENEF-RN001..045 mantidos | OK | 45 `rule-block` em `regras-de-negocio.html` |
| AC3 — TRT/MSG derivados só do AS-IS, cada TRT com condição, MSG, resultado e regra/jornada | OK | Seções 7 e 8 das duas abas; seção 16 deste documento lista o que ficou de fora |
| AC4 — documento de análise com as 14 seções mapeadas (adicionado/alterado/removido) | OK, com nome ajustado | Este arquivo, seções 1–14 (ver D11) |
| AC5 — navegação e links preservados; 10 abas sem alteração; `href` do `index.html` preservados | OK | Verificação de todos os `href` de `docs1/` (arquivo + âncora): 0 quebrados; `git diff --stat` mostra só `funcionalidades.html`, `regras-de-negocio.html` e `index.html` em `docs1/beneficioprev/` |

---

*Fim do relatório de análise.*
