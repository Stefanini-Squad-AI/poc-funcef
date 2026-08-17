CREATE OR REPLACE PROCEDURE CM.SP_FB_PREPARO_FOLHA_BENEF(IN_IDPREPAROBENEF IN NUMBER) IS
  /********************************************************************************************************************
  =*=
  =*=*= =*=*= =*=*= Parâmetros de entrada da procedure =*=*= =*=*= =*=*=
  =*=
  =*= 1 - PREPARO NORMAL DO MÊS;
  =*= 2 - PREPARO DO ABONO ANUAL FUNCEF E INSS;
  =*= 3 - PREPARO DA ANTECIPAÇÃO DO ABONO FUNCEF;
  =*= 4 - PREPARO DA ANTECIPAÇÃO DO ABONO INSS;
  =*= 5 - PREPARO DE RESGATE PARCELADO;
  =*= 6 - DESFAZER PREPARO;
  =*= 7 - PREPARO DO ABONO ANUAL SOMENTE FONTE PAGADORA FUNCEF;
  =*= 8 - PREPARO DO ABONO ANUAL SOMENTE FONTE PAGADORA INSS.
  =*=
  =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*= =*=*=
  =*=
  =*= Histórico de Alterações =*=
  =*=
  03/02/2016 10:15 - SOL269013 - Osni Cavalcante - Ajuste no update que alimenta a tabela PREPAROBENEF
  durante a ANTECIPAÇÃO ABONO FUNCEF, visando melhoria de performance
  =*=
  19/06/2017 12:00 - SIG 48549 e 33826 - Hébio de Souza Vieira - Resgate Parcelado e Ajuste para o equacionamento 2
  =*=
  29/06/2017 17:56 - SIG 49539 - João Ricardo - Ocorre que o processo de preparo deve verificar a situação do beneficio
  e a data inicio e final para que o beneficio seja gerado, mas para o
  caso em questão a data final está preenchida e mesmo assim o benefício
  está sendo gerado.
  =*=
  24/07/2017 09:46 - SIG 508577 - Hébio de Souza Vieira - Correção para Exclusão da base de pagamento quando do
  desfazimento do preparo.
  =*=
  31/07/2017 11:45 - sig 44541 - Hébio de Souza Vieira - Correção para não efetuar o pro rata na antecipação de abono INSS
  referente a data final do benefício.
  =*=
  31/07/2017 17:53 - SIG 51604  - João Ricardo. Ajuste da Correção da exclusão da base de pagamento no desfazimento do preparo
  para evitar erros de deadlock em execuções paralelas de desfazimento com mesmo
  titular em instâncias diferentes.
  =*=
  02/08/2017 15:34 - SIG 51744  - João Ricardo. A rotina de desfazer preparo não esta respeitando o lote selecionado, ao efetuar
  o despreparo do lote a rotina alterou o campo Último Pagamento para todos os
  participantes da Folha, de 2017/07 para 2017/06. Para Correção foram aplicados
  vários controles do lote que estão sendo desfeito. Em alguns casos também foi
  tratada a lista que está sendo processada.
  =*=
  13/11/2017       - SIG 55438 - Hébio - Ajuste para inserir a informação do perfil de investimentos no histórico de
  benefícios.
  =*=
  03/04/2018 10:18 - SIG 65638 - João Ricardo - Ajustedo preparo de resgate parcelado para observar a data final do benefício.
  Inclusão da validação do ano e mês utilizando a data final do resgate.
  Regra definida com a área: Caso o ano e mês da data final seja maior ou
  igual ao ano e mês atual o sistema não gera o resgate parcelado.
  =*=
  04/04/2018       - SIG 65680 - André Imakawa - Exclusão da tabela LOG_ALT_BASEPGTO
  =*=
  30/08/2018       - SIG 74513 - Osni Cavalcante - Adequação da procedure para migração para banco de dados TIBERO. Remoção do
  insert na tabela CARGA.APOIOCARGA.
  =*=
  19/03/2020   - SIG 99135 - João Ricardo - Melhoria para viabilizar processamento de antecipação de abono em qualquer mês
  desde que exista paramantro de antecipação de abono cadastrado na estrutura CM.PARAMAPREV.
  =*=
  20/04/2020 - SIG 99503 - João Ricardo -  Ajustar o preparo para viabilizar lançamento de 2° parcela do abono anual INNS
  ou abono anual INSS em meses definidos pelo usuário. A parametrização do mês será adicionada na estrutura CM.PARAMAPREV.
  A procedure receberá dois parâmetros novos: 7 para abono anual somente fornte pagadora FUNCEF e 8 para abono anual
  somente fonte pagadora INSS. O parâmetro 2 permanecerá para processamento do abono anual das duas fontes (FUNCEF e INSS).
  =*=
  09/10/2020 - SIG 48227 - Edilaine -  Ajustar o desfaz preparo para que qualquer alteração no modulo folha (desfaz previa
  ou preparo) deverão excluir os lançamentos carregados na tabela TMPDESC e reverter as informações no modulo de origem, 
  sendo rotina obrigatória sempre que a previa for apagada.
  =*=
  07/11/2022 - SIG 130334 - André Imakawa - Busca na HSTPERCGRUPO deve verificar a DATAFIM Maior ou Igual ao Mes de 
  processamento.
  =*=
  07/02/2023 - SIG 132434 - André Imakawa - Verificar se existe abono lançado com o IDMOTIVO = 3128.
  =*=
  06/11/2023 - WO5110  - André Imakawa - No calculo do abono não abater o INSS quando Plano = 2 
  =*=
  08/11/2023 - WO5148  - André Imakawa - Na verificação da HSTPERCGRUPO verificar se a data FIM é de ano posterior.
  =*=
  17/10/2024 - WO14561 - Leandro Pocebon - arredondamento de valor previsto e vlor integral na hstbenefbfciario
  =*=
  31/10/2024 - WO14701 - Edilaine - considerar parametrizacao do mes de pagamento de antecipacao de abono funcef
  =*=

  *********************************************************************************************************************/
  -- Variaveis Globais
  V_QUANTIDADE           NUMBER;
  V_IDTIPOPREPAROBENEF   NUMBER;
  V_IDLOTE               NUMBER;
  V_IDLISTA              NUMBER;
  V_FLGCONTRIBUICAO      NUMBER;
  V_FLGPREPAROTOTAL      NUMBER;
  V_LANCMES              NUMBER;
  V_IDMOTIVO             NUMBER;
  V_IDMOTIVOABONO        NUMBER;
  V_ACAOJIDICIALREG      NUMBER;
  V_MESPROCESSAMENTO     VARCHAR2(7);
  V_ANOFINAL             VARCHAR2(4);
  V_MESFINAL             VARCHAR2(2);
  V_DIAFINAL             VARCHAR2(2);
  V_ANOINICIAL           VARCHAR2(4);
  V_MESINICIAL           VARCHAR2(2);
  V_DIAINICIAL           VARCHAR2(2);
  V_QUANTMESES           NUMBER;
  V_DATAPAGAMENTO        DATE;
  V_VALORANTECABONO      NUMBER;
  V_VALORABONO           NUMBER;
  V_SOMAVALORESPREPARO   NUMBER;
  V_PERCGRUPOFAMILIAR    NUMBER;
  V_IDSEQINTERNOFB       NUMBER;
  V_VALORINSS            NUMBER;
  V_QUANTABONOPROC       NUMBER;
  V_FLGENVIADO           NUMBER;
  V_VALORTOTAL           NUMBER;
  V_VALORATUAL           NUMBER;
  V_VALORCALCULADO       NUMBER;
  V_DATAINICIOFUND       DATE;
  V_DIBBENEFANT          DATE;
  V_IDPLANPREVCONTAB     NUMBER;
  V_DATAINICIO           DATE;
  V_DATAFINAL            DATE;
  V_FONTEPAGADORA        NUMBER;
  V_VALOROP1             NUMBER;
  V_VALOROP2             NUMBER;
  V_VALOROP3             NUMBER;
  V_VALORSRB             NUMBER;
  V_PERCENTUAL           NUMBER;
  V_IDRESPONSAVEL        NUMBER;
  V_IDNUCLEOFAMILIAR     NUMBER;
  V_IDSITBENEFICIO       NUMBER;
  V_FLGPAGINSS           NUMBER;
  V_CODPORTFORMA         NUMBER;
  V_QUANTDIASINICIO      NUMBER;
  V_VALORINTEGRAL        NUMBER;
  V_VERIFICA_PARAM_TAXA  NUMBER;
  V_TOTALBENEFICIOS      NUMBER; -- SOL269013
  V_VLRBSTOTAL           NUMBER;
  V_VLRFABTOTAL          NUMBER;
  V_FLGCONTRIBDEFICT     NUMBER;
  V_VLRBSATUAL           NUMBER(17, 2);
  V_VLRFABATUAL          NUMBER(17, 2);
  V_VLRBASEDEFICIT       NUMBER(17, 2);
  V_VALORBASE            NUMBER; -- SIG 32583 Tiago Von
  V_IDBASEPGTO           NUMBER; -- SIG 51604 João Ricardo
  V_IDBASEPGTOAPOIO      NUMBER; -- SIG 51604 João Ricardo
  v_IDPERFILINVEST       NUMBER; -- SIG 55438
  V_IDLOALTBASEPGTO      NUMBER; -- SIG 65680 Andre Imakawa
  V_IDLOGEXPREVIA        NUMBER; -- SIG 65680 Andre Imakawa
  V_IDLOGALTPREVIA       NUMBER; -- SIG 65680 Andre Imakawa
  V_IDOBS                NUMBER; -- SIG 65680 Andre Imakawa
  v_idpessoat            number;
  v_idtitulart           number;
  v_berneft              number;
  IDPLANOPREVt           number;
  NUMEROPROCESSOt        number;
  IDPESSJURt             number;
  IDPLANOORIGEMt         number;
  SEQPROPOSTAt           number;
  IDCONTRIBUICAOt        number;
  v_idbeneficio_t        number;
  v_idpessoa_t           number;
  v_idtitular_t          number;
  V_MES_ABONO_INSS       VARCHAR2(2);
  V_MES_ABONO_FUNCEF     VARCHAR2(2);
  V_MES_ANTEC_ABN_FUNCEF VARCHAR2(2);
  V_MES_ANTEC_ABN_INSS   VARCHAR2(2);
  V_MSG_ERRO             VARCHAR2(1000);
  V_FONTE_FUNCEF         NUMBER;
  V_FONTE_INSS           NUMBER;
  V_COUNT                NUMBER;
  V_IDMOTIVOREATIVA        NUMBER; -- Andre Imakawa - SIG 132434
  --********************************************************
  -- Corpo da Procedure
  --********************************************************
BEGIN
  V_IDMOTIVOREATIVA := 3128; -- Andre Imakawa - SIG 132434
  --CORPO
  SELECT PB.IDTIPOPREPAROBENEF,
         PB.IDLOTE,
         PB.IDLISTA,
         PB.FLGCONTRIBUICAO,
         PB.FLGPREPAROTOTAL,
         C.MESREFERENCIA,
         C.DATAPAGAMENTO,
         PB.FLGCONTRIBDEFICT
    INTO V_IDTIPOPREPAROBENEF,
         V_IDLOTE,
         V_IDLISTA,
         V_FLGCONTRIBUICAO,
         V_FLGPREPAROTOTAL,
         V_MESPROCESSAMENTO,
         V_DATAPAGAMENTO,
         V_FLGCONTRIBDEFICT
    FROM PREPAROBENEF PB
    JOIN CTRLINTERFACE C
      ON PB.IDLOTE = C.IDLOTE
   WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;

  ---------------------------------------------------------------------------------------------
  IF V_IDTIPOPREPAROBENEF = 1 THEN
    --PREPARO NORMAL
    V_QUANTIDADE         := 0;
    V_SOMAVALORESPREPARO := 0;
    UPDATE PREPAROBENEF PB
       SET PB.DATAINICIO      = SYSDATE,
           PB.TOTALBENEFREJ   = 0,
           PB.TOTALBENEFPROC  = 0,
           PB.DATATERMINO     = NULL,
           PB.TOTALBENEFICIOS =
           (SELECT COUNT(*)
              FROM BENEFBFCIARIO BF
             WHERE (BF.IDSITBENEFICIO IN (1, 2))
               AND (BF.ULTMESPREPARO < V_MESPROCESSAMENTO OR
                   BF.ULTMESPREPARO IS NULL OR
                   (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                   V_IDTIPOPREPAROBENEF = 6))
               AND (BF.FLGFORMAPAGTO = 'F')
               AND (BF.IDTPPAGTOBENEFIC = 1)
               AND (V_IDLISTA IS NULL OR EXISTS
                    (SELECT 1
                       FROM LISTAFOLHABENEFDET LD
                      WHERE BF.IDTITULAR = LD.IDTITULAR
                        AND LD.IDLISTA = V_IDLISTA))
               AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                    (SELECT 1
                       FROM LISTABENEFICIOPREPARO LBP
                      WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                        AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                        AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                        AND LBP.IDPATRO = BF.IDPESSJUR)))
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    SELECT P.IDMOTIVOFOLHABEN
      INTO V_IDMOTIVO
      FROM PARAMAPREV P
     WHERE ROWNUM = 1;
  
    COMMIT;
    FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                             BF.IDBENEFICIO,
                             BF.NUMEROPROCESSO,
                             BF.IDPESSJUR,
                             BF.IDTITULAR,
                             BF.IDPLANOORIGEM,
                             BF.IDPESSOA,
                             BF.SEQPROPOSTA
                        FROM BENEFBFCIARIO BF
                       WHERE (BF.IDSITBENEFICIO IN (1, 2))
                         AND (BF.ULTMESPREPARO < V_MESPROCESSAMENTO OR
                             BF.ULTMESPREPARO IS NULL OR
                             (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                             V_IDTIPOPREPAROBENEF = 6))
                         AND (BF.FLGFORMAPAGTO = 'F')
                         AND (BF.IDTPPAGTOBENEFIC = 1)
                         AND
                            --(BF.IDPESSOA = 753493) AND
                             (V_IDLISTA IS NULL OR EXISTS
                              (SELECT 1
                                 FROM LISTAFOLHABENEFDET LD
                                WHERE BF.IDTITULAR = LD.IDTITULAR
                                  AND LD.IDLISTA = V_IDLISTA))
                         AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                              (SELECT 1
                                 FROM LISTABENEFICIOPREPARO LBP
                                WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                  AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                  AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                  AND LBP.IDPATRO = BF.IDPESSJUR))) LOOP
      BEGIN
        SELECT COUNT(*)
          INTO V_LANCMES
          FROM HSTBENEFBFCIARIO HB
         WHERE HB.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND HB.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND HB.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND HB.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND HB.IDTITULAR = C_PREPARO.IDTITULAR
           AND HB.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND HB.IDPESSOA = C_PREPARO.IDPESSOA
           AND HB.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND HB.MESREFERENCIA = V_MESPROCESSAMENTO;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_LANCMES := 0;
        WHEN TOO_MANY_ROWS THEN
          V_LANCMES := 0;
        WHEN OTHERS THEN
          V_LANCMES := 0;
      END;
      BEGIN
        SELECT DISTINCT 1
          INTO V_ACAOJIDICIALREG
          FROM PESSOAPARAM PP
         WHERE PP.IDPARAM = 122
           AND PP.IDPESSOA = C_PREPARO.IDPESSOA
           AND PP.VALOR = 'S';
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_ACAOJIDICIALREG := 0;
        WHEN TOO_MANY_ROWS THEN
          V_ACAOJIDICIALREG := 0;
        WHEN OTHERS THEN
          V_ACAOJIDICIALREG := 0;
      END;
      BEGIN
        SELECT BF.VALORTOTAL,
               BF.VALORATUAL,
               BF.VALORCALCULADO,
               BF.DATAINICIOFUND,
               BF.DIBBENEFANT,
               BF.IDPLANPREVCONTAB,
               BF.DATAINICIO,
               BF.DATAFINAL,
               BF.FONTEPAGADORA,
               NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
               NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
               NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
               BF.VALORSRB,
               DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
               BTT.IDRESPONSAVEL,
               BTT.IDNUCLEOFAMILIAR,
               BF.IDSITBENEFICIO,
               BF.FLGPAGAINSS,
               BF.CODPORTFORMA,
               BF.VLRBSATUAL,
               BF.VLRFABATUAL,
               BF.VLRBASEDEFICIT,
               BF.IDPERFILINVEST --sig 55438
          INTO V_VALORTOTAL,
               V_VALORATUAL,
               V_VALORCALCULADO,
               V_DATAINICIOFUND,
               V_DIBBENEFANT,
               V_IDPLANPREVCONTAB,
               V_DATAINICIO,
               V_DATAFINAL,
               V_FONTEPAGADORA,
               V_VALOROP1,
               V_VALOROP2,
               V_VALOROP3,
               V_VALORSRB,
               V_PERCENTUAL,
               V_IDRESPONSAVEL,
               V_IDNUCLEOFAMILIAR,
               V_IDSITBENEFICIO,
               V_FLGPAGINSS,
               V_CODPORTFORMA,
               V_VLRBSATUAL,
               V_VLRFABATUAL,
               V_VLRBASEDEFICIT,
               v_IDPERFILINVEST -- SIG 55438
          FROM BENEFBFCIARIO BF
          JOIN BFCIARIOTITPLAN BTT
            ON btt.IDPESSJUR = bf.idpessjur
           AND btt.IDTITULAR = bf.idtitular
           AND btt.IDPLANOORIGEM = bf.idplanoorigem
           AND btt.IDPESSOA = bf.idpessoa
           AND btt.SEQPROPOSTA = bf.seqproposta
           AND btt.IDPLANOPREV = bf.idplanoprev
           AND btt.IDBENEFICIO = bf.idbeneficio
          LEFT JOIN BENEFPLANOPART BPT
            ON BPT.IDPESSJUR = BF.IDPESSJUR
           AND BPT.IDPLANOPREV = BF.IDPLANOPREV
           AND BPT.IDPESSOA = BF.IDPESSOA
           AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
           AND BPT.IDBENEFICIO = BF.IDBENEFICIO
         WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND BF.IDTITULAR = C_PREPARO.IDTITULAR
           AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND BF.IDPESSOA = C_PREPARO.IDPESSOA
           AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND ROWNUM = 1;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; -- SIG 55438
        WHEN TOO_MANY_ROWS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; -- SIG 55438
        WHEN OTHERS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; -- SIG 55438
      END;
      IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO AND
         C_PREPARO.IDPESSOA <> C_PREPARO.IDTITULAR) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'PENSÃO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSIF (v_IDPERFILINVEST IS NULL) THEN
        -- Início SIG 55438
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'BENEFÍCIO SEM PERFIL DE INVESTIMENTOS CADASTRADO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF; -- Término SIG 55438
      ELSIF (V_LANCMES > 0) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'BENEFÍCIO COM LANÇAMENTOS NO MÊS DE PROCESSAMENTO DO PREPARO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSE
        SELECT CM.SEQSEQINTERNOFB.NEXTVAL INTO V_IDSEQINTERNOFB FROM DUAL;
      
        IF V_IDSITBENEFICIO = 2 THEN
          IF V_FONTEPAGADORA = 2 AND NVL(V_FLGPAGINSS, 0) = 0 THEN
            V_FLGENVIADO := 8;
          ELSE
            V_FLGENVIADO := 9;
          END IF;
        ELSE
          V_FLGENVIADO := 0;
        END IF;
        V_VALORINTEGRAL := V_VALORATUAL;
        IF TO_CHAR(V_DATAINICIO, 'YYYY/MM') = V_MESPROCESSAMENTO OR
           TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO THEN
          V_DIAINICIAL := 1;
          V_DIAFINAL   := 30;
          IF TO_CHAR(V_DATAINICIO, 'YYYY/MM') = V_MESPROCESSAMENTO THEN
            V_DIAINICIAL := EXTRACT(DAY FROM V_DATAINICIO);
          END IF;
          /* Início alteração Osni SIG 27732  - parte 1/2 */
          --IF  TO_CHAR(V_DATAINICIO, 'YYYY/MM') = V_MESPROCESSAMENTO then
          IF TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO then
            /* Fim alteração Osni SIG 27732 */
            V_DIAFINAL := EXTRACT(DAY FROM V_DATAFINAL);
            IF V_DIAFINAL = EXTRACT(DAY FROM(LAST_DAY(V_DATAINICIO))) THEN
              /*SIG 47952 - Ajuste para tratar o último dia do mês. João Ricardo e Tiago.*/
              V_DIAFINAL := 30;
            END IF;
            INSERT INTO LOGPREPARO
              (IDLOGPREPARO,
               IDPREPAROBENEF,
               IDPLANOPREV,
               IDBENEFICIO,
               NUMEROPROCESSO,
               IDPESSJUR,
               IDTITULAR,
               IDPLANOORIGEM,
               IDPESSOA,
               SEQPROPOSTA,
               OBSERVACOES)
            VALUES
              ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
               IN_IDPREPAROBENEF,
               C_PREPARO.IDPLANOPREV,
               C_PREPARO.IDBENEFICIO,
               C_PREPARO.NUMEROPROCESSO,
               C_PREPARO.IDPESSJUR,
               C_PREPARO.IDTITULAR,
               C_PREPARO.IDPLANOORIGEM,
               C_PREPARO.IDPESSOA,
               C_PREPARO.SEQPROPOSTA,
               'APOSENTADORIA COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
          
          END IF;
          /* Início alteração Osni SIG 27732 - parte 2/2 */
          --V_QUANTDIASINICIO := V_DIAFINAL - V_DIAINICIAL;
          V_QUANTDIASINICIO := (V_DIAFINAL - V_DIAINICIAL) + 1;
          /* Fim alteração Osni SIG 27732 */
          V_VALORATUAL     := (V_VALORATUAL * V_QUANTDIASINICIO) / 30;
          V_VLRBSATUAL     := (V_VLRBSATUAL * V_QUANTDIASINICIO) / 30;
          V_VLRFABATUAL    := (V_VLRFABATUAL * V_QUANTDIASINICIO) / 30;
          V_VLRBASEDEFICIT := (V_VLRBASEDEFICIT * V_QUANTDIASINICIO) / 30;
        END IF;
        /*INÍCIO DO AJUSTE DO SIG 49539 - A rotina não pode preparar benefício com data final anterior ao mês que está sendo preparado. João Ricardo.*/
        IF (V_DATAFINAL IS NOT NULL) AND
           (TO_CHAR(V_DATAFINAL, 'YYYY/MM') < V_MESPROCESSAMENTO) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO COM DATA FINAL ANTERIOR AO MÊS DE PROCESSAMENTO DO PREPARO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSE
          INSERT INTO HSTBENEFBFCIARIO HB
            (IDPESSJUR,
             IDTITULAR,
             IDPESSOA,
             IDPLANOPREV,
             IDPLANOORIGEM,
             SEQPROPOSTA,
             IDMOTIVO,
             NUMEROPROCESSO,
             IDBENEFICIO,
             MES,
             MESREFERENCIA,
             SEQBENEFICIO,
             VALORPREV,
             VALORSRB,
             VALORCALCULADO,
             VALORINTEGRAL,
             VALORTOTAL,
             IDREGRACALCULO,
             IDLOTE,
             FLGENVIADO,
             FLGCONCESSAO,
             FLGDEVOLUCAO,
             CODPORTFORMA,
             VLBENEFPGTO,
             DATAPAGAMENTO,
             FLGPROVISORIO,
             PERCENTUAL,
             VALOROP1,
             VALOROP2,
             VALOROP3,
             FONTEPAGADORA,
             FLGTIPOREGISTRO,
             MESCOMPREEM,
             LOTEORIGINAL,
             IDSEQINTERNOFB,
             VALORBS,
             VALORFAB,
             VLRBASEDEFICIT,
             IDPERFILINVEST) -- SIG 55438
          VALUES
            (C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPESSOA,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.SEQPROPOSTA,
             V_IDMOTIVO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDBENEFICIO,
             V_MESPROCESSAMENTO,
             V_MESPROCESSAMENTO,
             1
             /*SEQBENEFICIO*/,
             ROUND(V_VALORATUAL,2), -- Leandro WO14561
             V_VALORSRB,
             V_VALORCALCULADO,
             ROUND(V_VALORINTEGRAL,2), -- Leandro WO14561
             V_VALORTOTAL,
             NULL
             /*IDREGRACALCULO*/,
             DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE)
             /*idlote*/,
             V_FLGENVIADO
             /*FLGENVIADO*/,
             0,
             0
             /*FLGDEVOLUCAO*/,
             V_CODPORTFORMA,
             NULL
             /*VLBENEFPGTO*/,
             V_DATAPAGAMENTO,
             0
             /*FLGPROVISORIO*/,
             V_PERCENTUAL,
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP1),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP2),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP3),
             V_FONTEPAGADORA,
             0
             /*FLGTIPOREGISTRO*/,
             DECODE(V_FONTEPAGADORA, 2, V_MESPROCESSAMENTO, NULL),
             V_IDLOTE,
             V_IDSEQINTERNOFB,
             V_VLRBSATUAL,
             V_VLRFABATUAL,
             V_VLRBASEDEFICIT,
             v_IDPERFILINVEST); -- SIG 55438
          V_SOMAVALORESPREPARO := V_SOMAVALORESPREPARO + V_VALORATUAL;
          UPDATE BENEFBFCIARIO BF
             SET BF.ULTMESPREPARO = V_MESPROCESSAMENTO,
                 BF.ULTVALORBRUTO = V_VALORATUAL
           WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
             AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
             AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
             AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
             AND BF.IDTITULAR = C_PREPARO.IDTITULAR
             AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
             AND BF.IDPESSOA = C_PREPARO.IDPESSOA
             AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA;
        
        END IF;
        /*TÉRMINO DO AJUSTE DO SIG 49539.*/
        IF (V_FLGCONTRIBUICAO = 1 AND V_FONTEPAGADORA = 1 AND
           V_FLGENVIADO NOT IN (8, 9)) THEN
          FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                   FROM BENEFXTAXA BT
                                  WHERE BT.IDBENEFICIO =
                                        C_PREPARO.IDBENEFICIO
                                    AND EXISTS (SELECT 1
                                           FROM CONTPREV CP
                                          WHERE CP.IDCONTRIBUICAO =
                                                BT.IDCONTRIBUICAO
                                            AND CP.IDPLANOPREV =
                                                C_PREPARO.IDPLANOPREV
                                            AND CP.FLGINTERNO = 'AS'
                                            AND CP.FLGDESCFOLHA = 1)
                                    AND NOT EXISTS
                                  (SELECT 1
                                           FROM CONTRIBUICAO C
                                           JOIN TPCONTRIBUICAO TP
                                             ON TP.IDTPCONTRIBUICAO =
                                                C.IDTPCONTRIBUICAO --sig48549
                                          WHERE C.IDCONTRIBUICAO =
                                                BT.IDCONTRIBUICAO
                                            AND TP.FLGDEFICIT = 1)) LOOP
            --sig48549
            v_idpessoat     := C_PREPARO.IDPESSOA;
            v_idtitulart    := C_PREPARO.IDTITULAR;
            v_berneft       := C_PREPARO.IDBENEFICIO;
            IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
            NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
            IDPESSJURt      := C_PREPARO.IDPESSJUR;
            IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
            SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
            IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
            CM.SP_CP_PREPARO_TAXA_RETROATIVA(IN_IDPREPAROBENEF,
                                             0,
                                             C_PREPARO.IDPLANOPREV,
                                             C_PREPARO.IDBENEFICIO,
                                             C_PREPARO.NUMEROPROCESSO,
                                             C_PREPARO.IDPESSJUR,
                                             C_PREPARO.IDTITULAR,
                                             C_PREPARO.IDPLANOORIGEM,
                                             V_IDPLANPREVCONTAB,
                                             C_PREPARO.IDPESSOA,
                                             C_PREPARO.SEQPROPOSTA,
                                             V_IDLOTE,
                                             0,
                                             V_MESPROCESSAMENTO,
                                             V_MESPROCESSAMENTO,
                                             V_FLGENVIADO,
                                             0,
                                             V_DATAINICIO,
                                             V_DATAFINAL,
                                             V_PERCENTUAL,
                                             V_VALORTOTAL,
                                             C_PREPARO_TAXA.IDCONTRIBUICAO,
                                             V_IDNUCLEOFAMILIAR,
                                             V_ACAOJIDICIALREG,
                                             V_IDRESPONSAVEL,
                                             V_IDMOTIVO,
                                             V_DATAPAGAMENTO,
                                             NULL);
          END LOOP;
        END IF;
        IF (V_FLGCONTRIBDEFICT = 1 AND V_FONTEPAGADORA = 1 AND
           V_FLGENVIADO NOT IN (8, 9)) THEN
          FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                   FROM BENEFXTAXA BT
                                  WHERE BT.IDBENEFICIO =
                                        C_PREPARO.IDBENEFICIO
                                    AND EXISTS (SELECT 1
                                           FROM CONTPREV CP
                                          WHERE CP.IDCONTRIBUICAO =
                                                BT.IDCONTRIBUICAO
                                            AND CP.IDPLANOPREV =
                                                C_PREPARO.IDPLANOPREV
                                            AND CP.FLGINTERNO = 'AS'
                                            AND CP.FLGDESCFOLHA = 1)
                                    AND EXISTS
                                  (SELECT 1
                                           FROM CONTRIBUICAO C
                                           JOIN TPCONTRIBUICAO TP
                                             ON TP.IDTPCONTRIBUICAO =
                                                C.IDTPCONTRIBUICAO --sig48549
                                          WHERE C.IDCONTRIBUICAO =
                                                BT.IDCONTRIBUICAO
                                            AND TP.FLGDEFICIT = 1)) LOOP
            --sig48549
            v_idpessoat     := C_PREPARO.IDPESSOA;
            v_idtitulart    := C_PREPARO.IDTITULAR;
            v_berneft       := C_PREPARO.IDBENEFICIO;
            IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
            NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
            IDPESSJURt      := C_PREPARO.IDPESSJUR;
            IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
            SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
            IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
            CM.SP_CP_PREPARO_TAXA_DEFICIT(IN_IDPREPAROBENEF,
                                          0,
                                          C_PREPARO.IDPLANOPREV,
                                          C_PREPARO.IDBENEFICIO,
                                          C_PREPARO.NUMEROPROCESSO,
                                          C_PREPARO.IDPESSJUR,
                                          C_PREPARO.IDTITULAR,
                                          C_PREPARO.IDPLANOORIGEM,
                                          V_IDPLANPREVCONTAB,
                                          C_PREPARO.IDPESSOA,
                                          C_PREPARO.SEQPROPOSTA,
                                          V_IDLOTE,
                                          0,
                                          V_MESPROCESSAMENTO,
                                          V_MESPROCESSAMENTO,
                                          V_FLGENVIADO,
                                          0,
                                          V_DATAINICIO,
                                          V_DATAFINAL,
                                          V_PERCENTUAL,
                                          V_VALORTOTAL,
                                          C_PREPARO_TAXA.IDCONTRIBUICAO,
                                          V_IDNUCLEOFAMILIAR,
                                          V_ACAOJIDICIALREG,
                                          V_IDRESPONSAVEL,
                                          V_IDMOTIVO,
                                          V_DATAPAGAMENTO,
                                          NULL);
          END LOOP;
        END IF;
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      END IF;
      V_QUANTIDADE := V_QUANTIDADE + 1;
      IF V_QUANTIDADE MOD 1000 = 0 THEN
        COMMIT;
      END IF;
    END LOOP;
    COMMIT;
    UPDATE PREPAROBENEF PB
       SET PB.DATATERMINO = SYSDATE
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    UPDATE CTRLINTERFACE
       SET NUMREG      =
           (SELECT SUM(PB.TOTALBENEFPROC)
              FROM PREPAROBENEF PB
             WHERE PB.IDLOTE = V_IDLOTE),
           FLGPREPARADO = 1,
           VLRTOTAL     = NVL(VLRTOTAL, 0) + V_SOMAVALORESPREPARO
     WHERE IDLOTE = V_IDLOTE;
  
    COMMIT;
    --FIM PREPARO NORMAL
    ---------------------------------------------------------------------------------------------
  ELSIF V_IDTIPOPREPAROBENEF IN (2, 7, 8) THEN
    --PREPARO ABONO
    /* INÍCIO AJUSTE SIG 99503 - João Ricardo */
  
    IF V_IDTIPOPREPAROBENEF = 7 THEN
      V_FONTE_FUNCEF := 1;
      V_FONTE_INSS   := NULL;
    ELSIF V_IDTIPOPREPAROBENEF = 8 THEN
      V_FONTE_FUNCEF := NULL;
      V_FONTE_INSS   := 2;
    ELSE
      V_FONTE_FUNCEF := 1;
      V_FONTE_INSS   := 2;
    END IF;
  
    BEGIN
      SELECT MESABONOFUND, MESABONOINSS, MESADIANTABONOFUND                  /*WO14701*/
        INTO V_MES_ABONO_FUNCEF, V_MES_ABONO_INSS, V_MES_ANTEC_ABN_FUNCEF    /*WO14701*/
        FROM CM.PARAMAPREV
       WHERE ROWNUM < 2;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           'NÃO HÁ MÊS PARAMETRIZADO PARA PROCESSAMENTO DE ABONO EM ' ||
           V_MESPROCESSAMENTO || '.');
      
    END;
    IF V_IDTIPOPREPAROBENEF = 7 AND
       (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_FUNCEF) THEN
      V_MSG_ERRO := 'MÊS DE PROCESSAMENTO DO PREPARO DO ABONO FUNCEF NÃO CORRESPONDE AO MÊS PARAMETRIZADO. ' ||
                    'O MÊS PARAMETRIZADOS PARA PROCESSAMENTO DO ABONO FUNCEF: ' ||
                    V_MES_ABONO_FUNCEF || '.';
    ELSIF V_IDTIPOPREPAROBENEF = 8 AND
          (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_INSS) THEN
      V_MSG_ERRO := 'MÊS DE PROCESSAMENTO DO PREPARO DO ABONO INSS NÃO CORRESPONDE AO MÊS PARAMETRIZADO. ' ||
                    'O MÊS PARAMETRIZADOS PARA PROCESSAMENTO DO ABONO INSS: ' ||
                    V_MES_ABONO_INSS || '.';
    ELSIF V_IDTIPOPREPAROBENEF = 2 AND
          ((SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_FUNCEF) OR
          (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_INSS)) THEN
      V_MSG_ERRO := 'MÊS DE PROCESSAMENTO DO PREPARO DO ABONO FUNCEF E/OU INSS NÃO CORRESPONDE AO MÊS PARAMETRIZADO. ' ||
                    'OS MESES DE ABONO FUNCEF E INSS PRECISAM CORRESPONDER AO MÊS DE PROCESSAMENTO. ' ||
                    'MESES PARAMETRIZADOS PARA FUNCEF E INSS: ' ||
                    V_MES_ABONO_FUNCEF || ', ' || V_MES_ABONO_INSS || '.';
    END IF;
    IF ((V_IDTIPOPREPAROBENEF = 2 AND
       ((SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_FUNCEF) OR
       (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_INSS))) OR
       (V_IDTIPOPREPAROBENEF = 7 AND
       (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_FUNCEF)) OR
       (V_IDTIPOPREPAROBENEF = 8 AND
       (SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ABONO_INSS))) THEN
      INSERT INTO LOGPREPARO
        (IDLOGPREPARO,
         IDPREPAROBENEF,
         IDPLANOPREV,
         IDBENEFICIO,
         NUMEROPROCESSO,
         IDPESSJUR,
         IDTITULAR,
         IDPLANOORIGEM,
         IDPESSOA,
         SEQPROPOSTA,
         OBSERVACOES)
      VALUES
        ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
         IN_IDPREPAROBENEF,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         V_MSG_ERRO);
    
      /* TÉRMINO AJUSTE SIG 99503 - João Ricardo */
    ELSE
      V_QUANTIDADE         := 0;
      V_SOMAVALORESPREPARO := 0;
      SELECT P.IDMOTIVOFOLHABEN, P.IDMOTIVOABONO
        INTO V_IDMOTIVO, V_IDMOTIVOABONO
        FROM PARAMAPREV P
       WHERE ROWNUM = 1;
    
      UPDATE PREPAROBENEF PB
         SET PB.DATAINICIO      = SYSDATE,
             PB.TOTALBENEFREJ   = 0,
             PB.TOTALBENEFPROC  = 0,
             PB.DATATERMINO     = NULL,
             PB.TOTALBENEFICIOS =
             (SELECT COUNT(*)
                FROM (SELECT BF.NUMEROPROCESSO,
                             BF.IDTITULAR,
                             BF.IDPESSOA,
                             BF.IDPLANOORIGEM,
                             BF.IDPLANOPREV,
                             BF.IDPESSJUR,
                             BF.IDBENEFICIO,
                             BF.SEQPROPOSTA
                        FROM BENEFBFCIARIO BF
                        JOIN BENEFPLANPREV BPP
                          ON BPP.IDBENEFICIO = BF.IDBENEFICIO
                         AND BPP.IDPLANOPREV = BF.IDPLANOPREV
                       WHERE BPP.FLGPOSSUIABONO = 1
                         AND BF.FONTEPAGADORA IN
                             (V_FONTE_FUNCEF, V_FONTE_INSS)
                         AND BF.IDSITBENEFICIO IN (1, 2)
                         AND BF.IDTPPAGTOBENEFIC = 1
                         AND (BF.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
                             BF.ULTMESPREPARO IS NULL OR
                             (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                             V_IDTIPOPREPAROBENEF = 6))
                         AND (V_IDLISTA IS NULL OR EXISTS
                              (SELECT 1
                                 FROM LISTAFOLHABENEFDET LD
                                WHERE BF.IDTITULAR = LD.IDTITULAR
                                  AND LD.IDLISTA = V_IDLISTA))
                         AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                              (SELECT 1
                                 FROM LISTABENEFICIOPREPARO LBP
                                WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                  AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                  AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                  AND LBP.IDPATRO = BF.IDPESSJUR))
                      MINUS
                      SELECT HB1.NUMEROPROCESSO,
                             HB1.IDTITULAR,
                             HB1.IDPESSOA,
                             HB1.IDPLANOORIGEM,
                             HB1.IDPLANOPREV,
                             HB1.IDPESSJUR,
                             HB1.IDBENEFICIO,
                             HB1.SEQPROPOSTA
                        FROM HSTBENEFBFCIARIO HB1
                       WHERE HB1.FLGDEVOLUCAO = 0
                         AND HB1.FONTEPAGADORA IN
                             (V_FONTE_FUNCEF, V_FONTE_INSS)
                         AND HB1.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                         AND HB1.MES = V_MESPROCESSAMENTO
                         AND HB1.MESREFERENCIA =
                             SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'))
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      COMMIT;
      FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                               BF.IDBENEFICIO,
                               BF.NUMEROPROCESSO,
                               BF.IDPESSJUR,
                               BF.IDTITULAR,
                               BF.IDPLANOORIGEM,
                               BF.IDPESSOA,
                               BF.SEQPROPOSTA,
                               BF.FONTEPAGADORA
                          FROM (SELECT BF.NUMEROPROCESSO,
                                       BF.IDTITULAR,
                                       BF.IDPESSOA,
                                       BF.IDPLANOORIGEM,
                                       BF.IDPLANOPREV,
                                       BF.IDPESSJUR,
                                       BF.IDBENEFICIO,
                                       BF.SEQPROPOSTA,
                                       BF.FONTEPAGADORA
                                  FROM BENEFBFCIARIO BF
                                  JOIN BENEFPLANPREV BPP
                                    ON BPP.IDBENEFICIO = BF.IDBENEFICIO
                                   AND BPP.IDPLANOPREV = BF.IDPLANOPREV
                                 WHERE BPP.FLGPOSSUIABONO = 1
                                   AND BF.FONTEPAGADORA IN
                                       (V_FONTE_FUNCEF, V_FONTE_INSS)
                                   AND BF.IDSITBENEFICIO IN (1, 2)
                                      --AND (BF.IDPESSOA = 753493)
                                   AND BF.IDTPPAGTOBENEFIC = 1
                                   AND (BF.ULTMESPREPARO <=
                                       V_MESPROCESSAMENTO OR
                                       BF.ULTMESPREPARO IS NULL OR
                                       (BF.ULTMESPREPARO =
                                       V_MESPROCESSAMENTO AND
                                       V_IDTIPOPREPAROBENEF = 6))
                                   AND (V_IDLISTA IS NULL OR EXISTS
                                        (SELECT 1
                                           FROM LISTAFOLHABENEFDET LD
                                          WHERE BF.IDTITULAR = LD.IDTITULAR
                                            AND LD.IDLISTA = V_IDLISTA))
                                   AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                                        (SELECT 1
                                           FROM LISTABENEFICIOPREPARO LBP
                                          WHERE LBP.IDPREPAROBENEF =
                                                IN_IDPREPAROBENEF
                                            AND LBP.IDBENEFICIO =
                                                BF.IDBENEFICIO
                                            AND LBP.IDPLANOPREV =
                                                BF.IDPLANOPREV
                                            AND LBP.IDPATRO = BF.IDPESSJUR))
                                MINUS
                                SELECT HB1.NUMEROPROCESSO,
                                       HB1.IDTITULAR,
                                       HB1.IDPESSOA,
                                       HB1.IDPLANOORIGEM,
                                       HB1.IDPLANOPREV,
                                       HB1.IDPESSJUR,
                                       HB1.IDBENEFICIO,
                                       HB1.SEQPROPOSTA,
                                       HB1.FONTEPAGADORA
                                  FROM HSTBENEFBFCIARIO HB1
                                 WHERE HB1.FLGDEVOLUCAO = 0
                                   AND HB1.FONTEPAGADORA IN
                                       (V_FONTE_FUNCEF, V_FONTE_INSS)
                                   AND HB1.IDMOTIVO IN
                                       (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                                   AND HB1.MES = V_MESPROCESSAMENTO
                                   AND HB1.MESREFERENCIA =
                                       SUBSTR(V_MESPROCESSAMENTO, 0, 4) ||
                                       '/13') BF) LOOP
        BEGIN
          SELECT DISTINCT 1
            INTO V_ACAOJIDICIALREG
            FROM PESSOAPARAM PP
           WHERE PP.IDPARAM = 122
             AND PP.IDPESSOA = C_PREPARO.IDPESSOA
             AND PP.VALOR = 'S';
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_ACAOJIDICIALREG := 0;
          WHEN TOO_MANY_ROWS THEN
            V_ACAOJIDICIALREG := 0;
          WHEN OTHERS THEN
            V_ACAOJIDICIALREG := 0;
        END;
        BEGIN
          SELECT BF.VALORTOTAL,
                 BF.VALORATUAL,
                 BF.VALORCALCULADO,
                 BF.DATAINICIOFUND,
                 BF.DIBBENEFANT,
                 BF.IDPLANPREVCONTAB,
                 BF.DATAINICIO,
                 BF.DATAFINAL,
                 BF.FONTEPAGADORA,
                 NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
                 NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
                 NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
                 BF.VALORSRB,
                 DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
                 BTT.IDRESPONSAVEL,
                 BTT.IDNUCLEOFAMILIAR,
                 BF.IDSITBENEFICIO,
                 BF.FLGPAGAINSS,
                 BF.CODPORTFORMA,
                 BF.VLRBSATUAL,
                 BF.VLRFABATUAL,
                 BF.VLRBASEDEFICIT,
                 BF.VLRBSTOTAL,
                 BF.VLRFABTOTAL,
                 BF.IDPERFILINVEST --SIG55438
            INTO V_VALORTOTAL,
                 V_VALORATUAL,
                 V_VALORCALCULADO,
                 V_DATAINICIOFUND,
                 V_DIBBENEFANT,
                 V_IDPLANPREVCONTAB,
                 V_DATAINICIO,
                 V_DATAFINAL,
                 V_FONTEPAGADORA,
                 V_VALOROP1,
                 V_VALOROP2,
                 V_VALOROP3,
                 V_VALORSRB,
                 V_PERCENTUAL,
                 V_IDRESPONSAVEL,
                 V_IDNUCLEOFAMILIAR,
                 V_IDSITBENEFICIO,
                 V_FLGPAGINSS,
                 V_CODPORTFORMA,
                 V_VLRBSATUAL,
                 V_VLRFABATUAL,
                 V_VLRBASEDEFICIT,
                 V_VLRBSTOTAL,
                 V_VLRFABTOTAL,
                 v_IDPERFILINVEST --SIG 55438
            FROM BENEFBFCIARIO BF
            JOIN BFCIARIOTITPLAN BTT
              ON btt.IDPESSJUR = bf.idpessjur
             AND btt.IDTITULAR = bf.idtitular
             AND btt.IDPLANOORIGEM = bf.idplanoorigem
             AND btt.IDPESSOA = bf.idpessoa
             AND btt.SEQPROPOSTA = bf.seqproposta
             AND btt.IDPLANOPREV = bf.idplanoprev
             AND btt.IDBENEFICIO = bf.idbeneficio
            LEFT JOIN BENEFPLANOPART BPT
              ON BPT.IDPESSJUR = BF.IDPESSJUR
             AND BPT.IDPLANOPREV = BF.IDPLANOPREV
             AND BPT.IDPESSOA = BF.IDPESSOA
             AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
             AND BPT.IDBENEFICIO = BF.IDBENEFICIO
           WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
             AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
             AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
             AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
             AND BF.IDTITULAR = C_PREPARO.IDTITULAR
             AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
             AND BF.IDPESSOA = C_PREPARO.IDPESSOA
             AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
             AND BF.FONTEPAGADORA = C_PREPARO.FONTEPAGADORA
             AND ROWNUM = 1;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN TOO_MANY_ROWS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN OTHERS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
        END;
        V_ANOINICIAL := TO_CHAR(V_DATAINICIO, 'YYYY');
        IF V_ANOINICIAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
          V_DIAINICIAL := TO_CHAR(V_DATAINICIO, 'DD');
          IF V_DIAINICIAL <= '16' THEN
            V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM') - 1;
          ELSE
            V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM');
          END IF;
        ELSE
          V_MESINICIAL := '00';
        END IF;
        V_ANOFINAL := TO_CHAR(V_DATAFINAL, 'YYYY');
        IF V_ANOFINAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
          V_DIAFINAL := TO_CHAR(V_DATAFINAL, 'DD');
          IF V_DIAFINAL <= '14' THEN
            V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM') - 1;
          ELSE
            V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM');
          END IF;
        ELSE
          V_MESFINAL := '12';
        END IF;
        V_QUANTMESES := V_MESFINAL - V_MESINICIAL;
        IF V_QUANTMESES <> 0 THEN
          SELECT NVL(SUM(HPG.PERCENTUAL * (((CASE
          				WHEN TO_CHAR(HPG.DATAFIM, 'YYYY') > SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN -- Andre Imakawa - WO5148
                        	12
                        ELSE
                        	CASE   
	                           WHEN TO_CHAR(HPG.DATAFIM, 'DD') < '15' THEN
	                            TO_NUMBER(TO_CHAR(HPG.DATAFIM, 'MM')) - 1
	                           ELSE
	                            TO_NUMBER(TO_CHAR(NVL(HPG.DATAFIM,
	                                                  '31/12/' || SUBSTR(V_MESPROCESSAMENTO, 0, 4)),
	                                              'MM'))
	                        END
                         END - CASE
                           WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') < SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
                            1
                           WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
                            CASE
                              WHEN TO_CHAR(HPG.DATAINICIO, 'DD') >= 16 THEN
                               TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM')) + 1
                              ELSE
                               TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM'))
                            END
                         END) + 1) / V_QUANTMESES)),
                     0)
            INTO V_PERCGRUPOFAMILIAR
            FROM HSTPERCGRUPO HPG
           WHERE HPG.IDPLANOPREV = C_PREPARO.IDPLANOPREV
             AND HPG.IDBENEFICIO = C_PREPARO.IDBENEFICIO
             AND HPG.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
             AND HPG.IDPESSJUR = C_PREPARO.IDPESSJUR
             AND HPG.IDTITULAR = C_PREPARO.IDTITULAR
             AND HPG.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
             AND HPG.IDPESSOA = C_PREPARO.IDPESSOA
             AND HPG.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
             AND HPG.FONTEPAGADORA = C_PREPARO.FONTEPAGADORA
			 --AND (TO_CHAR(HPG.DATAFIM, 'YYYY') =	-- Andre Imakawa - SIG 130334
             AND (TO_CHAR(HPG.DATAFIM, 'YYYY') >=	-- Andre Imakawa - SIG 130334
                 SUBSTR(V_MESPROCESSAMENTO, 0, 4) OR HPG.DATAFIM IS NULL);
        
        ELSE
          V_PERCGRUPOFAMILIAR := 0;
        END IF;
        SELECT COUNT(*)
          INTO V_QUANTABONOPROC
          FROM HSTBENEFBFCIARIO HB
         WHERE HB.MESREFERENCIA =
               (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13')
           AND HB.MES = V_MESPROCESSAMENTO
           AND HB.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND HB.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND HB.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND HB.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND HB.IDTITULAR = C_PREPARO.IDTITULAR
           AND HB.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND HB.IDPESSOA = C_PREPARO.IDPESSOA
           AND HB.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND HB.FONTEPAGADORA = C_PREPARO.FONTEPAGADORA;
      
        IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSIF (v_IDPERFILINVEST IS NULL) THEN
          --Início SIG 55438
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO SEM PERFIL DE INVESTIMENTOS CADASTRADO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF; --Término SIG 55438
        ELSIF (C_PREPARO.IDPESSOA <> C_PREPARO.IDTITULAR AND
              V_PERCGRUPOFAMILIAR = 0) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'PENSIONISTA COM PERCENTUAL DE GRUPO FAMILIAR IGUAL A ZERO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSIF (V_QUANTABONOPROC <> 0) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO COM ABONO PROCESSADO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSE
          V_VALORINTEGRAL := V_VALORATUAL;
          IF C_PREPARO.IDPESSOA = C_PREPARO.IDTITULAR THEN
            V_VALORABONO     := ROUND(V_VALORATUAL * (V_QUANTMESES / 12), 2);
            V_VLRBASEDEFICIT := ROUND(V_VLRBASEDEFICIT *
                                      (V_QUANTMESES / 12),
                                      2);
            IF V_IDPLANPREVCONTAB = 28 THEN
              V_VLRBSATUAL  := ROUND(V_VLRBSATUAL * (V_QUANTMESES / 12), 2);
              V_VLRFABATUAL := ROUND(V_VLRFABATUAL * (V_QUANTMESES / 12), 2);
            END IF;
          ELSE
          	-- Andre Imakawa - WO5110 - Inicio
			/*
            IF V_IDPLANPREVCONTAB = 2 AND V_FONTEPAGADORA = 1 THEN
              BEGIN
                SELECT SUM(BF.VALORATUAL)
                  INTO V_VALORINSS
                  FROM BENEFBFCIARIO BF
                 WHERE BF.IDPESSOA <> BF.IDTITULAR
                   AND BF.IDTITULAR = C_PREPARO.IDTITULAR
                   AND BF.FONTEPAGADORA = 2
                   AND BF.IDSITBENEFICIO IN (1, 2);
              
                -- AND ROWNUM = 1; -- SIG 33231 Tiago Von 
              EXCEPTION
                WHEN NO_DATA_FOUND THEN
                  V_VALORINSS := 0;
                WHEN TOO_MANY_ROWS THEN
                  V_VALORINSS := 0;
                WHEN OTHERS THEN
                  V_VALORINSS := 0;
              END;
              -- INICIO SIG 32583 Tiago Von
              V_VALORBASE := V_VALORTOTAL - V_VALORINSS;
              IF V_VALORBASE < V_VALOROP2 THEN
                V_VALORBASE := V_VALOROP2;
              END IF;
              V_VALORABONO := GREATEST(ROUND(((V_VALORBASE
                                             --V_VALORTOTAL-V_VALORINSS
                                             ) * (V_QUANTMESES / 12)) *
                                             V_PERCGRUPOFAMILIAR / 100,
                                             2),
                                       0);
              -- FIM SIG 32583 Tiago Von
              V_VALORABONO     := ROUND(V_VALORABONO * (V_VALOROP3 / 100),
                                        2); -- SIG 33288 Tiago Von { Considerar o % de PBE }
              V_VLRBASEDEFICIT := GREATEST(ROUND(((V_VLRBASEDEFICIT) *
                                                 (V_QUANTMESES / 12)) *
                                                 V_PERCGRUPOFAMILIAR / 100,
                                                 2),
                                           0);
            ELSE
			*/
			-- Andre Imakawa - WO5110 - Fim
              V_VALORABONO     := ROUND((V_VALORTOTAL * (V_QUANTMESES / 12)) *
                                        V_PERCGRUPOFAMILIAR / 100,
                                        2);
              V_VLRBASEDEFICIT := ROUND((V_VLRBASEDEFICIT *
                                        (V_QUANTMESES / 12)) *
                                        V_PERCGRUPOFAMILIAR / 100,
                                        2);
              IF V_IDPLANPREVCONTAB = 28 THEN
                V_VLRBSATUAL  := ROUND((V_VLRBSTOTAL * (V_QUANTMESES / 12)) *
                                       V_PERCGRUPOFAMILIAR / 100,
                                       2);
                V_VLRFABATUAL := ROUND((V_VLRFABTOTAL * (V_QUANTMESES / 12)) *
                                       V_PERCGRUPOFAMILIAR / 100,
                                       2);
              END IF;
            --END IF; -- Andre Imakawa - WO5110
          END IF;
          SELECT CM.SEQSEQINTERNOFB.NEXTVAL
            INTO V_IDSEQINTERNOFB
            FROM DUAL;
        
          INSERT INTO HSTBENEFBFCIARIO
            (IDTITULAR,
             IDPESSJUR,
             IDPLANOPREV,
             IDBENEFICIO,
             IDMOTIVO,
             IDPESSOA,
             NUMEROPROCESSO,
             MES,
             VLBENEFPGTO,
             IDREGRAABATERESE,
             IDRETROATIVO,
             SEQBENEFICIO,
             SEQPROPOSTA,
             IDREGRACALCULO,
             IDLOTE,
             DTEFETPGTO,
             VALORPREV,
             DATAPAGAMENTO,
             CODPORTFORMA,
             VALORBASE1,
             VALORBASE2,
             VALORBASE3,
             VALORBASE4,
             VALORBASE5,
             VALORCALCULADO,
             FLGACERTODESFEITO,
             VALOROP1,
             VALOROP2,
             VALOROP3,
             CODREFERENCIA,
             FLGENVIADO,
             MESREFERENCIA,
             VLRTOTRETROATIVO,
             VLRDIFRETROATIVO,
             FLGCONCESSAO,
             FLGDEVOLUCAO,
             FLGFORMAPAGTO,
             VALORTOTAL,
             FONTEPAGADORA,
             CODDOCUMENTO,
             TRGDTINCLUSAO,
             TRGUSERINCLUSAO,
             IDAGENCIARESGATE,
             VALORINTEGRAL,
             VALORPREVMIN,
             IDREGRABENEFMIN,
             IDHSTFOLHABENEF,
             FLGDESCIRMES,
             VALORSRB,
             PERCPROVISORIO,
             FLGMANUAL,
             IDPLANOORIGEM,
             FLGPROVISORIO,
             IDTITBENEF,
             VALORACERTO,
             IDSEQINTERNOFB,
             IDMOVBENEF,
             PERCENTUAL,
             FLGTIPOREGISTRO,
             FLGALIMRESERVA,
             LOTEORIGINAL,
             MESCOMPREEM,
             IDCONTROLEDIVIDABENEFICIO,
             VALORBS,
             VALORFAB,
             VLRBASEDEFICIT,
             IDPERFILINVEST) -- SIG 55438
            SELECT IDTITULAR,
                   IDPESSJUR,
                   IDPLANOPREV,
                   IDBENEFICIO,
                   IDMOTIVO,
                   IDPESSOA,
                   NUMEROPROCESSO,
                   MES,
                   VLBENEFPGTO,
                   IDREGRAABATERESE,
                   IDRETROATIVO,
                   ROWNUM + 1 SEQBENEFICIO,
                   SEQPROPOSTA,
                   IDREGRACALCULO,
                   IDLOTE,
                   DTEFETPGTO,
                   CASE
                     WHEN VALORPREV < 0 THEN
                      ROUND(VALORPREV * (-1),2)
                     ELSE
                      ROUND(VALORPREV,2)
                   END VALORPREV,
                   DATAPAGAMENTO,
                   CODPORTFORMA,
                   VALORBASE1,
                   VALORBASE2,
                   VALORBASE3,
                   VALORBASE4,
                   VALORBASE5,
                   VALORCALCULADO,
                   FLGACERTODESFEITO,
                   VALOROP1,
                   VALOROP2,
                   VALOROP3,
                   CODREFERENCIA,
                   DECODE(V_IDSITBENEFICIO,
                          2,
                          DECODE(V_FLGPAGINSS, 1, 9, 8),
                          0) FLGENVIADO,
                   MESREFERENCIA,
                   VLRTOTRETROATIVO,
                   VLRDIFRETROATIVO,
                   FLGCONCESSAO,
                   CASE
                     WHEN VALORPREV < 0 THEN
                      0
                     ELSE
                      1
                   END FLGDEVOLUCAO,
                   FLGFORMAPAGTO,
                   VALORTOTAL,
                   FONTEPAGADORA,
                   CODDOCUMENTO,
                   TRGDTINCLUSAO,
                   TRGUSERINCLUSAO,
                   IDAGENCIARESGATE,
                   VALORINTEGRAL,
                   VALORPREVMIN,
                   IDREGRABENEFMIN,
                   IDHSTFOLHABENEF,
                   FLGDESCIRMES,
                   VALORSRB,
                   PERCPROVISORIO,
                   0 FLGMANUAL,
                   IDPLANOORIGEM,
                   FLGPROVISORIO,
                   IDTITBENEF,
                   VALORACERTO,
                   V_IDSEQINTERNOFB,
                   IDMOVBENEF,
                   PERCENTUAL,
                   FLGTIPOREGISTRO,
                   FLGALIMRESERVA,
                   DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE),
                   MESCOMPREEM,
                   IDCONTROLEDIVIDABENEFICIO,
                   VALORBS,
                   VALORFAB,
                   VLRBASEDEFICIT,
                   v_IDPERFILINVEST -- SIG 55438
              FROM (SELECT HB.IDTITULAR,
                           HB.IDPESSJUR,
                           HB.IDPLANOPREV,
                           HB.IDBENEFICIO,
                           V_IDMOTIVOABONO IDMOTIVO,
                           HB.IDPESSOA,
                           HB.NUMEROPROCESSO,
                           V_MESPROCESSAMENTO MES,
                           NULL VLBENEFPGTO,
                           HB.IDREGRAABATERESE,
                           HB.IDRETROATIVO,
                           HB.SEQPROPOSTA,
                           HB.IDREGRACALCULO,
                           DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE) IDLOTE,
                           NULL DTEFETPGTO,
                           sum(DECODE(HB.FLGDEVOLUCAO,
                                      1,
                                      -hb.vlbenefpgto,
                                      HB.VLBENEFPGTO)) VALORPREV,
                           V_DATAPAGAMENTO DATAPAGAMENTO,
                           HB.CODPORTFORMA,
                           HB.VALORBASE1,
                           HB.VALORBASE2,
                           HB.VALORBASE3,
                           HB.VALORBASE4,
                           HB.VALORBASE5,
                           V_VALORCALCULADO VALORCALCULADO,
                           HB.FLGACERTODESFEITO,
                           max(HB.VALOROP1) VALOROP1,
                           max(HB.VALOROP2) VALOROP2,
                           max(HB.VALOROP3) VALOROP3,
                           HB.CODREFERENCIA,
                           HB.MESREFERENCIA,
                           HB.VLRTOTRETROATIVO,
                           HB.VLRDIFRETROATIVO,
                           0 FLGCONCESSAO,
                           HB.FLGFORMAPAGTO,
                           V_VALORTOTAL VALORTOTAL,
                           HB.FONTEPAGADORA,
                           HB.CODDOCUMENTO,
                           SYSDATE TRGDTINCLUSAO,
                           USER TRGUSERINCLUSAO,
                           HB.IDAGENCIARESGATE,
                           0
                           /*C_PREPARO.VALORINTEGRAL*/ VALORINTEGRAL,
                           HB.VALORPREVMIN,
                           HB.IDREGRABENEFMIN,
                           NULL IDHSTFOLHABENEF,
                           HB.FLGDESCIRMES,
                           HB.VALORSRB,
                           HB.PERCPROVISORIO,
                           HB.IDPLANOORIGEM,
                           HB.FLGPROVISORIO,
                           HB.IDTITBENEF,
                           HB.VALORACERTO,
                           NULL IDSEQINTERNOFB,
                           HB.IDMOVBENEF,
                           V_PERCENTUAL PERCENTUAL,
                           HB.FLGTIPOREGISTRO,
                           HB.FLGALIMRESERVA,
                           V_MESPROCESSAMENTO MESCOMPREEM,
                           NULL IDCONTROLEDIVIDABENEFICIO, -- SIG 32578 - Tiago Von - AJUSTE VALOR MESCOMPREEM
                           HB.VALORBS,
                           HB.VALORFAB,
                           HB.VLRBASEDEFICIT
                      FROM HSTBENEFBFCIARIO HB
                     WHERE HB.MESREFERENCIA =
                           (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13')
                       AND HB.MES < V_MESPROCESSAMENTO
                       AND HB.IDPLANOPREV = C_PREPARO.IDPLANOPREV
                       AND HB.IDBENEFICIO = C_PREPARO.IDBENEFICIO
                       AND HB.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
                       AND HB.IDPESSJUR = C_PREPARO.IDPESSJUR
                       AND HB.IDTITULAR = C_PREPARO.IDTITULAR
                       AND HB.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
                       AND HB.IDPESSOA = C_PREPARO.IDPESSOA
                       AND HB.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
                       AND HB.FONTEPAGADORA = C_PREPARO.FONTEPAGADORA
                     group by HB.IDTITULAR,
                              HB.IDPESSJUR,
                              HB.IDPLANOPREV,
                              HB.IDBENEFICIO,
                              HB.IDPESSOA,
                              HB.NUMEROPROCESSO,
                              HB.IDREGRAABATERESE,
                              HB.IDRETROATIVO,
                              HB.SEQPROPOSTA,
                              HB.IDREGRACALCULO,
                              HB.CODPORTFORMA,
                              HB.VALORBASE1,
                              HB.VALORBASE2,
                              HB.VALORBASE3,
                              HB.VALORBASE4,
                              HB.VALORBASE5,
                              HB.FLGACERTODESFEITO,
                              HB.CODREFERENCIA,
                              HB.MESREFERENCIA,
                              HB.VLRTOTRETROATIVO,
                              HB.VLRDIFRETROATIVO,
                              HB.FLGFORMAPAGTO,
                              HB.FONTEPAGADORA,
                              HB.CODDOCUMENTO,
                              HB.IDAGENCIARESGATE,
                              HB.VALORPREVMIN,
                              HB.IDREGRABENEFMIN,
                              HB.FLGDESCIRMES,
                              HB.VALORSRB,
                              HB.PERCPROVISORIO,
                              HB.IDPLANOORIGEM,
                              HB.FLGPROVISORIO,
                              HB.IDTITBENEF,
                              HB.VALORACERTO,
                              HB.IDMOVBENEF,
                              HB.FLGALIMRESERVA,
                              hb.flgtiporegistro,
                              HB.VALORBS,
                              HB.VALORFAB,
                              HB.VLRBASEDEFICIT) HB; -- SIG 31666 - Tiago Von
          SELECT CM.SEQSEQINTERNOFB.NEXTVAL
            INTO V_IDSEQINTERNOFB
            FROM DUAL;
        
          IF V_IDSITBENEFICIO = 2 THEN
            IF V_FONTEPAGADORA = 2 AND NVL(V_FLGPAGINSS, 0) = 0 THEN
              V_FLGENVIADO := 8;
            ELSE
              V_FLGENVIADO := 9;
            END IF;
          ELSE
            V_FLGENVIADO := 0;
          END IF;
          INSERT INTO HSTBENEFBFCIARIO HB
            (IDPESSJUR,
             IDTITULAR,
             IDPESSOA,
             IDPLANOPREV,
             IDPLANOORIGEM,
             SEQPROPOSTA,
             IDMOTIVO,
             NUMEROPROCESSO,
             IDBENEFICIO,
             MES,
             MESREFERENCIA,
             SEQBENEFICIO,
             VALORPREV,
             VALORSRB,
             VALORCALCULADO,
             VALORINTEGRAL,
             VALORTOTAL,
             IDREGRACALCULO,
             IDLOTE,
             FLGENVIADO,
             FLGCONCESSAO,
             FLGDEVOLUCAO,
             CODPORTFORMA,
             VLBENEFPGTO,
             DATAPAGAMENTO,
             FLGPROVISORIO,
             PERCENTUAL,
             VALOROP1,
             VALOROP2,
             VALOROP3,
             FONTEPAGADORA,
             FLGTIPOREGISTRO,
             MESCOMPREEM,
             LOTEORIGINAL,
             IDSEQINTERNOFB,
             VALORBS,
             VALORFAB,
             VLRBASEDEFICIT,
             IDPERFILINVEST) -- SIG 55438
          VALUES
            (C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPESSOA,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.SEQPROPOSTA,
             V_IDMOTIVOABONO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDBENEFICIO,
             V_MESPROCESSAMENTO,
             (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'),
             1
             /*SEQBENEFICIO*/,
             ROUND(V_VALORABONO,2), -- Leandro WO14561
             V_VALORSRB,
             V_VALORCALCULADO,
             ROUND(V_VALORINTEGRAL,2) -- Leandro WO14561
             /*C_PREPARO.VALORINTEGRAL*/,
             V_VALORTOTAL,
             NULL
             /*IDREGRACALCULO*/,
             DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE)
             /*idlote*/,
             V_FLGENVIADO
             /*FLGENVIADO*/,
             0,
             0
             /*FLGDEVOLUCAO*/,
             V_CODPORTFORMA,
             NULL
             /*VLBENEFPGTO*/,
             V_DATAPAGAMENTO,
             0
             /*FLGPROVISORIO*/,
             V_PERCENTUAL,
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP1),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP2),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP3),
             V_FONTEPAGADORA,
             1
             /*FLGTIPOREGISTRO*/,
             DECODE(V_FONTEPAGADORA, 2, V_MESPROCESSAMENTO, NULL),
             V_IDLOTE,
             V_IDSEQINTERNOFB,
             V_VLRBSATUAL,
             V_VLRFABATUAL,
             V_VLRBASEDEFICIT,
             v_IDPERFILINVEST); -- SIG 55438
          IF (V_FLGCONTRIBUICAO = 1 AND V_FONTEPAGADORA = 1 AND
             V_FLGENVIADO NOT IN (8, 9)) THEN
            FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                     FROM BENEFXTAXA BT
                                    WHERE BT.IDBENEFICIO =
                                          C_PREPARO.IDBENEFICIO
                                         -- SIG 32041 - Hébio || Para não considerar as taxas da patrocinadora
                                      AND EXISTS (SELECT 1
                                             FROM CONTPREV CP
                                            WHERE CP.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND CP.IDPLANOPREV =
                                                  C_PREPARO.IDPLANOPREV
                                              AND CP.FLGINTERNO = 'AS'
                                              AND CP.FLGDESCFOLHA = 1)
                                         -- Término Ajuste SIG 32041 - Hébio
                                      AND NOT EXISTS
                                    (SELECT 1
                                             FROM CONTRIBUICAO C
                                             JOIN TPCONTRIBUICAO TP
                                               ON TP.IDTPCONTRIBUICAO =
                                                  C.IDTPCONTRIBUICAO --sig48549
                                            WHERE C.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND TP.FLGDEFICIT = 1)) LOOP
              --sig48549
              v_idpessoat     := C_PREPARO.IDPESSOA;
              v_idtitulart    := C_PREPARO.IDTITULAR;
              v_berneft       := C_PREPARO.IDBENEFICIO;
              IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
              NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
              IDPESSJURt      := C_PREPARO.IDPESSJUR;
              IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
              SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
              IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
              CM.SP_CP_PREPARO_TAXA_RETROATIVA(IN_IDPREPAROBENEF,
                                               0,
                                               C_PREPARO.IDPLANOPREV,
                                               C_PREPARO.IDBENEFICIO,
                                               C_PREPARO.NUMEROPROCESSO,
                                               C_PREPARO.IDPESSJUR,
                                               C_PREPARO.IDTITULAR,
                                               C_PREPARO.IDPLANOORIGEM,
                                               V_IDPLANPREVCONTAB,
                                               C_PREPARO.IDPESSOA,
                                               C_PREPARO.SEQPROPOSTA,
                                               V_IDLOTE,
                                               0,
                                               (SUBSTR(V_MESPROCESSAMENTO,
                                                       0,
                                                       4) || '/13'),
                                               V_MESPROCESSAMENTO,
                                               V_FLGENVIADO,
                                               1,
                                               V_DATAINICIO,
                                               V_DATAFINAL,
                                               V_PERCENTUAL,
                                               V_VALORTOTAL,
                                               C_PREPARO_TAXA.IDCONTRIBUICAO,
                                               V_IDNUCLEOFAMILIAR,
                                               V_ACAOJIDICIALREG,
                                               V_IDRESPONSAVEL,
                                               V_IDMOTIVO,
                                               V_DATAPAGAMENTO,
                                               NULL);
            END LOOP;
          END IF;
          IF (V_FLGCONTRIBDEFICT = 1 AND V_FONTEPAGADORA = 1 AND
             V_FLGENVIADO NOT IN (8, 9)) THEN
            FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                     FROM BENEFXTAXA BT
                                    WHERE BT.IDBENEFICIO =
                                          C_PREPARO.IDBENEFICIO
                                      AND
                                         -- SIG 32041 - Hébio || Para não considerar as taxas da patrocinadora
                                          EXISTS (SELECT 1
                                             FROM CONTPREV CP
                                            WHERE CP.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND CP.IDPLANOPREV =
                                                  C_PREPARO.IDPLANOPREV
                                              AND CP.FLGINTERNO = 'AS'
                                              AND CP.FLGDESCFOLHA = 1)
                                      AND
                                         -- Término Ajuste SIG 32041 - Hébio
                                          EXISTS
                                    (SELECT 1
                                             FROM CONTRIBUICAO C
                                             JOIN TPCONTRIBUICAO TP
                                               ON TP.IDTPCONTRIBUICAO =
                                                  C.IDTPCONTRIBUICAO --sig48549
                                            WHERE C.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND TP.FLGDEFICIT = 1)) LOOP
              --sig48549
              v_idpessoat     := C_PREPARO.IDPESSOA;
              v_idtitulart    := C_PREPARO.IDTITULAR;
              v_berneft       := C_PREPARO.IDBENEFICIO;
              IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
              NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
              IDPESSJURt      := C_PREPARO.IDPESSJUR;
              IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
              SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
              IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
              CM.SP_CP_PREPARO_TAXA_DEFICIT(IN_IDPREPAROBENEF,
                                            0,
                                            C_PREPARO.IDPLANOPREV,
                                            C_PREPARO.IDBENEFICIO,
                                            C_PREPARO.NUMEROPROCESSO,
                                            C_PREPARO.IDPESSJUR,
                                            C_PREPARO.IDTITULAR,
                                            C_PREPARO.IDPLANOORIGEM,
                                            V_IDPLANPREVCONTAB,
                                            C_PREPARO.IDPESSOA,
                                            C_PREPARO.SEQPROPOSTA,
                                            V_IDLOTE,
                                            0,
                                            (SUBSTR(V_MESPROCESSAMENTO,
                                                    0,
                                                    4) || '/13'),
                                            V_MESPROCESSAMENTO,
                                            V_FLGENVIADO,
                                            1,
                                            V_DATAINICIO,
                                            V_DATAFINAL,
                                            V_PERCENTUAL,
                                            V_VALORTOTAL,
                                            C_PREPARO_TAXA.IDCONTRIBUICAO,
                                            V_IDNUCLEOFAMILIAR,
                                            V_ACAOJIDICIALREG,
                                            V_IDRESPONSAVEL,
                                            V_IDMOTIVO,
                                            V_DATAPAGAMENTO,
                                            NULL);
            END LOOP;
          END IF;
          V_SOMAVALORESPREPARO := V_SOMAVALORESPREPARO + V_VALORABONO;
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        END IF;
        V_QUANTIDADE := V_QUANTIDADE + 1;
        IF V_QUANTIDADE MOD 1000 = 0 THEN
          COMMIT;
        END IF;
      END LOOP;
      COMMIT;
      UPDATE PREPAROBENEF PB
         SET PB.DATATERMINO = SYSDATE
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      UPDATE CTRLINTERFACE
         SET NUMREG      =
             (SELECT SUM(PB.TOTALBENEFPROC)
                FROM PREPAROBENEF PB
               WHERE PB.IDLOTE = V_IDLOTE),
             FLGPREPARADO = 1,
             VLRTOTAL     = NVL(VLRTOTAL, 0) + V_SOMAVALORESPREPARO
       WHERE IDLOTE = V_IDLOTE;
    
      COMMIT;
    END IF;
    --FIM PREPARO ABONO
    ---------------------------------------------------------------------------------------------
  ELSIF V_IDTIPOPREPAROBENEF = 3 THEN
    --PREPARO ANTECIPAÇÃO ABONO FUNCEF
    --IF SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> '02' THEN                    /*WO14701*/ 
    IF SUBSTR(V_MESPROCESSAMENTO, 6, 2) <> V_MES_ANTEC_ABN_FUNCEF THEN    /*WO14701*/
      INSERT INTO LOGPREPARO
        (IDLOGPREPARO,
         IDPREPAROBENEF,
         IDPLANOPREV,
         IDBENEFICIO,
         NUMEROPROCESSO,
         IDPESSJUR,
         IDTITULAR,
         IDPLANOORIGEM,
         IDPESSOA,
         SEQPROPOSTA,
         OBSERVACOES)
      VALUES
        ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
         IN_IDPREPAROBENEF,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         'MÊS DE PROCESSAMENTO DO PREPARO DA ANTECIPAÇÃO DO ABONO FUNCEF DIFERENTE DE '||V_MES_ANTEC_ABN_FUNCEF||'.');  /*WO14701*/
    
    ELSE
      V_QUANTIDADE         := 0;
      V_SOMAVALORESPREPARO := 0;
      SELECT P.IDMOTIVOFOLHABEN, P.IDMOTIVOABONO
        INTO V_IDMOTIVO, V_IDMOTIVOABONO
        FROM PARAMAPREV P
       WHERE ROWNUM = 1;
    
      /*= Início alteração SOL SOL269013 =*/
      WITH BENEFICIOSEMABONO AS
       (SELECT BPP.IDBENEFICIO, BPP.IDPLANOPREV
          FROM BENEFPLANPREV BPP
         WHERE BPP.FLGPOSSUIABONO = 1)
      SELECT COUNT(*)
        INTO V_TOTALBENEFICIOS
        FROM BENEFBFCIARIO BF
       WHERE EXISTS (SELECT 1
                FROM BENEFICIOSEMABONO BA
               WHERE BA.IDBENEFICIO = BF.IDBENEFICIO
                 AND BA.IDPLANOPREV = BF.IDPLANOPREV)
         AND BF.IDSITBENEFICIO IN (1, 2)
         AND BF.IDTPPAGTOBENEFIC = 1
         AND BF.FONTEPAGADORA = 1
         AND (BF.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
             BF.ULTMESPREPARO IS NULL)
         AND NOT EXISTS
       (SELECT 1
                FROM HSTBENEFBFCIARIO HB1
               WHERE HB1.NUMEROPROCESSO = BF.NUMEROPROCESSO
                 AND HB1.IDTITULAR = BF.IDTITULAR
                 AND HB1.IDPESSOA = BF.IDPESSOA
                 AND HB1.IDPLANOORIGEM = BF.IDPLANOORIGEM
                 AND HB1.IDPLANOPREV = BF.IDPLANOPREV
                 AND HB1.IDPESSJUR = BF.IDPESSJUR
                 AND HB1.IDBENEFICIO = BF.IDBENEFICIO
                 AND HB1.SEQPROPOSTA = BF.SEQPROPOSTA
                 AND HB1.FLGDEVOLUCAO = 0
                 AND HB1.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                 AND HB1.MES = V_MESPROCESSAMENTO
                 AND HB1.MESREFERENCIA =
                     SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13')
         AND (V_IDLISTA IS NULL OR EXISTS
              (SELECT 1
                 FROM LISTAFOLHABENEFDET LD
                WHERE BF.IDTITULAR = LD.IDTITULAR
                  AND LD.IDLISTA = V_IDLISTA))
         AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
              (SELECT 1
                 FROM LISTABENEFICIOPREPARO LBP
                WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                  AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                  AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                  AND LBP.IDPATRO = BF.IDPESSJUR));
    
      UPDATE PREPAROBENEF PB
         SET PB.DATAINICIO      = SYSDATE,
             PB.TOTALBENEFREJ   = 0,
             PB.TOTALBENEFPROC  = 0,
             PB.DATATERMINO     = NULL,
             PB.TOTALBENEFICIOS = V_TOTALBENEFICIOS
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      /*    --Codigo alterado pelo SOL269013
      UPDATE PREPAROBENEF PB SET PB.DATAINICIO = SYSDATE,
      PB.TOTALBENEFREJ = 0,
      PB.TOTALBENEFPROC = 0,
      PB.DATATERMINO = NULL,
      PB.TOTALBENEFICIOS = (SELECT COUNT(*)
      FROM BENEFBFCIARIO BF
      JOIN BENEFPLANPREV BPP ON (BPP.IDBENEFICIO = BF.IDBENEFICIO)
      AND (BPP.IDPLANOPREV = BF.IDPLANOPREV)
      WHERE (BPP.FLGPOSSUIABONO = 1)
      AND (BF.IDSITBENEFICIO IN (1,2))
      AND (BF.IDTPPAGTOBENEFIC = 1)
      AND (BF.FONTEPAGADORA = 1)
      AND (Bf.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
      BF.ULTMESPREPARO IS NULL OR
      (Bf.ULTMESPREPARO = V_MESPROCESSAMENTO AND
      V_IDTIPOPREPAROBENEF = 6))
      AND NOT EXISTS (SELECT 1
      FROM HSTBENEFBFCIARIO HB1
      WHERE HB1.NUMEROPROCESSO = BF.NUMEROPROCESSO
      AND HB1.IDTITULAR = BF.IDTITULAR
      AND HB1.IDPESSOA  = BF.IDPESSOA
      AND HB1.IDPLANOORIGEM = BF.IDPLANOORIGEM
      AND HB1.IDPLANOPREV = BF.IDPLANOPREV
      AND HB1.IDPESSJUR = BF.IDPESSJUR
      AND HB1.IDBENEFICIO = BF.IDBENEFICIO
      AND HB1.SEQPROPOSTA = BF.SEQPROPOSTA
      AND HB1.FLGDEVOLUCAO = 0
      AND HB1.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO)
      AND HB1.MES = V_MESPROCESSAMENTO
      AND HB1.MESREFERENCIA = SUBSTR(V_MESPROCESSAMENTO,0,4)||'/13')
      AND (V_IDLISTA IS NULL OR EXISTS (SELECT 1
      FROM LISTAFOLHABENEFDET LD
      WHERE BF.IDTITULAR = LD.IDTITULAR AND
      LD.IDLISTA = V_IDLISTA))
      AND (V_FLGPREPAROTOTAL = 1 OR EXISTS (SELECT 1
      FROM LISTABENEFICIOPREPARO LBP
      WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF AND
      LBP.IDBENEFICIO = BF.IDBENEFICIO AND
      LBP.IDPLANOPREV = BF.IDPLANOPREV AND
      LBP.IDPATRO = BF.IDPESSJUR)))
      WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      */
      /*= Fim da alteração SOL269013 =*/
      COMMIT;
      FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                               BF.IDBENEFICIO,
                               BF.NUMEROPROCESSO,
                               BF.IDPESSJUR,
                               BF.IDTITULAR,
                               BF.IDPLANOORIGEM,
                               BF.IDPESSOA,
                               BF.SEQPROPOSTA
                          FROM BENEFBFCIARIO BF
                          JOIN BENEFPLANPREV BPP
                            ON (BPP.IDBENEFICIO = BF.IDBENEFICIO)
                           AND (BPP.IDPLANOPREV = BF.IDPLANOPREV)
                         WHERE (BPP.FLGPOSSUIABONO = 1)
                           AND (BF.IDSITBENEFICIO IN (1, 2))
                           AND (BF.IDTPPAGTOBENEFIC = 1)
                           AND (BF.FONTEPAGADORA = 1)
                           AND (BF.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
                               BF.ULTMESPREPARO IS NULL OR
                               (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                               V_IDTIPOPREPAROBENEF = 6))
                           AND NOT EXISTS
                         (SELECT 1
                                  FROM HSTBENEFBFCIARIO HB1
                                 WHERE HB1.NUMEROPROCESSO = BF.NUMEROPROCESSO
                                   AND HB1.IDTITULAR = BF.IDTITULAR
                                   AND HB1.IDPESSOA = BF.IDPESSOA
                                   AND HB1.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                   AND HB1.IDPLANOPREV = BF.IDPLANOPREV
                                   AND HB1.IDPESSJUR = BF.IDPESSJUR
                                   AND HB1.IDBENEFICIO = BF.IDBENEFICIO
                                   AND HB1.SEQPROPOSTA = BF.SEQPROPOSTA
                                   AND HB1.FLGDEVOLUCAO = 0
                                   AND HB1.IDMOTIVO IN
                                       (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                                   AND HB1.MES = V_MESPROCESSAMENTO
                                   AND HB1.MESREFERENCIA =
                                       SUBSTR(V_MESPROCESSAMENTO, 0, 4) ||
                                       '/13')
                           AND (V_IDLISTA IS NULL OR EXISTS
                                (SELECT 1
                                   FROM LISTAFOLHABENEFDET LD
                                  WHERE BF.IDTITULAR = LD.IDTITULAR
                                    AND LD.IDLISTA = V_IDLISTA))
                           AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                                (SELECT 1
                                   FROM LISTABENEFICIOPREPARO LBP
                                  WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                    AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                    AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                    AND LBP.IDPATRO = BF.IDPESSJUR))) LOOP
        BEGIN
          SELECT BF.VALORTOTAL,
                 BF.VALORATUAL,
                 BF.VALORCALCULADO,
                 BF.DATAINICIOFUND,
                 BF.DIBBENEFANT,
                 BF.IDPLANPREVCONTAB,
                 BF.DATAINICIO,
                 BF.DATAFINAL,
                 BF.FONTEPAGADORA,
                 NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
                 NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
                 NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
                 BF.VALORSRB,
                 DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
                 BTT.IDRESPONSAVEL,
                 BTT.IDNUCLEOFAMILIAR,
                 BF.IDSITBENEFICIO,
                 BF.FLGPAGAINSS,
                 BF.CODPORTFORMA,
                 BF.VLRBSATUAL,
                 BF.VLRFABATUAL,
                 BF.VLRBASEDEFICIT,
                 BF.IDPERFILINVEST --SIG 55438
            INTO V_VALORTOTAL,
                 V_VALORATUAL,
                 V_VALORCALCULADO,
                 V_DATAINICIOFUND,
                 V_DIBBENEFANT,
                 V_IDPLANPREVCONTAB,
                 V_DATAINICIO,
                 V_DATAFINAL,
                 V_FONTEPAGADORA,
                 V_VALOROP1,
                 V_VALOROP2,
                 V_VALOROP3,
                 V_VALORSRB,
                 V_PERCENTUAL,
                 V_IDRESPONSAVEL,
                 V_IDNUCLEOFAMILIAR,
                 V_IDSITBENEFICIO,
                 V_FLGPAGINSS,
                 V_CODPORTFORMA,
                 V_VLRBSATUAL,
                 V_VLRFABATUAL,
                 V_VLRBASEDEFICIT,
                 v_IDPERFILINVEST --SIG 55438
            FROM BENEFBFCIARIO BF
            JOIN BFCIARIOTITPLAN BTT
              ON btt.IDPESSJUR = bf.idpessjur
             AND btt.IDTITULAR = bf.idtitular
             AND btt.IDPLANOORIGEM = bf.idplanoorigem
             AND btt.IDPESSOA = bf.idpessoa
             AND btt.SEQPROPOSTA = bf.seqproposta
             AND btt.IDPLANOPREV = bf.idplanoprev
             AND btt.IDBENEFICIO = bf.idbeneficio
            LEFT JOIN BENEFPLANOPART BPT
              ON BPT.IDPESSJUR = BF.IDPESSJUR
             AND BPT.IDPLANOPREV = BF.IDPLANOPREV
             AND BPT.IDPESSOA = BF.IDPESSOA
             AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
             AND BPT.IDBENEFICIO = BF.IDBENEFICIO
           WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
             AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
             AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
             AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
             AND BF.IDTITULAR = C_PREPARO.IDTITULAR
             AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
             AND BF.IDPESSOA = C_PREPARO.IDPESSOA
             AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
             AND ROWNUM = 1;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN TOO_MANY_ROWS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN OTHERS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
        END;
        BEGIN
          SELECT DISTINCT 1
            INTO V_ACAOJIDICIALREG
            FROM PESSOAPARAM PP
           WHERE PP.IDPARAM = 122
             AND PP.IDPESSOA = C_PREPARO.IDPESSOA
             AND PP.VALOR = 'S';
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_ACAOJIDICIALREG := 0;
          WHEN TOO_MANY_ROWS THEN
            V_ACAOJIDICIALREG := 0;
          WHEN OTHERS THEN
            V_ACAOJIDICIALREG := 0;
        END;
        IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSIF (v_IDPERFILINVEST IS NULL) THEN
          --Início SIG 55438
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO SEM PERFIL DE INVESTIMENTOS CADASTRADO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF; --Término SIG 55438
        ELSIF (1 = 2) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'REGRA DE EXECUÇÃO 2');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSE
          V_ANOINICIAL := TO_CHAR(V_DATAINICIO, 'YYYY');
          IF V_ANOINICIAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
            V_DIAINICIAL := TO_CHAR(V_DATAINICIO, 'DD');
            IF V_DIAINICIAL <= '16' THEN
              V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM') - 1;
            ELSE
              V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM');
            END IF;
          ELSE
            V_MESINICIAL := '00';
          END IF;
          V_ANOFINAL := TO_CHAR(V_DATAFINAL, 'YYYY');
          IF V_ANOFINAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
            V_DIAFINAL := TO_CHAR(V_DATAFINAL, 'DD');
            IF V_DIAFINAL <= '14' THEN
              V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM') - 1;
            ELSE
              V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM');
            END IF;
          ELSE
            V_MESFINAL := '12';
          END IF;
          V_QUANTMESES      := V_MESFINAL - V_MESINICIAL;
          V_VALORINTEGRAL   := V_VALORATUAL;
          V_VALORANTECABONO := ROUND(V_VALORATUAL * (V_QUANTMESES / 12) *
                                     (0.5),
                                     2);
          V_VLRBASEDEFICIT  := ROUND(V_VLRBASEDEFICIT * (V_QUANTMESES / 12) *
                                     (0.5),
                                     2);
          IF V_IDPLANPREVCONTAB = 28 THEN
            V_VLRBSATUAL  := ROUND(V_VLRBSATUAL * (V_QUANTMESES / 12) *
                                   (0.5),
                                   2);
            V_VLRFABATUAL := ROUND(V_VLRFABATUAL * (V_QUANTMESES / 12) *
                                   (0.5),
                                   2);
          END IF;
          SELECT CM.SEQSEQINTERNOFB.NEXTVAL
            INTO V_IDSEQINTERNOFB
            FROM DUAL;
        
          IF V_IDSITBENEFICIO = 2 THEN
            IF V_FONTEPAGADORA = 2 AND NVL(V_FLGPAGINSS, 0) = 0 THEN
              V_FLGENVIADO := 8;
            ELSE
              V_FLGENVIADO := 9;
            END IF;
          ELSE
            V_FLGENVIADO := 0;
          END IF;
          INSERT INTO HSTBENEFBFCIARIO HB
            (IDPESSJUR,
             IDTITULAR,
             IDPESSOA,
             IDPLANOPREV,
             IDPLANOORIGEM,
             SEQPROPOSTA,
             IDMOTIVO,
             NUMEROPROCESSO,
             IDBENEFICIO,
             MES,
             MESREFERENCIA,
             SEQBENEFICIO,
             VALORPREV,
             VALORSRB,
             VALORCALCULADO,
             VALORINTEGRAL,
             VALORTOTAL,
             IDREGRACALCULO,
             IDLOTE,
             FLGENVIADO,
             FLGCONCESSAO,
             FLGDEVOLUCAO,
             CODPORTFORMA,
             VLBENEFPGTO,
             DATAPAGAMENTO,
             FLGPROVISORIO,
             PERCENTUAL,
             VALOROP1,
             VALOROP2,
             VALOROP3,
             FONTEPAGADORA,
             FLGTIPOREGISTRO,
             MESCOMPREEM,
             LOTEORIGINAL,
             IDSEQINTERNOFB,
             VALORBS,
             VALORFAB,
             VLRBASEDEFICIT,
             IDPERFILINVEST) -- SIG 55438
          VALUES
            (C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPESSOA,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.SEQPROPOSTA,
             V_IDMOTIVOABONO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDBENEFICIO,
             V_MESPROCESSAMENTO,
             (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'),
             1
             /*SEQBENEFICIO*/,
             ROUND(V_VALORANTECABONO,2), -- Leandro WO14561
             V_VALORSRB,
             V_VALORCALCULADO,
             ROUND(V_VALORINTEGRAL,2), -- Leandro WO14561
             V_VALORTOTAL,
             NULL
             /*IDREGRACALCULO*/,
             DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE)
             /*idlote*/,
             V_FLGENVIADO
             /*FLGENVIADO*/,
             0,
             0
             /*FLGDEVOLUCAO*/,
             V_CODPORTFORMA,
             NULL
             /*VLBENEFPGTO*/,
             V_DATAPAGAMENTO,
             0
             /*FLGPROVISORIO*/,
             V_PERCENTUAL,
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP1),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP2),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP3),
             V_FONTEPAGADORA,
             2
             /*FLGTIPOREGISTRO*/,
             DECODE(V_FONTEPAGADORA, 2, V_MESPROCESSAMENTO, NULL),
             V_IDLOTE,
             V_IDSEQINTERNOFB,
             V_VLRBSATUAL,
             V_VLRFABATUAL,
             V_VLRBASEDEFICIT,
             v_IDPERFILINVEST); -- SIG 55438
          IF (V_FLGCONTRIBUICAO = 1 AND V_FONTEPAGADORA = 1 AND
             V_FLGENVIADO NOT IN (8, 9)) THEN
            FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                     FROM BENEFXTAXA BT
                                    WHERE BT.IDBENEFICIO =
                                          C_PREPARO.IDBENEFICIO
                                         -- SIG 32041 - Hébio || Para não considerar as taxas da patrocinadora
                                      AND EXISTS (SELECT 1
                                             FROM CONTPREV CP
                                            WHERE CP.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND CP.IDPLANOPREV =
                                                  C_PREPARO.IDPLANOPREV
                                              AND CP.FLGINTERNO = 'AS'
                                              AND CP.FLGDESCFOLHA = 1)
                                         -- Término Ajuste SIG 32041 - Hébio
                                      AND NOT EXISTS
                                    (SELECT 1
                                             FROM CONTRIBUICAO C
                                             JOIN TPCONTRIBUICAO TP
                                               ON TP.IDTPCONTRIBUICAO =
                                                  C.IDTPCONTRIBUICAO --sig48549
                                            WHERE C.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND TP.FLGDEFICIT = 1)) LOOP
              --sig48549
              v_idpessoat     := C_PREPARO.IDPESSOA;
              v_idtitulart    := C_PREPARO.IDTITULAR;
              v_berneft       := C_PREPARO.IDBENEFICIO;
              IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
              NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
              IDPESSJURt      := C_PREPARO.IDPESSJUR;
              IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
              SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
              IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
              CM.SP_CP_PREPARO_TAXA_RETROATIVA(IN_IDPREPAROBENEF,
                                               0,
                                               C_PREPARO.IDPLANOPREV,
                                               C_PREPARO.IDBENEFICIO,
                                               C_PREPARO.NUMEROPROCESSO,
                                               C_PREPARO.IDPESSJUR,
                                               C_PREPARO.IDTITULAR,
                                               C_PREPARO.IDPLANOORIGEM,
                                               V_IDPLANPREVCONTAB,
                                               C_PREPARO.IDPESSOA,
                                               C_PREPARO.SEQPROPOSTA,
                                               V_IDLOTE,
                                               0,
                                               (SUBSTR(V_MESPROCESSAMENTO,
                                                       0,
                                                       4) || '/13'),
                                               V_MESPROCESSAMENTO,
                                               V_FLGENVIADO,
                                               2,
                                               V_DATAINICIO,
                                               V_DATAFINAL,
                                               V_PERCENTUAL,
                                               V_VALORTOTAL,
                                               C_PREPARO_TAXA.IDCONTRIBUICAO,
                                               V_IDNUCLEOFAMILIAR,
                                               V_ACAOJIDICIALREG,
                                               V_IDRESPONSAVEL,
                                               V_IDMOTIVO,
                                               V_DATAPAGAMENTO,
                                               NULL);
            END LOOP;
            V_SOMAVALORESPREPARO := V_SOMAVALORESPREPARO +
                                    V_VALORANTECABONO;
            UPDATE PREPAROBENEF PB
               SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
             WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
          
          END IF;
          IF (V_FLGCONTRIBDEFICT = 1 AND V_FONTEPAGADORA = 1 AND
             V_FLGENVIADO NOT IN (8, 9)) THEN
            FOR C_PREPARO_TAXA IN (SELECT BT.IDCONTRIBUICAO
                                     FROM BENEFXTAXA BT
                                    WHERE BT.IDBENEFICIO =
                                          C_PREPARO.IDBENEFICIO
                                      AND
                                         -- SIG 32041 - Hébio || Para não considerar as taxas da patrocinadora
                                          EXISTS (SELECT 1
                                             FROM CONTPREV CP
                                            WHERE CP.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND CP.IDPLANOPREV =
                                                  C_PREPARO.IDPLANOPREV
                                              AND CP.FLGINTERNO = 'AS'
                                              AND CP.FLGDESCFOLHA = 1)
                                      AND
                                         -- Término Ajuste SIG 32041 - Hébio
                                          EXISTS
                                    (SELECT 1
                                             FROM CONTRIBUICAO C
                                             JOIN TPCONTRIBUICAO TP
                                               ON TP.IDTPCONTRIBUICAO =
                                                  C.IDTPCONTRIBUICAO --sig48549
                                            WHERE C.IDCONTRIBUICAO =
                                                  BT.IDCONTRIBUICAO
                                              AND TP.FLGDEFICIT = 1)) LOOP
              --sig48549
              v_idpessoat     := C_PREPARO.IDPESSOA;
              v_idtitulart    := C_PREPARO.IDTITULAR;
              v_berneft       := C_PREPARO.IDBENEFICIO;
              IDPLANOPREVt    := C_PREPARO.IDPLANOPREV;
              NUMEROPROCESSOt := C_PREPARO.NUMEROPROCESSO;
              IDPESSJURt      := C_PREPARO.IDPESSJUR;
              IDPLANOORIGEMt  := C_PREPARO.IDPLANOORIGEM;
              SEQPROPOSTAt    := C_PREPARO.SEQPROPOSTA;
              IDCONTRIBUICAOt := C_PREPARO_TAXA.IDCONTRIBUICAO;
              CM.SP_CP_PREPARO_TAXA_DEFICIT(IN_IDPREPAROBENEF,
                                            0,
                                            C_PREPARO.IDPLANOPREV,
                                            C_PREPARO.IDBENEFICIO,
                                            C_PREPARO.NUMEROPROCESSO,
                                            C_PREPARO.IDPESSJUR,
                                            C_PREPARO.IDTITULAR,
                                            C_PREPARO.IDPLANOORIGEM,
                                            V_IDPLANPREVCONTAB,
                                            C_PREPARO.IDPESSOA,
                                            C_PREPARO.SEQPROPOSTA,
                                            V_IDLOTE,
                                            0,
                                            (SUBSTR(V_MESPROCESSAMENTO,
                                                    0,
                                                    4) || '/13'),
                                            V_MESPROCESSAMENTO,
                                            V_FLGENVIADO,
                                            2,
                                            V_DATAINICIO,
                                            V_DATAFINAL,
                                            V_PERCENTUAL,
                                            V_VALORTOTAL,
                                            C_PREPARO_TAXA.IDCONTRIBUICAO,
                                            V_IDNUCLEOFAMILIAR,
                                            V_ACAOJIDICIALREG,
                                            V_IDRESPONSAVEL,
                                            V_IDMOTIVO,
                                            V_DATAPAGAMENTO,
                                            NULL);
            END LOOP;
          END IF;
          V_QUANTIDADE := V_QUANTIDADE + 1;
          IF V_QUANTIDADE MOD 1000 = 0 THEN
            COMMIT;
          END IF;
        END IF;
      END LOOP;
      COMMIT;
      UPDATE PREPAROBENEF PB
         SET PB.DATATERMINO = SYSDATE
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      UPDATE CTRLINTERFACE
         SET NUMREG      =
             (SELECT SUM(PB.TOTALBENEFPROC)
                FROM PREPAROBENEF PB
               WHERE PB.IDLOTE = V_IDLOTE),
             FLGPREPARADO = 1,
             VLRTOTAL     = NVL(VLRTOTAL, 0) + V_SOMAVALORESPREPARO
       WHERE IDLOTE = V_IDLOTE;
    
      COMMIT;
    END IF;
    --FIM PREPARO ANTECIPAÇÃO ABONO FUNCEF
    ---------------------------------------------------------------------------------------------
  ELSIF V_IDTIPOPREPAROBENEF = 4 THEN
    --PREPARO ANTECIPAÇÃO ABONO INSS
    BEGIN
      SELECT MESADIANTABONOINSS
        INTO V_MES_ABONO_INSS
        FROM CM.PARAMAPREV
       WHERE ROWNUM < 2;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           'NÃO HÁ MÊS PARAMETRIZADO PARA ANTECIPAÇÃO DE ABONO INNS PARA O MÊS ' ||
           V_MESPROCESSAMENTO || '.');
      
    END;
    IF V_MES_ABONO_INSS <> SUBSTR(V_MESPROCESSAMENTO, 6, 2) THEN
      INSERT INTO LOGPREPARO
        (IDLOGPREPARO,
         IDPREPAROBENEF,
         IDPLANOPREV,
         IDBENEFICIO,
         NUMEROPROCESSO,
         IDPESSJUR,
         IDTITULAR,
         IDPLANOORIGEM,
         IDPESSOA,
         SEQPROPOSTA,
         OBSERVACOES)
      VALUES
        ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
         IN_IDPREPAROBENEF,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         NULL,
         'O MÊS NÃO ESTÁ PARAMETRIZADO PARA ANTECIPAÇÃO DE ABONO INNS PARA O MÊS ' ||
         V_MESPROCESSAMENTO || '. O ATUAL MÊS PARAMETRIZADO PARA É ' ||
         V_MES_ABONO_INSS || '.');
    
    ELSE
      V_QUANTIDADE         := 0;
      V_SOMAVALORESPREPARO := 0;
      SELECT P.IDMOTIVOFOLHABEN, P.IDMOTIVOABONO
        INTO V_IDMOTIVO, V_IDMOTIVOABONO
        FROM PARAMAPREV P
       WHERE ROWNUM = 1;
    
      UPDATE PREPAROBENEF PB
         SET PB.DATAINICIO      = SYSDATE,
             PB.TOTALBENEFREJ   = 0,
             PB.TOTALBENEFPROC  = 0,
             PB.DATATERMINO     = NULL,
             PB.TOTALBENEFICIOS =
             (SELECT COUNT(*)
                FROM BENEFBFCIARIO BF
                JOIN BENEFPLANPREV BPP
                  ON (BPP.IDBENEFICIO = BF.IDBENEFICIO)
                 AND (BPP.IDPLANOPREV = BF.IDPLANOPREV)
               WHERE (BPP.FLGPOSSUIABONO = 1)
                 AND (BF.IDSITBENEFICIO IN (1, 2))
                 AND (BF.IDTPPAGTOBENEFIC = 1)
                 AND (BF.FONTEPAGADORA = 2)
                 AND (BF.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
                     BF.ULTMESPREPARO IS NULL OR
                     (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                     V_IDTIPOPREPAROBENEF = 6))
                 AND NOT EXISTS
               (SELECT 1
                        FROM HSTBENEFBFCIARIO HB1
                       WHERE HB1.NUMEROPROCESSO = BF.NUMEROPROCESSO
                         AND HB1.IDTITULAR = BF.IDTITULAR
                         AND HB1.IDPESSOA = BF.IDPESSOA
                         AND HB1.IDPLANOORIGEM = BF.IDPLANOORIGEM
                         AND HB1.IDPLANOPREV = BF.IDPLANOPREV
                         AND HB1.IDPESSJUR = BF.IDPESSJUR
                         AND HB1.IDBENEFICIO = BF.IDBENEFICIO
                         AND HB1.SEQPROPOSTA = BF.SEQPROPOSTA
                         AND HB1.FLGDEVOLUCAO = 0
                         AND HB1.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                         AND HB1.MES = V_MESPROCESSAMENTO
                         AND HB1.MESREFERENCIA =
                             SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13')
                 AND (V_IDLISTA IS NULL OR EXISTS
                      (SELECT 1
                         FROM LISTAFOLHABENEFDET LD
                        WHERE BF.IDTITULAR = LD.IDTITULAR
                          AND LD.IDLISTA = V_IDLISTA))
                 AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                      (SELECT 1
                         FROM LISTABENEFICIOPREPARO LBP
                        WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                          AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                          AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                          AND LBP.IDPATRO = BF.IDPESSJUR)))
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      COMMIT;
      FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                               BF.IDBENEFICIO,
                               BF.NUMEROPROCESSO,
                               BF.IDPESSJUR,
                               BF.IDTITULAR,
                               BF.IDPLANOORIGEM,
                               BF.IDPESSOA,
                               BF.SEQPROPOSTA
                          FROM BENEFBFCIARIO BF
                          JOIN BENEFPLANPREV BPP
                            ON (BPP.IDBENEFICIO = BF.IDBENEFICIO)
                           AND (BPP.IDPLANOPREV = BF.IDPLANOPREV)
                         WHERE (BPP.FLGPOSSUIABONO = 1)
                           AND (BF.IDSITBENEFICIO IN (1, 2))
                           AND (BF.IDTPPAGTOBENEFIC = 1)
                           AND (BF.FONTEPAGADORA = 2)
                           AND (BF.ULTMESPREPARO <= V_MESPROCESSAMENTO OR
                               BF.ULTMESPREPARO IS NULL OR
                               (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                               V_IDTIPOPREPAROBENEF = 6))
                           AND NOT EXISTS
                         (SELECT 1
                                  FROM HSTBENEFBFCIARIO HB1
                                 WHERE HB1.NUMEROPROCESSO = BF.NUMEROPROCESSO
                                   AND HB1.IDTITULAR = BF.IDTITULAR
                                   AND HB1.IDPESSOA = BF.IDPESSOA
                                   AND HB1.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                   AND HB1.IDPLANOPREV = BF.IDPLANOPREV
                                   AND HB1.IDPESSJUR = BF.IDPESSJUR
                                   AND HB1.IDBENEFICIO = BF.IDBENEFICIO
                                   AND HB1.SEQPROPOSTA = BF.SEQPROPOSTA
                                   AND HB1.FLGDEVOLUCAO = 0
                                   AND HB1.IDMOTIVO IN
                                       (V_IDMOTIVO, V_IDMOTIVOABONO, V_IDMOTIVOREATIVA) -- Andre Imakawa - SIG 132434
                                   AND HB1.MES = V_MESPROCESSAMENTO
                                   AND HB1.MESREFERENCIA =
                                       SUBSTR(V_MESPROCESSAMENTO, 0, 4) ||
                                       '/13')
                           AND (V_IDLISTA IS NULL OR EXISTS
                                (SELECT 1
                                   FROM LISTAFOLHABENEFDET LD
                                  WHERE BF.IDTITULAR = LD.IDTITULAR
                                    AND LD.IDLISTA = V_IDLISTA))
                           AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                                (SELECT 1
                                   FROM LISTABENEFICIOPREPARO LBP
                                  WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                    AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                    AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                    AND LBP.IDPATRO = BF.IDPESSJUR))) LOOP
        BEGIN
          SELECT BF.VALORTOTAL,
                 BF.VALORATUAL,
                 BF.VALORCALCULADO,
                 BF.DATAINICIOFUND,
                 BF.DIBBENEFANT,
                 BF.IDPLANPREVCONTAB,
                 BF.DATAINICIO,
                 BF.DATAFINAL,
                 BF.FONTEPAGADORA,
                 NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
                 NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
                 NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
                 BF.VALORSRB,
                 DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
                 BTT.IDRESPONSAVEL,
                 BTT.IDNUCLEOFAMILIAR,
                 BF.IDSITBENEFICIO,
                 BF.FLGPAGAINSS,
                 BF.CODPORTFORMA,
                 BF.VLRBSATUAL,
                 BF.VLRFABATUAL,
                 BF.VLRBASEDEFICIT,
                 BF.IDPERFILINVEST --SIG 55438
            INTO V_VALORTOTAL,
                 V_VALORATUAL,
                 V_VALORCALCULADO,
                 V_DATAINICIOFUND,
                 V_DIBBENEFANT,
                 V_IDPLANPREVCONTAB,
                 V_DATAINICIO,
                 V_DATAFINAL,
                 V_FONTEPAGADORA,
                 V_VALOROP1,
                 V_VALOROP2,
                 V_VALOROP3,
                 V_VALORSRB,
                 V_PERCENTUAL,
                 V_IDRESPONSAVEL,
                 V_IDNUCLEOFAMILIAR,
                 V_IDSITBENEFICIO,
                 V_FLGPAGINSS,
                 V_CODPORTFORMA,
                 V_VLRBSATUAL,
                 V_VLRFABATUAL,
                 V_VLRBASEDEFICIT,
                 v_IDPERFILINVEST --SIG 55438
            FROM BENEFBFCIARIO BF
            JOIN BFCIARIOTITPLAN BTT
              ON btt.IDPESSJUR = bf.idpessjur
             AND btt.IDTITULAR = bf.idtitular
             AND btt.IDPLANOORIGEM = bf.idplanoorigem
             AND btt.IDPESSOA = bf.idpessoa
             AND btt.SEQPROPOSTA = bf.seqproposta
             AND btt.IDPLANOPREV = bf.idplanoprev
             AND btt.IDBENEFICIO = bf.idbeneficio
            LEFT JOIN BENEFPLANOPART BPT
              ON BPT.IDPESSJUR = BF.IDPESSJUR
             AND BPT.IDPLANOPREV = BF.IDPLANOPREV
             AND BPT.IDPESSOA = BF.IDPESSOA
             AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
             AND BPT.IDBENEFICIO = BF.IDBENEFICIO
           WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
             AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
             AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
             AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
             AND BF.IDTITULAR = C_PREPARO.IDTITULAR
             AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
             AND BF.IDPESSOA = C_PREPARO.IDPESSOA
             AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
             AND ROWNUM = 1;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN TOO_MANY_ROWS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
          WHEN OTHERS THEN
            V_VALORTOTAL       := NULL;
            V_VALORATUAL       := NULL;
            V_VALORCALCULADO   := NULL;
            V_DATAINICIOFUND   := NULL;
            V_DIBBENEFANT      := NULL;
            V_IDPLANPREVCONTAB := NULL;
            V_DATAINICIO       := NULL;
            V_DATAFINAL        := NULL;
            V_FONTEPAGADORA    := NULL;
            V_VALOROP1         := NULL;
            V_VALOROP2         := NULL;
            V_VALOROP3         := NULL;
            V_VALORSRB         := NULL;
            V_PERCENTUAL       := NULL;
            V_IDRESPONSAVEL    := NULL;
            V_IDNUCLEOFAMILIAR := NULL;
            V_IDSITBENEFICIO   := NULL;
            V_FLGPAGINSS       := NULL;
            V_CODPORTFORMA     := NULL;
            V_VLRBSATUAL       := NULL;
            V_VLRFABATUAL      := NULL;
            V_VLRBASEDEFICIT   := NULL;
            v_IDPERFILINVEST   := NULL; --SIG 55438
        END;
        IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSIF (v_IDPERFILINVEST IS NULL) THEN
          --Início SIG 55438
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'BENEFÍCIO SEM PERFIL DE INVESTIMENTOS CADASTRADO.');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF; --Fim SIG 55438
        ELSIF (1 = 2) THEN
          INSERT INTO LOGPREPARO
            (IDLOGPREPARO,
             IDPREPAROBENEF,
             IDPLANOPREV,
             IDBENEFICIO,
             NUMEROPROCESSO,
             IDPESSJUR,
             IDTITULAR,
             IDPLANOORIGEM,
             IDPESSOA,
             SEQPROPOSTA,
             OBSERVACOES)
          VALUES
            ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
             IN_IDPREPAROBENEF,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDBENEFICIO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.IDPESSOA,
             C_PREPARO.SEQPROPOSTA,
             'REGRA DE EXECUÇÃO 2');
        
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        ELSE
          V_ANOINICIAL := TO_CHAR(V_DATAINICIO, 'YYYY');
          IF V_ANOINICIAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
            V_DIAINICIAL := TO_CHAR(V_DATAINICIO, 'DD');
            IF V_DIAINICIAL <= '16' THEN
              V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM') - 1;
            ELSE
              V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM');
            END IF;
          ELSE
            V_MESINICIAL := '00';
          END IF;
          V_ANOFINAL := TO_CHAR(V_DATAFINAL, 'YYYY');
          --ALTERADO EM ATENDIMENTO AO SIG 44541
          V_MESFINAL := '12';
          --FIM ALTERAÃ‡ÃƒO SIG 44541
          IF V_ANOFINAL = SUBSTR(V_MESPROCESSAMENTO, 0, 4) THEN
            V_DIAFINAL := TO_CHAR(V_DATAFINAL, 'DD');
            IF V_DIAFINAL <= '14' THEN
              V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM') - 1;
            ELSE
              V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM');
            END IF;
          ELSE
            V_MESFINAL := '12';
          END IF;
          V_QUANTMESES      := V_MESFINAL - V_MESINICIAL;
          V_VALORINTEGRAL   := V_VALORATUAL;
          V_VALORANTECABONO := TRUNC(V_VALORATUAL * (V_QUANTMESES / 12) *
                                     (0.5),
                                     2);
          SELECT CM.SEQSEQINTERNOFB.NEXTVAL
            INTO V_IDSEQINTERNOFB
            FROM DUAL;
        
          IF V_IDSITBENEFICIO = 2 THEN
            IF V_FONTEPAGADORA = 2 AND NVL(V_FLGPAGINSS, 0) = 0 THEN
              V_FLGENVIADO := 8;
            ELSE
              V_FLGENVIADO := 9;
            END IF;
          ELSE
            V_FLGENVIADO := 0;
          END IF;
          INSERT INTO HSTBENEFBFCIARIO HB
            (IDPESSJUR,
             IDTITULAR,
             IDPESSOA,
             IDPLANOPREV,
             IDPLANOORIGEM,
             SEQPROPOSTA,
             IDMOTIVO,
             NUMEROPROCESSO,
             IDBENEFICIO,
             MES,
             MESREFERENCIA,
             SEQBENEFICIO,
             VALORPREV,
             VALORSRB,
             VALORCALCULADO,
             VALORINTEGRAL,
             VALORTOTAL,
             IDREGRACALCULO,
             IDLOTE,
             FLGENVIADO,
             FLGCONCESSAO,
             FLGDEVOLUCAO,
             CODPORTFORMA,
             VLBENEFPGTO,
             DATAPAGAMENTO,
             FLGPROVISORIO,
             PERCENTUAL,
             VALOROP1,
             VALOROP2,
             VALOROP3,
             FONTEPAGADORA,
             FLGTIPOREGISTRO,
             MESCOMPREEM,
             LOTEORIGINAL,
             IDSEQINTERNOFB,
             VALORBS,
             VALORFAB,
             VLRBASEDEFICIT,
             IDPERFILINVEST) -- SIG 55438
          VALUES
            (C_PREPARO.IDPESSJUR,
             C_PREPARO.IDTITULAR,
             C_PREPARO.IDPESSOA,
             C_PREPARO.IDPLANOPREV,
             C_PREPARO.IDPLANOORIGEM,
             C_PREPARO.SEQPROPOSTA,
             V_IDMOTIVOABONO,
             C_PREPARO.NUMEROPROCESSO,
             C_PREPARO.IDBENEFICIO,
             V_MESPROCESSAMENTO,
             (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'),
             1
             /*SEQBENEFICIO*/,
             ROUND(V_VALORANTECABONO,2), -- Leandro WO14561
             V_VALORSRB,
             V_VALORCALCULADO,
             ROUND(V_VALORINTEGRAL,2), -- Leandro WO14561
             V_VALORTOTAL,
             NULL
             /*IDREGRACALCULO*/,
             DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE)
             /*idlote*/,
             V_FLGENVIADO
             /*FLGENVIADO*/,
             0,
             0
             /*FLGDEVOLUCAO*/,
             V_CODPORTFORMA,
             NULL
             /*VLBENEFPGTO*/,
             V_DATAPAGAMENTO,
             0
             /*FLGPROVISORIO*/,
             V_PERCENTUAL,
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP1),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP2),
             DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP3),
             V_FONTEPAGADORA,
             2
             /*FLGTIPOREGISTRO*/,
             DECODE(V_FONTEPAGADORA, 2, V_MESPROCESSAMENTO, NULL),
             V_IDLOTE,
             V_IDSEQINTERNOFB,
             V_VLRBSATUAL,
             V_VLRFABATUAL,
             V_VLRBASEDEFICIT,
             v_IDPERFILINVEST); -- SIG 55438
          V_SOMAVALORESPREPARO := V_SOMAVALORESPREPARO + V_VALORANTECABONO;
          UPDATE PREPAROBENEF PB
             SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
           WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
        
        END IF;
        V_QUANTIDADE := V_QUANTIDADE + 1;
        IF V_QUANTIDADE MOD 1000 = 0 THEN
          COMMIT;
        END IF;
      END LOOP;
      COMMIT;
      UPDATE PREPAROBENEF PB
         SET PB.DATATERMINO = SYSDATE
       WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
    
      UPDATE CTRLINTERFACE
         SET NUMREG      =
             (SELECT SUM(PB.TOTALBENEFPROC)
                FROM PREPAROBENEF PB
               WHERE PB.IDLOTE = V_IDLOTE),
             FLGPREPARADO = 1,
             VLRTOTAL     = NVL(VLRTOTAL, 0) + V_SOMAVALORESPREPARO
       WHERE IDLOTE = V_IDLOTE;
    
      COMMIT;
    END IF;
    --FIM PREPARO ANTECIPAÇÃO ABONO INSS
    ---------------------------------------------------------------------------------------------
  ELSIF V_IDTIPOPREPAROBENEF = 5 THEN
    --PREPARO RESGATE PARCELADO
    V_QUANTIDADE         := 0;
    V_SOMAVALORESPREPARO := 0;
    UPDATE PREPAROBENEF PB
       SET PB.DATAINICIO      = SYSDATE,
           PB.TOTALBENEFREJ   = 0,
           PB.TOTALBENEFPROC  = 0,
           PB.DATATERMINO     = NULL,
           PB.TOTALBENEFICIOS =
           (SELECT COUNT(*)
              FROM BENEFBFCIARIO BF
             WHERE (BF.IDSITBENEFICIO IN (1, 2))
               AND (BF.RESGATEPARCELADO = 1)
               AND (TO_CHAR(BF.datafinal, 'YYYY/MM') >= V_MESPROCESSAMENTO) -- SIG 65638 - Inclusão para desconsiderar resgates finalizados.
               AND (BF.ULTMESPREPARO < V_MESPROCESSAMENTO OR
                   BF.ULTMESPREPARO IS NULL OR
                   (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                   V_IDTIPOPREPAROBENEF = 6))
               AND (BF.FLGFORMAPAGTO = 'F')
               AND (V_IDLISTA IS NULL OR EXISTS
                    (SELECT 1
                       FROM LISTAFOLHABENEFDET LD
                      WHERE BF.IDTITULAR = LD.IDTITULAR
                        AND LD.IDLISTA = V_IDLISTA))
               AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                    (SELECT 1
                       FROM LISTABENEFICIOPREPARO LBP
                      WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                        AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                        AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                        AND LBP.IDPATRO = BF.IDPESSJUR)))
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    SELECT P.IDMOTIVOFOLHABEN
      INTO V_IDMOTIVO
      FROM PARAMAPREV P
     WHERE ROWNUM = 1;
  
    COMMIT;
    FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                             BF.IDBENEFICIO,
                             BF.NUMEROPROCESSO,
                             BF.IDPESSJUR,
                             BF.IDTITULAR,
                             BF.IDPLANOORIGEM,
                             BF.IDPESSOA,
                             BF.SEQPROPOSTA
                        FROM BENEFBFCIARIO BF
                       WHERE (BF.IDSITBENEFICIO IN (1, 2))
                         AND (BF.RESGATEPARCELADO = 1)
                         AND (TO_CHAR(BF.datafinal, 'YYYY/MM') >=
                             V_MESPROCESSAMENTO) -- SIG 65638 - Inclusão para desconsiderar resgates finalizados.
                         AND (BF.ULTMESPREPARO < V_MESPROCESSAMENTO OR
                             BF.ULTMESPREPARO IS NULL OR
                             (BF.ULTMESPREPARO = V_MESPROCESSAMENTO AND
                             V_IDTIPOPREPAROBENEF = 6))
                         AND (BF.FLGFORMAPAGTO = 'F')
                         AND (V_IDLISTA IS NULL OR EXISTS
                              (SELECT 1
                                 FROM LISTAFOLHABENEFDET LD
                                WHERE BF.IDTITULAR = LD.IDTITULAR
                                  AND LD.IDLISTA = V_IDLISTA))
                         AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                              (SELECT 1
                                 FROM LISTABENEFICIOPREPARO LBP
                                WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                  AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                  AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                  AND LBP.IDPATRO = BF.IDPESSJUR))) LOOP
      BEGIN
        SELECT COUNT(*)
          INTO V_LANCMES
          FROM HSTBENEFBFCIARIO HB
         WHERE HB.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND HB.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND HB.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND HB.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND HB.IDTITULAR = C_PREPARO.IDTITULAR
           AND HB.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND HB.IDPESSOA = C_PREPARO.IDPESSOA
           AND HB.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND HB.MESREFERENCIA = V_MESPROCESSAMENTO;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_LANCMES := 0;
        WHEN TOO_MANY_ROWS THEN
          V_LANCMES := 0;
        WHEN OTHERS THEN
          V_LANCMES := 0;
      END;
      BEGIN
        SELECT DISTINCT 1
          INTO V_ACAOJIDICIALREG
          FROM PESSOAPARAM PP
         WHERE PP.IDPARAM = 122
           AND PP.IDPESSOA = C_PREPARO.IDPESSOA
           AND PP.VALOR = 'S';
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_ACAOJIDICIALREG := 0;
        WHEN TOO_MANY_ROWS THEN
          V_ACAOJIDICIALREG := 0;
        WHEN OTHERS THEN
          V_ACAOJIDICIALREG := 0;
      END;
      BEGIN
        SELECT BF.VALORTOTAL,
               BF.VALORATUAL,
               BF.VALORCALCULADO,
               BF.DATAINICIOFUND,
               BF.DIBBENEFANT,
               BF.IDPLANPREVCONTAB,
               BF.DATAINICIO,
               BF.DATAFINAL,
               BF.FONTEPAGADORA,
               NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
               NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
               NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
               BF.VALORSRB,
               DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
               BTT.IDRESPONSAVEL,
               BTT.IDNUCLEOFAMILIAR,
               BF.IDSITBENEFICIO,
               BF.FLGPAGAINSS,
               BF.CODPORTFORMA,
               BF.VLRBSATUAL,
               BF.VLRFABATUAL,
               BF.VLRBASEDEFICIT,
               BF.IDPERFILINVEST --SIG 55438
          INTO V_VALORTOTAL,
               V_VALORATUAL,
               V_VALORCALCULADO,
               V_DATAINICIOFUND,
               V_DIBBENEFANT,
               V_IDPLANPREVCONTAB,
               V_DATAINICIO,
               V_DATAFINAL,
               V_FONTEPAGADORA,
               V_VALOROP1,
               V_VALOROP2,
               V_VALOROP3,
               V_VALORSRB,
               V_PERCENTUAL,
               V_IDRESPONSAVEL,
               V_IDNUCLEOFAMILIAR,
               V_IDSITBENEFICIO,
               V_FLGPAGINSS,
               V_CODPORTFORMA,
               V_VLRBSATUAL,
               V_VLRFABATUAL,
               V_VLRBASEDEFICIT,
               v_IDPERFILINVEST --SIG 55438
          FROM BENEFBFCIARIO BF
          JOIN BFCIARIOTITPLAN BTT
            ON btt.IDPESSJUR = bf.idpessjur
           AND btt.IDTITULAR = bf.idtitular
           AND btt.IDPLANOORIGEM = bf.idplanoorigem
           AND btt.IDPESSOA = bf.idpessoa
           AND btt.SEQPROPOSTA = bf.seqproposta
           AND btt.IDPLANOPREV = bf.idplanoprev
           AND btt.IDBENEFICIO = bf.idbeneficio
          LEFT JOIN BENEFPLANOPART BPT
            ON BPT.IDPESSJUR = BF.IDPESSJUR
           AND BPT.IDPLANOPREV = BF.IDPLANOPREV
           AND BPT.IDPESSOA = BF.IDPESSOA
           AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
           AND BPT.IDBENEFICIO = BF.IDBENEFICIO
         WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND BF.IDTITULAR = C_PREPARO.IDTITULAR
           AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND BF.IDPESSOA = C_PREPARO.IDPESSOA
           AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND ROWNUM = 1;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; --SIG 55438
        WHEN TOO_MANY_ROWS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; --SIG 55438
        WHEN OTHERS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
          V_VLRBSATUAL       := NULL;
          V_VLRFABATUAL      := NULL;
          V_VLRBASEDEFICIT   := NULL;
          v_IDPERFILINVEST   := NULL; --SIG 55438
      END;
      IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO AND
         C_PREPARO.IDPESSOA <> C_PREPARO.IDTITULAR) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'PENSÃO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSIF (V_LANCMES > 0) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'BENEFÍCIO COM LANÇAMENTOS NO MÊS DE PROCESSAMENTO DO PREPARO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSE
        SELECT CM.SEQSEQINTERNOFB.NEXTVAL INTO V_IDSEQINTERNOFB FROM DUAL;
      
        IF V_IDSITBENEFICIO = 2 THEN
          IF V_FONTEPAGADORA = 2 AND NVL(V_FLGPAGINSS, 0) = 0 THEN
            V_FLGENVIADO := 8;
          ELSE
            V_FLGENVIADO := 9;
          END IF;
        ELSE
          V_FLGENVIADO := 0;
        END IF;
        V_VALORINTEGRAL := V_VALORATUAL;
        INSERT INTO HSTBENEFBFCIARIO HB
          (IDPESSJUR,
           IDTITULAR,
           IDPESSOA,
           IDPLANOPREV,
           IDPLANOORIGEM,
           SEQPROPOSTA,
           IDMOTIVO,
           NUMEROPROCESSO,
           IDBENEFICIO,
           MES,
           MESREFERENCIA,
           SEQBENEFICIO,
           VALORPREV,
           VALORSRB,
           VALORCALCULADO,
           VALORINTEGRAL,
           VALORTOTAL,
           IDREGRACALCULO,
           IDLOTE,
           FLGENVIADO,
           FLGCONCESSAO,
           FLGDEVOLUCAO,
           CODPORTFORMA,
           VLBENEFPGTO,
           DATAPAGAMENTO,
           FLGPROVISORIO,
           PERCENTUAL,
           VALOROP1,
           VALOROP2,
           VALOROP3,
           FONTEPAGADORA,
           FLGTIPOREGISTRO,
           MESCOMPREEM,
           LOTEORIGINAL,
           IDSEQINTERNOFB,
           VALORBS,
           VALORFAB,
           VLRBASEDEFICIT,
           IDPERFILINVEST) -- SIG 55438
        VALUES
          (C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPESSOA,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.SEQPROPOSTA,
           V_IDMOTIVO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDBENEFICIO,
           V_MESPROCESSAMENTO,
           V_MESPROCESSAMENTO,
           1
           /*SEQBENEFICIO*/,
           ROUND(V_VALORATUAL,2),
           V_VALORSRB,
           V_VALORCALCULADO,
           ROUND(V_VALORINTEGRAL,2),
           V_VALORTOTAL,
           NULL
           /*IDREGRACALCULO*/,
           DECODE(V_IDSITBENEFICIO, 2, NULL, V_IDLOTE)
           /*idlote*/,
           V_FLGENVIADO
           /*FLGENVIADO*/,
           0,
           0
           /*FLGDEVOLUCAO*/,
           V_CODPORTFORMA,
           NULL
           /*VLBENEFPGTO*/,
           V_DATAPAGAMENTO,
           0
           /*FLGPROVISORIO*/,
           V_PERCENTUAL,
           DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP1),
           DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP2),
           DECODE(V_IDSITBENEFICIO, 2, 0, V_VALOROP3),
           V_FONTEPAGADORA,
           0
           /*FLGTIPOREGISTRO*/,
           DECODE(V_FONTEPAGADORA, 2, V_MESPROCESSAMENTO, NULL),
           V_IDLOTE,
           V_IDSEQINTERNOFB,
           V_VLRBSATUAL,
           V_VLRFABATUAL,
           V_VLRBASEDEFICIT,
           v_IDPERFILINVEST); -- SIG 55438
        V_SOMAVALORESPREPARO := V_SOMAVALORESPREPARO + V_VALORATUAL;
        UPDATE BENEFBFCIARIO BF
           SET BF.ULTMESPREPARO = V_MESPROCESSAMENTO,
               BF.ULTVALORBRUTO = V_VALORATUAL
         WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND BF.IDTITULAR = C_PREPARO.IDTITULAR
           AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND BF.IDPESSOA = C_PREPARO.IDPESSOA
           AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA;
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      END IF;
      V_QUANTIDADE := V_QUANTIDADE + 1;
      IF V_QUANTIDADE MOD 1000 = 0 THEN
        COMMIT;
      END IF;
    END LOOP;
    COMMIT;
    UPDATE PREPAROBENEF PB
       SET PB.DATATERMINO = SYSDATE
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    UPDATE CTRLINTERFACE
       SET NUMREG      =
           (SELECT SUM(PB.TOTALBENEFPROC)
              FROM PREPAROBENEF PB
             WHERE PB.IDLOTE = V_IDLOTE),
           FLGPREPARADO = 1,
           VLRTOTAL     = NVL(VLRTOTAL, 0) + V_SOMAVALORESPREPARO
     WHERE IDLOTE = V_IDLOTE;
  
    COMMIT;
    --END PREPARO RESGATE PARCELADO
    ---------------------------------------------------------------------------------------------
  ELSIF V_IDTIPOPREPAROBENEF = 6 THEN
    --DESFAZER PREPARO
    V_QUANTIDADE := 0;
    SELECT P.IDMOTIVOFOLHABEN, P.IDMOTIVOABONO
      INTO V_IDMOTIVO, V_IDMOTIVOABONO
      FROM PARAMAPREV P
     WHERE ROWNUM = 1;
  
    UPDATE PREPAROBENEF PB
       SET PB.DATAINICIO      = SYSDATE,
           PB.TOTALBENEFREJ   = 0,
           PB.TOTALBENEFPROC  = 0,
           PB.DATATERMINO     = NULL,
           PB.TOTALBENEFICIOS =
           (SELECT COUNT(*)
              FROM BENEFBFCIARIO BF
             WHERE (BF.IDSITBENEFICIO IN (1, 2))
               AND (BF.ULTMESPREPARO = V_MESPROCESSAMENTO)
               AND (EXISTS
                    (SELECT 1
                       FROM HSTBENEFBFCIARIO HB
                      WHERE HB.FLGCONCESSAO = 0
                        AND HB.IDPLANOPREV = BF.IDPLANOPREV
                        AND HB.IDBENEFICIO = BF.IDBENEFICIO
                        AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO
                        AND HB.IDPESSJUR = BF.IDPESSJUR
                        AND HB.IDTITULAR = BF.IDTITULAR
                        AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM
                        AND HB.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO)
                        AND HB.IDPESSOA = BF.IDPESSOA
                        AND HB.SEQPROPOSTA = BF.SEQPROPOSTA
                        AND HB.MES = V_MESPROCESSAMENTO
                        AND (HB.MESREFERENCIA = V_MESPROCESSAMENTO OR
                            (SUBSTR(HB.MES, 6, 2) IN ('02', '08') AND
                            SUBSTR(HB.MESREFERENCIA, 6, 2) = '13' AND
                            SUBSTR(HB.MES, 1, 4) =
                            SUBSTR(HB.MESREFERENCIA, 1, 4)))))
               AND (BF.FLGFORMAPAGTO = 'F')
               AND (BF.IDTPPAGTOBENEFIC = 1)
               AND (V_IDLISTA IS NULL OR EXISTS
                    (SELECT 1
                       FROM LISTAFOLHABENEFDET LD
                      WHERE BF.IDTITULAR = LD.IDTITULAR
                        AND LD.IDLISTA = V_IDLISTA))
               AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                    (SELECT 1
                       FROM LISTABENEFICIOPREPARO LBP
                      WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                        AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                        AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                        AND LBP.IDPATRO = BF.IDPESSJUR)))
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    COMMIT;
    FOR C_PREPARO IN (SELECT BF.IDPLANOPREV,
                             BF.IDBENEFICIO,
                             BF.NUMEROPROCESSO,
                             BF.IDPESSJUR,
                             BF.IDTITULAR,
                             BF.IDPLANOORIGEM,
                             BF.IDPESSOA,
                             BF.SEQPROPOSTA
                        FROM BENEFBFCIARIO BF
                       WHERE (BF.IDSITBENEFICIO IN (1, 2))
                         AND (BF.ULTMESPREPARO = V_MESPROCESSAMENTO)
                         AND (BF.FLGFORMAPAGTO = 'F')
                         AND (BF.IDTPPAGTOBENEFIC = 1)
                         AND (EXISTS
                              (SELECT 1
                                 FROM HSTBENEFBFCIARIO HB
                                WHERE HB.FLGCONCESSAO = 0
                                  AND HB.IDPLANOPREV = BF.IDPLANOPREV
                                  AND HB.IDBENEFICIO = BF.IDBENEFICIO
                                  AND HB.NUMEROPROCESSO = BF.NUMEROPROCESSO
                                  AND HB.IDPESSJUR = BF.IDPESSJUR
                                  AND HB.IDTITULAR = BF.IDTITULAR
                                  AND HB.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                  AND HB.IDMOTIVO IN
                                      (V_IDMOTIVO, V_IDMOTIVOABONO)
                                  AND HB.IDPESSOA = BF.IDPESSOA
                                  AND HB.SEQPROPOSTA = BF.SEQPROPOSTA
                                  AND HB.MES = V_MESPROCESSAMENTO
                                  AND HB.IDLOTE = V_IDLOTE)) -- SIG 51744 João Ricardo
                         AND (V_IDLISTA IS NULL OR EXISTS
                              (SELECT 1
                                 FROM LISTAFOLHABENEFDET LD
                                WHERE BF.IDTITULAR = LD.IDTITULAR
                                  AND LD.IDLISTA = V_IDLISTA))
                         AND (V_FLGPREPAROTOTAL = 1 OR EXISTS
                              (SELECT 1
                                 FROM LISTABENEFICIOPREPARO LBP
                                WHERE LBP.IDPREPAROBENEF = IN_IDPREPAROBENEF
                                  AND LBP.IDBENEFICIO = BF.IDBENEFICIO
                                  AND LBP.IDPLANOPREV = BF.IDPLANOPREV
                                  AND LBP.IDPATRO = BF.IDPESSJUR))) LOOP
      BEGIN
        SELECT BF.VALORTOTAL,
               BF.VALORATUAL,
               BF.VALORCALCULADO,
               BF.DATAINICIOFUND,
               BF.DIBBENEFANT,
               BF.IDPLANPREVCONTAB,
               BF.DATAINICIO,
               BF.DATAFINAL,
               BF.FONTEPAGADORA,
               NVL(BF.VALORBASE1, BPT.VALORBASE1) VALOROP1,
               NVL(BF.VALORBASE2, BPT.VALORBASE2) VALOROP2,
               NVL(BF.VALORBASE3, BPT.VALORBASE3) VALOROP3,
               BF.VALORSRB,
               DECODE(BF.IDPESSOA, BF.IDTITULAR, 100, BTT.PERCENTUAL) PERCENTUAL,
               BTT.IDRESPONSAVEL,
               BTT.IDNUCLEOFAMILIAR,
               BF.IDSITBENEFICIO,
               BF.FLGPAGAINSS,
               BF.CODPORTFORMA
          INTO V_VALORTOTAL,
               V_VALORATUAL,
               V_VALORCALCULADO,
               V_DATAINICIOFUND,
               V_DIBBENEFANT,
               V_IDPLANPREVCONTAB,
               V_DATAINICIO,
               V_DATAFINAL,
               V_FONTEPAGADORA,
               V_VALOROP1,
               V_VALOROP2,
               V_VALOROP3,
               V_VALORSRB,
               V_PERCENTUAL,
               V_IDRESPONSAVEL,
               V_IDNUCLEOFAMILIAR,
               V_IDSITBENEFICIO,
               V_FLGPAGINSS,
               V_CODPORTFORMA
          FROM BENEFBFCIARIO BF
          JOIN BFCIARIOTITPLAN BTT
            ON BTT.IDPESSJUR = BF.IDPESSJUR
           AND BTT.IDTITULAR = BF.IDTITULAR
           AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM
           AND BTT.IDPESSOA = BF.IDPESSOA
           AND BTT.SEQPROPOSTA = BF.SEQPROPOSTA
           AND BTT.IDPLANOPREV = BF.IDPLANOPREV
           AND BTT.IDBENEFICIO = BF.IDBENEFICIO
          LEFT JOIN BENEFPLANOPART BPT
            ON BPT.IDPESSJUR = BF.IDPESSJUR
           AND BPT.IDPLANOPREV = BF.IDPLANOPREV
           AND BPT.IDPESSOA = BF.IDPESSOA
           AND BPT.SEQPROPOSTA = BF.SEQPROPOSTA
           AND BPT.IDBENEFICIO = BF.IDBENEFICIO
         WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND BF.IDTITULAR = C_PREPARO.IDTITULAR
           AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND BF.IDPESSOA = C_PREPARO.IDPESSOA
           AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND ROWNUM = 1;
      
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
        WHEN TOO_MANY_ROWS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
        WHEN OTHERS THEN
          V_VALORTOTAL       := NULL;
          V_VALORATUAL       := NULL;
          V_VALORCALCULADO   := NULL;
          V_DATAINICIOFUND   := NULL;
          V_DIBBENEFANT      := NULL;
          V_IDPLANPREVCONTAB := NULL;
          V_DATAINICIO       := NULL;
          V_DATAFINAL        := NULL;
          V_FONTEPAGADORA    := NULL;
          V_VALOROP1         := NULL;
          V_VALOROP2         := NULL;
          V_VALOROP3         := NULL;
          V_VALORSRB         := NULL;
          V_PERCENTUAL       := NULL;
          V_IDRESPONSAVEL    := NULL;
          V_IDNUCLEOFAMILIAR := NULL;
          V_IDSITBENEFICIO   := NULL;
          V_FLGPAGINSS       := NULL;
          V_CODPORTFORMA     := NULL;
      END;
      V_LANCMES := 0;
      IF (TO_CHAR(V_DATAFINAL, 'YYYY/MM') = V_MESPROCESSAMENTO) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'BENEFÍCIO COM DATA FINAL NO MÊS DE PROCESSAMENTO DO PREPARO.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSIF (V_LANCMES > 0) THEN
        INSERT INTO LOGPREPARO
          (IDLOGPREPARO,
           IDPREPAROBENEF,
           IDPLANOPREV,
           IDBENEFICIO,
           NUMEROPROCESSO,
           IDPESSJUR,
           IDTITULAR,
           IDPLANOORIGEM,
           IDPESSOA,
           SEQPROPOSTA,
           OBSERVACOES)
        VALUES
          ((SELECT NVL(MAX(IDLOGPREPARO), 0) + 1 FROM LOGPREPARO),
           IN_IDPREPAROBENEF,
           C_PREPARO.IDPLANOPREV,
           C_PREPARO.IDBENEFICIO,
           C_PREPARO.NUMEROPROCESSO,
           C_PREPARO.IDPESSJUR,
           C_PREPARO.IDTITULAR,
           C_PREPARO.IDPLANOORIGEM,
           C_PREPARO.IDPESSOA,
           C_PREPARO.SEQPROPOSTA,
           'BENEFÍCIO COM PRÉVIA EFETIVADA.');
      
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFREJ = NVL(PB.TOTALBENEFREJ, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      ELSE
	  
		--inicio sig 48227
		update hstcontribprev h set h.sitrecebimento = 0
		where exists (select 1 
						from tmpdesc t
					   where t.idmotivo       = h.idmotivo
						 and t.mescobranca    = h.mescobranca
						 and t.mesreferencia  = h.mesreferencia
						 and t.numrecebimento = h.numrecebimento
						 and exists (select 1
									   from previa p
									  where p.idpatro     = c_preparo.idpessjur
										and p.idlote      = v_idlote
										and p.idtitular   = c_preparo.idtitular
										and p.mescobranca = v_mesprocessamento
										and p.flgtipodesc = 'p'
										and p.idtitular   = t.idtitular   
										and p.mescobranca = t.mescobranca  
										and p.idlote      = t.idlote        
										and p.idpatro     = t.idpessjur                                                     
										and p.idseqinternofb = t.idseqinternofb
									)
					  );                      
		
		delete from tmpdesc t
		 where exists (select 1
						 from previa p
						where p.idpatro     = c_preparo.idpessjur
						  and p.idlote      = v_idlote
						  and p.idtitular   = c_preparo.idtitular
						  and p.mescobranca = v_mesprocessamento
						  and p.flgtipodesc = 'p'
						  and p.idtitular   = t.idtitular   
						  and p.mescobranca = t.mescobranca  
						  and p.idlote      = t.idlote        
						  and p.idpatro     = t.idpessjur                                                     
						  and p.idseqinternofb = t.idseqinternofb);
		--fim sig 48227
          	  
	  
	  
        DELETE FROM PREVIA P
         WHERE P.MESCOBRANCA = V_MESPROCESSAMENTO
           AND P.IDLOTE = V_IDLOTE
           AND P.IDPATRO = C_PREPARO.IDPESSJUR
           AND
              /*P.IDPESSOA = C_PREPARO.IDPESSOA AND SOL 270115 - JOÃO RICARDO - ERRO AO DESFAZER PRÉVIA */
               P.IDTITULAR = C_PREPARO.IDTITULAR;
      
        --Início SIG 65680
        BEGIN
          SELECT COUNT(B.IDLOGEXPREVIA)
            INTO V_IDLOGEXPREVIA
            FROM CM.LOG_EXCLUSAO_PREVIA B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDLOGEXPREVIA := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDLOGEXPREVIA := 1;
          WHEN OTHERS THEN
            V_IDLOGEXPREVIA := 0;
        END;
        IF V_IDLOGEXPREVIA > 0 THEN
          DELETE --Exclusão da LOG_EXCLUSAO_PREVIA
          FROM CM.LOG_EXCLUSAO_PREVIA B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        END IF;
        BEGIN
          SELECT COUNT(B.IDLOGALTPREVIA)
            INTO V_IDLOGALTPREVIA
            FROM CM.LOG_ALT_PREVIA B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDLOGALTPREVIA := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDLOGALTPREVIA := 1;
          WHEN OTHERS THEN
            V_IDLOGALTPREVIA := 0;
        END;
        IF V_IDLOGALTPREVIA > 0 THEN
          DELETE --Exclusão da LOG_ALT_PREVIA
          FROM CM.LOG_ALT_PREVIA B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        END IF;
        BEGIN
          SELECT COUNT(OBA.IDOBS)
            INTO V_IDOBS
            FROM CM.OBS_PREVIA_BASEPGTO OBA
           WHERE EXISTS
           (SELECT 1
                    FROM CM.LOG_ALT_BASEPGTO BA
                   WHERE BA.IDOBS = OBA.IDOBS
                     AND EXISTS
                   (SELECT 1
                            FROM BASEDEPAGAMENTO B
                           WHERE (B.IDBASEPGTO = BA.IDBASEPGTO)
                             AND B.IDLOTE = V_IDLOTE
                             AND B.IDTITULAR = C_PREPARO.IDTITULAR));
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDLOALTBASEPGTO := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDLOALTBASEPGTO := 1;
          WHEN OTHERS THEN
            V_IDLOALTBASEPGTO := 0;
        END;
        IF V_IDLOALTBASEPGTO > 0 THEN
          DELETE --Exclusão da Log de alteração da Previa
          FROM CM.OBS_PREVIA_BASEPGTO OBA
           WHERE EXISTS
           (SELECT 1
                    FROM CM.LOG_ALT_BASEPGTO BA
                   WHERE BA.IDOBS = OBA.IDOBS
                     AND EXISTS
                   (SELECT 1
                            FROM BASEDEPAGAMENTO B
                           WHERE (B.IDBASEPGTO = BA.IDBASEPGTO)
                             AND B.IDLOTE = V_IDLOTE
                             AND B.IDTITULAR = C_PREPARO.IDTITULAR));
        
        END IF;
        BEGIN
          SELECT COUNT(BA.IDLOALTBASEPGTO)
            INTO V_IDLOALTBASEPGTO
            FROM CM.LOG_ALT_BASEPGTO BA
           WHERE EXISTS (SELECT 1
                    FROM BASEDEPAGAMENTO B
                   WHERE (B.IDBASEPGTO = BA.IDBASEPGTO)
                     AND B.IDLOTE = V_IDLOTE
                     AND B.IDTITULAR = C_PREPARO.IDTITULAR);
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDLOALTBASEPGTO := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDLOALTBASEPGTO := 1;
          WHEN OTHERS THEN
            V_IDLOALTBASEPGTO := 0;
        END;
        IF V_IDLOALTBASEPGTO > 0 THEN
          DELETE --Exclusão da Log de alteração da Previa
          FROM CM.LOG_ALT_BASEPGTO BA
           WHERE EXISTS (SELECT 1
                    FROM BASEDEPAGAMENTO B
                   WHERE (B.IDBASEPGTO = BA.IDBASEPGTO)
                     AND B.IDLOTE = V_IDLOTE
                     AND B.IDTITULAR = C_PREPARO.IDTITULAR);
        
        END IF;
        --Término SIG 65680
        --Início SIG 50619
        --Início SIG 51604 João Ricardo
        BEGIN
          SELECT BA.IDBASEPGTOAPOIO
            INTO V_IDBASEPGTOAPOIO
            FROM CM.BASEDEPAGAMENTOAPOIO BA
           WHERE EXISTS (SELECT 1
                    FROM BASEDEPAGAMENTO B
                   WHERE B.IDBASEPGTO = BA.IDBASEPGTO
                     AND B.IDLOTE = V_IDLOTE
                     AND B.IDTITULAR = C_PREPARO.IDTITULAR);
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDBASEPGTOAPOIO := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDBASEPGTOAPOIO := 1;
          WHEN OTHERS THEN
            V_IDBASEPGTOAPOIO := 0;
        END;
        IF V_IDBASEPGTOAPOIO > 0 THEN
          DELETE --Exclusão da Base de Pagamento Apoio
          FROM CM.BASEDEPAGAMENTOAPOIO BA
           WHERE EXISTS (SELECT 1
                    FROM BASEDEPAGAMENTO B
                   WHERE B.IDBASEPGTO = BA.IDBASEPGTO
                     AND B.IDLOTE = V_IDLOTE
                     AND B.IDTITULAR = C_PREPARO.IDTITULAR);
        
        END IF;
        BEGIN
          SELECT B.IDBASEPGTO
            INTO V_IDBASEPGTO
            FROM CM.BASEDEPAGAMENTO B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            V_IDBASEPGTO := 0;
          WHEN TOO_MANY_ROWS THEN
            V_IDBASEPGTO := 1;
          WHEN OTHERS THEN
            V_IDBASEPGTO := 0;
        END;
        IF V_IDBASEPGTO > 0 THEN
          DELETE --Exclusão da Base de Pagamento
          FROM CM.BASEDEPAGAMENTO B
           WHERE B.IDLOTE = V_IDLOTE
             AND B.IDTITULAR = C_PREPARO.IDTITULAR;
        
        END IF;
        --Término SIG 51604 João Ricardo
        --Término SIG 50619
        IF V_FLGCONTRIBUICAO = 1 THEN
          BEGIN
            SELECT DISTINCT 1
              INTO V_VERIFICA_PARAM_TAXA
              FROM BENEFXTAXA BT
             WHERE BT.IDBENEFICIO = C_PREPARO.IDBENEFICIO
               AND NOT EXISTS
             (SELECT 1
                      FROM CONTRIBUICAO C
                     WHERE C.IDCONTRIBUICAO = BT.IDCONTRIBUICAO
                       AND C.IDTPCONTRIBUICAO = 1);
          
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              V_VERIFICA_PARAM_TAXA := 0;
          END;
        
          SELECT COUNT(1)
            INTO V_COUNT
            FROM TMPDESC TD
           WHERE TD.FLGDESCFOLHA = 'B'
             AND NVL(TD.FLGNAOPROCESSA, 0) = 0
             AND TD.LOTEPREVIA = V_IDLOTE
             AND TD.IDTITULAR = C_PREPARO.IDTITULAR
             AND TD.NUMRECEBIMENTO IS NULL;
        
          IF V_COUNT > 0 THEN
            UPDATE TMPDESC TD
               SET TD.DATARECEBIMENTO = NULL, TD.LOTEPREVIA = NULL
             WHERE TD.FLGDESCFOLHA = 'B'
               AND NVL(TD.FLGNAOPROCESSA, 0) = 0
               AND TD.LOTEPREVIA = V_IDLOTE
               AND TD.IDTITULAR = C_PREPARO.IDTITULAR
               AND TD.NUMRECEBIMENTO IS NULL;
          
          END IF;
        
          SELECT COUNT(1)
            INTO V_COUNT
            FROM TMPDESC TD
           WHERE TD.IDMODULO = 18
             AND TD.FLGDESCFOLHA = 'B'
             AND NVL(TD.FLGNAOPROCESSA, 0) = 0
             AND TD.LOTEPREVIA = V_IDLOTE
             AND TD.IDTITULAR = C_PREPARO.IDTITULAR
             AND TD.NUMRECEBIMENTO IS NOT NULL;
        
          IF V_COUNT > 0 THEN
            FOR C_TMPDESC IN (SELECT TD.NUMRECEBIMENTO,
                                     TD.IDMOTIVO,
                                     TD.MESCOBRANCA,
                                     TD.MESREFERENCIA,
                                     TD.IDTMPDESC
                                FROM TMPDESC TD
                               WHERE TD.IDMODULO = 18
                                 AND TD.NUMRECEBIMENTO IS NOT NULL
                                 AND TD.FLGDESCFOLHA = 'B'
                                 AND NVL(TD.FLGNAOPROCESSA, 0) = 0
                                 AND TD.IDTITULAR = C_PREPARO.IDTITULAR
                                 AND TD.LOTEPREVIA = V_IDLOTE) LOOP
            
              DELETE FROM CM.TMPDESC TD
               WHERE TD.IDTMPDESC = C_TMPDESC.IDTMPDESC;
            
              UPDATE CM.HSTCONTRIBPREV
                 SET SITRECEBIMENTO = 0
               WHERE MESREFERENCIA = C_TMPDESC.MESREFERENCIA
                 AND MESCOBRANCA = C_TMPDESC.MESCOBRANCA
                 AND IDMOTIVO = C_TMPDESC.IDMOTIVO
                 AND NUMRECEBIMENTO = C_TMPDESC.NUMRECEBIMENTO;
            
            END LOOP;
          
          END IF;
        
          DELETE FROM HSTCONTRIBPREV HC
           WHERE HC.MESCOBRANCA = V_MESPROCESSAMENTO
             AND HC.FLGCONCESSAO = 0
             AND HC.FOLHAORIGEM = 'B'
             AND HC.FLGDESCFOLHA = 1
             AND EXISTS (SELECT 1
                    FROM BENEFXTAXA BT
                   WHERE BT.IDCONTRIBUICAO = HC.IDCONTRIBUICAO
                     AND BT.IDBENEFICIO = C_PREPARO.IDBENEFICIO)
             AND HC.VALORRECEBIDO IS NULL
             AND NVL(HC.FLGMANUAL, 0) = 0
             AND HC.IDIMPORTACAOHSTCONTRIB IS NULL
             AND HC.MESREFERENCIA IN
                 (V_MESPROCESSAMENTO,
                  (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'))
             AND HC.MESCOBRANCA = V_MESPROCESSAMENTO
             AND HC.IDPESSOA = V_IDRESPONSAVEL
             AND (HC.VALOROP2 = C_PREPARO.IDBENEFICIO OR
                 NVL(HC.VALOROP2, 0) = 0)
             AND (HC.VALOROP3 = C_PREPARO.IDPESSOA OR
                 NVL(HC.VALOROP3, 0) = 0)
             AND HC.IDTITULAR = C_PREPARO.IDTITULAR;
        
          IF C_PREPARO.IDPESSOA = C_PREPARO.IDTITULAR THEN
            UPDATE CONTRIBPREVPARTP CPP
               SET CPP.ULTMESPREPARO = TO_CHAR(ADD_MONTHS(TO_DATE(V_MESPROCESSAMENTO,
                                                                  'YYYY/MM'),
                                                          -1),
                                               'YYYY/MM')
             WHERE CPP.IDPESSJUR = C_PREPARO.IDPESSJUR
               AND CPP.IDPESSOA = C_PREPARO.IDPESSOA
               AND CPP.IDPLANOPREV = C_PREPARO.IDPLANOPREV
               AND CPP.SEQPROPOSTA = 1
               AND CPP.ULTMESPREPARO = V_MESPROCESSAMENTO -- SIG 51744
               AND EXISTS
             (SELECT 1
                      FROM BENEFXTAXA BT
                     WHERE BT.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO
                       AND BT.IDBENEFICIO = C_PREPARO.IDBENEFICIO
                       AND NOT EXISTS
                     (SELECT 1
                              FROM CONTRIBUICAO C
                             WHERE C.IDCONTRIBUICAO = BT.IDCONTRIBUICAO
                               AND C.IDTPCONTRIBUICAO = 1));
          
          ELSE
            UPDATE CONTRIBPREVNUCLEO CPN
               SET CPN.ULTMESPREPARO = TO_CHAR(ADD_MONTHS(TO_DATE(V_MESPROCESSAMENTO,
                                                                  'YYYY/MM'),
                                                          -1),
                                               'YYYY/MM')
             WHERE CPN.IDNUCLEOFAMILIAR = V_IDNUCLEOFAMILIAR
               AND CPN.ULTMESPREPARO = V_MESPROCESSAMENTO -- SIG 51744
               AND EXISTS
             (SELECT 1
                      FROM BENEFXTAXA BT
                     WHERE BT.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO
                       AND BT.IDBENEFICIO = C_PREPARO.IDBENEFICIO
                       AND NOT EXISTS
                     (SELECT 1
                              FROM CONTRIBUICAO C
                             WHERE C.IDCONTRIBUICAO = BT.IDCONTRIBUICAO
                               AND C.IDTPCONTRIBUICAO = 1));
          
          END IF;
        END IF;
        DELETE FROM HSTBENEFBFCIARIO HB
         WHERE HB.FLGCONCESSAO = 0
           AND HB.FLGENVIADO IN (0, 9, 8)
           AND HB.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND HB.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND HB.MES = V_MESPROCESSAMENTO
           AND HB.IDMOTIVO IN (V_IDMOTIVO, V_IDMOTIVOABONO)
           AND HB.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND HB.MESREFERENCIA IN
               (V_MESPROCESSAMENTO,
                (SUBSTR(V_MESPROCESSAMENTO, 0, 4) || '/13'))
           AND HB.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND HB.IDTITULAR = C_PREPARO.IDTITULAR
           AND HB.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND HB.IDPESSOA = C_PREPARO.IDPESSOA
           AND HB.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND HB.IDLOTE = V_IDLOTE; -- SIG 51744
        UPDATE BENEFBFCIARIO BF
           SET BF.ULTMESPREPARO = TO_CHAR(ADD_MONTHS(TO_DATE(V_MESPROCESSAMENTO,
                                                             'YYYY/MM'),
                                                     -1),
                                          'YYYY/MM'),
               BF.ULTVALORBRUTO = V_VALORATUAL
         WHERE BF.IDPLANOPREV = C_PREPARO.IDPLANOPREV
           AND BF.IDBENEFICIO = C_PREPARO.IDBENEFICIO
           AND BF.NUMEROPROCESSO = C_PREPARO.NUMEROPROCESSO
           AND BF.IDPESSJUR = C_PREPARO.IDPESSJUR
           AND BF.IDTITULAR = C_PREPARO.IDTITULAR
           AND BF.IDPLANOORIGEM = C_PREPARO.IDPLANOORIGEM
           AND BF.IDPESSOA = C_PREPARO.IDPESSOA
           AND BF.SEQPROPOSTA = C_PREPARO.SEQPROPOSTA
           AND BF.ULTMESPREPARO = V_MESPROCESSAMENTO; --  SIG 51744
        UPDATE PREPAROBENEF PB
           SET PB.TOTALBENEFPROC = NVL(PB.TOTALBENEFPROC, 0) + 1
         WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
      
      END IF;
      V_QUANTIDADE := V_QUANTIDADE + 1;
      IF V_QUANTIDADE MOD 1000 = 0 THEN
        /*
        INSERT INTO CARGA.APOIOCARGA
        VALUES
        ('PREPARO-' || IN_IDPREPAROBENEF
        ,V_QUANTIDADE
        ,SYSDATE
        ,'COMMIT');
        */
        COMMIT;
      END IF;
    END LOOP;
    UPDATE PREPAROBENEF PB
       SET PB.DATATERMINO = SYSDATE
     WHERE PB.IDPREPAROBENEF = IN_IDPREPAROBENEF;
  
    COMMIT;
  END IF; --DESFAZER PREPARO
  ---------------------------------------------------------------------------------------------
  COMMIT;
END; --CORPOOOOOOOOOOO