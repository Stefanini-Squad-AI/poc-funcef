# Análise Blueprint CONTRIBUIÇÃO — Adaptação ao Padrão de Jornadas Funcionais

**Issue:** PFC-27 — Adaptação CONTRIBUIÇÃO
**Data:** 2026-11-10
**Autor:** Squad Blueprint (GLM-5.2)
**Blueprint alvo:** `docs1/contribuicao/` (módulo Contribuição Previdenciária, Blueprint AS-IS, gerado em PFC-21)

---

## 0. Resumo executivo

O Blueprint AS-IS do módulo Contribuição Previdenciária (PFC-21) documenta 10 processos funcionais (PF-01 a PF-10) e 28 regras de negócio (CONTRIB-RN001 a CONTRIB-RN028), organizados em torno da estrutura do código-fonte. O padrão de jornadas funcionais adotado organiza a documentação em torno de **jornadas funcionais** com identificação, descrição resumida, pré/pós-condições, sequência operacional, ações práticas (tabela), regras de jornada (RS), tratamentos de erro (TRT), catálogo de mensagens (MSG), observações (OBS), casos de uso associados, tabela/API/programa, telas/layouts, visão consolidada com critérios de aceitação e histórico de versões.

Esta análise mapeia cada seção do padrão adotado para o elemento correspondente do Blueprint CONTRIBUIÇÃO, descreve o que foi **adicionado**, **alterado** ou **removido**, e indica qual aba do docs1 é afetada. Todas as 10 jornadas e 28 regras foram preservadas (0 perdas). A rastreabilidade original (códigos CONTRIB-RN, evidência file:linha, classificação COMPROVADO/INFERIDO/PENDENTE) foi mantida integralmente.

**Decisões de projeto registradas** (ver seção 15).

---

## 1. Identificação

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Caso de Uso | Módulo Contribuição Previdenciária | index.html |
| Sistema | CM Contabilidade / FUNCEF (Delphi 5) | index.html |
| Tipo | Sistema Desktop (VCL / MIDAS) | index.html |
| Ator | Usuário operacional (analista de contribuição, financeiro, contábil, atuarial) | index.html |
| OS - Título | PFC-27 — Adaptação CONTRIBUIÇÃO | — |

**Alterações:**
- **Adicionado:** bloco "1. Identificação" no topo de `funcionalidades.html` e `regras-de-negocio.html`, com os campos do padrão (Caso de Uso, Sistema, Tipo, Ator, OS-Título).
- **Alterado:** o cabeçalho `<header>` das duas abas passa a incluir a identificação no formato adotado, mantendo o badge "Blueprint AS-IS".
- **Removido:** nada.

---

## 2. Descrição Resumida

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Descrição Resumida | Parágrafo introdutório do `<header>` em index.html | index.html, funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "2. Descrição Resumida" em `funcionalidades.html` e `regras-de-negocio.html`, com narrativa consolidada do módulo (manutenção, cobrança, recebimento multi-canal, reservas, tributação, portabilidade, benefício saldado/FAB, provisão para perdas, divergências).
- **Alterado:** a descrição existente no `<header>` de `index.html` foi mantida e replicada no formato adotado nas duas abas reestruturadas.
- **Removido:** nada.

---

## 3. Pré-condições

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Condições implícitas de cada processo (PF-01 a PF-10) | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "3. Pré-condições" global em `funcionalidades.html`, consolidando as pré-condições comuns a todas as jornadas (módulo compilado, banco Oracle acessível, DataModules instanciados, patrocinadoras/planos/participantes cadastrados, permissão de acesso). Cada jornada (JF) mantém suas pré-condições específicas no campo "Pré-condições".
- **Alterado:** as pré-condições existentes em cada `pf-block` foram preservadas e reorganizadas dentro da estrutura de jornada.
- **Removido:** nada.

---

## 4. Pós-condições

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campo "Saídas" e "Persistência" de cada processo | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "4. Pós-condições" global em `funcionalidades.html`, descrevendo o estado esperado do sistema após cada jornada (tabelas populadas, reservas atualizadas, documentos gerados, controle de interface e log atualizados). Cada jornada inclui suas pós-condições específicas derivadas dos campos "Saídas" e "Persistência" do processo original.
- **Alterado:** os campos "Saídas" e "Persistência (tabelas escritas)" existentes foram reorganizados como pós-condições dentro da jornada, sem perda de conteúdo.
- **Removido:** nada.

---

## 5. Jornadas Funcionais (com sequência operacional e ações práticas)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Jornadas Funcionais (JF001–JF010) | 10 processos (PF-01 a PF-10) | funcionalidades.html |
| Objetivo (por jornada) | **Novo** — derivado da descrição do processo | funcionalidades.html |
| Sequência operacional | **Novo** — derivado da lógica de processamento + evidência file:linha | funcionalidades.html |
| Ações práticas (tabela) | **Novo** — derivado da sequência + validações + regras + forms | funcionalidades.html |

**Mapeamento de processos para jornadas:**

| Jornada | Processo original | Título |
|---|---|---|
| JF001 | PF-01 | Manutenção e cobrança de contribuições (Preparo e Envio) |
| JF002 | PF-02 | Recebimento por múltiplos canais |
| JF003 | PF-03 | Alimentação de reservas |
| JF004 | PF-04 | Salário de participação / manutenção |
| JF005 | PF-05 | Tributação — Bitributação / IR Regressivo |
| JF006 | PF-06 | Portabilidade e Benefício Saldado/FAB |
| JF007 | PF-07 | Provisão para perdas |
| JF008 | PF-08 | Tratamento de divergências e inconsistências |
| JF009 | PF-09 | Controle individual / Entrada manual |
| JF010 | PF-10 | Retroativo e Simulação |

**Alterações:**
- **Adicionado:** para cada jornada, uma **tabela de ações práticas** com as colunas: Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela. O conteúdo foi derivado da lógica de processamento existente, das validações, das regras referenciadas e dos forms (telas) identificados no código Delphi.
- **Adicionado:** campo "Objetivo", "Gatilho/Ator", "Sequência operacional" (lista numerada com referências file:linha) e "Dependências" para cada jornada.
- **Adicionado:** referências a códigos RS (regras de jornada) e TRT (tratamentos de erro) na sequência operacional, no formato `[RSxxx]` e `[TRTxxx]`.
- **Adicionado:** fluxograma Mermaid para cada jornada, representando o comportamento comprovado no código.
- **Alterado:** cada `pf-block` foi renomeado de "PF-xx" para "JFnnn (PF-xx) — [título]", mantendo o `id` original (ex.: `id="PF-01"`) para preservar os links existentes do `index.html` e de outras abas.
- **Removido:** nada. Todos os 10 processos estão presentes como 10 jornadas.

---

## 6. Regras de negócio da jornada (RS)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Regras de negócio (RS001–RS028) | 28 regras (CONTRIB-RN001 a CONTRIB-RN028) | regras-de-negocio.html |
| Código RS | Código CONTRIB-RN | regras-de-negocio.html |
| Título | Título da regra CONTRIB-RN | regras-de-negocio.html |
| Descrição em linguagem de negócio | Atributo "Descrição" (rule-desc) | regras-de-negocio.html |
| Campos de dados (mandatório/opcional/condicional) | Atributo "Dados envolvidos" + "Condições" | regras-de-negocio.html |

**Mapeamento de regras CONTRIB-RN para códigos RS:**

| Código RS | Código CONTRIB-RN original | Título |
|---|---|---|
| RS001 | CONTRIB-RN001 | Mês de vínculo da portabilidade válido |
| RS002 | CONTRIB-RN002 | Ano/mês de referência obrigatório e ≤ cobrança |
| RS003 | CONTRIB-RN003 | Valor esperado da contribuição > 0 |
| RS004 | CONTRIB-RN004 | Contribuição já recebida bloqueia alteração |
| RS005 | CONTRIB-RN005 | Contribuição já enviada bloqueia alteração/exclusão |
| RS006 | CONTRIB-RN006 | Opção de IR (regressivo/progressivo) obrigatória |
| RS007 | CONTRIB-RN007 | Exclusão de portabilidade exige excluir contribuições |
| RS008 | CONTRIB-RN008 | Importação exige arquivo válido |
| RS009 | CONTRIB-RN009 | Data de emissão de cobrança por situação |
| RS010 | CONTRIB-RN010 | Valor recebido e data de recebimento conjuntos |
| RS011 | CONTRIB-RN011 | Situação da contribuição coerente com recebimento |
| RS012 | CONTRIB-RN012 | Saldo de contribuição e VALOROP1 > 0 em edição |
| RS013 | CONTRIB-RN013 | Preparo só processa ULTMESPREPARO < mês cobrança |
| RS014 | CONTRIB-RN014 | Envio marca SITRECEBIMENTO = 1 |
| RS015 | CONTRIB-RN015 | Desfazer preparo retorna SITRECEBIMENTO=0 |
| RS016 | CONTRIB-RN016 | Após preparo, atualiza ULTMESPREPARO |
| RS017 | CONTRIB-RN017 | Tipo envio FLGTPVLR='B' considera atraso |
| RS018 | CONTRIB-RN018 | Proibida alteração de recebido/enviado |
| RS019 | CONTRIB-RN019 | Não verificar TMPDESC se SITRECEBIMENTO=0 |
| RS020 | CONTRIB-RN020 | Provisão em lote exige ano/mês, ≥1 patro, ≥1 plano |
| RS021 | CONTRIB-RN021 | Relatório provisão exige matrícula, ≥1 parâmetro, mês |
| RS022 | CONTRIB-RN022 | Cálculo saldo lê/insere HSTBITRIBUTACAO/BITRIBUTACAO |
| RS023 | CONTRIB-RN023 | EVOLFUNCPREV atualiza DATAFINAL do cargo anterior |
| RS024 | CONTRIB-RN024 | Recebimento via folha filtra por situação/valor/data/origem |
| RS025 | CONTRIB-RN025 | Alteração em lote de salário via Excel atualiza PARTPREVPLAN |
| RS026 | CONTRIB-RN026 | Plano contábil ≠ plano prev questiona usuário |
| RS027 | CONTRIB-RN027 | Envio "apenas calculadas por evento" filtra contribuições |
| RS028 | CONTRIB-RN028 | Geração de documentos CaR por data de recebimento |

**Alterações:**
- **Adicionado:** cada regra recebe um código RS (RS001–RS028), mantendo o código CONTRIB-RN original como referência cruzada (ex.: "RS001 (CONTRIB-RN001)").
- **Adicionado:** classificação de campos de dados como **[obrigatório]**, **[opcional]** ou **[condicional]** com valores permitidos, derivada do atributo "Dados envolvidos" e "Condições" existentes.
- **Adicionado:** seção "Regras de negócio da jornada" dentro de cada jornada em `funcionalidades.html`, listando os códigos RS aplicáveis com link para a regra completa em `regras-de-negocio.html`.
- **Adicionado:** campos "Categoria", "Gatilho", "Fórmula", "Severidade" e "Jornada" para cada regra.
- **Alterado:** o `id` de cada `rule-block` foi mantido como `id="CONTRIB-RNxxx"` para preservar links existentes. O `rule-id` passou a mostrar "RSxxx (CONTRIB-RNxxx) — Título".
- **Alterado:** os atributos originais (Condições, Dados envolvidos, Resultado/Exceção, Origem, Evidência) foram preservados integralmente; a estrutura visual foi adaptada para o formato de card de regra (código, título, descrição, campos de dados, tratamento, evidência).
- **Removido:** nada. Todos as 28 regras estão presentes.

---

## 7. Tratamentos (TRT)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Tratamentos de erro (TRT001–TRT028) | Validações bloqueantes e exceções das regras (atributo Resultado/Exceção) | funcionalidades.html, regras-de-negocio.html |
| Condição | Atributo "Condições" da regra | — |
| Mensagem | Atributo "Resultado/Exceção" da regra (MessageDlg / raise EValidacao) | — |
| Resultado | Comportamento bloqueante/automático | — |

**Tratamentos de erro identificados (TRT001–TRT028):**

| TRT | Condição | Mensagem | Resultado | Regra de origem | Jornada |
|---|---|---|---|---|---|
| TRT001 | Mês de vínculo fora de 0–11 | MSG001 | Bloqueia (MessageDlg + Abort) | RS001 (RN001) | JF006 |
| TRT002 | Ano/mês referência não informado | MSG002 | Bloqueia (MessageDlg + Abort) | RS002 (RN002) | JF006 |
| TRT003 | Ano/mês referência > cobrança | MSG003 | Bloqueia (MessageDlg + Abort) | RS002 (RN002) | JF006 |
| TRT004 | Valor esperado ≤ 0 | MSG004 | Bloqueia (MessageDlg + Abort) | RS003 (RN003) | JF006 |
| TRT005 | Contribuição já recebida | MSG005 | Bloqueia alteração | RS004 (RN004) | JF006, JF009 |
| TRT006 | Contribuição já enviada | MSG006 | Bloqueia alteração/exclusão | RS005 (RN005) | JF006, JF009 |
| TRT007 | Opção de IR não informada | MSG007 | Bloqueia (MessageDlg + Abort) | RS006 (RN006) | JF005, JF006 |
| TRT008 | Exclusão de portabilidade com contribuições | MSG008 | Bloqueia exclusão | RS007 (RN007) | JF006 |
| TRT009 | Arquivo importação inválido | MSG009 | Bloqueia (Abort) | RS008 (RN008) | JF006 |
| TRT010 | Valor recebido sem data ou data sem valor | MSG010 | Bloqueia (Abort) | RS010 (RN010) | JF009 |
| TRT011 | Situação incoerente com recebimento | MSG011 | Bloqueia (Abort) | RS011 (RN011) | JF009 |
| TRT012 | SALCONTRIB/VALOROP1 ≤ 0 | MSG012 | Bloqueia (Abort) | RS012 (RN012) | JF009 |
| TRT013 | Mês cobrança não preenchido | MSG013 | Bloqueia (MessageDlg + Abort) | RS013 (RN013) | JF001 |
| TRT014 | Ano cobrança não preenchido | MSG014 | Bloqueia (MessageDlg + Abort) | RS013 (RN013) | JF001 |
| TRT015 | Tipo cobrança não selecionado | MSG015 | Bloqueia (MessageDlg + Abort) | RS013 (RN013) | JF001 |
| TRT016 | Provisão lote: ano/mês não selecionado | MSG016 | Bloqueia (raise EValidacao) | RS020 (RN020) | JF007 |
| TRT017 | Provisão lote: 0 patrocinadora | MSG017 | Bloqueia (raise EValidacao) | RS020 (RN020) | JF007 |
| TRT018 | Provisão lote: 0 plano | MSG018 | Bloqueia (raise EValidacao) | RS020 (RN020) | JF007 |
| TRT019 | Relatório provisão: matrícula não selecionada | MSG019 | Bloqueia (raise EValidacao) | RS021 (RN021) | JF007 |
| TRT020 | Relatório provisão: parâmetro/mês não informados | MSG020 | Bloqueia (raise EValidacao) | RS021 (RN021) | JF007 |
| TRT021 | Recebimento: mês cobrança não preenchido | MSG021 | Bloqueia (MessageDlg + Abort) | RS024 (RN024) | JF002 |
| TRT022 | Recebimento: data recebimento não informada | MSG022 | Bloqueia (MessageDlg + Abort) | RS024 (RN024) | JF002 |
| TRT023 | Alteração salário: arquivo não selecionado | MSG023 | Bloqueia (MessageDlg) | RS025 (RN025) | JF004 |
| TRT024 | Alteração salário: salário não selecionado | MSG024 | Bloqueia (MessageDlg) | RS025 (RN025) | JF004 |
| TRT025 | Cálculo saldo: participante não selecionado | MSG025 | Bloqueia (MessageDlg) | RS022 (RN022) | JF005 |
| TRT026 | Divergência: modo não selecionado | MSG026 | Bloqueia (MessageDlg) | — | JF008 |
| TRT027 | Divergência: motivo não preenchido | MSG027 | Bloqueia (MessageDlg) | — | JF008 |
| TRT028 | Simulação: plano não informado | MSG028 | Bloqueia (MessageDlg) | — | JF010 |

**Alterações:**
- **Adicionado:** seção "Tratamentos (TRT)" em `funcionalidades.html` (global, com 28 TRT) e referências a TRT dentro de cada jornada que possui validações bloqueantes. Em `regras-de-negocio.html`, cada regra que possui exceção recebe o TRT correspondente.
- **Adicionado:** os TRT foram derivados das validações e exceções existentes no atributo "Resultado/Exceção" das regras e das mensagens `MessageDlg`/`MsgDlg`/`raise EValidacao.CreateVal` comprovadas no código Delphi. Nenhum tratamento foi inventado — todos correspondem a validações comprovadas no código.
- **Removido:** nada. As exceções originais foram mantidas e complementadas com a estrutura TRT.

---

## 8. Catálogo de Mensagens (MSG)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Catálogo de Mensagens (MSG001–MSG028) | Mensagens de erro/exceção das regras (MessageDlg / raise EValidacao) | funcionalidades.html, regras-de-negocio.html |
| Código MSG | **Novo** | — |
| Texto da Mensagem | Texto da exceção (MessageDlg / MsgDlg / raise EValidacao) | — |
| Jornadas relacionadas | Jornada que contém a validação | — |

**Catálogo de mensagens (MSG001–MSG028):**

| Código | Texto da Mensagem | Jornadas relacionadas |
|---|---|---|
| MSG001 | "Mêses de Vinculo Inválido. Informe o mês entre 0 e 11" | JF006 |
| MSG002 | "O Ano/Mês de Referencia deve ser informado" | JF006 |
| MSG003 | "O Ano/Mês de Referencia não pode ser maior que o Ano/Mês de Cobrança" | JF006 |
| MSG004 | "O campo Valor Esperado deve ser maior que zero." | JF006 |
| MSG005 | "Essa Contribuição já foi Recebida, Alteração não permitida" | JF006, JF009 |
| MSG006 | "Essa Contribuição já foi Enviada, Alteração não permitida" | JF006, JF009 |
| MSG007 | "Necessário informar a Opção de IR ." | JF005, JF006 |
| MSG008 | "Para excluir esse registro, exclua o cadastro das contribuições, primeiro." | JF006 |
| MSG009 | "O arquivo deverá ser em formato excel." / "O arquivo não está no layout correto para importação." | JF006 |
| MSG010 | "O valor recebido foi preenchido, porém, a data de recebimento não foi informada." / "A data de recebimento foi informada, porém, o valor recebido não." | JF009 |
| MSG011 | "O recebimento foi informado, porém, a situação da contribuição não se refere a uma contribuição recebida." | JF009 |
| MSG012 | "O Salário e o Percentual de Contribuição, são de preenchimento obrigatório para o plano selecionado." | JF009 |
| MSG013 | "Mês de Cobrança não preenchido." | JF001 |
| MSG014 | "Ano de Cobrança não preenchido." | JF001 |
| MSG015 | "Selecione o Tipo de Cobrança." | JF001 |
| MSG016 | "É necessário selecionar o ano/mês de cobrança das contribuições." | JF007 |
| MSG017 | "É necessário selecionar pelo menos uma patrocinadora." | JF007 |
| MSG018 | "É necessário selecionar pelo menos um plano previdenciário." | JF007 |
| MSG019 | "É necessário selecionar matricula para apresentação do relatório." | JF007 |
| MSG020 | "É necessário selecionar pelo menos um parâmetro de pesquisa..." / "É necessário informar o mês de cobrança." | JF007 |
| MSG021 | "Preencha o mês de cobrança." | JF002 |
| MSG022 | "O campo Data de Recebimento é obrigatório." | JF002 |
| MSG023 | "É necessário selecionar o arquivo para carregar as informações." | JF004 |
| MSG024 | "É necessário selecionar o salário que deseja alterar." | JF004 |
| MSG025 | "Nenhum Participante selecionado. Verifique!" | JF005 |
| MSG026 | "Selecione um Modo de Divergência na Lista de Modos." | JF008 |
| MSG027 | "Motivo para Tratamento de Divergência não preenchido." | JF008 |
| MSG028 | "Informe o Plano Previdenciário." | JF010 |

**Alterações:**
- **Adicionado:** seção "Catálogo de Mensagens (MSG)" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela (Código, Texto, Jornadas relacionadas). Cada mensagem aparece exatamente uma vez no catálogo.
- **Adicionado:** referências a códigos MSG nas jornadas e tratamentos (TRT), no formato `[MSGxxx]`.
- **Removido:** nada. As mensagens originais (textos de `MessageDlg`, `MsgDlg` e `raise EValidacao.CreateVal`) foram preservadas no catálogo.

---

## 9. Observações Gerais (OBS)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Observações Gerais (OBS) | Notas contextuais e premissas do Blueprint | funcionalidades.html, regras-de-negocio.html |

**Observações identificadas (OBS001–OBS006):**

| Código | Observação |
|---|---|
| OBS001 | O módulo CONTRIBUIÇÃO é um sistema desktop Delphi 5 / VCL, operado por usuário humano, com arquitetura híbrida (herança CM framework + DataModules InfoPower com SQL inline nos forms). |
| OBS002 | O entry point `ContribuicaoPREV.dpr` auto-instancia DataModules (`dtmAPrev`, `dtmIntegraCAPCAR`, `dtmPreparaContrib`, `dmRetroativoLote`) e o form principal `frmPrincipal`. |
| OBS003 | A evidência de cada regra é classificada como COMPROVADO (no código), INFERIDO (plausível) ou PENDENTE (validar). Esta classificação foi mantida do PFC-21. |
| OBS004 | As 28 regras CONTRIB-RN001 a CONTRIB-RN028 existiam desde o PFC-21; 25 são COMPROVADO e 3 (RN026, RN027, RN028) são INFERIDO (SIGs 24516, 22081, 25044). |
| OBS005 | Os fluxogramas Mermaid representam somente comportamentos comprovados no código-fonte Delphi. |
| OBS006 | O módulo usa `MsgDlg` (wrapper CM em `UMensErro.pas`) como mecanismo principal de diálogo, além de `MessageDlg` padrão Delphi e `raise EValidacao.CreateVal` para validações bloqueantes com foco no controle. |

**Alterações:**
- **Adicionado:** seção "Observações Gerais (OBS)" em `funcionalidades.html` e `regras-de-negocio.html`.
- **Removido:** nada.

---

## 10. Casos de Uso Associados

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Casos de Uso Associados | Dependências externas (integracoes.html) e processos relacionados | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Casos de Uso Associados" em `funcionalidades.html`, listando os módulos externos dos quais o CONTRIBUIÇÃO depende (CM Framework, CMAdmPrev, CMPrevMT50, CMGLOBALOBJ50, CMCAPCARUTILOBJ50, FOLHA, BENEFICIOPREV, IRRF, CPAGAR, EMPRESTIMO, Package Oracle PCK_BENEFSALDFAB), com link para `integracoes.html`.
- **Adicionado:** em cada jornada, a seção "Dependências" lista os casos de uso (outras jornadas) que precedem ou sucedem a jornada atual.
- **Removido:** nada.

---

## 11. Tabela/API/Programa

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Tabelas de dados (dados.html), rotinas-chave, entry point | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Tabela/API/Programa" em `funcionalidades.html`, com tabela mapeando cada jornada às tabelas Oracle escritas (HSTCONTRIBPREV, CONTRIBPREVPARTP, DOCUMENTO, PORTABILIDADEPREV, BITRIBUTACAO, etc.) e às rotinas-chave (com file:linha) e ao entry point `CONTRIBUICAOPREV/Fontes/ContribuicaoPREV.dpr`. Conteúdo derivado de `dados.html` e da evidência existente.
- **Adicionado:** em `regras-de-negocio.html`, referência à tabela/rotina de origem de cada regra (atributo "Origem" já existente, agora apresentado no formato adotado).
- **Removido:** nada.

---

## 12. Telas/Layouts

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Formulários Delphi (.dfm) identificados no código | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "Telas/Layouts" em `funcionalidades.html`, com tabela mapeando cada jornada aos forms (.dfm) correspondentes (ex.: JF001 → FPreparaEnvia.dfm, JF006 → FCadContribuicaoPortada.dfm, etc.), com link para `arquitetura.html`. A coluna "Tela" da tabela de ações práticas também referencia o form.
- **Removido:** nada.

---

## 13. Visão Consolidada de Jornadas Funcionais (com critérios de aceitação)

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Visão Consolidada | **Novo** — síntese de todas as jornadas | funcionalidades.html, regras-de-negocio.html |
| Critérios Dado/Quando/Então | **Novo** — derivado das validações e resultados | — |

**Alterações:**
- **Adicionado:** seção "Visão Consolidada de Jornadas Funcionais" em `funcionalidades.html`, com tabela: Jornada, ID, Título, Critério de aceitação (Dado/Quando/Então), Mensagens, Telas.
- **Adicionado:** seção "Visão Consolidada" em `regras-de-negocio.html`, com tabela: Regra, Código original, Título, Critério (Dado/Quando/Então), Jornada.
- **Adicionado:** um critério Dado/Quando/Então por jornada e por regra, derivado das condições (atributo "Condições") e do resultado (atributo "Resultado/Exceção") da regra/processo correspondente.
- **Removido:** nada.

---

## 14. Histórico de Versões

| Atributo do padrão | Elemento CONTRIBUIÇÃO correspondente | Aba docs1 afetada |
|---|---|---|
| Histórico de Versões | **Novo** | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Histórico de Versões" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela: Versão, Descrição, Data, Responsável.
  - v1.0 — Blueprint AS-IS inicial (PFC-21) — 10 processos, 28 regras, 158 artefatos — 2026-11-09 — Squad Blueprint
  - v2.0 — Adaptação ao padrão de jornadas funcionais (PFC-27) — 10 jornadas, RS/TRT/MSG, visão consolidada — 2026-11-10 — Squad Blueprint (GLM-5.2)
- **Removido:** nada.

---

## 15. Decisões de projeto

Conforme a diretiva do requisitante, as seguintes decisões foram tomadas:

| # | Decisão | Justificativa |
|---|---|---|
| D01 | Cada processo (PF-01 a PF-10) torna-se exatamente uma jornada (JF001 a JF010), em vez de agrupar processos em jornadas. | Garante que nenhum processo seja perdido (AC1 exige 10 de 10) e mantém o mapeamento 1:1 simples e rastreável. |
| D02 | O `id` HTML de cada jornada mantém o código original (ex.: `id="PF-01"`), e o título mostra "JF001 (PF-01)". | Preserva todos os links existentes do `index.html` e de outras abas (AC5 exige 0 links quebrados). |
| D03 | O `id` HTML de cada regra mantém `id="CONTRIB-RNxxx"`, e o título mostra "RSxxx (CONTRIB-RNxxx)". | Mesma razão de D02 — preserva links existentes. |
| D04 | Os códigos RS são numerados RS001–RS028 na mesma ordem dos CONTRIB-RN001–CONTRIB-RN028. | Mantém o mapeamento trivial e reversível. |
| D05 | Os TRT e MSG foram derivados exclusivamente das validações e exceções já documentadas no Blueprint PFC-21 (atributos "Condições" e "Resultado/Exceção" das regras) e das mensagens `MessageDlg`/`MsgDlg`/`raise EValidacao.CreateVal` comprovadas no código Delphi. Nenhum tratamento ou mensagem foi inventado. | Garante que o conteúdo é evidence-based e não introduz informação não comprovada. |
| D06 | A seção "Ações práticas" de cada jornada foi derivada da lógica de processamento existente, decomposta em ações individuais com objetivo, entrada, comportamento, resultado, regras, mensagens e tela. | O padrão adotado exige esta tabela; o conteúdo já existe na lógica do processo, apenas reestruturado. |
| D07 | A "Visão Consolidada" e os critérios Dado/Quando/Então foram derivados das condições e resultados das regras, e dos campos "Validações" e "Resultado" dos processos. | O padrão exige critérios de aceitação; o conteúdo deriva diretamente do que já está documentado. |
| D08 | As pré-condições e pós-condições globais consolidam condições comuns a todas as jornadas; cada jornada mantém suas condições específicas. | Evita redundância e segue o padrão (que tem pré/pós-condições globais e por jornada). |
| D09 | O badge "Blueprint AS-IS — Delphi 5" foi atualizado para "Blueprint AS-IS — PFC-27 (adaptado) — v2.0" nas abas reestruturadas. | Reflete a nova versão do documento (v2.0) sem perder a rastreabilidade ao PFC-21. |
| D10 | A navegação (nav) das abas reestruturadas foi mantida idêntica à original (Visão Geral, Arquitetura, Funcionalidades, Regras, Dados, Integrações). | AC5 exige que a navegação existente continue funcionando. |
| D11 | As 3 regras INFERIDO (RN026, RN027, RN028 — SIGs 24516, 22081, 25044) foram tratadas no mesmo formato que as 25 COMPROVADO, sem distinção visual de "inferidas". | O padrão não separa regras por classificação de evidência; todas são regras de jornada (RS). A classificação COMPROVADO/INFERIDO/PENDENTE foi mantida no campo "Evidência". |
| D12 | O documento de análise foi nomeado exatamente `Analise_Blueprint_Contribuicao_Folha.md`, conforme definido pelo requisitante. | Restrição explícita do requisitante. |
| D13 | Nenhuma página de `docs1/contribuicao/` cita o documento modelo (UC097 ou o nome do arquivo PDF). | Restrição explícita do requisitante (AC3): o modelo serve apenas de referência de apresentação. |

---

## 16. Impacto em outras partes do documento CONTRIBUIÇÃO

Conforme a seção "Additional Context" do issue, o padrão também pode ser usado para adaptar outras partes da documentação do módulo. As seguintes partes adicionais foram ajustadas:

| Parte | Ajuste | Aba docs1 |
|---|---|---|
| Cabeçalho e badge | Atualizado para refletir PFC-27 e v2.0 | funcionalidades.html, regras-de-negocio.html |
| Rodapé | Data de geração atualizada para 2026-11-10 e referência PFC-27 | funcionalidades.html, regras-de-negocio.html |
| Links cruzados index.html → funcionalidades.html | Mantidos (ids PF-01 a PF-10 preservados) | index.html (não alterado) |
| Links cruzados index.html → regras-de-negocio.html | Mantidos (ids CONTRIB-RN001 a CONTRIB-RN028 preservados) | index.html (não alterado) |

**Partes não alteradas** (justificativa: fora do escopo da adaptação das abas Funcionalidades e Regras, e AC5 exige que a navegação existente continue funcionando):
- `arquitetura.html`, `dados.html`, `integracoes.html` — não modificadas.
- `index.html` — não modificado (preserva links e navegação).

---

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — 10 processos em jornadas JF001–JF010 com objetivo, pré/pós-condições, sequência operacional e tabela de ações práticas | OK | `funcionalidades.html` seção 5 — 10 de 10 processos convertidos, 0 perdidos |
| AC2 — 28 regras em formato RS com código, título, descrição, campos de dados; catálogo de TRT e MSG; código original e evidência visíveis | OK | `regras-de-negocio.html` seção 6 — 28 de 28 regras preservadas |
| AC3 — Nenhuma página cita o documento modelo (busca por "UC097" e nome do PDF = 0 ocorrências) | OK | Verificado: 0 ocorrências de "UC097", ".pdf" ou nome do arquivo em ambas as abas |
| AC4 — `Analise_Blueprint_Contribuicao_Folha.md` criado com mapeamento por seção e tabelas de correspondência | OK | Este documento — seções 1–14 (mapeamento), seção 5 (10 processos→jornadas), seção 6 (28 regras→RS) |
| AC5 — Navegação e âncoras preservadas, 0 links quebrados | OK | ids HTML preservados (PF-01 a PF-10, CONTRIB-RN001 a CONTRIB-RN028), nav inalterado, links de index.html/arquitetura/dados/integracoes válidos |

---

*Fim do relatório de análise.*
