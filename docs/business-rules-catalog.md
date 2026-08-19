# Catálogo de Regras de Negócio — Sistema Planus (Delphi 5)

Este catálogo consolida as regras de negócio identificadas por evidência no código Delphi 5
(eventos de Forms, validações, mensagens) e no banco de dados Oracle (procedures, packages e
triggers PL/SQL). Cada regra recebe um nível de confiança conforme a força da evidência.

> Legenda de confiança:
> **Alta** = evidência clara e direta no código/banco · **Média** = inferida por padrão/contexto ·
> **Baixa** = pouca ou nenhuma evidência direta.

---

## Benefícios Previdenciários (`beneficios-previdenciarios`)

**RN001 — Manutenção do IDCALCULO durante a concessão**
- Descrição: durante todo o processo de concessão de benefício deve ser mantido o mesmo
  identificador de cálculo (`IDCALCULO`).
- Origem: `BENEFICIOPREV/Fontes/BeneficioPrev.dpr` (histórico CM$ALT, pendência 24224).
- Confiança: Alta.

**RN002 — Bloqueio de operações em meses fechados (Reembolso INSS)**
- Descrição: não é permitido inserir/alterar/excluir registros de reembolso do INSS em meses já
  fechados (quando algum documento do mês já foi gerado).
- Origem: `BENEFICIOPREV` (histórico CM$ALT, pendência 22253).
- Confiança: Alta.

**RN003 — Liberação parcial de benefício retido/em exigência**
- Descrição: benefícios retidos ou em exigência podem ser liberados de forma total ou parcial,
  com atualização correta da `DATAFINAL` do benefício.
- Origem: `BENEFICIOPREV` (telas de Liberação de Benefício; histórico CM$ALT, pendências 24726, 26861).
- Confiança: Alta.

**RN004 — Aceite de valor previsto zero por parâmetro do plano**
- Descrição: a prévia/geração da folha de benefícios só considera registros com valor previsto
  maior ou igual a zero, exceto quando o plano permite valor zero (`BENEFPLANPREV.FLGACEITAZERO = 1`).
- Origem: procedure PL/SQL `CM.SP_FB_GERALISTAPREVIA` (`SCRIPT/01_Script_SIG41089_DDL.sql`).
- Confiança: Alta.

---

## Folha de Benefícios (`folha-beneficios`)

**RN010 — Geração de prévia por lista/máquina virtual**
- Descrição: a prévia da folha de benefícios é gerada por processamento em lote, distribuindo
  matrículas de titulares em "listas" (`_FBSP_MAQUINA_VIRTUAL_<mês>`), considerando o mês de
  processamento e o 13º (`mês` + `13`).
- Origem: `CM.SP_FB_GERALISTAPREVIA` (`SCRIPT/01_Script_SIG41089_DDL.sql`).
- Confiança: Alta.

**RN011 — Elegibilidade do registro para pagamento**
- Descrição: só entram na prévia registros com `FLGENVIADO = 0`, `MESREFERENCIA <= mês` (ou mês 13),
  `DTEFETPGTO` nula e `VLBENEFPGTO` nulo.
- Origem: cursor `LISTAMATRICULAS` em `CM.SP_FB_GERALISTAPREVIA`.
- Confiança: Alta.

---

## Empréstimos e Financiamento (`emprestimos-financiamento`)

**RN020 — Cálculo de encargos de parcelas em atraso**
- Descrição: o tratamento de parcelas em atraso calcula juros remuneratórios, multa e correção
  monetária (indexador INPC), com ajuste de data prevista para cálculo de multa e correção
  monetária anterior ao dia 20 do mês.
- Origem: procedure `CM.SP_TRAT_PARCELAS_EM_ATRASO` (`__SCRIPTS__/2024/10/WO4322_4230/...SP_TRAT_PARCELAS_EM_ATRASO.SQL`).
- Confiança: Alta.

**RN021 — IOF complementar**
- Descrição: o cálculo inclui IOF complementar sobre a operação de empréstimo.
- Origem: `CM.SP_TRAT_PARCELAS_EM_ATRASO` (histórico v1.06 e v1.13).
- Confiança: Alta.

**RN022 — Não gerar encargos para prestação quitada**
- Descrição: quando a prestação já foi quitada, o sistema não deve inserir encargos (tratamento
  incluído para evitar cobrança indevida).
- Origem: `CM.SP_TRAT_PARCELAS_EM_ATRASO` (histórico v1.07, SOL 196274).
- Confiança: Alta.

**RN023 — Desconto por campanha e política de renegociação de dívida**
- Descrição: quando houver campanha, processa e lança o desconto correspondente; há política de
  renegociação de dívida aplicável ao tratamento.
- Origem: `CM.SP_TRAT_PARCELAS_EM_ATRASO` (histórico v1.12 e v1.15, SIG 136726).
- Confiança: Alta.

**RN024 — Bloqueio de concessão em tratamento de proposta**
- Descrição: insere bloqueio de concessão quando houver o tratamento específico para determinado
  tipo de proposta.
- Origem: `CM.SP_TRAT_PARCELAS_EM_ATRASO` (histórico v1.13).
- Confiança: Média (regra presente na procedure; condição exata depende de parâmetros).

---

## Contratos e Projetos (`contratos-projetos`)

**RN030 — Trilha de auditoria de alteração de contratos**
- Descrição: alterações em campos de contrato (`CONTRATOCONTR`, `CONTRATOORIG`) são registradas em
  trilha de auditoria antes do UPDATE, gravando no schema `LOGPLANUS`.
- Origem: trigger `CM.TUDLOGALT_CONTRATOCONTR` (`__SCRIPTS__/2024/11/WO13506/...TRG_TUDLOGALT_CONTRATOCONTR.sql`).
- Confiança: Alta.

---

## Plataforma / Segurança (`plataforma-cm`)

**RN040 — Ações padrão de cadastro controladas por autorização**
- Descrição: as telas de cadastro herdam de `TfrmCadastro`/`TfrmCadastroPai` e disponibilizam as
  ações Inserir, Alterar, Procurar, Apagar, Confirmar e Cancelar; a habilitação/estado dos botões
  é controlada pelo componente `CmEventosCadastro` (operações `opIdle`, `opVazio` etc.) e por
  autorização (`FTelaAut`/`uAutorizacao`).
- Origem: `CM/Forms/Source/FCadastro.pas`.
- Confiança: Alta.

**RN041 — Auditoria/trilha de alterações (LOGPLANUS)**
- Descrição: o sistema mantém trilha de auditoria de alterações por meio de triggers `TUDLOGALT_*`
  e tabelas `LOG_PLANUS_*` no schema `LOGPLANUS`.
- Origem: diversos scripts em `__SCRIPTS__/**` (ex.: `LOG_PLANUS_CONTRATOCONTR`, `LOG_PLANUS_MOVDIVIDA`).
- Confiança: Alta.

---

## IRRF / Tributos (`impostos-tributos`)

**RN050 — Redução da base de IRRF e compensação**
- Descrição: o sistema aplica reduções à base de IRRF (`IRRF_REDUCAO`) e mantém compensação de
  IRRF (`COMPENSAIRRF`) associada ao responsável do benefício.
- Origem: tabelas `IRRF_REDUCAO`, `COMPENSAIRRF`, `IRRFFOLHABENEF` (scripts DDL) e uso em
  `CM.SP_FB_GERALISTAPREVIA`.
- Confiança: Média (existência confirmada; fórmula exata em PL/SQL não incluída integralmente nos scripts).

---

## Observações gerais

- Grande parte das regras de cálculo (benefício, contribuição, empréstimo, folha, IRRF) reside em
  **PL/SQL no Oracle** (procedures/packages `SP_*`, `PR_*`). Os scripts presentes no repositório são
  **incrementais/por chamado** (`SIG*`, `SOL*`, `WO*`), portanto este catálogo cobre as regras
  cujos scripts estão versionados aqui; regras adicionais existem no banco de produção.
- Regras de UI (habilitação de campos, mensagens, navegação) estão majoritariamente nos eventos
  dos Forms (`OnClick`, `OnBeforePost`, `OnValidate`). A leitura aprofundada por Form permite
  elevar a confiança de regras hoje classificadas como Média/Baixa.
