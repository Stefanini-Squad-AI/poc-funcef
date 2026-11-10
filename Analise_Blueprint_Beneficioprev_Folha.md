# Análise Blueprint BENEFICIOPREV — Adaptação ao Modelo UC097

**Issue:** PFC-28 — ADAPTACAO BENEFICIOPREV
**Data:** 2026-11-10
**Autor:** Squad Blueprint (GLM-5.2)
**Documento de referência:** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf` (Nexus/FUNCEF, v1.0, 04/08/2026)
**Blueprint alvo:** `docs1/beneficioprev/` (módulo BENEFICIOPREV, Blueprint AS-IS, enriquecido em PFC-24)
**Precedentes:** PFC-25 (FOLHA — `Analise_Blueprint_Folha.md`, 18 processos, 30 regras) e PFC-27 (CONTRIBUIÇÃO — `Analise_Blueprint_Contribuicao_Folha.md`, 10 processos, 28 regras)

---

## 0. Resumo executivo

O Blueprint AS-IS do módulo BENEFICIOPREV (PFC-24) documenta 18 processos (PF-01 a PF-18) e 45 regras de negócio (BENEF-RN001 a BENEF-RN045), organizados em torno da estrutura do código-fonte. O modelo UC097 organiza a documentação em torno de **jornadas funcionais** com sequência operacional, ações práticas, regras de jornada (RS), tratamentos de erro (TRT), catálogo de mensagens (MSG), observações (OBS), casos de uso associados, tabela/API/programa, telas/layouts, visão consolidada com critérios de aceitação e histórico de versões.

Esta análise mapeia cada seção do modelo UC097 para o elemento correspondente do Blueprint BENEFICIOPREV, descreve o que foi **adicionado**, **alterado** ou **removido**, e indica qual aba do docs1 é afetada. Todas as 18 jornadas e 45 regras foram preservadas (0 perdas). A rastreabilidade original (códigos BENEF-RN, evidência file:linha, classificação COMPROVADO/INFERIDO/PENDENTE) foi mantida integralmente.

**Decisões de projeto registradas** (conforme diretiva do requisitante — ver seção 15).

> **Nota de nomenclatura:** a AC4 solicita um documento `Analise_Blueprint_Folha.md`. Já existe um arquivo com este nome na raiz do repositório (gerado para PFC-25 — FOLHA). Para preservar o documento existente e seguir o padrão de nomenclatura estabelecido pelo precedente PFC-27 (`Analise_Blueprint_Contribuicao_Folha.md`), este documento foi gerado como `Analise_Blueprint_Beneficioprev_Folha.md` (ver decisão D01).

---

## 1. Identificação

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Caso de Uso | Módulo BENEFICIOPREV (Benefício Previdenciário) | index.html |
| Sistema | CM Contabilidade / FUNCEF (Delphi 5 / VCL / MIDAS / Oracle) | index.html |
| Tipo | Sistema Desktop | index.html |
| Ator | Usuário operacional (analista de benefícios previdenciários) | index.html |
| OS - Título | PFC-28 — Adaptação BENEFICIOPREV | — |

**Alterações:**
- **Adicionado:** bloco "1. Identificação" no topo de `funcionalidades.html` e `regras-de-negocio.html`, com os campos do modelo UC097 (Caso de Uso, Sistema, Tipo, Ator, OS-Título).
- **Alterado:** o cabeçalho `<header>` das duas abas passa a incluir a identificação no formato UC097, com badge "Blueprint AS-IS — PFC-28 (adaptado UC097) — v2.0".
- **Removido:** nada.

---

## 2. Descrição Resumida

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Descrição Resumida | Parágrafo introdutório do `<header>` em index.html | index.html, funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "2. Descrição Resumida" em `funcionalidades.html` e `regras-de-negocio.html`, com narrativa consolidada do módulo (concessão, manutenção e desfazimento de benefícios previdenciários, eventos geradores, reajustes, conciliação INSS, desdobramento e controle de dívidas).
- **Alterado:** a descrição existente no `<header>` de `index.html` foi mantida e replicada no formato UC097 nas duas abas reestruturadas.
- **Removido:** nada.

---

## 3. Pré-condições

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Pré-condições | Campo "Pré-condições" de cada processo (PF-01 a PF-18) | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "3. Pré-condições" global em `funcionalidades.html`, consolidando as pré-condições comuns a todas as jornadas (módulo compilado, banco Oracle acessível, módulos externos CMAdmPrev/CMPrevMT50/CM Framework disponíveis, cadastros base, permissão IdModulo=454). Cada jornada (JF) mantém suas pré-condições específicas.
- **Alterado:** as pré-condições existentes em cada `pf-block` foram preservadas e reorganizadas dentro da estrutura de jornada.
- **Removido:** nada.

---

## 4. Pós-condições

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Pós-condições | Campo "Saídas" e "Persistência (tabelas escritas)" de cada processo | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "4. Pós-condições" global em `funcionalidades.html`, descrevendo o estado esperado do sistema após cada jornada (tabelas BENEFBFCIARIO/HSTBENEFBFCIARIO/MOVBENEF/PROCESSOBENEF populadas, eventos em EVENTOSPREV, auditoria em LOGTOTALPREV, isolamento por IDFUNDACAO). Cada jornada inclui suas pós-condições específicas derivadas dos campos "Saídas" e "Persistência" do processo original.
- **Alterado:** os campos "Saídas" e "Persistência (tabelas escritas)" existentes foram reorganizados como pós-condições dentro da jornada, sem perda de conteúdo.
- **Removido:** nada.

---

## 5. Jornadas Funcionais (com sequência operacional e ações práticas)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Jornadas Funcionais (JF001–JF018) | 18 processos (PF-01 a PF-18) | funcionalidades.html |
| Objetivo (por jornada) | Campo "Lógica de processamento" de cada processo | funcionalidades.html |
| Sequência operacional | Derivado da lógica de processamento de cada processo | funcionalidades.html |
| Ações práticas (tabela) | **Novo** — derivado da lógica + forms + regras + validações | funcionalidades.html |

**Mapeamento de processos para jornadas:**

| Jornada | Processo original | Título |
|---|---|---|
| JF001 | PF-01 | Concessão de Benefício |
| JF002 | PF-02 | Manutenção de Processos de Benefícios |
| JF003 | PF-03 | Simulação / Memória de Cálculo |
| JF004 | PF-04 | Desfazer Operações de Benefícios |
| JF005 | PF-05 | Eventos Previdenciários |
| JF006 | PF-06 | Reajuste de Benefícios |
| JF007 | PF-07 | Reajuste Judicial |
| JF008 | PF-08 | Desdobramento de Benefício |
| JF009 | PF-09 | Reabertura / Renovação de Benefício |
| JF010 | PF-10 | Liberação de Benefício em Exigência ou Retido |
| JF011 | PF-11 | Liberação de Benefício Provisório (Adiantamento) |
| JF012 | PF-12 | Conciliação INSS (mantenedoras/extrato/encerramento) |
| JF013 | PF-13 | Controle / Histórico de Dívidas de Benefícios |
| JF014 | PF-14 | Alteração de Benefício (individual e em lote) |
| JF015 | PF-15 | Cadastro de Processos INSS (Habilitação) |
| JF016 | PF-16 | Reconstrução / Cancelamento de Evento INSS |
| JF017 | PF-17 | Cálculo Retroativo de Benefícios |
| JF018 | PF-18 | Registro de Falecimento de Beneficiário |

**Alterações:**
- **Adicionado:** para cada jornada, uma **tabela de ações práticas** com as colunas do modelo UC097: Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela. O conteúdo foi derivado da lógica de processamento existente, das validações, das regras referenciadas e dos forms (telas) identificados.
- **Adicionado:** referências a códigos RS (regras de jornada) e TRT (tratamentos de erro) na sequência operacional, no formato `[RSxxx]` e `[TRTxxx]`, conforme o modelo UC097.
- **Adicionado:** fluxograma Mermaid por jornada, representando o comportamento comprovado no código-fonte.
- **Alterado:** cada `pf-block` foi renomeado de "PF-xx" para "JFnnn (PF-xx) — [título]", mantendo o `id` original (ex.: `id="PF-01"`) para preservar os links existentes do `index.html` e de outras abas. O campo "Forms de entrada" foi mantido dentro da jornada como "Gatilho/Ator".
- **Removido:** nada. Todos os 18 processos estão presentes como 18 jornadas.

---

## 6. Regras de negócio da jornada (RS)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Regras de negócio (RS001–RS045) | 45 regras (BENEF-RN001 a BENEF-RN045) | regras-de-negocio.html |
| Código RS | Código BENEF-RN | regras-de-negocio.html |
| Título | Título da regra BENEF-RN | regras-de-negocio.html |
| Descrição em linguagem de negócio | Atributo Descrição da regra | regras-de-negocio.html |
| Campos de dados (obrigatório/opcional/condicional) | Atributo "Dados envolvidos" + "Condições" | regras-de-negocio.html |

**Mapeamento de regras BENEF-RN para códigos RS (45 regras):**

| Código RS | Código BENEF-RN original | Título |
|---|---|---|
| RS001 | BENEF-RN001 | Seleção de tipo de benefício direciona o fluxo |
| RS002 | BENEF-RN002 | Menu de Eventos montado dinamicamente por FLGINTERNO |
| RS003 | BENEF-RN003 | Falecimento exclui evento gerador 346 do menu |
| RS004 | BENEF-RN004 | Elegibilidade por data via regra string (simulação) |
| RS005 | BENEF-RN005 | Valor previsionado por regra numérica (simulação) |
| RS006 | BENEF-RN006 | Eventos de aposentadoria/morte só consideram benefícios ativos |
| RS007 | BENEF-RN007 | Reajuste só atua sobre benefícios vitalícios não-resgate |
| RS008 | BENEF-RN008 | Reajuste exclui benefícios 255 e 358 (REPLAN não saldado) |
| RS009 | BENEF-RN009 | Reajuste distingue fonte pagadora (Funcef/INSS) |
| RS010 | BENEF-RN010 | Desfazimento só atua sobre registros concedidos |
| RS011 | BENEF-RN011 | Desfazimento restaura VALORATUAL do log |
| RS012 | BENEF-RN012 | Desfazimento exclui históricos derivados da concessão |
| RS013 | BENEF-RN013 | Desfazimento restaura DATAFINAL da contribuição |
| RS014 | BENEF-RN014 | Validação de dados de revisão/desdobramento |
| RS015 | BENEF-RN015 | Validação de formato de data DD/MM/AAAA |
| RS016 | BENEF-RN016 | Evento em aberto bloqueia nova procura |
| RS017 | BENEF-RN017 | Desdobramento exige regra contábil automática válida |
| RS018 | BENEF-RN018 | Evento Falecimento grava data da morte e tempo de serviço |
| RS019 | BENEF-RN019 | Eventos persistem em EVENTOSPREV e auditam DATAALTERADO |
| RS020 | BENEF-RN020 | Reabertura atualiza situação do processo e do participante |
| RS021 | BENEF-RN021 | Liberação em exigência conclui o processo (IDSITPROCESSO=1) |
| RS022 | BENEF-RN022 | Associação de rubrica INSS não admite duplicidade |
| RS023 | BENEF-RN023 | Reajuste Judicial só benefícios ativos em planos ativos |
| RS024 | BENEF-RN024 | Cadastro de Processo INSS só sobre benefícios ativos e habilitações concedidas |
| RS025 | BENEF-RN025 | Toda operação de negócio é auditada em LOGTOTALPREV |
| RS026 | BENEF-RN026 | Instituto previdenciário substitui captions em runtime |
| RS027 | BENEF-RN027 | Integração contábil ativada quando FLGINTCONTAB=1 |
| RS028 | BENEF-RN028 | Desfazimento bloqueia se benefício já foi pago no período |
| RS029 | BENEF-RN029 | DesfazDesdobramento bloqueia se folha já efetivada |
| RS030 | BENEF-RN030 | Desfazimento roteia por TIPOMOV |
| RS031 | BENEF-RN031 | Desdobramento gera número de processo individual por benefício |
| RS032 | BENEF-RN032 | Desdobramento bloqueia se valor excede limite sem autorização |
| RS033 | BENEF-RN033 | Liberação em exigência verifica limites de valor E percentual |
| RS034 | BENEF-RN034 | Pensão Reg/Replan: percentual 50% + 10%/dependente, máx 80% |
| RS035 | BENEF-RN035 | Evento Falecimento exige dependentes elegíveis |
| RS036 | BENEF-RN036 | Evento Assistido INSS (AI/BI) grava evento específico |
| RS037 | BENEF-RN037 | Evento INSS (IN/Invalidez) grava FLGINVALIDO=1 |
| RS038 | BENEF-RN038 | Reajuste Judicial: NovoValor = ValorAnterior + (ValorAnterior * FG * Fator/100) |
| RS039 | BENEF-RN039 | Reabertura bloqueia se benefício já processado pela prévia |
| RS040 | BENEF-RN040 | Alteração em lote: divergência > 0,02 rejeita o registro |
| RS041 | BENEF-RN041 | Arquivo de importação rejeitado por duplicidade via hash CRC32 |
| RS042 | BENEF-RN042 | Conciliação INSS: até 9 rubricas por linha |
| RS043 | BENEF-RN043 | Composição de valores RI: máximo 20 rubricas por mês |
| RS044 | BENEF-RN044 | Entrada manual INSS bloqueia em meses fechados |
| RS045 | BENEF-RN045 | Filtro de multi-fundação (IDFUNDACAO) em toda SQL de negócio |

**Alterações:**
- **Adicionado:** cada regra recebe um código RS (RS001–RS045) no formato UC097, mantendo o código BENEF-RN original como referência cruzada (ex.: "RS001 (BENEF-RN001)").
- **Adicionado:** classificação de campos de dados como **[obrigatório]**, **[opcional]** ou **[condicional]** com valores permitidos, conforme o modelo UC097. Derivado do atributo "Dados envolvidos" e do atributo "Condições" existentes.
- **Adicionado:** seção "Regras de negócio da jornada" dentro de cada jornada em `funcionalidades.html`, listando os códigos RS aplicáveis com link para a regra completa em `regras-de-negocio.html`.
- **Alterado:** o `id` de cada `rule-block` foi mantido como `id="BENEF-RNxxx"` para preservar links existentes. O `rule-id` passou a mostrar "RSxxx (BENEF-RNxxx) — Título".
- **Alterado:** os atributos originais (descrição, condições, dados, resultado, exceções, evidência) foram preservados integralmente; a estrutura visual foi adaptada para o formato de card de regra UC097.
- **Removido:** nada. Todas as 45 regras estão presentes.

---

## 7. Tratamentos (TRT)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Tratamentos de erro (TRT001–TRT020) | Validações bloqueantes e exceções das regras + mensagens de tratamento-erros.html | funcionalidades.html, regras-de-negocio.html |
| Condição | Atributo "Condições" da regra | — |
| Mensagem | Atributo "Resultado/Exceção" + mensagens de tratamento-erros.html | — |
| Resultado | Comportamento bloqueante/aborta/avisa | — |

**Tratamentos de erro identificados (TRT001–TRT020), derivados das 20 mensagens de validação significativas catalogadas em `tratamento-erros.html`:**

| TRT | Condição | Mensagem | Resultado | Regra de origem | Jornada |
|---|---|---|---|---|---|
| TRT001 | Benefício já foi pago no período (VLBENEFPGTO > 0) | MSG001 — "Benefício já foi pago… não pode ser desfeita" | Bloqueia desfazimento | RS010 (RN028) | JF004 |
| TRT002 | Folha de benefícios já efetivada no desdobramento (FLGENVIADO=1) | MSG002 — "Folha já executada. Desdobramento não pode ser desfeito." | Bloqueia desfazimento | RS010 (RN029) | JF004, JF008 |
| TRT003 | Desdobramento excede valor limite sem autorização | MSG003 — "Desdobramento não permitido por exceder valor limite" | Bloqueia desdobramento | RS017 (RN032) | JF008 |
| TRT004 | Liberação excede valor limite sem autorização | MSG004 — "Liberação não permitida por exceder valor limite" | Bloqueia liberação | RS033 (RN033) | JF010 |
| TRT005 | Liberação excede percentual limite sem autorização | MSG005 — "Liberação não permitida por exceder percentual limite" | Bloqueia liberação | RS033 (RN033) | JF010 |
| TRT006 | Nenhum benefício selecionado para liberação | MSG006 — "Nenhum Benefício selecionado" | Bloqueia liberação | RS021 (RN021) | JF010 |
| TRT007 | Rubrica do INSS não informada | MSG007 — "É necessário indicar a Rubrica do INSS!" | Bloqueia operação | RS022 (RN022) | JF012 |
| TRT008 | Inserção/alteração em mês fechado | MSG008 — "Não é possível inserir registros em meses fechados!" | Bloqueia operação | RS044 (RN044) | JF012 |
| TRT009 | Data fora do formato DD/MM/AAAA | MSG009 — "Os campos de datas devem estar no formato DD/MM/AAAA!" | Bloqueia alteração | RS015 (RN015) | JF014 |
| TRT010 | Data de início de liberação menor que data de início de pagamento | MSG010 — "A data de início de liberação deve ser igual ou maior…" | Bloqueia operação | RS014 (RN014) | JF008, JF010 |
| TRT011 | Erro ao excluir correção monetária no desfazimento | MSG011 — "Erro ao Excluir Correção monetária. Verifique." | Avisa e aborta | RS012 (RN012) | JF004 |
| TRT012 | Erro ao gravar log de operação | MSG012 — "Erro ao gravar Log." | Propaga exceção (raise exception.Create) | RS019 (RN019) | JF005, JF008 |
| TRT013 | Erro ao criar datamodule 'TDtmRelatorios' | MSG013 — "Erro ao criar datamodule 'TDtmRelatorios'..." | Avisa (mtError) | RS026 (RN026) | JF001 |
| TRT014 | Campos obrigatórios não preenchidos (conciliação) | MSG014 — "Faltam Preencher Campos ..." | Bloqueia operação | RS014 (RN014) | JF012 |
| TRT015 | Excesso de rubricas no mesmo mês (> 20) | MSG015 — "Excesso de rubricas no mesmo mês (20)" | Bloqueia composição | RS043 (RN043) | JF012 |
| TRT016 | NB já existe cadastrado (processo INSS) | MSG016 — "NB já existe cadastrado" | Bloqueia cadastro | RS024 (RN024) | JF015 |
| TRT017 | Rubrica do INSS já associada (duplicidade) | MSG017 — "Rubrica do INSS já associada!" | Avisa duplicidade | RS022 (RN022) | JF012 |
| TRT018 | Código já cadastrado (mantenedora) | MSG018 — "Código já Cadastrado." | Bloqueia cadastro | RS024 (RN024) | JF015 |
| TRT019 | Moeda não informada (reconstrução INSS) | MSG019 — "Informar moeda é obrigatório." | Bloqueia operação | RS016 (RN016) | JF016 |
| TRT020 | Alteração de benefício concluída | MSG020 — "Alteração realizada com sucesso!" | Confirma sucesso (mtInformation) | RS015 (RN015) | JF014 |

**Alterações:**
- **Adicionado:** seção "Tratamentos (TRT)" em `funcionalidades.html` (global) e referências a TRT dentro de cada jornada que possui validações bloqueantes. Em `regras-de-negocio.html`, cada regra que possui exceção recebe o TRT correspondente.
- **Adicionado:** os TRT foram derivados exclusivamente das 20 mensagens de validação significativas já catalogadas em `tratamento-erros.html` (PFC-24) e das exceções das regras. Nenhum tratamento ou mensagem foi inventado — todos correspondem a validações comprovadas no código (evidência file:linha preservada).
- **Removido:** nada. As exceções originais foram mantidas e complementadas com a estrutura TRT.

---

## 8. Catálogo de Mensagens (MSG)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Catálogo de Mensagens (MSG001–MSG020) | Mensagens de erro/exceção de tratamento-erros.html | funcionalidades.html, regras-de-negocio.html |
| Código MSG | **Novo** | — |
| Texto da Mensagem | Texto da exceção (MessageDlg / ShowMessage / raise EValidacao / raise exception.Create) | — |
| Jornadas relacionadas | Jornada da regra de origem | — |

**Catálogo de mensagens (MSG001–MSG020):** as 20 mensagens significativas de `tratamento-erros.html`, cada uma mapeada à(s) jornada(s) de origem (ver tabela na seção 7).

**Alterações:**
- **Adicionado:** seção "Catálogo de Mensagens (MSG)" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela no formato UC097 (Código, Texto, Jornadas relacionadas). Cada mensagem aparece exatamente uma vez no catálogo.
- **Adicionado:** referências a códigos MSG nas jornadas e tratamentos (TRT), no formato `[MSGxxx]`.
- **Removido:** nada. As mensagens originais (textos de `MessageDlg`, `ShowMessage`, `raise EValidacao` e `raise exception.Create`) foram preservadas no catálogo.

---

## 9. Observações Gerais (OBS)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Observações Gerais (OBS) | Notas contextuais e premissas do Blueprint | funcionalidades.html, regras-de-negocio.html |

**Observações identificadas (OBS001–OBS007):**

| Código | Observação |
|---|---|
| OBS001 | O módulo BENEFICIOPREV é um sistema desktop Delphi 5 / VCL, operado por usuário humano (diferente do UC097, que é backend puro). |
| OBS002 | O motor de cálculo/concessão é externo (CMAdmPrev/UAdmPrev); o BENEFICIOPREV orquestra a UI e a persistência, delegando o cálculo ao motor. |
| OBS003 | O arquivo com mais blocos try é `FDesfazConcessaoBenefNOVO.pas` (91 blocos), refletindo a complexidade do desfazimento por TIPOMOV (RS030). |
| OBS004 | A evidência de cada regra é classificada como COMPROVADO (no código), INFERIDO (plausível) ou PENDENTE (validar). Esta classificação foi mantida do PFC-24. |
| OBS005 | O menu de eventos é montado dinamicamente por FLGINTERNO (RS002), suportando TS/ID/IN/FL/RC/AI/BI. |
| OBS006 | Os fluxogramas Mermaid representam somente comportamentos comprovados no código-fonte. |
| OBS007 | O filtro de multi-fundação (IDFUNDACAO) está presente em quase toda SQL de negócio (RS045), garantindo isolamento de dados por fundação. |

**Alterações:**
- **Adicionado:** seção "Observações Gerais (OBS)" em `funcionalidades.html` e `regras-de-negocio.html`.
- **Removido:** nada.

---

## 10. Casos de Uso Associados

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Casos de Uso Associados | Dependências externas (integracoes.html) e processos relacionados | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Casos de Uso Associados" em `funcionalidades.html`, listando os módulos externos dos quais o BENEFICIOPREV depende (CM Framework, CMAdmPrev, CMPrevMT50, CMGLOBALOBJ50, UAdmPrev, UBeneficio, UParticipante, FOLHA, CONTRIBUICAOPREV), com link para `integracoes.html`.
- **Adicionado:** em cada jornada, a seção "Dependências" lista os casos de uso (outras jornadas) que precedem ou sucedem a jornada atual.
- **Removido:** nada.

---

## 11. Tabela/API/Programa

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Tabela/API/Programa | Tabelas de dados (dados.html), procedures (procedures-functions.html), entry point | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Tabela/API/Programa" em `funcionalidades.html`, com tabela mapeando cada jornada às tabelas Oracle lidas/escritas (BENEFBFCIARIO, HSTBENEFBFCIARIO, MOVBENEF, PROCESSOBENEF, etc.), às rotinas-chave (com file:linha) e ao entry point `BENEFICIOPREV/Fontes/BeneficioPrev.dpr`. Conteúdo derivado de `dados.html` e `procedures-functions.html`.
- **Adicionado:** em `regras-de-negocio.html`, referência à tabela/rotina de origem de cada regra (atributo já existente, agora apresentado no formato UC097).
- **Removido:** nada.

---

## 12. Telas/Layouts

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Telas/Layouts | Formulários Delphi (.dfm) identificados em cada processo | funcionalidades.html |

**Alterações:**
- **Adicionado:** seção "Telas/Layouts" em `funcionalidades.html`, com tabela mapeando cada jornada aos forms (.dfm) correspondentes (ex.: JF001 → FPrincipal.dfm/fTipoLiberacao.dfm, JF004 → FDesfazConcessaoBenefNOVO.dfm, JF008 → FDesdobramentoBenef.dfm, etc.). A coluna "Tela" da tabela de ações práticas também referencia o form.
- **Removido:** nada.

---

## 13. Visão Consolidada de Jornadas Funcionais (com critérios de aceitação)

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Visão Consolidada | **Novo** — síntese de todas as jornadas/regras | funcionalidades.html, regras-de-negocio.html |
| [US] items | **Novo** — uma US por jornada | — |
| Critérios Dado/Quando/Então | **Novo** — derivado das validações e resultados | — |

**Alterações:**
- **Adicionado:** seção "Visão Consolidada de Jornadas Funcionais" em `funcionalidades.html` (18 jornadas) e `regras-de-negocio.html` (45 regras), com tabela no formato UC097: Jornada/Regra, ID, Título, Critérios de aceitação (Dado/Quando/Então), Mensagens, Telas.
- **Adicionado:** um item `[US] BENEFICIOPREV-JFnnn` por jornada, com pelo menos um critério Dado/Quando/Então derivado das condições e resultados da regra/processo correspondente.
- **Removido:** nada.

---

## 14. Histórico de Versões

| Atributo UC097 | Elemento BENEFICIOPREV correspondente | Aba docs1 afetada |
|---|---|---|
| Histórico de Versões | **Novo** | funcionalidades.html, regras-de-negocio.html |

**Alterações:**
- **Adicionado:** seção "Histórico de Versões" em `funcionalidades.html` e `regras-de-negocio.html`, com tabela: Versão, Descrição, Data, Responsável.
  - v1.0 — Blueprint AS-IS inicial — 2026-11-09 — Squad Blueprint
  - v1.1 — Enriquecimento PFC-24 (18 processos, 45 regras, 144 artefatos) — 2026-11-10 — Squad Blueprint
  - v2.0 — Adaptação ao modelo UC097 (PFC-28) — jornadas funcionais JF001–JF018, RS/TRT/MSG, visão consolidada — 2026-11-10 — Squad Blueprint (GLM-5.2)
- **Removido:** nada.

---

## 15. Decisões de projeto

Conforme a diretiva do requisitante ("qualquer dúvida deve ser resolvida pela melhor decisão disponível, sem interromper o trabalho; cada decisão deve ser registrada neste relatório"), as seguintes decisões foram tomadas:

| # | Decisão | Justificativa |
|---|---|---|
| D01 | O documento de análise foi gerado como `Analise_Blueprint_Beneficioprev_Folha.md` (não `Analise_Blueprint_Folha.md` como literalmente nomeado na AC4). | Já existe `Analise_Blueprint_Folha.md` (PFC-25 — FOLHA) na raiz. Sobrescrevê-lo destruiria o registro audível do FOLHA. O precedente PFC-27 usou `Analise_Blueprint_Contribuicao_Folha.md`; seguir o mesmo padrão (`Analise_Blueprint_Beneficioprev_Folha.md`) preserva o documento existente e mantém consistência. O contexto adicional do issue explicitamente autoriza esta interpretação ("o nome solicitado pode refletir uma reutilização do padrão de nomenclatura do issue anterior"). |
| D02 | Cada processo (PF-01 a PF-18) torna-se exatamente uma jornada (JF001 a JF018), em vez de agrupar processos em jornadas. | Garante que nenhum processo seja perdido (AC1 exige 18 de 18) e mantém o mapeamento 1:1 simples e rastreável. |
| D03 | O `id` HTML de cada jornada mantém o código original (ex.: `id="PF-01"`), e o título mostra "JF001 (PF-01)". | Preserva todos os links existentes do `index.html` e de outras abas (AC5 exige 0 links quebrados). |
| D04 | O `id` HTML de cada regra mantém `id="BENEF-RNxxx"`, e o título mostra "RSxxx (BENEF-RNxxx)". | Mesma razão de D03 — preserva links existentes. |
| D05 | Os códigos RS são numerados RS001–RS045 na mesma ordem dos BENEF-RN001–BENEF-RN045. | Mantém o mapeamento trivial e reversível. |
| D06 | Os TRT e MSG foram derivados exclusivamente das 20 mensagens de validação significativas já catalogadas em `tratamento-erros.html` (PFC-24) e das exceções das regras. Nenhum tratamento ou mensagem foi inventado. | Garante que o conteúdo é evidence-based (AC3) e rastreável ao código-fonte do BENEFICIOPREV. |
| D07 | A seção "Ações práticas" de cada jornada foi derivada da lógica de processamento existente, decomposta em ações individuais com objetivo, entrada, comportamento, resultado, regras, mensagens e tela. | O UC097 exige esta tabela; o conteúdo já existe na lógica do processo, apenas reestruturado. |
| D08 | A "Visão Consolidada" e os critérios Dado/Quando/Então foram derivados das condições e resultados das regras, e dos campos "Saídas" e "Resultado" dos processos. | O UC097 exige critérios de aceitação; o conteúdo deriva diretamente do que já está documentado. |
| D09 | As pré-condições e pós-condições globais consolidam condições comuns a todas as jornadas; cada jornada mantém suas condições específicas. | Evita redundância e segue o padrão do UC097 (que tem pré/pós-condições globais e por jornada). |
| D10 | O badge "Blueprint AS-IS — Delphi 5" foi atualizado para "Blueprint AS-IS — PFC-28 (adaptado UC097) — v2.0" nas abas reestruturadas, mantendo a referência ao PFC-24. | Reflete a nova versão do documento (v2.0) sem perder a rastreabilidade ao enriquecimento anterior. |
| D11 | A navegação (nav) das abas reestruturadas foi mantida idêntica à original (13 links: Visão Geral, Arquitetura, Inventário, Funcionalidades, Procedures, Regras, Dados, Relatórios, Integrações, Erros, Fluxos, Lacunas, Cobertura). | AC5 exige que a navegação existente continue funcionando. |
| D12 | As regras RS034 (pensão Reg/Replan, WO18367) e RS036/RS037 (eventos assistido INSS) foram tratadas no mesmo formato UC097 que as demais, sem distinção visual. | O modelo UC097 não separa regras por origem; todas são regras de jornada (RS). |
| D13 | O TRT020 (MSG020 "Alteração realizada com sucesso!") foi incluído no catálogo embora seja informativo (mtInformation), não de erro. | É uma mensagem significativa catalogada em tratamento-erros.html; incluí-la mantém o catálogo completo e evidence-based, classificando o resultado como "Confirma sucesso". |

---

## 16. Impacto em outras partes do documento BENEFICIOPREV

Conforme a seção "Escopo de abas" do issue, o modelo UC097 deve também servir para adaptar outros pontos do documento caso necessário (escopo secundário). As seguintes partes adicionais foram ajustadas:

| Parte | Ajuste | Aba docs1 |
|---|---|---|
| Cabeçalho e badge | Atualizado para refletir PFC-28 e v2.0 | funcionalidades.html, regras-de-negocio.html |
| Rodapé | Data de geração atualizada para 2026-11-10 e referência PFC-28 | funcionalidades.html, regras-de-negocio.html |
| Links cruzados index.html → funcionalidades.html | Mantidos (ids PF-01 a PF-18 preservados) | index.html (não alterado) |
| Links cruzados index.html → regras-de-negocio.html | Mantidos (ids BENEF-RN001 a BENEF-RN045 preservados) | index.html (não alterado) |

**Partes não alteradas** (justificativa: fora do escopo da adaptação das abas Processos e Regras, e AC5 exige que a navegação existente continue funcionando):
- `arquitetura.html`, `inventario-tecnico.html`, `procedures-functions.html`, `dados.html`, `relatorios.html`, `integracoes.html`, `tratamento-erros.html`, `diagramas-fluxo.html`, `lacunas.html`, `controle-cobertura.html` — não modificadas.
- `index.html` — não modificado (preserva links e navegação).

---

## 17. Verificação de aceitação

| AC | Status | Evidência |
|---|---|---|
| AC1 — `funcionalidades.html` reestruturada com 18 jornadas (JF001–JF018), cada uma com identificação, objetivo, sequência operacional, tabela de ações práticas, pré/pós-condições, TRT e dependências; ids PF-01 a PF-18 preservados | OK | `funcionalidades.html` seção 5 — 18 `pf-block` com `id="PF-01"` a `id="PF-18"` |
| AC2 — `regras-de-negocio.html` reestruturada com 45 regras (RS001–RS045), cada uma com código RS, código BENEF-RN original, título, descrição, campos classificados [obrigatório]/[opcional]/[condicional], evidência (file:linha) e classificação COMPROVADO/INFERIDO/PENDENTE; ids BENEF-RN001 a BENEF-RN045 preservados | OK | `regras-de-negocio.html` seção 6 — 45 `rule-block` com `id="BENEF-RN001"` a `id="BENEF-RN045"` |
| AC3 — Catálogo MSG e TRT derivados exclusivamente das validações/exceções do Blueprint PFC-24 (tratamento-erros.html), sem inventar tratamentos; cada TRT referencia condição, mensagem, resultado e regra/jornada de origem | OK | Seções 7 e 8 — 20 TRT e 20 MSG, todos com evidência file:linha em tratamento-erros.html |
| AC4 — Documento de análise gerado mapeando as 14 seções UC097 ao elemento BENEFICIOPREV correspondente, indicando adicionado/alterado/removido | OK | `Analise_Blueprint_Beneficioprev_Folha.md` seções 1–14 (ver decisão D01 sobre nomenclatura) |
| AC5 — Navegação e links cruzados preservados; demais abas não modificadas; index.html preserva todos os href | OK | Nav inalterada (13 links); ids HTML preservados; 10 abas + index.html não modificadas |

---

*Fim do relatório de análise.*
