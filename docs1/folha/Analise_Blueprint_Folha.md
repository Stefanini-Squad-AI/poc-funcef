# Análise do Blueprint FOLHA — adaptação ao modelo UC097 (PFC-25)

**Módulo:** Folha de Benefícios (`docs1/folha`, legado `FOLHA/Fontes/Folha.dpr`)
**Modelo de referência:** `UC097_Verificar_Elegibilidade_para_Adesão_ao_Plano_de_Previdência.pdf` (raiz do repositório), Nexus/FUNCEF, Sistema WEB, OS 2.2 – MVP-1 Cadastro
**Base adaptada:** Blueprint AS-IS PFC-22 (enriquecido)
**Data:** 10/11/2026

Este documento explica, seção por seção, o que o modelo UC097 mudou na documentação da Folha. O conteúdo de negócio é o mesmo do PFC-22. O que mudou foi a forma de organizar o conteúdo. A base de evidência (COMPROVADO / INFERIDO / PENDENTE e as referências arquivo:linha) foi mantida.

---

## 1. Resumo

| Item | Antes (PFC-22) | Depois (PFC-25, modelo UC097) |
|---|---|---|
| Aba ⚙️ Processos (`funcionalidades.html`) | 12 processos PF-01–PF-12 + 6 adicionais PF-A–PF-F, organizados por rotina de código | 1 caso de uso (**UCFOL**) com 12 seções do modelo e **19 jornadas funcionais** (JF001–JF019) |
| Aba 📏 Regras (`regras-de-negocio.html`) | 30 regras FOLHA-RN001–RN030 com 14 atributos técnicos | **50 regras RS** (RS001–RS050) com descrição de negócio, dados de entrada campo a campo, observações e jornadas |
| Histórias de usuário | não havia | 19 histórias `[US] UCFOL-001` a `UCFOL-019`, com **63 critérios** Dado que / Quando / Então |
| Tratamentos de erro | citados de forma solta ("Exceções") | **100 tratamentos** TRT001–TRT100 (condição, mensagem, resultado) |
| Mensagens | 3 textos citados nas regras | **Catálogo de 127 mensagens** MSG001–MSG127, com texto literal do código e arquivo:linha |
| Observações | dispersas | **11 observações gerais** OBS001–OBS011 |
| Rastreabilidade | conteúdo principal | mantida em blocos "Rastreabilidade técnica (AS-IS)" (recolhíveis) em cada jornada e regra |

Cobertura: 18 de 18 processos convertidos (os 12 base e os 6 adicionais) e 30 de 30 regras mapeadas. Nenhuma referência MSG/TRT/RS/OBS/JF ficou quebrada (conferido automaticamente na geração).

---

## 2. (a) Estrutura antes e depois

### 2.1 Aba Processos

**Antes:** uma introdução e 12 blocos `pf-block`, cada um com Objetivo, Gatilho, Pré-condições, Entradas, Passo-a-passo (rotinas com arquivo:linha), Validações, Regras, Saídas, Resultado, Evidência e Fluxograma em texto. Os 6 processos adicionais (PF-A a PF-F) tinham uma linha cada.

**Depois:** a ordem de seções é a do UC097. As seções 8 a 12 também existem no modelo, depois do Catálogo de Mensagens e das Observações Gerais.

| Nº | Seção (modelo UC097) | Conteúdo na Folha |
|---|---|---|
| 1 | Identificação do Caso de Uso | Caso de Uso, Sistema, Tipo, Ator, OS – Título |
| 2 | Descrição Resumida | ciclo principal, tratamentos especiais, jornadas complementares e totais |
| 3 | Pré-condições | sistema, cadastros, parâmetros, Regra de Verificação, contas, permissão |
| 4 | Pós-condições | tabelas e arquivos produzidos por jornada |
| 5 | Jornadas Funcionais | 5.1–5.19 (JF001–JF019) + **5.20 Tratamentos transversais** |
| 6 | Catálogo de Mensagens | Código, Texto, Tipo, Jornadas/Histórias, Origem (arquivo:linha) |
| 7 | Observações Gerais | OBS001–OBS011 |
| 8 | Casos de Uso Associados | adaptado para **Módulos associados** (Benefício, Contribuição, Contabilidade, CAP/CAR, IRRF, integrações) |
| 9 | Tabela/API/Programa | motor `dFolhaPrevia.pas` e tabelas principais |
| 10 | Telas/Layouts/Espec. | remete à aba Formulários (as telas são AS-IS) |
| 11 | Visão Consolidada de Jornadas | jornada, história, critérios, mensagens, telas |
| 12 | Histórico de Versões | PFC-21, PFC-22, PFC-25 |
| Anexo | Correspondência PF → JF | tabela de-para (seção nova, fora do modelo) |

Cada jornada tem as subseções do modelo, nesta ordem: **Objetivo → Sequência operacional** (passos com `[RSxxx]` e `[TRTxxx]`) **→ Ações práticas da jornada** (tabela de 8 colunas: Ação, Objetivo, Entrada esperada, Comportamento esperado, Resultado esperado, Regras, Mensagens, Tela) **→ História de usuário relacionada** (`[US] UCFOL-0nn`, "Como… quero… para…", quadro Ações práticas/Regras/Mensagens/Tela e Critérios numerados) **→ Observações e premissas → Regras de negócio da jornada → Tratamentos → Observações e dependências**. No fim vem o bloco recolhível **Rastreabilidade técnica (AS-IS)**, com o bloco PF original copiado sem alteração (gatilho, passo-a-passo de rotinas com arquivo:linha, saídas e fluxograma).

### 2.2 Aba Regras

**Antes:** cada regra tinha os 14 atributos (ID, descrição, categoria, gatilho, condições, dados, fórmula, exceções, rotina, arquivo:linha, evidência, severidade, processo, regras relacionadas), mais uma tabela de decisão do IRRF.

**Depois:** cada regra segue o formato RS do UC097:
- **código e título** (`RS001 — Competência (Mês/Ano de Referência) obrigatória`);
- **descrição de negócio**, sem nomes de rotina;
- **Dados de entrada** campo a campo, no padrão do modelo: `Campo; [obrigatório|opcional|condicional; domínio fechado: …; formato: …; máscara/limite]`;
- **Observações**;
- **Tratamentos e mensagens** relacionados (TRT/MSG, com links);
- **Jornadas** que usam a regra, além de categoria, severidade e evidência;
- **Rastreabilidade técnica (AS-IS)** com os 14 atributos originais copiados sem alteração (RS001–RS030) ou a origem arquivo:linha (RS031–RS050).

A página também tem um índice (regra, título, ID anterior, jornadas), a **tabela de reconciliação FOLHA-RN → RS** e a tabela de decisão do IRRF (mantida, com os IDs novos).

---

## 3. (b) Seções e famílias de códigos introduzidas

| Família | Formato | Faixa | Onde fica | Regra de formação |
|---|---|---|---|---|
| Caso de uso | `UCFOL` | 1 | Processos §1 | um caso de uso para o módulo inteiro (o UC097 também é um caso de uso com várias jornadas) |
| JF — Jornada Funcional | `JF001` | JF001–JF019 | Processos §5 | JF001–JF012 = PF-01–PF-12; JF013–JF018 = PF-A–PF-F; JF019 = cadastro da regra RN023 |
| US — História de usuário | `[US] UCFOL-001` | 001–019 | dentro de cada JF | uma história por jornada, como no modelo |
| Critério | `Critério N — título` | 63 no total (2 a 6 por história) | dentro de cada US | Dado que / Quando / Então; cita MSG quando há mensagem |
| RS — Regra de negócio | `RS001` | RS001–RS050 | Regras | RS001–RS030 = FOLHA-RN001–RN030 (mesmo número); RS031–RS050 novas |
| TRT — Tratamento | `TRT001` | TRT001–TRT100 | Processos §5.x e §5.20 | numeração na ordem das jornadas; TRT001 (falha de log) é transversal |
| MSG — Mensagem | `MSG001` | MSG001–MSG127 | Processos §6 | texto literal do código; numeração na ordem das jornadas |
| OBS — Observação geral | `OBS001` | OBS001–OBS011 | Processos §7 | citadas em "Observações e dependências" de cada jornada |

Tratamentos por jornada: JF001 TRT002–006 · JF002 TRT007–023 · JF003 TRT024–035 · JF004 TRT036–041 · JF005 TRT042–045 · JF006 TRT046 · JF007 TRT047–048 · JF008 TRT049–051 · JF009 TRT052 · JF010 TRT053–061 · JF011 TRT062–074 · JF012 TRT075–081 · JF013 TRT082–085 · JF014 TRT086–088 · JF015 TRT089–090 · JF016 TRT091–092 · JF017 TRT093–094 · JF018 TRT095–097 · JF019 TRT098–100 · transversal TRT001.

Observações gerais: OBS001 base de evidência e rastreabilidade · OBS002 ator e perfis · OBS003 mensagens com texto literal do legado · OBS004 log de operações · OBS005 críticas no painel de progresso · OBS006 regras técnicas/não funcionais · OBS007 CPMF · OBS008 destino contábil · OBS009 telas · OBS010 domínios e formatos · OBS011 jornada criada para regra sem processo.

**Diferenças em relação ao modelo:**
1. **Tratamentos sem mensagem.** O UC097 é um serviço de backend e todo TRT tem mensagem. Na Folha, vários tratamentos do motor de cálculo ajustam valores sem avisar o usuário (margem, benefício mínimo, líquido negativo, isenção, compensação, duplicidade). Esses TRT têm "Mensagem: — (tratamento sem mensagem ao usuário)" e o resultado "o processamento prossegue".
2. **TRT com mais de uma mensagem.** Quando o legado usa textos diferentes para a mesma condição (por exemplo, as variantes de conta bancária na efetivação), um TRT lista várias MSG.
3. **Tratamento transversal (§5.20).** A falha ao gravar o log de operações vale para 7 jornadas e foi definida uma vez só (TRT001).
4. **Coluna Tela.** No UC097 a tela é "Não aplicável". Na Folha, a coluna cita o formulário Delphi AS-IS, com link para a ficha da aba Formulários quando ela existe (OBS009).
5. **Coluna Tipo e coluna Origem no Catálogo de Mensagens.** Não existem no modelo. Foram adicionadas para dizer se a mensagem é Erro, Aviso, Informação ou Confirmação, e para manter a rastreabilidade arquivo:linha.
6. **§8** passou de "Casos de Uso Associados" para "Módulos e Casos de Uso Associados", porque ainda não há outros UCs especificados para os módulos relacionados.

---

## 4. (c) Mapeamento de IDs antigos para novos

### 4.1 Processos → Jornadas (18/18)

| Antigo | Título antigo | Novo | História |
|---|---|---|---|
| PF-01 | Preparo da Folha | JF001 — Preparar a Folha de Benefícios | UCFOL-001 |
| PF-02 | Prévia (Cálculo da Folha) | JF002 — Calcular a Prévia da Folha | UCFOL-002 |
| PF-03 | Efetivação de Versão de Pagamento | JF003 — Efetivar a Versão de Pagamento | UCFOL-003 |
| PF-04 | Estorno de Folha | JF004 — Estornar a Folha | UCFOL-004 |
| PF-05 | Pagamento / Fita de Crédito / Remessa Bancária | JF005 — Gerar Remessa Bancária de Pagamento | UCFOL-005 |
| PF-06 | Apropriação Contábil | JF006 — Apropriar a Folha na Contabilidade | UCFOL-006 |
| PF-07 | Pensão Alimentícia | JF007 — Tratar a Pensão Alimentícia | UCFOL-007 |
| PF-08 | IRRF (Compensação, Exceções, Ação Judicial) | JF008 — Calcular o IRRF | UCFOL-008 |
| PF-09 | Retroativos | JF009 — Processar Retroativos | UCFOL-009 |
| PF-10 | Conciliação e Reembolso do INSS | JF010 — Prestar Contas e Conciliar o Reembolso do INSS | UCFOL-010 |
| PF-11 | Convênio (Importação/Exportação) | JF011 — Importar, Tratar e Exportar Convênios | UCFOL-011 |
| PF-12 | Regularização de Pagamentos | JF012 — Regularizar Pagamentos | UCFOL-012 |
| PF-A | Encerramento por Falecimento | JF013 — Encerrar Benefícios por Falecimento | UCFOL-013 |
| PF-B | Adiantamento Extra Folha | JF014 — Inserir Adiantamento Extra Folha | UCFOL-014 |
| PF-C | Abatimento de Reservas | JF015 — Abater Reservas de Benefícios Pagos | UCFOL-015 |
| PF-D | Mapa da Folha | JF016 — Gerar o Mapa da Folha | UCFOL-016 |
| PF-E | Conferência e Batimento | JF017 — Conferir a Prévia e Bater o Líquido | UCFOL-017 |
| PF-F | Financiamento Habitacional | JF018 — Processar o Financiamento Habitacional | UCFOL-018 |
| — (FOLHA-RN023, processo "cadastro") | Cadastro manual de histórico | JF019 — Cadastrar Manualmente o Histórico de Benefício | UCFOL-019 |

### 4.2 Regras → RS (30/30, nenhuma sem correspondência)

| Antigo | Novo | Jornadas |
|---|---|---|
| FOLHA-RN001 | RS001 — Competência (Mês/Ano de Referência) obrigatória | JF001, JF009, JF015 |
| FOLHA-RN002 | RS002 — Parâmetros obrigatórios da exportação de arquivo para convênio | JF011 |
| FOLHA-RN003 | RS003 — Seleção mínima de versão da folha para documentos de convênio | JF011 |
| FOLHA-RN004 | RS004 — Rubrica de IR exige natureza de rendimento | JF002, JF008 |
| FOLHA-RN005 | RS005 — Proventos tributáveis compõem a base de IRRF | JF002, JF008 |
| FOLHA-RN006 | RS006 — Líquido negativo é zerado e o desconto excedente é tratado | JF002 |
| FOLHA-RN007 | RS007 — Cálculo do CPMF | JF002 |
| FOLHA-RN008 | RS008 — Margem de desconto consignável | JF002 |
| FOLHA-RN009 | RS009 — Benefício mínimo da concessão | JF002 |
| FOLHA-RN010 | RS010 — Sem duplicidade de benefício no preparo do lote | JF001 |
| FOLHA-RN011 | RS011 — Críticas impeditivas da ETL abortam a efetivação | JF003 |
| FOLHA-RN012 | RS012 — Conta bancária válida para os recebedores do lote | JF003 |
| FOLHA-RN013 | RS013 — Parâmetros contábeis e financeiros do lote | JF003, JF006 |
| FOLHA-RN014 | RS014 — Rubricas incidentes na pensão alimentícia | JF002, JF007 |
| FOLHA-RN015 | RS015 — IR regressivo por tipo de base | JF002, JF003, JF008 |
| FOLHA-RN016 | RS016 — CPMF sobre a pensão alimentícia | JF007 |
| FOLHA-RN017 | RS017 — Compensação de IRRF limitada ao saldo | JF002, JF008 |
| FOLHA-RN018 | RS018 — Rateio de rubricas entre planos | JF002 |
| FOLHA-RN019 | RS019 — REINF (eSocial) rateado por plano | JF002 |
| FOLHA-RN020 | RS020 — Correção do benefício pela data de pagamento | JF002, JF009 |
| FOLHA-RN021 | RS021 — Salário-família sobre base específica | JF002 |
| FOLHA-RN022 | RS022 — Gravação da prévia em blocos transacionais | JF002 |
| FOLHA-RN023 | RS023 — Cadastro manual de histórico exige BS, FAB e base do déficit | JF019 |
| FOLHA-RN024 | RS024 — Rubrica INSS deve estar parametrizada | JF010 |
| FOLHA-RN025 | RS025 — Cancelamento pelo usuário desfaz a prestação de contas do INSS | JF010 |
| FOLHA-RN026 | RS026 — Documentos para convênios exigem mês, ano e previsão de pagamento | JF011 |
| FOLHA-RN027 | RS027 — Saída cadastral para entidades exige mês, ano e versão | JF011 |
| FOLHA-RN028 | RS028 — Arredondamento do líquido | JF002 |
| FOLHA-RN029 | RS029 — Avaliação do dado bancário do recebedor no cálculo | JF002 |
| FOLHA-RN030 | RS030 — Controle de situação do lote (CTRLINTERFACE) | JF002 |

**Regras novas (sem ID anterior):** RS031 Dados de entrada do Preparo (JF001) · RS032 Regra de Verificação da Folha (JF001–JF003) · RS033 Parâmetros do módulo exigidos (JF001, JF002) · RS034 Dados de entrada da Prévia (JF002) · RS035 Pré-requisitos da Efetivação (JF003) · RS036 Estorno (JF004) · RS037 Remessa Bancária (JF003, JF005) · RS038 Apropriação Contábil (JF006) · RS039 Reajuste do percentual de pensão (JF007) · RS040 Salários retroativos (JF009) · RS041 Conciliação/reembolso INSS (JF010) · RS042 Importação e tratamento de convênio (JF011) · RS043 Cadastro de Evento de Regularização · RS044 Lançamento de Evento de Regularização · RS045 Conciliação de Crédito (JF012) · RS046 Falecimento (JF013) · RS047 Adiantamento extra folha (JF014) · RS048 Mapa da folha (JF016) · RS049 Conferência e batimento (JF017) · RS050 Financiamento habitacional (JF018).

Essas regras foram necessárias porque o modelo exige dados de entrada campo a campo e cada passo da jornada deve citar uma RS. No PFC-22, essas validações estavam só no passo-a-passo dos processos ou nos formulários. Os textos e as linhas foram conferidos no código-fonte de `FOLHA/Fontes`.

### 4.3 Compatibilidade de links

As âncoras antigas continuam funcionando: `funcionalidades.html#PF-01` … `#PF-F` levam à jornada correspondente, e `regras-de-negocio.html#FOLHA-RN001` … `#FOLHA-RN030` levam à RS correspondente.

---

## 5. (d) Outras abas alteradas e motivo

| Arquivo | Alterado? | O que mudou | Motivo (exigência do modelo) |
|---|---|---|---|
| `docs1/folha/funcionalidades.html` (⚙️ Processos) | Sim — reescrito | estrutura UC097 completa | objetivo da história (AC1, AC3) |
| `docs1/folha/regras-de-negocio.html` (📏 Regras) | Sim — reescrito | formato RS, reconciliação | objetivo da história (AC2) |
| `docs1/folha/index.html` (📋 Visão Geral) | Sim — ajuste pontual | selo; nota PFC-25; indicadores (50 RS, 19 JF, 127 MSG, 100 TRT); cards de processos apontam para JF001/002/003/004/005/008; resumo de regras aponta para RS001/006/007/008/015/019 com o ID antigo entre parênteses; rótulos da navegação lateral; rodapé | os cards e o resumo usavam os códigos e contagens antigos (PF, FOLHA-RN, "14 atributos", "18 processos"); com o modelo, as entradas da Visão Geral passam a ser jornadas e RS |
| `docs1/index.html` (portal, card do módulo Folha) | Sim — ajuste pontual | contagem do card: "50 regras (RS) · 19 jornadas (JF) · modelo UC097 PFC-25" | o card mostrava "30 regras · 18 processos", contagem e vocabulário substituídos pelo modelo |
| `docs1/folha/formularios.html` (🧾 Formulários) | Não | — | o modelo não exige mudança: a coluna Tela das jornadas aponta para as âncoras `#form-…` que já existem |
| `docs1/folha/rotinas.html` (🔧 Rotinas) | Não | — | conteúdo técnico; as jornadas continuam citando rotinas só na rastreabilidade AS-IS |
| `docs1/folha/dados.html` (🗄️ Dados) | Não | — | o modelo (§9 Tabela/API/Programa) apenas aponta para esta aba |
| `docs1/folha/integracoes.html` (🔗 Integrações) | Não | — | o §8 aponta para esta aba; não há códigos PF/RN nela |
| `docs1/folha/inventario.html`, `arquitetura.html` | Não | — | sem referências a PF/RN e fora do escopo do modelo |
| `docs1/assets/css/style.css` | Não | — | só foram usadas classes existentes (`rule-block`, `story-card`, `criteria-block`, `pf-block`, `legend`, `given/when/then`) |

O selo "PFC-22 (enriquecido)" das abas não alteradas foi mantido de propósito: o conteúdo delas não mudou.

Arquivo novo: `docs1/folha/Analise_Blueprint_Folha.md` (este documento). A história assumia `docs1/folha` como local, e isso **ainda precisa ser confirmado** pelo PO.

---

## 6. (e) Conteúdo não convertido, INFERIDO ou PENDENTE

### 6.1 Correção feita na conversão
- **FOLHA-RN001 / RS001:** o PFC-22 citava a mensagem "É necessário indicar o Mês/Ano de Referência!". No código (`FExecAbateReserva.pas:139,142`) existem duas mensagens separadas: "É necessário indicar o Mês de Referência!" (MSG113) e "É necessário indicar o Ano de Referência!" (MSG114). O catálogo usa o texto literal do código.

### 6.2 INFERIDO
- Ator "Analista da Folha de Benefícios" (OBS002) e a permissão de usuário nas pré-condições.
- Condição que exige os meses do abono (RS033).
- Campos da tela de reajuste do percentual de pensão (RS039).
- Número de dependentes atualizado na Prévia (RS021).
- CPMF (RS007, RS016): o tributo foi extinto em 2007; manter a regra no novo sistema é decisão de negócio (OBS007).
- Carga do contracheque em MongoDB (já era INFERIDO no PFC-22).

### 6.3 PENDENTE
- **OS – Título** e **tipo do sistema-alvo** na Identificação.
- Perfis de acesso por funcionalidade (OBS002).
- Conteúdo da Regra de Verificação da Folha, que é parametrizada (RS032).
- Destino exato do desconto excedente no líquido negativo (RS006).
- Índice de correção do benefício (RS020).
- Regra que define quando os campos BS/FAB/déficit aparecem (RS023).
- Valores possíveis da situação do lote em CTRLINTERFACE (RS030).
- Significado das três datas de pagamento da ETL (RS035).
- Códigos TIPOESTORNO além de "00" (RS036).
- Critérios do batimento de retorno bancário (RS037) e regras de casamento da conciliação de crédito (JF012).
- Tabela de destino dos lançamentos contábeis (OBS008, já PENDENTE no PFC-22).
- Mensagem de competência na tela de retroativos (JF009): não localizada; RS001 ficou vinculada conforme o PFC-22.
- Mensagens dos parâmetros contábeis/financeiros (`dtmContabil.ValidaCF`): o texto detalhado vem do módulo contábil. Só foi catalogado o cabeçalho "Erro na Integração Contábil/Financeira." (MSG034).
- Local de gravação deste documento (`docs1/folha`), a confirmar.

### 6.4 Encontrado no código e não incluído (fora do escopo da conversão)
- **Desfazer Preparo/Prévia** (`FFolhaNormalPrevia.pas:961-1009, 3602-3630`): há mensagens próprias, mas a função não constava como processo no PFC-22. É candidata a uma jornada futura.
- Mensagem "Existem lotes selecionados com mês de referência anterior ao …" (`FFolhaNormalPrevia.pas:2059`): o texto é montado em tempo de execução e não foi catalogado.
- Opções "Marcação automática de opções" da Prévia (`FFolhaNormalPrevia.pas:4290-4340`): preferência de interface, sem regra de negócio.

### 6.5 Mantido sem conversão (apenas reorganizado)
- Passo-a-passo de rotinas com arquivo:linha e os fluxogramas de cada PF: ficaram nos blocos "Rastreabilidade técnica (AS-IS)", sem alteração.
- Os 14 atributos de cada FOLHA-RN: também ficaram na rastreabilidade de cada RS, sem alteração.
- Tabela de decisão do IRRF: mantida, com os IDs novos.

---

## 7. Como repetir a conversão em outros módulos (beneficioprev, contribuicao)

1. Converter cada processo PF em uma JF, mantendo o PF como âncora e o bloco original como rastreabilidade AS-IS.
2. Renomear as regras com o mesmo número (`<MOD>-RNnnn` → `RSnnn`) e reescrever a descrição em linguagem de negócio, com dados de entrada campo a campo.
3. Procurar no código as validações (`EValidacao.CreateVal`, `MsgDlg`, `Exception.Create`, `ShowMessage`) dos forms de cada processo. Cada texto vira uma MSG (literal, com arquivo:linha). Cada condição vira um TRT (Condição / Mensagem / Resultado).
4. Criar RS de dados de entrada para as validações que ainda não têm regra.
5. Escrever uma história por jornada, com critérios Dado que / Quando / Então que citam MSG.
6. Conferir que todo código citado (JF, RS, TRT, MSG, OBS) resolve para uma âncora, e que toda RS e todo TRT têm pelo menos uma jornada.
