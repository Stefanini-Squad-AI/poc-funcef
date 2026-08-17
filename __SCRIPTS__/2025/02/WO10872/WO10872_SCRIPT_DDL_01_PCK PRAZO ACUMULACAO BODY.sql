CREATE OR REPLACE PACKAGE BODY CM.PCK_CTB_CALC_PRAZOACUMULACAO IS
  -------------------------------------------------------------------------
  --      H I S T Ó R I C O        D E          A L T E R A Ç Õ E S      --
  -------------------------------------------------------------------------
  -- Desenvolvedor: Felipe A. Santos
  -- SOL..........: 254124
  -- KINTANA......: 793415
  -- Data.........: 20/05/2015
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Duplicação de registros
  -- Solução......: passado o IDTITULAR para trazer somente 1 registro na SELECT que busca o mesmo da DEPENTIT.
  -------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 37368
  -- Data.........: 09/01/2017
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Não considerando portabilidade
  -- Solução......: Join entre as tabelas PORTABILIDADEPREV e  ENTIDADEORIGEM. Em 2013, criou o campo IDENTIDADEORIGEM na tabela PORTABILIDADEPREV e o sistema
  --deixou de popular os campos Nome, CNPJ, TIPO e CNPBSUSEP.
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 40281
  -- Data.........: 02/03/2017
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Erro no cálculo do saldo bruto tributável para matrícula 7446236
  -- Solução......: Alteração da data de associação na estrutura PartprevPlan, de INSCRICAODATA(Incrição no Plano) para
  --                            DTINICIOINSC(Inscrição na Fundação). Igual como é feito no relatório
  --                            COARI - Extrato de Contribuição (REB-CAIXA)
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG.........:47052
  --Data.........:31/05/2017
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Erro no cálculo do tempo de associação
  -- Solução......: Para o plano REB, vericar a data de inicidio de associção igual como é feito no Novo Plano. Igual como é feito no relatório cOARI - Extrato de Contribuição (REB-CAIXA)
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 55019
  -- Data.........: 13/09/2017
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Matrícula 1171590
  -- Solução......: Com a implementação do SIG 37368 começou a gerar duplicação do valor pois há casos em que não existe IDENTIDADEORIGEM na tabela PORTABILIDADEPREV preenchido.
  --                Para solução foi criado um Cursor para popular o campo TIPO na PortabilidadePrev e eliminar o JOIN com a tabela ENTIDADEORIGEM
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........:
  -- Data.........: 23/05/2019
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: Nao calculava a retencao benefício na base do IRRF.
  -- Solução......: Calcular a retencao do beneficio na base do IRRF.
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 99297
  -- Data.........: 30/03/2020
  -- Rotina.......: PR_CALC_PRAZO_ACUMULACAO
  -- Erro relatado: O valor atual éiferente do total quando o resgate é parcelado.
  -- Solução......: Considerar o valor total ao inves do atual.
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Edilaine
  -- SIG..........: 95333
  -- Data.........: 30/03/2020
  -- Rotina.......: FN_MontaQueryPessoasAProcessar, log_consulta
  -- Erro relatado: erro ao selecionar lista para processamento
  -- Soluçao......: Ajuste na consulta para no considerar IDPESSOA e IDPESSJUR
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Edilaine
  -- SIG..........: 99421
  -- Data.........: 13/04/2020
  -- Rotina.......: FN_MontaQueryPessoasAProcessar, log_consulta
  -- Erro relatado: erro ao processar um
  -- Solucao......: Ajuste na consulta para no considerar IDPESSOA e IDPESSJUR
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 100613
  -- Data.........: 25/06/2020
  -- Rotina.......: SqlNovoPlano, SqlRegReplan
  -- Erro relatado: Contribuicao de portabilidade agrupava para fazer o c lculo
  -- Solucao......: Utilizar o m s refer ncia para quando for portabilidade Regressiva de Regressiva
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 117253
  -- Data.........: 20/08/2021
  -- Solucao......: Acrescentar a Contribui  o 208, onde tem a 110
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Edilaine
  -- SIG........: 20491
  -- Data.......: 23/05/2019
  -- Rotina.....: PR_CALC_PRAZO_ACUMULACAO
  -- Solucao....: Calcular base do IRRF pelo sequencial de resgate e proporcionalizar para dependentes.
     ---------------------------------------------------------------------------
  -- Desenvolvedor: Tiago Von
  -- SIG..........: 129414
  -- Data.........: 29/09/2022
  -- Solucao......: Acrescentar a Reservas 217 (NP) e 218 (REB) 
     ---------------------------------------------------------------------------
  -- Desenvolvedor: Leandro
  -- SIG........: 133134
  -- Data.......: 03/03/2023
  -- Rotina.....: PR_CALC_PRAZO_ACUMULACAO
  -- Solucao....: Calcular base do IRRF de valores retidos.
    ---------------------------------------------------------------------------
  -- Desenvolvedor: Leandro
  -- SIG........: 133163
  -- Data.......: 10/03/2023
  -- Rotina.....: PR_CALC_PRAZO_ACUMULACAO
  -- Solucao....: Alteracao  para pegar as reservas.
      ---------------------------------------------------------------------------
  -- Desenvolvedor: Marimar Soares
  -- SIG........: 134863
  -- Data.......: 19/04/2023
  -- Rotina.....: PR_CALC_PRAZO_ACUMULACAO
  -- Solucao....:  Remover a condicao  HS.DATARECEBIMENTO < HOIR.dtinicio
       ------------------------------------------------------------------------------------------------------ 
  -- Desenvolvedor: Edilaine
  -- SIG........: 136119
  -- Data.......: 24/05/2023
  -- Rotina.....: FN_VerificaTitularFalecido
  -- Solucao....: condicao nao considerava qdo ha um beneficiario
       ------------------------------------------------------------------------------------------------------ 
  -- Desenvolvedor: Hebio
  -- SIG........: WO7028
  -- Data.......: 25/01/2024
  -- Rotina.....: FN_VerificaTitularFalecido
  -- Solucao....: condicao nao considerava qdo ha um beneficiario
       ------------------------------------------------------------------------------------------------------ 
  -- Desenvolvedor: Edilaine
  -- SIG........: WO12337
  -- Data.......: 29/07/2024
  -- Rotina.....: FN_MontaConsultaNovaReserva
  -- Solucao....: duplicando valor da reserva qdo tem 2 registros na Opcao de IR
       ------------------------------------------------------------------------------------------------------ 
  -- Desenvolvedor: Edilaine
  -- SIG........: WO9102
  -- Data.......: 27/03/2024
  -- Rotina.....: FN_MontaQueryPessoasAProcessar, FN_MontaConsultaNovaReserva
  -- Solucao....: Segregar calculo do IR entre reservas Normais / Portadas
       ------------------------------------------------------------------------------------------------------ 
  -- Desenvolvedor: Edilaine
  -- SIG........: WO10872
  -- Data.......: 27/01/2025
  -- Rotina.....: FN_MontaConsultaNovaReserva
  -- Solucao....: No REB desconsiderar reserva migrada com isenção de IR
       ------------------------------------------------------------------------------------------------------ 


  -- Variaveis Global do pacote ---------------------------------------------------------------------------
  -- Cursor das Pessoas a serem Processadas
  TYPE cPessoasAProcessar_TYPE IS REF CURSOR;
  TYPE cCursorDados_TYPE IS REF CURSOR; /*20491*/

  vSQLPessoasAProcessar VARCHAR2(4000);
  vDataAssociacao       DATE;
  vDataPrevista         DATE;
  vBenefRisco           PLS_INTEGER;
  vErroInsert           VARCHAR(4000);
  vFLGTipoOpcaoIR       CHAR(1);
  vIDTipoOpcaoIR        PLS_INTEGER;
  vDescTipoOpcaoIR      CHAR(11);
  vTotalNovoPlano       NUMBER;
  vTotalREB             NUMBER;
  vFLGGravaCalc         PLS_INTEGER DEFAULT 1;

  -- 1 Faixa de IR Qtde Dias
  vRes_Ate2Anos_QtdeDias  PLS_INTEGER;
  vRes_2A4Anos_QtdeDias   PLS_INTEGER;
  vRes_4A6Anos_QtdeDias   PLS_INTEGER;
  vRes_6A8Anos_QtdeDias   PLS_INTEGER;
  vRes_8A10Anos_QtdeDias  PLS_INTEGER;
  vRes_Sup10Anos_QtdeDias PLS_INTEGER;
  -- 1 Cotas
  vVLRRes_Ate2Anos_Cotas  NUMBER;
  vVLRRes_2A4Anos_Cotas   NUMBER;
  vVLRRes_4A6Anos_Cotas   NUMBER;
  vVLRRes_6A8Anos_Cotas   NUMBER;
  vVLRRes_8A10Anos_Cotas  NUMBER;
  vVLRRes_Sup10Anos_Cotas NUMBER;
  -- 1 Percentual
  vVLRRes_Ate2Anos_Percent  CONSTANT PLS_INTEGER := 35;
  vVLRRes_2A4Anos_Percent   CONSTANT PLS_INTEGER := 30;
  vVLRRes_4A6Anos_Percent   CONSTANT PLS_INTEGER := 25;
  vVLRRes_6A8Anos_Percent   CONSTANT PLS_INTEGER := 20;
  vVLRRes_8A10Anos_Percent  CONSTANT PLS_INTEGER := 15;
  vVLRRes_Sup10Anos_Percent CONSTANT PLS_INTEGER := 10;
  -- 1 - Descrição
  vVLRRes_Ate2Anos_Desc  CONSTANT VARCHAR2(50) := 'At  2 anos';
  vVLRRes_2A4Anos_Desc   CONSTANT VARCHAR2(50) := 'Superior a 2 anos at  4 anos';
  vVLRRes_4A6Anos_Desc   CONSTANT VARCHAR2(50) := 'Superior a 4 anos at  6 anos';
  vVLRRes_6A8Anos_Desc   CONSTANT VARCHAR2(50) := 'Superior a 6 anos at  8 anos';
  vVLRRes_8A10Anos_Desc  CONSTANT VARCHAR2(50) := 'Superior a 8 anos at  10 anos';
  vVLRRes_Sup10Anos_Desc CONSTANT VARCHAR2(50) := 'Superior a 10 anos';
  -- 2 Faixa de IR Qtde Dias BENEFICIO DE RISCO de Risco Qtde Dias
  vResRisco_Ate6Anos_QtdeDias  PLS_INTEGER;
  vResRisco_6A8Anos_QtdeDias   PLS_INTEGER;
  vResRisco_8A10Anos_QtdeDias  PLS_INTEGER;
  vResRisco_Sup10Anos_QtdeDias PLS_INTEGER;
  -- 2 Cotas
  vVLRResRisco_Ate6Anos_Cotas  NUMBER;
  vVLRResRisco_6A8Anos_Cotas   NUMBER;
  vVLRResRisco_8A10Anos_Cotas  NUMBER;
  vVLRResRisco_Sup10Anos_Cotas NUMBER;
  -- Percentual
  vVLRResRisco_Ate6Anos_Percent  CONSTANT PLS_INTEGER := 25;
  vVLRResRisco_6A8Anos_Percent   CONSTANT PLS_INTEGER := 20;
  vVLRResRisco_8A10Anos_Percent  CONSTANT PLS_INTEGER := 15;
  vVLRResRisco_Sup10Anos_Percent CONSTANT PLS_INTEGER := 10;
  -- Descrição
  vVLRResRisco_Ate6Anos_Desc  CONSTANT VARCHAR2(50) := 'At  6 anos';
  vVLRResRisco_6A8Anos_Desc   CONSTANT VARCHAR2(50) := 'Superior a 6 anos at  8 anos';
  vVLRResRisco_8A10Anos_Desc  CONSTANT VARCHAR2(50) := 'Superior a 8 anos at  10 anos';
  vVLRResRisco_Sup10Anos_Desc CONSTANT VARCHAR2(50) := 'Superior a 10 anos';

  -- NOVO PLANO
  vVLRIndice_NP NUMBER(21, 12);
  -- FIM N.P.

  -- REB
  vMigraREGREPLAN_REB    PLS_INTEGER;
  vVLRIndice_REB         NUMBER(21, 12);
  vAssoc_10Anos_QtdeDias PLS_INTEGER;
  vAssoc_15Anos_QtdeDias PLS_INTEGER;
  vAssoc_20Anos_QtdeDias PLS_INTEGER;
  vAssoc_21Anos_QtdeDias PLS_INTEGER;
  -- KINTANA 1501823 SOL 167930
  -- OTACILIO CASO SEJA DEPENTENTE GUARDAR O IDPESSOA DO TITULAR
  vIDPESSOA_TITULAR NUMBER;
  -- FIM REB

  --SIG20491 : INICIO
  --Valida se   o titular ou dependente
  vFlgDependente PLS_INTEGER DEFAULT 0;
  --SIG20491 : FIM

  vIncPassoLog PLS_INTEGER := 0;      /*10872*/
  vFLGGravaLog PLS_INTEGER := 0;      /*10872*/    -- Modo Debug: 0 Desativado / 1 Ativado

  -- FIM Variaveis Globais ---------------------------------------------------------------------------------

  -- Procedure log_consulta --------------------------------------------------------------------------------
  PROCEDURE log_consulta(inRotina in varchar2, inConsulta in varchar2) is
    PRAGMA AUTONOMOUS_TRANSACTION;
  
    block_to_execute VARCHAR2(3000);
  BEGIN
    IF vFLGGravaLog > 0 THEN                /*10872*/
      vIncPassoLog := vIncPassoLog + 1;
      BEGIN
        INSERT INTO CM.SALVASQL
          (NUMPASSO, PASSO, CONSULTA)
        VALUES
          (vIncPassoLog, inRotina, inConsulta);
        commit;
      EXCEPTION
        WHEN OTHERS THEN
          BEGIN
            DBMS_OUTPUT.put_line(inConsulta);
          END;
      END;
    END IF;
  END;
  -- FIM Procedure log_consulta ----------------------------------------------------------------------------


  -- MontaQueryPessoasAProcessar ---------------------------------------------------------------------------
  FUNCTION FN_MontaQuerySelBeneficiarios(inIDTitular   IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                         inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE,
                                         inIDPessoa    IN NUMBER DEFAULT -1       
                                        ) RETURN VARCHAR2
  IS
     vSQLSelPessoas  VARCHAR2(2000);
  BEGIN
     vSQLSelPessoas := 'SELECT distinct btt.Idpessoa, (btt.percentual / 100) percentual '||
                       '  FROM Bfciariotitplan BTT  ' ||
                       '  JOIN BENEFICIO BB ON BB.Idbeneficio = btt.Idbeneficio  ' ||
                       ' WHERE bb.tipobeneficio = 6 and bb.flgdestbenef <> ''E'' ' ||
                       '   AND btt.idplanoprev = ' || inIDPlanoPrev  ||
                       '   AND btt.Idtitular = ' || inIDTitular;

  IF (inIDPessoa > 0) AND (inIDTitular <> inIDPessoa) THEN
     vSQLSelPessoas := vSQLSelPessoas || 
        '   AND btt.IDPESSOA = ' || inIDPessoa;
  END IF;
            
      log_consulta('FN_MontaQuerySelBeneficiarios', vSQLSelPessoas );
      
      DBMS_OUTPUT.put_line(vSQLSelPessoas);
    RETURN(vSQLSelPessoas);
  END FN_MontaQuerySelBeneficiarios;
  -- FIM - MontaQuerySelBeneficiarios ----------------------------------------------------------------------


  -- MontaQueryPessoasAProcessar ---------------------------------------------------------------------------
  FUNCTION FN_MontaQueryPessoasAProcessar(inIDPessJur  IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                                          inIDPessoa   IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                          inListaBenef IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                                          inREB        IN PLS_INTEGER DEFAULT 1,
                                          inNOVOPLANO  IN PLS_INTEGER DEFAULT 1)
    RETURN VARCHAR2 
  IS
    vPLANO    VARCHAR(100);
    vIdPLANO  VARCHAR(20);
    vListaTAB VARCHAR(25); /* edilaine #95333 */
  BEGIN
    /*edilaine #95333 : inicio */
    vListaTAB := ' ';
    IF (inListaBenef IS NOT NULL) AND (inListaBenef > 0) THEN
      /*SIG 99421*/
      vListaTAB := ', LISTAFOLHABENEFDET LST ';
    END IF;
    /*edilaine #95333 : fim */
  
    IF ((inREB = 1) AND (inNOVOPLANO = 1)) OR
       ((inREB = 0) AND (inNOVOPLANO = 0)) THEN
      /* edilaine #95333 */
      vPLANO   := ' AND PLA.IDPLANOPREV IN (66,74) ';
      vIdPLano := ' IN (66,74)';
    ELSIF (inREB = 1) THEN
      vPLANO   := ' AND PLA.IDPLANOPREV = 66 ';
      vIdPLano := ' = 66';
    ELSIF (inNOVOPLANO = 1) THEN
      vPLANO   := ' AND PLA.IDPLANOPREV = 74 ';
      vIdPLano := ' = 74';
    END IF;
  
    vSQLPessoasAProcessar := 'SELECT DISTINCT ' ||
                             '        ELE.IDPESSJUR, ' ||
                            -- OTACILIO KINTANA 1501823 SOL 167930
                            --'        ELE.IDPESSOA, ' ||
                             '        DEP.IDPESSOA, ' ||
                             '        DEP.IDTITULAR, ' || /*95333*/
                            -- KINTANA 1501823 SOL 167930
                             '        PLA.IDPLANOPREV ' ||
                            -- OTACIIO SOL 181765
                            --'        PPP.INSCRICAODATA ' ||
                             ' FROM ELEGPATRO ELE, ' ||
                             '      PARTPREVPLAN PPP, ' ||
                             '      PLANPREV PLA, ' ||
                             '      RESERVAPART RES, ' ||
                             '      PLANPREVPATRO PPATRO, ' ||
                            --'      HISTOPIR HOIR, ' ||                      /*edilaine WO9102*/
                             '      DEPENTIT DEP ' || '     ' || vListaTAB || /* edilaine #95333 */
                             ' WHERE ' ||
                            --'     RES.VALORRESERVA > 0 ';
                             '     RES.VALORRESERVA IS NOT NULL ';
  
    IF (inIDPessJur IS NOT NULL) AND (inIDPessJur > 0) THEN
      /* edilaine #95333 */
      vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                               ' AND ELE.IDPESSJUR = ' || inIDPessJur;
    END IF;
  
    IF (inIDPessoa IS NOT NULL) AND (inIDPessoa > 0) THEN
      /* edilaine #95333 */
      vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                              -- OTACILIO KINTANA 1501823 SOL 167930
                              --' AND ELE.IDPESSOA = ' || inIDPessoa;
                               ' AND DEP.IDPESSOA = ' || inIDPessoa;
      -- OTACILIO SOL 181765
      --' AND DEP.IDPESSOA = PPP.IDPESSOA(+) ';
      -- KINTANA 1501823 SOL 167930
    END IF;
  
    IF ((inREB = 1) OR (inNOVOPLANO = 1)) THEN
      vSQLPessoasAProcessar := vSQLPessoasAProcessar || vPLANO;
    END IF;
  
    vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                             --' AND PPP.IDPESSOA    = HOIR.IDPESSOA ' ||    /*edilaine WO9102*/  
                             --' AND PPP.IDPLANOPREV = HOIR.IDPLANPREV ' ||  /*edilaine WO9102*/
                             ' AND ELE.IDPESSOA    = DEP.IDTITULAR ';
  
    --BRUNO AZEVEDO SOL 167335 KINTANA
    /*IF inIDPessoa IS NOT NULL THEN
    vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
    ' AND ((HOIR.TIPOOPCAOIR = 2) OR ' ||
    '     ((SELECT COUNT(1) ' ||
    '          FROM PORTABILIDADEPREV ' ||
    '         WHERE IDPESSOA = ' || inIDPessoa ||
    '           AND IDPESSJUR = ' || inIDPessJur ||
    '           AND IDPLANOPREV ' || vIdPLano ||
    '           AND OPCAOIR = ''P'') > 0)) ';
    END IF;*/
    --BRUNO AZEVEDO SOL 167335 KINTANA
  
    IF (inListaBenef IS NOT NULL) AND (inListaBenef > 0) THEN
      /*SIG 99421*/
      vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                               ' AND LST.IDLISTA  = ' || inListaBenef || /* edilaine #95333 */
                               ' AND ELE.IDPESSOA = LST.IDTITULAR ' || /* edilaine #95333 */
                               ' AND DEP.IDPESSOA = LST.IDPESSOA  ' || /* edilaine #95333 */
                               --' AND ((HOIR.TIPOOPCAOIR IN (0,1,2)) OR ' ||         /*edilaine WO9102*/
                               ' AND ((NVL(PPP.TIPOOPCAOIR,0) IN (0,1,2)) OR ' ||         /*edilaine WO9102*/
                               '     ((SELECT COUNT(1) ' ||
                               '         FROM PORTABILIDADEPREV POP ' ||
                               '        WHERE (SELECT COUNT(1) ' ||
                               '                 FROM LISTAFOLHABENEFDET LIS ' ||
                               '                WHERE POP.IDPESSOA = LIS.IDPESSOA ' ||
                               '                  AND LIS.IDLISTA  = ' || inListaBenef || ') > 0 ' ||
                              /* edilaine #95333 : inicio*/
                               --'           AND IDPESSJUR = ' || inIDPessJur ||
                               --'           AND IDPLANOPREV ' || vIdPLano ||
                               '           AND POP.IDPESSJUR   = ELE.IDPESSJUR   ' ||
                               '           AND POP.IDPLANOPREV = PLA.IDPLANOPREV ' ||
                              /*WO9102 - INICIO */                               
                               '           AND ((POP.DATARECEBIMENTO <  TO_DATE(''01/01/2024'', ''DD/MM/YYYY'')  '||
                               '            OR  (POP.DATARECEBIMENTO >= TO_DATE(''01/01/2024'', ''DD/MM/YYYY'') '||
                               '           AND   POP.OPCAOIR = ''R'' )) > 0)) '; 
                               --'           AND POP.OPCAOIR = ''P'') > 0)) ';        
                              /*WO9102 - FIM */
                              /* edilaine #95333 : fim*/
    END IF;
  
    vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                             ' AND ELE.IDPESSJUR = PPP.IDPESSJUR ' ||
                             ' AND ELE.IDPESSOA  = PPP.IDPESSOA ' ||
                             ' AND ELE.IDPESSJUR = RES.IDPESSJUR ' ||
                             ' AND ELE.IDPESSOA  = RES.IDPESSOA ' ||
                             ' AND PPP.IDPESSJUR      = PPATRO.IDPESSJUR ' ||
                             ' AND PPP.IDPLANOPREV    = PPATRO.IDPLANOPREV ' ||
                             ' AND PPP.IDPESSJUR      = RES.IDPESSJUR ' ||
                             ' AND PPP.IDPESSOA       = RES.IDPESSOA ' ||
                             ' AND PPP.IDPLANOPREV    = RES.IDPLANOPREV ' ||
                             ' AND PPATRO.IDPLANOPREV = PLA.IDPLANOPREV ' ||
                             ' AND PLA.IDPLANOPREV = RES.IDPLANOPREV ';
  
    /*95333 : INICIO*/
    /*IF ((inIDPessoa IS NULL) AND (inListaBenef IS NOT NULL)) THEN
    vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
    ' AND EXISTS (SELECT 1 '||
    '             FROM  LISTAFOLHABENEFDET LIS '||
    '             WHERE ELE.IDPESSOA = LIS.IDPESSOA '||
    '             AND LIS.IDLISTA = '|| inListaBenef || ')';
    END IF; */
    /*95333 : FIM */
  
    vSQLPessoasAProcessar := vSQLPessoasAProcessar ||
                             ' ORDER BY IDPESSJUR, IDPESSOA, IDPLANOPREV';
  
    log_consulta('MontaQueryPessoasAProcessar', vSQLPessoasAProcessar);
  
    DBMS_OUTPUT.put_line(vSQLPessoasAProcessar);
  
    RETURN(vSQLPessoasAProcessar);
  
  END FN_MontaQueryPessoasAProcessar;
  -- FIM - MontaQueryPessoasAProcessar ---------------------------------------------------------------------


  -- Function FN_MontaConsultaReserva ----------------------------------------------------------------------
  FUNCTION FN_MontaConsultaReserva(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE,
                                   inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE,
                                   inIdPlanoPrev  IN PLS_INTEGER,    /*SIG20491*/
                                   inSeqResgate   IN NUMBER,         /*SIG20491*/
                                   inCalcRetencao IN PLS_INTEGER
                                  ) RETURN VARCHAR2
  IS
    vSQLReservas   VARCHAR2(20000);
  
    vTipoOpcaoIR_Atual NUMBER;
    vTipoOpcaoIR_Anterior NUMBER;
    vIDPessoaPesq  PLS_INTEGER;
    vFLGTipoOpcaoIRPortada PLS_INTEGER;
    vSeqResgateTotal PLS_INTEGER;
  BEGIN

    -- TRECHO COMENTADO POIS VARIAVEL vFLGTipoOpcaoIRPortada NAO EH UTILIZADA 
      /* vFLGTipoOpcaoIRPortada := 0;
      vSQLReservas := ' SELECT NVL(DECODE(OPCAOIR,''R'',2,1),0) AS TIPOOPCAO FROM PORTABILIDADEPREV '||
                      '  WHERE IDPESSJUR ='||inIDPessJur ||
                      '  AND IDPESSOA    ='||inIDPessoa  ||
                      '  AND ROWNUM = 1 '||
                      '  AND IDPLANOPREV = || inIdPlanoPrev ||
                      '  GROUP BY OPCAOIR,IDCONTRIBUICAO,IDPESSOA,IDPESSJUR,IDPLANOPREV ';
                      
      IF (vFLGTipoOpcaoIR = 'P') THEN
        BEGIN
          EXECUTE IMMEDIATE vSQLReservas INTO vFLGTipoOpcaoIRPortada;
        EXCEPTION
        WHEN OTHERS THEN
          vFLGTipoOpcaoIRPortada :=0;
        END;
      END IF;  */
    -- FIM ------------------------------------------------------------------- 

    vSeqResgateTotal := inSeqResgate;
    IF inCalcRetencao = 1 THEN
       vSeqResgateTotal := 0;
    END IF;
    
    vSQLReservas :='';
    
    IF inIdPlanoPrev = 66 THEN
       vIDPessoaPesq := inIDPessoa;
    ELSE
       vIDPessoaPesq := vIDPESSOA_TITULAR;  -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
    END IF;

    --Verificar Tipo de Op  o de IR atual e anterior
    BEGIN
      SELECT NVL(tipoopcaoir_atual, -1) tipoopcaoir_atual,
             NVL(tipoopcaoir_anterior, -1) tipoopcaoir_anterior
        INTO vTipoOpcaoIR_Atual,
             vTipoOpcaoIR_Anterior
        FROM (SELECT HOIR.idhistopir,
                     HOIR.idpessoa,
                     HOIR.idplanprev,
                     HOIR.tipoopcaoir tipoopcaoir_atual,
                     LEAD(HOIR.tipoopcaoir) OVER (ORDER BY HOIR.idhistopir DESC) tipoopcaoir_anterior,
                     HOIR.dtinicio,
                     HOIR.dtfim
                FROM histopir HOIR
               WHERE HOIR.idpessoa = vIDPessoaPesq 
                 AND HOIR.idplanprev = inIdPlanoPrev
               ORDER BY HOIR.idhistopir DESC)
       WHERE ROWNUM =1
       ORDER BY DTFIM DESC;
    EXCEPTION
      WHEN OTHERS THEN
        vTipoOpcaoIR_Atual := -1;
        vTipoOpcaoIR_Anterior := -1;
    END;

    IF inIdPlanoPrev = 74 THEN
      vSQLReservas := ' SELECT TIPO_RESERVA, DATARECEBIMENTO AS MESREFERENCIA, SUM(QTDE_COTAS) AS VLRCOTAS  '||
                      ' FROM (  ';
                      /*IF (vTipoOpcaoIR_Anterior <> 2) THEN*/
                      IF (vTipoOpcaoIR_Anterior <> vTipoOpcaoIR_Atual) and (vTipoOpcaoIR_Anterior <> -1) THEN -- SIG 133163
                          vSQLReservas := vSQLReservas ||
                          '      SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, '||
                          '             HOIR.dtinicio DATARECEBIMENTO, '||
                          '             SUM(DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS)) AS QTDE_COTAS '||
                          '        FROM HISTMOVRESERVA HS,  '||
                          '             HISTOPIR HOIR  '||
                          '       WHERE HS.IDPESSJUR = '|| inIDPessJur ||
                          '         AND HS.IDPESSOA = ' || vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                          '         AND HS.IDPLANOPREV = 74    '||
                          '         AND HS.IDTIPORESERVA IN (100, 101, 217)   '|| -- SIG 129414 Tiago Von - Inclus o do ID 217
                          '         AND HOIR.idpessoa = HS.idpessoa '||
                          '         AND HOIR.idplanprev = HS.idplanoprev  '||
                          '         AND HOIR.tipoopcaoir = 2 '||            
                         --- '         AND HS.DATARECEBIMENTO < HOIR.dtinicio  ' ||
                          '         AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||    -- edilaine - 20491
                          '    GROUP BY HS.IDTIPORESERVA, HOIR.dtinicio ' ||
                          '    UNION ALL   ';
                      END IF;

                      vSQLReservas := vSQLReservas ||
                          '    SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, '||
                          '           HS.DATARECEBIMENTO,   '||
                          '           DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS) AS QTDE_COTAS   '||
                          '      FROM HISTMOVRESERVA HS, '||
                          '           HISTOPIR HOIR '||
                          '     WHERE HS.IDPESSJUR = '|| inIDPessJur ||
                          '       AND HS.IDPESSOA = '|| vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                          '       AND HS.IDPLANOPREV = 74   '||
                          '       AND HS.IDTIPORESERVA IN (100, 101, 217)   '|| -- SIG 129414 Tiago Von - Inclus o do ID 217
                          '       AND HOIR.idpessoa = HS.idpessoa '||
                          '       AND HOIR.idplanprev = HS.idplanoprev '||
                          '       AND HOIR.tipoopcaoir = 2 '||                  
                          --'       AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE))  ' ||
                          '       AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||    /*edilaine - 20491*/

                              -- Tipo de Reserva: PORTADAS
                          '      UNION ALL   '||
                          '      SELECT TIPO_RESERVA, '||
                          --'             DATARECEBIMENTO AS MESREFERENCIA, '                      || --SIG 100613
                          '             TO_DATE(DATARECEBIMENTO,''dd/mm/yyyy'') AS MESREFERENCIA,' || --SIG 100613              
                          '             VLRCOTAS '||
                          '       FROM (     '||
                          '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, '||
                          '                   H.MESREFERENCIA, '||
                          '                   POR.DATAOPCAOIR, '||
                          --'                   H.DATARECEBIMENTO,'|| --SIG 100613
                          '                   ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || --SIG 100613              
                          '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS'||
                          '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H'|| --,ENTIDADEORIGEM EE|| RAFAEL VASCONCELOS || SIG 37151,55019
                          '                   WHERE POR.idpessoa = '|| vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                          '                     AND POR.idpessjur = '|| inIDPessJur ||
                          '                     AND POR.idplanoprev = 74 '||
                          --'                     --AND ((EE.IDENTIDADEORIGEM=POR.IDENTIDADEORIGEM '|| -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          --'                     --AND EE.tipo = ''A'') or (por.tipo=''A'')) '||      -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          '                     AND por.tipo=''A'' '|| -- RAFAEL VASCONCELOS 55019
                          '                     AND POR.opcaoir = ''R'' '||        
                          '                     AND H.IDTIPORESERVA IN (110,208) ' || --SIG 117253
                          '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '||
                          '                     AND POR.IDPESSOA = HST.IDPESSOA '||
                          '                     AND POR.IDPESSOA = H.IDPESSOA '||
                          '                     AND HST.IDPESSOA = H.IDPESSOA '||
                          '                     AND HST.IDPLANOPREV = H.IDPLANOPREV '||
                          '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV '||
                          '                     AND POR.IDPLANOPREV = H.IDPLANOPREV '||
                          '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO '||
                          '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                          '                     AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||    /*edilaine - 20491*/
                          '                   GROUP BY H.IDTIPORESERVA, '||
                          '                            H.MESREFERENCIA, '||
                          '                            POR.DATAOPCAOIR, '||
                          '                            H.DATARECEBIMENTO '||
                          '                   ORDER BY mesreferencia)  '||
                
                          --PORTADAS (PROGRESSIVAS QUANDO O PARTICIPANTE   REGRESSIVO)
                          '      UNION ALL   '||
                          '      SELECT TIPO_RESERVA, '||
                          '             DATAR AS DATARECEBIMENTO, '||
                          '             VLRCOTAS '||
                          '       FROM (     '||
                          '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, '||
                          '                   POR.DATAOPCAOIR, '||
                          '                   H.DATARECEBIMENTO, '||
                          '                   (CASE '||
                          '                     WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN '||
                          '                      H.DATARECEBIMENTO '||
                          '                     ELSE '||
                          '                      HOIR.DTINICIO '||
                          '                    END) AS DATAR, '||
                          '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS '||
                          '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, HISTOPIR HOIR'|| --,ENTIDADEORIGEM EE|| RAFAEL VASCONCELOS || SIG 37151,55019
                          '                   WHERE POR.idpessoa =  '|| vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                          '                     AND POR.idpessjur =  '|| inIDPessJur ||
                          '                     AND POR.idplanoprev = 74  '||
                          --'                     --AND ((EE.IDENTIDADEORIGEM=POR.IDENTIDADEORIGEM '|| -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          --'                     --AND EE.tipo = ''A'') or (por.tipo=''A'')) '||      -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          '                     AND por.tipo=''A'' '|| -- RAFAEL VASCONCELOS 55019
                          '                     AND POR.opcaoir = ''P''   '||
                          '                     AND H.IDTIPORESERVA IN (110,208)  ' || --SIG 117253
                          '                     AND HOIR.IDPESSOA = H.IDPESSOA '||
                          '                     AND HOIR.IDPLANPREV = H.IDPLANOPREV  '||
                          '                     AND HOIR.TIPOOPCAOIR = 2  '||
                          '                     AND HOIR.DTFIM IS NULL '||
                          '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE  '||
                          '                     AND POR.IDPESSOA = HST.IDPESSOA  '||
                          '                     AND POR.IDPESSOA = H.IDPESSOA  '||
                          '                     AND HST.IDPESSOA = H.IDPESSOA  '||
                          '                     AND HST.IDPLANOPREV = H.IDPLANOPREV  '||
                          '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV  '||
                          '                     AND POR.IDPLANOPREV = H.IDPLANOPREV  '||
                          '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO  '||
                          '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                          '                     AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||    -- edilaine - 20491
                          '                   GROUP BY H.IDTIPORESERVA,  '||
                          '                            POR.DATAOPCAOIR,  '||
                          '                            H.DATARECEBIMENTO,  '||
                          '                            (CASE '||
                          '                              WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN '||
                          '                            H.DATARECEBIMENTO '||
                          '                              ELSE '||
                          '                            HOIR.DTINICIO '||
                          '                            END) '||
                          '                   ORDER BY h.DATARECEBIMENTO)) ';

                          
      /*edilaine - 20491*/
      IF vFlgDependente = 1 THEN
         vSQLReservas := vSQLReservas ||
       '  WHERE TIPO_RESERVA = 100';
      END IF;   
      /*edilaine - 20491*/
                          
      vSQLReservas := vSQLReservas ||
                            ' GROUP BY TIPO_RESERVA, DATARECEBIMENTO '||
                            ' ORDER BY TIPO_RESERVA, DATARECEBIMENTO ';
     
    ELSIF inIdPlanoPrev = 66 THEN

      IF (vTipoOpcaoIR_Anterior <> 2) THEN
         vSQLReservas := vSQLReservas ||
                         ' SELECT HOIR.dtinicio DATARECEBIMENTO, '||
                         '        100 AS PERCENTUAL, '||
                         '        SUM(DECODE(HS.IDTIPORESERVA,     '||
                         '                  51,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  52,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  53,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  55,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  167,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  23,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  33,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
             '                  218,   ' ||                                                       -- SIG 129414 Tiago Von - Inclus o do ID 218
             '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   ' ||       -- SIG 129414 Tiago Von - Inclus o do ID 218                                                
                         '                 0)) AS VLRCOTAS   '||
                         '  FROM '||
                         '   HISTMOVRESERVA HS, HISTOPIR HOIR  '||
                         ' WHERE HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 23, 33, 218)   '|| -- SIG 129414 Tiago Von - Inclus o do ID 218     
                         '   AND HS.IDPLANOPREV  = 66   '||
                         '   AND HS.IDPESSOA     = ' || vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '   AND HS.IDPESSJUR    = '|| inIDPessJur ||
                         '   AND HOIR.IDPESSOA   = HS.IDPESSOA ' ||
                         '   AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                         '   AND HOIR.TIPOOPCAOIR = 2 ' ||  
                         '   AND HS.DATARECEBIMENTO < HOIR.DTINICIO ' ||
                         '   AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   -- edilaine - 20491
                         ' GROUP BY HOIR.dtinicio, PERCENTUAL '||
                         ' UNION ALL  ';
      END IF;

      vSQLReservas := vSQLReservas ||
                         ' SELECT HS.DATARECEBIMENTO, '||
                         '        100 AS PERCENTUAL, '||
                         '        SUM(DECODE(HS.IDTIPORESERVA,     '||
                         '                  51,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  52,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  53,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  55,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  167,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  23,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  33,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
             '                  218,   ' ||                                                                                     -- SIG 129414 Tiago Von - Inclus o do ID 218
             '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   ' ||       -- SIG 129414 Tiago Von - Inclus o do ID 218                            
                         '                 0)) AS VLRCOTAS   '||
                         '  FROM '||
                         '   HISTMOVRESERVA HS, HISTOPIR HOIR  '||
                         ' WHERE HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 23, 33, 218)   '|| -- SIG 129414 Tiago Von - Inclus o do ID 218
                         '   AND HS.IDPLANOPREV = 66   '||
                         '   AND HS.IDPESSOA = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '   AND HS.IDPESSJUR = '|| inIDPessJur ||
                         '   AND HOIR.IDPESSOA = HS.IDPESSOA ' ||
                         '   AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                         '   AND HOIR.TIPOOPCAOIR = 2 ' ||          
                         '   AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE)) ' ||
                         '   AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         ' GROUP BY HS.DATARECEBIMENTO, PERCENTUAL '||
                         ' UNION ALL  ';

      IF (vTipoOpcaoIR_Anterior <> 2) THEN
         vSQLReservas := vSQLReservas ||
                         ' SELECT HOIR.dtinicio DATARECEBIMENTO, '||
                         '        0 AS PERCENTUAL, '||
                         '        SUM(DECODE(HS.IDTIPORESERVA,   '||
                         '                  59,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  60,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  61,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  62,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS), '||
                         '                  170,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS), '||
                         '                  0)) AS VLRCOTAS   '||
                         '  FROM '||
                         '   HISTMOVRESERVA HS, HISTOPIR HOIR  '||
                         ' WHERE HS.IDTIPORESERVA IN (59, 60, 61, 62, 170)   '||
                         '   AND HS.IDPLANOPREV = 66   '||
                         '   AND HS.IDPESSOA = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '   AND HS.IDPESSJUR = '|| inIDPessJur ||
                         '   AND HOIR.IDPESSOA = HS.IDPESSOA ' ||
                         '   AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                         '   AND HOIR.TIPOOPCAOIR = 2 ' ||
                         '   AND HS.DATARECEBIMENTO < HOIR.DTINICIO ' ||
                         '   AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         ' GROUP BY HOIR.dtinicio, PERCENTUAL '||
                         ' UNION ALL  ';
      END IF;

      vSQLReservas := vSQLReservas ||
                         ' SELECT HS.DATARECEBIMENTO, '||
                         '        0 AS PERCENTUAL, '||
                         '        SUM(DECODE(HS.IDTIPORESERVA,   '||
                         '                  59,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  60,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  61,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS),   '||
                         '                  62,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS), '||
                         '                  170,   '||
                         '                  DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS), '||
                         '                  0)) AS VLRCOTAS   '||
                         '  FROM '||
                         '   HISTMOVRESERVA HS, HISTOPIR HOIR  '||
                         ' WHERE HS.IDTIPORESERVA IN (59, 60, 61, 62, 170)   '||
                         '   AND HS.IDPLANOPREV = 66   '||
                         '   AND HS.IDPESSOA = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '   AND HS.IDPESSJUR = '|| inIDPessJur ||
                         '   AND HOIR.IDPESSOA = HS.IDPESSOA ' ||
                         '   AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                         '   AND HOIR.TIPOOPCAOIR = 2 ' ||
                      '   AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE)) ' ||
                         '   AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         ' GROUP BY HS.DATARECEBIMENTO, PERCENTUAL '||
                         ' UNION ALL  ' ||

                         --PORTADAS
                         '      SELECT TO_DATE(DATAR,''dd/mm/yyyy'') AS datarecebimento,' || --SIG 100613
                         '             100 PERCENTUAL, '||
                         '             SUM(vlrcotas) vlrcotas '||
                         '       FROM (     '||
                         '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA,'||
                         '                   H.MESREFERENCIA,'||
                         '                   POR.DATAOPCAOIR,'||
                         --'                   H.DATARECEBIMENTO AS DATAR, '|| --SIG 100613
                         '                   ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATAR,' || --SIG 100613                         
             '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS'||
                         '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H'||--,ENTIDADEORIGEM EE'||-- RAFAEL VASCONCELOS || SIG 37151,55019
                         '                   WHERE POR.idpessoa = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '                     AND POR.idpessjur = '|| inIDPessJur ||
                         '                     AND POR.idplanoprev = 66 '||
                          --'                     --AND ((EE.IDENTIDADEORIGEM=POR.IDENTIDADEORIGEM '|| -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          --'                     --AND EE.tipo = ''A'') or (por.tipo=''A'')) '||      -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          '                    AND por.tipo=''A'' '|| -- RAFAEL VASCONCELOS 55019
                         '                     AND POR.opcaoir = ''R''  '||
                         '                     AND H.IDTIPORESERVA IN (117) '||
                         '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '||
                         '                     AND POR.IDPESSOA = HST.IDPESSOA '||
                         '                     AND POR.IDPESSOA = H.IDPESSOA '||
                         '                     AND HST.IDPESSOA = H.IDPESSOA '||
                         '                     AND HST.IDPLANOPREV = H.IDPLANOPREV '||
                         '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV '||
                         '                     AND POR.IDPLANOPREV = H.IDPLANOPREV '||
                         '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO '||
                         '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                         '                     AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         '                   GROUP BY H.IDTIPORESERVA, '||
                         '                            H.MESREFERENCIA, '||
                         '                            POR.DATAOPCAOIR, '||
                         '                            H.DATARECEBIMENTO '||
                         '                   ORDER BY mesreferencia)  ' ||
                         ' GROUP BY DATAR   '||
                         --PORTADAS (PROGRESSIVAS QUANDO O PARTICIPANTE   REGRESSIVO)
                         '      UNION ALL   '||
                         '      SELECT DATAR AS DATARECEBIMENTO, '||
                         '             100 PERCENTUAL, '||
                         '             VLRCOTAS '||
                         '       FROM (     '||
                         '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, '||
                         '                   POR.DATAOPCAOIR, '||
                         '                   (CASE '||
                         '                     WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN '||
                         '                      H.DATARECEBIMENTO '||
                         '                     ELSE '||
                         '                      HOIR.DTINICIO '||
                         '                   END) AS DATAR, '||
                         '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS '||
                         '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, HISTOPIR HOIR'||--,ENTIDADEORIGEM EE '||-- RAFAEL VASCONCELOS || SIG 37151,55019
                         '                   WHERE POR.idpessoa =  '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '                     AND POR.idpessjur =  '|| inIDPessJur ||
                         '                     AND POR.idplanoprev = 66  '||
                          --'                     --AND ((EE.IDENTIDADEORIGEM=POR.IDENTIDADEORIGEM '|| -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          --'                     --AND EE.tipo = ''A'') or (por.tipo=''A'')) '||      -- RAFAEL VASCONCELOS || SIG 37151 , 55019
                          '                    AND por.tipo=''A'' '|| -- RAFAEL VASCONCELOS 55019
                         '                     AND POR.opcaoir = ''P''   '||
                         '                     AND H.IDTIPORESERVA IN (117)  '||
                         '                     AND HOIR.IDPESSOA = H.IDPESSOA '||
                         '                     AND HOIR.IDPLANPREV = H.IDPLANOPREV  '||
                         '                     AND HOIR.TIPOOPCAOIR = 2  '||
                         '                     AND HOIR.DTFIM IS NULL '||
                         '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE  '||
                         '                     AND POR.IDPESSOA = HST.IDPESSOA  '||
                         '                     AND POR.IDPESSOA = H.IDPESSOA  '||
                         '                     AND HST.IDPESSOA = H.IDPESSOA  '||
                         '                     AND HST.IDPLANOPREV = H.IDPLANOPREV  '||
                         '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV  '||
                         '                     AND POR.IDPLANOPREV = H.IDPLANOPREV  '||
                         '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO  '||
                         '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                         '                     AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         '         GROUP BY H.IDTIPORESERVA,'||
                         '                  POR.DATAOPCAOIR,'||
                         '                  HOIR.DTINICIO,'||
                         '                  (CASE'||
                         '                    WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN'||
                         '                     H.DATARECEBIMENTO'||
                         '                    ELSE'||
                         '                     HOIR.DTINICIO'||
                         '                  END)'||
                         '         ORDER BY (CASE'||
                         '                    WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN'||
                         '                     H.DATARECEBIMENTO'||
                         '                    ELSE'||
                         '                     HOIR.DTINICIO'||
                         '                  END))' ||
                         ' ORDER BY 1 ';                          
    END IF;
          
     
    RETURN vSQLReservas;
  
  END;
  -- FIM Function FN_MontaConsultaReserva ----------------------------------------------------



  -- Function FN_MontaConsultaNovaReserva ----------------------------------------------------------------------
  FUNCTION FN_MontaConsultaNovaReserva(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE,
                                       inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE,
                                       inIdPlanoPrev  IN PLS_INTEGER,    /*SIG20491*/
                                       inSeqResgate   IN NUMBER,         /*SIG20491*/
                                       inCalcRetencao IN PLS_INTEGER,
                                       inTipoCalculo  IN PLS_INTEGER DEFAULT 2    /*WO9102*/ 
                                      ) RETURN VARCHAR2
  IS
    vSQLReservas   VARCHAR2(20000);
  
    vTipoOpcaoIR_Atual NUMBER;
    vTipoOpcaoIR_Anterior NUMBER;
    vIDPessoaPesq  PLS_INTEGER;
    vFLGTipoOpcaoIRPortada PLS_INTEGER;
    vSeqResgateTotal PLS_INTEGER;
  BEGIN

    vSeqResgateTotal := inSeqResgate;
    IF inCalcRetencao = 1 THEN
       vSeqResgateTotal := 0;
    END IF;
    
    vSQLReservas :='';
    
    IF inIdPlanoPrev = 66 THEN
       vIDPessoaPesq := inIDPessoa;
    ELSE
       vIDPessoaPesq := vIDPESSOA_TITULAR;  -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
    END IF;

    IF inIdPlanoPrev = 74 THEN
      vSQLReservas := ' SELECT TIPO_RESERVA, DATARECEBIMENTO AS MESREFERENCIA, SUM(QTDE_COTAS) AS VLRCOTAS  '||
                      ' FROM (  ' ||
                      '    SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, '||
                      '           to_date(''01/'' || replace(substr(hs.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hs.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO,' ||
                      --'           HS.DATARECEBIMENTO,   '||
                      '           DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS) AS QTDE_COTAS,   '||
                      '           0 AS TIPOCALCULO  '||   /*WO9102*/  
                      '      FROM HISTMOVRESERVA HS '||
                      '     WHERE HS.IDPESSJUR   = '|| inIDPessJur ||
                      '       AND HS.IDPESSOA    = '|| vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                      '       AND HS.IDPLANOPREV = 74   '||
                      '       AND HS.IDTIPORESERVA IN (100, 101, 217)   '|| -- SIG 129414 Tiago Von - Inclus o do ID 217
                      ' and hs.idbeneficio is null '||
                      '       AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||    /*edilaine - 20491*/

                      -- Tipo de Reserva: PORTADAS
                      '      UNION ALL   '||
                      '      SELECT TIPO_RESERVA, '||
                      '             TO_DATE(DATARECEBIMENTO,''dd/mm/yyyy'') AS MESREFERENCIA,' || --SIG 100613              
                      '             VLRCOTAS, '||
                      '             TIPOCALCULO  '||   /*WO9102*/  
                      '        FROM (        '||
                      '              SELECT H.IDTIPORESERVA AS TIPO_RESERVA, '||
                      '                     H.MESREFERENCIA, '||
                      '                     POR.DATAOPCAOIR, '||
                      '                     ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || --SIG 100613              
                      '                     SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS, '||
                      '                     (select nvl(FLGREGRESSIVA,0) from reservaxplano r where r.idtiporeserva = h.idtiporeserva and h.idplanoprev = r.idplanoprev) AS TIPOCALCULO '|| --Roberta
                      '                from hstcontribprev hst  '||
                      '                 join portabilidadeprev por on por.idplanoprev = hst.idplanoprev '||
                      '                  and hst.idportabilidade = por.idportabilidade '||
                      '                  and por.idpessoa = hst.idpessoa '||                                            
                      '                 join histmovreserva h on por.idpessoa = h.idpessoa '||
                      '                  and hst.idplanoprev = h.idplanoprev '||
                      '                  and hst.numrecebimento = h.numrecebimento '||
                      '                  and por.idpessjur = h.idpessjur '||
                      '                  and hst.idpessoa = h.idpessoa '||
                      '                  and por.idplanoprev = h.idplanoprev '|| --,ENTIDADEORIGEM EE|| RAFAEL VASCONCELOS || SIG 37151,55019
                      '                 join contribuicao c on c.idcontribuicao = por.idcontribuicao '||
                      '               WHERE POR.idpessoa = '|| vIDPESSOA_TITULAR || --|| inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                      '                 AND POR.idpessjur = '|| inIDPessJur ||
                      '                 AND POR.idplanoprev = 74 '||
                      '                 and (por.tipo = ''A'' or (por.tipo is null and c.tipoportabilidade = ''A'')) '|| -- RAFAEL VASCONCELOS 55019
                      '                 AND H.IDTIPORESERVA IN (select idtiporeserva from reservaxplano where flgportabilidade = 1) ' || --SIG 117253
                      '                 AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||    /*edilaine - 20491*/
                      '               GROUP BY H.IDTIPORESERVA, '||
                      '                        H.MESREFERENCIA, '||
                      '                        POR.DATAOPCAOIR, '||
                      '                        H.DATARECEBIMENTO, '||
                      '                         h.idplanoprev '|| --Roberta
                      '               ORDER BY mesreferencia))   '||
                      ' WHERE 1 = 1 ';
                                 
      /*edilaine - 20491*/
      IF vFlgDependente = 1 THEN
         vSQLReservas := vSQLReservas || '  AND TIPO_RESERVA = 100';
      END IF;   
      /*edilaine - 20491*/
      
      /*WO9102 : inicio*/
      IF inTipoCalculo <> 2 then
         vSQLReservas := vSQLReservas || '  AND TIPOCALCULO = '||inTipoCalculo;      
      END IF;
      /*WO9102 : fim*/
                          
      vSQLReservas := vSQLReservas ||
                            ' GROUP BY TIPO_RESERVA, DATARECEBIMENTO, tipocalculo '||
                            ' ORDER BY TIPO_RESERVA, DATARECEBIMENTO ';
     
    ELSIF inIdPlanoPrev = 66 THEN

      vSQLReservas := ' SELECT DATARECEBIMENTO, PERCENTUAL, SUM(vlrcotas) AS VLRCOTAS  '||
                      ' FROM (  ' ||
                         ' SELECT to_date(''01/'' || replace(substr(hs.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hs.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '||
                         --HS.DATARECEBIMENTO, '||
                         '        100 AS PERCENTUAL,  '||
                         '        0 AS TIPOCALCULO,   '||   /*WO9102*/                          
                         '        sum(decode(hs.flgentrada, 1, hs.vlrcotas, -hs.vlrcotas)) vlrcotas '||        
                         '   FROM '||
                         '        HISTMOVRESERVA HS '||
                         '   join  reservaxplano r on r.idplanoprev = hs.idplanoprev and r.idtiporeserva = hs.idtiporeserva '||
                         '  WHERE HS.IDPLANOPREV   = 66  '||
                         '    and (r.CODHIERARQUIA like ''11%'' ' ||
                         '     or hs.idtiporeserva = 167 '||
                         '     or hs.idtiporeserva = 218) '||
                         '    and r.ANALITICOSINTETI = ''A'' '||
                         '    and hs.idtiporeserva <> 79  '||             /*WO10872*/
                         '    AND HS.IDPESSOA     = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '    AND HS.IDPESSJUR    = '|| inIDPessJur ||
                         '    and nvl(r.FLGPORTABILIDADE, 0) = 0 '||
                         '    and hs.idbeneficio is null '||
                         '    AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         ' GROUP BY HS.mesreferencia'||
                         ' UNION ALL  '||

                         ' SELECT to_date(''01/'' || replace(substr(hs.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hs.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '||
                         --HS.DATARECEBIMENTO, '||
                         '        0 AS PERCENTUAL,    '||
                         '        0 AS TIPOCALCULO,   '||   /*WO9102*/     
                         '                sum(decode(hs.flgentrada, 1, hs.vlrcotas, -hs.vlrcotas)) vlrcotas '||     
                         '   FROM '||
                         '        HISTMOVRESERVA HS  '||
                         '   join reservaxplano r on r.idplanoprev = hs.idplanoprev and r.idtiporeserva = hs.idtiporeserva '||
                         '  WHERE HS.IDPLANOPREV = 66   '||
                         '    and r.CODHIERARQUIA like ''12%'' '||
                         '    and hs.idtiporeserva <> 167 '||
                         '    and r.ANALITICOSINTETI = ''A'' '||
                         '    AND HS.IDPESSOA    = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '    AND HS.IDPESSJUR   = '|| inIDPessJur ||
                         '    AND ( '||vSeqResgateTotal||' = -1 OR NVL(HS.SEQRESGATE,0) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         ' GROUP BY HS.mesreferencia '||
                         ' UNION ALL  ' ||

                         --PORTADAS
                         ' SELECT TO_DATE(PT.DATAR,''dd/mm/yyyy'') AS datarecebimento,' || --SIG 100613
                         '        100 PERCENTUAL,    '||
                         '        TIPOCALCULO,  '||   /*WO9102*/                           
                         '        SUM(PT.vlrcotas) vlrcotas '||
                         '   FROM (     '||
                         '         SELECT H.IDTIPORESERVA AS TIPO_RESERVA,'||
                         '                H.MESREFERENCIA,'||
                         '                POR.DATAOPCAOIR,'||
                         '                ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATAR,' || --SIG 100613                         
                         '                SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS,'||
                         '                (select nvl(FLGREGRESSIVA,0) from reservaxplano r where r.idtiporeserva = h.idtiporeserva and h.idplanoprev = r.idplanoprev) AS TIPOCALCULO '|| --Roberta
                         '           from hstcontribprev hst  '||
                         '           join portabilidadeprev por on por.idplanoprev = hst.idplanoprev '||
                         '            and hst.idportabilidade = por.idportabilidade '||
                         '            and por.idpessoa = hst.idpessoa '||                                            
                         '           join histmovreserva h on por.idpessoa = h.idpessoa '||
                         '            and hst.idplanoprev = h.idplanoprev '||
                         '            and hst.numrecebimento = h.numrecebimento '||
                         '            and por.idpessjur = h.idpessjur '||
                         '            and hst.idpessoa = h.idpessoa '||
                         '            and por.idplanoprev = h.idplanoprev'|| --,ENTIDADEORIGEM EE|| RAFAEL VASCONCELOS || SIG 37151,55019
                         '           join contribuicao c on c.idcontribuicao = por.idcontribuicao '||                        
                         '          WHERE POR.idpessoa = '|| vIDPESSOA_TITULAR || -- || inIDPessoa || OTACILIO KINTANA 1501823 SOL 167930
                         '            AND POR.idpessjur = '|| inIDPessJur ||
                         '            AND POR.idplanoprev = 66 '||
                         '            and (por.tipo = ''A'' or (por.tipo is null and c.tipoportabilidade = ''A'')) '|| -- RAFAEL VASCONCELOS 55019
                         '            AND H.IDTIPORESERVA IN (select idtiporeserva from reservaxplano where flgportabilidade = 1) '||
                         '            AND ( '||vSeqResgateTotal||' = -1 OR NVL(H.SEQRESGATE,-1) = '||inSeqResgate||')' ||   /*edilaine - 20491*/                         
                         '          GROUP BY H.IDTIPORESERVA, '||
                         '                   H.MESREFERENCIA, '||
                         '                   POR.DATAOPCAOIR, '||
                         '                   H.DATARECEBIMENTO,  '||
                         '                   h.idplanoprev '|| --Roberta
                         '          ORDER BY mesreferencia) PT '||
                         '          GROUP BY PT.DATAR, TIPOCALCULO )  ';
                      
      /*WO9102 : inicio*/
      IF inTipoCalculo <> 2 then
         vSQLReservas := vSQLReservas || '  WHERE TIPOCALCULO = ' || inTipoCalculo;      
      END IF;
      /*WO9102 : fim*/
                         
      vSQLReservas := vSQLReservas ||
                            ' GROUP BY DATARECEBIMENTO, TIPOCALCULO, PERCENTUAL '||
                            ' ORDER BY DATARECEBIMENTO ';

    END IF;
               
    RETURN vSQLReservas;
  
  END;
  -- FIM Function FN_MontaConsultaNovaReserva ----------------------------------------------------




  -- FN_Verifica_Data_Ano_Bissexto -----------------------------------------------------------
  FUNCTION FN_Verifica_Data_Ano_Bissexto(vData IN DATE DEFAULT SYSDATE,
                                         vMes  IN PLS_INTEGER DEFAULT 0)
    RETURN PLS_INTEGER IS
    vDIA             PLS_INTEGER;
    block_to_execute VARCHAR(200);
  BEGIN
    block_to_execute := ' BEGIN ' ||
                       --' SELECT TO_CHAR(TO_DATE(ADD_MONTHS(''' || vData || ''',' || vMes || '), ''DD/MM/YYYY''), ''DD'') AS DIA ' ||
                        ' SELECT TO_CHAR(ADD_MONTHS(TO_DATE(''' || vData ||
                        ''',''DD/MM/YY''), ' || vMes ||
                        '),''DD'' ) AS DIA ' || ' INTO :1 ' ||
                        ' FROM DUAL ;' || ' END;';
    BEGIN
      EXECUTE IMMEDIATE block_to_execute
        USING OUT vDIA;
    END;
    RETURN(vDIA);
  END FN_Verifica_Data_Ano_Bissexto;
  -- FIM FN_Verifica_Data_Ano_Bissexto------------------------------------------------------------------------


  -- Function FN_VerificaTitularFalecido ---------------------------------------------------------------------
  FUNCTION FN_VerificaTitularFalecido(inIDTitular IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                      inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE
                                      ) RETURN PLS_INTEGER
  IS
    vFlgCalcDepen    PLS_INTEGER;
  block_to_execute VARCHAR(2000);
  BEGIN
    block_to_execute := ' BEGIN ' ||
                        '   SELECT DECODE(PF.DATAMORTE, NULL, 0, 1) INTO :1 ' ||
                        '   FROM   PESSOAFISICA PF ' ||
            '   WHERE  PF.IDPESSOA = ' || inIDTitular  ||
            '     AND (SELECT COUNT(*) ' ||
            '            FROM ( ' || 
                                FN_MontaQuerySelBeneficiarios(inIDTitular, inIDPlanoPrev) || 
            '                 ) ' ||
            /*'        ) > 1; ' ||*/     /*SIG136119*/
            '        ) >= 1; ' ||      /*SIG136119*/
                        ' END;'; 
    BEGIN
      dbms_output.put_line(block_to_execute);

      log_consulta('FN_VerificaTitularFalecido', block_to_execute );
    
      EXECUTE IMMEDIATE block_to_execute USING OUT vFlgCalcDepen;
      
    EXCEPTION
      WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
      vFlgCalcDepen := 0;
    END;

    RETURN(vFlgCalcDepen); 
  END;
  -- FIM Function FN_VerificaTitularFalecido ----------------------------------------------------------------


  -- Procedure PR_LimpaVarGlobal ----------------------------------------------------------------------------
  PROCEDURE PR_LimpaVarGlobal IS
  BEGIN
    vVLRIndice_REB               := 0;
    vVLRIndice_NP                := 0;
    vMigraREGREPLAN_REB          := 0;
    vBenefRisco                  := 0;
    vDataAssociacao              := NULL;
    vVLRRes_Ate2Anos_Cotas       := 0;
    vVLRRes_2A4Anos_Cotas        := 0;
    vVLRRes_4A6Anos_Cotas        := 0;
    vVLRRes_6A8Anos_Cotas        := 0;
    vVLRRes_8A10Anos_Cotas       := 0;
    vVLRRes_Sup10Anos_Cotas      := 0;
    vVLRResRisco_Ate6Anos_Cotas  := 0;
    vVLRResRisco_6A8Anos_Cotas   := 0;
    vVLRResRisco_8A10Anos_Cotas  := 0;
    vVLRResRisco_Sup10Anos_Cotas := 0;
  END;
  -- FIM Procedure PR_LimpaVarGlobal ------------------------------------------------------------------------

  -- Procedure PR_CarregaVarIndices -------------------------------------------------------------------------
  PROCEDURE PR_CarregaVarIndices(inIDPessJur   IN ELEGPATRO.IDPESSJUR%TYPE,
                                 inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                                 inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE) IS
    vSQLIndice_REB VARCHAR(2000);
    vSQLIndice_NP  VARCHAR(2000);
  BEGIN
    -- Indice REB
    IF inIDPlanoPrev = 66 THEN
      vSQLIndice_REB := ' SELECT DISTINCT CO.COTVALOR ' ||
                        ' FROM RESERVAPART RS, ' ||
                        '      RESERVAXPLANO TP,  ' ||
                        '      PLANPREV PV,  ' ||
                        '      COTACAOMOEDA CO,  ' || '      MOEDA,  ' ||
                        '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX  ' ||
                        '         FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1  ' ||
                        '        WHERE (RP1.IDPESSJUR =' || inIDPessJur || ')' ||
                        '   AND (RP1.IDPESSOA = ' || vIDPESSOA_TITULAR || ')' || --  || inIDPessoa || ')' || OTACILIO KINTANA 1501823 SOL 167930
                        '   AND (RP1.IDPLANOPREV = 66) ' ||
                        '   AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV) ' ||
                        '   AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA) ' ||
                        '   AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE) ' ||
                        ' GROUP BY TP1.INDICEREAJUSTE) MAXDATA ' ||
                        ' WHERE (RS.IDPESSJUR = ' || inIDPessJur || ')' ||
                        '   AND (RS.IDPESSOA = ' || vIDPESSOA_TITULAR || ')' || -- || inIDPessoa || ')' || OTACILIO KINTANA 1501823 SOL 167930
                        '   AND (RS.IDPLANOPREV = 66) ' ||
                        '   AND (TP.FLGCONTROLE = 0) ' ||
                        '   AND (TP.IDPLANOPREV = RS.IDPLANOPREV) ' ||
                        '   AND (TP.IDTIPORESERVA = RS.IDTIPORESERVA) ' ||
                        '   AND (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+)) ' ||
                        '   AND (TP.ANALITICOSINTETI = ''A'') ' ||
                        '   AND (PV.IDPLANOPREV = RS.IDPLANOPREV) ' ||
                        '   AND (CO.MOECODIGO(+) = MAXDATA.INDICERE) ' ||
                        '   AND (CO.COTDATA(+) = MAXDATA.DATAMAX) ' ||
                        '   AND (MOEDA.MOECODIGO(+) = TP.INDICEREAJUSTE) ' ||
                        '   AND (CO.COTVALOR IS NOT NULL) AND ROWNUM < 2  ';
      BEGIN
        -- EXCEPTION
        log_consulta('Carrega indices - REB', vSQLIndice_REB);
        EXECUTE IMMEDIATE vSQLIndice_REB
          INTO vVLRIndice_REB;
      EXCEPTION
        WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
          BEGIN
            vVLRIndice_REB := 0;
          END;
        WHEN PCK_ALL_ERRO.ERRO_SELECT_MAIS_DE_UMA_LINHA THEN
          BEGIN
            vVLRIndice_REB := 0;
          END;
      END;
      -- Indice NOVO PLANO
    ELSIF inIDPlanoPrev = 74 THEN
      vSQLIndice_NP := ' SELECT DISTINCT CO.COTVALOR ' ||
                       ' FROM RESERVAPART RS, ' ||
                       '      RESERVAXPLANO TP,  ' ||
                       '      PLANPREV PV,  ' || '      COTACAOMOEDA CO,  ' ||
                       '      MOEDA,  ' ||
                       '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX  ' ||
                       '         FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1  ' ||
                       '        WHERE (RP1.IDPESSJUR = ' || inIDPessJur || ')' ||
                       '   AND (RP1.IDPESSOA = ' || vIDPESSOA_TITULAR || ')' || -- || inIDPessoa || ')' || OTACILIO KINTANA 1501823 SOL 167930
                       '   AND (RP1.IDPLANOPREV = 74) ' ||
                       '   AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV) ' ||
                       '   AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA) ' ||
                       '   AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE) ' ||
                       ' GROUP BY TP1.INDICEREAJUSTE) MAXDATA ' ||
                       ' WHERE (RS.IDPESSJUR = ' || inIDPessJur || ')' ||
                       '   AND (RS.IDPESSOA = ' || vIDPESSOA_TITULAR || ')' || -- || inIDPessoa || ')' || OTACILIO KINTANA 1501823 SOL 167930
                       '   AND (RS.IDPLANOPREV = 74) ' ||
                       '   AND (TP.FLGCONTROLE = 0) ' ||
                       '   AND (TP.IDPLANOPREV = RS.IDPLANOPREV) ' ||
                       '   AND (TP.IDTIPORESERVA = RS.IDTIPORESERVA) ' ||
                       '   AND (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+)) ' ||
                       '   AND (TP.ANALITICOSINTETI = ''A'') ' ||
                       '   AND (PV.IDPLANOPREV = RS.IDPLANOPREV) ' ||
                       '   AND (CO.MOECODIGO(+) = MAXDATA.INDICERE) ' ||
                       '   AND (CO.COTDATA(+) = MAXDATA.DATAMAX) ' ||
                       '   AND (MOEDA.MOECODIGO(+) = TP.INDICEREAJUSTE) ' ||
                       '   AND (CO.COTVALOR IS NOT NULL) AND ROWNUM < 2  ';
      BEGIN
        -- EXCEPTION
        log_consulta('Carrega indices - NP', vSQLIndice_NP);
        EXECUTE IMMEDIATE vSQLIndice_NP
          INTO vVLRIndice_NP;
      EXCEPTION
        WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
          BEGIN
            vVLRIndice_NP := 0;
          END;
        WHEN PCK_ALL_ERRO.ERRO_SELECT_MAIS_DE_UMA_LINHA THEN
          BEGIN
            vVLRIndice_NP := 0;
          END;
      END;
    END IF;
  END;
  -- FIM Procedure PR_CarregaVarIndices ----------------------------------------------------------------------


  -- Procedure PR_CarregaVar_Regra --------------------------------------------------------------------------
  PROCEDURE PR_CarregaVar_Regra IS
    vDiaAtual PLS_INTEGER;
    vMesAtual PLS_INTEGER;
    vAnoAtual PLS_INTEGER;
  BEGIN
    IF (vFLGTipoOpcaoIR = 'R') THEN
      vIDTipoOpcaoIR   := 2;
      vDescTipoOpcaoIR := 'REGRESSIVO';
    ELSE
      vIDTipoOpcaoIR   := 1;
      vDescTipoOpcaoIR := 'PROGRESSIVO';
    END IF;
    -- Pega a data Atual
    SELECT Substr(TO_char(vDataPrevista, 'DD/MM/YYYY'), 1, 2),
           SubStr(To_Char(vDataPrevista, 'DD/MM/YYYY'), 4, 2),
           SubStr(TO_char(vDataPrevista, 'DD/MM/YYYY'), 7, 4)
      INTO vDiaAtual, vMesAtual, vAnoAtual
      FROM dual;
    -- Tempo de Associação ----------------------------------------------------------------------------------
    -- OTACILIO SOL167930 KINTANA 1501823
    -- Caso a data seja ano Bissexto pegar a ultima dia do mes
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -132);
    -- Na função abaixo é subtraido 11 anos por isso é passado -132 meses na função
    -- Qtde em dias -> Até 10 anos e 364 dias ou 365 no caso de ano Bissexto
    vAssoc_10Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                            vMesAtual || '/' ||
                                                                            (vAnoAtual - 11),
                                                                            'DD/MM/YYYY'),
                                                                    To_Char(vDataPrevista,
                                                                            'DD/MM/YYYY')) - 1;
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -192);
    -- Na função abaixo é subtraido 16 anos por isso é passado -192 meses na função
    -- Qtde em dias -> De 11 anos a 15 anos e 364 dias ou 365 no caso de ano Bissexto
    vAssoc_15Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                            vMesAtual || '/' ||
                                                                            (vAnoAtual - 16),
                                                                            'DD/MM/YYYY'),
                                                                    To_Char(vDataPrevista,
                                                                            'DD/MM/YYYY')) - 1;
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -252);
    -- Na função abaixo é subtraido 21 anos por isso é passado -252 meses na função
    -- Qtde em dias -> De 16 anos a 20 anos e 364 dias ou 365 no caso de ano Bissexto
    vAssoc_20Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                            vMesAtual || '/' ||
                                                                            (vAnoAtual - 21),
                                                                            'DD/MM/YYYY'),
                                                                    To_Char(vDataPrevista,
                                                                            'DD/MM/YYYY')) - 1;
    -- Qtde em dias -> A partir de 21 anos (Nesse caso nao usa a subtração -1 ao final)
    vAssoc_21Anos_QtdeDias := vAssoc_20Anos_QtdeDias + 1;
    -- FIM Tempo de Associação ------------------------------------------------------------------------------
    -- Idade das Reservas -----------------------------------------------------------------------------------
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -24);
    -- Na função abaixo é subtraido 2 anos por isso é passado -24 meses na função
    -- Até 2 Anos
    vRes_Ate2Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                            vMesAtual || '/' ||
                                                                            (vAnoAtual - 2),
                                                                            'DD/MM/YYYY'),
                                                                    To_Char(vDataPrevista,
                                                                            'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -48);
    -- Na função abaixo é subtraido 4 anos por isso é passado -48 meses na função
    -- De 2 a 4 anos
    vRes_2A4Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                           vMesAtual || '/' ||
                                                                           (vAnoAtual - 4),
                                                                           'DD/MM/YYYY'),
                                                                   To_Char(vDataPrevista,
                                                                           'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -72);
    -- Na função abaixo é subtraido 6 anos por isso é passado -72 meses na função
    -- De 4 a 6 anos
    vRes_4A6Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                           vMesAtual || '/' ||
                                                                           (vAnoAtual - 6),
                                                                           'DD/MM/YYYY'),
                                                                   To_Char(vDataPrevista,
                                                                           'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -96);
    -- Na função abaixo é subtraido 8 anos por isso é passado -96 meses na função
    -- De 6 a 8 anos
    vRes_6A8Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                           vMesAtual || '/' ||
                                                                           (vAnoAtual - 8),
                                                                           'DD/MM/YYYY'),
                                                                   To_Char(vDataPrevista,
                                                                           'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -120);
    -- Na função abaixo é subtraido 10 anos por isso é passado -120 meses na função
    -- De 8 a 10 anos
    vRes_8A10Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                            vMesAtual || '/' ||
                                                                            (vAnoAtual - 10),
                                                                            'DD/MM/YYYY'),
                                                                    To_Char(vDataPrevista,
                                                                            'DD/MM/YYYY'));
    -- De Superior a 10 Anos
    vRes_Sup10Anos_QtdeDias := vRes_8A10Anos_QtdeDias + 1;
    -- FIM Idade das Reservas -------------------------------------------------------------------------------
    -- Idade das Reservas de Risco -------------------------------------------------------------------------
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -72);
    -- Na função abaixo é subtraido 6 anos por isso é passado -72 meses na função
    -- Até 6 Anos
    vResRisco_Ate6Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                                 vMesAtual || '/' ||
                                                                                 (vAnoAtual - 6),
                                                                                 'DD/MM/YYYY'),
                                                                         To_Char(vDataPrevista,
                                                                                 'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -96);
    -- Na função abaixo é subtraido 8 anos por isso é passado -96 meses na função
    -- De 6 a 8 Anos
    vResRisco_6A8Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                                vMesAtual || '/' ||
                                                                                (vAnoAtual - 8),
                                                                                'DD/MM/YYYY'),
                                                                        To_Char(vDataPrevista,
                                                                                'DD/MM/YYYY'));
    -- OTACILIO SOL167930 KINTANA 1501823
    vDiaAtual := FN_Verifica_Data_Ano_Bissexto(vDataprevista, -120);
    -- Na função abaixo é subtraido 10 anos por isso é passado -120 meses na função
    -- De 8 a 10 Anos
    vResRisco_8A10Anos_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(To_Date(vDiaAtual || '/' ||
                                                                                 vMesAtual || '/' ||
                                                                                 (vAnoAtual - 10),
                                                                                 'DD/MM/YYYY'),
                                                                         To_Char(vDataPrevista,
                                                                                 'DD/MM/YYYY'));
    -- De Superior a 10 Anos
    vResRisco_Sup10Anos_QtdeDias := vResRisco_8A10Anos_QtdeDias + 1;
    -- FIM Idade das Reservas de Risco ---------------------------------------------------------------------
  END;
  -- FIM Procedure PR_CarregaVar_Regra ---------------------------------------------------------------------


  -- Procedure PR_CarregaDataAssociacao ----------------------------------------------------------------------
  PROCEDURE PR_CarregaDataAssociacao( /*inDataAssociacao IN DATE, OTACILIO SOL181765*/
                                     inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                                     inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE) IS
    vSQLSituacao          VARCHAR(200);
    vSQLDTUltContribuicao VARCHAR(200);
    vExiste               PLS_INTEGER;
    -- OTACILIO SOL181765
    inDataAssociacao DATE;
  BEGIN
    -- OTACILIO SOL181765 INICIO
    DECLARE
      block_to_execute VARCHAR(200) := ' BEGIN ' || ' SELECT DTINICIOINSC ' ||
                                       ' INTO :1 ' ||
                                       ' FROM   PARTPREVPLAN  ' ||
                                       ' WHERE  IDPESSOA    = ' ||
                                       inIDPessoa ||
                                       ' AND    IDPLANOPREV = ' ||
                                       inIDPlanoPrev || '; ' || -- Fernando Xavier SOL 182771 KTN 1705288
                                      ---DATACANCELAMENTO IS NULL ' || -- Fernando Xavier SOL 182771 KTN 1705288
                                       ' END;';
    BEGIN
      EXECUTE IMMEDIATE block_to_execute
        USING OUT inDataAssociacao;
    END;
    -- OTACILIO SOL181765 FIM
    IF (inIDPlanoPrev = 74 or inIDPlanoPrev = 66) THEN     --Rafael Vasconcelos  - SIG 47052
      --OTACILIO SOL181765
      vDataAssociacao := inDataAssociacao;
    ELSIF (inIDPlanoPrev = /*66*/ 00) THEN      --Rafael Vasconcelos - SIG 47052
      BEGIN      -- EXCEPTION
        vSQLSituacao          := 'SELECT 1 AS EXISTE' ||
                                 '  FROM PARTPREVPLAN ' ||
                                 ' WHERE DATACANCELAMENTO IS NULL ' ||
                                 '   AND FLGDESATIVADO = 0 ' ||
                                 '   AND IDPESSOA = ' || inIDPessoa ||
                                 '   AND ROWNUM < 2 ';
                                 
        vSQLDTUltContribuicao := ' SELECT MAX(DATARECEBIMENTO) AS INSCRICAODATA ' ||
                                 ' FROM HSTCONTRIBPREV ' ||
                                 ' WHERE IDPESSOA = ' || inIDPessoa ||
                                 '  AND IDPLANOPREV = ' || inIDPlanoPrev;
                                 
        EXECUTE IMMEDIATE vSQLSituacao INTO vExiste;
        
        vDataAssociacao := inDataAssociacao;
        
      EXCEPTION
        WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
          BEGIN
            BEGIN
              -- EXCEPTION
              EXECUTE IMMEDIATE vSQLDTUltContribuicao
                INTO vDataAssociacao;
            EXCEPTION
              WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
                BEGIN
                  vDataAssociacao := inDataAssociacao;
                END;
            END;
          END;
      END;
    END IF;
  END;
  -- FIM Procedure PR_CarregaDataAssociacao ------------------------------------------------------------------


  -- Procedure PR_VerificaBenefRisco -------------------------------------------------------------------------
  PROCEDURE PR_VerificaBenefRisco(inIDPessoa IN ELEGPATRO.IDPESSOA%TYPE) IS
    vSQLBenefRisco VARCHAR(1000);
  BEGIN
    vSQLBenefRisco := ' SELECT 1 ' || '  FROM PESSOAFISICA ' ||
                      ' WHERE IDPESSOA = ' || inIDPessoa || ' AND ( ' ||
                      '       ( ' || -- Moléstia
                      '         FLGMOLESTIAGRAVE = 1 AND ' ||
                      '         ((DATAFIMMOLESTIA >= to_date(' ||
                      PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(vDataPrevista) ||
                      ',''DD/MM/YY'')) OR ' ||
                      '         ((DATAMOLESTIAGRAVE IS NOT NULL) AND (DATAFIMMOLESTIA IS NULL))) ' ||
                      '        ) ' || '       OR  ' || '       ( ' || -- Invalidez
                      '         (INICIOINVALIDEZ >= to_date(' ||
                      PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(vDataPrevista) ||
                      ',''DD/MM/YY'')) OR ' ||
                      '         ((INICIOINVALIDEZ IS NOT NULL) AND (FIMINVALIDEZ IS NULL)) ' ||
                      '       ) ' || '     ) ' || ' AND ROWNUM < 2 ';
    BEGIN
      -- EXCEPTION
      EXECUTE IMMEDIATE vSQLBenefRisco
        INTO vBenefRisco;
    EXCEPTION
      WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
        BEGIN
          vBenefRisco := 0;
        END;
    END;
  END;
  -- FIM - Procedure PR_VerificaBenefRisco -------------------------------------------------------------------


  -- Procedure PR_VerificaMigracaoPlanos ---------------------------------------------------------------------
  PROCEDURE PR_VerificaMigracaoPlanos(inIDPessoa IN ELEGPATRO.IDPESSOA%TYPE) IS
    vSQLMigraPlano VARCHAR(1000);
  BEGIN
    -- Migração do REG/REPLAN para o REB na situação de ativo.
    vSQLMigraPlano := ' SELECT COUNT(*)  ' || '  FROM ( ' ||
                      '        SELECT 1 ' || -- Ativo
                      '          FROM PARTPREVPLAN ' ||
                      '         WHERE IDPESSOA = ' || inIDPessoa ||
                      '           AND (IDPLANOPREV = 66 AND IDSITPLANOPREV = 1) ' ||
                      '        UNION ' || '        SELECT 2 ' || -- Migrado
                      '          FROM PARTPREVPLAN ' ||
                      '         WHERE IDPESSOA = ' || inIDPessoa ||
                      '           AND (IDPLANOPREV = 2 AND IDSITPLANOPREV = 24)) ' ||
                      ' HAVING COUNT(*) > 1 ';
    BEGIN
      -- EXCEPTION
      EXECUTE IMMEDIATE vSQLMigraPlano
        INTO vMigraREGREPLAN_REB;
    EXCEPTION
      WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
        BEGIN
          vMigraREGREPLAN_REB := 0;
        END;
    END;
  END;
  -- FIM - Procedure PR_VerificaMigracaoPlanos ---------------------------------------------------------------


  -- Procedure PR_CalculaVlrRetido ---------------------------------------------------------------------------
  /*20491*/
  FUNCTION PR_CalculaVlrRetido(inIDPessJur   IN ELEGPATRO.IDPESSJUR%TYPE,
                               inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                               inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE,
                               inVlrIndice   IN NUMBER) RETURN NUMBER
  IS
    vSQLReservasRet      VARCHAR2(20000);
    vCotasRetencao       NUMBER;              
  BEGIN

    -- busca quais tipos de reservas ainda nao foram usadas para resgate   
    --vSQLReservasRet := FN_MontaConsultaReserva(inIDPessJur, inIDPessoa, inIDPlanoPrev, -1, 1);     /*WO12337*/
    vSQLReservasRet := FN_MontaConsultaNovaReserva(inIDPessJur, inIDPessoa, inIDPlanoPrev, -1, 1);   /*WO12337*/
    vSQLReservasRet := ' SELECT NVL(SUM(TC.VLRCOTAS),0) ' || 
                       '   FROM ( '||vSQLReservasRet||' ) TC '; 
    
    BEGIN -- EXCEPTION

      log_consulta('PR_CalculaVlrRetido - busca reservas', vSQLReservasRet );

      EXECUTE IMMEDIATE vSQLReservasRet INTO vCotasRetencao;

    EXCEPTION
       WHEN PCK_ALL_ERRO.ERRO_NAO_ENCONTRO_REGISTRO THEN
       BEGIN
         vCotasRetencao := 0;
       END;
    END;
  
  RETURN (vCotasRetencao * inVlrIndice);

  END;
  -- FIM Procedure PR_CalculaVlrRetido -----------------------------------------------------------------------


  -- Procedure PR_GRAVA_PRAZOACUMULACAO ----------------------------------------------------------------------
  PROCEDURE PR_PreparaGravacao_Calc(inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE,
                                    inIDPessJur   IN ELEGPATRO.IDPESSJUR%TYPE,
                                    inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                                    inSeqResgate  IN NUMBER,   /*20491*/
                                    inIdBeneficio IN NUMBER    /*WO9102*/                                
                                    ) IS
    vIndice NUMBER(21, 12);
    -- Sub Procedure PR_Insert_PrazoAcumulacao ---------------------------------------------------------------
    PROCEDURE PR_Insert_PrazoAcumulacao(inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE,
                                        inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                                        inIDPessJur   IN ELEGPATRO.IDPESSJUR%TYPE,
                                        inDescFaixa   IN VARCHAR,
                                        inVLRCota     IN NUMBER,
                                        inVLRValor    IN NUMBER,
                                        inIndice      IN NUMBER,
                                        inPercentual  IN NUMBER,
                                        inSeqResgate  IN NUMBER DEFAULT -1,    /*20491*/
                                        inVlrRetencao IN NUMBER DEFAULT 0,     /*20491*/
                                        inIdBeneficio IN NUMBER DEFAULT -1     /*WO9102*/                                
                                        ) IS
    
    BEGIN
      vSQLInsert := 'INSERT INTO PRAZOACUMULACAO ' || 
                    '( '||
                    '  IDPRAZOACUM, '||
                    '  IDPLANOPREV, '||
                    '  IDPESSOA, '||
                    '  IDPESSJUR, '||
                    '  TIPOOPCAOIR, '||
                    '  DESCRICAOFAIXA, '||
                    '  VLRCOTA, '||
                    '  VLRVALOR, '||
                    '  INDICE, '||
                    '  PERCENTUALIR, '||
                    '  IDTITULAR,  ' ||
                    '  SEQRESGATE, ' ||
                    '  IDBENEFICIO, '||     /*WO9102*/
                    '  VALORRETENCAO ' ||
                    ') '||
                    'VALUES '||
                    '(  ' || 
                    '  SEQPRAZOACUMULACAO.NEXTVAL, ' ||
                    inIDPlanoPrev || ', ' || 
                    inIDPessoa    || ', ' ||
                    inIDPessJur   || ', ' ||
                    PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(vDescTipoOpcaoIR) || ', ' ||
                    PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(inDescFaixa) || ', ' ||
                    REPLACE(inVLRCota, ',', '.') || ', ' ||
                    REPLACE(Trunc(inVLRValor, 2), ',', '.') || ', ' ||
                    REPLACE(inIndice, ',', '.') || ', ' ||
                    REPLACE(inPercentual, ',', '.') || ', ' ||
                    vIDPESSOA_TITULAR  || ', ' ||
                    inSeqResgate       || ', ' ||
                    inIdBeneficio      || ', ' ||      /*WO9102*/
                    REPLACE(Trunc(inVlrRetencao,2),',','.') ||                    
                    ')';
      BEGIN
        -- EXCEPTION
        -- dbms_output.put_line(vSQLInsert);
        log_consulta('PR_Insert_PrazoAcumulacao', vSQLInsert );

        EXECUTE IMMEDIATE vSQLInsert;
      EXCEPTION
        WHEN OTHERS THEN
          BEGIN
            vErroInsert := 'ERRO - PKG_PREV_CALC_PRAZOACUMULACAO: Erro na gravação de alguns itens do processo. - ' ||
                           to_char(SQLCODE) || ' - ' || SQLERRM;
            ROLLBACK;
          END;
      END;
    END;
    -- FIM Sub Procedure PR_Insert_PrazoAcumulacao -----------------------------------------------------------
  
    /*20491*/
    -- Prepara o CURSOR dos dependentes do titular
    vVlrRetencao      NUMBER DEFAULT 0;
    vContador         PLS_INTEGER;
    vCotas_local      NUMBER;
    vPercentual_local NUMBER;
    vDescricao_local  VARCHAR2(50);
  
    TYPE rDependentes_TYPE IS RECORD(IDPESSOA     PLS_INTEGER,
                                     PERCENTUAL   NUMBER);
    cDependentes  cCursorDados_TYPE;  
    rDependentes  rDependentes_TYPE;  
    /*20491*/
  
    vTotalCotas     NUMBER;
    vSQLInsert      VARCHAR(1000);
    vRetencao       NUMBER; --Rafael Vasconcelos 23/05/2019
    vCotasRetencao  NUMBER; --Rafael Vasconcelos 23/05/2019
    valoratualBenef number; --Rafael Vasconcelos 23/05/2019
    vConsidera      BOOLEAN; --Rafael Vasconcelos 23/05/2019
  
  BEGIN
    IF (inIDPlanoPrev = 66) THEN
      vIndice := vVLRIndice_REB;
    ELSIF (inIDPlanoPrev = 74) THEN
      vIndice := vVLRIndice_NP;
    END IF;
    
    /*20491 : inicio*/
    /* comentado trecho de c lculo da retencao
    --Rafael Vasconcelos 23/05/2019 Inicio
    vTotalCotas := vVLRRes_Ate2Anos_Cotas + vVLRRes_2A4Anos_Cotas +
                   vVLRRes_4A6Anos_Cotas + vVLRRes_6A8Anos_Cotas +
                   vVLRRes_8A10Anos_Cotas + vVLRRes_Sup10Anos_Cotas;
  
    vTotalCotas    := vTotalCotas * vIndice;
    vCotasRetencao := 0;
    vConsidera     := TRUE;
    begin
      --SELECT BF.VALORATUAL,bf.percretencao --SIG 99297
      SELECT BF.valortotal, bf.percretencao --SIG 99297
        INTO VALORATUALBENEF, vRetencao
        FROM BENEFBFCIARIO BF
       WHERE BF.IDPESSOA = INIDPESSOA
         AND BF.IDPESSJUR = INIDPESSJUR
         AND BF.IDPLANOPREV = INIDPLANOPREV
         AND BF.IDBENEFICIO IN (418, 231, 478)
         AND BF.TRGDTINCLUSAO =
             (SELECT MAX(TRGDTINCLUSAO)
                FROM BENEFBFCIARIO BF2
               WHERE BF2.IDPESSOA = BF.IDPESSOA
                 AND BF2.IDPESSJUR = BF.IDPESSJUR
                 AND BF2.IDPLANOPREV = BF.IDPLANOPREV
                 AND BF2.IDBENEFICIO IN (418, 231, 478));
    
    EXCEPTION
      WHEN OTHERS THEN
        vRetencao := 0;
    END;
    IF (vRetencao > 0) THEN
      vRetencao      := vTotalCotas - valoratualBenef;
      vCotasRetencao := vRetencao / vIndice;
    END IF;
    --Rafael Vasconcelos 23/05/2019 Fim  
    */
       
    -- Calcula o valor retido
    vVlrRetencao := 0;
    IF inSeqResgate > 0 then
       vVlrRetencao := PR_CalculaVlrRetido(inIDPessJur, inIDPessoa, inIDPlanoPrev, vIndice);
    END IF;
    
    -- Verifica se vai ratear
  IF (vFlgDependente = 1) /*AND (vIDPESSOA_TITULAR = inIDPessoa)*/ THEN

     OPEN cDependentes FOR FN_MontaQuerySelBeneficiarios(vIDPESSOA_TITULAR, inIDPlanoPrev, inIDPessoa);

       -- LOOP  <DEPENDENTES>
       LOOP

           FETCH cDependentes INTO rDependentes;

           EXIT WHEN cDependentes%NOTFOUND;

           -- LOOP <FOR>
           FOR vContador IN 1..6
       LOOP
          CASE (vContador)
          WHEN 1 THEN vCotas_local      := vvlrres_ate2anos_cotas;
                    vDescricao_local  := vvlrres_ate2anos_desc;
                    vPercentual_local := vvlrres_ate2anos_percent;

          WHEN 2 THEN vCotas_local      := vvlrres_2a4anos_cotas;
                    vDescricao_local  := vvlrres_2a4anos_desc;
                    vPercentual_local := vvlrres_2a4anos_percent;
              
          WHEN 3 THEN vCotas_local      := vvlrres_4a6anos_cotas;
                    vDescricao_local  := vvlrres_4a6anos_desc;
                    vPercentual_local := vvlrres_4a6anos_percent;

          WHEN 4 THEN vCotas_local      := vvlrres_6a8anos_cotas;
                    vDescricao_local  := vvlrres_6a8anos_desc;
                    vPercentual_local := vvlrres_6a8anos_percent;

          WHEN 5 THEN vCotas_local      := vvlrres_8a10anos_cotas;
                    vDescricao_local  := vvlrres_8a10anos_desc;
                    vPercentual_local := vvlrres_8a10anos_percent;

          WHEN 6 THEN vCotas_local      := vvlrres_sup10anos_cotas;
                    vDescricao_local  := vvlrres_sup10anos_desc;
                    vPercentual_local := vvlrres_sup10anos_percent;              
          END CASE;
        
        if (vCotas_local <> 0) then
            vCotas_local := vCotas_local * rDependentes.Percentual;
          
          pr_insert_prazoacumulacao(inidplanoprev,
                      rDependentes.IdPessoa,
                      inidpessjur,
                      vDescricao_local,
                      vCotas_local,
                      (vCotas_local * vindice),
                      vindice,
                      vPercentual_local,
                      inseqresgate,
                      vVlrRetencao,
                      inIdBeneficio    /*WO9102*/
                      );
           end if;        
               
       END LOOP;
       -- fim LOOP <FOR>

      END LOOP;
        -- FIM LOOP <DEPENDENTES>

    ELSE    
    
      -- (Nao) - Beneficio de Risco
      -- Ate 2 Anos
      IF (vVLRRes_Ate2Anos_Cotas <> 0) THEN
    
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          ---Rafael Vasconcelos 23/05/2019
          vVLRRes_Ate2Anos_Cotas := vVLRRes_Ate2Anos_Cotas - vCotasRetencao;
          vConsidera             := false;
        END IF;
        #20491 : fim*/
    
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_Ate2Anos_Desc,
                                  vVLRRes_Ate2Anos_Cotas,
                                  (vVLRRes_Ate2Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_Ate2Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 2 a 4 Anos
      IF (vVLRRes_2A4Anos_Cotas <> 0) THEN
    
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          --Rafael Vasconcelos 23/05/2019
          vVLRRes_2A4Anos_Cotas := vVLRRes_2A4Anos_Cotas - vCotasRetencao;
          vConsidera            := false;      
        END IF;
        #20491 : fim*/
    
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_2A4Anos_Desc,
                                  vVLRRes_2A4Anos_Cotas,
                                  (vVLRRes_2A4Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_2A4Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 4 a 6 Anos
      IF (vVLRRes_4A6Anos_Cotas <> 0) THEN
      
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          --Rafael Vasconcelos 23/05/2019     
          vVLRRes_4A6Anos_Cotas := vVLRRes_4A6Anos_Cotas - vCotasRetencao;
          vConsidera            := false;      
        END IF;
        #20491 : fim*/
    
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_4A6Anos_Desc,
                                  vVLRRes_4A6Anos_Cotas,
                                  (vVLRRes_4A6Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_4A6Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 6 a 8 Anos
      IF (vVLRRes_6A8Anos_Cotas <> 0) THEN
    
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          --Rafael Vasconcelos 23/05/2019
          vVLRRes_6A8Anos_Cotas := vVLRRes_6A8Anos_Cotas - vCotasRetencao;
          vConsidera            := false;      
        END IF;
        #20491 : fim*/
    
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_6A8Anos_Desc,
                                  vVLRRes_6A8Anos_Cotas,
                                  (vVLRRes_6A8Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_6A8Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 8 a 10 Anos
      IF (vVLRRes_8A10Anos_Cotas <> 0) THEN
    
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          --Rafael Vasconcelos 23/05/2019
          vVLRRes_8A10Anos_Cotas := vVLRRes_8A10Anos_Cotas - vCotasRetencao;
          vConsidera             := false;      
        END IF;
        #20491 : fim*/
    
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_8A10Anos_Desc,
                                  vVLRRes_8A10Anos_Cotas,
                                  (vVLRRes_8A10Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_8A10Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- Superior a 10 Anos
      IF (vVLRRes_Sup10Anos_Cotas <> 0) THEN
    
        /*20491 : inicio
        IF (vCotasRetencao > 0 and vConsidera) THEN
          --Rafael Vasconcelos 23/05/2019
          vVLRRes_Sup10Anos_Cotas := vVLRRes_Sup10Anos_Cotas - vCotasRetencao;
          vConsidera              := false;      
        END IF;
        #20491 : fim*/
     
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRRes_Sup10Anos_Desc,
                                  vVLRRes_Sup10Anos_Cotas,
                                  (vVLRRes_Sup10Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRRes_Sup10Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
    
      -- (SIM) - Beneficio de Risco
      -- Ate 6 Anos
      IF (vVLRResRisco_Ate6Anos_Cotas <> 0) THEN
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRResRisco_Ate6Anos_Desc,
                                  vVLRResRisco_Ate6Anos_Cotas,
                                  (vVLRResRisco_Ate6Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRResRisco_Ate6Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 6 a 8 Anos
      IF (vVLRResRisco_6A8Anos_Cotas <> 0) THEN
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRResRisco_6A8Anos_Desc,
                                  vVLRResRisco_6A8Anos_Cotas,
                                  (vVLRResRisco_6A8Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRResRisco_6A8Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- De 8 a 10 Anos
      IF (vVLRResRisco_8A10Anos_Cotas <> 0) THEN
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRResRisco_8A10Anos_Desc,
                                  vVLRResRisco_8A10Anos_Cotas,
                                  (vVLRResRisco_8A10Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRResRisco_8A10Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;
      -- Superior a 10 Anos
      IF (vVLRResRisco_Sup10Anos_Cotas <> 0) THEN
        PR_Insert_PrazoAcumulacao(inIDPlanoPrev,
                                  inIDPessoa,
                                  inIDPessJur,
                                  vVLRResRisco_Sup10Anos_Desc,
                                  vVLRResRisco_Sup10Anos_Cotas,
                                  (vVLRResRisco_Sup10Anos_Cotas * vIndice),
                                  vIndice,
                                  vVLRResRisco_Sup10Anos_Percent,
                                  inseqresgate,        /*20491*/
                                  vVlrRetencao,        /*20491*/
                                  inIdBeneficio        /*WO9102*/
                                  );
      END IF;

    END IF;      
    /*20491 : fim*/
      
  END;
  -- FIM Procedure PR_GRAVA_PRAZOACUMULACAO ------------------------------------------------------------------


  -- Procedure PR_Calc_Reserva_NP ----------------------------------------------------------------------------
  PROCEDURE PR_Calc_Reserva_NP(inIDPessJur IN ELEGPATRO.IDPESSJUR%TYPE,
                               inIDPessoa  IN ELEGPATRO.IDPESSOA%TYPE,
                               inMatricula IN VARCHAR2,
                               inIdPlanoPrev   IN PLS_INTEGER,  /*SIG20491*/
                               inSeqResgate    IN NUMBER,       /*SIG20491*/
                               inTipoCalculo   IN NUMBER,       /*WO9102*/
                               inIdBeneficio   IN NUMBER        /*WO9102*/
                              ) 
  IS
    vSQLReservasNP        VARCHAR2(20000);
    vDataAConsiderar      DATE;
    lSemDados             boolean;
    vIdadeReservaAtual_QtdeDias PLS_INTEGER;

    -- Prepara o CURSOR das reservas que serão processada no cálculo para o NOVO PLANO
    TYPE cReservasNP_TYPE IS REF CURSOR;
    cReservasNP cReservasNP_TYPE;
    TYPE rReservasNP_TYPE IS RECORD(TIPO_RESERVA    NUMBER(3),
                                    DATARECEBIMENTO DATE,
                                    VLRCOTAS        NUMBER(21, 12));
    rReservasNP rReservasNP_TYPE;
  BEGIN

    vSQLReservasNP := '';
    /*20491 : inicio*/
    --vSQLReservasNP := FN_MontaConsultaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0);   /*WO12337*/
    --vSQLReservasNP := FN_MontaConsultaNovaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0); /*WO12337*/

	vSQLReservasNP := FN_MontaConsultaNovaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0, inTipoCalculo);   /*WO9102*/

    Log_consulta('PR_Calc_Reserva_NP - reservas NP', vSQLReservasNP );
    /*20491 : fim*/
    
    OPEN cReservasNP FOR vSQLReservasNP;
      LOOP
        FETCH cReservasNP
          INTO rReservasNP;
        EXIT WHEN cReservasNP%NOTFOUND;
 
        -- Data Final da Reserva a ser considerada
        IF (To_Date(To_Char(rReservasNP.DATARECEBIMENTO, 'DD/MM/YYYY'),'DD/MM/YYYY') <= To_Date('31/12/2004', 'DD/MM/YYYY')) THEN
           vDataAConsiderar := To_Date('01/01/2005', 'DD/MM/YYYY');
        ELSE
           vDataAConsiderar := To_Date(To_Char(rReservasNP.DATARECEBIMENTO,'DD/MM/YYYY'),'DD/MM/YYYY');
        END IF;
      
      /*      CASE
      WHEN rReservasNP.TIPO_RESERVA IN (100, 101) THEN
      BEGIN --Tipo de Reserva = PARTICIPANTE ou PATRONAL
      vDataAConsiderar := To_Date('01/01/2005','DD/MM/YYYY');
      END;
      WHEN rReservasNP.TIPO_RESERVA = 110 THEN
      BEGIN --Tipo de Reserva = PORTADAS
      vDataAConsiderar := To_Date('01/01/2005','DD/MM/YYYY');
      END;
      END CASE;*/
      
        -- Idade da Rerserva
        vIdadeReservaAtual_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(vDataAConsiderar,
                                                                           To_Char(vDataPrevista,
                                                                                   'DD/MM/YYYY'));

        -- (Nao) - Beneficio de Risco
        -- IF (vBenefRisco = 0) THEN -- SOL 186345 KTN 1751957 comentado pois prazo acumulacao nao verifica beneficio de risco
        -- Ate 2 Anos
        IF (vIdadeReservaAtual_QtdeDias <= vRes_Ate2Anos_QtdeDias) THEN
           vVLRRes_Ate2Anos_Cotas := vVLRRes_Ate2Anos_Cotas + rReservasNP.VLRCOTAS;
        -- De 2 a 4 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_Ate2Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_2A4Anos_QtdeDias)) THEN
           vVLRRes_2A4Anos_Cotas := vVLRRes_2A4Anos_Cotas + rReservasNP.VLRCOTAS;
        -- De 4 a 6 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_2A4Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_4A6Anos_QtdeDias)) THEN
           vVLRRes_4A6Anos_Cotas := vVLRRes_4A6Anos_Cotas + rReservasNP.VLRCOTAS;
        -- De 6 a 8 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_4A6Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_6A8Anos_QtdeDias)) THEN
           vVLRRes_6A8Anos_Cotas := vVLRRes_6A8Anos_Cotas + rReservasNP.VLRCOTAS;
          -- De 8 a 10 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_6A8Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_8A10Anos_QtdeDias)) THEN
           vVLRRes_8A10Anos_Cotas := vVLRRes_8A10Anos_Cotas + rReservasNP.VLRCOTAS;
        -- Superior a 10 Anos
        ELSIF (vIdadeReservaAtual_QtdeDias >= vRes_Sup10Anos_QtdeDias) THEN
           vVLRRes_Sup10Anos_Cotas := vVLRRes_Sup10Anos_Cotas + rReservasNP.VLRCOTAS;
        END IF;
 
        -- SOL 186345 KTN 1751957 trecho comentado pois prazo acumulação não verifica beneficio de risco
        -- (SIM) - Beneficio de Risco
        -- ELSIF (vBenefRisco = 1) THEN SOL 186345 KTN 1751957 comentado pois prazo acumulação não verifica beneficio de risco
      /*  -- Até 6 Anos
      IF (vIdadeReservaAtual_QtdeDias <= vResRisco_Ate6Anos_QtdeDias) THEN
      vVLRResRisco_Ate6Anos_Cotas := vVLRResRisco_Ate6Anos_Cotas + rReservasNP.VLRCOTAS;
      -- De 6 a 8 Anos
      ELSIF ((vIdadeReservaAtual_QtdeDias >= vResRisco_6A8Anos_QtdeDias) AND
      (vIdadeReservaAtual_QtdeDias < vResRisco_8A10Anos_QtdeDias)) THEN
      vVLRResRisco_6A8Anos_Cotas := vVLRResRisco_6A8Anos_Cotas + rReservasNP.VLRCOTAS;
      -- De 8 a 10 Anos
      ELSIF ((vIdadeReservaAtual_QtdeDias >= vResRisco_8A10Anos_QtdeDias) AND
      (vIdadeReservaAtual_QtdeDias < vResRisco_Sup10Anos_QtdeDias)) THEN
      vVLRResRisco_8A10Anos_Cotas := vVLRResRisco_8A10Anos_Cotas + rReservasNP.VLRCOTAS;
      -- Superior a 10 anos
      ELSIF (vIdadeReservaAtual_QtdeDias >= vResRisco_Sup10Anos_QtdeDias) THEN
      vVLRResRisco_Sup10Anos_Cotas := vVLRResRisco_Sup10Anos_Cotas + rReservasNP.VLRCOTAS;
      END IF;
      END IF;*/ -- SOL 186345 KTN 1751957 comentado pois prazo acumulação não verifica beneficio de risco
    END LOOP;
   
    CLOSE cReservasNP;
     
    IF (vFLGGravaCalc = 1) THEN
       --PR_PreparaGravacao_Calc(74, inIDPessJur, inIDPessoa, inSeqResgate  );  /*20491*/
       PR_PreparaGravacao_Calc(74, inIDPessJur, inIDPessoa, inSeqResgate, inIdBeneficio );  /*WO9102*/
    ELSE
       vTotalNovoPlano := 0;
       IF (vBenefRisco = 0) THEN
          vTotalNovoPlano := (vVLRRes_Ate2Anos_Cotas + 
                              vVLRRes_2A4Anos_Cotas +
                              vVLRRes_4A6Anos_Cotas + 
                              vVLRRes_6A8Anos_Cotas +
                              vVLRRes_8A10Anos_Cotas +
                              vVLRRes_Sup10Anos_Cotas);
       ELSE
          vTotalNovoPlano := (vVLRResRisco_Ate6Anos_Cotas +
                              vVLRResRisco_6A8Anos_Cotas +
                              vVLRResRisco_8A10Anos_Cotas +
                              vVLRResRisco_Sup10Anos_Cotas);
       END IF;
    END IF;
  END;
  -- FIM Procedure PR_Calc_Reserva_NP ------------------------------------------------------------------------


  -- Procedure PR_Calc_Reserva_REB ---------------------------------------------------------------------------
  PROCEDURE PR_Calc_Reserva_REB(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE,
                                inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE,
                                inMatricula    IN VARCHAR2,
                                inIdPlanoPrev  IN PLS_INTEGER,  /*SIG20491*/
                                inSeqResgate   IN NUMBER,       /*SIG20491*/
                                inTipoCalculo  IN NUMBER,       /*WO9102*/                                
                                inIdBeneficio  IN NUMBER        /*WO9102*/                                
                               ) 
  IS
    vSQLReservasREB             VARCHAR2(20000);
    vSQLReguet                  VARCHAR(2000);
    vDataAConsiderar            DATE;
    vValorAConsiderar           NUMBER;
    
    vTipoOpcaoIR_Atual          NUMBER;
    vTipoOpcaoIR_Anterior       NUMBER;
    
    vPercentReservaParticip     NUMBER;
    vIdadeReservaAtual_QtdeDias PLS_INTEGER;
    vTempoAssociacaoParticip    PLS_INTEGER;

    -- Prepara o CURSOR das reservas que serão processada no cálculo para o NOVO PLANO
    TYPE cReservasREB_TYPE IS REF CURSOR;
    
    cReservasREB cReservasREB_TYPE;
    
    TYPE rReservasREB_TYPE IS RECORD(DATARECEBIMENTO DATE,
                                     PERCENTUAL      NUMBER,
                                     VLRCOTAS        NUMBER(21, 12));
    V_ReservasREB_REC rReservasREB_TYPE;
  BEGIN
    vTempoAssociacaoParticip := 0;

    /*
    FAZ UMA CONSULTA PARA VERIFICAR SE É UM TITULAR OU DEPENDENTE
    CASO SEJA DEPENTENTE GUARDAR O IDPESSOA DO TITULAR NA VARIAVEL vIDTITULAR_LOCAL
    PARA ALGUMAS CONSULTAS
    */

    /* 20491 : inicio 
    -- OTACILIO KINTANA 1501823 SOL 167930 INICIO
    vIDPESSOA_TITULAR := inIDPessoa;
    DECLARE
      block_to_execute VARCHAR(200) := ' BEGIN ' ||
                                       ' SELECT D.IDTITULAR, D.IDPESSOA ' ||
                                       ' INTO :1, :2 ' ||
                                       ' FROM DEPENTIT D  ' ||
                                       ' WHERE D.IDPESSOA =  ' ||
                                       inIDPessoa;
      vIDTITULAR_LOCAL NUMBER;
      vIDPESSOA_LOCAL  NUMBER;
    BEGIN
      IF (inMatricula IS NOT NULL) then
        block_to_execute := block_to_execute ||
                            'AND D.MATRICULA IS NOT NULL' || ';' || ' END;';
      ELSE
        block_to_execute := block_to_execute || 'AND D.MATRICULA IS NULL' || ';' ||
                            ' END;';
      END IF;
      EXECUTE IMMEDIATE block_to_execute
        USING OUT vIDTITULAR_LOCAL, OUT vIDPESSOA_LOCAL;
      IF (vIDTITULAR_LOCAL <> vIDPESSOA_LOCAL) THEN
        BEGIN
          vIDPESSOA_TITULAR := vIDTITULAR_LOCAL;
        END;
      END IF;
    END;
    -- OTACILIO KINTANA 1501823 SOL 167930 FIM
    #20491 : fim */
    
    vSQLReservasREB := '';

    /*20491 : inicio */
    --vSQLReservasREB := FN_MontaConsultaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0);   /*WO12337*/
    --vSQLReservasREB := FN_MontaConsultaNovaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0); /*WO12337*/
    
	vSQLReservasREB := FN_MontaConsultaNovaReserva(inIDPessJur, inIDPessoa, inIdPlanoPrev, inSeqResgate, 0, inTipoCalculo);    /*WO9102*/

    log_consulta('PR_Calc_Reserva_REB - reservas REB', vSQLReservasREB );
    /*20491 : fim */
    
    OPEN cReservasREB FOR vSQLReservasREB;
    LOOP
      FETCH cReservasREB
        INTO V_ReservasREB_REC;
      EXIT WHEN cReservasREB%NOTFOUND;
      -- Verifica o Tempo de Associacao do Participante
      IF (vTempoAssociacaoParticip = 0) THEN
        vTempoAssociacaoParticip := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(vDataAssociacao,
                                                                          To_Char(vDataPrevista, 'DD/MM/YYYY'));
        IF (vTempoAssociacaoParticip <= vAssoc_10Anos_QtdeDias) THEN
          vPercentReservaParticip := 5;
        ELSIF ((vTempoAssociacaoParticip > vAssoc_10Anos_QtdeDias) AND
              (vTempoAssociacaoParticip <= vAssoc_15Anos_QtdeDias)) THEN         -- Felipe - SIG21374
          vPercentReservaParticip := 10;
        -- Felipe - SIG21374 - início
        ELSIF (vTempoAssociacaoParticip > vAssoc_15Anos_QtdeDias) AND
              (vTempoAssociacaoParticip <= vAssoc_20Anos_QtdeDias) THEN
          vPercentReservaParticip := 15;
        -- Felipe - SIG21374 - fim
        ELSIF ((vTempoAssociacaoParticip > vAssoc_20Anos_QtdeDias) AND
              (vTempoAssociacaoParticip < vAssoc_21Anos_QtdeDias)) THEN
          vPercentReservaParticip := 15;
        ELSIF (vTempoAssociacaoParticip > vAssoc_21Anos_QtdeDias) THEN
          vPercentReservaParticip := 20;
        END IF;
      END IF;
      
      -- Valor Final da Reserva a ser Considerada
      IF ((V_ReservasREB_REC.PERCENTUAL = 100)) THEN
        /*OR
        ((To_Date(To_Char(vDataAssociacao ,'DD/MM/YYYY'),'DD/MM/YYYY') >= To_Date('01/01/1998','DD/MM/YYYY')) AND
        (To_Date(To_Char(vDataAssociacao ,'DD/MM/YYYY'),'DD/MM/YYYY') <= To_Date('31/01/2002','DD/MM/YYYY')))) THEN*/
        vValorAConsiderar := V_ReservasREB_REC.VLRCOTAS;
      ELSE
        vValorAConsiderar := ((V_ReservasREB_REC.VLRCOTAS *
                             vPercentReservaParticip) / 100);
      END IF;
      
      -- Data Final da Reserva a ser considerada
      IF vMigraREGREPLAN_REB > 0 THEN
        -- Plano Migrado REG/REPLAN para REB
        IF (To_Date(To_Char(V_ReservasREB_REC.DATARECEBIMENTO, 'DD/MM/YYYY'), 'DD/MM/YYYY') <= To_Date('01/07/2006', 'DD/MM/YYYY')) THEN
          vDataAConsiderar := To_Date('01/07/2006', 'DD/MM/YYYY');
        ELSE
          vDataAConsiderar := To_Date(To_Char(V_ReservasREB_REC.DATARECEBIMENTO,'DD/MM/YYYY'),'DD/MM/YYYY');
        END IF;
      ELSE
        IF (To_Date(To_Char(V_ReservasREB_REC.DATARECEBIMENTO, 'DD/MM/YYYY'),'DD/MM/YYYY') <= To_Date('31/12/2004', 'DD/MM/YYYY')) THEN
          vDataAConsiderar := To_Date('01/01/2005', 'DD/MM/YYYY');
        ELSE
          vDataAConsiderar := To_Date(To_Char(V_ReservasREB_REC.DATARECEBIMENTO,'DD/MM/YYYY'),'DD/MM/YYYY');
        END IF;
      END IF;
      
      -- Idade da Rerserva
      vIdadeReservaAtual_QtdeDias := PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(vDataAConsiderar,
                                                                           To_Char(vDataPrevista,'DD/MM/YYYY'));

      -- (Nao - Beneficio de Risco
      IF (vBenefRisco = 0) THEN
        -- Ate 2 Anos
        IF (vIdadeReservaAtual_QtdeDias <= vRes_Ate2Anos_QtdeDias) THEN
           vVLRRes_Ate2Anos_Cotas := vVLRRes_Ate2Anos_Cotas + vValorAConsiderar;
        -- De 2 a 4 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_Ate2Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_2A4Anos_QtdeDias)) THEN
           vVLRRes_2A4Anos_Cotas := vVLRRes_2A4Anos_Cotas + vValorAConsiderar;
        -- De 4 a 6 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_2A4Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_4A6Anos_QtdeDias)) THEN
           vVLRRes_4A6Anos_Cotas := vVLRRes_4A6Anos_Cotas + vValorAConsiderar;
        -- De 6 a 8 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_4A6Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_6A8Anos_QtdeDias)) THEN
           vVLRRes_6A8Anos_Cotas := vVLRRes_6A8Anos_Cotas + vValorAConsiderar;
        -- De 8 a 10 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vRes_6A8Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vRes_8A10Anos_QtdeDias)) THEN
           vVLRRes_8A10Anos_Cotas := vVLRRes_8A10Anos_Cotas + vValorAConsiderar;
        -- Superior a 10 Anos
        ELSIF (vIdadeReservaAtual_QtdeDias >= vRes_Sup10Anos_QtdeDias) THEN
           vVLRRes_Sup10Anos_Cotas := vVLRRes_Sup10Anos_Cotas + vValorAConsiderar;
        END IF;       
      -- (SIM) - Beneficio de Risco        
      ELSIF (vBenefRisco = 1) THEN
        -- Ate 6 Anos
        IF (vIdadeReservaAtual_QtdeDias <= vResRisco_Ate6Anos_QtdeDias) THEN
           vVLRResRisco_Ate6Anos_Cotas := vVLRResRisco_Ate6Anos_Cotas + vValorAConsiderar;
        -- De 6 a 8 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vResRisco_6A8Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vResRisco_8A10Anos_QtdeDias)) THEN
           vVLRResRisco_6A8Anos_Cotas := vVLRResRisco_6A8Anos_Cotas + vValorAConsiderar;
        -- De 8 a 10 Anos
        ELSIF ((vIdadeReservaAtual_QtdeDias >= vResRisco_8A10Anos_QtdeDias) AND
              (vIdadeReservaAtual_QtdeDias < vResRisco_Sup10Anos_QtdeDias)) THEN
           vVLRResRisco_8A10Anos_Cotas := vVLRResRisco_8A10Anos_Cotas + vValorAConsiderar;
        -- Superior a 10 anos
        ELSIF (vIdadeReservaAtual_QtdeDias >= vResRisco_Sup10Anos_QtdeDias) THEN
           vVLRResRisco_Sup10Anos_Cotas := vVLRResRisco_Sup10Anos_Cotas + vValorAConsiderar;
        END IF;
      END IF;
    END LOOP;
    
    CLOSE cReservasREB;
    
    IF (vFLGGravaCalc = 1) THEN
      --PR_PreparaGravacao_Calc(66, inIDPessJur, inIDPessoa, inSeqResgate);  /*SIG20491*/
      PR_PreparaGravacao_Calc(66, inIDPessJur, inIDPessoa, inSeqResgate, inIdBeneficio );  /*WO9102*/
    ELSE
      vTotalREB := 0;
      IF (vBenefRisco = 0) THEN
        vTotalREB := (vVLRRes_Ate2Anos_Cotas + 
                      vVLRRes_2A4Anos_Cotas +
                      vVLRRes_4A6Anos_Cotas + 
                      vVLRRes_6A8Anos_Cotas +
                      vVLRRes_8A10Anos_Cotas + 
                      vVLRRes_Sup10Anos_Cotas) * vVLRIndice_REB;
      ELSE
        vTotalREB := (vVLRResRisco_Ate6Anos_Cotas +
                     vVLRResRisco_6A8Anos_Cotas +
                     vVLRResRisco_8A10Anos_Cotas +
                     vVLRResRisco_Sup10Anos_Cotas) * vVLRIndice_REB;
      END IF;
    END IF;
  END;
  -- FIM Procedure PR_Calc_Reserva_REB -----------------------------------------------------------------------


  --Inicio Procedure para deletar o prazo Acumulação
  PROCEDURE PR_Deleta_Prazo_Acumulacao(inIDPessJur   IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                                       inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                       inIdPlanoPrev IN PLS_INTEGER,
                                       inSeqResgate  IN PLS_INTEGER     /*20491*/
                                       ) IS
    vSQLDelete VARCHAR2(300);
  BEGIN
    vSQLDelete := ' DELETE FROM PRAZOACUMULACAO ' ||
                  '  WHERE IDPESSJUR   =' || inIDPessJur ||
                  -- '  AND   IDPESSOA    =' || inIDPessoa ||      /*20491*/
                  '  AND   IDPLANOPREV =' || inIdPlanoPrev;
                  
    /*20491 : inicio */
    IF (vFlgDependente = 1) AND (inIDPessoa = vIDPESSOA_TITULAR) THEN
       vSQLDelete := vSQLDelete ||
                  '  AND   IDTITULAR   = '||vIDPESSOA_TITULAR;
    ELSE
       vSQLDelete := vSQLDelete ||
                  '  AND   IDPESSOA    = '||inIDPessoa ||                  
                  '  AND   IDTITULAR   = '||vIDPESSOA_TITULAR;
    END IF;               
    
    IF (inSeqResgate > 0) THEN
       vSQLDelete := vSQLDelete ||
                  '  AND (SEQRESGATE = -1 OR SEQRESGATE = '|| inSeqResgate ||')';                      
    END IF;   

    log_consulta('PR_Deleta_Prazo_Acumulacao', vSQLDelete );
    /*20491 : fim */
                  
    EXECUTE IMMEDIATE vSQLDelete;
  END PR_DELETA_PRAZO_ACUMULACAO;
  --Fim Procedure para deletar o prazo Acumulação


  -- Procedure PRINCIPAL: Realiza o calculo do prazo de acumulação -----------------------------------------
  PROCEDURE PR_CALC_PRAZO_ACUMULACAO(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                                     inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                     inListaBenef   IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                                     inREB          IN PLS_INTEGER DEFAULT 1,
                                     inNOVOPLANO    IN PLS_INTEGER DEFAULT 1,
                                     inDataPrevista IN DATE DEFAULT NULL,
                                     inTipoOpcaoIR  IN CHAR DEFAULT 'R',
                                     inMatricula    IN VARCHAR2,
                                     inIDTitular    IN DEPENTIT.IDTITULAR%TYPE DEFAULT NULL, /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
                                     outERRO        OUT VARCHAR,
                                     inSeqResgate   IN PLS_INTEGER DEFAULT -1,     /*SIG20491 */                                     
                                     inTipoCalculo  IN PLS_INTEGER DEFAULT 2,      /*WO9102*/                                                                       
                                     inIdBeneficio  IN PLS_INTEGER DEFAULT -1      /*WO9102*/                                                                       
                                     ) IS
    -- Prepara o CURSOR das pessoas que serão processada no cálculo
    cPessoasAProcessar cPessoasAProcessar_TYPE;
    TYPE rPessoasAProcessar_TYPE IS RECORD(IDPESSJUR   PLS_INTEGER,
                                           IDPESSOA    PLS_INTEGER,
                                           IDTITULAR   PLS_INTEGER, /*95333*/
                                           IDPLANOPREV PLS_INTEGER /*, OTACILIO SOL181765
                                           INSCRICAODATA DATE*/
                                          );
    rPessoasAProcessar rPessoasAProcessar_TYPE;
    vDataStartProcesso DATE;
    vCommitedBy        PLS_INTEGER;
    V_SEQHISTOPIR NUMBER;
    V_INSCRICAODATA DATE;
    V_VERIFICA_HISTOPIR NUMBER;
  BEGIN
    /*10872*/
    -- Modo Debug: 0 Desativado / 1 Ativado
    vFLGGravaLog := 0; 
    
    IF vFLGGravaLog > 0 THEN
  	   DELETE FROM CM.SALVASQL;
       COMMIT;
	END IF;
	/*10872*/
	
	--WO7028
    SELECT SEQHISTOPIR.NEXTVAL
      INTO V_SEQHISTOPIR
    FROM DUAL;
    SELECT PPP.INSCRICAODATA
      INTO V_INSCRICAODATA
    FROM PARTPREVPLAN PPP
    WHERE PPP.IDPESSOA = inIDTitular
      AND PPP.IDPESSJUR = inIDPessJur
      AND PPP.IDPLANOPREV = DECODE(inREB,1,66,74);
    --Inicio WO7028
    UPDATE HISTOPIR SET TIPOOPCAOIR = 2
    WHERE IDPESSOA = inIDPessoa
      AND IDPLANPREV = DECODE(inREB,1,66,74)
      AND TIPOOPCAOIR <> 2;
    SELECT count(*)
     INTO V_VERIFICA_HISTOPIR
    FROM HISTOPIR
    WHERE IDPESSOA = inIDPessoa
      AND IDPLANPREV = DECODE(inREB,1,66,74);
    IF V_VERIFICA_HISTOPIR < 1 THEN
      INSERT INTO HISTOPIR (IDHISTOPIR,IDPESSOA,IDPLANPREV,TIPOOPCAOIR,DTINICIO,DTFIM) VALUES (V_SEQHISTOPIR,inIDPessoa,DECODE(inREB,1,66,74),2,V_INSCRICAODATA,NULL);
    END IF;
    --termino WO7028
      
    outERRO     := 'OK';
    vErroInsert := 'OK';
    vCommitedBy := 0;
  
    IF (inTipoOpcaoIR IS NOT NULL) THEN
      vFLGTipoOpcaoIR := trim(upper(inTipoOpcaoIR));
      log_consulta('PR_CALC_PRAZO_ACUMULACAO', 'IDPESSOA: '|| inIDPessoa || ' - IDTITULAR: ' || inIDTitular || ' - MATR: ' || inMatricula || 'DT PREVISTA: ' || inMatricula);
    ELSE
      vFLGTipoOpcaoIR := 'R';
    END IF;
  
    IF (vFLGTipoOpcaoIR = 'R') THEN
      vIDTipoOpcaoIR := 2;
    ELSE
      vIDTipoOpcaoIR := 1;
    END IF;
  
    BEGIN
      -- EXCEPTION
    
      vDataStartProcesso := SYSDATE;
    
      IF (inDataPrevista IS NULL) THEN
        vDataPrevista := SYSDATE;
      ELSE
        vDataPrevista := inDataPrevista;
      END IF;
    
      PR_CarregaVar_Regra;
    
      OPEN cPessoasAProcessar FOR FN_MontaQueryPessoasAProcessar(inIDPessJur,
                                                                 inIDPessoa,
                                                                 inListaBenef,
                                                                 inREB,
                                                                 inNOVOPLANO);
      -- LOOP Principal <PESSOAS>
      LOOP
        FETCH cPessoasAProcessar
          INTO rPessoasAProcessar;
        EXIT WHEN cPessoasAProcessar%NOTFOUND;
      
        -- CORPO DO PROCEDIMENTO PRINCIPAL ------------------------------------------------------------
        IF To_Char(vDataStartProcesso, 'DD/MM/YYYY') <> To_Char(SYSDATE, 'DD/MM/YYYY') THEN
          PR_CarregaVar_Regra;
        END IF;
      
        /*20491 : inicio */   
        IF inIDTitular > 0 THEN       
           vIDPESSOA_TITULAR := inIDTitular;
        ELSE      
          /*95333 : INICIO */
          IF (inListaBenef IS NULL) OR (inListaBenef <= 0) THEN
            /*SIG 99421*/
            vIDPESSOA_TITULAR := inIDPessoa;
        
            -- OTACILIO KINTANA 1501823 SOL 167930 INICIO
            DECLARE
              block_to_execute VARCHAR(200) := ' BEGIN ' ||
                                               ' SELECT D.IDTITULAR, D.IDPESSOA ' ||
                                               ' INTO :1, :2 ' ||
                                               ' FROM DEPENTIT D  ' ||
                                               ' WHERE D.IDPESSOA =  ' || inIDPessoa ||
                                               ' AND D.IDTITULAR = ' || inIDTitular; /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
              vIDTITULAR_LOCAL NUMBER;
              vIDPESSOA_LOCAL  NUMBER;
            BEGIN
              IF (inMatricula IS NOT NULL) THEN
                block_to_execute := block_to_execute ||
                                    ' AND D.MATRICULA IS NOT NULL' || ';' ||
                                    ' END;';
              ELSE
                block_to_execute := block_to_execute ||
                                    ' AND D.MATRICULA IS NULL' || ';' ||
                                    ' END;';
              END IF;
          
              EXECUTE IMMEDIATE block_to_execute
                USING OUT vIDTITULAR_LOCAL, OUT vIDPESSOA_LOCAL;
          
              IF (vIDTITULAR_LOCAL <> vIDPESSOA_LOCAL) THEN
                 vIDPESSOA_TITULAR := vIDTITULAR_LOCAL;
              END IF;
            END;
            -- OTACILIO KINTANA 1501823 SOL 167930 FIM
         ELSE
            vIDPESSOA_TITULAR := rPessoasAProcessar.IDTITULAR;
          END IF;
          /*95333 : FIM*/
        END IF;
              
        vFlgDependente := FN_VerificaTitularFalecido(vIDPESSOA_TITULAR, rPessoasAProcessar.IDPLANOPREV);    /*SIG20491*/
      
        PR_LimpaVarGlobal;
      
        PR_CarregaVarIndices(rPessoasAProcessar.IDPESSJUR,
                             rPessoasAProcessar.IDPESSOA,
                             rPessoasAProcessar.IDPLANOPREV);
      
        PR_CarregaDataAssociacao( /*rPessoasAProcessar.INSCRICAODATA OTACILIO SOL181765,*/vIDPESSOA_TITULAR /*rPessoasAProcessar.IDPESSOA -- OTACILIO*/,
                                 rPessoasAProcessar.IDPLANOPREV);
      
        PR_VerificaBenefRisco(rPessoasAProcessar.IDPESSOA);
      
        PR_Deleta_Prazo_ACumulacao(rPessoasAProcessar.IDPESSJUR,
                                   rPessoasAProcessar.IDPESSOA,
                                   rPessoasAProcessar.IDPLANOPREV,
                                   inSeqResgate                      /*20491*/
                                   );
      
        -- NOVO PLANO - Calculos -------------------------------
        IF (rPessoasAProcessar.IDPLANOPREV = 74) THEN
          PR_Calc_Reserva_NP(rPessoasAProcessar.IDPESSJUR,
                             rPessoasAProcessar.IDPESSOA,
                             inMatricula,
                             rPessoasAProcessar.IDPLANOPREV,   /*20491*/
                             inSeqResgate,                     /*20491*/
                             inTipoCalculo,                    /*WO9102*/
                             inIdBeneficio                     /*WO9102*/
                             );
        END IF;
        -- FIM Novo Plano --------------------------------------
      
        -- REB - Calculos --------------------------------------
        IF (rPessoasAProcessar.IDPLANOPREV = 66) THEN
          PR_Calc_Reserva_reb(rPessoasAProcessar.IDPESSJUR,
                              rPessoasAProcessar.IDPESSOA,
                              inMatricula,
                              rPessoasAProcessar.IDPLANOPREV,   /*20491*/
                              inSeqResgate,                     /*20491*/
                              inTipoCalculo,                    /*WO9102*/
                              inIdBeneficio                     /*WO9102*/
                              );
        END IF;
        -- FIM REB ---------------------------------------------
      
        -- Gravacao na Base
        IF (vFLGGravaCalc = 1) THEN
          vCommitedBy := vCommitedBy + 1;
          IF vCommitedBy >= 100 THEN
            COMMIT;
            vCommitedBy := 0;
          END IF;
        END IF;
      
        -- FIM CORPO DO PROCEDIMENTO PRINCIPAL --------------------------------------------------------
      END LOOP;
      -- FIM LOOP <PESSOAS>.
    
      IF (vFLGGravaCalc = 1) THEN
        COMMIT;
      END IF;
    
      CLOSE cPessoasAProcessar;
    
    EXCEPTION
      WHEN OTHERS THEN
        BEGIN
          CLOSE cPessoasAProcessar;
          outERRO := 'ERRO (IDPESSOA: ' || rPessoasAProcessar.IDPESSOA ||
                     ') - PKG_PREV_CALC_PRAZOACUMULACAO: ' ||
                     to_char(SQLCODE) || ' - ' || SQLERRM;
        END;
    END;
    IF (vErroInsert <> 'OK') THEN
      outERRO := vErroInsert;
    END IF;
  END;


  -- FIM Procedure PRINCIPAL: Realiza o calculo do prazo de acumulação --------------------------------------
  PROCEDURE PR_CALC_PRAZO_ACUMULACAO(inIDPessJur       IN ELEGPATRO.IDPESSJUR%TYPE,
                                     inIDPessoa        IN ELEGPATRO.IDPESSOA%TYPE,
                                     inREB             IN PLS_INTEGER DEFAULT 1,
                                     inNOVOPLANO       IN PLS_INTEGER DEFAULT 1,
                                     inDataPrevista    IN DATE DEFAULT NULL,
                                     inTipoOpcaoIR     IN CHAR DEFAULT 'R',
                                     inMatricula       IN VARCHAR2,
                                     inIDTitular       IN DEPENTIT.IDTITULAR%TYPE, /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
                                     outTotalNovoPlano OUT NUMBER,
                                     outTotalREB       OUT NUMBER,
                                     outERRO           OUT VARCHAR,
                                     inSeqResgate      IN PLS_INTEGER DEFAULT -1,  /*SIG20491 */
                                     inTipoCalculo     IN PLS_INTEGER DEFAULT 2,   /*WO9102*/                                                                       
                                     inIdBeneficio     IN PLS_INTEGER DEFAULT -1   /*WO9102*/                                                                       
                                     ) IS
    vErro VARCHAR2(2000);
  BEGIN
    vFLGGravaCalc := 1;
  
    PR_CALC_PRAZO_ACUMULACAO(inIDPessJur,
                             inIDPessoa,
                             NULL,
                             inREB,
                             inNOVOPLANO,
                             inDataPrevista,
                             inTipoOpcaoIR,
                             inMatricula,
                             inIDTitular, /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
                             vErro,
                             inSeqResgate,    /*SIG20491 */
                             inTipoCalculo,   /*WO9102*/                                                                       
                             inIdBeneficio    /*WO9102*/                                                                       
                             );
  
    outERRO           := vErro;
    outTotalNovoPlano := vTotalNovoPlano;
    outTotalREB       := vTotalREB;
  
  END PR_CALC_PRAZO_ACUMULACAO;
END;