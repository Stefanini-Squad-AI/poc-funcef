# Análise Blueprint CONTRIBUIÇÃO — Adaptação ao padrão de jornadas funcionais

**Issue:** PFC-27 — Adaptação CONTRIBUIÇÃO · **Revisão:** PFC-30 — Adaptação BENEFICIOPREV 2 (realinhamento do módulo Contribuição após o enriquecimento PFC-23)
**Data:** 2026-11-10 (PFC-27) · 2026-11-10 (revisão PFC-30)
**Documento de referência (somente apresentação):** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf`, na raiz do repositório
**Blueprint alvo:** `docs1/contribuicao/` (módulo Contribuição Previdenciária, Blueprint AS-IS PFC-21)
**Precedentes seguidos:** PFC-25 — FOLHA (`Analise_Blueprint_Folha.md`), PFC-28 — BENEFICIOPREV (`Analise_Blueprint_BeneficioPrev_Folha.md`) e PFC-29 — correção FOLHA

> **Título do card PFC-30.** O card se chama "Adaptação BENEFICIOPREV 2", mas a descrição pede o ajuste do módulo **CONTRIBUIÇÃO** no docs1 e a atualização deste arquivo. A revisão seguiu a descrição; o módulo `docs1/beneficioprev/` não foi alterado. Vale confirmar o título com o solicitante.

> O documento de referência foi usado só como modelo de apresentação. Nenhuma página de `docs1/contribuicao/` o cita: a busca por "UC097" e pelo nome do PDF nas nove páginas do módulo (index, Arquitetura, Inventário, Formulários, Processos, Rotinas, Regras, Dados, Integrações) retorna 0 ocorrências, também depois da revisão PFC-30. Este arquivo de análise é o único lugar onde ele é nomeado.

---

## 0. Resumo executivo

Antes desta issue, o Blueprint do módulo Contribuição tinha 10 processos (PF-01 a PF-10) e 28 regras (CONTRIB-RN001 a CONTRIB-RN028), organizados a partir do código-fonte. Cada processo tinha forms, lógica, saídas, persistência e evidência. Cada regra tinha descrição, condições, dados, resultado/exceção, origem e evidência.

O padrão adotado organiza a documentação em **jornadas funcionais**, com estas seções: identificação, descrição resumida, pré/pós-condições, jornadas com sequência operacional e tabela de ações práticas, regras de jornada (RS), tratamentos de erro (TRT), catálogo de mensagens (MSG), observações (OBS), casos de uso associados, tabela/programa, telas, visão consolidada com critérios de aceitação e histórico de versões.

Resultado:

| Item | Antes | Depois | Perdas |
|---|---|---|---|
| Processos → jornadas | 10 (PF-01..PF-10) | 10 (JF001..JF010), mapeamento 1:1 | 0 |
| Regras → regras de jornada | 28 (CONTRIB-RN001..028) | 28 (RS001..RS028), mapeamento 1:1 | 0 |
| Tratamentos de erro | — | 53 (TRT001..TRT053); 19 ligados a 18 regras, 34 "validação de tela" | — |
| Mensagens | — | 100 (MSG001..MSG100), transcritas do código com arquivo:linha | — |
| Ações práticas | — | 45 linhas de ação nas 10 jornadas | — |
| Links/âncoras usados pelas outras abas | 10 `#PF-xx` + 28 `#CONTRIB-RNxxx` | os mesmos 38 `id` mantidos | 0 quebrados |

**Abas alteradas:** `funcionalidades.html` (reestruturada), `regras-de-negocio.html` (reestruturada), `index.html` (só rótulos e textos; nenhum `href` alterado).
**Abas sem alteração:** `arquitetura.html`, `dados.html`, `integracoes.html`.

**Fonte do conteúdo novo:** as ações práticas, os tratamentos, as mensagens e as telas foram levantados nos forms Delphi de `CONTRIBUICAOPREV/Fontes` (`.pas` lidos em Latin-1). São 25 units, entre elas `FPreparaEnvia`, `FRecebeContribuicaoNovo`, `FRecebeContribEmptmo`, `FBaixaContribCAR`, `FAtualizaPorIndice`, `FAlimReservasReplan`, `FRodaPadraoMovReserva`, `FReajustaSalarioMantido`, `FAlteraSalPart`, `FCalcSalContr`, `fCalculoIRRF`, `FCadContribuicaoPortada`, `FBeneficioSaldadoFAB`, `fCargaArquivo`, `FProvPerdasIndiv/Lote`, `FFRelProvPerdas`, `FDivergContrib`, `FConsEstatDivergContrib`, `FDesfDocContribuicao`, `FControleIndivContrib`, `FCadHstContribuicao`, `FCadContribNucleoFamiliar`, `FSimulaContrib` e `FRevisaoIndice`. Os títulos das telas vêm da propriedade `Caption` dos `.dfm`. Nada foi inventado: cada mensagem e cada tratamento aponta para o arquivo:linha de origem.

### 0.1 Revisão PFC-30 — realinhamento após o enriquecimento PFC-23

O enriquecimento PFC-23 veio depois do PFC-27 e deixou a aba Regras com dois formatos: as 28 regras de jornada (RS001–RS028) e uma seção 11 com 20 regras novas (CONTRIB-RN029–RN048) no formato antigo, sem código RS, sem campos classificados, sem tratamento de erro e sem mensagem. A aba Processos não ligava essas regras a nenhuma jornada. O PFC-23 também trocou o badge "Jornadas Funcionais (v2.0)" por "PFC-23 (enriquecido)", renomeou a aba "Funcionalidades" para "Processos", incluiu as abas Inventário, Formulários e Rotinas e passou a dizer no cabeçalho da aba Processos que havia "fluxogramas". A conferência mostrou que **não há fluxogramas**: nenhuma das nove páginas tem diagrama (`<svg>`, `mermaid`, `<pre>` ou imagem), e a aba Processos mudou só 13 linhas no PFC-23 (cabeçalho e navegação). O texto foi corrigido (decisão D14).

A revisão PFC-30 converteu as 20 regras ao padrão de jornada, ligou cada uma às jornadas, aos tratamentos e às mensagens, e removeu a seção em formato antigo depois de incorporar todo o seu conteúdo.

| Item | Após PFC-27 | Após PFC-23 (antes da revisão) | Após PFC-30 | Perdas |
|---|---|---|---|---|
| Jornadas | 10 (JF001..JF010) | 10 | 10 | 0 |
| Regras no padrão de jornada | 28 (RS001..RS028) | 28 | **48 (RS001..RS048)** | 0 |
| Regras no formato antigo | 0 | 20 (CONTRIB-RN029..048) | **0** | 0 (88 de 88 atributos originais mantidos) |
| Tratamentos de erro (TRT) | 53 | 53 | **62** (+9: TRT054..TRT062) | 0 |
| TRT ligados a regras / "validação de tela" | 19 (18 regras) / 34 | 19 / 34 | **32 (30 regras) / 30** | 0 |
| Regras de seleção/cálculo (sem mensagem própria) | 10 | 10 | 18 | — |
| Mensagens (MSG) | 100 | 100 | **115** (+15: MSG101..MSG115) | 0 |
| Ações práticas | 45 | 45 | **48** (+3) | 0 |
| Jornadas com regra catalogada | 7 | 7 | 9 (só JF010 sem regra) | — |
| Âncoras do módulo | 10 `#PF-xx` + 28 `#CONTRIB-RNxxx` | 10 + 48 | 10 + 48 (mesmos `id`) | 0 links quebrados em `docs1/` |

**Abas alteradas na revisão:** `regras-de-negocio.html` (conversão das 20 regras, mapa, catálogos, observações, visão consolidada, histórico), `funcionalidades.html` (sequências, ações práticas, listas de regras/TRT/MSG das jornadas, catálogos, telas, tabela/programa, visão consolidada, histórico, cabeçalho), `index.html` do módulo (resumo e lista de regras, rótulos de navegação, painel de contagem) e `docs1/index.html` (card do módulo).
**Abas sem alteração:** `arquitetura.html`, `inventario.html`, `formularios.html`, `rotinas.html`, `dados.html`, `integracoes.html`.

**Fonte do conteúdo novo:** cada regra, tratamento e mensagem nova foi conferido nos `.pas` de `CONTRIBUICAOPREV/Fontes` (lidos em Latin-1): `FControleIndivContrib`, `FPreparaEnvia`, `FRecebeContribuicao`, `FDivergContrib`, `FAlteracaoBeneficioSaldadoFAB`, `FCalcSalContr`, `fCalculoIRRF`, `FProvPerdasLote`, `FAtualizaPorIndice`, `FCadContribuicaoPortada`, `FRecebeContribEmptmo` e `FBaixaContribCAR`. Onde o código atual difere do registro PFC-23, a diferença entrou como "Nota de verificação" e o texto original foi mantido.

---

## 1. Identificação

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Caso de uso / Sistema / Tipo / Ator / Referência | Painel "Informações" de `index.html` (ID do módulo, DPR, Application.Title, tecnologia) | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "1. Identificação" no topo das duas abas, com caso de uso, sistema (`ContribuicaoPREV.dpr`, Application.Title "Manutenção e Cobrança de Contribuição"), tipo (desktop Delphi 5/VCL/Oracle/MIDAS), ator (analistas de arrecadação, reservas, cadastro, tributação e contabilidade) e referência (PFC-27, base PFC-21).
- **Alterado:** o badge do `<header>` passou a "Blueprint AS-IS — Delphi 5 — Jornadas Funcionais (v2.0)".
- **Removido:** nada.
- **Revisão PFC-30:** *Alterado* — o badge das duas abas passou de "PFC-23 (enriquecido)" para "Jornadas Funcionais (v4.0) — PFC-23 (enriquecido)", e a Referência passou a citar o PFC-30 além do PFC-27. *Adicionado / Removido:* nada.

## 2. Descrição Resumida

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Descrição resumida | "Visão Geral do Módulo" e "Responsabilidades" de `index.html` | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "2. Descrição Resumida" nas duas abas, com o propósito do módulo e a organização em 10 jornadas e 28 regras de jornada.
- **Alterado:** o subtítulo do `<header>` das duas abas foi reescrito para descrever o novo conteúdo. Os subtítulos anteriores ("10 processos funcionais com entradas, processamento…" e "28 regras com identificador, condições…") foram substituídos, porque descreviam a estrutura antiga.
- **Removido:** nada além do texto de subtítulo substituído.
- **Revisão PFC-30:** *Alterado* — a descrição das duas abas passou de 28 para 48 regras de jornada (RS001–RS048), informando que RS029–RS048 vêm do PFC-23; o subtítulo da aba Regras deixou de falar em "regras adicionais" e o da aba Processos deixou de citar fluxogramas (D14) e passou a informar as faixas RS001–RS048, TRT001–TRT062 e MSG001–MSG115; o link "⚙️ Funcionalidades" do texto da aba Regras passou a "⚙️ Processos". *Adicionado / Removido:* nada.

## 3. Pré-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Não existiam por processo. Foram derivadas das dependências (`index.html`, `integracoes.html`) e das validações de abertura dos forms | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "3. Pré-condições" (DPR disponível, Oracle acessível, motivos padrão parametrizados, cadastros base, integrações e período contábil aberto) e o campo "Pré-condições" em cada jornada. Exemplos: JF001 exige motivo padrão de cobrança (`FPreparaEnvia.pas:2028`); JF005 exige que a prévia da folha não esteja em execução (`fCalculoIRRF.pas:808`).
- **Alterado / Removido:** nada.
- **Revisão PFC-30:** sem alteração; as pré-condições gerais já cobrem as novas regras.

## 4. Pós-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campos "Saídas" e "Persistência (tabelas escritas)" de cada processo | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "4. Pós-condições" (situação de HSTCONTRIBPREV 0/1/≥2, documentos e lançamentos coerentes, log de auditoria) e o campo "Pós-condições" em cada jornada, derivado de Saídas e Persistência.
- **Alterado:** nada. Os campos Saídas e Persistência continuam no registro original de cada jornada.
- **Removido:** nada.
- **Revisão PFC-30:** sem alteração; as pós-condições das jornadas já descrevem os dados gravados pelas novas regras.

## 5. Jornadas Funcionais (objetivo, sequência operacional, ações práticas)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Jornada (código, título, objetivo) | Processo PF-xx (título e lógica de processamento) | funcionalidades.html |
| Sequência operacional numerada | Campo "Lógica de processamento", detalhado com as validações e etapas dos forms | funcionalidades.html |
| Ações práticas (Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela) | **Novo.** Derivado dos forms (botões/rotinas), das regras, das mensagens e do `Caption` das telas | funcionalidades.html |

**Correspondência processos → jornadas:**

| Jornada | Processo original (`id` mantido) | Título | Telas (forms) | Ações práticas | Regras (RS) | TRT | MSG |
|---|---|---|---|---|---|---|---|
| JF001 | PF-01 | Manutenção e cobrança de contribuições (Preparo e Envio) | `FPreparaEnvia.dfm` | 6 → 7 | RS013, RS014, RS015, RS016, RS017, RS026, RS027 **+ RS031, RS033, RS034, RS035, RS036, RS047, RS048** | 6 → 7 | 10 → 11 |
| JF002 | PF-02 | Recebimento por múltiplos canais | `FRecebeContribuicaoNovo.dfm`, `FRecebeContribEmptmo.dfm`, `FBaixaContribCAR.dfm` | 5 | RS024, RS028 **+ RS032, RS045, RS046** | 6 → 7 | 9 → 11 |
| JF003 | PF-03 | Alimentação de reservas | `FAlimReservasReplan.dfm`, `FAtualizaPorIndice.dfm`, `FRodaPadraoMovReserva.dfm` | 4 | — → **RS043** | 5 | 10 |
| JF004 | PF-04 | Salário de participação / manutenção | `FReajustaSalarioMantido.dfm`, `FAlteraSalPart.dfm` | 3 | RS023, RS025 | 4 | 7 |
| JF005 | PF-05 | Tributação — Bitributação / IR Regressivo | `FCalcSalContr.dfm`, `fCalculoIRRF.dfm`, `FCadContribuicaoPortada.dfm` | 4 | RS006, RS022 **+ RS040, RS041** | 4 → 6 | 6 → 10 |
| JF006 | PF-06 | Portabilidade e Benefício Saldado/FAB | `FCadContribuicaoPortada.dfm`, `FBeneficioSaldadoFAB.dfm`, `fCargaArquivo.dfm`, `FAlteracaoBeneficioSaldadoFAB.dfm` (PFC-30) | 7 | RS001–RS008 **+ RS039, RS044** | 11 → 12 | 19 → 21 |
| JF007 | PF-07 | Provisão para perdas | `FProvPerdasIndiv.dfm`, `FProvPerdasLote.dfm`, `FFRelProvPerdas.dfm` | 3 | RS020, RS021 **+ RS042** | 4 | 9 |
| JF008 | PF-08 | Tratamento de divergências e inconsistências | `FDivergContrib.dfm`, `FConsEstatDivergContrib.dfm`, `FDesfDocContribuicao.dfm` | 4 → 5 | — → **RS032, RS037, RS038** | 5 → 8 | 10 → 14 |
| JF009 | PF-09 | Controle individual / Entrada manual | `FControleIndivContrib.dfm`, `FCadHstContribuicao.dfm`, `FCadContribNucleoFamiliar.dfm` | 5 → 6 | RS009, RS010, RS011, RS012, RS018, RS019 **+ RS029, RS030, RS031** | 8 → 10 | 16 → 18 |
| JF010 | PF-10 | Retroativo e Simulação | `FSimulaContrib.dfm`, `FRevisaoIndice.dfm`, `dmRetroativoLote (externo)` | 4 | — | 5 | 10 |

- **Adicionado:** em cada jornada: objetivo, ator/gatilho (tela de entrada), pré-condições, pós-condições, sequência operacional numerada com referências `[RSxxx]` e `[TRTxxx]`, tabela de ações práticas com as 8 colunas do padrão, regras da jornada, tratamentos, mensagens, telas e dependências entre jornadas.
- **Alterado:** o título do bloco passou de "PF-xx — título" para "JFnnn (PF-xx) — título". O `id` do bloco foi mantido (`id="PF-01"` … `id="PF-10"`), então os links de `index.html` continuam funcionando.
- **Alterado:** os campos originais (Forms de entrada, Lógica de processamento, Saídas, Persistência, Evidência com classificação) foram para um quadro "Registro original do processo" no fim de cada jornada, com o texto sem alteração.
- **Removido:** nada. 10 de 10 processos estão presentes.

> Os números da tabela acima mostram o estado após a revisão PFC-30; "a → b" indica a contagem do PFC-27 e a atual, e o negrito marca as regras ligadas na revisão.

- **Revisão PFC-30 — Adicionado:** passos na sequência operacional de JF001, JF002, JF003, JF005, JF006, JF007, JF008 e JF009 com as referências `[RSxxx]`/`[TRTxxx]` das novas regras (18 passos); 3 ações práticas novas — "Marcar opção BPD" (JF001, RS047), "Manter margem de aceitação" (JF008, RS032, MSG115) e "Cancelar (desfazer) envio no controle individual" (JF009, RS030/RS031, MSG101/MSG102); a tela `FAlteracaoBeneficioSaldadoFAB.dfm` ("Benefício Saldado e FAB", alteração) na JF006.
- **Revisão PFC-30 — Alterado:** 15 ações práticas existentes receberam as novas regras na coluna Regras (e, quando há, as novas mensagens e o complemento do comportamento esperado); as listas "Regras de negócio da jornada", "Tratamentos de erro" e "Mensagens" das 9 jornadas afetadas; o texto "nenhuma regra CONTRIB-RN catalogada" de JF003 e JF008 foi substituído pela lista de regras (JF010 continua sem regra); a seção "6. Regras de Negócio por Jornada".
- **Revisão PFC-30 — Removido:** nada. JF004 e JF010 não receberam regra nova (nenhuma das 20 regras pertence a elas).

## 6. Regras de negócio da jornada (RS)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Código da regra | Código CONTRIB-RNxxx (mantido como `id` e mostrado ao lado do RS) | regras-de-negocio.html |
| Título | Rótulo curto da regra na lista de `index.html` | regras-de-negocio.html |
| Descrição em linguagem de negócio | **Novo.** Reescrita a partir da descrição técnica e do código | regras-de-negocio.html |
| Campos de dados [obrigatório]/[opcional]/[condicional] | "Dados envolvidos" + "Condições", detalhados com os campos de tela/tabela do código | regras-de-negocio.html |
| Regras por jornada | **Novo.** Lista em cada jornada e seção "6. Regras de Negócio por Jornada" | funcionalidades.html |

**Correspondência regras → regras de jornada:**

| Regra de jornada | Código original (`id` mantido) | Título | Jornada(s) | Tratamento (TRT) | Evidência |
|---|---|---|---|---|---|
| RS001 | CONTRIB-RN001 | Mês de vínculo da portabilidade válido | JF006 | TRT025 | COMPROVADO |
| RS002 | CONTRIB-RN002 | Ano/mês de referência obrigatório | JF006 | TRT026 | COMPROVADO |
| RS003 | CONTRIB-RN003 | Valor esperado maior que zero | JF006 | TRT027 | COMPROVADO |
| RS004 | CONTRIB-RN004 | Contribuição recebida não pode ser alterada | JF006 | TRT028 | COMPROVADO |
| RS005 | CONTRIB-RN005 | Contribuição enviada não pode ser alterada/excluída | JF006 | TRT029 | COMPROVADO |
| RS006 | CONTRIB-RN006 | Opção de IR obrigatória | JF005, JF006 | TRT023 | COMPROVADO |
| RS007 | CONTRIB-RN007 | Exclusão de portabilidade exige excluir contribuições | JF006 | TRT030 | COMPROVADO |
| RS008 | CONTRIB-RN008 | Importação exige arquivo válido | JF006 | TRT031 | COMPROVADO |
| RS009 | CONTRIB-RN009 | Data de emissão por situação | JF009 | — (seleção/cálculo) | COMPROVADO |
| RS010 | CONTRIB-RN010 | Valor e data de recebimento conjuntos | JF009 | TRT045 | COMPROVADO |
| RS011 | CONTRIB-RN011 | Situação coerente com recebimento | JF009 | TRT046 | COMPROVADO |
| RS012 | CONTRIB-RN012 | Salário e percentual positivos na edição | JF009 | TRT047 | COMPROVADO |
| RS013 | CONTRIB-RN013 | Preparo filtra pelo último mês preparado | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS014 | CONTRIB-RN014 | Envio marca a contribuição como enviada | JF001 | TRT006 | COMPROVADO |
| RS015 | CONTRIB-RN015 | Desfazer preparo reinicia a situação | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS016 | CONTRIB-RN016 | Atualiza o último mês preparado | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS017 | CONTRIB-RN017 | Envio de base inclui contribuições em atraso | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS018 | CONTRIB-RN018 | Recebida ou enviada não pode ser alterada | JF009 | TRT043 | COMPROVADO |
| RS019 | CONTRIB-RN019 | TMPDESC não verificada para não enviadas | JF009 | — (seleção/cálculo) | COMPROVADO |
| RS020 | CONTRIB-RN020 | Provisão em lote exige parâmetros | JF007 | TRT034 | COMPROVADO |
| RS021 | CONTRIB-RN021 | Relatório de provisão exige parâmetros | JF007 | TRT037 | COMPROVADO |
| RS022 | CONTRIB-RN022 | Saldo de contribuições via bitributação | JF005 | TRT020, TRT021 | COMPROVADO |
| RS023 | CONTRIB-RN023 | Evolução funcional fecha o cargo anterior | JF004 | — (seleção/cálculo) | COMPROVADO |
| RS024 | CONTRIB-RN024 | Filtro de recebimento via folha | JF002 | TRT009 | COMPROVADO |
| RS025 | CONTRIB-RN025 | Alteração de salários em lote via Excel | JF004 | TRT019 | COMPROVADO |
| RS026 | CONTRIB-RN026 | Divergência de plano contábil questiona o usuário | JF001 | — (seleção/cálculo) | INFERIDO |
| RS027 | CONTRIB-RN027 | Filtro de envio por evento | JF001 | — (seleção/cálculo) | INFERIDO |
| RS028 | CONTRIB-RN028 | Documentos CaR por data de recebimento | JF002 | — (seleção/cálculo) | INFERIDO |
| RS029 | CONTRIB-RN029 | Contribuição recebida não pode ser alterada no controle individual | JF009 | TRT043 | COMPROVADO |
| RS030 | CONTRIB-RN030 | Documento baixado no Contas a Receber não pode ser desfeito | JF009 | TRT054 | COMPROVADO |
| RS031 | CONTRIB-RN031 | Boleta enviada ao banco bloqueia o desfazer | JF001, JF009 | TRT055 | COMPROVADO |
| RS032 | CONTRIB-RN032 | Divergência aceita dentro da margem de aceitação | JF002, JF008 | TRT062 | COMPROVADO |
| RS033 | CONTRIB-RN033 | Contribuição “só base” é enviada com valor zero | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS034 | CONTRIB-RN034 | Competência de 13º usa o salário de 13º | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS035 | CONTRIB-RN035 | Contribuição associada paga pela patrocinadora | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS036 | CONTRIB-RN036 | Encerramento automático de contribuições com data final | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS037 | CONTRIB-RN037 | Tratamento de divergência por modo | JF008 | TRT038, TRT056 | COMPROVADO |
| RS038 | CONTRIB-RN038 | Ação judicial vigente impede cobrança ou desconto | JF008 | TRT057 | COMPROVADO |
| RS039 | CONTRIB-RN039 | Benefício saldado calculado pelo package Oracle | JF006 | — (seleção/cálculo) | COMPROVADO |
| RS040 | CONTRIB-RN040 | Bitributação corrigida pela moeda 557 e pelo IPCA-E | JF005 | TRT021 | COMPROVADO |
| RS041 | CONTRIB-RN041 | IR regressivo restrito aos planos 66 e 74 | JF005 | TRT058, TRT059, TRT022 | COMPROVADO |
| RS042 | CONTRIB-RN042 | Provisão para perdas pela faixa de dias de atraso | JF007 | — (seleção/cálculo) | COMPROVADO |
| RS043 | CONTRIB-RN043 | Atualização de reserva por índice | JF003 | TRT015 | COMPROVADO |
| RS044 | CONTRIB-RN044 | Portabilidade exige os campos obrigatórios | JF006 | TRT060, TRT023, TRT025, TRT030 | COMPROVADO |
| RS045 | CONTRIB-RN045 | Recebimento via empréstimo exige valor igual ao contrato | JF002 | TRT010 | COMPROVADO |
| RS046 | CONTRIB-RN046 | Três inadimplências consecutivas ajustam o evento de inadimplência | JF002 | TRT061 | COMPROVADO |
| RS047 | CONTRIB-RN047 | Opção BPD exclui PGA e Envio | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS048 | CONTRIB-RN048 | Gravação parcial a cada 800 registros no preparo | JF001 | — (seleção/cálculo) | COMPROVADO |

- **Adicionado:** código RS (RS001–RS028, mesma ordem dos CONTRIB-RN), título, descrição de negócio, campos de dados classificados, tratamento de erro (TRT → MSG → resultado) e jornada com link.
- **Adicionado:** na aba Regras, a seção "5. Mapa de Regras por Jornada" e a seção "10. Visão Consolidada — Critérios de Aceitação por Regra" (Dado/Quando/Então).
- **Adicionado:** "Notas de verificação" onde a leitura do código atual completa ou precisa o registro original, sem substituí-lo:
  - **RS001:** a crítica está no campo `edtmeses` (`FCadContribuicaoPortada.pas:793-800`). Vazio assume 0.
  - **RS006:** a mensagem é exibida em `FCadContribuicaoPortada.pas:384`. A origem original (:323) foi mantida.
  - **RS012:** a crítica vale só para `IDPLANPREVCONTAB` 66 e 74 (`FCadHstContribuicao.pas:1218-1227`, SIG 61677).
  - **RS018:** implementação em `FControleIndivContrib.pas:2140-2153`.
  - **RS023:** regra de CtrlObjects, associada à JF004.
  - **RS026:** texto da pergunta não localizado. Continua INFERIDO.
- **Alterado:** o `rule-id` passou de "CONTRIB-RNxxx" para "RSxxx (CONTRIB-RNxxx) — Título". O `id` HTML foi mantido (`id="CONTRIB-RN001"` …), então os 28 links de `index.html` continuam funcionando.
- **Alterado:** os atributos originais (descrição, condições, dados envolvidos, resultado/exceção, origem e evidência COMPROVADO/INFERIDO/PENDENTE) estão em cada bloco com o texto original.
- **Removido:** nada. 28 de 28 regras estão presentes. Classificação mantida: 25 COMPROVADO e 3 INFERIDO (RS026–RS028).

**Revisão PFC-30 — conversão das regras CONTRIB-RN029..RN048:**

| Regra PFC-23 (título original) | Regra de jornada (título novo) | Jornada(s) | Tratamento | Campos classificados |
|---|---|---|---|---|
| CONTRIB-RN029 — Situação da contribuição bloqueia alteração (SITRECEBIMENTO > 1) | RS029 — Contribuição recebida não pode ser alterada no controle individual | JF009 | TRT043 | 2 |
| CONTRIB-RN030 — Documento baixado no CAR não pode ser desfeito (STATUS='2') | RS030 — Documento baixado no Contas a Receber não pode ser desfeito | JF009 | TRT054 | 2 |
| CONTRIB-RN031 — Boleta enviada ao banco bloqueia desfazer (EMISBLOQ='S') | RS031 — Boleta enviada ao banco bloqueia o desfazer | JF001, JF009 | TRT055 | 2 |
| CONTRIB-RN032 — Divergência aceita por margem (VLRACEITADIVERG) | RS032 — Divergência aceita dentro da margem de aceitação | JF002, JF008 | TRT062 | 3 |
| CONTRIB-RN033 — Tipo de valor da contribuição (FLGTPVLR: B/V/E) | RS033 — Contribuição “só base” é enviada com valor zero | JF001 | seleção/cálculo | 3 |
| CONTRIB-RN034 — Mês 13º usa salário SALPARTIC13 | RS034 — Competência de 13º usa o salário de 13º | JF001 | seleção/cálculo | 4 |
| CONTRIB-RN035 — Contribuição associada (FLGPAGADOR='E' usa CONTRIBPREVPATRO) | RS035 — Contribuição associada paga pela patrocinadora | JF001 | seleção/cálculo | 3 |
| CONTRIB-RN036 — Encerramento de contribuição (DATAFINAL = ULTMESPREPARO → FLGCOBRA=0) | RS036 — Encerramento automático de contribuições com data final | JF001 | seleção/cálculo | 3 |
| CONTRIB-RN037 — Tratamento de divergência por modo (9 tratamentos) | RS037 — Tratamento de divergência por modo | JF008 | TRT038, TRT056 | 4 |
| CONTRIB-RN038 — Ação judicial vigente impede cobrança | RS038 — Ação judicial vigente impede cobrança ou desconto | JF008 | TRT057 | 3 |
| CONTRIB-RN039 — Cálculo do Benefício Saldado via package Oracle | RS039 — Benefício saldado calculado pelo package Oracle | JF006 | seleção/cálculo | 5 |
| CONTRIB-RN040 — Bitributação: correção por moeda 557 e IPCA-E (285) | RS040 — Bitributação corrigida pela moeda 557 e pelo IPCA-E | JF005 | TRT021 | 3 |
| CONTRIB-RN041 — IR Regressivo restrito a planos 66 e 74 | RS041 — IR regressivo restrito aos planos 66 e 74 | JF005 | TRT058, TRT059, TRT022 | 4 |
| CONTRIB-RN042 — Provisão para perdas = (TOTALESPERADO / 100) × PERCENTUAL | RS042 — Provisão para perdas pela faixa de dias de atraso | JF007 | seleção/cálculo | 4 |
| CONTRIB-RN043 — Atualização de reserva por índice (dValor × COTVALOR) | RS043 — Atualização de reserva por índice | JF003 | TRT015 | 4 |
| CONTRIB-RN044 — Portabilidade exige opção IR e tempo de vínculo | RS044 — Portabilidade exige os campos obrigatórios | JF006 | TRT060, TRT023, TRT025, TRT030 | 4 |
| CONTRIB-RN045 — Recebimento via empréstimo exige valor igual ao contrato | RS045 — Recebimento via empréstimo exige valor igual ao contrato | JF002 | TRT010 | 2 |
| CONTRIB-RN046 — Três inadimplências consecutivas disparam evento de inadimplência | RS046 — Três inadimplências consecutivas ajustam o evento de inadimplência | JF002 | TRT061 | 3 |
| CONTRIB-RN047 — BPD mutuamente exclusivo com PGA e Envio | RS047 — Opção BPD exclui PGA e Envio | JF001 | seleção/cálculo | 3 |
| CONTRIB-RN048 — Commit parcial a cada 800 registros (ictMaxCommit) | RS048 — Gravação parcial a cada 800 registros no preparo | JF001 | seleção/cálculo | 2 |

- **Adicionado:** para cada uma das 20 regras: código RS029–RS048 (mesma numeração do CONTRIB-RN), título, descrição em linguagem de negócio, campos de dados classificados [obrigatório]/[opcional]/[condicional] (63 campos), tratamento de erro (TRT → MSG → resultado) ou a indicação "seleção/cálculo", jornada com link e critério Dado/Quando/Então na visão consolidada; 20 linhas novas no mapa de regras por jornada.
- **Adicionado:** "Notas de verificação" onde o código atual completa ou corrige o registro PFC-23:
  - **RS029:** a mensagem já estava catalogada (MSG079, TRT043); a situação 1 com documento é coberta pela RS018.
  - **RS031:** a mesma verificação de boleta enviada ao banco existe no controle individual (`FControleIndivContrib.pas:2354-2362`), por isso a regra também está na JF009.
  - **RS032:** o cálculo está em `FRecebeContribuicao.pas`, unit da versão anterior do recebimento via folha que não consta do `ContribuicaoPREV.dpr`; a margem é mantida em `FDivergContrib.pas:4436-4450`, que recusa valor zero (MSG115).
  - **RS033:** o código testa FLGTPVLR = 'B' ou 'N' (`FPreparaEnvia.pas:3121-3123`); os significados 'V'/'E' só existem no registro PFC-23.
  - **RS034:** a exceção SIG62812 (plano 66 / patrocinadora 1) vale para o salário de participação (`:1809-1811`), não para o salário da regra (`:1188-1196`).
  - **RS036:** contribuições de assistido (FLGINTERNO = 'AS') não são encerradas (`FPreparaEnvia.pas:1970-1977`).
  - **RS037:** a tela lista 10 opções (`FDivergContrib.pas:4541-4550`) e o comentário de cabeçalho 9 códigos OPTRATDIVERG (`:619-630`).
  - **RS039:** a fórmula do registro PFC-23 está em código comentado (`FAlteracaoBeneficioSaldadoFAB.pas:425-437`); o cálculo vigente é `CM.PCK_BENEFSALDFAB.FN_CALCULABS` (`:440-447`).
  - **RS044:** consolida as validações do cadastro de portabilidade; RS001, RS006 e RS007 continuam com as partes específicas.
  - **RS045:** a validação é feita no recebimento individual por matrícula (`FRecebeContribEmptmo.pas:692-697`).
  - **RS048:** o código compara um contador com `>=` (`FPreparaEnvia.pas:4173-4180`), não usa `mod`; o efeito é o mesmo.
- **Alterado:** o bloco de cada regra passou de "CONTRIB-RNxxx — título" para "RSxxx (CONTRIB-RNxxx) — título", no mesmo formato das RS001–RS028. Os atributos PFC-23 foram mantidos com o texto original, renomeados para o padrão da aba ("Descrição" → "Descrição original", "Dados" → "Dados envolvidos", "Resultado" → "Resultado/Exceção"; Objetivo, Condições, Processamento, Fórmula e Exceções ficam com o mesmo nome). O título PFC-23 está em "Título original (PFC-23)", e Rotina + Arquivo foram para o rodapé "📂 Origem". O `id` HTML foi mantido (`id="CONTRIB-RN029"` …).
- **Alterado:** a seção "6. Regras de Negócio da Jornada" passou a "(RS001–RS048)"; a seção "12. Histórico de Versões" passou a ser a 11.
- **Removido:** a seção "11. Regras adicionais descobertas em PFC-23" (formato antigo). Todo o seu conteúdo está nos blocos RS029–RS048: 88 de 88 atributos (descrição, objetivo, condições, dados, processamento, fórmula, resultado, exceções, rotina e arquivo:linha) conferidos por script, 0 perdas. Classificação: 45 COMPROVADO e 3 INFERIDO (RS026–RS028).

## 7. Tratamentos de erro (TRT)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tratamento (Condição, Mensagem, Resultado) | Campo "Resultado/Exceção" das regras + críticas `MessageDlg`/`MsgDlg`/`EValidacao`/`Abort` dos forms | funcionalidades.html (seção 7 + referências nas jornadas), regras-de-negocio.html (seção 7 + campo em cada regra) |

- **Adicionado:** catálogo TRT001–TRT053 nas duas abas, com Condição, Mensagem, Resultado, Regra e Jornada. Cada linha tem `id` (`#TRT001`…) para os links da sequência operacional.
- **Adicionado:** a coluna Regra recebe "validação de tela" nos 34 tratamentos que vêm de críticas comprovadas nos forms sem regra CONTRIB-RN correspondente. Isso cobre as jornadas JF003, JF008 e JF010, que não tinham regra catalogada. As críticas **não** foram promovidas a novas regras RS, para manter 28 = 28.
- **Removido:** nada.
- **Revisão PFC-30 — Adicionado:** TRT054–TRT062 nas duas abas, para as regras RS030, RS031, RS032, RS037, RS038, RS041, RS044 e RS046 (lista abaixo do catálogo).
- **Revisão PFC-30 — Alterado:** a coluna Regra de 9 tratamentos existentes passou a citar as novas regras que eles atendem: TRT010 (RS045), TRT015 (RS043), TRT021 (RS040), TRT022 (RS041), TRT023/TRT025/TRT030 (RS044), TRT038 (RS037) e TRT043 (RS029). Quatro deles (TRT010, TRT015, TRT022, TRT038) deixaram de ser "validação de tela". Resultado: 32 TRT ligados a 30 regras e 30 "validação de tela".
- **Revisão PFC-30 — Removido:** nada.

Catálogo completo (estado após PFC-30):

| TRT | Condição | Mensagens | Resultado | Regra | Jornada(s) |
|---|---|---|---|---|---|
| TRT001 | Mês ou ano de cobrança não preenchidos no preparo | MSG001, MSG002 | Bloqueia o preparo | validação de tela | JF001 |
| TRT002 | Tipo de cobrança não selecionado | MSG003 | Bloqueia o preparo | validação de tela | JF001 |
| TRT003 | Motivo padrão de cobrança não parametrizado | MSG004 | Bloqueia o preparo e orienta a usar a tela de Parâmetros do Módulo | validação de tela | JF001 |
| TRT004 | Data de vencimento não informada ou período contábil bloqueado | MSG008 | Interrompe o envio | validação de tela | JF001 |
| TRT005 | Preparo concluído com problemas | MSG007 | Usuário decide se o envio continua | validação de tela | JF001 |
| TRT006 | Falha ao enviar um lote ou ao lançar na contabilidade | MSG009, MSG010 | O lote com erro não é enviado; os demais seguem; o erro fica no log de resultado | RS014 (CONTRIB-RN014) | JF001 |
| TRT007 | Mês de cobrança ou data de recebimento não informados (recebimento via folha) | MSG011, MSG012 | Bloqueia o recebimento | validação de tela | JF002 |
| TRT008 | Nenhuma contribuição selecionada para receber | MSG013 | Não processa | validação de tela | JF002 |
| TRT009 | Procedure de recebimento retorna erro | MSG014 | Mensagem exibida e registrada no log de resultado; recebimento não concluído | RS024 (CONTRIB-RN024) | JF002 |
| TRT010 | Valor das contribuições em aberto diferente do valor do empréstimo | MSG015 | Impede a baixa | RS045 (CONTRIB-RN045) | JF002 |
| TRT011 | Erro na contabilização ou na integração com o PGA (recebimento via empréstimo) | MSG016, MSG017 | Cancela o processo | validação de tela | JF002 |
| TRT012 | Baixa via Contas a Receber com erro em alguma matrícula | MSG018 | Conclui as demais e lista as matrículas com erro no resultado | validação de tela | JF002 |
| TRT013 | Patrocinadora, plano ou reserva não selecionados | MSG020, MSG021, MSG022 | Bloqueia a atualização de reservas | validação de tela | JF003 |
| TRT014 | Data de atualização não preenchida | MSG023 | Bloqueia a atualização de reservas | validação de tela | JF003 |
| TRT015 | Erro durante a atualização ou a movimentação padrão de reservas | MSG024, MSG028 | Interrompe a operação | RS043 (CONTRIB-RN043) | JF003 |
| TRT016 | Falha na procedure de alimentação rápida de reservas | MSG027 | Informa o erro; reservas não alimentadas | validação de tela | JF003 |
| TRT017 | Nenhum participante mantido encontrado ou selecionado para reajuste | MSG029, MSG030 | Não processa o reajuste | validação de tela | JF004 |
| TRT018 | Erro ao reajustar o salário de um participante | MSG031, MSG032 | Usuário decide se continua com os demais | validação de tela | JF004 |
| TRT019 | Arquivo Excel ou tipo de salário (mantido/participação) não selecionados | MSG033, MSG034 | Bloqueia a alteração em lote | RS025 (CONTRIB-RN025) | JF004 |
| TRT020 | Nenhum participante selecionado para cálculo do saldo | MSG035 | Não calcula | RS022 (CONTRIB-RN022) | JF005 |
| TRT021 | Índice necessário ao cálculo não cadastrado | MSG037 | Informa e não calcula o saldo | RS022 (CONTRIB-RN022), RS040 (CONTRIB-RN040) | JF005 |
| TRT022 | Prévia da folha em execução | MSG039 | Bloqueia o cálculo do IR regressivo | RS041 (CONTRIB-RN041) | JF005 |
| TRT023 | Opção de IR (regressivo/progressivo) não informada | MSG040 | Bloqueia a gravação da portabilidade | RS006 (CONTRIB-RN006), RS044 (CONTRIB-RN044) | JF005, JF006 |
| TRT024 | Participante não selecionado na portabilidade | MSG041 | Bloqueia a operação | validação de tela | JF006 |
| TRT025 | Meses de vínculo maior que 11 | MSG042 | Bloqueia (Abort) | RS001 (CONTRIB-RN001), RS044 (CONTRIB-RN044) | JF006 |
| TRT026 | Ano/mês de referência vazio ou maior que o ano/mês de cobrança | MSG043, MSG044 | Bloqueia (Abort) | RS002 (CONTRIB-RN002) | JF006 |
| TRT027 | Valor esperado menor ou igual a zero | MSG045 | Bloqueia (Abort) | RS003 (CONTRIB-RN003) | JF006 |
| TRT028 | Alteração ou exclusão de contribuição portada já recebida | MSG046, MSG048 | Bloqueia a alteração/exclusão | RS004 (CONTRIB-RN004) | JF006 |
| TRT029 | Alteração ou exclusão de contribuição portada já enviada | MSG047, MSG049 | Bloqueia a alteração/exclusão | RS005 (CONTRIB-RN005) | JF006 |
| TRT030 | Exclusão de portabilidade que ainda tem contribuições | MSG050 | Cancela a exclusão | RS007 (CONTRIB-RN007), RS044 (CONTRIB-RN044) | JF006 |
| TRT031 | Arquivo de importação fora do formato Excel ou do layout | MSG051, MSG052 | Bloqueia a importação (Abort) | RS008 (CONTRIB-RN008) | JF006 |
| TRT032 | Arquivo de carga do benefício saldado/FAB não selecionado, com leiaute incorreto ou com benefício INSS inconsistente | MSG054, MSG055, MSG056 | Bloqueia a carga | validação de tela | JF006 |
| TRT033 | Erro na atualização/reprocessamento do BS-FAB ou na revisão de índice | MSG058 | Atualização não concluída | validação de tela | JF006, JF010 |
| TRT034 | Ano/mês de cobrança, patrocinadora ou plano não selecionados na provisão em lote | MSG059, MSG060, MSG061 | Bloqueia (EValidacao) | RS020 (CONTRIB-RN020) | JF007 |
| TRT035 | Nenhuma contribuição selecionada na provisão individual | MSG062 | Não registra/desfaz a provisão | validação de tela | JF007 |
| TRT036 | Erro no processamento da provisão para uma matrícula | MSG064 | Conclui as demais e lista as matrículas com erro | validação de tela | JF007 |
| TRT037 | Matrícula, parâmetro de pesquisa ou mês de cobrança não informados no relatório | MSG065, MSG066, MSG067 | Bloqueia o relatório (EValidacao) | RS021 (CONTRIB-RN021) | JF007 |
| TRT038 | Modo de divergência não selecionado | MSG068 | Bloqueia a consulta/tratamento | RS037 (CONTRIB-RN037) | JF008 |
| TRT039 | Filtro escolhido sem valor informado (ou datas inválidas) | MSG069, MSG071, MSG070 | Bloqueia a consulta | validação de tela | JF008 |
| TRT040 | Motivo padrão para tratamento de divergência não cadastrado | MSG072 | Bloqueia o tratamento | validação de tela | JF008 |
| TRT041 | Código do documento não informado ou não encontrado no desfazer documento | MSG073, MSG074 | Não desfaz | validação de tela | JF008 |
| TRT042 | Participante ou contribuição não selecionados no controle individual | MSG077, MSG078 | Bloqueia a operação | validação de tela | JF009 |
| TRT043 | Alteração de contribuição já recebida ou já enviada à folha/Contas a Receber | MSG079, MSG080, MSG081, MSG090 | Cancela a alteração e orienta usar Desfazer ou Tratamento de Divergência | RS018 (CONTRIB-RN018), RS029 (CONTRIB-RN029) | JF009 |
| TRT044 | Mês de cobrança/referência ou motivo não preenchidos na entrada manual | MSG083, MSG084 | Bloqueia a gravação (Abort) | validação de tela | JF009 |
| TRT045 | Valor recebido sem data de recebimento, ou data sem valor | MSG085, MSG086 | Bloqueia a gravação (Abort) | RS010 (CONTRIB-RN010) | JF009 |
| TRT046 | Situação da contribuição incoerente com o recebimento informado | MSG087, MSG088 | Bloqueia a gravação (Abort) | RS011 (CONTRIB-RN011) | JF009 |
| TRT047 | Salário ou percentual de contribuição menor ou igual a zero (planos contábeis 66 e 74) | MSG089 | Bloqueia a gravação (Abort) | RS012 (CONTRIB-RN012) | JF009 |
| TRT048 | Nenhuma contribuição selecionada no núcleo familiar | MSG091 | Bloqueia (EValidacao) | validação de tela | JF009 |
| TRT049 | Dado obrigatório da simulação não informado | MSG092, MSG096 | Bloqueia a simulação | validação de tela | JF010 |
| TRT050 | Participante inexistente para o evento simulado | MSG093 | Bloqueia a simulação | validação de tela | JF010 |
| TRT051 | Data final calculada anterior à data de início, ausência de contribuições para a categoria ou erro no cálculo de alteradores | MSG094, MSG095, MSG097 | Interrompe a simulação | validação de tela | JF010 |
| TRT052 | Data de revisão de índice ausente ou não posterior a 31/08/2006 | MSG098, MSG099 | Bloqueia a revisão | validação de tela | JF010 |
| TRT053 | Falha ao gravar o log de auditoria | MSG100 | Exceção; a transação em curso não é concluída | validação de tela | JF003, JF004, JF008, JF009 |
| TRT054 | Cancelamento (desfazer envio) no controle individual de contribuição cujo documento já foi baixado no Contas a Receber (STATUS = 2) | MSG101 | Interrompe o desfazer; nenhuma contribuição é alterada | RS030 (CONTRIB-RN030) | JF009 |
| TRT055 | Desfazer preparo/envio de contribuição cujo documento já foi enviado ao banco (boleta emitida, EMISBLOQ = S) | MSG102, MSG103 | Interrompe o desfazer e lista os documentos bloqueados | RS031 (CONTRIB-RN031) | JF001, JF009 |
| TRT056 | Modo de tratamento de divergência incompatível com a situação do participante na Fundação (AT, MA, MP, AS) ou com o sentido da divergência (pagou a mais / a menos) | MSG104, MSG105 | O registro não é tratado; o erro vai para o log de resultado e os demais seguem | RS037 (CONTRIB-RN037) | JF008 |
| TRT057 | Participante com ação judicial de déficit vigente ao cobrar ou descontar no próximo benefício | MSG106 | Não gera cobrança/desconto para a contribuição; o erro vai para o log de resultado | RS038 (CONTRIB-RN038) | JF008 |
| TRT058 | Data de pagamento não informada, ou nenhum participante selecionado, no cálculo do IR regressivo | MSG107, MSG108 | Bloqueia o cálculo, ou pede confirmação para calcular todos os participantes | RS041 (CONTRIB-RN041) | JF005 |
| TRT059 | Falha no cálculo do IRRF (prazo de acumulação) ou do prazo médio ponderado | MSG109, MSG110 | Desfaz a transação (Rollback) e interrompe o cálculo | RS041 (CONTRIB-RN041) | JF005 |
| TRT060 | Campo obrigatório da portabilidade não informado (tempo de vinculação, data de recebimento, opção de IR, CNPB/SUSEP, CNPJ ou entidade de origem) | MSG111, MSG112 | Bloqueia a gravação da portabilidade | RS044 (CONTRIB-RN044) | JF006 |
| TRT061 | Falha ao ajustar o evento de inadimplência na baixa via Contas a Receber | MSG113, MSG114 | Registra o erro na lista de resultado (ou exibe o erro); as demais matrículas seguem | RS046 (CONTRIB-RN046) | JF002 |
| TRT062 | Margem de aceitação de divergência informada com valor zero ou nulo | MSG115 | Bloqueia a gravação do parâmetro | RS032 (CONTRIB-RN032) | JF008 |

## 8. Catálogo de Mensagens (MSG)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Mensagens (código, texto, jornadas) | Textos de `MessageDlg`/`MsgDlg`/`ShowMessage`/`Application.MessageBox`/`EValidacao.CreateVal` e linhas de log dos forms | funcionalidades.html (seção 8), regras-de-negocio.html (seção 8) |

- **Adicionado:** catálogo MSG001–MSG100 nas duas abas, com Código, Texto (grafia original), Tipo, Origem (arquivo:linha) e Jornadas. Na aba Regras, também com as regras relacionadas. Cada linha tem `id` (`#MSG001`…), usado pelas tabelas de ações práticas e pelos TRT.
- **Tipos:** Erro 44, Erro (validação) 7, Erro (exceção) 1, Informação 20, Alerta 12, Aviso 1, Confirmação 4, Sucesso 9, Log de processamento 2.
- **Alterado:** os textos que o catálogo anterior citava de forma abreviada (por exemplo, "MessageDlg('já foi Enviada')") continuam no "Resultado/Exceção" original de cada regra. O texto completo está agora na MSG correspondente (por exemplo, MSG047 "Essa Contribuição já foi Enviada, Alteração não permitida").
- **Removido:** nada.
- **Revisão PFC-30 — Adicionado:** MSG101–MSG115 nas duas abas, transcritas do código com arquivo:linha (tabela abaixo). Tipos após a revisão: Erro 50, Erro (validação) 7, Erro (exceção) 1, Informação 20, Alerta 16, Aviso 1, Confirmação 5, Sucesso 9, Log de processamento 6.
- **Revisão PFC-30 — Alterado:** na aba Regras, a coluna Regras de 9 mensagens existentes passou a citar as novas regras: MSG015 (RS045), MSG024 (RS043), MSG037 (RS040), MSG039 (RS041), MSG040/MSG042/MSG050 (RS044), MSG068 (RS037) e MSG079 (RS029). Nenhum texto de mensagem foi alterado.
- **Revisão PFC-30 — Removido:** nada.

Mensagens novas (PFC-30):

| MSG | Texto (grafia original) | Tipo | Regra | Jornada | Origem (`CONTRIBUICAOPREV/Fontes/`) |
|---|---|---|---|---|---|
| MSG101 | “O documento <código> já está baixado, e não pode ser desfeito.” | Alerta | RS030 | JF009 | `FControleIndivContrib.pas:2340-2346` |
| MSG102 | “O documento <código> já está enviado, e não pode ser desfeito.” | Alerta | RS031 | JF009 | `FControleIndivContrib.pas:2356-2362` |
| MSG103 | “O(s) documento(s) <códigos> já foram enviados ao banco e não podem ser desfeitos.” | Alerta | RS031 | JF001 | `FPreparaEnvia.pas:6226` |
| MSG104 | “[ERRO  ] <matrícula> - <nome> Não foi possível <tratamento> -> Situação na Fundação: <Ativo / Mantido / Mantido Parcial / Assistido>.” | Log de processamento | RS037 | JF008 | `FDivergContrib.pas:4559-4560,4569-4570,4579-4580,4589-4590` |
| MSG105 | “[ERRO  ] <matrícula> - <nome> Não foi possível <tratamento> -> Valor Recebido maior que valor Esperado.” / “(…) -> Valor Esperado maior que valor Recebido.” | Log de processamento | RS037 | JF008 | `FDivergContrib.pas:4604-4605,4614-4615` |
| MSG106 | “[ERRO  ] Matrícula <matrícula> - <nome>: Participante possui ação judicial do tipo "<motivo>" e não teve sua contribuição <tipo de ação>” | Log de processamento | RS038 | JF008 | `FDivergContrib.pas:3757-3759,3845-3847,6442-6444` |
| MSG107 | “Preencha a data do Pagamento” | Alerta | RS041 | JF005 | `fCalculoIRRF.pas:483` |
| MSG108 | “Nenhum participante seleciondo. Confirma o cálculo para todos os participantes?” | Confirmação | RS041 | JF005 | `fCalculoIRRF.pas:502` |
| MSG109 | “Erro ao calcular IRRF” | Erro | RS041 | JF005 | `fCalculoIRRF.pas:549,592` |
| MSG110 | “Erro no Calculo Médio Ponderado” | Erro | RS041 | JF005 | `fCalculoIRRF.pas:560,610` |
| MSG111 | “O campo : <campo> é de preenchimento obrigatório.” | Erro | RS044 | JF006 | `FCadContribuicaoPortada.pas:889` |
| MSG112 | “Os campos <campos> são de preenchimento obrigatório.” | Erro | RS044 | JF006 | `FCadContribuicaoPortada.pas:900` |
| MSG113 | “[ ERRO ] - MATRICULA : <matrícula> : <erro>” / “(…) : Ocorreu um erro na atualização da inadimplência” | Log de processamento | RS046 | JF002 | `FBaixaContribCAR.pas:435,445` |
| MSG114 | “Ocorreu um erro na atualização da inadimplência[<erro>]. Verifique.” | Erro | RS046 | JF002 | `FBaixaContribCAR.pas:696,699` |
| MSG115 | “Valores zerados ou nulos não podem ser aceitos neste parâmetro.” | Erro | RS032 | JF008 | `FDivergContrib.pas:4441` |

Distribuição por jornada (estado após PFC-30; negrito = incluída no PFC-30):

| Jornada | Faixa / quantidade de mensagens |
|---|---|
| JF001 | 11 mensagens (MSG001, MSG002, MSG003, MSG004, MSG005, MSG006, MSG007, MSG008, MSG009, MSG010, **MSG103**) |
| JF002 | 11 mensagens (MSG011, MSG012, MSG013, MSG014, MSG015, MSG016, MSG017, MSG018, MSG019, **MSG113**, **MSG114**) |
| JF003 | 10 mensagens (MSG020, MSG021, MSG022, MSG023, MSG024, MSG025, MSG026, MSG027, MSG028, MSG100) |
| JF004 | 7 mensagens (MSG029, MSG030, MSG031, MSG032, MSG033, MSG034, MSG100) |
| JF005 | 10 mensagens (MSG035, MSG036, MSG037, MSG038, MSG039, MSG040, **MSG107**, **MSG108**, **MSG109**, **MSG110**) |
| JF006 | 21 mensagens (MSG040, MSG041, MSG042, MSG043, MSG044, MSG045, MSG046, MSG047, MSG048, MSG049, MSG050, MSG051, MSG052, MSG053, MSG054, MSG055, MSG056, MSG057, MSG058, **MSG111**, **MSG112**) |
| JF007 | 9 mensagens (MSG059, MSG060, MSG061, MSG062, MSG063, MSG064, MSG065, MSG066, MSG067) |
| JF008 | 14 mensagens (MSG068, MSG069, MSG070, MSG071, MSG072, MSG073, MSG074, MSG075, MSG076, MSG100, **MSG104**, **MSG105**, **MSG106**, **MSG115**) |
| JF009 | 18 mensagens (MSG077, MSG078, MSG079, MSG080, MSG081, MSG082, MSG083, MSG084, MSG085, MSG086, MSG087, MSG088, MSG089, MSG090, MSG091, MSG100, **MSG101**, **MSG102**) |
| JF010 | 10 mensagens (MSG057, MSG058, MSG092, MSG093, MSG094, MSG095, MSG096, MSG097, MSG098, MSG099) |

## 9. Observações Gerais (OBS)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Observações | Legenda de evidência e notas implícitas do Blueprint | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** OBS001–OBS006. Registram a natureza desktop do módulo, a transcrição literal das mensagens (com a grafia original), a manutenção dos códigos e da classificação de evidência, as jornadas sem regra catalogada, o status INFERIDO de RS026–RS028 e o domínio de SITRECEBIMENTO usado nas regras (0, 1, 2/3, 8).
- **Alterado / Removido:** nada.
- **Revisão PFC-30 — Alterado:** OBS004 passou a dizer que só a JF010 não tem regra catalogada; JF003 e JF008 ganharam regras (RS043; RS032, RS037, RS038).
- **Revisão PFC-30 — Adicionado:** OBS007 (origem PFC-23 das RS029–RS048 e manutenção dos atributos originais), OBS008 (regras de seleção/cálculo sem mensagem própria: RS033–RS036, RS039, RS042, RS047, RS048) e OBS009 (pontos para validação com a área de negócio: RS032, RS037, RS039).
- **Revisão PFC-30 — Removido:** nada.

## 10. Casos de Uso Associados

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Casos de uso associados | Painel "Dependências" de `index.html` e `integracoes.html` | funcionalidades.html |

- **Adicionado:** seção "10. Casos de Uso Associados" com FOLHA, Contas a Receber/CAP (CMAdmPrev), Contabilidade/PGA, EMPRESTIMO, IRRF, CMPrevMT50/CM Framework, `PCK_BENEFSALDFAB` e `dmRetroativoLote`, cada um ligado às jornadas que o usam. Cada jornada ganhou o campo "Dependências" (precede/sucede outras jornadas).
- **Alterado / Removido:** nada. `integracoes.html` não foi modificada.
- **Revisão PFC-30:** sem alteração; as dependências usadas pelas novas regras (Contas a Receber, EMPRESTIMO, IRRF, `PCK_BENEFSALDFAB`, FOLHA) já estavam listadas.

## 11. Tabela / Programa

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Campo "Persistência (tabelas escritas)" + rotinas com arquivo:linha; entry point DPR | funcionalidades.html |

- **Adicionado:** seção "11. Tabela / Programa", com tabelas escritas e faixas de rotinas por jornada e link para `dados.html`.
- **Alterado / Removido:** nada. `dados.html` não foi modificada.
- **Revisão PFC-30 — Alterado:** faixas de rotinas ampliadas para cobrir as linhas citadas pelas novas regras: JF001 `FPreparaEnvia.pas:664-6920`; JF002 `FBaixaContribCAR.pas:402-849` + `FRecebeContribuicao.pas:2866-3093` (versão anterior, fora do .dpr); JF005 `fCalculoIRRF.pas:483-1172`; JF006 + `FAlteracaoBeneficioSaldadoFAB.pas:420-454`; JF007 `FProvPerdasLote.pas:428-848`; JF008 `FDivergContrib.pas:1443-9473`. *Adicionado / Removido:* nada.

## 12. Telas

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Campo "Forms de entrada" de cada processo + `Caption` de cada `.dfm` | funcionalidades.html |

- **Adicionado:** seção "12. Telas", com o título de cada tela (por exemplo, "Envio de Contribuições" para `FPreparaEnvia.dfm` e "Cadastro Manual do Histórico de Contribuições" para `FCadHstContribuicao.dfm`) e o form correspondente. A coluna "Tela" das ações práticas mostra o form em que cada ação ocorre.
- **Alterado / Removido:** nada.
- **Revisão PFC-30 — Adicionado:** JF006 ganhou "Benefício Saldado e FAB (alteração)" — `FAlteracaoBeneficioSaldadoFAB.dfm`, form que consta do `ContribuicaoPREV.dpr` e onde está a RS039. *Alterado / Removido:* nada.

## 13. Visão Consolidada das Jornadas (critérios de aceitação)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Visão consolidada com itens [US] e Dado/Quando/Então | **Novo.** Derivado de pré-condições, validações e resultados | funcionalidades.html (por jornada), regras-de-negocio.html (por regra) |

- **Adicionado:** em Funcionalidades (hoje "Processos"), um item `[US] CONTRIB-JFnnn` por jornada, com critério Dado/Quando/Então, regras, mensagens e telas. Em Regras, um critério Dado/Quando/Então por regra: as regras com tratamento usam a condição, a mensagem e o resultado do TRT; as regras de seleção/cálculo usam a condição e o efeito descrito.
- **Alterado / Removido:** nada.
- **Revisão PFC-30 — Adicionado:** 20 critérios Dado/Quando/Então na aba Regras (RS029–RS048). **Alterado:** as colunas Regras e Mensagens dos itens `[US] CONTRIB-JF001/002/003/005/006/007/008/009` na aba Processos. **Removido:** nada.

## 14. Histórico de Versões

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Histórico de versões | Rodapé "Blueprint AS-IS — PFC-21 … Gerado em 2026-11-09" | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** tabela de versões: v1.0 (PFC-21, 2026-11-09) e v2.0 (PFC-27, 2026-11-10).
- **Alterado:** o rodapé das duas abas passou a "Blueprint AS-IS — PFC-21 / PFC-27 — Módulo CONTRIBUIÇÃO organizado em jornadas funcionais … Atualizado em 2026-11-10".
- **Removido:** o texto de rodapé anterior (substituído).
- **Revisão PFC-30 — Adicionado:** aba Regras: v4.0 (PFC-30) depois da v3.0 já registrada pelo PFC-23. Aba Processos: v3.0 (PFC-23, que não tinha sido registrada) e v4.0 (PFC-30). **Alterado:** o rodapé das duas abas passou a "PFC-21 / PFC-27 / PFC-23 (enriquecido) / PFC-30". **Removido:** nada.

---

## 15. Outras abas

| Aba | Ajuste | Motivo |
|---|---|---|
| `index.html` | Cards de processos com "JFnnn (PF-xx) — título"; lista de regras com "RSxxx (CONTRIB-RNxxx)"; dois parágrafos de introdução atualizados para falar de jornadas e catálogos TRT/MSG. **Nenhum `href` foi alterado** (mesma contagem de links antes e depois). | Manter a Visão Geral coerente com os novos códigos |
| `arquitetura.html`, `dados.html`, `integracoes.html` | Sem alteração | Fora do escopo; só recebem links das abas novas |
| `index.html` (revisão PFC-30) | Resumo de regras passou de "28 regras de jornada (RS001–RS028)" para "48 regras de jornada (RS001–RS048)" e a lista ganhou RS029–RS048 com link; navegação "⚙️ Processos + fluxogramas" → "⚙️ Processos (10 jornadas funcionais)" e "📏 Regras (14 atributos)" → "📏 Regras (48 regras de jornada)"; painel Regras "48 (28+20 novas)" → "48 (RS001–RS048)" | Contagens e rótulos iguais aos das abas (AC3) |
| `docs1/index.html` (revisão PFC-30) | Card do módulo: "48 regras · 10 processos · enriquecido PFC-23" → "48 regras (RS001–RS048) · 10 processos (JF001–JF010) · enriquecido PFC-23 · jornadas PFC-30" | Mesmos números das abas (AC3) |
| `inventario.html`, `formularios.html`, `rotinas.html` (PFC-23) | Sem alteração; foram usadas como fonte de telas, botões e rotinas. `rotinas.html` e `dados.html` citam CONTRIB-RN024/025/026/032/037/046 em texto, sem link; os códigos continuam válidos | Fora do foco obrigatório |

## 16. Decisões de projeto

| # | Decisão | Justificativa |
|---|---|---|
| D01 | Um processo = uma jornada (PF-01..PF-10 → JF001..JF010). | Rastreabilidade 1:1 e 0 perdas (AC1). Mesma convenção do FOLHA. |
| D02 | `id` HTML das jornadas = código PF original; das regras = código CONTRIB-RN original. | Preserva as âncoras usadas por `index.html` (AC5). Convenção do PFC-25. |
| D03 | RSnnn na mesma numeração de CONTRIB-RNnnn. | Mapeamento trivial e reversível. |
| D04 | Críticas de tela sem regra CONTRIB-RN viraram TRT com Regra = "validação de tela", e não novas regras RS. | Mantém 28 regras = 28 originais (AC2) e não reclassifica conteúdo sem análise funcional. |
| D05 | Mensagens transcritas literalmente, com a grafia do código, e com arquivo:linha. Famílias repetitivas (filtros do `FDivergContrib`, obrigatórios do `FSimulaContrib`) foram agrupadas em uma MSG que indica "mesmo padrão para…". | Fidelidade ao legado com catálogo de tamanho controlado. |
| D06 | O texto original de processos e regras foi mantido como "Registro original" / "Descrição original…Resultado/Exceção", e as correções encontradas no código atual entraram como "Nota de verificação". | Nenhuma perda de conteúdo e nenhuma edição silenciosa da evidência PFC-21. |
| D07 | As duas abas são geradas a partir de uma única estrutura de dados (jornadas, regras, TRT, MSG), e os códigos TRT/MSG são atribuídos em sequência por jornada. | Garante que referências cruzadas e catálogos sejam consistentes nas duas abas. |
| D08 | O nome do modelo não aparece em nenhuma página do docs1. Os termos de seção usados são genéricos ("Jornadas Funcionais", "Tratamentos de Erro", "Catálogo de Mensagens"…). | Restrição explícita do requisitante (AC3). |
| D09 | Nome da navegação mantido como "⚙️ Funcionalidades" (o FOLHA usa "Processos"). **Superada pelo PFC-23**, que renomeou a aba para "⚙️ Processos"; o PFC-30 manteve "Processos". | Não alterar a navegação já publicada do módulo (AC5). |
| D10 | (PFC-30) RS029–RS048 seguem a numeração CONTRIB-RN029–RN048, e o `id` HTML continua `CONTRIB-RNxxx`. | Mesmo mapeamento trivial da D03; rastreabilidade com o PFC-23. |
| D11 | (PFC-30) Quando o código já tinha um TRT/MSG para a crítica da nova regra (RS029, RS040, RS041, RS043, RS044, RS045, RS037), o tratamento existente foi reutilizado e ligado à regra; só as críticas sem catálogo viraram TRT054–TRT062 e MSG101–MSG115. | Evita mensagens duplicadas e mantém um TRT por crítica. |
| D12 | (PFC-30) Os novos TRT/MSG foram numerados depois dos existentes (a partir de TRT054/MSG101), e não intercalados por jornada como no PFC-27. | Não renumerar códigos já publicados (D07 vale para a geração do PFC-27). |
| D13 | (PFC-30) A seção "11. Regras adicionais" foi removida só depois de o seu conteúdo estar nos blocos RS; o título PFC-23 ficou em "Título original (PFC-23)" e a rotina no rodapé de origem. | AC1 (0 regras no formato antigo) sem perda de conteúdo (AC5). |
| D14 | (PFC-30) O cabeçalho da aba Processos e a navegação do index deixaram de citar "fluxogramas", porque nenhuma página do módulo tem diagrama; o fluxo é descrito pela sequência operacional numerada. Não foram criados fluxogramas. | O padrão adotado descreve o fluxo em passos numerados; não documentar o que não existe. |
| D15 | (PFC-30) Divergências entre o código atual e o registro PFC-23 (RS033, RS034, RS036, RS037, RS039, RS048) entraram como "Nota de verificação", sem editar o registro original; RS032, RS037 e RS039 foram listadas na OBS009 para validação. | Mesma regra da D06: nenhuma edição silenciosa da evidência. |
| D16 | (PFC-30) Novas regras ligadas a mais de uma jornada quando o código mostra a mesma crítica em duas telas: RS031 (JF001 e JF009) e RS032 (JF002 e JF008). | Cada regra fica onde o usuário a encontra. |

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — 10 processos como jornadas com objetivo, pré/pós-condições, sequência numerada e ações práticas (8 colunas) | OK | 10 `pf-block` em `funcionalidades.html` (`id` PF-01..PF-10); 45 linhas de ações práticas |
| AC2 — 28 regras no formato de regra de jornada, com catálogos de TRT e MSG e código/evidência originais | OK | 28 `rule-block` (`id` CONTRIB-RN001..028) em `regras-de-negocio.html`; seções 7 (TRT) e 8 (MSG) |
| AC3 — 0 menções ao modelo em `docs1/contribuicao/` | OK | `grep -ril "UC097\|Verificar_Elegibilidade" docs1/contribuicao` → 0 ocorrências |
| AC4 — este documento: seção por seção, elemento correspondente, aba afetada, adicionado/alterado/removido, e tabelas de correspondência 10 + 28 | OK | Seções 1–14, tabelas das seções 5 e 6 |
| AC5 — navegação e âncoras preservadas | OK | Verificação automática de todos os `href` de `docs1/` (arquivo + âncora): 0 links quebrados; nav das 6 abas inalterada |

### 17.1 Verificação de aceitação — revisão PFC-30

| AC (PFC-30) | Status | Evidência |
|---|---|---|
| AC1 — 48 regras no padrão de jornada (RS001–RS048), com título, descrição de negócio, campos classificados, jornada e tratamento (ou "seleção/cálculo"); 0 regras no formato antigo; 48 `id` CONTRIB-RNxxx mantidos | OK | 48 `rule-block` com `rule-id` "RSnnn (CONTRIB-RNnnn)" em `regras-de-negocio.html`, todos com "Campos de dados", "Tratamento de erro", "Jornada" e "📂 Origem"; seção em formato antigo removida |
| AC2 — cada jornada lista as novas regras que lhe pertencem; cada nova regra em ≥ 1 jornada; TRT/MSG nos catálogos com arquivo:linha | OK | Para as 10 jornadas, a lista "Regras de negócio da jornada" é igual ao mapa da aba Regras (conferido por script); RS029–RS048 em 1 ou 2 jornadas; TRT054–TRT062 e MSG101–MSG115 nos catálogos das duas abas, com origem `arquivo:linha` |
| AC3 — 0 âncoras quebradas nas páginas do módulo; contagens iguais nos indexes; visão consolidada e histórico com entrada desta revisão | OK | Verificação de todos os `href` das 9 páginas + `docs1/index.html` (arquivo + âncora): 0 quebrados; `#PF-01..#PF-10` e `#CONTRIB-RN001..#CONTRIB-RN048` existem; indexes com 48 regras / 10 jornadas; v4.0 no histórico das duas abas; 20 critérios novos na visão consolidada |
| AC4 — 0 menções ao modelo em `docs1/contribuicao/` | OK | `grep -rniE "UC097\|Verificar_Elegibilidade\|Verificar Elegibilidade" docs1/contribuicao` → 0 ocorrências |
| AC5 — este documento mostra, por seção, o que foi adicionado/alterado/removido; tabelas 10 + 48; contagens antes/depois; 0 perdas | OK | Seção 0.1 (antes/depois), marcadores "Revisão PFC-30" nas seções 1–15, tabela da seção 5 (10 jornadas) e tabelas da seção 6 (28 + 20 regras) |

---

*Fim do relatório de análise.*
