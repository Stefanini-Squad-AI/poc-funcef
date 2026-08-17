CREATE OR REPLACE PROCEDURE CM.SP_CP_PREPARO_TAXA
                                                 (IN_IDPREPAROBENEF IN NUMBER
                                                   , -- (-4 Encerramento / -5 Desdobramento / -6 Concessão -14 Revisão / -16 Reversão / Para Folha de Benefícis considerar > 0)
                                                     -- (-4 Encerramento /
                                                     --  -5 Desdobramento /
                                                     --  -6 Concessão
                                                     --  -14 Revisão/
                                                     --  -16 Reversaão
                                                     --  Para Folha de Benefícios considerar > 0/
                                                     --  -100 PREPARO PATROCINADORA)
                                                     IN_FLGCALCULAALTERADORES IN NUMBER
                                                   , IN_IDPLANOPREV           IN NUMBER
                                                   , IN_IDBENEFICIO           IN NUMBER
                                                   , IN_NUMEROPROCESSO        IN NUMBER
                                                   , IN_IDPESSJUR             IN NUMBER

                                                   , IN_IDTITULAR             IN NUMBER
                                                   , IN_IDPLANOORIGEM         IN NUMBER
                                                   , IN_IDPLANPREVCONTAB      IN NUMBER
                                                   , IN_IDPESSOA              IN NUMBER
                                                   , IN_SEQPROPOSTA           IN NUMBER
                                                   , IN_IDLOTE                IN NUMBER
                                                   , IN_TIPOOPERACAO          IN NUMBER
                                                   , IN_MESREFERENCIA         IN VARCHAR2
                                                   , IN_MESPROCESSAMENTO      IN VARCHAR2
                                                   , IN_FLGENVIADO            IN NUMBER
                                                   , IN_FLGTIPOREGISTRO       IN NUMBER

                                                   , IN_DATAINICIO            IN DATE
                                                   , IN_DATAFINAL             IN DATE
                                                   , IN_PERCGRUPO             IN NUMBER
                                                   , IN_VALORTOTAL            IN NUMBER
                                                   , IN_IDCONTRIBUICAO        IN NUMBER
                                                   , IN_IDNUCLEOFAMILIAR      IN NUMBER
                                                   , IN_ACAOJUDICIALREG       IN NUMBER
                                                   , IN_IDRESPONSAVEL         IN NUMBER
                                                   , IN_IDMOTIVO              IN NUMBER
                                                   , IN_DATAPAGAMENTO         IN DATE
                                                   , IN_IDUSUARIO             IN VARCHAR2

                                                   , IN_FLG_TIPO_TAXA         IN NUMBER
                                                 )
IS
    /********************************************************************************************************************
    =*= Histórico de Alterações =*=
    01/08/2017 16:58 - SIG 51744 JOÃO RICARDO.  Demanda solicita corre? de erro referente a atualizacao do ultimo mes preparo. Contudo, durante os testes um erro antecedente referente a
    --                                              divisao por zero foi identificado. Para ajustar o erro originaol descrito na demanda foi imprescindivel o ajuste do erro de divisao por zero.
    02/10/2017 12:15 - SIG 55626 JOÃO RICARDO.  Foi aberta a demanda 55209 para identificacao de erro que vem ocorrendo no preparo da Folha, pois ao gerar o processo est?endo processado rubrica de
    --                                              contribuicao para pessoas que nao e assistido da Fundacao, mas sim possui a
    --                                              informacao de tutor, Diante disso, solicitamos regularizar o processo para
    --                                              que o processamento so ocorra para o recebedor do beneficio.

    --                                              Para ajuste foi alterada a variavel IN_IDRESPONSAVEL para IN_IDPESSOA quando a instrucao assim requer.
    25/10/2017 15:35 - SIG 57339 Tiago Von      A procedure nao esta considerando o valor de acao judicial sobre cesta
    --                                              alimentacao no calculo da contribuicao.
    08/11/2017 13:00 - SIG 58165 Tiago Von      A procedure esta abatendo a acao judicial duas vezes sobre o valor da contribuicao
    --                                              INDEVIDAMENTE.
    28/11/2017 19:00 - SIG 56914 Rafael Leite   O Sistema nao esta gravando o percentual nos campos VALORBASE1 e VALOROP1 correntamente.
    --                                              Consequentemente, o preparo das contribuioes da Patrocinadora ficam com percentual errados.
    11/01/2018 16:48 - SIG 61542 JOÃO RICARDO.  Desfazer a atualizacao do dia 03/01/2018.
    30/01/2018 10:00 - SIG 61931 Tiago Von.     A rotina de Reversao de cotas esta calculando as taxas com o percentual anterior para os beneficios que estao ficando (Continuam recebendo beneficio).
    07/03/2018 15:25 - SIG 64688 JOÃO RICARDO.  Retornar o ajuste do SIG 63575. Somar o valor da acao na contribuicao.
    08/03/2018 09:00 - SIG 64688 JOÃO RICARDO.  Retornar a versao do dia 11/01/2018 de forma emergencial para processamento da folha de marco 2018.

    16/03/2018       - SIG 65163 H?o Vieira.    Inserir a possibilidade de calculo das contribuicoes da patrocinadora
    22/03/2018       - SIG 64945 Rafael Leite.  Inserir o motivo 3012 para a rotina Preparo Assistido Patrocinador quando o campo flgdevolucao.
    26/03/2018       - SIG 65756 Rafael Leite.  Alterar o campo FLGDESCFOLHA de 0 para 1 conforme diario de bordo
    11/04/2018       - SIG 66599 Rafael Leite.  Caso o assistido possua o parametro 231 e a contribuicao 259, nao gerar o preparo da contribuicao.
    17/04/2018       - SIG 33727 Hebio Vieira.  Atualizacao para que o calculo do abono pela rotina de reversao de cotas seja realizado da mesma forma que o preparo.
    27/04/2018       - SIG 67318  Rafael Leite. Nao gravar o documento ao gerar a devolucao.
    04/02/2019       - SIG 80906  Joao Ricardo. Ajuste do bloqueio das taxas equacionamento. Sempre que ha uma suspensao nao devera gerar taxas de equacionamento para os assistidos.
    --                                              A partir do mes 12/2018 essas taxas estao ?sendo cobradas, descumprindo assim um acordo judicial.
    --                                              Para ajuste foi criado retorno na procedure SP_CP_BUSCA_PERC_CONTRIB da parametrizacao para tratamento no lancamento da contribuicao.
    25/02/2019      - SIG 81567  Rafael Leite.  Ao conceder o benefício, o sistema estava considerando as contribuições pagas de outro benefício para calculo de devolução.
    25/04/2019      - SIG 83587  Tiago Von.     Ajuste na consulta que retorna o valor do benefício para o IDPREPAROBENEF = -16 (Deixou de utilizar a variável PERCENTUAL e passou a utilizar a PERCATUAL)

    17/09/2019      - SIG 86661  Tiago Von.     Ajuste no atendimento do SIG 25208, uma vez que, a rotina de revisão de benefícios (IDPREPAROBENEF = -14) não considera o valor das rubricas judiciais.
    17/09/2019      - SIG 86663  Tiago Von      Adequação da Procedure para calcular o Pro-Rata, proporcial a DIB, em cima dos valores judiciais.
    24/09/2019      - SIG 91981  Rafael Leite   Ajuste na regra de cálculo das contribuições de acão judicial - Pensão desdobrada em mais de um beneficiário.
    20/11/2019      - SIG 94290  Rafael Leite   Ajuste na Reversão de Cotas para quem está saíndo no Replan Puro. O percentual atual alterava para 0 (Planus) e dava erro de divisão por 0.
    23/04/2020      - SIG 99503  João Ricardo   Ajustar o preparo para viabilizar lançamento de 2° parcela do abono anual INNS ou abono anual INSS em meses definidos pelo usuário.
    --                                              A parametrização do mês será adicionada na estrutura CM.PARAMAPREV.
    02/10/2020	   - SIG 102694 Tratamento espeifico para participantes com beneficio concedido com DATAFINAL retroativa e o IN_FLTIPOREGISTRO = 2, onde deve-se aplicar o abono cheio.
    23/08/2021	   - SIG 118506 Ajuste na consulta do calculo do VALOR TOTAL, a rotina não estava considerando o valor total do BUA no cálculo da contribuição para pensões em planos diferentes de 2 (REG/REPLAN PURO).
    03/03/2022     - SIG 121019 - Ajuste na Liberação do Beneficio Retiro, calcular a contribuição corretamente.
	02/07/2024     - WO11898 - Helen V Bianchi. Ajuste no calculo do valor devido das taxas administrativas e extraordinárias.
    *********************************************************************************************************************/
    --********************************************************
    --Variaveis Globais
    --********************************************************
    V_TETOINSS              NUMBER;

    V_MEIOTETOINSS          NUMBER;
    V_PERC1_RRNS            NUMBER;
    V_PERC2_RRNS            NUMBER;
    V_PERC3_RRNS            NUMBER;
    V_PERC_NP               NUMBER;
    V_PERC_REB              NUMBER;
    V_PERC_S                NUMBER;
    V_VALORACAOJUDICIAL     NUMBER;
    V_VALORTOTAL            NUMBER;
    V_QUANTMESES            NUMBER;
    V_PERCANTECABONO        NUMBER;

    V_MESFINAL              VARCHAR2(2);
    V_MESINICIAL            VARCHAR2(2);
    V_PERCCONTRIB           NUMBER;
    V_PARCELADEDUZIR        NUMBER;
    V_PERCCONTRIBACAO       NUMBER;
    V_PARCELADEDUZIRACAO    NUMBER;
    V_VALORCONTRIBUICAOACAO NUMBER;
    V_VALORCONTRIBUICAO     NUMBER;
    V_VALORCONTRIBUICAOPAGA NUMBER;
    V_FLGDEVOLUCAO          NUMBER;
    V_IDMOTIVO              NUMBER;

    V_NUMRECEBIMENTO        NUMBER;
    V_IDMOTIVODEVOLUCABONO  NUMBER;
    V_VALORINDICEALTERADOR  NUMBER;
    V_VALORALTERADOR        NUMBER;
    V_CODALTERADOR          NUMBER;
    V_FLGVERIFICACONTRIB    NUMBER;
    V_DATAINICIO            DATE;
    V_DATAFINAL             DATE;
    V_DATAPAGAMENTO         DATE;
    V_IDNUCLEOFAMILIAR      NUMBER;
    V_IDUSUARIO             VARCHAR(20);

    V_IDCONTRIBUICAO        NUMBER;
    V_FLGDEFICIT            NUMBER;--V_IDTPCONTRIBUICAO      NUMBER;
    V_IDPLANPREVCONTAB      NUMBER;
    V_DIAINICIAL            NUMBER;
    V_DIAFINAL              NUMBER;
    V_QUANTDIASINICIO       NUMBER;
    V_IDTPPAGTOBENEFIC      NUMBER;
    V_ULTIMODIA             NUMBER;
    V_DESC_LOTE             VARCHAR2(200);
    V_PERCGRUPOFAMILIAR     NUMBER;
    V_FLGRESGATE            NUMBER;

    V_MESREFERENCIA         VARCHAR(20);
    V_MESCOBRANCA           VARCHAR(20);
    V_FLGEQUACIONAMENTO     NUMBER;
    v_VALOREXSASSE          NUMBER;
    V_FLGPART               NUMBER;
    V_IDTPCONTRIBUICAO      NUMBER;
    V_FLGDESCFOLHA          NUMBER;     -- SIG 65163
    V_FOLHAORIGEM           VARCHAR2(1);-- SIG 65163
    V_PARAM231              NUMBER;     --SIG 66599
    V_FLGEXECUTA            NUMBER;     --AJUSTE PARA NÃO COBRAR ABONO
    V_DESCONTO_FOLHA_BENEF  NUMBER;     -- SIG 80906

    V_SITBENEFICIO          NUMBER;     -- WO11898

    V_MES_ABONO_FUNCEF      VARCHAR2(2);
    /*SIG 99503  João Ricardo*/
    --********************************************************
    -- Corpo da Procedure
    --********************************************************
BEGIN
    --CORPO--------------------------------------------------------------
    V_DESCONTO_FOLHA_BENEF := 2; -- SIG 80906 JOÃO RICARDO
    --INÍCIO AJUSTE PARA NÃO COBRAR ABONO
    V_FLGEXECUTA := 1;
    IF (IN_FLGTIPOREGISTRO = 2

        and
        SUBSTR(IN_MESREFERENCIA,6,2) = '13') then
        BEGIN
            SELECT
                   C.FLGCOBRADECTERC
            INTO
                   V_FLGEXECUTA
            FROM
                   CONTPREV C
            WHERE
                   C.IDCONTRIBUICAO  = IN_IDCONTRIBUICAO

                   AND C.IDPLANOPREV = IN_IDPLANOPREV
            ;
        
        EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            V_FLGEXECUTA := V_FLGEXECUTA;
        WHEN OTHERS THEN
            V_FLGEXECUTA := 1;
        END;
        IF V_FLGEXECUTA = 0 THEN
            RETURN;

        END IF;
    END IF;
    --TÉRMINO AJUSTE PARA NÃO COBRAR ABONO
    -- INÍCIO SIG 65163
    IF IN_IDPREPAROBENEF = -100 THEN
        V_FLGDESCFOLHA := 1;--SIG 65756 - ALterou de 0 para 1
        V_FOLHAORIGEM  := 'P';
    ELSE
        V_FLGDESCFOLHA := 1;
        V_FOLHAORIGEM  := 'B';
    END IF;

    -- Fim SIG 65163
    IF IN_IDCONTRIBUICAO IS NULL THEN
        BEGIN
            SELECT
                   BT.IDCONTRIBUICAO
            INTO
                   V_IDCONTRIBUICAO
            FROM
                   BENEFXTAXA BT
            WHERE
                   BT.IDBENEFICIO = IN_IDBENEFICIO

                   AND ROWNUM     = 1
            ;
        
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            V_IDCONTRIBUICAO := 0;
        END;
    ELSE
        V_IDCONTRIBUICAO := IN_IDCONTRIBUICAO;
    END IF;
    IF IN_IDNUCLEOFAMILIAR = 0 THEN

        V_IDNUCLEOFAMILIAR := NULL;
    ELSE
        V_IDNUCLEOFAMILIAR := IN_IDNUCLEOFAMILIAR;
    END IF;
    SELECT
           C.DESCRICAO
         , C.MESREFERENCIA
    INTO
           V_DESC_LOTE
         , V_MESCOBRANCA
    FROM

           CTRLINTERFACE C
    WHERE
           C.IDLOTE = IN_IDLOTE
    ;
    
    --VERIFICAÇÃO DO TIPO DE CONTRIBUIÇÃO--------------------------------
    BEGIN
        SELECT
               TC.FLGDEFICIT
             , C.IDTPCONTRIBUICAO
        INTO

               V_FLGDEFICIT
             , V_IDTPCONTRIBUICAO
        FROM
               CONTRIBUICAO C
               JOIN
                      TPCONTRIBUICAO TC
                      ON
                             C.IDTPCONTRIBUICAO = TC.IDTPCONTRIBUICAO
        WHERE
               C.IDCONTRIBUICAO = V_IDCONTRIBUICAO
        ;

    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        V_FLGDEFICIT := 0;
    END;
    --VERIFICA SE O PARTICPANTE POSSUI CONTRIBUICAO CADASTRADA-----------
    IF IN_IDPESSOA = IN_IDTITULAR THEN
        BEGIN
            SELECT
                   CPP.DATAINICIO
                 , CPP.DATAFINAL

                 , CPP.IDPLANPREVCONTAB
                 , 1
            INTO
                   V_DATAINICIO
                 , V_DATAFINAL
                 , V_IDPLANPREVCONTAB
                 , V_FLGVERIFICACONTRIB
            FROM
                   CONTRIBPREVPARTP CPP
            WHERE
                   CPP.IDPESSOA           = IN_IDPESSOA

                   AND CPP.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                   AND CPP.FLGCOBRA       = 1
                   AND ROWNUM             = 1
            ;
        
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            V_DATAINICIO         := IN_DATAINICIO;
            V_DATAFINAL          := IN_DATAFINAL;
            V_IDPLANPREVCONTAB   := IN_IDPLANPREVCONTAB;
            V_FLGVERIFICACONTRIB := 0;

        END;
    ELSE
        BEGIN
            SELECT
                   CPN.DATAINICIO
                 , CPN.DATAFINAL
                 , CPN.IDPLANPREVCONTAB
                 , 1
            INTO
                   V_DATAINICIO
                 , V_DATAFINAL

                 , V_IDPLANPREVCONTAB
                 , V_FLGVERIFICACONTRIB
            FROM
                   CONTRIBPREVNUCLEO CPN
            WHERE
                   CPN.IDNUCLEOFAMILIAR   = V_IDNUCLEOFAMILIAR
                   AND CPN.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                   AND CPN.FLGCOBRA       = 1
                   AND ROWNUM             = 1
            ;
        

        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            V_DATAINICIO         := IN_DATAINICIO;
            V_DATAFINAL          := IN_DATAFINAL;
            V_IDPLANPREVCONTAB   := IN_IDPLANPREVCONTAB;
            V_FLGVERIFICACONTRIB := 0;
        END;
    END IF;
    IF NVL(V_FLGDEFICIT, 0) >= 1
        AND
        SUBSTR(IN_MESREFERENCIA,6,2) = '13'

        AND
        NOT
        (
            (
                TO_CHAR(V_DATAINICIO,'YYYY') > SUBSTR(IN_MESREFERENCIA,1,4)
                OR
                (
                    NVL(TO_CHAR(V_DATAFINAL,'YYYY'), SUBSTR(IN_MESREFERENCIA,1,4)) < SUBSTR(IN_MESREFERENCIA,1,4)
                    AND
                    IN_IDPREPAROBENEF <> -4
                )

            )
        )
        THEN
        V_DATAINICIO := IN_DATAINICIO;
        V_DATAFINAL  := IN_DATAFINAL;
    END IF;
    V_DATAPAGAMENTO := IN_DATAPAGAMENTO; --SIG 43098 - RAFAEL VASCONCELOS
    IF IN_IDUSUARIO IS NULL THEN
        V_IDUSUARIO := USER;
    ELSIF IN_IDUSUARIO LIKE 'CJ%' THEN
        V_IDUSUARIO := IN_IDUSUARIO;

    ELSE
        V_IDUSUARIO := 'CM'
        || IN_IDUSUARIO;
    END IF;
    IF IN_FLGENVIADO NOT IN (8, 9) THEN
        --BUSCA DAS RUBRICAS DE A?O JUDICIAL--------------------------------
        --SIG 35271
        /*IF IN_FLG_TIPO_TAXA = 1 OR IN_FLG_TIPO_TAXA IS NULL THEN
        V_FLGEQUACIONAMENTO := 0;
        ELSE
        V_FLGEQUACIONAMENTO := 1;

        END IF;*/
        --SIG 35271
        CM.SP_VALORESJUDICIAIS(IN_IDPESSOA ,IN_IDTITULAR ,IN_IDPLANOPREV ,IN_IDPLANPREVCONTAB ,IN_MESREFERENCIA ,V_IDTPCONTRIBUICAO -- SIG 35271
        ,V_VALORACAOJUDICIAL);
        IF V_VALORACAOJUDICIAL IS NULL THEN
            V_VALORACAOJUDICIAL := 0;
            /* Ajuste Osni 12/02/2016*/
        ELSE
            IF IN_FLGTIPOREGISTRO = 2 THEN
                V_VALORACAOJUDICIAL := V_VALORACAOJUDICIAL * 2;
            END IF;

            /* Fim Ajuste Ajuste Osni 12/02/2016*/
        END IF;
        --BUSCA DA RUBRICA EX-SASSE--SIG 24838-------------------------------
        SELECT
               B.FLGRESGATE
        INTO
               V_FLGRESGATE
        FROM
               BENEFICIO B
        WHERE
               B.IDBENEFICIO = IN_IDBENEFICIO

        ;
        
        IF V_FLGRESGATE = 1 THEN
            v_VALOREXSASSE := 0;
        ELSE
            BEGIN
                SELECT
                       RI.VALORRUBRICA
                INTO
                       v_VALOREXSASSE
                FROM

                       RUBRICAINDIV RI
                WHERE
                       RI.IDRUBRICA     = 39578
                       AND RI.IDPESSOA  = in_IDPESSOA
                       AND RI.IDTITULAR = in_IDTITULAR
                       AND RI.ANOMESREF = in_MESREFERENCIA
                       AND
                       (
                              RI.ANOMESREF   = V_MESCOBRANCA
                              OR RI.FLGUSADO = 1
                       )

                ;
            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_VALOREXSASSE := 0;
            WHEN TOO_MANY_ROWS THEN   --SIG 61482 - PARTICIPANTE COM RUBRICA DE EX-SASSE DUPLICADA
                v_VALOREXSASSE := -1; --SIG 61482 - PARTICIPANTE COM RUBRICA DE EX-SASSE DUPLICADA
            END;
        END IF;
        --VERIFICAÇÃO DE PRO RATA PARA ABONO (X/12)--------------------------
        --INÍCIO ajuste SOL 267499

        /*SELECT B.IDTPPAGTOBENEFIC
        INTO V_IDTPPAGTOBENEFIC
        FROM BENEFICIO B
        WHERE B.IDBENEFICIO = IN_IDBENEFICIO;*/
        SELECT
               BF.IDTPPAGTOBENEFIC,
               BF.IDSITBENEFICIO         -- WO11898
        INTO
               V_IDTPPAGTOBENEFIC,     
               V_SITBENEFICIO            -- WO11898
               
        FROM
               BENEFBFCIARIO BF
        WHERE

               BF.IDPLANOPREV        = IN_IDPLANOPREV
               AND BF.IDBENEFICIO    = IN_IDBENEFICIO
               AND BF.NUMEROPROCESSO = IN_NUMEROPROCESSO
               AND BF.IDPESSJUR      = IN_IDPESSJUR
               AND BF.IDTITULAR      = IN_IDTITULAR
               AND BF.IDPLANOORIGEM  = IN_IDPLANOORIGEM
               AND BF.IDPESSOA       = IN_IDPESSOA
               AND BF.SEQPROPOSTA    = IN_SEQPROPOSTA
        ;
        
        --Tnício ajuste SOL 267499

        IF SUBSTR(IN_MESREFERENCIA, 6, 2) <> '13'
            OR
            V_IDTPPAGTOBENEFIC = 2 THEN
            V_QUANTMESES     := 12;
            V_PERCANTECABONO := 1;
        ELSE
            V_QUANTMESES := 12;
            IF TO_CHAR(V_DATAINICIO, 'YYYY')    = SUBSTR(IN_MESREFERENCIA, 0, 4) THEN
                IF TO_CHAR(V_DATAINICIO, 'DD') <= '16' THEN
                    V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM') - 1;
                ELSE

                    V_MESINICIAL := TO_CHAR(V_DATAINICIO, 'MM');
                END IF;
            ELSE
                V_MESINICIAL := '00';
            END IF;
            IF TO_CHAR(V_DATAFINAL, 'YYYY')    = SUBSTR(IN_MESREFERENCIA, 0, 4) THEN
                IF TO_CHAR(V_DATAFINAL, 'DD') <= '14' THEN
                    V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM') - 1;
                ELSE
                    V_MESFINAL := TO_CHAR(V_DATAFINAL, 'MM');
                END IF;

            ELSE
                V_MESFINAL := '12';
            END IF;
            V_QUANTMESES := V_MESFINAL - V_MESINICIAL;
              --  SIG 102694 - Tiago Von - INICIO
            /*
            IF IN_FLGTIPOREGISTRO = 2 THEN
                V_PERCANTECABONO := 0.5;
            ELSE
                V_PERCANTECABONO := 1;
            END IF;             */      
           IF IN_FLGTIPOREGISTRO = 2 THEN
                  IF 	IN_IDPREPAROBENEF IN (-5, -6) AND
                  		V_DATAFINAL < SYSDATE AND 
                  		SUBSTR(IN_MESREFERENCIA,6,2) = '13' AND
                  		V_DATAPAGAMENTO >= SYSDATE THEN
                  		V_PERCANTECABONO := 1;
                  ELSE
                		V_PERCANTECABONO := 0.5;
                  END IF;
            ELSE
                V_PERCANTECABONO := 1;
            END IF;
            -- SIG 102694 - Tiago Von - FIM
        END IF;
        END IF;
        --VERIFICAÇÃO DE PRO-RATA PARA PRIMEIRO E ULTIMO PAGAMENTO-----------

        IF V_IDTPPAGTOBENEFIC = 2 THEN
            V_QUANTDIASINICIO := 30;
        ELSIF TO_CHAR(V_DATAINICIO, 'YYYY/MM') = IN_MESREFERENCIA
            OR
            TO_CHAR(V_DATAFINAL, 'YYYY/MM') = IN_MESREFERENCIA THEN
            V_DIAINICIAL := 0;
            V_DIAFINAL   := 30;
            IF TO_CHAR(V_DATAINICIO, 'YYYY/MM')   = IN_MESREFERENCIA THEN
                IF EXTRACT(DAY FROM V_DATAINICIO) = 31 THEN
                    -- INÍCIO ALTERAÇÃO
                    V_DIAINICIAL := EXTRACT(DAY FROM V_DATAINICIO) - 2;

                ELSE
                    V_DIAINICIAL := EXTRACT(DAY FROM V_DATAINICIO) - 1;
                END IF; --TÉRMINO ALTERAÇÃO
            END IF;
            IF TO_CHAR(V_DATAFINAL, 'YYYY/MM') = IN_MESREFERENCIA THEN
                V_DIAFINAL  := EXTRACT(DAY FROM V_DATAFINAL);
                V_ULTIMODIA := EXTRACT(DAY FROM LAST_DAY(V_DATAFINAL)); -- SOL 265869 - TIAGO VON
                IF (V_DIAFINAL = V_ULTIMODIA
                    OR
                    V_DIAFINAL IS NULL) THEN
                    -- SOL 265869 - TIAGO VON

                    V_DIAFINAL := 30;
                END IF;
            END IF;
            V_QUANTDIASINICIO := V_DIAFINAL - V_DIAINICIAL;
        ELSE
            V_QUANTDIASINICIO := 30;
        END IF;
        --CALCULO DO VALOR TOTAL---------------------------------------------
        IF IN_IDPLANPREVCONTAB = 2
            AND
            IN_IDPESSOA <> IN_IDTITULAR --AND --SOL 267686 - H?o

            --IN_PERCGRUPO <> 100 --SOL 267686 - H?o
            THEN
            BEGIN
                /*INI?IO AJUSTE SOL 270182 - JOÃO RICARDO - AJUSTE PARA CALCULO VALOR TOTAL PELO SISTEMA DE A?ES JUDICIAIS */
                IF IN_IDUSUARIO LIKE 'CJ%' THEN
                    SELECT
                           CASE
                                  WHEN (
                                                NVL(VALORINTEGRAL,0)    > 0
                                                AND NVL(IN_PERCGRUPO,0) > 0
                                         )

                                         THEN -- INÍCIO 1 AJUSTE SIG 51744
                                         VALORINTEGRAL / (IN_PERCGRUPO / 100)
                                         ELSE 0
                           END
                    INTO
                           V_VALORTOTAL -- TERMINO 1 AJUSTE SIG 51744
                    FROM
                           (
                                    SELECT
                                             HB.VALORINTEGRAL
                                           , HB.SEQBENEFICIO

                                           , BTT.PERCENTUAL
                                    FROM
                                             HSTBENEFBFCIARIO HB
                                             JOIN
                                                      BENEFBFCIARIO BF
                                                      ON
                                                               BF.IDPLANOPREV        = HB.IDPLANOPREV
                                                               AND BF.IDBENEFICIO    = HB.IDBENEFICIO
                                                               AND BF.NUMEROPROCESSO = HB.NUMEROPROCESSO
                                                               AND BF.IDPESSJUR      = HB.IDPESSJUR
                                                               AND BF.IDTITULAR      = HB.IDTITULAR

                                                               AND BF.IDPLANOORIGEM  = HB.IDPLANOORIGEM
                                                               AND BF.IDPESSOA       = HB.IDPESSOA
                                                               AND BF.SEQPROPOSTA    = HB.SEQPROPOSTA
                                             JOIN
                                                      BFCIARIOTITPLAN BTT
                                                      ON
                                                               BTT.IDPESSJUR         = BF.IDPESSJUR
                                                               AND BTT.IDTITULAR     = BF.IDTITULAR
                                                               AND BTT.IDPESSOA      = BF.IDPESSOA
                                                               AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                                               AND BTT.SEQPROPOSTA   = BF.SEQPROPOSTA

                                                               AND BTT.IDPLANOPREV   = BF.IDPLANOPREV
                                                               AND BTT.IDBENEFICIO   = BF.IDBENEFICIO
                                             JOIN
                                                      BENEFXTAXA BT
                                                      ON
                                                               BF.IDBENEFICIO = BT.IDBENEFICIO
                                    WHERE
                                             HB.IDPLANOPREV        = IN_IDPLANOPREV
                                             AND HB.IDBENEFICIO    = IN_IDBENEFICIO
                                             AND HB.NUMEROPROCESSO = IN_NUMEROPROCESSO
                                             AND HB.IDPESSJUR      = IN_IDPESSJUR

                                             AND HB.IDTITULAR      = IN_IDTITULAR
                                             AND HB.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                                             AND HB.IDPESSOA       = IN_IDPESSOA
                                             AND HB.SEQPROPOSTA    = IN_SEQPROPOSTA
                                             --AND HB.MES = IN_MESPROCESSAMENTO
                                             AND HB.MES =
                                             (
                                                    SELECT
                                                           MAX(HB1.MES)
                                                    FROM
                                                           HSTBENEFBFCIARIO HB1

                                                    WHERE
                                                           BF.IDPLANOPREV        = HB1.IDPLANOPREV
                                                           AND BF.IDBENEFICIO    = HB1.IDBENEFICIO
                                                           AND BF.NUMEROPROCESSO = HB1.NUMEROPROCESSO
                                                           AND BF.IDPESSJUR      = HB1.IDPESSJUR
                                                           AND BF.IDTITULAR      = HB1.IDTITULAR
                                                           AND BF.IDPLANOORIGEM  = HB1.IDPLANOORIGEM
                                                           AND BF.IDPESSOA       = HB1.IDPESSOA
                                                           AND BF.SEQPROPOSTA    = HB1.SEQPROPOSTA
                                                           AND HB.MESREFERENCIA  = HB1.MESREFERENCIA
                                             )

                                             AND HB.MESREFERENCIA  = IN_MESREFERENCIA
                                             AND BT.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                                             AND BTT.IDRESPONSAVEL = IN_IDRESPONSAVEL
                                    ORDER BY
                                             HB.SEQBENEFICIO
                           )
                    WHERE
                           ROWNUM = 1
                    ;
                
                ELSE

                    SELECT
                           CASE -- INÍCIO 2 AJUSTE SIG 51744
                                  WHEN (
                                                IN_IDPREPAROBENEF IN (-5)
                                                AND NVL(VALORINTEGRAL, 0) > 0
                                                AND NVL(PERCENTUAL, 0)    > 0
                                         )
                                         THEN -- Ajuste SIG 46949 - Inicio Tiago Von/Hebio
                                         VALORINTEGRAL / (PERCENTUAL / 100)
                                  WHEN (
                                                IN_IDPREPAROBENEF IN (-16, -12)  -- Andre Imakawa - SIG 121019

                                                AND PERCATUAL = 100
                                         )
                                         THEN VALORINTEGRAL -- Ajuste SIG 46949 - Fim Tiago Von/Hebio
                                         --WHEN (IN_IDPREPAROBENEF IN (-16) AND PERCATUAL <> 100 AND NVL(VALORINTEGRAL, 0) > 0 AND NVL(PERCENTUAL, 0) > 0) THEN -- Inicio Ajuste SIG 48672 Raimundo/ Hebio  , Rafael SIG 94290
                                  WHEN (
                                                IN_IDPREPAROBENEF IN (-16, -12)  -- Andre Imakawa - SIG 121019
                                                AND PERCATUAL            <> 100
                                                AND NVL(PERCATUAL,0)      >0
                                                AND NVL(VALORINTEGRAL, 0) > 0
                                                AND NVL(PERCENTUAL, 0)    > 0
                                         )

                                         THEN -- Inicio Ajuste SIG 48672 Raimundo/ Hebio  , Rafael SIG 94290
                                         -- VALORINTEGRAL / (PERCENTUAL / 100) -- Final Ajuste SIG 48672 Raimundo/ Hebio -- SIG 83587 TIAGO VON
                                         VALORINTEGRAL / (PERCATUAL / 100) -- Final Ajuste SIG 48672 Raimundo/ Hebio  -- SIG 83587 TIAGO VON
                                  WHEN (
                                                IN_IDPREPAROBENEF IN (-16,-12)  -- Andre Imakawa - SIG 121019
                                                AND NVL(PERCATUAL,0)      =0
                                                AND NVL(VALORINTEGRAL, 0) > 0
                                                AND NVL(PERCENTUAL, 0)    > 0
                                         )
                                         THEN                               -- Rafael SIG 94290
                                         VALORINTEGRAL / (PERCENTUAL / 100) -- -- Rafael SIG 94290

                                  WHEN (
                                                IN_IDPREPAROBENEF NOT IN (-5
                                                                        , -16
                                                                        , -12) -- Andre Imakawa - SIG 121019
                                                AND NVL(VALORINTEGRAL, 0) > 0
                                                AND NVL(IN_PERCGRUPO, 0)  > 0
                                         )
                                         THEN VALORINTEGRAL / (IN_PERCGRUPO / 100)
                                         ELSE 0
                           END
                    INTO
                           V_VALORTOTAL -- TÉRMINO 2 AJUSTE SIG 51744

                    FROM
                           (
                                    SELECT
                                             HB.VALORINTEGRAL
                                           , HB.SEQBENEFICIO
                                           , BTT.PERCENTUAL PERCATUAL -- Ajuste SIG 46949 - Tiago Von/Hebio
                                           , (
                                                      SELECT DISTINCT
                                                               FIRST_VALUE(HPG.PERCENTUAL) OVER(ORDER BY HPG.DATAINICIO DESC)
                                                      FROM
                                                               HSTPERCGRUPO HPG

                                                      WHERE
                                                               HPG.IDPLANOPREV                      = HB.IDPLANOPREV
                                                               AND HPG.IDBENEFICIO                  = HB.IDBENEFICIO
                                                               AND HPG.NUMEROPROCESSO               = HB.NUMEROPROCESSO
                                                               AND HPG.IDPESSJUR                    = HB.IDPESSJUR
                                                               AND HPG.IDTITULAR                    = HB.IDTITULAR
                                                               AND HPG.IDPLANOORIGEM                = HB.IDPLANOORIGEM
                                                               AND HPG.IDPESSOA                     = HB.IDPESSOA
                                                               AND HPG.SEQPROPOSTA                  = HB.SEQPROPOSTA
                                                               AND TO_CHAR(HPG.DATAINICIO, 'YYYY') <= SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                               AND

                                                               (
                                                                        TO_CHAR(HPG.DATAFIM, 'YYYY') >= SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                        OR HPG.DATAFIM          IS NULL
                                                               )
                                             )
                                             PERCENTUAL
                                    FROM
                                             HSTBENEFBFCIARIO HB
                                             JOIN
                                                      BENEFBFCIARIO BF
                                                      ON

                                                               BF.IDPLANOPREV        = HB.IDPLANOPREV
                                                               AND BF.IDBENEFICIO    = HB.IDBENEFICIO
                                                               AND BF.NUMEROPROCESSO = HB.NUMEROPROCESSO
                                                               AND BF.IDPESSJUR      = HB.IDPESSJUR
                                                               AND BF.IDTITULAR      = HB.IDTITULAR
                                                               AND BF.IDPLANOORIGEM  = HB.IDPLANOORIGEM
                                                               AND BF.IDPESSOA       = HB.IDPESSOA
                                                               AND BF.SEQPROPOSTA    = HB.SEQPROPOSTA
                                             JOIN
                                                      BFCIARIOTITPLAN BTT
                                                      ON

                                                               BTT.IDPESSJUR         = BF.IDPESSJUR
                                                               AND BTT.IDTITULAR     = BF.IDTITULAR
                                                               AND BTT.IDPESSOA      = BF.IDPESSOA
                                                               AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                                               AND BTT.SEQPROPOSTA   = BF.SEQPROPOSTA
                                                               AND BTT.IDPLANOPREV   = BF.IDPLANOPREV
                                                               AND BTT.IDBENEFICIO   = BF.IDBENEFICIO
                                             JOIN
                                                      BENEFXTAXA BT
                                                      ON
                                                               BF.IDBENEFICIO = BT.IDBENEFICIO

                                    WHERE
                                             HB.IDPLANOPREV        = IN_IDPLANOPREV
                                             AND HB.IDBENEFICIO    = IN_IDBENEFICIO
                                             AND HB.NUMEROPROCESSO = IN_NUMEROPROCESSO
                                             AND HB.IDPESSJUR      = IN_IDPESSJUR
                                             AND HB.IDTITULAR      = IN_IDTITULAR
                                             AND HB.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                                             AND HB.IDPESSOA       = IN_IDPESSOA
                                             AND HB.SEQPROPOSTA    = IN_SEQPROPOSTA
                                             AND HB.MES            = IN_MESPROCESSAMENTO
                                             AND HB.MESREFERENCIA  = IN_MESREFERENCIA
                                             -- Andre Imakawa - SIG 121019 - Inicio
                                             AND ( (IN_IDPREPAROBENEF = -12 )  AND (NVL(HB.FLGDEVOLUCAO,0) <> 1)

                                            			OR
                                            			(IN_IDPREPAROBENEF <> - 12)
                                            			)
                                             -- Andre Imakawa - SIG 121019 - Fim
                                             --AND HB.LOTEORIGINAL = IN_IDLOTE
                                             AND BT.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                                             AND BTT.IDRESPONSAVEL = IN_IDRESPONSAVEL
                                    ORDER BY
                                             HB.SEQBENEFICIO
                           )
                    WHERE
                           ROWNUM = 1
                    ;
                
                END IF;

                /*TÉRMINO DO AJUSTE SOL 270182 - JOÃO RICARDO*/
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_VALORTOTAL := IN_VALORTOTAL;
            END;
        ELSIF V_FLGRESGATE = 1
            AND
            V_IDTPPAGTOBENEFIC = 1 THEN
            BEGIN
                SELECT
                       VALORINTEGRAL

                INTO
                       V_VALORTOTAL
                FROM
                       (
                                SELECT
                                         HB.VALORINTEGRAL
                                       , HB.SEQBENEFICIO
                                       , BTT.PERCENTUAL
                                FROM
                                         HSTBENEFBFCIARIO HB
                                         JOIN

                                                  BENEFBFCIARIO BF
                                                  ON
                                                           BF.IDPLANOPREV        = HB.IDPLANOPREV
                                                           AND BF.IDBENEFICIO    = HB.IDBENEFICIO
                                                           AND BF.NUMEROPROCESSO = HB.NUMEROPROCESSO
                                                           AND BF.IDPESSJUR      = HB.IDPESSJUR
                                                           AND BF.IDTITULAR      = HB.IDTITULAR
                                                           AND BF.IDPLANOORIGEM  = HB.IDPLANOORIGEM
                                                           AND BF.IDPESSOA       = HB.IDPESSOA
                                                           AND BF.SEQPROPOSTA    = HB.SEQPROPOSTA
                                         JOIN

                                                  BFCIARIOTITPLAN BTT
                                                  ON
                                                           BTT.IDPESSJUR         = BF.IDPESSJUR
                                                           AND BTT.IDTITULAR     = BF.IDTITULAR
                                                           AND BTT.IDPESSOA      = BF.IDPESSOA
                                                           AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                                           AND BTT.SEQPROPOSTA   = BF.SEQPROPOSTA
                                                           AND BTT.IDPLANOPREV   = BF.IDPLANOPREV
                                                           AND BTT.IDBENEFICIO   = BF.IDBENEFICIO
                                         JOIN
                                                  BENEFXTAXA BT

                                                  ON
                                                           BF.IDBENEFICIO = BT.IDBENEFICIO
                                WHERE
                                         HB.IDPLANOPREV        = IN_IDPLANOPREV
                                         AND HB.IDBENEFICIO    = IN_IDBENEFICIO
                                         AND HB.NUMEROPROCESSO = IN_NUMEROPROCESSO
                                         AND HB.IDPESSJUR      = IN_IDPESSJUR
                                         AND HB.IDTITULAR      = IN_IDTITULAR
                                         AND HB.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                                         AND HB.IDPESSOA       = IN_IDPESSOA
                                         AND HB.SEQPROPOSTA    = IN_SEQPROPOSTA

                                         AND HB.MES            = IN_MESPROCESSAMENTO
                                         AND HB.MESREFERENCIA  = IN_MESREFERENCIA
                                         AND HB.LOTEORIGINAL   = IN_IDLOTE
                                         AND BT.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                                         AND BTT.IDRESPONSAVEL = IN_IDRESPONSAVEL
                                ORDER BY
                                         HB.SEQBENEFICIO
                       )
                WHERE
                       ROWNUM = 1
                ;

            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_VALORTOTAL := 0;
            END;
            -- SIG 72801/86663 Tiago Von INICIO
            IF IN_IDUSUARIO LIKE 'CJ%' THEN
                IF SUBSTR(IN_MESREFERENCIA, 6, 2) <> '13' THEN
                    V_VALORTOTAL := (IN_VALORTOTAL * V_QUANTDIASINICIO)/30;
                ELSE
                    V_VALORTOTAL := (IN_VALORTOTAL * V_QUANTMESES)/12;

                END IF;
            ELSE
                V_VALORTOTAL := IN_VALORTOTAL;
            END IF;
            -- SIG 72801/86663 Tiago Von FIM
         -- SIG 118506 - Tiago Von - INICIO
         ELSIF V_FLGRESGATE = 0 AND V_IDTPPAGTOBENEFIC = 2 THEN
            BEGIN
                SELECT
                       VALORINTEGRAL

                INTO
                       V_VALORTOTAL
                FROM
                       (
                                SELECT
                                         HB.VALORINTEGRAL
                                       , HB.SEQBENEFICIO
                                       , BTT.PERCENTUAL
                                FROM
                                         HSTBENEFBFCIARIO HB
                                         JOIN

                                                  BENEFBFCIARIO BF
                                                  ON
                                                           BF.IDPLANOPREV        = HB.IDPLANOPREV
                                                           AND BF.IDBENEFICIO    = HB.IDBENEFICIO
                                                           AND BF.NUMEROPROCESSO = HB.NUMEROPROCESSO
                                                           AND BF.IDPESSJUR      = HB.IDPESSJUR
                                                           AND BF.IDTITULAR      = HB.IDTITULAR
                                                           AND BF.IDPLANOORIGEM  = HB.IDPLANOORIGEM
                                                           AND BF.IDPESSOA       = HB.IDPESSOA
                                                           AND BF.SEQPROPOSTA    = HB.SEQPROPOSTA
                                         JOIN

                                                  BFCIARIOTITPLAN BTT
                                                  ON
                                                           BTT.IDPESSJUR         = BF.IDPESSJUR
                                                           AND BTT.IDTITULAR     = BF.IDTITULAR
                                                           AND BTT.IDPESSOA      = BF.IDPESSOA
                                                           AND BTT.IDPLANOORIGEM = BF.IDPLANOORIGEM
                                                           AND BTT.SEQPROPOSTA   = BF.SEQPROPOSTA
                                                           AND BTT.IDPLANOPREV   = BF.IDPLANOPREV
                                                           AND BTT.IDBENEFICIO   = BF.IDBENEFICIO
                                         JOIN
                                                  BENEFXTAXA BT

                                                  ON
                                                           BF.IDBENEFICIO = BT.IDBENEFICIO
                                WHERE
                                         HB.IDPLANOPREV        = IN_IDPLANOPREV
                                         AND HB.IDBENEFICIO    = IN_IDBENEFICIO
                                         AND HB.NUMEROPROCESSO = IN_NUMEROPROCESSO
                                         AND HB.IDPESSJUR      = IN_IDPESSJUR
                                         AND HB.IDTITULAR      = IN_IDTITULAR
                                         AND HB.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                                         AND HB.IDPESSOA       = IN_IDPESSOA
                                         AND HB.SEQPROPOSTA    = IN_SEQPROPOSTA

                                         AND HB.MES            = IN_MESPROCESSAMENTO
                                         AND HB.MESREFERENCIA  = IN_MESREFERENCIA
                                         AND HB.LOTEORIGINAL   = IN_IDLOTE
                                         AND BT.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                                         AND BTT.IDRESPONSAVEL = IN_IDRESPONSAVEL
                                ORDER BY
                                         HB.SEQBENEFICIO)
                WHERE
                       ROWNUM = 1;            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_VALORTOTAL := 0;
            END;  -- SIG 118506 - Tiago Von - FIM  
        ELSE
            V_VALORTOTAL := IN_VALORTOTAL;
        END IF;
        -- INÍCIO SIG 25208 Osni Cavalcanti
        IF (IN_IDTITULAR = IN_IDPESSOA
            OR

            IN_PERCGRUPO = 100)
            -- and (nvl(IN_IDPREPAROBENEF, 0) <> -14) -- SIG 86661 Tiago Von
            and
            (
                V_QUANTMESES = 12
            )
            THEN --SIG 78118
            V_VALORTOTAL := V_VALORTOTAL + V_VALORACAOJUDICIAL;
        END IF;
        V_VALORTOTAL := V_VALORTOTAL + v_VALOREXSASSE;--SIG 24838
        -- Fim SIG 25208 Osni Cavalcanti

        IF (((TO_CHAR(V_DATAINICIO,'YYYY/MM') > IN_MESREFERENCIA
            OR
            NVL(TO_CHAR(V_DATAFINAL,'YYYY/MM'), IN_MESREFERENCIA) < IN_MESREFERENCIA)
            AND
            (
                SUBSTR(IN_MESREFERENCIA,6,2) <> '13'
            )
            )
            OR
            (
                (

                    TO_CHAR(V_DATAINICIO,'YYYY') > SUBSTR(IN_MESREFERENCIA,1,4)
                    OR
                    NVL(TO_CHAR(V_DATAFINAL,'YYYY'), SUBSTR(IN_MESREFERENCIA,1,4)) < SUBSTR(IN_MESREFERENCIA,1,4)
                )
                AND
                (
                    SUBSTR(IN_MESREFERENCIA,6,2) = '13'
                )
            )
            ) THEN
            V_VALORTOTAL := 0;

        END IF;
        -- SOL 268819 - Tiago Von  - INICIO
        --VERIFICA HIST?ICO DE PERCENTUAL DE GRUPO FAMILIAR-----------------
        -- SIG 32991 Tiago Von Inicio
        -- IF IN_IDPESSOA <> IN_IDTITULAR AND IN_IDPREPAROBENEF IN (-14, -5) THEN
        IF IN_IDPESSOA <> IN_IDTITULAR
            AND
            (
                IN_IDPREPAROBENEF IN (-14, -5) 
                OR
                IN_IDPREPAROBENEF > 0

            )
            THEN -- SIG 32991 Tiago Von FIM                        
            IF SUBSTR(IN_MESREFERENCIA, 6, 2) = '13' THEN
                SELECT
                       NVL(SUM(HPG.PERCENTUAL *
                              (
                                            (
                                                          (
                                                                 /* INÍCIO AJUSTE SOL 269035 - JOÃO RICARDO*/
                                                                 CASE
                                                                        WHEN (

                                                                                      TO_CHAR(HPG.DATAFIM, 'YYYY') > SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                                      OR HPG.DATAFIM         IS NULL
                                                                               )
                                                                               THEN 12
                                                                               ELSE
                                                                               CASE
                                                                                      WHEN TO_CHAR(HPG.DATAFIM, 'DD') < '15'
                                                                                             THEN TO_NUMBER(TO_CHAR(HPG.DATAFIM, 'MM')) - 1
                                                                                             ELSE TO_NUMBER(TO_CHAR(NVL(HPG.DATAFIM,'31/12/'
                                                                                                    || SUBSTR(IN_MESREFERENCIA, 0, 4)),'MM'))
                                                                               END

                                                                 END
                                                                 /* TÉRMINO AJUSTE SOL 269035 - JOÃO RICARDO*/
                                                                 -
                                                                 CASE
                                                                        WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') < SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                               THEN 1
                                                                        WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') = SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                               THEN
                                                                               CASE
                                                                                      WHEN TO_CHAR(HPG.DATAINICIO, 'DD') >= 16
                                                                                             THEN TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM')) + 1

                                                                                             ELSE TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM'))
                                                                               END
                                                                 END
                                                          )
                                                   + 1
                                            )
                                     / 12
                              )
                       ) ,0)
                INTO
                       V_PERCGRUPOFAMILIAR

                FROM
                       HSTPERCGRUPO HPG
                WHERE
                       HPG.IDPLANOPREV        = IN_IDPLANOPREV
                       AND HPG.IDBENEFICIO    = IN_IDBENEFICIO
                       AND HPG.NUMEROPROCESSO = IN_NUMEROPROCESSO
                       AND HPG.IDPESSJUR      = IN_IDPESSJUR
                       AND HPG.IDTITULAR      = IN_IDTITULAR
                       AND HPG.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                       AND HPG.IDPESSOA       = IN_IDPESSOA
                       AND HPG.SEQPROPOSTA    = IN_SEQPROPOSTA

                       /* INÍCIO AJUSTE SOL 269035 - JOÃO RICARDO*/
                       AND TO_CHAR(HPG.DATAINICIO, 'YYYY') <= SUBSTR(IN_MESREFERENCIA, 0, 4)
                       AND
                       (
                              TO_CHAR(HPG.DATAFIM, 'YYYY') >= SUBSTR(IN_MESREFERENCIA, 0, 4)
                              OR HPG.DATAFIM          IS NULL
                       )
                ;
                
                /* TÉRMINO AJUSTE SOL 269035 - JOÃO RICARDO*/
            ELSE

                SELECT
                       100 - ABS(100 - SUM(HPG.PERCENTUAL * -- SIG 51618 - Tiago Von
                       (((DECODE(LEAST(NVL(HPG.DATAFIM ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM')) ,30 ,EXTRACT(DAY FROM LEAST(NVL(HPG.DATAFIM ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))))) - EXTRACT(DAY FROM GREATEST
                              (-- HPG.DATAINICIO -- SIG 49861 Tiago Von - inicio
                                     Case
                                            when (
                                                          extract(day from (hpg.datainicio))=31
                                                   )
                                                   then Hpg.datainicio-1
                                                   else Hpg.datainicio
                                     end -- SIG 49861 Tiago Von - FIM

                                     ,('01'
                                            || SUBSTR(IN_MESREFERENCIA, 5, 3))
                                            || '/'
                                            || SUBSTR(IN_MESREFERENCIA, 0, 4)
                              )
                       )) + 1) / 30)))
                INTO
                       V_PERCGRUPOFAMILIAR
                FROM
                       HSTPERCGRUPO HPG
                WHERE

                       HPG.IDPLANOPREV                         = IN_IDPLANOPREV
                       AND HPG.IDBENEFICIO                     = IN_IDBENEFICIO
                       AND HPG.NUMEROPROCESSO                  = IN_NUMEROPROCESSO
                       AND HPG.IDPESSJUR                       = IN_IDPESSJUR
                       AND HPG.IDTITULAR                       = IN_IDTITULAR
                       AND HPG.IDPLANOORIGEM                   = IN_IDPLANOORIGEM
                       AND HPG.IDPESSOA                        = IN_IDPESSOA
                       AND HPG.SEQPROPOSTA                     = IN_SEQPROPOSTA
                       AND TO_CHAR(HPG.DATAINICIO, 'YYYY/MM') <= IN_MESREFERENCIA
                       AND
                       (

                              TO_CHAR(HPG.DATAFIM, 'YYYY/MM') >= IN_MESREFERENCIA
                              OR HPG.DATAFIM             IS NULL
                       )
                ;
            
            END IF;
            
            /* WO11898 INICIO*/ 
            IF (NVL(V_PERCGRUPOFAMILIAR, 0) = 0) AND (IN_IDPREPAROBENEF IN (-14) AND V_SITBENEFICIO = 3) THEN  
               V_PERCGRUPOFAMILIAR := IN_PERCGRUPO;            
            END IF;
            /* WO11898 FIM*/ 
            
        ELSE
            V_PERCGRUPOFAMILIAR := IN_PERCGRUPO;
        END IF; -- SOL 268819 - Tiago Von  - FIM
        /* INÍCIO SOL 263095 - JOÃO RICARDO*/
        IF NVL(V_PERCGRUPOFAMILIAR, 0) = 0

            AND
            V_IDTPPAGTOBENEFIC = 2 THEN
            V_PERCGRUPOFAMILIAR := IN_PERCGRUPO;
        END IF;
        /* T?INO SOL 263095 - JOÃO RICARDO */
        --INÍCIO DO IF PARA VERIFICA?ES DE INCONSISTÊNCIAS------------------
        IF (V_IDCONTRIBUICAO IS NULL) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA

                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )

                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA

                            , V_IDCONTRIBUICAO
                                     ||' - TAXA NÃO PARAMETRIZADA'
                            , V_IDUSUARIO
                       )
                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV

                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (

                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR

                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - TAXA NÃO PARAMETRIZADA.'
                       )
                ;
            
            END IF;
        ELSIF (V_FLGDEFICIT = 1

            AND
            IN_FLG_TIPO_TAXA = 1) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR

                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO

                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - TAXA DE EQUACIONAMENTO DE D?ICIT NÃO PODE SER EXECUTADA POR ESSA PROCEDURE.'
                            , V_IDUSUARIO
                       )
                ;

            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM

                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO

                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO

                              ||' - TAXA DE EQUACIONAMENTO DE D?ICIT NÃO PODE SER EXECUTADA POR ESSA PROCEDURE.'
                       )
                ;
            
            END IF;
        ELSIF (V_FLGDEFICIT IS NULL
            AND
            IN_FLG_TIPO_TAXA = 2) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA

                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO

                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA

                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - TAXA ADMINISTRATIVA NÃO PODE SER EXECUTADA POR ESSA PROCEDURE.'
                            , V_IDUSUARIO
                       )
                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF

                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES

                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO

                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - TAXA ADMINISTRATIVA NÃO PODE SER EXECUTADA POR ESSA PROCEDURE.'
                       )
                ;
            
            END IF;

        ELSIF (V_FLGDEFICIT IS NULL) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM

                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO

                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - TIPO DE CONTRIBUIÇÃO NÃO INFORMADO.'
                            , V_IDUSUARIO
                       )
                ;
            

            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA

                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )

                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - TIPO DE CONTRIBUIÇÃO NÃO INFORMADO.'

                       )
                ;
            
            END IF;
        ELSIF (V_FLGVERIFICACONTRIB = 0) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO

                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL

                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - TAXA NÃO CADASTRADA OU NÃO MARCADA PARA COBRANÇA'

                            , V_IDUSUARIO
                       )
                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO

                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT

                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM

                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - TAXA NÃO CADASTRADA OU NÃO MARCADA PARA COBRANÇA.'
                       )
                ;
            
            END IF;
            -- SOL 268819 - Tiago Von - Alteração das variáveis de verificação do % de Grupo Familiar
        ELSIF ((V_PERCGRUPOFAMILIAR = 0
                OR
                V_PERCGRUPOFAMILIAR IS NULL)
                AND                        
            IN_IDPESSOA <> IN_IDTITULAR) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR

                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV

                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - PENSIONISTA COM PERCENTUAL DE GRUPO FAMILIAR IGUAL A ZERO'
                            , V_IDUSUARIO
                       )

                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR

                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM

                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA

                     , V_IDCONTRIBUICAO
                              ||' - PENSIONISTA COM PERCENTUAL DE GRUPO FAMILIAR IGUAL A ZERO.'
                       )
                ;
            
            END IF;
        ELSIF (SUBSTR(IN_MESREFERENCIA, 6, 2) = '13'
            AND
            IN_FLGTIPOREGISTRO NOT IN (1, 2)) THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA

                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES

                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM

                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - LANÇAMENTO DA ABONO NÃO IDENTIFICADO COMO ABONO OU ANTECIPAÇÃO DE ABONO'
                            , V_IDUSUARIO
                       )
                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO

                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )

                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO

                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - LANÇAMENTO DA ABONO NÃO IDENTIFICADO COMO ABONO OU ANTECIPAÇÃO DE ABONO.'
                       )
                ;
            

            END IF;
            /*Ajuste  - Equacionamento para considerar corretamente o perfil da contribução e
            realizar os acertos aps data de encerramento.*/
        ELSIF (((TO_CHAR(V_DATAINICIO,'YYYY/MM') > IN_MESREFERENCIA
            OR
            (
                NVL(TO_CHAR(V_DATAFINAL,'YYYY/MM'), IN_MESREFERENCIA) < IN_MESREFERENCIA
                AND
                IN_IDPREPAROBENEF <> -4
            )
            )

            AND
            (
                SUBSTR(IN_MESREFERENCIA,6,2) <> '13'
            )
            )
            OR
            (
                (
                    TO_CHAR(V_DATAINICIO,'YYYY') > SUBSTR(IN_MESREFERENCIA,1,4)
                    OR
                    (

                        NVL(TO_CHAR(V_DATAFINAL,'YYYY'), SUBSTR(IN_MESREFERENCIA,1,4)) < SUBSTR(IN_MESREFERENCIA,1,4)
                        AND
                        IN_IDPREPAROBENEF <> -4
                    )
                )
                AND
                (
                    SUBSTR(IN_MESREFERENCIA,6,2) = '13'
                )
            )
            ) THEN

            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA

                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL
                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR

                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - CONTRIBUIÇÃO FORA DA FAIXA ENTRE DATA INÍCIO E DATA FIM.'
                            , V_IDUSUARIO
                       )
                ;
            
            ELSE

                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA

                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1
                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF

                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA
                     , IN_SEQPROPOSTA
                     ,'CONTRIBUIÇÃO FORA DA FAIXA ENTRE DATA INÍCIO E DATA FIM.'
                       )
                ;

            
            END IF;
            --INÍCIO SIG 61482 - PARTICIPANTE COM RUBRICA DE EX-SASSE DUPLICADA
        ELSIF v_VALOREXSASSE              = -1 THEN
            IF NVL(IN_IDPREPAROBENEF, 0) <= 0 THEN
                INSERT INTO LOGPREPAROTAXA
                       (IDLOGPREPAROTAXA
                            , IDPREPAROTAXA
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO

                            , IDPESSJUR
                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                            , TRGUSERINCLUSAO
                       )
                       VALUES
                       (SEQLOGPREPAROTAXA.NEXTVAL
                            , NULL

                            , IN_IDPLANOPREV
                            , IN_IDBENEFICIO
                            , IN_NUMEROPROCESSO
                            , IN_IDPESSJUR
                            , IN_IDTITULAR
                            , IN_IDPLANOORIGEM
                            , IN_IDPESSOA
                            , IN_SEQPROPOSTA
                            , V_IDCONTRIBUICAO
                                     ||' - PARTICIPANTE COM RUBRICA EX-SASSE DUPLICADA.'
                            , V_IDUSUARIO

                       )
                ;
            
            ELSE
                INSERT INTO LOGPREPARO
                       (IDLOGPREPARO
                            , IDPREPAROBENEF
                            , IDPLANOPREV
                            , IDBENEFICIO
                            , NUMEROPROCESSO
                            , IDPESSJUR

                            , IDTITULAR
                            , IDPLANOORIGEM
                            , IDPESSOA
                            , SEQPROPOSTA
                            , OBSERVACOES
                       )
                       VALUES
                       (
                       (
                              SELECT
                                     NVL(MAX(IDLOGPREPARO), 0) + 1

                              FROM
                                     LOGPREPARO
                       )
                     , IN_IDPREPAROBENEF
                     , IN_IDPLANOPREV
                     , IN_IDBENEFICIO
                     , IN_NUMEROPROCESSO
                     , IN_IDPESSJUR
                     , IN_IDTITULAR
                     , IN_IDPLANOORIGEM
                     , IN_IDPESSOA

                     , IN_SEQPROPOSTA
                     , V_IDCONTRIBUICAO
                              ||' - PARTICIPANTE COM RUBRICA EX-SASSE DUPLICADA.'
                       )
                ;
            
            END IF;
            --TÉRMINO SIG 61482 - PARTICIPANTE COM RUBRICA DE EX-SASSE DUPLICADA
            --INÍCIO DA CONDI?O QUE EFETUA O C?CULO DA TAXA--------------------
        ELSE
            ---------C?CULO DO PERCENTUAL E PARCELA A DEDUZIR-------------------

            V_PERCCONTRIB    := 0;
            V_PARCELADEDUZIR := 0;
            SELECT
                   DECODE(CP.FLGPAGADOR,'C',1,'P',0,NULL)
            INTO
                   V_FLGPART
            FROM
                   CONTPREV CP
            WHERE
                   CP.IDCONTRIBUICAO  = V_IDCONTRIBUICAO
                   AND CP.IDPLANOPREV = IN_IDPLANOPREV

            ;
            
            --Inicio SIG 66599
            SELECT
                   COUNT(*)
            INTO
                   V_PARAM231
            FROM
                   PESSOAPARAM P
            WHERE
                   P.IDPESSOA               = IN_IDPESSOA

                   AND P.IDPARAM            = 231
                   AND TRIM(UPPER(P.VALOR)) = 'S'
            ;
            
            IF (V_PARAM231>0
                AND
                IN_IDCONTRIBUICAO=259) THEN
                V_PERCCONTRIB   :=0;
                V_PARCELADEDUZIR:=0;
            ELSE
                CM.SP_CP_BUSCA_PERC_CONTRIB(V_FLGDEFICIT, V_IDCONTRIBUICAO, IN_IDPESSJUR, IN_IDPLANPREVCONTAB, V_VALORTOTAL, IN_MESREFERENCIA, IN_ACAOJUDICIALREG, V_FLGPART, 'AS', IN_IDPLANOPREV, IN_IDPESSOA, IN_IDTITULAR, IN_SEQPROPOSTA, V_IDNUCLEOFAMILIAR, V_PERCCONTRIB, V_PARCELADEDUZIR, V_DESCONTO_FOLHA_BENEF); -- SIG 80906  JOÃO RICARDO

            END IF;
            --Fim SIG 66599
            ---------CALCULO DA TAXA REFERENTE A A?O JUDICIAL-------------------
            IF ((IN_IDTITULAR <> IN_IDPESSOA
                AND
                IN_PERCGRUPO <> 100
                AND
                IN_IDPLANPREVCONTAB = 2
                AND
                V_VALORACAOJUDICIAL <> 0 )
                OR

                V_QUANTMESES <> 12) THEN                                                                                                                                                                                                                                                                                                    --SIG78118
                CM.SP_CP_BUSCA_PERC_CONTRIB(V_FLGDEFICIT, V_IDCONTRIBUICAO, IN_IDPESSJUR, IN_IDPLANPREVCONTAB, V_VALORACAOJUDICIAL, IN_MESREFERENCIA, IN_ACAOJUDICIALREG, V_FLGPART, 'AS', IN_IDPLANOPREV, IN_IDPESSOA, IN_IDTITULAR, IN_SEQPROPOSTA, V_IDNUCLEOFAMILIAR, V_PERCCONTRIBACAO, V_PARCELADEDUZIRACAO, V_DESCONTO_FOLHA_BENEF); -- SIG 80906  JOÃO RICARDO
                V_VALORCONTRIBUICAOACAO :=
                /*TRUNC(*/
                ((V_VALORACAOJUDICIAL * V_PERCCONTRIBACAO) -
                V_PARCELADEDUZIRACAO)
                /* *(IN_PERCGRUPO / 100) SOL 270182 JOÃO RICARDO. O percentual da a? NÃOrateia para dependente.*/
                /*,2)*/
                ;
                /*INÍCIO AJUSTE SOL 270299  - JOÃO RICARDO - NÃO REALIZA O RATEIO DE A?O JUDICIAL. O VALOR DEVE SER INTEGRAL PARA QUEM POSSUI A A?O.*/
                -- SIG 57339 Tiago Von INICIO

                -- ELSIF NVL(V_VALORACAOJUDICIAL,0) > 0 AND IN_PERCGRUPO <> 100 THEN
                --    V_VALORCONTRIBUICAOACAO := ((V_VALORACAOJUDICIAL * V_PERCCONTRIB) - V_PARCELADEDUZIR);
            ELSIF NVL(V_VALORACAOJUDICIAL,0) > 0 THEN
                V_VALORCONTRIBUICAOACAO := ((V_VALORACAOJUDICIAL * V_PERCCONTRIB));
                -- SIG 57339 Tiago Von FIM
            ELSE
                V_VALORCONTRIBUICAOACAO := 0;
            END IF;
            ---------C?CULO DO VALOR DA CONTRIBUIÇÃO----------------------------
            IF NVL(V_VALORACAOJUDICIAL,0) > 0
                AND

                IN_PERCGRUPO <> 100
                AND
                IN_IDPLANPREVCONTAB <> 2
                AND
                NVL(V_FLGDEFICIT,0) = 0 THEN
                V_VALORCONTRIBUICAO := ((IN_VALORTOTAL * V_PERCCONTRIB) - V_PARCELADEDUZIR);
            ELSE
                V_VALORCONTRIBUICAO := ((V_VALORTOTAL * V_PERCCONTRIB) - V_PARCELADEDUZIR);
            END IF;
            /*TÉRMINO DO AJUSTE SOL 2799  - JOÃO RICARDO */
            /* SIG 24838

            IF V_IDTPCONTRIBUICAO = 1 THEN
            V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO;
            ELS*/
            IF V_IDTPPAGTOBENEFIC = 2
                OR
                (
                    V_FLGRESGATE = 1
                    AND
                    V_IDTPPAGTOBENEFIC = 1
                )
                THEN

                /* INÍCIO ALTERAÇÃO SOL 269035 */
                IF IN_IDPREPAROBENEF IN (-14)
                    AND
                    V_IDTPPAGTOBENEFIC = 2 THEN
                    V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * (IN_PERCGRUPO / 100);
                ELSE
                    V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO;
                END IF;
                /* C?IGO ORIGINAL MODIFICADO PELO SOL 269035
                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO;*/
                /* TÉRMINO ALTERAÇÃO SOL 269035 */

            ELSE
                /*IF V_DESC_LOTE LIKE 'Benef?os Concedidos%' THEN
                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO*(IN_PERCGRUPO/100)*(V_QUANTMESES/12)*(V_QUANTDIASINICIO/30);
                ELSE
                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO*(IN_PERCGRUPO/100)*(V_QUANTMESES/12);
                END IF;*/
                IF IN_IDPREPAROBENEF = -6 THEN
                    V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * (IN_PERCGRUPO / 100) * (V_QUANTMESES / 12) * (V_QUANTDIASINICIO / 30);
                    -- SIG 32991 Tiago Von INICIO
                    -- ELSIF IN_IDPREPAROBENEF IN (-14, -5) THEN
                ELSIF (IN_IDPREPAROBENEF IN (-14, -5)

                    OR
                    IN_IDPREPAROBENEF > 0) THEN -- SIG 32991 Tiago Von FIM
                    IF SUBSTR(IN_MESREFERENCIA, 6, 2) = 13 THEN
                        --V_PERCGRUPOFAMILIAR := IN_PERCGRUPO;
                        SELECT
                               NVL(SUM(HPG.PERCENTUAL *
                                      (
                                                    (
                                                                  (
                                                                         /*INÍCIO AJUSTE SOL 246953 - JOÃO RICARDO */
                                                                         CASE

                                                                                WHEN (
                                                                                              TO_CHAR(HPG.DATAFIM, 'YYYY') > SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                                              OR HPG.DATAFIM         IS NULL
                                                                                       )
                                                                                       THEN 12
                                                                                       ELSE
                                                                                       CASE
                                                                                              WHEN TO_CHAR(HPG.DATAFIM, 'DD') < '15'
                                                                                                     THEN TO_NUMBER(TO_CHAR(HPG.DATAFIM, 'MM')) - 1
                                                                                                     ELSE TO_NUMBER(TO_CHAR(NVL(HPG.DATAFIM,'31/12/'
                                                                                                            || SUBSTR(IN_MESREFERENCIA, 0, 4)),'MM'))

                                                                                       END
                                                                         END
                                                                         /*TÉRMINO AJUSTE SOL 246953 - JOÃO RICARDO */
                                                                         -
                                                                         CASE
                                                                                WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') < SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                                       THEN 1
                                                                                WHEN TO_CHAR(HPG.DATAINICIO, 'YYYY') = SUBSTR(IN_MESREFERENCIA, 0, 4)
                                                                                       THEN
                                                                                       CASE
                                                                                              WHEN TO_CHAR(HPG.DATAINICIO, 'DD') >= 16

                                                                                                     THEN TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM')) + 1
                                                                                                     ELSE TO_NUMBER(TO_CHAR(HPG.DATAINICIO, 'MM'))
                                                                                       END
                                                                         END
                                                                  )
                                                           + 1
                                                    )
                                             / 12
                                      )
                               ) ,0)
                        INTO

                               V_PERCGRUPOFAMILIAR
                        FROM
                               HSTPERCGRUPO HPG
                        WHERE
                               HPG.IDPLANOPREV        = IN_IDPLANOPREV
                               AND HPG.IDBENEFICIO    = IN_IDBENEFICIO
                               AND HPG.NUMEROPROCESSO = IN_NUMEROPROCESSO
                               AND HPG.IDPESSJUR      = IN_IDPESSJUR
                               AND HPG.IDTITULAR      = IN_IDTITULAR
                               AND HPG.IDPLANOORIGEM  = IN_IDPLANOORIGEM
                               AND HPG.IDPESSOA       = IN_IDPESSOA

                               AND HPG.SEQPROPOSTA    = IN_SEQPROPOSTA
                               /*INÍCIO DO AJUSTE SOL 269035- JOÃO RICARDO*/
                               /*
                               AND (TO_CHAR(HPG.DATAFIM, 'YYYY') =
                               SUBSTR(IN_MESREFERENCIA, 0, 4) OR
                               HPG.DATAFIM IS NULL);
                               */
                               AND TO_CHAR(HPG.DATAINICIO, 'YYYY') <= SUBSTR(IN_MESREFERENCIA, 0, 4)
                               AND
                               (
                                      TO_CHAR(HPG.DATAFIM, 'YYYY') >= SUBSTR(IN_MESREFERENCIA, 0, 4)

                                      OR HPG.DATAFIM          IS NULL
                               )
                        ;
                        
                        /*TÉRMINO DO  AJUSTE SOL 269035- JOÃO RICARDO*/
                    ELSE
                        SELECT
                               100 - ABS(100 - SUM(HPG.PERCENTUAL * -- SIG 51618 - Tiago Von
                               (((DECODE(LEAST(NVL(HPG.DATAFIM ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM')) ,30 ,EXTRACT(DAY FROM LEAST(NVL(HPG.DATAFIM ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))) ,LAST_DAY(TO_DATE(IN_MESREFERENCIA ,'YYYY/MM'))))) - EXTRACT(DAY FROM GREATEST
                                      (-- HPG.DATAINICIO -- SIG 49861 Tiago Von - inicio
                                             Case

                                                    when (
                                                                  extract(day from (hpg.datainicio))=31
                                                           )
                                                           then Hpg.datainicio-1
                                                           else Hpg.datainicio
                                             end -- SIG 49861 Tiago Von - FIM
                                             ,('01'
                                                    || SUBSTR(IN_MESREFERENCIA ,5 ,3))
                                                    || '/'
                                                    || SUBSTR(IN_MESREFERENCIA ,0 ,4)
                                      )

                               )) + 1) / 30)))
                        INTO
                               V_PERCGRUPOFAMILIAR
                        FROM
                               HSTPERCGRUPO HPG
                        WHERE
                               HPG.IDPLANOPREV                         = IN_IDPLANOPREV
                               AND HPG.IDBENEFICIO                     = IN_IDBENEFICIO
                               AND HPG.NUMEROPROCESSO                  = IN_NUMEROPROCESSO
                               AND HPG.IDPESSJUR                       = IN_IDPESSJUR
                               AND HPG.IDTITULAR                       = IN_IDTITULAR

                               AND HPG.IDPLANOORIGEM                   = IN_IDPLANOORIGEM
                               AND HPG.IDPESSOA                        = IN_IDPESSOA
                               AND HPG.SEQPROPOSTA                     = IN_SEQPROPOSTA
                               AND TO_CHAR(HPG.DATAINICIO, 'YYYY/MM') <= IN_MESREFERENCIA
                               AND
                               (
                                      TO_CHAR(HPG.DATAFIM, 'YYYY/MM') >= IN_MESREFERENCIA
                                      OR HPG.DATAFIM             IS NULL
                               )
                        ;
                    

                    END IF;
                    IF V_PERCGRUPOFAMILIAR IS NULL
                        OR
                        IN_IDPESSOA = IN_IDTITULAR THEN
                        V_PERCGRUPOFAMILIAR := IN_PERCGRUPO;
                        V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * (V_PERCGRUPOFAMILIAR / 100) * (V_QUANTMESES / 12) * (V_QUANTDIASINICIO / 30);
                    ELSE
                        V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * (V_PERCGRUPOFAMILIAR / 100)
                        /**(V_QUANTMESES/12)*/
                        ;
                    END IF;

                ELSE
                    V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * (IN_PERCGRUPO / 100) * (V_QUANTMESES / 12);
                END IF;
            END IF;
            IF (IN_IDPESSOA<>IN_IDTITULAR
                AND
                V_PERCGRUPOFAMILIAR<>100
                and
                IN_IDUSUARIO LIKE 'CJ%'
                AND
                V_QUANTMESES=12) THEN --Rafael SIG91981

                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO + V_VALORCONTRIBUICAOACAO;
            END IF;
            -- SIG 58168 - Tiago Von - INICIO
            --   V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO +
            --                          V_VALORCONTRIBUICAOACAO;
            -- SIG 58168 - Tiago Von - FIM
            --INÍCIO ajuste SIG 21659
            --INÍCIO SIG 78118
            IF V_QUANTMESES <> 12 THEN
                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO + V_VALORCONTRIBUICAOACAO;
            END IF;

            --Fim SIG 78118
            IF
                /* NVL(V_IDTPCONTRIBUICAO,0) = 0 AND -- SIG 38968 - JOÃO RICARDO. O sistema deve considerar todas as contribui?s no c?ulo da antecipa? do abono.*/
                (IN_IDPREPAROBENEF IN (-5, -6, -12) -- SIG 33083 Tiago Von || NÃOaplicar antecipa? do abono em (Revis?e Revers? -- Andre Imakawa - SIG 121019
                OR
                IN_IDPREPAROBENEF IS NULL -- SIG 35271
                OR
                IN_IDPREPAROBENEF > 0) THEN
                /* SIG 38330 - JOÃO RICARDO. Inclu? valida? para considerar par?tros de entrada da Folha de Benef?os, neste caso sempre valores maiores que zero.
                Lembrando que o tratamento de m?de abono ocorre ao alimentar a vari?e V_PERCANTECABONO.*/
                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO * V_PERCANTECABONO;

            END IF;
            --T?ino ajuste SIG 21659
            IF (IN_TIPOOPERACAO = 0
                OR
                IN_IDPREPAROBENEF IN( -16, -12))  -- Andre Imakawa - SIG 121019
                AND
                IN_FLGTIPOREGISTRO = 1 THEN--SIG 33727
                --            IF IN_TIPOOPERACAO = 0 AND IN_FLGTIPOREGISTRO = 1 THEN --SIG 33727
                SELECT
                       IDMOTIVODEVOLUC
                INTO

                       V_IDMOTIVODEVOLUCABONO
                FROM
                       PARAMAPREV
                ;
                
                DELETE
                FROM
                       HSTCONTRIBPREV HC
                WHERE
                       HC.SITRECEBIMENTO          = 0
                       AND HC.FLGDEVOLUCAO        = 1

                       AND HC.VALORRECEBIDO IS NULL
                       AND HC.MESREFERENCIA       = SUBSTR(V_MESCOBRANCA, 0, 4)
                              || '/13'
                       AND HC.MESCOBRANCA = V_MESCOBRANCA
                       AND HC.IDPESSOA    = IN_IDPESSOA
                       /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                       AND HC.IDTITULAR      = IN_IDTITULAR
                       AND HC.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                ;
                
                INSERT INTO HSTCONTRIBPREV

                       (MESREFERENCIA
                            , MESCOBRANCA
                            , NUMRECEBIMENTO
                            , IDMOTIVO
                            , IDPESSOA
                            , IDRETROATIVO
                            , VALORESPERADO
                            , IDPLANOPREV
                            , IDPLANPREVCONTAB --Osni 13/10/2016
                            , IDREGRAALIMRESER
                            , IDREGRACALCULO

                            , DATARECEBIMENTO
                            , IDCONTRIBUICAO
                            , VALORRECEBIDO
                            , QUANTCOTAS
                            , DATAPREVISAORECE
                            , CODPORTFORMA
                            , PLNCODIGOPREV
                            , VALORBASE1
                            , CODDOCUMENTOPREV
                            , PLNCODIGOEFET
                            , CODDOCUMENTOEFET

                            , VALORBASE2
                            , FLGCALCRESERVA
                            , VALORCALCULADO
                            , VALOROP1
                            , VALOROP2
                            , VALOROP3
                            , FLGDESCFOLHA
                            , CODREFERENCIA
                            , FATOR
                            , DATAINICIO
                            , DATAFINAL

                            , IDHISTPROPOSTA
                            , FLGSITFUNDACAO
                            , IDLOTE
                            , SITRECEBIMENTO
                            , TIPO
                            , PARCELA
                            , SEQPROPOSTA
                            , VLRTOTRETROATIVO
                            , VLRDIFRETROATIVO
                            , FLGAPORTE
                            , DTCOBRANCA

                            , FLGDEVOLUCAO
                            , FLGDIVERGENTE
                            , FLGCONCESSAO
                            , FLGEVENTO
                            , FONTEPAGADORA
                            , TRGDTINCLUSAO
                            , TRGUSERINCLUSAO
                            , DATAULTALIM
                            , PERCRESERVA
                            , IDPESSJUR
                            , DATAEMISSCOB

                            , MOTIVOCANCEL
                            , FLGINTEVENTO
                            , DATACANCELAMENTO
                            , FLGDATAINDRESERV
                            , NUMRECPARCELA1
                            , NUMRECPARCELA2
                            , IDLANCIRRF
                            , OPTRATDIVERG
                            , PERCCALCULO
                            , VALORPARARESERVA
                            , FLGMANUAL

                            , FOLHAORIGEM
                            , IDPARCELAMENTO
                            , IDMOVBENEF
                            , IDTIPORECURSO
                            , ORIGEMRECURSO
                            , IDTITULAR
                            , CODDOCUMENTOPGAPAGAR
                            , CODDOCUMENTOPGARECEBER
                            , IDPORTABILIDADE
                            , SALCONTRIB
                            , TRGDTALTERACAO

                            , TRGUSERALTERACAO
                            , IDRUBRICA
                            , NUMBANCO
                            , NUMAGENCIA
                            , CONTACORRENTE
                            , PLNCODIGO
                            , IDCONTRATOEMPTMO
                            , FLGIMPORTADO
                            , USERINTEGRACAO
                            , DTINTEGRACAO
                            , FLGENVIOEMAIL

                            , DTAENVIOEMAIL
                       )
                SELECT
                       HC.MESREFERENCIA
                     , V_MESCOBRANCA             MESCOBRANCA
                     , SEQHSTCONTRIBPREV.NEXTVAL NUMRECEBIMENTO
                     , V_IDMOTIVODEVOLUCABONO    IDMOTIVO
                     , HC.IDPESSOA
                     , HC.IDRETROATIVO
                     , HC.VALORESPERADO
                     , HC.IDPLANOPREV

                     , V_IDPLANPREVCONTAB --Osni 13/10/2016
                     , HC.IDREGRAALIMRESER
                     , HC.IDREGRACALCULO
                     , NULL DATARECEBIMENTO
                     , HC.IDCONTRIBUICAO
                     , NULL VALORRECEBIDO
                     , HC.QUANTCOTAS
                     , V_DATAPAGAMENTO DATAPREVISAORECE
                     , HC.CODPORTFORMA
                     , HC.PLNCODIGOPREV
                     , NVL(HC.VALORBASE1,nvl(V_PERCCONTRIB,0)*100)

                       /*,HC.VALORBASE1*/
                       --Rafael SIG 56914 , 67318
                     , NULL CODDOCUMENTOPREV --SIG 67318
                     , HC.PLNCODIGOEFET
                     , HC.CODDOCUMENTOEFET
                     , HC.VALORBASE2
                     , HC.FLGCALCRESERVA
                     , HC.VALORCALCULADO
                     , NVL(HC.VALORBASE1,nvl(V_PERCCONTRIB,0)*100)
                       /*,HC.VALORBASE1*/
                       --Rafael SIG 56914, 67318

                     , IN_IDBENEFICIO VALOROP2
                     , IN_IDPESSOA    VALOROP3
                       -- SIG 80906 JOÃO RICARDO - INÍCIO
                     , CASE
                              WHEN V_DESCONTO_FOLHA_BENEF = 0
                                     THEN 0
                                     ELSE HC.FLGDESCFOLHA
                       END
                       --,HC.FLGDESCFOLHA
                       -- SIG 80906 JOÃO RICARDO - TÉRMINO
                     , HC.CODREFERENCIA

                     , HC.FATOR
                     , HC.DATAINICIO
                     , HC.DATAFINAL
                     , HC.IDHISTPROPOSTA
                     , HC.FLGSITFUNDACAO
                     , IN_IDLOTE
                     , 0 SITRECEBIMENTO
                     , HC.TIPO
                     , HC.PARCELA
                     , HC.SEQPROPOSTA
                     , HC.VLRTOTRETROATIVO

                     , HC.VLRDIFRETROATIVO
                     , HC.FLGAPORTE
                     , HC.DTCOBRANCA
                     , DECODE(HC.FLGDEVOLUCAO, 0, 1, 1, 0) FLGDEVOLUCAO
                     , HC.FLGDIVERGENTE
                     , DECODE(IN_IDPREPAROBENEF,-12,1,-16,HC.FLGCONCESSAO,HC.FLGCONCESSAO)  -- Andre Imakawa - SIG 121019
                     , HC.FLGEVENTO
                     , HC.FONTEPAGADORA
                     , SYSDATE     TRGDTINCLUSAO
                     , V_IDUSUARIO TRGUSERINCLUSAO
                     , HC.DATAULTALIM

                     , HC.PERCRESERVA
                     , HC.IDPESSJUR
                     , HC.DATAEMISSCOB
                     , HC.MOTIVOCANCEL
                     , HC.FLGINTEVENTO
                     , HC.DATACANCELAMENTO
                     , HC.FLGDATAINDRESERV
                     , HC.NUMRECPARCELA1
                     , HC.NUMRECPARCELA2
                     , HC.IDLANCIRRF
                     , HC.OPTRATDIVERG

                     , HC.PERCCALCULO
                     , HC.VALORPARARESERVA
                     , HC.FLGMANUAL
                     , HC.FOLHAORIGEM
                     , HC.IDPARCELAMENTO
                     , HC.IDMOVBENEF
                     , HC.IDTIPORECURSO
                     , HC.ORIGEMRECURSO
                     , HC.IDTITULAR
                     , HC.CODDOCUMENTOPGAPAGAR
                     , HC.CODDOCUMENTOPGARECEBER

                     , HC.IDPORTABILIDADE
                     , HC.SALCONTRIB
                     , NULL TRGDTALTERACAO
                     , NULL TRGUSERALTERACAO
                     , HC.IDRUBRICA
                     , HC.NUMBANCO
                     , HC.NUMAGENCIA
                     , HC.CONTACORRENTE
                     , HC.PLNCODIGO
                     , HC.IDCONTRATOEMPTMO
                     , HC.FLGIMPORTADO

                     , HC.USERINTEGRACAO
                     , HC.DTINTEGRACAO
                     , HC.FLGENVIOEMAIL
                     , HC.DTAENVIOEMAIL
                FROM
                       HSTCONTRIBPREV HC
                WHERE
                       HC.SITRECEBIMENTO    = 2
                       AND (
                       ( IN_IDPREPAROBENEF <> -12 AND (HC.MESREFERENCIA = SUBSTR(V_MESCOBRANCA, 0, 4) || '/13'))
                       OR 
					   ( IN_IDPREPAROBENEF = -12 AND (HC.MESREFERENCIA = SUBSTR(IN_MESREFERENCIA, 0, 4) || '/13'))
                       )
                       AND HC.MESCOBRANCA < V_MESCOBRANCA

                       AND HC.IDPESSOA    = IN_IDPESSOA
                       /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                       AND HC.IDTITULAR      = IN_IDTITULAR
                       AND HC.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                ;
                
                BEGIN
                    SELECT
                           NVL(SUM(DECODE(HC.FLGDEVOLUCAO ,0 ,DECODE(HC.MESCOBRANCA ,V_MESCOBRANCA ,HC.VALORESPERADO ,HC.VALORRECEBIDO) ,-DECODE(HC.MESCOBRANCA ,V_MESCOBRANCA ,HC.VALORESPERADO ,HC.VALORRECEBIDO))) ,0)
                    INTO
                           V_VALORCONTRIBUICAOPAGA

                    FROM
                           HSTCONTRIBPREV HC
                    WHERE
                           HC.MESREFERENCIA = IN_MESREFERENCIA
                           AND HC.IDPESSOA  = IN_IDPESSOA
                           /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                           AND HC.IDTITULAR      = IN_IDTITULAR
                           AND HC.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                           AND
                           (
                                  HC.MESCOBRANCA <> V_MESCOBRANCA

                                  OR HC.VALOROP3  = IN_IDPESSOA
                           )
                    ;
                
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    V_VALORCONTRIBUICAOPAGA := 0;
                END;
            ELSE
                BEGIN
                    IF (IN_IDPREPAROBENEF=-6) THEN --SIG 81567

                        SELECT
                               NVL(SUM(DECODE(HC.FLGDEVOLUCAO ,0 ,HC.VALORRECEBIDO ,-HC.VALORRECEBIDO)) ,0)
                        INTO
                               V_VALORCONTRIBUICAOPAGA
                        FROM
                               HSTCONTRIBPREV HC
                        WHERE
                               HC.MESREFERENCIA = IN_MESREFERENCIA
                               AND HC.IDPESSOA  = IN_IDPESSOA
                               /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                               AND HC.IDTITULAR      = IN_IDTITULAR

                               AND HC.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                               AND HC.VALOROP2       =IN_IDBENEFICIO
                        ;
                    
                    ELSE
                        SELECT
                               NVL(SUM(DECODE(HC.FLGDEVOLUCAO ,0 ,HC.VALORRECEBIDO ,-HC.VALORRECEBIDO)) ,0)
                        INTO
                               V_VALORCONTRIBUICAOPAGA
                        FROM
                               HSTCONTRIBPREV HC

                        WHERE
                               HC.MESREFERENCIA = IN_MESREFERENCIA
                               AND HC.IDPESSOA  = IN_IDPESSOA
                               /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                               AND HC.IDTITULAR      = IN_IDTITULAR
                               AND HC.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                        ;
                    
                    END IF; -- SIG 81567
                EXCEPTION
                WHEN NO_DATA_FOUND THEN

                    V_VALORCONTRIBUICAOPAGA := 0;
                END;
            END IF;
            V_FLGDEVOLUCAO := 0;
            --INÍCIO SIG 21943 - Tiago Von
            --IF NVL(V_IDTPCONTRIBUICAO,0) = 0 THEN     --  comentado pelo SIG27963
            V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO - V_VALORCONTRIBUICAOPAGA;
            --END IF;                                   --  comentado pelo SIG27963
            --T?ino SIG 21943 - Tiago Von
            V_VALORCONTRIBUICAO := ROUND(V_VALORCONTRIBUICAO,2);
            IF V_VALORCONTRIBUICAO < 0 THEN

                V_VALORCONTRIBUICAO := V_VALORCONTRIBUICAO*(-1);
                V_FLGDEVOLUCAO      := 1;
            END IF;
            ---------INICIA GRAVA?O NA BASE DE DADOS----------------------------
            IF V_VALORCONTRIBUICAO <> 0 THEN
                IF IN_TIPOOPERACAO  = 7 THEN
                    BEGIN
                        SELECT
                               P.IDMOTIVOCONTRIBP
                        INTO
                               V_IDMOTIVO

                        FROM
                               PARAMAPREV P
                        WHERE
                               ROWNUM = 1
                        ;
                    
                    EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        V_IDMOTIVO := 3003;
                    END;
                ELSE

                    V_IDMOTIVO := IN_IDMOTIVO;
                END IF;
                ---------EXCLUS? DE REGISTROS NA TMPDESC----------------------------
                DELETE
                FROM
                       TMPDESC T
                WHERE
                       T.SITENVIO     = 0
                       AND T.IDMODULO = 18
                       AND EXISTS
                       (

                              SELECT
                                     1
                              FROM
                                     HSTCONTRIBPREV HC
                              WHERE
                                     HC.MESREFERENCIA   = IN_MESREFERENCIA
                                     AND HC.MESCOBRANCA = V_MESCOBRANCA
                                     AND
                                     --HC.IDMOTIVO = V_IDMOTIVO AND --H?o Ajuste para processar as parcelas judiciais
                                     HC.IDPESSOA = IN_IDPESSOA
                                     /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/

                                     AND HC.VALOROP2            = IN_IDBENEFICIO
                                     AND HC.VALOROP3            = IN_IDPESSOA
                                     AND HC.IDTITULAR           = IN_IDTITULAR
                                     AND HC.IDCONTRIBUICAO      = V_IDCONTRIBUICAO
                                     AND HC.VALORRECEBIDO IS NULL
                                     AND T.NUMRECEBIMENTO       = HC.NUMRECEBIMENTO
                                     AND T.MESREFERENCIA        = HC.MESREFERENCIA
                                     AND T.MESCOBRANCA          = HC.MESCOBRANCA
                                     AND T.IDPESSOA             = HC.IDPESSOA
                                     AND T.IDTITULAR            = HC.IDTITULAR
                                     AND T.IDDESCONTO           = HC.IDCONTRIBUICAO

                       )
                ;
                
                ---------EXCLUS? DE REGISTROS DE ALTERADORES------------------------
                DELETE
                FROM
                       HSTATRASOCONTRIB HAC
                WHERE
                       EXISTS
                       (
                              SELECT

                                     1
                              FROM
                                     HSTCONTRIBPREV HC
                              WHERE
                                     HC.MESREFERENCIA   = HAC.MESREFERENCIA
                                     AND HC.MESCOBRANCA = HAC.MESCOBRANCA
                                     AND
                                     --HC.IDMOTIVO = HAC.IDMOTIVO AND--H?o Ajuste para processar as parcelas judiciais
                                     HC.NUMRECEBIMENTO = HAC.NUMRECEBIMENTO
                                     AND HC.SITRECEBIMENTO IN (0
                                                             , 1)

                                     AND HC.MESREFERENCIA = IN_MESREFERENCIA
                                     AND HC.MESCOBRANCA   = V_MESCOBRANCA
                                     AND HC.IDMOTIVO      = V_IDMOTIVO
                                     AND HC.IDPESSOA      = IN_IDPESSOA
                                     /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                                     AND HC.VALOROP2              = IN_IDBENEFICIO
                                     AND HC.VALOROP3              = IN_IDPESSOA
                                     AND HC.IDTITULAR             = IN_IDTITULAR
                                     AND HC.IDCONTRIBUICAO        = V_IDCONTRIBUICAO
                                     AND NVL(HC.VALORRECEBIDO, 0) = 0
                       )

                ;
                
                ---------EXCLUS? DE REGISTROS DE HIST?ICO DE CONTRIBUIÇÃO----------
                DELETE
                FROM
                       HSTCONTRIBPREV HC
                WHERE
                       HC.SITRECEBIMENTO IN (0
                                           , 1)
                       AND HC.MESREFERENCIA = IN_MESREFERENCIA
                       AND HC.MESCOBRANCA   = V_MESCOBRANCA

                       AND
                       --HC.IDMOTIVO = V_IDMOTIVO AND--H?o Ajuste para processar as parcelas judiciais
                       HC.IDPESSOA = IN_IDPESSOA
                       /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                       AND HC.VALOROP2              = IN_IDBENEFICIO
                       AND HC.VALOROP3              = IN_IDPESSOA
                       AND HC.IDTITULAR             = IN_IDTITULAR
                       AND HC.IDCONTRIBUICAO        = V_IDCONTRIBUICAO
                       AND HC.FLGDEVOLUCAO          = V_FLGDEVOLUCAO --SIG 32419 (SIG 32294 - Cancelado) - Ajuste proposto H?o
                       AND NVL(HC.VALORRECEBIDO, 0) = 0
                ;

                
                ---------INSER?O DO REGISTRO NO HIST?ICO DE CONTRIBUIÇÃO-----------
                /*SIG 64945 - Rafael Vasconcelos - Inicio*/
                IF (V_FLGDEVOLUCAO=1
                    AND
                    IN_IDPREPAROBENEF=-100) THEN
                    V_IDMOTIVO:=3012;
                END IF;
                /*SIG 64945 - Rafael Vasconcelos - Fim*/
                SELECT
                       SEQHSTCONTRIBPREV.NEXTVAL

                INTO
                       V_NUMRECEBIMENTO
                FROM
                       DUAL
                ;
                
                INSERT INTO HSTCONTRIBPREV
                       (MESREFERENCIA
                            , MESCOBRANCA
                            , NUMRECEBIMENTO
                            , IDMOTIVO

                            , CODPORTFORMA
                            , DATAPREVISAORECE
                            , VALORESPERADO
                            , VALORCALCULADO
                            , IDREGRACALCULO
                            , PERCCALCULO
                            , FLGDESCFOLHA
                            , IDPESSOA
                            , SEQPROPOSTA
                            , IDPESSJUR
                            , IDPLANOPREV

                            , IDCONTRIBUICAO
                            , IDPLANPREVCONTAB
                            , FLGCALCRESERVA
                            , VALORBASE1 --Rafael SIG 56914
                            , VALOROP1
                            , VALOROP2
                            , VALOROP3
                            , DATAINICIO
                            , DATAFINAL
                            , FLGSITFUNDACAO
                            , SITRECEBIMENTO

                            , TIPO
                            , IDLOTE
                            , PARCELA
                            , VALORRECEBIDO
                            , DATARECEBIMENTO
                            , FLGCONCESSAO
                            , FLGEVENTO
                            , FOLHAORIGEM
                            , DATAEMISSCOB
                            , FLGINTEVENTO
                            , IDTITULAR

                            , FLGDEVOLUCAO
                            , IDCONTRATOEMPTMO
                            , TRGUSERINCLUSAO
                       ) --35
                       VALUES
                       (IN_MESREFERENCIA
                            , V_MESCOBRANCA
                            , V_NUMRECEBIMENTO
                            , V_IDMOTIVO
                            , NULL
                              /*CODPORTFORMA*/

                            , V_DATAPAGAMENTO
                            , V_VALORCONTRIBUICAO
                            , V_VALORCONTRIBUICAO
                            ,
                               --1000,
                               --1000,
                               NULL
                              /*IDREGRACALCULO*/
                            , 0
                              /*PERCCALCULO*/
                              -- SIG 80906 JOÃO RICARDO - INÍCIO

                            , CASE
                                     WHEN V_DESCONTO_FOLHA_BENEF = 0
                                            THEN 0
                                            ELSE V_FLGDESCFOLHA
                              END
                              --V_FLGDESCFOLHA /*FLGDESCFOLHA*/-- SIG 65163
                              -- SIG 80906 JOÃO RICARDO - TÉRMINO
                            , IN_IDPESSOA
                              /*SIG 55626 - JOAO RICARDO. Alterada variavel IN_IDRESPONSAVEL para IN_IDPESSOA.*/
                            , IN_SEQPROPOSTA
                            , IN_IDPESSJUR

                            , IN_IDPLANOPREV
                            , V_IDCONTRIBUICAO
                            , V_IDPLANPREVCONTAB
                            , 0
                              /*FLGCALCRESERVA*/
                            , nvl(V_PERCCONTRIB,0)*100 -- Rafael SIG 56914
                            , nvl(V_PERCCONTRIB,0)*100
                              /* NULL*/
                              /*VALOROP1*/
                              --Rafael SIG 56914
                            , IN_IDBENEFICIO

                              /*VALOROP2*/
                            , IN_IDPESSOA
                              /*VALOROP3*/
                            , V_DATAINICIO
                            , V_DATAFINAL
                            ,'AS'
                              /*FLGSITFUNDACAO*/
                            , 0
                              /*SITRECEBIMENTO*/
                            ,'F'
                              /*TIPO*/

                            , IN_IDLOTE
                            , 0
                              /*PARCELA*/
                            , NULL
                            , NULL
                            , DECODE(IN_TIPOOPERACAO, 7, 1, 0)
                              /*FLGCONCESSAO*/
                            , 0
                              /*FLGEVENTO*/
                            , V_FOLHAORIGEM
                              /*FOLHAORIGEM*/

                              -- SIG 65163
                            , SYSDATE
                            , NULL
                              /*FLGINTEVENTO*/
                            , IN_IDTITULAR
                            , V_FLGDEVOLUCAO
                            , NULL
                            , V_IDUSUARIO
                       )
                ;
                

                IF IN_FLGTIPOREGISTRO = 0 THEN
                    IF IN_IDPESSOA    = IN_IDTITULAR THEN
                        UPDATE
                               CONTRIBPREVPARTP CPP
                        SET    CPP.ULTMESPREPARO = V_MESCOBRANCA
                        WHERE
                               CPP.IDPESSJUR          = IN_IDPESSJUR
                               AND CPP.IDPESSOA       = IN_IDPESSOA
                               AND CPP.IDPLANOPREV    = IN_IDPLANOPREV
                               AND CPP.SEQPROPOSTA    = 1
                               AND CPP.IDCONTRIBUICAO = V_IDCONTRIBUICAO

                        ;
                    
                    ELSE
                        UPDATE
                               CONTRIBPREVNUCLEO CPN
                        SET    CPN.ULTMESPREPARO = V_MESCOBRANCA
                        WHERE
                               CPN.IDNUCLEOFAMILIAR   = IN_IDNUCLEOFAMILIAR
                               AND CPN.IDCONTRIBUICAO = V_IDCONTRIBUICAO
                        ;
                    

                    END IF;
                END IF;
                ---------INÍCIO DA INCLUSÃO DE ALTERADORES---------------------------
                BEGIN
                    SELECT
                           MESABONOFUND
                    INTO
                           V_MES_ABONO_FUNCEF
                    FROM
                           CM.PARAMAPREV
                    WHERE

                           ROWNUM < 2
                    ;
                
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    V_MES_ABONO_FUNCEF := NULL;
                END;
                IF (IN_FLGCALCULAALTERADORES = 1
                    AND
                    IN_TIPOOPERACAO <> 0) THEN
                    -- SOL 268819 TIAGO VON - INICIO

                    IF SUBSTR(IN_MESREFERENCIA, 6, 2) = '13' THEN
                        /* INÍCIO AJUSTE SIG 99503 - João Ricardo */
                        IF V_MES_ABONO_FUNCEF IS NOT NULL THEN
                            V_MESREFERENCIA := SUBSTR(IN_MESREFERENCIA, 1, 5)
                            || V_MES_ABONO_FUNCEF;
                        ELSE
                            V_MESREFERENCIA := SUBSTR(IN_MESREFERENCIA, 1, 5)
                            || '11';
                        END IF;
                        /* TÉRMINO AJUSTE SIG 99503 - João Ricardo */
                    ELSE

                        V_MESREFERENCIA := IN_MESREFERENCIA;
                    END IF;
                    -- SOL 268819 TIAGO VON - FIM
                    SELECT
                           ROUND(((
                                    (
                                           SELECT
                                                  (EXP(SUM(LN(((CM1.COTVALOR / 100) + 1)))) - 1) * 100
                                           FROM
                                                  COTACAOMOEDA CM1
                                           WHERE

                                                  CM1.MOECODIGO = 7
                                                  AND SUBSTR(CM1.COTMESREF, 3, 4)
                                                         || '/'
                                                         || SUBSTR(CM1.COTMESREF, 1, 2) BETWEEN V_MESREFERENCIA -- AJUSTE SOL 268819 TIAGO VON
                                                  AND V_MESCOBRANCA
                                   )
                                   / 100)) ,6)
                    INTO
                           V_VALORINDICEALTERADOR
                    FROM
                           DUAL

                    ;
                    
                    -- IF NVL(V_VALORINDICEALTERADOR, 0) <> 0 THEN -- SIG 51056 - Tiago Von/Rafael
                    IF NVL(V_VALORINDICEALTERADOR, 0) > 0 THEN
                        V_VALORALTERADOR := V_VALORCONTRIBUICAO * V_VALORINDICEALTERADOR;
                        BEGIN
                            SELECT
                                   A.CODALTERADOR
                            INTO
                                   V_CODALTERADOR
                            FROM

                                   ALTERADORXCONTRIB A
                            WHERE
                                   A.IDCONTRIBUICAO  = V_IDCONTRIBUICAO
                                   AND A.IDPLANOPREV = IN_IDPLANOPREV
                                   AND A.FLGDEVOL    = V_FLGDEVOLUCAO
                                   AND ROWNUM        = 1
                            ;
                        
                        EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                            V_CODALTERADOR := 0;

                        END;
                        IF V_CODALTERADOR <> 0 THEN
                            INSERT INTO HSTATRASOCONTRIB
                                   (NUMRECEBIMENTO
                                        , MESREFERENCIA
                                        , MESCOBRANCA
                                        , IDMOTIVO
                                        , FLGTIPO
                                        , VALOR
                                        , CODALTERADOR
                                        , FLGEVENTO

                                        , TRGUSERINCLUSAO
                                   )
                                   VALUES
                                   (V_NUMRECEBIMENTO
                                        , IN_MESREFERENCIA
                                        , V_MESCOBRANCA
                                        , V_IDMOTIVO
                                        , DECODE(V_FLGDEVOLUCAO, 1, 'D', 'A')
                                        , V_VALORALTERADOR
                                        , V_CODALTERADOR
                                        ,'0'

                                        , V_IDUSUARIO
                                   )
                            ;
                        
                        END IF;
                    ELSE                       -- SIG 51056 - Tiago Von/Rafael - INICIO
                        V_VALORALTERADOR := 0; -- SIG 51056 - Tiago Von/Rafael - FIM
                    END IF;
                END IF;
            END IF;
        END IF;

  --  END IF;
    /*insert into carga.ApoioCarga values ('TESTE_CONCESSAO_PENSAO_TAXA_REVERSAO', IN_IDPESSOA, SysDate,IN_IDPREPAROBENEF||'-'||
    IN_FLGCALCULAALTERADORES||'-'||
    IN_IDPLANOPREV||'-'||
    IN_IDBENEFICIO||'-'||
    IN_NUMEROPROCESSO||'-'||
    IN_IDPESSJUR||'-'||
    IN_IDTITULAR||'-'||
    IN_IDPLANOORIGEM||'-'||
    IN_IDPLANPREVCONTAB||'-'||
    IN_IDPESSOA||'-'||

    IN_SEQPROPOSTA||'-'||
    IN_IDLOTE||'-'||
    IN_TIPOOPERACAO||'-'||
    IN_MESREFERENCIA||'-'||
    IN_MESPROCESSAMENTO||'-'||
    IN_FLGENVIADO||'-'||
    IN_FLGTIPOREGISTRO||'-'||
    IN_DATAINICIO||'-'||
    IN_DATAFINAL||'-'||
    IN_PERCGRUPO||'-'||
    IN_VALORTOTAL||'-'||

    IN_IDCONTRIBUICAO||'-'||
    IN_IDNUCLEOFAMILIAR||'-'||
    IN_ACAOJUDICIALREG||'-'||
    IN_IDRESPONSAVEL||'-'||
    IN_IDMOTIVO||'-'||
    IN_DATAPAGAMENTO||'-'||
    IN_IDUSUARIO);*/
END;