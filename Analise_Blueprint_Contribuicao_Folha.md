# Análise Blueprint CONTRIBUIÇÃO — Adaptação ao padrão de jornadas funcionais (PFC-30)

**Issue:** PFC-30 — Adaptação BENEFICIOPREV 2 (realinhamento das abas Processos e Regras do módulo Contribuição)
**Data:** 2026-11-10
**Documento de referência (somente apresentação):** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf`, na raiz do repositório
**Blueprint alvo:** `docs1/contribuicao/` (módulo Contribuição Previdenciária, Blueprint AS-IS PFC-21 / PFC-27 / PFC-23)
**Precedente seguido:** PFC-25 — Adaptação FOLHA (`Analise_Blueprint_Folha.md`), PFC-27 — Adaptação CONTRIBUIÇÃO inicial, PFC-29 — Adaptação FOLHA pós-enriquecimento

> O documento de referência foi usado só como modelo de apresentação. Nenhuma página de `docs1/contribuicao/` o cita: a busca por "UC097" e pelo nome do PDF nas seis páginas retorna 0 ocorrências. Este arquivo de análise é o único lugar onde ele é nomeado.

---

## 0. Resumo executivo

Antes desta issue, o Blueprint do módulo Contribuição tinha 10 jornadas funcionais (JF001 a JF010) e 28 regras de jornada (RS001 a RS028, do PFC-27), mais 20 regras adicionais (CONTRIB-RN029 a CONTRIB-RN048) descobertas no PFC-23 em formato antigo (sem código RS, sem campos de dados classificados, sem tratamento de erro, sem mensagens ligadas e sem jornada associada). As abas Processos e Regras estavam com dois formatos convivendo.

O PFC-30 converte as 20 regras do PFC-23 para o mesmo padrão de regra de jornada já aplicado nas 28 originais, liga cada uma a pelo menos uma jornada, adiciona os tratamentos de erro e mensagens correspondentes, e atualiza contagens, visão consolidada e histórico de versões. O resultado é uma especificação funcional uniforme e rastreável (jornada → regra → tratamento → mensagem → tela).

Resultado:

| Item | Antes (PFC-23) | Depois (PFC-30) | Perdas |
|---|---|---|---|
| Processos → jornadas | 10 (JF001..JF010) | 10 (JF001..JF010), inalteradas | 0 |
| Regras → regras de jornada | 28 (RS001..RS028) + 20 em formato antigo (RN029..RN048) | 48 (RS001..RS048), todas no padrão de jornada | 0 |
| Tratamentos de erro | 53 (TRT001..TRT053) | 57 (TRT001..TRT057); +4 para as novas regras com erro | 0 |
| Mensagens | 100 (MSG001..MSG100) | 102 (MSG001..MSG102); +2 novas | 0 |
| Ações práticas | 45 linhas nas 10 jornadas | 45 linhas (inalteradas) | 0 |
| Regras ligadas a jornadas | 28 de 48 (58%) | 48 de 48 (100%) | 0 |
| Links/âncoras usados pelas outras abas | 10 `#PF-xx` + 48 `#CONTRIB-RNxxx` | os mesmos 58 `id` mantidos | 0 quebrados |

**Abas alteradas:** `funcionalidades.html` (regras ligadas às jornadas, +TRT/MSG, visão consolidada, histórico), `regras-de-negocio.html` (20 regras convertidas, +TRT/MSG, visão consolidada, histórico), `index.html` (lista de regras estendida para 48, rótulos).
**Abas sem alteração:** `arquitetura.html`, `dados.html`, `integracoes.html`, `inventario.html`, `formularios.html`, `rotinas.html`.

**Fonte do conteúdo convertido:** as 20 regras (CONTRIB-RN029 a CONTRIB-RN048) foram descobertas no PFC-23 por leitura linha-a-linha do código-fonte de `CONTRIBUICAOPREV/Fontes`. No PFC-30, cada regra recebeu código RS (RS029 a RS048), descrição em linguagem de negócio, campos de dados classificados como [obrigatório]/[opcional]/[condicional], tratamento de erro (TRT → MSG → resultado) ou indicação "seleção/cálculo", jornada associada com link, e manteve o registro original (descrição, condições, dados, resultado/exceção, origem e evidência). Nenhum conteúdo do PFC-23 foi perdido.

---

## 1. Identificação

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Caso de uso / Sistema / Tipo / Ator / Referência | Painel "Informações" de `index.html` (ID do módulo, DPR, Application.Title, tecnologia) | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "1. Identificação" no topo das duas abas, com caso de uso, sistema (`ContribuicaoPREV.dpr`, Application.Title "Manutenção e Cobrança de Contribuição"), tipo (desktop Delphi 5/VCL/Oracle/MIDAS), ator (analistas de arrecadação, reservas, cadastro, tributação e contabilidade) e referência (PFC-27, base PFC-21).
- **Alterado:** o badge do `<header>` passou a "Blueprint AS-IS — Delphi 5 — Jornadas Funcionais (v2.0)".
- **Removido:** nada.

## 2. Descrição Resumida

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Descrição resumida | "Visão Geral do Módulo" e "Responsabilidades" de `index.html` | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção "2. Descrição Resumida" nas duas abas, com o propósito do módulo e a organização em 10 jornadas e 28 regras de jornada.
- **Alterado:** o subtítulo do `<header>` das duas abas foi reescrito para descrever o novo conteúdo. Os subtítulos anteriores ("10 processos funcionais com entradas, processamento…" e "28 regras com identificador, condições…") foram substituídos, porque descreviam a estrutura antiga.
- **Removido:** nada além do texto de subtítulo substituído.

## 3. Pré-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Não existiam por processo. Foram derivadas das dependências (`index.html`, `integracoes.html`) e das validações de abertura dos forms | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "3. Pré-condições" (DPR disponível, Oracle acessível, motivos padrão parametrizados, cadastros base, integrações e período contábil aberto) e o campo "Pré-condições" em cada jornada. Exemplos: JF001 exige motivo padrão de cobrança (`FPreparaEnvia.pas:2028`); JF005 exige que a prévia da folha não esteja em execução (`fCalculoIRRF.pas:808`).
- **Alterado / Removido:** nada.

## 4. Pós-condições

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campos "Saídas" e "Persistência (tabelas escritas)" de cada processo | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** seção global "4. Pós-condições" (situação de HSTCONTRIBPREV 0/1/≥2, documentos e lançamentos coerentes, log de auditoria) e o campo "Pós-condições" em cada jornada, derivado de Saídas e Persistência.
- **Alterado:** nada. Os campos Saídas e Persistência continuam no registro original de cada jornada.
- **Removido:** nada.

## 5. Jornadas Funcionais (objetivo, sequência operacional, ações práticas)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Jornada (código, título, objetivo) | Processo PF-xx (título e lógica de processamento) | funcionalidades.html |
| Sequência operacional numerada | Campo "Lógica de processamento", detalhado com as validações e etapas dos forms | funcionalidades.html |
| Ações práticas (Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela) | **Novo.** Derivado dos forms (botões/rotinas), das regras, das mensagens e do `Caption` das telas | funcionalidades.html |

**Correspondência processos → jornadas:**

| Jornada | Processo original (`id` mantido) | Título | Telas (forms) | Ações práticas | Regras (RS) | TRT | MSG |
|---|---|---|---|---|---|---|---|
| JF001 | PF-01 | Manutenção e cobrança de contribuições (Preparo e Envio) | `FPreparaEnvia.dfm` | 6 | RS013, RS014, RS015, RS016, RS017, RS026, RS027, RS031, RS033, RS034, RS035, RS036, RS047, RS048 | 7 | 11 |
| JF002 | PF-02 | Recebimento por múltiplos canais | `FRecebeContribuicaoNovo.dfm`, `FRecebeContribEmptmo.dfm`, `FBaixaContribCAR.dfm` | 5 | RS024, RS028, RS032, RS045, RS046 | 7 | 9 |
| JF003 | PF-03 | Alimentação de reservas | `FAlimReservasReplan.dfm`, `FAtualizaPorIndice.dfm`, `FRodaPadraoMovReserva.dfm` | 4 | RS043 | 5 | 10 |
| JF004 | PF-04 | Salário de participação / manutenção | `FReajustaSalarioMantido.dfm`, `FAlteraSalPart.dfm` | 3 | RS023, RS025 | 4 | 7 |
| JF005 | PF-05 | Tributação — Bitributação / IR Regressivo | `FCalcSalContr.dfm`, `fCalculoIRRF.dfm`, `FCadContribuicaoPortada.dfm` | 4 | RS006, RS022, RS040, RS041 | 4 | 6 |
| JF006 | PF-06 | Portabilidade e Benefício Saldado/FAB | `FCadContribuicaoPortada.dfm`, `FBeneficioSaldadoFAB.dfm`, `fCargaArquivo.dfm` | 7 | RS001, RS002, RS003, RS004, RS005, RS006, RS007, RS008, RS039, RS044 | 11 | 19 |
| JF007 | PF-07 | Provisão para perdas | `FProvPerdasIndiv.dfm`, `FProvPerdasLote.dfm`, `FFRelProvPerdas.dfm` | 3 | RS020, RS021, RS042 | 4 | 9 |
| JF008 | PF-08 | Tratamento de divergências e inconsistências | `FDivergContrib.dfm`, `FConsEstatDivergContrib.dfm`, `FDesfDocContribuicao.dfm` | 4 | RS037, RS038 | 5 | 10 |
| JF009 | PF-09 | Controle individual / Entrada manual | `FControleIndivContrib.dfm`, `FCadHstContribuicao.dfm`, `FCadContribNucleoFamiliar.dfm` | 5 | RS009, RS010, RS011, RS012, RS018, RS019, RS029, RS030 | 10 | 17 |
| JF010 | PF-10 | Retroativo e Simulação | `FSimulaContrib.dfm`, `FRevisaoIndice.dfm`, `dmRetroativoLote (externo)` | 4 | — | 5 | 10 |

- **Adicionado:** em cada jornada: objetivo, ator/gatilho (tela de entrada), pré-condições, pós-condições, sequência operacional numerada com referências `[RSxxx]` e `[TRTxxx]`, tabela de ações práticas com as 8 colunas do padrão, regras da jornada, tratamentos, mensagens, telas e dependências entre jornadas.
- **Alterado:** o título do bloco passou de "PF-xx — título" para "JFnnn (PF-xx) — título". O `id` do bloco foi mantido (`id="PF-01"` … `id="PF-10"`), então os links de `index.html` continuam funcionando.
- **Alterado:** os campos originais (Forms de entrada, Lógica de processamento, Saídas, Persistência, Evidência com classificação) foram para um quadro "Registro original do processo" no fim de cada jornada, com o texto sem alteração.
- **Removido:** nada. 10 de 10 processos estão presentes.

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
| RS029 | CONTRIB-RN029 | Situação da contribuição bloqueia alteração (SITRECEBIMENTO > 1) | JF009 | TRT054 | COMPROVADO |
| RS030 | CONTRIB-RN030 | Documento baixado no CAR não pode ser desfeito (STATUS='2') | JF009 | TRT055 | COMPROVADO |
| RS031 | CONTRIB-RN031 | Boleta enviada ao banco bloqueia desfazer (EMISBLOQ='S') | JF001 | TRT056 | COMPROVADO |
| RS032 | CONTRIB-RN032 | Divergência aceita por margem (VLRACEITADIVERG) | JF002 | — (seleção/cálculo) | COMPROVADO |
| RS033 | CONTRIB-RN033 | Tipo de valor da contribuição (FLGTPVLR: B/V/E) | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS034 | CONTRIB-RN034 | Mês 13º usa salário SALPARTIC13 | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS035 | CONTRIB-RN035 | Contribuição associada (FLGPAGADOR='E' usa CONTRIBPREVPATRO) | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS036 | CONTRIB-RN036 | Encerramento de contribuição (DATAFINAL = ULTMESPREPARO) | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS037 | CONTRIB-RN037 | Tratamento de divergência por modo (9 tratamentos) | JF008 | — (seleção/cálculo) | COMPROVADO |
| RS038 | CONTRIB-RN038 | Ação judicial vigente impede cobrança | JF008 | — (seleção/cálculo) | COMPROVADO |
| RS039 | CONTRIB-RN039 | Cálculo do Benefício Saldado via package Oracle | JF006 | — (seleção/cálculo) | COMPROVADO |
| RS040 | CONTRIB-RN040 | Bitributação: correção por moeda 557 e IPCA-E (285) | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS041 | CONTRIB-RN041 | IR Regressivo restrito a planos 66 e 74 | JF005 | — (seleção/cálculo) | COMPROVADO |
| RS042 | CONTRIB-RN042 | Provisão para perdas = (TOTALESPERADO / 100) × PERCENTUAL | JF007 | — (seleção/cálculo) | COMPROVADO |
| RS043 | CONTRIB-RN043 | Atualização de reserva por índice (dValor × COTVALOR) | JF003 | — (seleção/cálculo) | COMPROVADO |
| RS044 | CONTRIB-RN044 | Portabilidade exige opção IR e tempo de vínculo | JF006 | TRT023, TRT025 | COMPROVADO |
| RS045 | CONTRIB-RN045 | Recebimento via empréstimo exige valor igual ao contrato | JF002 | TRT057 | COMPROVADO |
| RS046 | CONTRIB-RN046 | Três inadimplências consecutivas disparam evento de inadimplência | JF002 | — (seleção/cálculo) | COMPROVADO |
| RS047 | CONTRIB-RN047 | BPD mutuamente exclusivo com PGA e Envio | JF001 | — (seleção/cálculo) | COMPROVADO |
| RS048 | CONTRIB-RN048 | Commit parcial a cada 800 registros (ictMaxCommit) | JF001 | — (seleção/cálculo) | COMPROVADO |

- **Adicionado:** código RS (RS001–RS048, mesma ordem dos CONTRIB-RN), título, descrição de negócio, campos de dados classificados, tratamento de erro (TRT → MSG → resultado) e jornada com link. As 20 regras do PFC-23 (RS029–RS048) foram convertidas do formato antigo para o padrão de jornada, mantendo todos os 14 atributos originais.
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
- **Removido:** nada. 48 de 48 regras estão presentes. Classificação mantida: 45 COMPROVADO e 3 INFERIDO (RS026–RS028). A seção "11. Regras adicionais descobertas em PFC-23" foi removida da aba Regras porque as 20 regras foram integradas à seção 6 no padrão de jornada.

## 7. Tratamentos de erro (TRT)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tratamento (Condição, Mensagem, Resultado) | Campo "Resultado/Exceção" das regras + críticas `MessageDlg`/`MsgDlg`/`EValidacao`/`Abort` dos forms | funcionalidades.html (seção 7 + referências nas jornadas), regras-de-negocio.html (seção 7 + campo em cada regra) |

- **Adicionado:** catálogo TRT001–TRT057 nas duas abas, com Condição, Mensagem, Resultado, Regra e Jornada. Cada linha tem `id` (`#TRT001`…) para os links da sequência operacional. TRT054–TRT057 foram adicionados em PFC-30 para as regras RS029, RS030, RS031 e RS045.
- **Adicionado:** a coluna Regra recebe "validação de tela" nos 34 tratamentos que vêm de críticas comprovadas nos forms sem regra CONTRIB-RN correspondente. Isso cobre as jornadas JF003, JF008 e JF010, que não tinham regra catalogada. As críticas **não** foram promovidas a novas regras RS, para manter 28 = 28.
- **Removido:** nada.

Catálogo completo:

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
| TRT010 | Valor das contribuições em aberto diferente do valor do empréstimo | MSG015 | Impede a baixa | validação de tela | JF002 |
| TRT011 | Erro na contabilização ou na integração com o PGA (recebimento via empréstimo) | MSG016, MSG017 | Cancela o processo | validação de tela | JF002 |
| TRT012 | Baixa via Contas a Receber com erro em alguma matrícula | MSG018 | Conclui as demais e lista as matrículas com erro no resultado | validação de tela | JF002 |
| TRT013 | Patrocinadora, plano ou reserva não selecionados | MSG020, MSG021, MSG022 | Bloqueia a atualização de reservas | validação de tela | JF003 |
| TRT014 | Data de atualização não preenchida | MSG023 | Bloqueia a atualização de reservas | validação de tela | JF003 |
| TRT015 | Erro durante a atualização ou a movimentação padrão de reservas | MSG024, MSG028 | Interrompe a operação | validação de tela | JF003 |
| TRT016 | Falha na procedure de alimentação rápida de reservas | MSG027 | Informa o erro; reservas não alimentadas | validação de tela | JF003 |
| TRT017 | Nenhum participante mantido encontrado ou selecionado para reajuste | MSG029, MSG030 | Não processa o reajuste | validação de tela | JF004 |
| TRT018 | Erro ao reajustar o salário de um participante | MSG031, MSG032 | Usuário decide se continua com os demais | validação de tela | JF004 |
| TRT019 | Arquivo Excel ou tipo de salário (mantido/participação) não selecionados | MSG033, MSG034 | Bloqueia a alteração em lote | RS025 (CONTRIB-RN025) | JF004 |
| TRT020 | Nenhum participante selecionado para cálculo do saldo | MSG035 | Não calcula | RS022 (CONTRIB-RN022) | JF005 |
| TRT021 | Índice necessário ao cálculo não cadastrado | MSG037 | Informa e não calcula o saldo | RS022 (CONTRIB-RN022) | JF005 |
| TRT022 | Prévia da folha em execução | MSG039 | Bloqueia o cálculo do IR regressivo | validação de tela | JF005 |
| TRT023 | Opção de IR (regressivo/progressivo) não informada | MSG040 | Bloqueia a gravação da portabilidade | RS006 (CONTRIB-RN006) | JF005, JF006 |
| TRT024 | Participante não selecionado na portabilidade | MSG041 | Bloqueia a operação | validação de tela | JF006 |
| TRT025 | Meses de vínculo maior que 11 | MSG042 | Bloqueia (Abort) | RS001 (CONTRIB-RN001) | JF006 |
| TRT026 | Ano/mês de referência vazio ou maior que o ano/mês de cobrança | MSG043, MSG044 | Bloqueia (Abort) | RS002 (CONTRIB-RN002) | JF006 |
| TRT027 | Valor esperado menor ou igual a zero | MSG045 | Bloqueia (Abort) | RS003 (CONTRIB-RN003) | JF006 |
| TRT028 | Alteração ou exclusão de contribuição portada já recebida | MSG046, MSG048 | Bloqueia a alteração/exclusão | RS004 (CONTRIB-RN004) | JF006 |
| TRT029 | Alteração ou exclusão de contribuição portada já enviada | MSG047, MSG049 | Bloqueia a alteração/exclusão | RS005 (CONTRIB-RN005) | JF006 |
| TRT030 | Exclusão de portabilidade que ainda tem contribuições | MSG050 | Cancela a exclusão | RS007 (CONTRIB-RN007) | JF006 |
| TRT031 | Arquivo de importação fora do formato Excel ou do layout | MSG051, MSG052 | Bloqueia a importação (Abort) | RS008 (CONTRIB-RN008) | JF006 |
| TRT032 | Arquivo de carga do benefício saldado/FAB não selecionado, com leiaute incorreto ou com benefício INSS inconsistente | MSG054, MSG055, MSG056 | Bloqueia a carga | validação de tela | JF006 |
| TRT033 | Erro na atualização/reprocessamento do BS-FAB ou na revisão de índice | MSG058 | Atualização não concluída | validação de tela | JF006, JF010 |
| TRT034 | Ano/mês de cobrança, patrocinadora ou plano não selecionados na provisão em lote | MSG059, MSG060, MSG061 | Bloqueia (EValidacao) | RS020 (CONTRIB-RN020) | JF007 |
| TRT035 | Nenhuma contribuição selecionada na provisão individual | MSG062 | Não registra/desfaz a provisão | validação de tela | JF007 |
| TRT036 | Erro no processamento da provisão para uma matrícula | MSG064 | Conclui as demais e lista as matrículas com erro | validação de tela | JF007 |
| TRT037 | Matrícula, parâmetro de pesquisa ou mês de cobrança não informados no relatório | MSG065, MSG066, MSG067 | Bloqueia o relatório (EValidacao) | RS021 (CONTRIB-RN021) | JF007 |
| TRT038 | Modo de divergência não selecionado | MSG068 | Bloqueia a consulta/tratamento | validação de tela | JF008 |
| TRT039 | Filtro escolhido sem valor informado (ou datas inválidas) | MSG069, MSG071, MSG070 | Bloqueia a consulta | validação de tela | JF008 |
| TRT040 | Motivo padrão para tratamento de divergência não cadastrado | MSG072 | Bloqueia o tratamento | validação de tela | JF008 |
| TRT041 | Código do documento não informado ou não encontrado no desfazer documento | MSG073, MSG074 | Não desfaz | validação de tela | JF008 |
| TRT042 | Participante ou contribuição não selecionados no controle individual | MSG077, MSG078 | Bloqueia a operação | validação de tela | JF009 |
| TRT043 | Alteração de contribuição já recebida ou já enviada à folha/Contas a Receber | MSG079, MSG080, MSG081, MSG090 | Cancela a alteração e orienta usar Desfazer ou Tratamento de Divergência | RS018 (CONTRIB-RN018) | JF009 |
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
| TRT054 | Situação da contribuição > 1 bloqueia alteração no controle individual | MSG079 | Bloqueia a alteração (Abort) | RS029 (CONTRIB-RN029) | JF009 |
| TRT055 | Documento baixado no CAR (STATUS='2') não pode ser desfeito | MSG101 | Bloqueia o desfazimento (Abort) | RS030 (CONTRIB-RN030) | JF009 |
| TRT056 | Boleta enviada ao banco (EMISBLOQ='S') bloqueia desfazer preparo/envio | MSG102 | Bloqueia o desfazimento | RS031 (CONTRIB-RN031) | JF001 |
| TRT057 | Recebimento via empréstimo com valor das contribuições diferente do contrato | MSG015 | Impede a baixa | RS045 (CONTRIB-RN045) | JF002 |

## 8. Catálogo de Mensagens (MSG)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Mensagens (código, texto, jornadas) | Textos de `MessageDlg`/`MsgDlg`/`ShowMessage`/`Application.MessageBox`/`EValidacao.CreateVal` e linhas de log dos forms | funcionalidades.html (seção 8), regras-de-negocio.html (seção 8) |

- **Adicionado:** catálogo MSG001–MSG102 nas duas abas, com Código, Texto (grafia original), Tipo, Origem (arquivo:linha) e Jornadas. Na aba Regras, também com as regras relacionadas. Cada linha tem `id` (`#MSG001`…), usado pelas tabelas de ações práticas e pelos TRT. MSG101 e MSG102 foram adicionados em PFC-30 para TRT055 e TRT056.
- **Tipos:** Erro 46, Erro (validação) 7, Erro (exceção) 1, Informação 20, Alerta 12, Aviso 1, Confirmação 4, Sucesso 9, Log de processamento 2.
- **Alterado:** os textos que o catálogo anterior citava de forma abreviada (por exemplo, "MessageDlg('já foi Enviada')") continuam no "Resultado/Exceção" original de cada regra. O texto completo está agora na MSG correspondente (por exemplo, MSG047 "Essa Contribuição já foi Enviada, Alteração não permitida").
- **Removido:** nada.

Distribuição por jornada:

| Jornada | Faixa / quantidade de mensagens |
|---|---|
| JF001 | 11 mensagens (MSG001, MSG002, MSG003, MSG004, MSG005, MSG006, MSG007, MSG008, MSG009, MSG010, MSG102) |
| JF002 | 9 mensagens (MSG011, MSG012, MSG013, MSG014, MSG015, MSG016, MSG017, MSG018, MSG019) |
| JF003 | 10 mensagens (MSG020, MSG021, MSG022, MSG023, MSG024, MSG025, MSG026, MSG027, MSG028, MSG100) |
| JF004 | 7 mensagens (MSG029, MSG030, MSG031, MSG032, MSG033, MSG034, MSG100) |
| JF005 | 6 mensagens (MSG035, MSG036, MSG037, MSG038, MSG039, MSG040) |
| JF006 | 19 mensagens (MSG040, MSG041, MSG042, MSG043, MSG044, MSG045, MSG046, MSG047, MSG048, MSG049, MSG050, MSG051, MSG052, MSG053, MSG054, MSG055, MSG056, MSG057, MSG058) |
| JF007 | 9 mensagens (MSG059, MSG060, MSG061, MSG062, MSG063, MSG064, MSG065, MSG066, MSG067) |
| JF008 | 10 mensagens (MSG068, MSG069, MSG070, MSG071, MSG072, MSG073, MSG074, MSG075, MSG076, MSG100) |
| JF009 | 17 mensagens (MSG077, MSG078, MSG079, MSG080, MSG081, MSG082, MSG083, MSG084, MSG085, MSG086, MSG087, MSG088, MSG089, MSG090, MSG091, MSG100, MSG101) |
| JF010 | 10 mensagens (MSG057, MSG058, MSG092, MSG093, MSG094, MSG095, MSG096, MSG097, MSG098, MSG099) |

## 9. Observações Gerais (OBS)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Observações | Legenda de evidência e notas implícitas do Blueprint | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** OBS001–OBS006. Registram a natureza desktop do módulo, a transcrição literal das mensagens (com a grafia original), a manutenção dos códigos e da classificação de evidência, as jornadas sem regra catalogada, o status INFERIDO de RS026–RS028 e o domínio de SITRECEBIMENTO usado nas regras (0, 1, 2/3, 8).
- **Alterado / Removido:** nada.

## 10. Casos de Uso Associados

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Casos de uso associados | Painel "Dependências" de `index.html` e `integracoes.html` | funcionalidades.html |

- **Adicionado:** seção "10. Casos de Uso Associados" com FOLHA, Contas a Receber/CAP (CMAdmPrev), Contabilidade/PGA, EMPRESTIMO, IRRF, CMPrevMT50/CM Framework, `PCK_BENEFSALDFAB` e `dmRetroativoLote`, cada um ligado às jornadas que o usam. Cada jornada ganhou o campo "Dependências" (precede/sucede outras jornadas).
- **Alterado / Removido:** nada. `integracoes.html` não foi modificada.

## 11. Tabela / Programa

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Campo "Persistência (tabelas escritas)" + rotinas com arquivo:linha; entry point DPR | funcionalidades.html |

- **Adicionado:** seção "11. Tabela / Programa", com tabelas escritas e faixas de rotinas por jornada e link para `dados.html`.
- **Alterado / Removido:** nada. `dados.html` não foi modificada.

## 12. Telas

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Campo "Forms de entrada" de cada processo + `Caption` de cada `.dfm` | funcionalidades.html |

- **Adicionado:** seção "12. Telas", com o título de cada tela (por exemplo, "Envio de Contribuições" para `FPreparaEnvia.dfm` e "Cadastro Manual do Histórico de Contribuições" para `FCadHstContribuicao.dfm`) e o form correspondente. A coluna "Tela" das ações práticas mostra o form em que cada ação ocorre.
- **Alterado / Removido:** nada.

## 13. Visão Consolidada das Jornadas (critérios de aceitação)

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Visão consolidada com itens [US] e Dado/Quando/Então | **Novo.** Derivado de pré-condições, validações e resultados | funcionalidades.html (por jornada), regras-de-negocio.html (por regra) |

- **Adicionado:** em Funcionalidades, um item `[US] CONTRIB-JFnnn` por jornada, com critério Dado/Quando/Então, regras, mensagens e telas. Em Regras, um critério Dado/Quando/Então por regra: as regras com tratamento usam a condição, a mensagem e o resultado do TRT; as regras de seleção/cálculo usam a condição e o efeito descrito.
- **Alterado / Removido:** nada.

## 14. Histórico de Versões

| Seção do padrão | Elemento do módulo Contribuição | Aba docs1 afetada |
|---|---|---|
| Histórico de versões | Rodapé "Blueprint AS-IS — PFC-21 … Gerado em 2026-11-09" | funcionalidades.html, regras-de-negocio.html |

- **Adicionado:** tabela de versões: v1.0 (PFC-21, 2026-11-09), v2.0 (PFC-27, 2026-11-10), v3.0 (PFC-23, 2026-11-10) e v4.0 (PFC-30, 2026-11-10).
- **Alterado:** o rodapé das duas abas passou a "Blueprint AS-IS — PFC-21 / PFC-27 / PFC-23 / PFC-30 — Módulo CONTRIBUIÇÃO … Atualizado em 2026-11-10".
- **Removido:** o texto de rodapé anterior (substituído).

---

## 15. Outras abas

| Aba | Ajuste | Motivo |
|---|---|---|
| `index.html` | Lista de regras estendida de 28 para 48 (RS029–RS048 adicionados); descrição atualizada para "48 regras de jornada"; badge atualizado para PFC-30; rótulo de navegação "Regras (48 regras de jornada)". **Nenhum `href` foi alterado** nos links existentes. | Manter a Visão Geral coerente com os 48 códigos RS |
| `arquitetura.html`, `dados.html`, `integracoes.html` | Sem alteração | Fora do escopo; só recebem links das abas novas |

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
| D09 | Nome da navegação mantido como "⚙️ Funcionalidades" (o FOLHA usa "Processos"). | Não alterar a navegação já publicada do módulo (AC5). |
| D10 | As 20 regras do PFC-23 (RN029–RN048) foram convertidas para RS029–RS048 na mesma numeração, mantendo os `id` HTML originais. A seção "11. Regras adicionais" foi removida e as regras integradas à seção 6. | Mapeamento trivial, 0 perdas de `id`, uniformização do formato (AC1). |
| D11 | Regras de seleção/cálculo sem mensagem ao usuário receberam "não se aplica — regra de seleção/cálculo" no campo Tratamento de erro. Regras com mensagem receberam TRT novo (TRT054–TRT057) ou referência a TRT existente (TRT023, TRT025). | Mantém o padrão das 28 regras originais e não inventa tratamento onde não existe (AC2). |
| D12 | JF010 (simulação) permanece sem regra CONTRIB-RN catalogada. As jornadas JF003, JF008 e JF009 receberam regras em PFC-30. | JF010 não tem regras de negócio no código; suas validações são "validação de tela" (AC2). |

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — 48 regras (RS001–RS048) no padrão de regra de jornada, com campos classificados, jornada e tratamento | OK | 48 `rule-block` (`id` CONTRIB-RN001..048) em `regras-de-negocio.html`; 0 regras no formato antigo; seção "11. Regras adicionais" removida |
| AC2 — Cada nova regra em pelo menos 1 jornada; TRT e MSG com origem no código | OK | 20 regras (RS029–RS048) ligadas a 8 jornadas; TRT054–TRT057 e MSG101–MSG102 com arquivo:linha |
| AC3 — 0 âncoras quebradas; contagens consistentes; visão consolidada e histórico atualizados | OK | 48 `id` CONTRIB-RN + 10 `id` PF mantidos; index.html e docs1/index.html com 48 regras; histórico v4.0 |
| AC4 — 0 menções ao modelo em `docs1/contribuicao/` | OK | `grep -ril "UC097\|Verificar_Elegibilidade" docs1/contribuicao` → 0 ocorrências |
| AC5 — este documento: seção por seção, tabelas de correspondência 10 + 48, contagens antes/depois | OK | Seções 1–14, tabelas das seções 5 e 6 (48 regras), resumo executivo com antes/depois |

---

*Fim do relatório de análise.*
