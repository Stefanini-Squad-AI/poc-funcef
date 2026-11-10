# Análise Blueprint CONTRIBUIÇÃO — Adaptação ao padrão de jornadas funcionais

**Issue:** PFC-30 — Adaptação BENEFICIOPREV 2 (segunda rodada de adaptação do módulo CONTRIBUIÇÃO)
**Data:** 2026-11-10
**Documento de referência (somente apresentação):** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf`, na raiz do repositório
**Blueprint alvo:** `docs1/contribuicao/` (módulo Contribuição Previdenciária, Blueprint AS-IS PFC-21)
**Precedentes seguidos:** PFC-25 — Adaptação FOLHA (`Analise_Blueprint_Folha.md`), PFC-27 — primeira adaptação CONTRIBUIÇÃO, PFC-28 — Adaptação BENEFICIOPREV (`Analise_Blueprint_BeneficioPrev_Folha.md`)

> O documento de referência foi usado só como modelo de apresentação. Nenhuma página de `docs1/contribuicao/` o cita: a busca por "UC097", pelo nome do PDF e por "Verificar_Elegibilidade" nas páginas do docs1 retorna 0 ocorrências. Este arquivo de análise é o único lugar onde ele é nomeado.

> **Nota sobre o escopo:** A descrição da issue PFC-30 refere "28 regras (RS001–RS028)" e "classificação de evidência (25 COMPROVADO, 3 INFERIDO)", refletindo o estado ao final de PFC-27. O enriquecimento PFC-23 (commit `e64fd3f4`), executado após PFC-27, adicionou 20 regras adicionais (CONTRIB-RN029–RN048) em formato técnico (14 atributos), sem adaptá-las ao modelo de jornadas. A segunda rodada (PFC-30) converte essas 20 regras ao formato de regra de jornada, totalizando **48 regras (RS001–RS048)**, com 0 perdas. A diretiva "0 regras perdidas" (AC2) é tratada como requisito autoritativo: todas as 48 regras existentes são preservadas e uniformizadas.

---

## 0. Resumo executivo

Antes de PFC-27, o Blueprint do módulo Contribuição tinha 10 processos (PF-01 a PF-10) e 28 regras (CONTRIB-RN001 a CONTRIB-RN028). PFC-27 reorganizou esses 10 processos como jornadas funcionais (JF001–JF010) e as 28 regras como regras de jornada (RS001–RS028), com tratamentos de erro (TRT001–TRT053), catálogo de mensagens (MSG001–MSG100), ações práticas, telas e visão consolidada.

O enriquecimento PFC-23, executado após PFC-27, adicionou 20 regras adicionais (CONTRIB-RN029–RN048) descobertas por investigação linha-a-linha do código-fonte, em formato técnico (14 atributos: ID, nome, descrição, objetivo, condições, dados, processamento, fórmula, resultado, exceções, rotina, arquivo, evidência). Essas 20 regras não foram adaptadas ao modelo de jornadas funcionais.

Esta issue (PFC-30) realiza a **segunda rodada de adaptação**: converte as 20 regras adicionais ao formato de regra de jornada (RS029–RS048), adiciona 3 tratamentos de erro (TRT054–TRT056) e 3 mensagens (MSG101–MSG103), atualiza o mapa de regras, a visão consolidada, as listas de regras por jornada e o documento de análise. Nenhuma regra, processo, `id` HTML ou `href` existente foi perdido.

Resultado consolidado após PFC-30:

| Item | Antes (PFC-27) | PFC-23 (enriquecido) | Depois (PFC-30) | Perdas |
|---|---|---|---|---|
| Processos → jornadas | 10 (PF-01..PF-10) → JF001..JF010 | 10 (inalterado) | 10 (JF001..JF010), mapeamento 1:1 | 0 |
| Regras → regras de jornada | 28 (RS001..RS028) | 48 (28 adaptadas + 20 em formato técnico) | 48 (RS001..RS048), todas em formato de jornada | 0 |
| Tratamentos de erro | 53 (TRT001..TRT053) | 53 (inalterado) | 56 (TRT001..TRT056) | 0 |
| Mensagens | 100 (MSG001..MSG100) | 100 (inalterado) | 103 (MSG001..MSG103) | 0 |
| Ações práticas | 45 linhas | 45 (inalterado) | 45 (inalterado) | 0 |
| Links/âncoras usados pelas outras abas | 10 `#PF-xx` + 28 `#CONTRIB-RNxxx` | 10 + 48 (20 novos sem links de index) | 10 + 48, todos os `id` mantidos | 0 quebrados |

**Abas alteradas em PFC-30:** `funcionalidades.html` (listas de regras por jornada, seção 6, TRT, MSG, histórico, rodapé), `regras-de-negocio.html` (20 regras convertidas, mapa de regras, visão consolidada, TRT, MSG, observações, histórico, rodapé), `index.html` (lista de regras ampliada para 48, badge, rodapé).
**Abas sem alteração:** `arquitetura.html`, `dados.html`, `integracoes.html`, `inventario.html`, `formularios.html`, `rotinas.html`.

**Fonte do conteúdo novo:** as 20 regras adicionais (RS029–RS048) já existiam em `regras-de-negocio.html` (Seção 11) em formato técnico, com origem comprovada no código-fonte (`CONTRIBUICAOPREV/Fontes/*.pas`). PFC-30 reescreveu cada uma no formato de regra de jornada (descrição em linguagem de negócio, campos de dados classificados, tratamento de erro, jornada associada), preservando o registro original (descrição, condições, dados, resultado/exceção, fórmula, origem e evidência). Os 3 novos TRT e 3 novas MSG foram derivados das mensagens comprovadas nos forms: `FControleIndivContrib.pas:2142` (MSG101), `FControleIndivContrib.pas:2348` (MSG102), `FPreparaEnvia.pas:6222` (MSG103).

---

## 1. Identificação

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Caso de uso / Sistema / Tipo / Ator / Referência | Painel "Informações" de `index.html` (ID do módulo, DPR, Application.Title, tecnologia) | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** seção "1. Identificação" no topo das duas abas, com caso de uso, sistema (`ContribuicaoPREV.dpr`, Application.Title "Manutenção e Cobrança de Contribuição"), tipo (desktop Delphi 5/VCL/Oracle/MIDAS), ator (analistas de arrecadação, reservas, cadastro, tributação e contabilidade) e referência (PFC-27, base PFC-21).
- **Alterado (PFC-30):** o badge de `index.html` passou a "Blueprint AS-IS — Delphi 5 — PFC-30 (jornadas funcionais v4.0)".
- **Removido:** nada.

## 2. Descrição Resumida

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Descrição resumida | "Visão Geral do Módulo" e "Responsabilidades" de `index.html` | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** seção "2. Descrição Resumida" nas duas abas, com o propósito do módulo e a organização em 10 jornadas e 28 regras de jornada.
- **Alterado (PFC-30):** o texto de `funcionalidades.html` passou a "48 regras de jornada (RS001–RS048), sendo RS001–RS028 originais (PFC-27) e RS029–RS048 adicionais descobertas no enriquecimento PFC-23 e adaptadas em PFC-30".
- **Removido:** o trecho "28 regras de jornada (RS001–RS028)" substituído pelo texto acima.

## 3. Pré-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Não existiam por processo. Foram derivadas das dependências (`index.html`, `integracoes.html`) e das validações de abertura dos forms | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** seção global "3. Pré-condições" e o campo "Pré-condições" em cada jornada.
- **Alterado / Removido (PFC-30):** nada.

## 4. Pós-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campos "Saídas" e "Persistência (tabelas escritas)" de cada processo | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** seção global "4. Pós-condições" e o campo "Pós-condições" em cada jornada.
- **Alterado / Removido (PFC-30):** nada.

## 5. Jornadas Funcionais (objetivo, sequência operacional, ações práticas)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Jornada (código, título, objetivo) | Processo PF-xx (título e lógica de processamento) | funcionalidades.html |
| Sequência operacional numerada | Campo "Lógica de processamento", detalhado com as validações e etapas dos forms | funcionalidades.html |
| Ações práticas (Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela) | Derivado dos forms (botões/rotinas), das regras, das mensagens e do `Caption` das telas | funcionalidades.html |

**Correspondência processos → jornadas (10):**

| Jornada | Processo original (`id` mantido) | Título | Telas (forms) | Ações práticas | Regras (RS) | TRT | MSG |
|---|---|---|---|---|---|---|---|
| JF001 | PF-01 | Manutenção e cobrança de contribuições (Preparo e Envio) | `FPreparaEnvia.dfm` | 6 | RS013, RS014, RS015, RS016, RS017, RS026, RS027, **RS031, RS033, RS034, RS035, RS036, RS047, RS048** | 6+1 | 10+1 |
| JF002 | PF-02 | Recebimento por múltiplos canais | `FRecebeContribuicaoNovo.dfm`, `FRecebeContribEmptmo.dfm`, `FBaixaContribCAR.dfm` | 5 | RS024, RS028, **RS032, RS045, RS046** | 6 | 9+1 |
| JF003 | PF-03 | Alimentação de reservas | `FAlimReservasReplan.dfm`, `FAtualizaPorIndice.dfm`, `FRodaPadraoMovReserva.dfm` | 4 | **RS043** | 5 | 10 |
| JF004 | PF-04 | Salário de participação / manutenção | `FReajustaSalarioMantido.dfm`, `FAlteraSalPart.dfm` | 3 | RS023, RS025 | 4 | 7 |
| JF005 | PF-05 | Tributação — Bitributação / IR Regressivo | `FCalcSalContr.dfm`, `fCalculoIRRF.dfm`, `FCadContribuicaoPortada.dfm` | 4 | RS006, RS022, **RS040, RS041** | 4 | 6 |
| JF006 | PF-06 | Portabilidade e Benefício Saldado/FAB | `FCadContribuicaoPortada.dfm`, `FBeneficioSaldadoFAB.dfm`, `fCargaArquivo.dfm` | 7 | RS001, RS002, RS003, RS004, RS005, RS006, RS007, RS008, **RS039, RS044** | 11 | 19 |
| JF007 | PF-07 | Provisão para perdas | `FProvPerdasIndiv.dfm`, `FProvPerdasLote.dfm`, `FFRelProvPerdas.dfm` | 3 | RS020, RS021, **RS042** | 4 | 9 |
| JF008 | PF-08 | Tratamento de divergências e inconsistências | `FDivergContrib.dfm`, `FConsEstatDivergContrib.dfm`, `FDesfDocContribuicao.dfm` | 4 | **RS037, RS038** | 5 | 10 |
| JF009 | PF-09 | Controle individual / Entrada manual | `FControleIndivContrib.dfm`, `FCadHstContribuicao.dfm`, `FCadContribNucleoFamiliar.dfm` | 5 | RS009, RS010, RS011, RS012, RS018, RS019, **RS029, RS030** | 8+2 | 16+2 |
| JF010 | PF-10 | Retroativo e Simulação | `FSimulaContrib.dfm`, `FRevisaoIndice.dfm`, `dmRetroativoLote (externo)` | 4 | — | 5 | 10 |

- **Adicionado (PFC-27):** em cada jornada: objetivo, ator/gatilho, pré/pós-condições, sequência operacional numerada, tabela de ações práticas (8 colunas), regras da jornada, tratamentos, mensagens, telas e dependências.
- **Alterado (PFC-30):** as listas "Regras de negócio da jornada" de 8 das 10 jornadas foram ampliadas para incluir as regras RS029–RS048 recém-adaptadas (em negrito na tabela acima). As jornadas JF003 e JF008, que antes tinham "nenhuma regra CONTRIB-RN catalogada", passaram a ter RS043 e RS037/RS038 respectivamente. A Seção 6 "Regras de Negócio por Jornada" foi atualizada na íntegra.
- **Removido:** nada. 10 de 10 processos estão presentes. 0 ações práticas perdidas.

## 6. Regras de negócio da jornada (RS)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Código da regra | Código CONTRIB-RNxxx (mantido como `id` e mostrado ao lado do RS) | regras-de-negocio.html |
| Título | Rótulo curto da regra na lista de `index.html` | regras-de-negocio.html |
| Descrição em linguagem de negócio | Reescrita a partir da descrição técnica e do código | regras-de-negocio.html |
| Campos de dados [obrigatório]/[opcional]/[condicional] | "Dados envolvidos" + "Condições", detalhados com os campos de tela/tabela do código | regras-de-negocio.html |
| Regras por jornada | Lista em cada jornada e seção "6. Regras de Negócio por Jornada" | funcionalidades.html |

**Correspondência regras → regras de jornada (48):**

As 28 regras originais (RS001–RS028) já estavam adaptadas desde PFC-27 (ver tabela na versão anterior deste documento). As **20 regras adicionais** (RS029–RS048), descobertas em PFC-23 e adaptadas em PFC-30, são:

| Regra de jornada | Código original (`id` mantido) | Título | Jornada | Tratamento (TRT) | Evidência |
|---|---|---|---|---|---|
| RS029 | CONTRIB-RN029 | Situação da contribuição bloqueia alteração (SITRECEBIMENTO > 1) | JF009 | TRT054 | COMPROVADO |
| RS030 | CONTRIB-RN030 | Documento baixado no CAR não pode ser desfeito (STATUS='2') | JF009 | TRT055 | COMPROVADO |
| RS031 | CONTRIB-RN031 | Boleta enviada ao banco bloqueia desfazer (EMISBLOQ='S') | JF001 | TRT056 | COMPROVADO |
| RS032 | CONTRIB-RN032 | Divergência aceita por margem (VLRACEITADIVERG) | JF002 | — (cálculo) | COMPROVADO |
| RS033 | CONTRIB-RN033 | Tipo de valor da contribuição (FLGTPVLR: B/V/E) | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS034 | CONTRIB-RN034 | Mês 13º usa salário SALPARTIC13 | JF001 | — (cálculo) | COMPROVADO |
| RS035 | CONTRIB-RN035 | Contribuição associada (FLGPAGADOR='E' usa CONTRIBPREVPATRO) | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS036 | CONTRIB-RN036 | Encerramento de contribuição (DATAFINAL = ULTMESPREPARO → FLGCOBRA=0) | JF001 | — (cálculo) | COMPROVADO |
| RS037 | CONTRIB-RN037 | Tratamento de divergência por modo (9 tratamentos) | JF008 | — (seleção) | COMPROVADO |
| RS038 | CONTRIB-RN038 | Ação judicial vigente impede cobrança | JF008 | — (seleção) | COMPROVADO |
| RS039 | CONTRIB-RN039 | Cálculo do Benefício Saldado via package Oracle | JF006 | — (cálculo) | COMPROVADO |
| RS040 | CONTRIB-RN040 | Bitributação: correção por moeda 557 e IPCA-E (285) | JF005 | — (cálculo) | COMPROVADO |
| RS041 | CONTRIB-RN041 | IR Regressivo restrito a planos 66 e 74 | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS042 | CONTRIB-RN042 | Provisão para perdas = (TOTALESPERADO / 100) × PERCENTUAL | JF007 | — (cálculo) | COMPROVADO |
| RS043 | CONTRIB-RN043 | Atualização de reserva por índice (dValor × COTVALOR) | JF003 | — (cálculo) | COMPROVADO |
| RS044 | CONTRIB-RN044 | Portabilidade exige opção IR e tempo de vínculo | JF006 | TRT023, TRT025, TRT026 | COMPROVADO |
| RS045 | CONTRIB-RN045 | Recebimento via empréstimo exige valor igual ao contrato | JF002 | TRT010 | COMPROVADO |
| RS046 | CONTRIB-RN046 | Três inadimplências consecutivas disparam evento de inadimplência | JF002 | — (seleção/cálculo) | COMPROVADO |
| RS047 | CONTRIB-RN047 | BPD mutuamente exclusivo com PGA e Envio | JF001 | — (seleção) | COMPROVADO |
| RS048 | CONTRIB-RN048 | Commit parcial a cada 800 registros (ictMaxCommit) | JF001 | — (técnica) | COMPROVADO |

- **Adicionado (PFC-27):** código RS (RS001–RS028), título, descrição de negócio, campos de dados classificados, tratamento de erro e jornada com link para as 28 regras originais.
- **Adicionado (PFC-30):** as 20 regras adicionais (RS029–RS048) receberam o mesmo tratamento: código RS, título, descrição em linguagem de negócio (`rule-desc`), campos de dados classificados como [obrigatório]/[opcional]/[condicional], tratamento de erro (TRT → MSG → resultado) ou "não se aplica — regra de seleção/cálculo", jornada com link, e o registro original (descrição original, condições, dados envolvidos, resultado/exceção, fórmula, origem e evidência) preservado integralmente.
- **Alterado (PFC-30):** o `rule-id` de cada uma das 20 regras passou de "CONTRIB-RN029 — título" para "RS029 (CONTRIB-RN029) — título". O `id` HTML foi mantido (`id="CONTRIB-RN029"` … `id="CONTRIB-RN048"`), preservando as âncoras. O título da Seção 6 passou a "RS001–RS048". O título da Seção 11 passou a "Regras de Negócio da Jornada — adicionais (RS029–RS048)". A Seção 5 (Mapa de Regras por Jornada) ganhou 20 linhas. A Seção 10 (Visão Consolidada) ganhou 20 linhas com critério Dado/Quando/Então.
- **Alterado (PFC-30):** a lista de regras de `index.html` ganhou 20 elementos `<li>` com links para RS029–RS048. O texto "28 regras de jornada" passou a "48 regras de jornada".
- **Removido:** nada. 48 de 48 regras estão presentes. Classificação de evidência mantida: 25 COMPROVADO + 3 INFERIDO (RS026–RS028, originais) + 20 COMPROVADO (RS029–RS048, adicionais) = 45 COMPROVADO + 3 INFERIDO.

## 7. Tratamentos de erro (TRT)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tratamento (Condição, Mensagem, Resultado) | Campo "Resultado/Exceção" das regras + críticas `MessageDlg`/`MsgDlg`/`EValidacao`/`Abort` dos forms | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** catálogo TRT001–TRT053 nas duas abas, com Condição, Mensagem, Resultado, Regra e Jornada.
- **Adicionado (PFC-30):** 3 novos tratamentos (TRT054–TRT056) nas duas abas, derivados das mensagens comprovadas nos forms:

| TRT | Condição | Mensagem | Resultado | Regra | Jornada |
|---|---|---|---|---|---|
| TRT054 | Alteração de contribuição com SITRECEBIMENTO > 1 (recebida/divergência) | MSG101 | Bloqueia (Abort) | RS029 (CONTRIB-RN029) | JF009 |
| TRT055 | Desfazer envio com documento baixado no CAR (STATUS='2') | MSG102 | Bloqueia (Abort) | RS030 (CONTRIB-RN030) | JF009 |
| TRT056 | Desfazer preparo/envio com boleta enviada ao banco (EMISBLOQ='S') | MSG103 | Bloqueia (Abort) | RS031 (CONTRIB-RN031) | JF001 |

- **Removido:** nada. 56 tratamentos no total (53 + 3).

## 8. Catálogo de Mensagens (MSG)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Mensagens (código, texto, jornadas) | Textos de `MessageDlg`/`MsgDlg`/`ShowMessage`/`Application.MessageBox`/`EValidacao.CreateVal` e linhas de log dos forms | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** catálogo MSG001–MSG100 nas duas abas, com Código, Texto (grafia original), Tipo, Origem (arquivo:linha) e Jornadas.
- **Adicionado (PFC-30):** 3 novas mensagens (MSG101–MSG103) nas duas abas:

| Código | Texto da mensagem | Tipo | Origem | Jornada |
|---|---|---|---|---|
| MSG101 | "Não é possível alterar registro já recebido." | Erro | `FControleIndivContrib.pas:2142` | JF009 |
| MSG102 | "Documento já está baixado, não pode ser desfeito." | Erro | `FControleIndivContrib.pas:2348` | JF009 |
| MSG103 | "Boleta já enviada ao banco, não pode desfazer o preparo/envio." | Erro | `FPreparaEnvia.pas:6222` | JF001 |

- **Removido:** nada. 103 mensagens no total (100 + 3).

## 9. Observações Gerais (OBS)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Observações | Legenda de evidência e notas implícitas do Blueprint | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** OBS001–OBS006.
- **Alterado (PFC-30):** OBS004 atualizada — JF008 (divergências) passou a ter as regras RS037 e RS038; JF003 e JF010 continuam sem regra original catalogada.
- **Removido:** nada.

## 10. Casos de Uso Associados

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Casos de uso associados | Painel "Dependências" de `index.html` e `integracoes.html` | funcionalidades.html |

- **Adicionado (PFC-27):** seção "10. Casos de Uso Associados" com FOLHA, Contas a Receber/CAP, Contabilidade/PGA, EMPRESTIMO, IRRF, CMPrevMT50/CM Framework, `PCK_BENEFSALDFAB` e `dmRetroativoLote`.
- **Alterado / Removido (PFC-30):** nada. `integracoes.html` não foi modificada.

## 11. Tabela / Programa

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Campo "Persistência (tabelas escritas)" + rotinas com arquivo:linha; entry point DPR | funcionalidades.html |

- **Adicionado (PFC-27):** seção "11. Tabela / Programa".
- **Alterado / Removido (PFC-30):** nada. `dados.html` não foi modificada.

## 12. Telas

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Campo "Forms de entrada" de cada processo + `Caption` de cada `.dfm` | funcionalidades.html |

- **Adicionado (PFC-27):** seção "12. Telas".
- **Alterado / Removido (PFC-30):** nada.

## 13. Visão Consolidada das Jornadas (critérios de aceitação)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Visão consolidada com itens [US] e Dado/Quando/Então | Derivado de pré-condições, validações e resultados | funcionalidades.html (por jornada), regras-de-negocio.html (por regra) |

- **Adicionado (PFC-27):** em Funcionalidades, um item `[US] CONTRIB-JFnnn` por jornada. Em Regras, um critério Dado/Quando/Então por regra (28 regras).
- **Adicionado (PFC-30):** 20 novos critérios Dado/Quando/Então em `regras-de-negocio.html` (Seção 10), um para cada regra RS029–RS048. As regras com tratamento (RS029, RS030, RS031, RS044, RS045) usam a condição, a mensagem e o resultado do TRT; as regras de seleção/cálculo usam a condição e o efeito descrito.
- **Removido:** nada.

## 14. Histórico de Versões

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Histórico de versões | Rodapé "Blueprint AS-IS — PFC-21 …" | funcionalidades.html, regras-de-negocio.html |

- **Adicionado (PFC-27):** v1.0 (PFC-21, 2026-11-09) e v2.0 (PFC-27, 2026-11-10).
- **Adicionado (PFC-30):** v3.0 (PFC-23 enriquecido, 2026-11-10) e v4.0 (PFC-30, 2026-11-10) em ambas as abas.
- **Alterado (PFC-30):** o rodapé das duas abas e de `index.html` passou a incluir PFC-30. O badge de `index.html` passou a "PFC-30 (jornadas funcionais v4.0)".
- **Removido:** o texto de rodapé anterior (substituído).

---

## 15. Outras abas

| Aba | Ajuste (PFC-30) | Motivo |
|---|---|---|
| `index.html` | Lista de regras ampliada de 28 para 48 elementos `<li>` (RS029–RS048); texto "28 regras" → "48 regras"; badge atualizado; rodapé atualizado. **Nenhum `href` existente foi alterado** (todos os 28 links originais mantidos; 20 novos adicionados). | Coerência com as 48 regras de jornada |
| `arquitetura.html`, `dados.html`, `integracoes.html`, `inventario.html`, `formularios.html`, `rotinas.html` | Sem alteração | Fora do escopo; só recebem links das abas novas |

## 16. Decisões de projeto

| # | Decisão | Justificativa |
|---|---|---|
| D01 | Um processo = uma jornada (PF-01..PF-10 → JF001..JF010). | Rastreabilidade 1:1 e 0 perdas (AC1). Mesma convenção do FOLHA. |
| D02 | `id` HTML das jornadas = código PF original; das regras = código CONTRIB-RN original. | Preserva as âncoras usadas por `index.html` (AC5). Convenção do PFC-25. |
| D03 | RSnnn na mesma numeração de CONTRIB-RNnnn. RS029–RS048 na mesma ordem das CONTRIB-RN029–RN048. | Mapeamento trivial e reversível. |
| D04 | Críticas de tela sem regra CONTRIB-RN viraram TRT com Regra = "validação de tela", e não novas regras RS. | Mantém 28 regras = 28 originais (AC2) e não reclassifica conteúdo sem análise funcional. |
| D05 | As 20 regras adicionais (PFC-23) receberam códigos RS029–RS048 e foram convertidas ao formato de jornada, preservando o registro original. | "0 regras perdidas" (AC2) exige manter todas as 48. "Uniformizar" exige todas no mesmo formato. |
| D06 | 3 novos TRT (TRT054–TRT056) e 3 novas MSG (MSG101–MSG103) foram criados para as regras RS029–RS031 que têm mensagens comprovadas nos forms. As demais 17 regras adicionais são de seleção/cálculo sem mensagem ao usuário. | Fidelidade ao código: só se cataloga mensagem comprovada com arquivo:linha. |
| D07 | RS044 (portabilidade exige opção IR e tempo de vínculo) referencia TRT023, TRT025, TRT026 já existentes, pois suas validações já estavam catalogadas em RS001/RS006/RS002. RS045 referencia TRT010 já existente. | Evita duplicar tratamentos já catalogados. |
| D08 | Mensagens transcritas literalmente, com a grafia do código, e com arquivo:linha. | Fidelidade ao legado. |
| D09 | O texto original de processos e regras foi mantido como "Registro original" / "Descrição original…Resultado/Exceção". | Nenhuma perda de conteúdo e nenhuma edição silenciosa da evidência. |
| D10 | O nome do modelo (UC097) não aparece em nenhuma página do docs1. | Restrição explícita do requisitante (AC3). |
| D11 | Nome da navegação mantido como "⚙️ Funcionalidades" (o FOLHA usa "Processos"). | Não alterar a navegação já publicada do módulo (AC5). |
| D12 | A Seção 11 de `regras-de-negocio.html` foi renomeada de "Regras adicionais descobertas em PFC-23" para "Regras de Negócio da Jornada — adicionais (RS029–RS048)", e as 20 regras foram convertidas in-place. | Preserva todos os `id` e a posição no documento; uniformiza o formato sem mover conteúdo. |

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — 10 processos como jornadas com objetivo, pré/pós-condições, sequência numerada e ações práticas (8 colunas) | OK | 10 `pf-block` em `funcionalidades.html` (`id` PF-01..PF-10); 45 linhas de ações práticas; 0 processos perdidos |
| AC2 — regras no formato de regra de jornada, com catálogos de TRT e MSG e código/evidência originais | OK | 48 `rule-block` (`id` CONTRIB-RN001..RN048) em `regras-de-negocio.html`, todas em formato de jornada (RS + descrição de negócio + campos classificados + TRT/MSG + jornada + registro original); seções 7 (TRT, 56) e 8 (MSG, 103); classificação mantida: 45 COMPROVADO + 3 INFERIDO; 0 regras perdidas |
| AC3 — 0 menções ao modelo em `docs1/contribuicao/` | OK | `grep -ril "UC097\|Verificar_Elegibilidade" docs1/contribuicao/` → 0 ocorrências |
| AC4 — este documento: seção por seção, elemento correspondente, aba afetada, adicionado/alterado/removido, e tabelas de correspondência 10 + 48 | OK | Seções 1–14, tabelas das seções 5 (10 jornadas) e 6 (48 regras: 28 originais + 20 adicionais) |
| AC5 — navegação e âncoras preservadas | OK | Todos os `id` HTML mantidos (PF-01..PF-10, CONTRIB-RN001..RN048, TRT001..TRT056, MSG001..MSG103); nav das abas inalterada; todos os `href` existentes continuam válidos; 0 links quebrados |

---

*Fim do relatório de análise.*
