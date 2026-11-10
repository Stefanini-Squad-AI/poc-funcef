# Análise da Quantidade de Casos de Uso por Módulo — docs1

**Issue:** PFC-33 — Entendimento UC
**Data:** 2026-11-10
**Autor:** Squad Blueprint
**Objeto da análise:** lista de casos de uso criada no PFC-32 (`docs1/folha/uc101–uc108.html`, `docs1/contribuicao/uc201–uc208.html`, `docs1/beneficioprev/uc301–uc308.html`)
**Escopo:** somente este relatório. Nenhuma página do docs1 e nenhum arquivo de código-fonte foi alterado. A correção da documentação, se aprovada, deve ser feita depois, com os prompts da seção 7.

---

## 0. Resumo executivo

- Os três módulos do docs1 têm **8 casos de uso cada** (24 no total), mas têm tamanhos bem diferentes. A Folha tem **18 jornadas, 219 telas (.dfm) e 300 units (.pas) com 254.294 linhas**. A Contribuição tem **10 jornadas, 75 telas e 80 units com 85.470 linhas**.
- **O número 8 é um padrão fixo aplicado aos três módulos. Ele não vem do conteúdo de cada um.** O repositório não registra nenhuma regra que leve a "8". A nota "Numeração dos UCs" diz apenas que as jornadas foram agrupadas "por funcionalidade" dentro de uma faixa por módulo. Os indícios do padrão fixo:
  - a Contribuição precisou de só 2 junções (10 → 8), e a Folha e o Benefício precisaram de 10 cada (18 → 8);
  - a Folha ganhou um caso de uso "guarda-chuva" (UC107 – *Tratar Situações Especiais de Pagamento*) com 4 jornadas sem ligação entre si;
  - o UC101 concentra 21 das 30 regras da Folha (70%).
- **O tamanho do código, sozinho, não justifica mais casos de uso.** Boa parte do volume da Folha está no motor de cálculo `dFolhaPrevia.pas` (30.856 linhas), que pertence a uma única jornada (JF002). O que justifica mudar a contagem é a **coesão dos agrupamentos**: jornadas sem ligação foram colocadas no mesmo caso de uso.
- **Recomendações** (critério na seção 4):

| Módulo | UCs atuais | Recomendação | Novos UCs |
|---|---:|---|---|
| Folha de Benefícios | 8 | **quantidade recomendada = 12** | UC109–UC112 |
| Contribuição Previdenciária | 8 | **quantidade recomendada = 9** | UC209 |
| Benefício Previdenciário | 8 | **quantidade recomendada = 10** | UC309–UC310 |

- Os três módulos ficam abaixo do recomendado. Por isso a seção 7 traz um prompt pronto para cada um.

---

## 1. Fontes e como conferir os números

| Dado | Fonte | Como conferir |
|---|---|---|
| UCs, jornadas por UC, regras por UC | `docs1/<módulo>/funcionalidades.html`, seções 1 (lista) e 2 (Mapa Jornada → Caso de Uso) | abrir a página; a mesma lista aparece na seção "Identificação" de cada `ucNNN.html` |
| Regras de negócio (RN) | `funcionalidades.html`, seção 3 "Onde está cada regra de negócio" | contar as linhas do índice |
| Processos (PF) | `docs1/<módulo>/index.html` e `controle-cobertura.html` ("Processos 100% N/N PF documentados") | — |
| Telas e artefatos do docs1 | `docs1/<módulo>/controle-cobertura.html` ("1. Arquivos identificados", "Forms N/N .dfm") | `find FOLHA -iname '*.dfm' \| wc -l` |
| Units e linhas (.pas) | pastas `FOLHA/`, `CONTRIBUICAOPREV/`, `BENEFICIOPREV/` | `find FOLHA -iname '*.pas' \| wc -l` e `find FOLHA -iname '*.pas' -print0 \| xargs -0 cat \| wc -l` |
| Linhas totais do módulo (todos os fontes, regras do PFC-18/26) | `docs/tools/contagem_docs1.py` | `python3 docs/tools/contagem_docs1.py` (saída: "Validação OK") |

---

## 2. Tamanho de cada módulo × quantidade de casos de uso (AC2)

### 2.1 Tabela comparativa

| Indicador | Folha de Benefícios | Contribuição Previdenciária | Benefício Previdenciário |
|---|---:|---:|---:|
| **Casos de uso atuais** | **8** (UC101–UC108) | **8** (UC201–UC208) | **8** (UC301–UC308) |
| Jornadas funcionais (JF) | 18 (JF001–JF018) | 10 (JF001–JF010) | 18 (JF001–JF018) |
| Regras de negócio catalogadas (RN) | 30 (FOLHA-RN001–030) | 48 (CONTRIB-RN001–048) ¹ | 45 (BENEF-RN001–045) |
| Processos (PF) | 18 (PF-01–PF-12 + PF-A–PF-F) | 10 (PF-01–PF-10) | 18 (PF-01–PF-18) |
| Artefatos no inventário do docs1 | 528 | 158 | 144 |
| Telas (.dfm) | 219 | 75 | 68 |
| Units Delphi (.pas) na pasta do módulo | 300 | 80 | 73 |
| Linhas das units .pas | 254.294 | 85.470 | 78.743 |
| Linhas totais do módulo (`contagem_docs1.py`) ² | 478.370 (517 arquivos) | 180.735 (154 arquivos) | 187.795 (136 arquivos) |
| **Jornadas por UC (média)** | **2,25** | **1,25** | **2,25** |
| UCs com 1 jornada só | 2 (UC103, UC105) | 6 | 1 (UC302) |
| Maior UC (jornadas / regras) | UC101: 4 JF / 21 RN (70% das regras) | UC201: 1 JF / 14 RN (29%) | UC301 e UC306: 3 JF; UC303: 9 RN (20%) |

¹ O card cita 55 regras para a Contribuição. Esse número é a contagem bruta de códigos `CONTRIB-RNxxx` diferentes encontrados em todas as páginas do módulo. O catálogo oficial (`funcionalidades.html`, seção 3, e `controle-cobertura.html`: "Regras 100% 48/48") tem 48 regras. Os outros 7 códigos (RN049, RN052, RN055, RN072, RN073, RN074, RN077) aparecem só como referência em `procedures-functions.html` e `tratamento-erros.html`, sem ficha de regra. Este relatório usa 48. A divergência fica registrada como ponto de limpeza (seção 8).

² Inclui .pas, .dfm texto, .dpr e demais fontes da pasta do módulo, com as regras de contagem do PFC-18/PFC-26. Não inclui as dependências compartilhadas.

### 2.2 Leitura da tabela

- Em **código e telas**, a Folha tem cerca de 3 vezes o tamanho de cada um dos outros dois módulos. Mesmo assim, tem o mesmo número de UCs.
- Em **jornadas**, a Folha e o Benefício são iguais (18), e a Contribuição é bem menor (10). A quantidade de jornadas é a melhor medida da variedade funcional, porque cada jornada corresponde 1:1 a um processo identificado no código. Por essa medida, a Contribuição deveria ter **menos** UCs que os outros dois, e não o mesmo número.
- Em **regras**, a ordem se inverte: a Contribuição tem mais regras (48) que a Folha (30). Regras medem o detalhe de validação de cada jornada, e não a quantidade de objetivos do usuário. Por isso não são um bom critério para contar UCs.
- O número igual (8/8/8) não segue nenhuma das medidas acima.

---

## 3. Por que 8 casos de uso em cada módulo (AC3)

### 3.1 O que a documentação registra

As três páginas `funcionalidades.html` trazem a mesma nota, logo abaixo da lista de UCs:

> **Numeração dos UCs:** o legado documentava cada módulo como um único caso de uso com várias jornadas JF, sem numeração UC própria. A numeração e os nomes desta lista foram definidos no PFC-32 por faixa de módulo (Benefício Previdenciário UC301–UC308, Contribuição Previdenciária UC201–UC208, Folha de Benefícios UC101–UC108), agrupando as jornadas por funcionalidade. A numeração precisa ser validada com o cliente e pode ser trocada pela numeração oficial dele.

O "Mapa Jornada → Caso de Uso" (seção 2 de cada `funcionalidades.html`) mostra o resultado do agrupamento:

| Folha | Jornadas | Contribuição | Jornadas | Benefício | Jornadas |
|---|---|---|---|---|---|
| UC101 | JF001, JF002, JF003, JF004 | UC201 | JF001 | UC301 | JF001, JF002, JF003 |
| UC102 | JF005, JF012 | UC202 | JF002, JF008 | UC302 | JF004 |
| UC103 | JF006 | UC203 | JF003 | UC303 | JF005, JF018 |
| UC104 | JF007, JF008 | UC204 | JF004 | UC304 | JF006, JF007 |
| UC105 | JF010 | UC205 | JF005 | UC305 | JF008, JF013 |
| UC106 | JF011, JF018 | UC206 | JF006 | UC306 | JF009, JF010, JF011 |
| UC107 | JF009, JF013, JF014, JF015 | UC207 | JF007 | UC307 | JF014, JF017 |
| UC108 | JF016, JF017 | UC208 | JF009, JF010 | UC308 | JF012, JF015, JF016 |

### 3.2 Qual foi o critério

1. **Antes do PFC-32, cada módulo era um único caso de uso.** O modelo UC097, adotado no PFC-25/27/28/29, trata cada módulo como "o caso de uso", com várias jornadas JF. A descrição da Folha ainda diz: "O caso de uso organiza-se em 18 jornadas funcionais".
2. **O PFC-32 dividiu cada módulo em UCs "por funcionalidade"**, numerados por faixa (1xx, 2xx, 3xx). A documentação **não registra** nenhuma regra para decidir quantos UCs cada módulo deveria ter. Não há regra do tipo "um UC por objetivo do usuário" ou "um UC a cada N jornadas", e não há justificativa do número 8.
3. **O número 8 não vem do conteúdo.** Se o agrupamento seguisse o conteúdo, seria improvável chegar ao mesmo número partindo de 18, 10 e 18 jornadas. Os efeitos de um teto fixo aparecem nos dados:
   - **Contribuição (10 → 8):** só 2 junções. 6 dos 8 UCs têm uma jornada só. Uma das junções (UC208) reúne duas jornadas sem ligação entre si (ver 5.2).
   - **Folha (18 → 8):** 10 junções. Para caber em 8, foi criado um UC "guarda-chuva" (UC107 – *Tratar Situações Especiais de Pagamento*) com 4 jornadas sem dependência, sem regra em comum e com telas diferentes. Além disso, o ciclo inteiro de cálculo, efetivação e estorno ficou no UC101 (4 jornadas, 21 das 30 regras, página de 556 linhas, o dobro da segunda maior).
   - **Benefício (18 → 8):** 10 junções. A maioria segue as dependências registradas na documentação, mas duas juntam jornadas sem ligação entre si (UC306 e UC307, ver 5.3).

**Conclusão:** o número 8 é um **padrão fixo aplicado igualmente aos três módulos**. Dentro desse teto, as jornadas foram agrupadas por afinidade de assunto. Quando havia jornadas de sobra (Folha e Benefício), o teto forçou junções de jornadas sem ligação. Quando havia poucas (Contribuição), as junções foram mínimas, mas ainda assim uma delas não é coesa.

---

## 4. Critério usado nesta análise para avaliar a quantidade

A quantidade de UCs não deve sair do tamanho do código. Deve sair do **número de objetivos distintos do usuário** (a regra clássica de caso de uso: um UC por objetivo do ator). A jornada (JF) continua sendo a unidade indivisível, porque corresponde 1:1 a um processo do código. Assim, só se avalia **como as jornadas são agrupadas**.

**C1 — Coesão.** Duas ou mais jornadas podem ficar no mesmo UC se houver pelo menos uma destas ligações, registrada no próprio docs1:
- **(a) Dependência documentada entre elas** (campo "Dependências" da jornada: *precede, sucede, complementa, apoia, gera, usa*);
- **(b) Regra de negócio em comum** (a mesma RN aparece nas duas jornadas no Mapa Jornada → Caso de Uso);
- **(c) Mesmo objetivo:** variações da mesma operação sobre o mesmo objeto, por exemplo "reajuste" e "reajuste judicial", ou "liberar em exigência" e "liberar provisório".

Uma jornada que não tem nenhuma dessas ligações com as outras do UC deve virar um UC próprio.

**C2 — Ponto de decisão.** Mesmo com C1 atendido, o UC deve ser dividido quando junta etapas com **resultados de natureza diferente** e telas próprias. O caso típico é resultado provisório, que pode ser refeito (a prévia), e resultado definitivo (a efetivação ou o estorno do histórico). O docs1 já usa esse critério no Benefício, onde "Desfazer Operações" (UC302) é um UC separado da concessão (UC301).

Regras de numeração para a correção:
- os UCs existentes **mantêm o número**, para não quebrar links e referências; o nome muda quando o conteúdo diminui;
- os UCs novos recebem os **próximos números da faixa** do módulo (UC109+, UC209+, UC309+).

---

## 5. Avaliação por módulo (AC4)

### 5.1 Folha de Benefícios — **quantidade recomendada = 12**

| UC atual | Jornadas | C1 (a) dependência | C1 (b) regra comum | C1 (c) mesmo objetivo | C2 | Resultado |
|---|---|---|---|---|---|---|
| UC101 Processar a Folha | JF001, JF002, JF003, JF004 | sim (cadeia JF001→002→003→004) | sim (RN015 em JF002 e JF003) | — | **falha:** prévia (provisória, `FFolhaNormalPrevia`) × efetivação e estorno (definitivos, `fFolhaNormalEfet` 9.975 lin., `festornafolha` 5.277 lin.) | **dividir em 2** |
| UC102 Pagar e Gerar Remessa | JF005, JF012 | não | não | sim: as duas tratam o crédito ao recebedor (JF005 "bater retorno", JF012 "conciliar crédito efetuado") | ok | manter |
| UC103 Apropriar na Contabilidade | JF006 | — | — | — | ok | manter |
| UC104 Pensão Alimentícia e IRRF | JF007, JF008 | ambas integradas a JF002 | não | sim, de forma parcial: ambas são descontos legais calculados na prévia | ok | manter (ressalva 8.3) |
| UC105 Conciliar e Reembolsar INSS | JF010 | — | — | — | ok | manter |
| UC106 Convênios e Financ. Habitacional | JF011, JF018 | não | não | sim, de forma parcial: ambas são consignações de terceiros descontadas na folha | ok | manter (ressalva 8.3) |
| UC107 Tratar Situações Especiais | JF009, JF013, JF014, JF015 | **não** (JF009 liga-se só a JF002; JF013, JF014 e JF015 não têm dependência) | **não** (RN020 × RN001) | **não** (retroativo, falecimento, adiantamento e abatimento são objetivos distintos, com telas próprias) | — | **dividir em 4** |
| UC108 Conferir e Consultar | JF016, JF017 | não | não | sim: as duas servem para conferir a folha antes da efetivação | ok | manter |

**Resposta direta à pergunta do requisitante:** sim, a Folha deveria ter mais casos de uso. O motivo não é ela ser maior em linhas de código. O motivo é que dois dos seus UCs juntam objetivos diferentes do usuário:

1. **UC101** junta "calcular a prévia" e "efetivar e estornar o pagamento". São dois momentos de decisão diferentes, com telas e resultados próprios. Um gera um resultado que pode ser recalculado. O outro grava o histórico definitivo e gera os arquivos de pagamento.
2. **UC107** é um agrupamento "guarda-chuva" de 4 jornadas sem nenhuma ligação entre si. `FEncerramentoPorFalecimento.pas` tem 4.883 linhas e um cálculo pro-rata próprio. Adiantamento extra folha e abatimento de reservas têm telas e efeitos independentes.

**Jornadas a separar e nova lista (12 UCs):**

| UC | Nome proposto | Jornadas | Regras (FOLHA-RN) | Situação |
|---|---|---|---|---|
| UC101 | Preparar e Calcular a Prévia da Folha | JF001, JF002 | 18 (RN001, 004–010, 015, 017–022, 028–030) | renomeado (perde JF003, JF004) |
| UC102 | Pagar Benefícios e Gerar Remessa Bancária | JF005, JF012 | RN023 | sem alteração |
| UC103 | Apropriar a Folha na Contabilidade | JF006 | RN013 | sem alteração |
| UC104 | Calcular Pensão Alimentícia e IRRF da Folha | JF007, JF008 | RN004, 005, 014–017 | sem alteração |
| UC105 | Conciliar e Reembolsar o INSS | JF010 | RN024, 025 | sem alteração |
| UC106 | Processar Convênios e Financiamento Habitacional | JF011, JF018 | RN002, 003, 026, 027 | sem alteração |
| UC107 | Processar Retroativos da Folha | JF009 | RN020 | renomeado (perde JF013, JF014, JF015) |
| UC108 | Conferir e Consultar a Folha | JF016, JF017 | — | sem alteração |
| **UC109** | **Efetivar e Estornar a Versão de Pagamento** | **JF003, JF004** | RN011, 012, 013, 015 | **novo** (vem do UC101) |
| **UC110** | **Encerrar Benefício por Falecimento** | **JF013** | — | **novo** (vem do UC107) |
| **UC111** | **Lançar Adiantamento Extra Folha** | **JF014** | — | **novo** (vem do UC107) |
| **UC112** | **Abater Reservas de Benefícios Pagos** | **JF015** | RN001 | **novo** (vem do UC107) |

Com a nova lista, a média cai de 2,25 para 1,5 jornada por UC. Nenhum UC passa de 2 jornadas. O UC101 continua com 18 das 30 regras. Essa concentração vem da própria JF002 (o motor de cálculo da prévia), que é uma jornada única e não pode ser dividida só reagrupando jornadas.

### 5.2 Contribuição Previdenciária — **quantidade recomendada = 9**

| UC atual | Jornadas | C1 (a) | C1 (b) | C1 (c) | Resultado |
|---|---|---|---|---|---|
| UC201 Preparar e Enviar a Cobrança | JF001 | — | — | — | manter |
| UC202 Receber Contribuições e Tratar Divergências | JF002, JF008 | sim (JF008 "sucede JF001 e JF002") | sim (RN032) | — | manter |
| UC203 Alimentar e Atualizar Reservas | JF003 | — | — | — | manter |
| UC204 Manter Salário de Participação | JF004 | — | — | — | manter |
| UC205 Apurar a Tributação | JF005 | — | — | — | manter |
| UC206 Portabilidade e BS/FAB | JF006 | — | — | — | manter |
| UC207 Provisionar Perdas | JF007 | — | — | — | manter |
| UC208 Controlar Individualmente e Calcular Retroativos | JF009, JF010 | **não** (JF009 liga-se a JF008; JF010 "complementa JF006") | **não** (JF010 não tem RN) | **não** (manter manualmente o histórico × simular e calcular retroativos em lote) | **dividir** |

O número 8 está **próximo do adequado** para a Contribuição. A única junção que não tem coesão é a do UC208. Separar JF010 deixa o módulo com 9 UCs para 10 jornadas.

| UC | Nome proposto | Jornadas | Regras (CONTRIB-RN) | Situação |
|---|---|---|---|---|
| UC208 | Controlar Contribuições Individualmente | JF009 | RN009–012, 018, 019, 029, 030 | renomeado (perde JF010) |
| **UC209** | **Simular Contribuições e Calcular Retroativos** | **JF010** | — (validações de tela; ver OBS004 do módulo) | **novo** (vem do UC208) |

Os UCs UC201 a UC207 não mudam.

### 5.3 Benefício Previdenciário — **quantidade recomendada = 10**

| UC atual | Jornadas | C1 (a) | C1 (b) | C1 (c) | Resultado |
|---|---|---|---|---|---|
| UC301 Conceder e Manter Processos | JF001, JF002, JF003 | sim (JF002 "sucede JF001"; JF003 "apoia JF001") | sim (RN001 em JF001 e JF002) | — | manter |
| UC302 Desfazer Operações | JF004 | — | — | — | manter |
| UC303 Eventos e Falecimento | JF005, JF018 | sim (JF018 "complementa JF005") | — | — | manter |
| UC304 Reajustar Benefícios | JF006, JF007 | sim (JF007 "complementa JF006") | — | sim | manter |
| UC305 Desdobrar e Controlar Dívidas | JF008, JF013 | sim (JF008 "gera a dívida controlada em JF013") | — | — | manter |
| UC306 Reabrir e Liberar Benefícios | JF009, JF010, JF011 | JF010 e JF011 sim, as duas "sucede JF001"; **JF009 não** | **não** (JF009: RN020, RN039; JF010: RN021, RN033) | JF010 e JF011 sim (liberar); **JF009 não** (reabrir benefício encerrado) | **separar JF009** |
| UC307 Alterar Benefício e Calcular Retroativos | JF014, JF017 | **não** (JF017 "externa; depende do CMAdmPrev") | **não** (JF017 não tem RN) | **não** (alterar dados × recalcular em lote por arquivo de matrículas) | **dividir** |
| UC308 Conciliar e Habilitar junto ao INSS | JF012, JF015, JF016 | sim (JF012 "usa os processos de JF015 e o histórico de JF016") | — | — | manter |

O Benefício tem as mesmas 18 jornadas da Folha, mas seu agrupamento é bem mais coeso: 6 dos 8 UCs passam no critério (5 juntam jornadas ligadas por dependências registradas na documentação e 1 tem uma jornada só). Mesmo assim, há duas junções sem ligação.

| UC | Nome proposto | Jornadas | Regras (BENEF-RN) | Situação |
|---|---|---|---|---|
| UC306 | Liberar Benefícios em Exigência, Retidos ou Provisórios | JF010, JF011 | RN021, RN033 | renomeado (perde JF009) |
| UC307 | Alterar Dados de Benefícios Concedidos | JF014 | RN015, RN040, RN041 | renomeado (perde JF017) |
| **UC309** | **Reabrir ou Renovar Benefício** | **JF009** | RN020, RN039 | **novo** (vem do UC306) |
| **UC310** | **Calcular Retroativo de Benefícios** | **JF017** | — | **novo** (vem do UC307) |

Os UCs UC301 a UC305 e UC308 não mudam. As regras transversais (BENEF-RN025, RN026, RN027, RN045), que hoje aparecem na primeira jornada de cada UC de UC301 a UC308, devem aparecer também em UC309 e UC310.

---

## 6. Quadro-resumo

| Módulo | JF | UCs atuais | JF/UC atual | Conclusão | UCs recomendados | JF/UC proposto | Jornadas separadas |
|---|---:|---:|---:|---|---:|---:|---|
| Folha de Benefícios | 18 | 8 | 2,25 | quantidade recomendada = **12** | 12 | 1,50 | JF003+JF004 → UC109; JF013 → UC110; JF014 → UC111; JF015 → UC112 |
| Contribuição Previdenciária | 10 | 8 | 1,25 | quantidade recomendada = **9** | 9 | 1,11 | JF010 → UC209 |
| Benefício Previdenciário | 18 | 8 | 2,25 | quantidade recomendada = **10** | 10 | 1,80 | JF009 → UC309; JF017 → UC310 |
| **Total** | **46** | **24** | | | **31** | | 7 UCs novos |

A proposta não remove nem renumera nenhum UC existente. Ela só **acrescenta** UCs no fim de cada faixa e **renomeia** os UCs que perdem jornadas. Os links existentes continuam válidos.

---

## 7. Prompts prontos para corrigir a documentação (AC5)

Os três módulos têm menos UCs do que o recomendado. Abaixo há um prompt para cada módulo. Eles podem ser usados em cards separados (ex.: um card por módulo) ou juntos. Cada prompt já traz o módulo, as jornadas a separar, a nova numeração e as páginas a atualizar.

### 7.1 Prompt — Folha de Benefícios (8 → 12 UCs)

```text
Contexto: o módulo Folha de Benefícios do docs1 (docs1/folha/) foi organizado no PFC-32 em 8 casos
de uso (UC101–UC108). A análise analise_User_Cases.md (PFC-33) recomenda 12 casos de uso, porque o
UC101 junta a prévia com a efetivação/estorno e o UC107 junta 4 jornadas sem ligação entre si.

Tarefa: reorganizar os casos de uso da Folha, sem alterar o conteúdo das jornadas (JF) nem das regras
(FOLHA-RN), seguindo exatamente esta lista:

  UC101 – Preparar e Calcular a Prévia da Folha ........ JF001, JF002          (renomear; remover JF003, JF004)
  UC102 – Pagar Benefícios e Gerar Remessa Bancária ..... JF005, JF012          (sem alteração)
  UC103 – Apropriar a Folha na Contabilidade ............ JF006                 (sem alteração)
  UC104 – Calcular Pensão Alimentícia e IRRF da Folha ... JF007, JF008          (sem alteração)
  UC105 – Conciliar e Reembolsar o INSS ................. JF010                 (sem alteração)
  UC106 – Processar Convênios e Financiamento Habitacional JF011, JF018         (sem alteração)
  UC107 – Processar Retroativos da Folha ................ JF009                 (renomear; remover JF013, JF014, JF015)
  UC108 – Conferir e Consultar a Folha .................. JF016, JF017          (sem alteração)
  UC109 – Efetivar e Estornar a Versão de Pagamento ..... JF003, JF004          (NOVO, vindo do UC101)
  UC110 – Encerrar Benefício por Falecimento ............ JF013                 (NOVO, vindo do UC107)
  UC111 – Lançar Adiantamento Extra Folha ............... JF014                 (NOVO, vindo do UC107)
  UC112 – Abater Reservas de Benefícios Pagos ........... JF015                 (NOVO, vindo do UC107)

Páginas a atualizar:
  1. docs1/folha/uc109.html, uc110.html, uc111.html, uc112.html (criar): usar uc101.html como modelo
     de estrutura (Identificação, Descrição Resumida, Pré-condições, Pós-condições, Jornadas, Regras da
     jornada com texto completo, Tratamentos, Mensagens, fluxograma). Mover para elas, sem reescrever, os
     blocos das jornadas que saem de uc101.html e uc107.html.
  2. docs1/folha/uc101.html e uc107.html: novo título, <title>, Identificação (Jornadas, contagem de
     regras), Descrição Resumida, Pré/Pós-condições por jornada; remover os blocos das jornadas movidas.
  3. docs1/folha/funcionalidades.html:
     - seção 1 (lista de UCs): 12 cartões, com nome, descrição, jornadas e quantidade de regras corretos;
       trocar "8 casos de uso" por "12 casos de uso" no cabeçalho e no texto introdutório;
     - nota "Numeração dos UCs": dizer que a lista foi revista no PFC-33 (Folha UC101–UC112) e que
       continua sujeita à validação do cliente;
     - seção 2 (Mapa Jornada → Caso de Uso): atualizar a coluna de UC de JF003, JF004, JF013, JF014, JF015;
     - seção 3 (Onde está cada regra): atualizar FOLHA-RN001 (UC101/JF001, UC112/JF015),
       FOLHA-RN011, RN012 (UC109/JF003), RN013 (UC109/JF003, UC103/JF006),
       RN015 (UC101/JF002, UC109/JF003, UC104/JF008);
     - seção 9 (Histórico de Versões): nova linha "3.1 | PFC-xx: lista revista para 12 casos de uso
       (UC109–UC112 criados; UC101 e UC107 renomeados), conforme analise_User_Cases.md".
  4. Procurar com grep -rn "UC10[1-8]\|8 casos de uso" docs1/ e corrigir qualquer outra referência na
     Folha e nas notas de numeração de docs1/contribuicao/funcionalidades.html e
     docs1/beneficioprev/funcionalidades.html (faixa da Folha passa a UC101–UC112).

Critérios de aceite:
  - as 18 jornadas e as 30 regras FOLHA-RN continuam presentes, cada jornada em exatamente 1 UC;
  - nenhum texto de jornada ou regra é alterado, só movido;
  - todos os links "← Voltar" e os cartões da lista abrem a página certa;
  - não alterar código-fonte nem páginas de outros módulos além da nota de numeração.
```

### 7.2 Prompt — Contribuição Previdenciária (8 → 9 UCs)

```text
Contexto: o módulo Contribuição Previdenciária do docs1 (docs1/contribuicao/) tem 8 casos de uso
(UC201–UC208). A análise analise_User_Cases.md (PFC-33) mostrou que o UC208 junta duas jornadas sem
ligação (JF009 Controle individual / Entrada manual e JF010 Retroativo e Simulação) e recomenda 9 UCs.

Tarefa: separar a JF010 em um caso de uso novo, sem alterar o conteúdo das jornadas nem das regras:
  UC208 – Controlar Contribuições Individualmente ........ JF009   (renomear; remover JF010)
  UC209 – Simular Contribuições e Calcular Retroativos ... JF010   (NOVO, vindo do UC208)
  UC201–UC207: sem alteração.

Páginas a atualizar:
  1. docs1/contribuicao/uc209.html (criar), com base na estrutura de uc208.html; mover para ela o bloco
     completo da JF010 (sequência, ações, tratamentos, mensagens, fluxograma).
  2. docs1/contribuicao/uc208.html: novo nome, Identificação, Descrição Resumida, Pré/Pós-condições e
     mensagens só da JF009.
  3. docs1/contribuicao/funcionalidades.html: lista de UCs (9 cartões, "9 casos de uso"), nota
     "Numeração dos UCs" (Contribuição UC201–UC209, revisada no PFC-xx), Mapa Jornada → Caso de Uso
     (JF010 → UC209), Histórico de Versões (nova linha 3.1).
  4. Nota de numeração em docs1/folha/funcionalidades.html e docs1/beneficioprev/funcionalidades.html
     (faixa da Contribuição passa a UC201–UC209).

Critérios de aceite: 10 jornadas e 48 regras CONTRIB-RN preservadas; cada jornada em exatamente 1 UC;
links funcionando; nenhum código-fonte alterado.
```

### 7.3 Prompt — Benefício Previdenciário (8 → 10 UCs)

```text
Contexto: o módulo Benefício Previdenciário do docs1 (docs1/beneficioprev/) tem 8 casos de uso
(UC301–UC308). A análise analise_User_Cases.md (PFC-33) mostrou que o UC306 junta a reabertura (JF009)
com as liberações (JF010, JF011) e que o UC307 junta a alteração de benefício (JF014) com o cálculo
retroativo em lote (JF017), sem ligação entre elas. A recomendação é 10 UCs.

Tarefa: separar as jornadas abaixo, sem alterar o conteúdo das jornadas nem das regras:
  UC306 – Liberar Benefícios em Exigência, Retidos ou Provisórios ... JF010, JF011  (renomear; remover JF009)
  UC307 – Alterar Dados de Benefícios Concedidos ..................... JF014         (renomear; remover JF017)
  UC309 – Reabrir ou Renovar Benefício ............................... JF009         (NOVO, vindo do UC306)
  UC310 – Calcular Retroativo de Benefícios .......................... JF017         (NOVO, vindo do UC307)
  UC301–UC305 e UC308: sem alteração.

Páginas a atualizar:
  1. docs1/beneficioprev/uc309.html e uc310.html (criar), com base na estrutura de uc306.html; mover os
     blocos completos de JF009 e JF017. Incluir na primeira jornada de cada página nova o texto completo
     das regras transversais BENEF-RN025, RN026, RN027 e RN045, como já é feito em UC301–UC308.
  2. docs1/beneficioprev/uc306.html e uc307.html: novo nome, Identificação (jornadas e contagem de
     regras), Descrição Resumida, Pré/Pós-condições.
  3. docs1/beneficioprev/funcionalidades.html: lista de UCs (10 cartões, "10 casos de uso"), nota
     "Numeração dos UCs" (Benefício UC301–UC310, revisada no PFC-xx), Mapa Jornada → Caso de Uso
     (JF009 → UC309, JF017 → UC310), índice de regras (BENEF-RN020 e RN039 → UC309/JF009; regras
     transversais passam a citar UC301–UC310), Histórico de Versões (nova linha).
  4. Nota de numeração em docs1/folha/funcionalidades.html e docs1/contribuicao/funcionalidades.html
     (faixa do Benefício passa a UC301–UC310).

Critérios de aceite: 18 jornadas e 45 regras BENEF-RN preservadas; cada jornada em exatamente 1 UC;
links funcionando; nenhum código-fonte alterado.
```

> Se os três ajustes forem feitos no mesmo card, a nota "Numeração dos UCs" deve ficar igual nas três páginas `funcionalidades.html`: Folha UC101–UC112, Contribuição UC201–UC209, Benefício UC301–UC310.

---

## 8. Pontos para validação com o cliente e limitações

1. **A numeração continua provisória.** A nota do PFC-32 vale também para esta proposta: se o cliente tiver uma numeração oficial de UCs, ela substitui a faixa 1xx/2xx/3xx. Nesse caso, vale o agrupamento recomendado (quais jornadas ficam juntas), e não os números.
2. **O motivo exato do "8" não está registrado.** O repositório não tem o prompt nem a especificação do PFC-32 que levou a 8 UCs por módulo. A conclusão da seção 3 (padrão fixo) se baseia nos dados: mesmo número para 18, 10 e 18 jornadas, um UC "guarda-chuva" e junções sem ligação. Não há declaração explícita de quem fez o PFC-32.
3. **Divisões opcionais (ressalvas).** UC104 (Pensão Alimentícia × IRRF) e UC106 (Convênios × Financiamento Habitacional), da Folha, passam no critério C1 só pelo item (c), de forma parcial: são temas próximos, mas sem dependência nem regra em comum. Se o cliente preferir UCs mais finos, cada um pode ser dividido em dois (Folha chegaria a 14). Esta análise mantém os dois como estão.
4. **Contagem de regras da Contribuição (48 × 55).** Há 7 códigos CONTRIB-RN (RN049, RN052, RN055, RN072, RN073, RN074, RN077) citados em `procedures-functions.html` e `tratamento-erros.html` que não estão no catálogo de 48 regras. Eles parecem ser numeração antiga do levantamento de procedures. Isso não muda a quantidade de UCs, mas convém tratar em um card de limpeza.
5. **Jornadas não foram reavaliadas.** Esta análise considera as jornadas (JF) como estão, 1:1 com os processos (PF). Se o cliente pedir para dividir jornadas grandes, como a JF002 da Folha (prévia, motor de 30.856 linhas), isso é outra mudança e pode alterar de novo a contagem de UCs.
