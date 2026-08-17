CREATE OR REPLACE PACKAGE BODY CM.PCK_CTB_CALC_PRAZOMEDIOPOND IS

  -------------------------------------------------------------------------
  --      H I S T Ã“ R I C O        D E          A L T E R A Ã‡ Ã• E S      --
  -------------------------------------------------------------------------
  -- Desenvolvedor:
  -- SOL..........:
  -- KINTANA......:
  -- Data.........:
  -- Rotina.......:
  -- Erro relatado:
  -- SoluÃ§Ã£o......:

  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 29377
  -- KINTANA......: N/A
  -- Data.........: 20/09/2016
  -- Rotina.......: Calculo de IR Regressivo - GraÃ§Ã£o do PMP
  -- Erro relatado: Um IDPESSOA possui duas matrÃ­culas, sendo que para cada matrÃ­cula possui titular diferente.
  -- SoluÃ§Ã£o......: Na condiÃ§Ã£o de buscar o IDTITULAR e o IDPESSOA na DEPENTIT, foi adicionado a condiÃ§Ã£o da Matricula

  -- Desenvolvedor: Edilaine
  -- SIG..........: 95333
  -- Data.........: 30/03/2020
  -- Rotina.......: PR_CALC_PMP, log_consulta
  -- Erro relatado: erro ao selecionar lista para processamento
  -- Solucao......: Ajuste na consulta para no considerar IDPESSOA e IDPESSJUR

  -- Desenvolvedor: Edilaine
  -- SIG..........: 99421
  -- Data.........: 13/04/2020
  -- Rotina.......: PR_CALC_PMP
  -- Erro relatado: erro ao processar individual
  -- Solucao......: ajuste para desconsiderar lista = 0
  ---------------------------------------------------------------------------
  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 100613
  -- Data.........: 25/06/2020
  -- Rotina.......: SqlNovoPlano, SqlRegReplan
  -- Erro relatado: Contribuicao de portabilidade agrupava para fazer o cálculo
  -- Solucao......: Utilizar o mês referência para quando for portabilidade Regressiva de Regressiva

  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 101474
  -- Data.........: 07/08/2020
  -- Erro relatado: Valor negativo no PMP
  -- Solucao......: Colocar to_char em todos os locais onde só tinha to_date

  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 102889
  -- Data.........: 06/10/2020
  -- Erro relatado: Valores negativos no fator do PMP no REB
  -- Solucao......: Tranformar a query em uma tabela virtual e acrescentar o order by

  -- Desenvolvedor: Rafael Vasconcelos
  -- SIG..........: 117253
  -- Data.........: 09/07/2021
  -- Erro relatado: Acrescentar novas reservas

  -- Desenvolvedor: Edilaine
  -- SIG..........: 20491
  -- Data.........: 24/06/2022
  -- Data inicio..: 23/05/2019
  -- Rotina.......: PR_CALC_PMP
  -- Erro relatado: melhoria - gravar IDTITULAR 
  -- Solucao......: rotina para inserir calculo para dependentes quanto titular do calculo for falecido

  -- Desenvolvedor: Tiago Von
  -- SIG..........: 129414
  -- Data.........: 27/09/2022
  -- Erro relatado: Acrescentar novas reservas (217 e 218)
  
  -- Desenvolvedor: Edilaine
  -- SIG..........: WO12337
  -- Data.........: 29/07/2024
  -- Erro relatado: duplicando valor da reserva qdo tem 2 registros na Opcao de IR
  
  -- Desenvolvedor: Roberta Neder
  -- Atender......: WO9102
  -- Data.........: 18/04/2024
  -- Erro relatado: 1 - Cálculo incorreto quando o participante possui 2 regimes de tributação
  --                2 - Não verificar mais o histórico de opção de ir. A opção escolhida no momento da
  --                    aposentadoria será a opção final
  -- Solução......: Foram criadas 2 novas procedures com as consultas corretas para o cálculo da reserva
  --                que forma a base de cálculo do pmp   

  -- Desenvolvedor: Edilaine
  -- SIG..........: WO10872
  -- Data.........: 27/01/2025
  -- Erro relatado: No REB desconsiderar reserva migrada com isenção de IR
  
  -------------------------------------------------------------------------

  -- VariÃ¡veis Global do Pacote ---------------------------------------------------------------------------

  -- Cursor das Pessoas a serem Processadas
  TYPE cPessoasAProcessar_TYPE IS REF CURSOR;

  vErroInsert     VARCHAR(4000);
  vFLGTipoOpcaoIR CHAR(01);

  /*SIG20491*/
  -- OTACILIO KINTANA 1501823 SOL 167930
  vIDPESSOA_TITULAR  PLS_INTEGER ;                   
  vFlgDependente     PLS_INTEGER DEFAULT 0;    
  /*SIG20491*/

  vIncPassoLog PLS_INTEGER := 0;     /*10872*/ 
  vFLGGravaLog PLS_INTEGER := 0;     /*10872*/  -- Modo Debug: 0 Desativado / 1 Ativado

  -- Procedure log_consulta ------------------------------------------------------------------------------------
  PROCEDURE log_consulta(inRotina in varchar2, inConsulta in varchar2) is
    PRAGMA AUTONOMOUS_TRANSACTION;
  
    block_to_execute VARCHAR2(3000);
  BEGIN
    IF vFLGGravaLog > 0 THEN       /*10872*/
      BEGIN
        /*10872*/
        if vIncPassoLog = 0 then
           select max(numpasso)+1 into vIncPassoLog from salvasql;    
        else
           vIncPassoLog := vIncPassoLog + 1; 
        end if;
        /*10872*/
        
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
  -- FIM Procedure log_consulta --------------------------------------------------------------------------------
  
  
  -- Procedure PR_Grava_Historico /*20491*/---------------------------------------------------------------------
  PROCEDURE PR_GravaHistorico(inMESANO      IN VARCHAR2,
                               inIDPessoa    IN ELEGPATRO.IDPESSOA%TYPE,
                               inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE,
                               inSaldoCotas  IN NUMBER,
                               inFator       IN NUMBER,
                               inPrazoMedio  IN NUMBER,  
                               inValorCota   IN NUMBER,
                               inTotalCotas  IN NUMBER
                               )
  IS       
    vSQLInsert  varchar(2000);
    
  BEGIN                      
  
    IF (vFlgDependente = 1) /*AND (inIDPessoa = vIDPESSOA_TITULAR)*/ THEN

      vSQLInsert := 'INSERT INTO HSTCALCULOPMP ' ||
                    '  (IDHSTCALCULOPMP, MESREFERENCIA, IDPESSOA, IDPLANOPREV, SALDOACUMULADO, ' ||
                    '   FATORPERMANENCIA, PRAZOMEDIOPONDERADO, VLRCOTA, QTDCOTA, IDTITULAR)    ' ||
                    'SELECT SEQPRAZOMEDIOPONDERADO.NEXTVAL, ' ||
                    '       DP.MESANO,   DP.IDPESSOA, DP.IDPLANOPREV, DP.SALDO, DP.FATOR, ' ||
                    '       DP.PRAZOMED, DP.VLRCOTA,  DP.QTDCOTA, DP.IDTITULAR ' ||
                    '  FROM (SELECT '||
                                    PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(inMESANO) ||' AS MESANO,  ' ||
                                    REPLACE(inSaldoCotas,',','.') ||' AS SALDO,   ' || 
                                    REPLACE(inFator,',','.')      ||' AS FATOR,   ' ||
                                    REPLACE(inPrazoMedio,',','.') ||' AS PRAZOMED,' ||
                                    REPLACE(inValorCota,',','.')  ||' AS VLRCOTA, ' ||
                                    REPLACE(inTotalCotas,',','.') ||' AS QTDCOTA, ' ||
                    '               BTT.IDPESSOA, BTT.IDTITULAR, BTT.IDPLANOPREV '||
                    '          FROM Bfciariotitplan btt ' ||
                    '          JOIN BENEFICIO BB ON BB.Idbeneficio = btt.Idbeneficio   '||
                    '         WHERE bb.tipobeneficio = 6 ' ||
                    '           and bb.flgdestbenef <> ''E''  '||
                    '           AND BTT.IDTITULAR    = ' || vIDPESSOA_TITULAR ||
                    '           AND BTT.IDPESSOA     = ' || inIDPessoa ||
                    '           AND btt.idplanoprev  = ' ||inIDPlanoPrev ||') DP ';
                       
    ELSE    
      vSQLInsert := 'INSERT INTO HSTCALCULOPMP ' ||
                    '  (IDHSTCALCULOPMP, MESREFERENCIA, IDPESSOA, IDPLANOPREV, SALDOACUMULADO, ' ||
                    '   FATORPERMANENCIA, PRAZOMEDIOPONDERADO, VLRCOTA, QTDCOTA, IDTITULAR)    ' ||
                    ' VALUES ' ||
                    '  (SEQPRAZOMEDIOPONDERADO.NEXTVAL, '||
                       PCK_ALL_FUNCAO_STRING.FN_Aspas_Simples(inMESANO) || ', ' ||
                       inIDPessoa    || ', ' ||
                       inIDPlanoPrev || ', ' ||
                       REPLACE(inSaldoCotas,',','.')  || ', ' ||
                       REPLACE(inFator,',','.')       || ', ' ||
                       REPLACE(inPrazoMedio,',','.')  || ', ' ||
                       REPLACE(inValorCota,',','.')   || ', ' ||
                       REPLACE(inTotalCotas,',','.')  || ', ' ||
                       vIDPESSOA_TITULAR ||
                    ')';     
    END IF;
    
    BEGIN -- EXCEPTION

        log_consulta('PR_Grava_Historico', vSQLInsert );

        EXECUTE IMMEDIATE vSQLInsert;

      EXCEPTION
        WHEN OTHERS THEN
        BEGIN
          vErroInsert := 'ERRO - CM.PCK_CTB_CALC_PRAZOMEDIOPOND : Erro na gravaçao de alguns itens do processo. - ' || to_char(SQLCODE) || ' - ' || SQLERRM;
          ROLLBACK;
        END;
    END;
    
  END;    
  -- FIM Procedure PR_GravaHistorico -------------------------------------------------------------------------
    

  -- Procedure PR_Calc_Reserva_NP ----------------------------------------------------------------------------
  PROCEDURE PR_Calc_Reserva_NP(inIDPessJur IN ELEGPATRO.IDPESSJUR%TYPE,
                               inIDPessoa  IN ELEGPATRO.IDPESSOA%TYPE,
                               inDataPgto  IN DATE,
                               inMatricula IN VARCHAR2,
                               inIDTitular IN DEPENTIT.IDTITULAR%TYPE  /*20491*/                             
                               ) IS
  
    vSQLReservas VARCHAR2(20000);
  
    --BRUNO AZEVEDO
    vTipoOpcaoIR_Atual     NUMBER;
    vTipoOpcaoIR_Anterior  NUMBER;
    vFLGTipoOpcaoIRPortada PLS_INTEGER;
    --BRUNO AZEVEDO
  
    vVLRSaldoCotaAcumulado NUMBER(18, 2);
    vNDiasMesAnterior      PLS_INTEGER;
    vFP2Atual              NUMBER(18, 2);
    vFP2Anterior           NUMBER(18, 2);
    vFP1Valor              NUMBER(18, 2);
    vPrimeiroMes           BOOLEAN := FALSE;
    vPA                    NUMBER DEFAULT 0;
    vSomaValorCotas        NUMBER DEFAULT 0;
    vMesReferenciaAnt      DATE;
  
    --BRUNO AZEVEDO SOL 158860
    vDataDIB    DATE;
    vTotalCotas NUMBER DEFAULT 0;
    vFim        BOOLEAN := FALSE;
    vUltSaldo   NUMBER DEFAULT 0;
    vUltFP      NUMBER DEFAULT 0;
    vUltMes     DATE;
    --BRUNO AZEVEDO SOL 158860
  
    --BRUNO AZEVEDO SOL 167821
    vValorAntigo NUMBER(18, 2);
    --BRUNO AZEVEDO SOL 167821
  
    -- Prepara o CURSOR das reservas que serÃ£o processada no cÃ¡lculo para o NOVO PLANO
    TYPE cReservasNP_TYPE IS REF CURSOR;
  
    cReservasNP cReservasNP_TYPE;
  
    TYPE rReservasNP_TYPE IS RECORD( --TIPO_RESERVA NUMBER(3), --BRUNO AZEVEDO
      MESREFERENCIA DATE,
      QTDE_COTAS    NUMBER);
  
    rReservasNP rReservasNP_TYPE;
  
  BEGIN
  
    --BRUNO AZEVEDO
    vFLGTipoOpcaoIRPortada := 0;
    vSQLReservas           := '';
  
    --Verificar Tipo de Opcao de IR atual e anterior
	/*9102 : inicio - reativado codigo desativado  WO12337  */
    /*WO12337 : inicio*/
    BEGIN
      SELECT NVL(tipoopcaoir_atual, -1) tipoopcaoir_atual,
             NVL(tipoopcaoir_anterior, -1) tipoopcaoir_anterior
        INTO vTipoOpcaoIR_Atual, vTipoOpcaoIR_Anterior
        FROM (SELECT HOIR.idhistopir,
                     HOIR.idpessoa,
                     HOIR.idplanprev,
                     HOIR.tipoopcaoir tipoopcaoir_atual,
                     LEAD(HOIR.tipoopcaoir) OVER(ORDER BY HOIR.idhistopir DESC) tipoopcaoir_anterior,
                     HOIR.dtinicio,
                     HOIR.dtfim
                FROM histopir HOIR
               WHERE HOIR.idpessoa = inIDTitular   -- inIDPessoa    -- 20491 
                 AND HOIR.idplanprev = 74
               ORDER BY HOIR.idhistopir DESC)
       WHERE ROWNUM = 1
       ORDER BY DTFIM DESC;
    EXCEPTION
      WHEN OTHERS THEN
        vTipoOpcaoIR_Atual    := -1;
        vTipoOpcaoIR_Anterior := -1;
    END;
    /*WO12337 : inicio*/
	/*9102 : fim - reativado codigo desativado  WO12337  */
    --BRUNO AZEVEDO
  
    vSQLReservas := ' SELECT DATARECEBIMENTO AS MESREFERENCIA, SUM(QTDE_COTAS) AS QTDE_COTAS  ' ||
                    ' FROM (  ';
    IF (vTipoOpcaoIR_Anterior <> 2) THEN
      vSQLReservas := vSQLReservas ||
                      '      SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                      '             HOIR.dtinicio DATARECEBIMENTO, ' ||
                      '             SUM(DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS)) AS QTDE_COTAS ' ||
                      '        FROM HISTMOVRESERVA HS,  ' ||
                      '             HISTOPIR HOIR  ' ||
                      '       WHERE HS.IDPESSJUR = ' || inIDPessJur ||
                      '         AND HS.IDPESSOA = ' || vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                      '         AND HS.IDPLANOPREV = 74    ' ||
                      '         AND HS.IDTIPORESERVA IN (100, 101, 217) ' || -- SIG 129414 - Inclusão do ID 217
                      '         AND HOIR.idpessoa = HS.idpessoa ' ||
                      '         AND HOIR.idplanprev = HS.idplanoprev  ' ||
                      '         AND HOIR.tipoopcaoir = 2 ' ||
                      '         AND HS.DATARECEBIMENTO < HOIR.dtinicio  ' ||
                      '    GROUP BY HS.IDTIPORESERVA, HOIR.dtinicio ' ||
                      '    UNION ALL   ';
    END IF;
  
    vSQLReservas := vSQLReservas ||
                    '    SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '           HS.DATARECEBIMENTO,   ' ||
                    '           DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS) AS QTDE_COTAS   ' ||
                    '      FROM HISTMOVRESERVA HS, ' ||
                    '           HISTOPIR HOIR ' ||
                    '     WHERE HS.IDPESSJUR = ' || inIDPessJur ||
                    '       AND HS.IDPESSOA = ' || vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '       AND HS.IDPLANOPREV = 74   ' ||
                    '       AND HS.IDTIPORESERVA IN (100, 101, 217)   ' || -- SIG 129414 - Inclusão do ID 217
                    '       AND HOIR.idpessoa = HS.idpessoa ' ||
                    '       AND HOIR.idplanprev = HS.idplanoprev ' ||
                    '       AND HOIR.tipoopcaoir = 2 ' ||
                    '       AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE))  ' ||
                   
                   -- Tipo de Reserva: PORTADAS
                    '      UNION ALL   ' || '      SELECT TIPO_RESERVA, ' ||
                   -- '             DATARECEBIMENTO, '||    --SIG 100613
                    '             to_date(DATARECEBIMENTO,''dd/mm/yyyy'') as DATARECEBIMENTO, ' || --SIG 100613
                    '             VLRCOTAS ' || '       FROM (     ' ||
                    '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '                   POR.DATAOPCAOIR, ' ||
                   --'                  h.DATARECEBIMENTO,'|| --SIG 100613
                    '                  ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || --SIG 100613
                    '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS' ||
                    '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H' ||
                    '                   WHERE POR.idpessoa = ' || vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '                     AND POR.idpessjur = ' || inIDPessJur ||
                    '                     AND POR.idplanoprev = 74 ' ||
                    --'                     AND POR.opcaoir = ''R'' ' ||             /*WO12337*/					
                    '                     AND POR.opcaoir = ''R'' ' ||               /*9102*/
                    '                     AND H.IDTIPORESERVA IN (110, 111,208,209) ' || --SIG 117253 Acrescentar as reservas 208 e 209
                    '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE ' ||
                    '                     AND POR.IDPESSOA = HST.IDPESSOA ' ||
                    '                     AND POR.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HST.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HST.IDPLANOPREV = H.IDPLANOPREV ' ||
                    '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV ' ||
                    '                     AND POR.IDPLANOPREV = H.IDPLANOPREV ' ||
                    '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO ' ||
                    '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                    '                   GROUP BY H.IDTIPORESERVA, ' ||
                    '                            POR.DATAOPCAOIR, ' ||
                    '                            H.mesreferencia ' ||
                    '                   ORDER BY H.mesreferencia)  ' ||
					
                	/*9102 : inicio - reativado codigo desativado  WO12337  */                  
					/*WO12337 : inicio*/
                   --PORTADAS (PROGRESSIVAS QUANDO O PARTICIPANTE EH REGRESSIVO)
                    '      UNION ALL   ' || '      SELECT TIPO_RESERVA, ' ||
                    '             DATAR AS DATARECEBIMENTO, ' ||
                    '             VLRCOTAS ' || '       FROM (     ' ||
                    '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '                   POR.DATAOPCAOIR, ' ||
                    '                   (CASE ' ||
                    '                     WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                      H.DATARECEBIMENTO ' ||
                    '                     ELSE ' ||
                    '                      HOIR.DTINICIO ' ||
                    '                   END) AS DATAR, ' ||
                    '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS ' ||
                    '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, HISTOPIR HOIR ' ||
                    '                   WHERE POR.idpessoa =  ' || vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '                     AND POR.idpessjur =  ' || inIDPessJur ||
                    '                     AND POR.idplanoprev = 74  ' ||
                    '                     AND POR.opcaoir = ''P''   ' ||
                    '                     AND H.IDTIPORESERVA IN (110, 111,208,209)  ' || --SIG 117253 Acrescentar as reservas 208 e 209
                    '                     AND HOIR.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HOIR.IDPLANPREV = H.IDPLANOPREV  ' ||
                    '                     AND HOIR.TIPOOPCAOIR = 2  ' ||
                    '                     AND HOIR.DTFIM IS NULL ' ||
                    '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE  ' ||
                    '                     AND POR.IDPESSOA = HST.IDPESSOA  ' ||
                    '                     AND POR.IDPESSOA = H.IDPESSOA  ' ||
                    '                     AND HST.IDPESSOA = H.IDPESSOA  ' ||
                    '                     AND HST.IDPLANOPREV = H.IDPLANOPREV  ' ||
                    '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV  ' ||
                    '                     AND POR.IDPLANOPREV = H.IDPLANOPREV  ' ||
                    '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO  ' ||
                    '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                    '                   GROUP BY H.IDTIPORESERVA,  ' ||
                    '                            POR.DATAOPCAOIR,  ' ||
                    '                            (CASE ' ||
                    '                              WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                                H.DATARECEBIMENTO ' ||
                    '                              ELSE ' ||
                    '                                HOIR.DTINICIO ' ||
                    '                             END)  ' ||
                    '                   ORDER BY (CASE ' ||
                    '                              WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                                H.DATARECEBIMENTO ' ||
                    '                              ELSE ' ||
                    '                                HOIR.DTINICIO ' ||
                    '                              END))  '||
                    /*WO12337 : fim */
                	/*9102 : fim - reativado codigo desativado  WO12337  */                  
                    '	) ' ||
                    ' GROUP BY DATARECEBIMENTO ' ||
                    ' order by DATARECEBIMENTO ';
  
        log_consulta('PR_Grava_Reserva_NP', vSQLReservas );
  
    --  insert into rafael(query) values (vSQLReservas);        
    -- commit;
    OPEN cReservasNP FOR vSQLReservas;
  
    --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    BEGIN
      -- INICIO OTACILIO SOL 191248 KINTANA 1812352
      SELECT TMP.DATAINICIOFUND
        INTO vDataDIB
        FROM (SELECT IDSITBENEFICIO, DATAINICIOFUND
                FROM BENEFBFCIARIO
              --  INTO VDATADIB FROM BENEFBFCIARIO
               WHERE IDPESSOA = inIDPESSOA
                 AND IDPLANOPREV = 74
                 AND IDSITBENEFICIO IN (1, 3) -- ALTERACAO ROBETA 11/11/2014 SOL 229803
                 AND FONTEPAGADORA = 1 -- GETIF: SOL184950.10663 KINTANA 1739136
               ORDER BY IDSITBENEFICIO) TMP
       WHERE ROWNUM <= 1;
      -- FIM OTACILIO SOL 191248 KINTANA 1812352
    EXCEPTION
      WHEN OTHERS THEN
        vDataDIB := SYSDATE;
    END;
    --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
  
    vTotalCotas := 0;
  
    LOOP
      FETCH cReservasNP
        INTO rReservasNP;
    
      --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
      IF (cReservasNP%NOTFOUND) THEN
      
        IF (vDataDIB < rReservasNP.MESREFERENCIA) THEN
           /*20491 : inicio*/
           PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                             inIDPessoa, 
                             74,
                             vSomaValorCotas,
                             vFP2Atual,
                             (vFP2Atual / vSomaValorCotas),
                             0,
                             vTotalCotas);
            /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA, PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(vDataDIB,'MM/YYYY'),inIDPessoa,74,vSomaValorCotas,vFP2Atual,(vFP2Atual/vSomaValorCotas),0,vTotalCotas);
            */              
        
        ELSE
          -- vNDiasMesAnterior := TO_DATE(vDataDIB, 'dd/mm/yyyy'), Rafael Vasconcelos
          vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                       'DD/MM/YYYY') - vMesReferenciaAnt;
          --POSITIVO
          IF (vTotalCotas >= 0) THEN
            vFP2Atual    := (vFP2Atual +
                            ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior + 0)) / 365);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (vTotalCotas < 0) THEN
            vFP2Atual    := (vFP2Atual +
                            (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                            (1 + 0 / vVLRSaldoCotaAcumulado);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          /*20491 : inicio*/
          PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                            inIDPessoa, 
                            74,
                            vSomaValorCotas,
                            vFP2Atual,
                            (vFP2Atual / vSomaValorCotas),
                            0,
                            0);
            /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(vDataDIB,'MM/YYYY'),inIDPessoa,74,vSomaValorCotas,vFP2Atual,(vFP2Atual/vSomaValorCotas),0,0);
            */  
          /*20491 : fim*/
        
        END IF;
      END IF;
      --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    
      EXIT WHEN cReservasNP%NOTFOUND;
    
      vPA := 0;
      IF rReservasNP.MESREFERENCIA IS NOT NULL THEN
        IF (NOT vPrimeiroMes) THEN
          vPrimeiroMes := TRUE;
        
          --BRUNO AZEVEDO SOL 167821
          BEGIN
            SELECT SUM(DECODE(HI.FLGENTRADA, 1, HI.VLRCOTAS, -HI.VLRCOTAS))
              INTO vValorAntigo
              FROM HISTMOVRESERVA HI
             WHERE HI.IDPESSOA = inIDPessoa
               AND HI.DATARECEBIMENTO IS NOT NULL
               AND HI.IDTIPORESERVA IN (100, 101, 217) -- SIG 129414 - Inclusão do ID 217
               AND HI.DATARECEBIMENTO <= rReservasNP.MESREFERENCIA
               AND HI.IDPLANOPREV = 74;
          EXCEPTION
            WHEN OTHERS THEN
              vValorAntigo := 0;
          END;
        
          IF (vValorAntigo > 0) THEN
            vVLRSaldoCotaAcumulado := vValorAntigo;
          ELSE
            vVLRSaldoCotaAcumulado := rReservasNP.QTDE_COTAS;
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          --vNDiasMesAnterior := TO_DATE(inDataPgto,'DD/MM/YYYY') - TO_DATE(rReservasNP.MESREFERENCIA,'DD/MM/YYYY');
          vNDiasMesAnterior := 1;
          vFP1Valor         := ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior) / 365);
          vFP2Anterior      := vFP1Valor;
          vNDiasMesAnterior := substr(last_day(rReservasNP.MESREFERENCIA),
                                      1,
                                      2);
          -- vMesReferenciaAnt := TO_DATE(ReservasNP.MESREFERENCIA,'dd/mm/yyyy'), Rafael Vasconcelos  - SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasNP.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
            vSomaValorCotas := vSomaValorCotas + vValorAntigo;
          ELSE
            vSomaValorCotas := vSomaValorCotas +
                               abs(rReservasNP.QTDE_COTAS);
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          --BRUNO AZEVEDO
          vPA := vFP1Valor;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP1Valor / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               vValorAntigo);

            /*INSERT INTO HSTCALCULOPMP
            (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
            (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),inIDPessoa,74,vSomaValorCotas,vFP1Valor,VPa,0,vValorAntigo);
            */
             /*20491 : fim*/
                 
          ELSE
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               rReservasNP.QTDE_COTAS);
              /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),inIDPessoa,74,vSomaValorCotas,vFP1Valor,VPa,0,rReservasNP.QTDE_COTAS);
              */ 
             /*20491 : fim*/
                   
          END IF;
          --BRUNO AZEVEDO SOL 167821
        ELSE
        
          --IF (TO_DATE(rReservasNP.MESREFERENCIA, 'dd/mm/yyyy') <> vMesReferenciaAnt) --Rafael Vasconcelos SIG 101474
        
          IF (TO_DATE(to_char(rReservasNP.MESREFERENCIA, 'dd/mm/yyyy'),
                      'DD/MM/YYYY') <> vMesReferenciaAnt) THEN
            vNDiasMesAnterior := TO_DATE(to_char(rReservasNP.MESREFERENCIA,
                                                 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vMesReferenciaAnt;
            IF (vFim = FALSE) THEN
              vUltMes := vMesReferenciaAnt;
            END IF;
          END IF;
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          --POSITIVO
          IF (rReservasNP.QTDE_COTAS >= 0) THEN
            vFP2Atual := (vFP2Anterior +
                         ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior +
                         rReservasNP.QTDE_COTAS)) / 365);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (rReservasNP.QTDE_COTAS < 0) THEN
            vFP2Atual := (vFP2Anterior +
                         (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                         (1 +
                         rReservasNP.QTDE_COTAS / vVLRSaldoCotaAcumulado);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
          IF (vFim = FALSE) THEN
            vUltSaldo := vVLRSaldoCotaAcumulado;
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        
          vVLRSaldoCotaAcumulado := vVLRSaldoCotaAcumulado +
                                    rReservasNP.QTDE_COTAS;
          --vMesReferenciaAnt := TO_DATE(rReservasNP.MESREFERENCIA,'DD/MM/YYYY'); Rafael Vasconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasNP.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
        
          vSomaValorCotas := vSomaValorCotas + rReservasNP.QTDE_COTAS;
          --BRUNO AZEVEDO
          vPA := vFP2Atual;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP2Atual / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          IF (rReservasNP.MESREFERENCIA < vDataDIB) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP2Atual,
                               abs(VPa),
                               0,
                               rReservasNP.QTDE_COTAS);

              /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),inIDPessoa,74,vSomaValorCotas,vFP2Atual,abs(VPa),0,rReservasNP.QTDE_COTAS);
              */
             /*20491 : fim*/         
          ELSE
            IF (vFim = FALSE) THEN
              vFim := TRUE;
            END IF;
          
            --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            vTotalCotas := vTotalCotas + rReservasNP.QTDE_COTAS;
          
            --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            --vNDiasMesAnterior := TO_DATE(vDataDIB, 'DD/MM/YYYY') - vUltMes; Rafael SIG 101474
            vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vUltMes;
          
            --POSITIVO
            IF (vTotalCotas >= 0) THEN
              vFP2Atual    := (vUltFP +
                              ((vUltSaldo * nvl(vNDiasMesAnterior, 0) +
                              vTotalCotas)) / 365);
              vFP2Anterior := vFP2Atual;
            END IF;
          
            --NEGATIVO
            --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
            IF (vTotalCotas < 0) THEN
              vFP2Atual    := (vUltFP +
                              (vUltSaldo * nvl(vNDiasMesAnterior, 0) / 365)) *
                              (1 + vTotalCotas / vUltSaldo);
              vFP2Anterior := vFP2Atual;
            END IF;
          
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        END IF;
      END IF;
    
    END LOOP;
  
    CLOSE cReservasNP;
  
  END;
  -- FIM Procedure PR_Calc_Reserva_NP ------------------------------------------------------------------------


  /*WO9102 : inicio*/    
  -- Procedure PR_Calc_Reserva_Nova_NP ----------------------------------------------------------------------------
  PROCEDURE PR_Calc_Reserva_Nova_NP(inIDPessJur IN ELEGPATRO.IDPESSJUR%TYPE,
                                    inIDPessoa  IN ELEGPATRO.IDPESSOA%TYPE,
                                    inDataPgto  IN DATE,
                                    inMatricula IN VARCHAR2,
                                    inIDTitular IN DEPENTIT.IDTITULAR%TYPE,    /*20491*/                             
                                    inTipoCalculo IN PLS_INTEGER DEFAULT 2     /*WO9102*/                        
                                   ) IS
  
    vSQLReservas VARCHAR2(20000);
   
    vVLRSaldoCotaAcumulado NUMBER(18, 2);
    vNDiasMesAnterior      PLS_INTEGER;
    vFP2Atual              NUMBER(18, 2);
    vFP2Anterior           NUMBER(18, 2);
    vFP1Valor              NUMBER(18, 2);
    vPrimeiroMes           BOOLEAN := FALSE;
    vPA                    NUMBER DEFAULT 0;
    vSomaValorCotas        NUMBER DEFAULT 0;
    vMesReferenciaAnt      DATE;
  
    --BRUNO AZEVEDO SOL 158860
    vDataDIB    DATE;
    vTotalCotas NUMBER DEFAULT 0;
    vFim        BOOLEAN := FALSE;
    vUltSaldo   NUMBER DEFAULT 0;
    vUltFP      NUMBER DEFAULT 0;
    vUltMes     DATE;
    --BRUNO AZEVEDO SOL 158860
  
    --BRUNO AZEVEDO SOL 167821
    vValorAntigo NUMBER(18, 2);
    --BRUNO AZEVEDO SOL 167821
    
    vNumReg  NUMBER DEFAULT 0;    /*WO9102*/
  
    -- Prepara o CURSOR das reservas que serÃ£o processada no cÃ¡lculo para o NOVO PLANO
    TYPE cReservasNP_TYPE IS REF CURSOR;
  
    cReservasNP cReservasNP_TYPE;
  
    TYPE rReservasNP_TYPE IS RECORD( --TIPO_RESERVA NUMBER(3), --BRUNO AZEVEDO
      MESREFERENCIA DATE,
      QTDE_COTAS    NUMBER);
  
    rReservasNP rReservasNP_TYPE;
  
  BEGIN
  
    vSQLReservas := '';
    
    vsqlreservas := ' SELECT DATARECEBIMENTO AS MESREFERENCIA, SUM(QTDE_COTAS) AS QTDE_COTAS  ' ||
                    ' FROM (  ' ||
                    '    SELECT HS.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '           HS.DATARECEBIMENTO,   ' ||
                    '           DECODE(HS.FLGENTRADA, 1, HS.VLRCOTAS, -HS.VLRCOTAS) AS QTDE_COTAS,   ' ||
                    '           0 AS TIPOCALCULO      '||   /*WO9102*/                      
                    '      FROM HISTMOVRESERVA HS ' ||
                    '      join reservaxplano r on r.idplanoprev = hs.idplanoprev and r.idtiporeserva = hs.idtiporeserva ' ||
                    '     WHERE HS.IDPESSJUR = ' || inidpessjur ||
                    '       AND HS.IDPESSOA = ' || vidpessoa_titular || 
                    '       AND HS.IDPLANOPREV = 74   ' ||
                    '       and r.ANALITICOSINTETI = ''A'' ' ||
                    '       and (CODHIERARQUIA like ''12%'' or  CODHIERARQUIA like ''11%'' or CODHIERARQUIA like ''17%'') ' ||
                   -- Tipo de Reserva: PORTADAS
                    '     UNION ALL   ' || 
                    '    SELECT TIPO_RESERVA, ' ||
                    '           to_date(DATARECEBIMENTO,''dd/mm/yyyy'') as DATARECEBIMENTO, ' || 
                    '           VLRCOTAS, ' || 
                    '           TIPOCALCULO      '||   /*WO9102*/                      
                    '      FROM (     ' ||
                    '          SELECT H.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '                 POR.DATAOPCAOIR, ' ||
                    '                ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || 
                    '                 SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS,' ||
                    '                 (select nvl(flgregressiva, 0) from reservaxplano r where r.idtiporeserva = h.idtiporeserva and h.idplanoprev = r.idplanoprev) as tipocalculo '|| --Roberta 9102
                    '            from hstcontribprev hst  ' ||
                    '            join portabilidadeprev por on por.idplanoprev = hst.idplanoprev ' ||
                    '             and hst.idportabilidade = por.idportabilidade ' ||
                    '             and por.idpessoa = hst.idpessoa ' ||
                    '            join histmovreserva h on por.idpessoa = h.idpessoa ' ||
                    '             and hst.idplanoprev = h.idplanoprev ' ||
                    '             and hst.numrecebimento = h.numrecebimento ' ||
                    '             and por.idpessjur = h.idpessjur ' ||
                    '             and hst.idpessoa = h.idpessoa ' ||
                    '             and por.idplanoprev = h.idplanoprev' || 
                    '            join contribuicao c on c.idcontribuicao = por.idcontribuicao ' ||
                    '           WHERE POR.idpessoa = ' || vidpessoa_titular || 
                    '             AND POR.idpessjur = ' || inidpessjur ||
                    '             AND POR.idplanoprev = 74 ' ||
                    '             AND H.IDTIPORESERVA IN (select idtiporeserva from reservaxplano where flgportabilidade = 1) ' ||
                    --'             and (por.opcaoir = ''R'' or (por.opcaoir = ''P'' and por.datarecebimento <= ' ||v_data_corte_opcaoir || ')) '||
                    '           GROUP BY H.IDTIPORESERVA, ' ||
                    '                 POR.DATAOPCAOIR, ' ||
                    '                 H.mesreferencia,' ||
                    '                 h.idplanoprev '|| --Roberta
                    '           ORDER BY H.mesreferencia))  ' ||
                    ' WHERE 1 = 1 ';      /*WO9102*/


    /*WO9102 : inicio*/
    IF inTipoCalculo <> 2 then
       vSQLReservas := vSQLReservas || '  AND TIPOCALCULO = '||inTipoCalculo;      
    END IF;
    /*WO9102 : fim*/

    vSQLReservas := vSQLReservas ||
                    ' GROUP BY DATARECEBIMENTO ' ||
                    ' order by DATARECEBIMENTO ';
  
    log_consulta('PR_CALC_PMP Consulta Reserva NP', vSQLReservas);
  
    OPEN cReservasNP FOR vSQLReservas;
  
    --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    BEGIN
      -- INICIO OTACILIO SOL 191248 KINTANA 1812352
      SELECT TMP.DATAINICIOFUND
        INTO vDataDIB
        FROM (SELECT IDSITBENEFICIO, DATAINICIOFUND
                FROM BENEFBFCIARIO
              --  INTO VDATADIB FROM BENEFBFCIARIO
               WHERE IDPESSOA = inIDPESSOA
                 AND IDPLANOPREV = 74
                 AND IDSITBENEFICIO IN (1, 3) -- ALTERACAO ROBETA 11/11/2014 SOL 229803
                 AND FONTEPAGADORA = 1 -- GETIF: SOL184950.10663 KINTANA 1739136
               ORDER BY IDSITBENEFICIO) TMP
       WHERE ROWNUM <= 1;
      -- FIM OTACILIO SOL 191248 KINTANA 1812352
    EXCEPTION
      WHEN OTHERS THEN
        vDataDIB := SYSDATE;
    END;
    --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
  
    vTotalCotas := 0;
  
    LOOP
      FETCH cReservasNP
        INTO rReservasNP;
    
      --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
      IF (cReservasNP%NOTFOUND) and (vNumReg > 1) THEN     /*WO9102*/
      
        IF (vDataDIB < rReservasNP.MESREFERENCIA) THEN
           /*20491 : inicio*/
           PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                             inIDPessoa, 
                             74,
                             vSomaValorCotas,
                             vFP2Atual,
                             (vFP2Atual / vSomaValorCotas),
                             0,
                             vTotalCotas);
        
        ELSE
          -- vNDiasMesAnterior := TO_DATE(vDataDIB, 'dd/mm/yyyy'), Rafael Vasconcelos
          vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                       'DD/MM/YYYY') - vMesReferenciaAnt;
          
          --POSITIVO
          IF (vTotalCotas >= 0) THEN
            vFP2Atual    := (vFP2Atual +
                            ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior + 0)) / 365);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (vTotalCotas < 0) THEN
            vFP2Atual    := (vFP2Atual +
                            (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                            (1 + 0 / vVLRSaldoCotaAcumulado);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          /*20491 : inicio*/
          PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                            inIDPessoa, 
                            74,
                            vSomaValorCotas,
                            vFP2Atual,
                            (vFP2Atual / vSomaValorCotas),
                            0,
                            0);
          /*20491 : fim*/
        
        END IF;
      END IF;
      --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    
      EXIT WHEN cReservasNP%NOTFOUND;
    
      vNumReg := vNumReg + 1;    /*WO9102*/
    
      vPA := 0;
      IF rReservasNP.MESREFERENCIA IS NOT NULL THEN
        IF (NOT vPrimeiroMes) THEN
          vPrimeiroMes := TRUE;
        
          --BRUNO AZEVEDO SOL 167821
          BEGIN
            SELECT SUM(DECODE(HI.FLGENTRADA, 1, HI.VLRCOTAS, -HI.VLRCOTAS))
              INTO vValorAntigo
              FROM HISTMOVRESERVA HI
             WHERE HI.IDPESSOA = inIDPessoa
               AND HI.DATARECEBIMENTO IS NOT NULL
               AND HI.IDTIPORESERVA IN (100, 101, 217) -- SIG 129414 - Inclusão do ID 217
               AND HI.DATARECEBIMENTO <= rReservasNP.MESREFERENCIA
               AND HI.IDPLANOPREV = 74;
          EXCEPTION
            WHEN OTHERS THEN
              vValorAntigo := 0;
          END;
        
          IF (vValorAntigo > 0) THEN
            vVLRSaldoCotaAcumulado := vValorAntigo;
          ELSE
            vVLRSaldoCotaAcumulado := rReservasNP.QTDE_COTAS;
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          --vNDiasMesAnterior := TO_DATE(inDataPgto,'DD/MM/YYYY') - TO_DATE(rReservasNP.MESREFERENCIA,'DD/MM/YYYY');
          vNDiasMesAnterior := 1;
          vFP1Valor         := ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior) / 365);
          vFP2Anterior      := vFP1Valor;
          vNDiasMesAnterior := substr(last_day(rReservasNP.MESREFERENCIA),
                                      1,
                                      2);
          -- vMesReferenciaAnt := TO_DATE(ReservasNP.MESREFERENCIA,'dd/mm/yyyy'), Rafael Vasconcelos  - SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasNP.MESREFERENCIA,'dd/mm/yyyy'), 'DD/MM/YYYY');
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
            vSomaValorCotas := vSomaValorCotas + vValorAntigo;
          ELSE
            vSomaValorCotas := vSomaValorCotas +
                               abs(rReservasNP.QTDE_COTAS);
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          --BRUNO AZEVEDO
          vPA := vFP1Valor;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP1Valor / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               vValorAntigo);
             /*20491 : fim*/
                 
          ELSE
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               rReservasNP.QTDE_COTAS);
             /*20491 : fim*/
                   
          END IF;
          --BRUNO AZEVEDO SOL 167821
        ELSE
        
          --IF (TO_DATE(rReservasNP.MESREFERENCIA, 'dd/mm/yyyy') <> vMesReferenciaAnt) --Rafael Vasconcelos SIG 101474
        
          IF (TO_DATE(to_char(rReservasNP.MESREFERENCIA, 'dd/mm/yyyy'),
                      'DD/MM/YYYY') <> vMesReferenciaAnt) THEN
            vNDiasMesAnterior := TO_DATE(to_char(rReservasNP.MESREFERENCIA,
                                                 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vMesReferenciaAnt;
            IF (vFim = FALSE) THEN
              vUltMes := vMesReferenciaAnt;
            END IF;
          END IF;
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          --POSITIVO
          IF (rReservasNP.QTDE_COTAS >= 0) THEN
            vFP2Atual := (vFP2Anterior +
                         ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior +
                         rReservasNP.QTDE_COTAS)) / 365);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (rReservasNP.QTDE_COTAS < 0) THEN
            vFP2Atual := (vFP2Anterior +
                         (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                         (1 +
                         rReservasNP.QTDE_COTAS / vVLRSaldoCotaAcumulado);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
          IF (vFim = FALSE) THEN
            vUltSaldo := vVLRSaldoCotaAcumulado;
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        
          vVLRSaldoCotaAcumulado := vVLRSaldoCotaAcumulado +
                                    rReservasNP.QTDE_COTAS;
          --vMesReferenciaAnt := TO_DATE(rReservasNP.MESREFERENCIA,'DD/MM/YYYY'); Rafael Vasconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasNP.MESREFERENCIA,'dd/mm/yyyy'),'DD/MM/YYYY');
        
          vSomaValorCotas := vSomaValorCotas + rReservasNP.QTDE_COTAS;
          --BRUNO AZEVEDO
          vPA := vFP2Atual;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP2Atual / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          IF (rReservasNP.MESREFERENCIA < vDataDIB) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasNP.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 74,
                               vSomaValorCotas,
                               vFP2Atual,
                               abs(VPa),
                               0,
                               rReservasNP.QTDE_COTAS);
             /*20491 : fim*/         
          ELSE
            IF (vFim = FALSE) THEN
              vFim := TRUE;
            END IF;
          
            --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            vTotalCotas := vTotalCotas + rReservasNP.QTDE_COTAS;
          
            --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            --vNDiasMesAnterior := TO_DATE(vDataDIB, 'DD/MM/YYYY') - vUltMes; Rafael SIG 101474
            vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vUltMes;
          
            --POSITIVO
            IF (vTotalCotas >= 0) THEN
              vFP2Atual    := (vUltFP +
                              ((vUltSaldo * nvl(vNDiasMesAnterior, 0) +
                              vTotalCotas)) / 365);
              vFP2Anterior := vFP2Atual;
            END IF;
          
            --NEGATIVO
            --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
            IF (vTotalCotas < 0) THEN
              vFP2Atual    := (vUltFP +
                              (vUltSaldo * nvl(vNDiasMesAnterior, 0) / 365)) *
                              (1 + vTotalCotas / vUltSaldo);
              vFP2Anterior := vFP2Atual;
            END IF;
          
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        END IF;
      END IF;
    
    END LOOP;
  
    CLOSE cReservasNP;
  
  END;
  /*WO9102 : fim*/    
  -- FIM Procedure PR_Calc_Reserva_Nova_NP ------------------------------------------------------------------------



  ---*********************************************************************************************************--
  ---************************************* R E B**********************************************************--
  ---*********************************************************************************************************--

  PROCEDURE PR_Calc_Reserva_REB(inIDPessJur IN ELEGPATRO.IDPESSJUR%TYPE,
                                inIDPessoa  IN ELEGPATRO.IDPESSOA%TYPE,
                                inDataPgto  IN DATE,
                                inMatricula IN VARCHAR2,
                                inIDTitular IN DEPENTIT.IDTITULAR%TYPE    /*20491*/
                                ) IS
  
    vSQLReservas VARCHAR2(20000);
  
    vVLRSaldoCotaAcumulado NUMBER(18, 2);
    vNDiasMesAnterior      PLS_INTEGER;
    vFP2Atual              NUMBER(18, 2);
    vFP2Anterior           NUMBER(18, 2);
    vFP1Valor              NUMBER(18, 2);
    vPrimeiroMes           BOOLEAN := FALSE;
    vMesAnterior           VARCHAR(12);
    vPA                    NUMBER DEFAULT 0;
    vSomaValorCotas        NUMBER DEFAULT 0;
    vMesReferenciaAnt      DATE;
  
    --BRUNO AZEVEDO SOL 158860
    vDataDIB    DATE;
    vTotalCotas NUMBER DEFAULT 0;
    vFim        BOOLEAN := FALSE;
    vUltSaldo   NUMBER DEFAULT 0;
    vUltFP      NUMBER DEFAULT 0;
    vUltMes     DATE;
    --BRUNO AZEVEDO SOL 158860
  
    --BRUNO AZEVEDO SOL 167821
    vValorAntigo NUMBER(18, 2);
    --BRUNO AZEVEDO SOL 167821
  
    -- Prepara o CURSOR das reservas que serÃ£o processada no cÃ¡lculo para o NOVO PLANO
    TYPE cReservasREB_TYPE IS REF CURSOR;
  
    cReservasREB cReservasREB_TYPE;
  
    TYPE rReservasREB_TYPE IS RECORD(
      MESREFERENCIA DATE,
      VLRCOTAS      NUMBER);
  
    rReservasREB rReservasREB_TYPE;
  
  BEGIN
  
    vSQLReservas := ' select * from (SELECT HOIR.DTINICIO AS MESREFERENCIA, ' || --SIG 102889
                    '    SUM(DECODE(HS.FLGENTRADA, 1, round(HS.VLRCOTAS,10), -round(HS.VLRCOTAS,10))) AS VLRCOTAS   ' ||
                    'FROM ' || '  HISTMOVRESERVA HS, HISTOPIR HOIR  ' ||
                    'WHERE      ' ||
                    '    HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 59, 60, 61, 62, 117, 134, 170, 218)   ' || -- SIG 129414 - Inclusão do ID 218
                    'AND HS.IDPLANOPREV = 66   ' || 'AND HS.IDPESSOA = ' ||
                    vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    'AND HS.IDPESSJUR = ' || inIDPessJur ||
                    'AND HOIR.IDPESSOA = HS.IDPESSOA ' ||
                    'AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                    'AND HOIR.TIPOOPCAOIR = 2 ' ||
                    'AND HS.DATARECEBIMENTO < HOIR.DTINICIO ' ||
                    'GROUP BY HOIR.DTINICIO ' || ' UNION ALL   ' ||
                    'SELECT HS.DATARECEBIMENTO AS MESREFERENCIA, ' ||
                    '    SUM(DECODE(HS.FLGENTRADA, 1, round(HS.VLRCOTAS,10), -round(HS.VLRCOTAS,10))) AS VLRCOTAS   ' ||
                    'FROM ' || '  HISTMOVRESERVA HS, HISTOPIR HOIR  ' ||
                    'WHERE      ' ||
                    '    HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 59, 60, 61, 62, 117, 134, 170, 218)   ' || -- SIG 129414 - Inclusão do ID 218
                    'AND HS.IDPLANOPREV = 66   ' || 'AND HS.IDPESSOA = ' ||vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    'AND HS.IDPESSJUR = ' || inIDPessJur ||
                    'AND HOIR.IDPESSOA = HS.IDPESSOA ' ||
                    'AND HOIR.IDPLANPREV = HS.IDPLANOPREV ' ||
                    'AND HOIR.TIPOOPCAOIR = 2 ' ||
                    'AND HS.DATARECEBIMENTO >= HOIR.DTINICIO ' ||
                    'GROUP BY HS.DATARECEBIMENTO' ||
                   --PORTADAS
                    '      UNION ALL   ' ||
                   --'      SELECT DATARECEBIMENTO, '||
                    'SELECT to_date(DATARECEBIMENTO,''dd/mm/yyyy'') as DATARECEBIMENTO,' || --SIG 100613
                    '             VLRCOTAS ' || '       FROM (     ' ||
                    '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA,' ||
                    '                   H.MESREFERENCIA,' ||
                    '                   POR.DATAOPCAOIR,' ||
                    '                   H.VALORINDICE, ' ||
                   --'                   H.DATARECEBIMENTO AS DATARECEBIMENTO,'|| --SIG 100613
                    '                   ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || --SIG 100613
                    '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS' ||
                    '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H' ||
                    '                   WHERE POR.idpessoa = ' ||  vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '                     AND POR.idpessjur = ' || inIDPessJur ||
                    '                     AND POR.idplanoprev = 66 ' ||
                    '                     AND POR.opcaoir = ''R''  ' ||
                    '                     AND H.IDTIPORESERVA IN (117, 134) ' ||
                    '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE ' ||
                    '                     AND POR.IDPESSOA = HST.IDPESSOA ' ||
                    '                     AND POR.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HST.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HST.IDPLANOPREV = H.IDPLANOPREV ' ||
                    '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV ' ||
                    '                     AND POR.IDPLANOPREV = H.IDPLANOPREV ' ||
                    '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO ' ||
                    '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                    '                   GROUP BY H.IDTIPORESERVA, ' ||
                    '                            H.MESREFERENCIA, ' ||
                    '                            POR.DATAOPCAOIR, ' ||
                    '                            VALORINDICE ' ||
                    '                            ' ||
                    '                   ORDER BY mesreferencia)  ' ||
                   --PORTADAS (PROGRESSIVAS QUANDO O PARTICIPANTE Ã‰ REGRESSIVO)
                    '      UNION ALL   ' ||
                    '      SELECT DATAR AS DATARECEBIMENTO, ' ||
                    '             VLRCOTAS ' || '       FROM (     ' ||
                    '            SELECT H.IDTIPORESERVA AS TIPO_RESERVA, ' ||
                    '                   POR.DATAOPCAOIR, ' ||
                   --'                  -- H.VALORINDICE,  '||
                    '                   (CASE ' ||
                    '                     WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                      H.DATARECEBIMENTO ' ||
                    '                     ELSE ' ||
                    '                      HOIR.DTINICIO ' ||
                    '                   END) AS DATAR, ' ||
                    '                   SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS ' ||
                    '              FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, HISTOPIR HOIR ' ||
                    '                   WHERE POR.idpessoa =  ' || vIDPESSOA_TITULAR || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '                     AND POR.idpessjur =  ' || inIDPessJur ||
                    '                     AND POR.idplanoprev = 66  ' ||
                    '                     AND POR.opcaoir = ''P''   ' ||
                    '                     AND H.IDTIPORESERVA IN (117, 134)  ' ||
                    '                     AND HOIR.IDPESSOA = H.IDPESSOA ' ||
                    '                     AND HOIR.IDPLANPREV = H.IDPLANOPREV  ' ||
                    '                     AND HOIR.TIPOOPCAOIR = 2  ' ||
                    '                     AND HOIR.DTFIM IS NULL ' ||
                    '                     AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE  ' ||
                    '                     AND POR.IDPESSOA = HST.IDPESSOA  ' ||
                    '                     AND POR.IDPESSOA = H.IDPESSOA  ' ||
                    '                     AND HST.IDPESSOA = H.IDPESSOA  ' ||
                    '                     AND HST.IDPLANOPREV = H.IDPLANOPREV  ' ||
                    '                     AND POR.IDPLANOPREV = HST.IDPLANOPREV  ' ||
                    '                     AND POR.IDPLANOPREV = H.IDPLANOPREV  ' ||
                    '                     AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO  ' ||
                    '                     AND POR.IDPESSJUR = H.IDPESSJUR ' ||
                    '                   GROUP BY H.IDTIPORESERVA,  ' ||
                    '                            POR.DATAOPCAOIR,  ' ||
                    '                            (CASE ' ||
                    '                            WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                              H.DATARECEBIMENTO ' ||
                    '                            ELSE ' ||
                    '                              HOIR.DTINICIO ' ||
                    '                            END) ' ||
                    '                   ORDER BY (CASE ' ||
                    '                            WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN ' ||
                    '                              H.DATARECEBIMENTO ' ||
                    '                            ELSE ' ||
                    '                              HOIR.DTINICIO ' ||
                    '                            END))  ' ||
                    '            )order by 1'; --SIG 102889
  
    vFP2Anterior := 0;
  
    --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    BEGIN
      -- INICIO OTACILIO SOL 191248 KINTANA 1812352
      SELECT TMP.DATAINICIOFUND
        INTO vDataDIB
        FROM (SELECT IDSITBENEFICIO, DATAINICIOFUND
                FROM BENEFBFCIARIO
              --  INTO VDATADIB FROM BENEFBFCIARIO
               WHERE IDPESSOA = inIDPESSOA
                 AND IDPLANOPREV = 66
                 AND IDSITBENEFICIO IN (1, 3) -- ALTERAÃ‡ÃƒO ROBETA 11/11/2014 SOL 229803
                 AND FONTEPAGADORA = 1 -- GETIF: SOL184950.10663 KINTANA 1739136
               ORDER BY IDSITBENEFICIO) TMP
       WHERE ROWNUM <= 1;
      -- FIM OTACILIO SOL 191248 KINTANA 1812352
    EXCEPTION
      WHEN OTHERS THEN
        vDataDIB := SYSDATE;
    END;
    --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
  
    --dbms_output.put_line(vSQLReservas);
    OPEN cReservasREB FOR vSQLReservas;
  
    LOOP
    
      FETCH cReservasREB
        INTO rReservasREB;
    
      --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
      IF (cReservasREB%NOTFOUND) THEN
        IF (vDataDIB < rReservasREB.MESREFERENCIA) THEN
            /*20491 : inicio*/
            PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                              inIDPessoa, 66,
                              vSomaValorCotas,
                              vFP2Atual,
                              (vFP2Atual / vSomaValorCotas),
                              0,
                              vTotalCotas);

            /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(vDataDIB,'MM/YYYY'),inIDPessoa,66,vSomaValorCotas,vFP2Atual,(vFP2Atual/vSomaValorCotas),0,vTotalCotas);
            */  
            /*20491 : fim*/
        
        ELSE
          --vNDiasMesAnterior := TO_DATE(vDataDIB, 'DD/MM/YYYY') -
          --vMesReferenciaAnt; Rafael Vasconcelos SIG 101474
          vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                       'DD/MM/YYYY') - vMesReferenciaAnt;
          --POSITIVO
          IF (vTotalCotas >= 0) THEN
            vFP2Atual    := (vFP2Atual +
                            ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior + 0)) / 365);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (vTotalCotas < 0) THEN
            vFP2Atual    := (vFP2Atual +
                            (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                            (1 + 0 / vVLRSaldoCotaAcumulado);
            vFP2Anterior := vFP2Atual;
          END IF;
          
          /*20491 : inicio*/
           PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                             inIDPessoa, 66,
                             vSomaValorCotas,
                             vFP2Atual,
                             (vFP2Atual / vSomaValorCotas),
                             0,
                             0);

             /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(vDataDIB,'MM/YYYY'),inIDPessoa,66,vSomaValorCotas,vFP2Atual,(vFP2Atual/vSomaValorCotas),0,0);
             */ 
          /*20491 : fim*/
          
        END IF;
      END IF;
      --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    
      EXIT WHEN cReservasREB%NOTFOUND;
    
      vPA := 0;
    
      IF rReservasREB.MESREFERENCIA IS NOT NULL THEN
        IF (NOT vPrimeiroMes) THEN
          vPrimeiroMes := TRUE;
        
          --BRUNO AZEVEDO SOL 167821
          BEGIN
            SELECT SUM(DECODE(HI.FLGENTRADA, 1, HI.VLRCOTAS, -HI.VLRCOTAS))
              INTO vValorAntigo
              FROM HISTMOVRESERVA HI
             WHERE HI.IDPESSOA = inIDPessoa
               AND HI.DATARECEBIMENTO IS NOT NULL
               -- AND HI.IDTIPORESERVA IN (100, 101)                                           -- SIG 129414 - Inclusão do ID 218
         AND HI.IDTIPORESERVA IN (51, 52, 53, 55, 167, 59, 60, 61, 62, 117, 134, 170, 218)    -- SIG 129414 - Inclusão do ID 218
               AND HI.DATARECEBIMENTO <= rReservasREB.MESREFERENCIA
               AND HI.IDPLANOPREV = 66;
          EXCEPTION
            WHEN OTHERS THEN
              vValorAntigo := 0;
          END;
        
          IF (vValorAntigo > 0) THEN
            vVLRSaldoCotaAcumulado := vValorAntigo;
          ELSE
            vVLRSaldoCotaAcumulado := rReservasREB.VLRCOTAS;
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          vNDiasMesAnterior := 1;
          vFP1Valor         := ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior) / 365);
          vFP2Anterior      := vFP2Anterior + vFP1Valor;
          vNDiasMesAnterior := substr(last_day(rReservasREB.MESREFERENCIA),
                                      1,
                                      2);
          --vMesReferenciaAnt := TO_DATE(rReservasREB.MESREFERENCIA,
          --'DD/MM/YYYY'); Rafael Vasconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
          vFP2Atual         := vFP1Valor;
        
          --BRUNO AZEVEDO SOL 167821
        
          IF (vValorAntigo > 0) THEN
            vSomaValorCotas := vSomaValorCotas + vValorAntigo;
          ELSE
            vSomaValorCotas := vSomaValorCotas + abs(rReservasREB.VLRCOTAS);
          END IF;
        
          --BRUNO AZEVEDO SOL 167821
        
          vTotalCotas := vSomaValorCotas;
        
          --BRUNO AZEVEDO
          vPA := vFP1Valor;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP1Valor / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               vValorAntigo);

              /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),inIDPessoa,66,vSomaValorCotas,vFP1Valor,VPa,0,rReservasREB.VLRCOTAS);
              */
             /*20491 : fim*/
          
          ELSE
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               rReservasREB.VLRCOTAS);

              /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),inIDPessoa,66,vSomaValorCotas,vFP1Valor,VPa,0,rReservasREB.VLRCOTAS);
              */
             /*20491 : fim*/
          
          END IF;
          --BRUNO AZEVEDO SOL 167821
        ELSE
          --IF (TO_DATE(to_char(rReservasREB.MESREFERENCIA,'dd/mm/yyyy'), 'DD/MM/YYYY') <>
          --vMesReferenciaAnt) RAfael Vasconcelos SIG 101474
          IF (TO_DATE(to_char(rReservasREB.MESREFERENCIA, 'dd/mm/yyyy'),
                      'DD/MM/YYYY') <> vMesReferenciaAnt) THEN
            vNDiasMesAnterior := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                                 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vMesReferenciaAnt;
            IF (vFim = FALSE) THEN
              vUltMes := vMesReferenciaAnt;
            END IF;
          END IF;
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          --POSITIVO
          IF (rReservasREB.VLRCOTAS >= 0) THEN
            vFP2Atual := (vFP2Anterior +
                         ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior +
                         rReservasREB.VLRCOTAS)) / 365);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (rReservasREB.VLRCOTAS < 0) THEN
            vFP2Atual := (vFP2Anterior +
                         (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                         (1 +
                         rReservasREB.VLRCOTAS / vVLRSaldoCotaAcumulado);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
          IF (vFim = FALSE) THEN
            vUltSaldo := vVLRSaldoCotaAcumulado;
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        
          vVLRSaldoCotaAcumulado := vVLRSaldoCotaAcumulado +
                                    rReservasREB.VLRCOTAS;
        
          --vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,'dd/mm/yyyy'),
          --'DD/MM/YYYY'); Rafael VAsconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
        
          vSomaValorCotas := vSomaValorCotas + rReservasREB.VLRCOTAS;
          --BRUNO AZEVEDO
          VpA := vFP2Atual;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP2Atual / vSomaValorCotas);
          END IF;
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          IF (rReservasREB.MESREFERENCIA < vDataDIB) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP2Atual,
                               VPa,
                               0,
                               rReservasREB.VLRCOTAS);

              /*INSERT INTO HSTCALCULOPMP
              (IDHSTCALCULOPMP,MESREFERENCIA,IDPESSOA,IDPLANOPREV,SALDOACUMULADO, FATORPERMANENCIA,PRAZOMEDIOPONDERADO,VLRCOTA,QTDCOTA)VALUES
              (SEQPRAZOMEDIOPONDERADO.NEXTVAL,TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),inIDPessoa,66,vSomaValorCotas,vFP2Atual,VPa,0,rReservasREB.VLRCOTAS);
              */
             /*20491 : fim*/

            vTotalCotas := 0;
          ELSE
            IF (vFim = FALSE) THEN
              vFim := TRUE;
            END IF;
          
            --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            vTotalCotas := vTotalCotas + rReservasREB.VLRCOTAS;
          
            --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            --vNDiasMesAnterior := TO_DATE(to_char(vDataDIB,'dd/mm/yyyy'), 'DD/MM/YYYY') - vUltMes; SIG 101474
          
            vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vUltMes;
          
            --POSITIVO
            IF (vTotalCotas >= 0) THEN
              vFP2Atual    := (vUltFP +
                              ((vUltSaldo * nvl(vNDiasMesAnterior, 0) +
                              vTotalCotas)) / 365);
              vFP2Anterior := vFP2Atual;
            END IF;
          
            --NEGATIVO
            --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
            IF (vTotalCotas < 0) THEN
              vFP2Atual    := (vUltFP +
                              (vUltSaldo * vNDiasMesAnterior / 365)) *
                              (1 + vTotalCotas / vUltSaldo);
              vFP2Anterior := vFP2Atual;
            END IF;
          
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        END IF;
      END IF;
    
    END LOOP;
  
    CLOSE cReservasREB;
  
  END;
  -- FIM Procedure PR_Calc_Reserva_REB -----------------------------------------------------------------------


   /*WO9102 : inicio*/  
  PROCEDURE PR_Calc_Reserva_Nova_REB(inIDPessJur IN ELEGPATRO.IDPESSJUR%TYPE,
                                     inIDPessoa  IN ELEGPATRO.IDPESSOA%TYPE,
                                     inDataPgto  IN DATE,
                                     inMatricula IN VARCHAR2,
                                     inIDTitular IN DEPENTIT.IDTITULAR%TYPE,    /*20491*/
                                     inTipoCalculo IN PLS_INTEGER DEFAULT 2     /*WO9102*/                        
                                   ) IS
  
    vSQLReservas VARCHAR2(20000);
  
    vVLRSaldoCotaAcumulado NUMBER(18, 2);
    vNDiasMesAnterior      PLS_INTEGER;
    vFP2Atual              NUMBER(18, 2);
    vFP2Anterior           NUMBER(18, 2);
    vFP1Valor              NUMBER(18, 2);
    vPrimeiroMes           BOOLEAN := FALSE;
    vMesAnterior           VARCHAR(12);
    vPA                    NUMBER DEFAULT 0;
    vSomaValorCotas        NUMBER DEFAULT 0;
    vMesReferenciaAnt      DATE;
  
    --BRUNO AZEVEDO SOL 158860
    vDataDIB    DATE;
    vTotalCotas NUMBER DEFAULT 0;
    vFim        BOOLEAN := FALSE;
    vUltSaldo   NUMBER DEFAULT 0;
    vUltFP      NUMBER DEFAULT 0;
    vUltMes     DATE;
    --BRUNO AZEVEDO SOL 158860
  
    --BRUNO AZEVEDO SOL 167821
    vValorAntigo NUMBER(18, 2);
    --BRUNO AZEVEDO SOL 167821
  
    vNumReg  NUMBER DEFAULT 0;    /*WO9102*/
  
    -- Prepara o CURSOR das reservas que serÃ£o processada no cÃ¡lculo para o NOVO PLANO
    TYPE cReservasREB_TYPE IS REF CURSOR;
  
    cReservasREB cReservasREB_TYPE;
  
    TYPE rReservasREB_TYPE IS RECORD(
      MESREFERENCIA DATE,
      VLRCOTAS      NUMBER);
  
    rReservasREB rReservasREB_TYPE;
  
  BEGIN
  
    vsqlreservas := 'SELECT MESREFERENCIA, SUM(VLRCOTAS) VLRCOTAS FROM ( '||
                    '  SELECT HS.DATARECEBIMENTO AS MESREFERENCIA, ' || --SIG 102889
                    '         SUM(DECODE(HS.FLGENTRADA, 1, round(HS.VLRCOTAS,10), -round(HS.VLRCOTAS,10))) AS VLRCOTAS,  '||
                    '         0 AS TIPOCALCULO        ' ||  
                    '    FROM HISTMOVRESERVA HS '||
                    '    JOIN RESERVAXPLANO  RS '||
                    '      ON RS.IDTIPORESERVA = HS.IDTIPORESERVA '||
                    '     AND RS.IDPLANOPREV   = HS.IDPLANOPREV   '||
                    '   WHERE (RS.CODHIERARQUIA like ''11%''  '||
                    '      OR  RS.IDTIPORESERVA = 167         '||
                    '      OR  RS.IDTIPORESERVA = 218 )       '||
                    '     AND NVL(RS.FLGPORTABILIDADE, 0) = 0 ' ||
                    '     AND RS.ANALITICOSINTETI = ''A''     '||
                    '     AND HS.IDPLANOPREV   = 66           ' || 
                    '     AND HS.IDPESSOA      = ' || vidpessoa_titular || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '     AND HS.IDPESSJUR     = ' || inidpessjur ||
                    '   GROUP BY HS.DATARECEBIMENTO ' || 

                    '   UNION ALL   '||
                    '   SELECT HS.DATARECEBIMENTO AS MESREFERENCIA, '|| --SIG 102889
                    '          SUM(DECODE(HS.FLGENTRADA, 1, round(HS.VLRCOTAS,10), -round(HS.VLRCOTAS,10))) AS VLRCOTAS,  '||
                    '          0 AS TIPOCALCULO        ' ||   
                    '     FROM HISTMOVRESERVA HS '||
                    '     JOIN RESERVAXPLANO  RS '||
                    '       ON RS.IDTIPORESERVA = HS.IDTIPORESERVA '||
                    '      AND RS.IDPLANOPREV   = HS.IDPLANOPREV   '||
                    '    WHERE RS.CODHIERARQUIA like ''12%'' '||
                    '      AND RS.IDTIPORESERVA <> 167       '||
                    '      AND RS.ANALITICOSINTETI = ''A''   '||
                    '      AND HS.IDPLANOPREV   = 66   ' || 
                    '      AND HS.IDPESSOA      = ' || vidpessoa_titular || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '      AND HS.IDPESSJUR     = ' || inidpessjur ||
                    '    GROUP BY HS.DATARECEBIMENTO ' || 

                    --PORTADAS
                    '   UNION ALL   '||
                    '   SELECT TO_DATE(DATARECEBIMENTO,''dd/mm/yyyy'') as MESREFERENCIA,' || --SIG 100613
                    '          SUM(VLRCOTAS) AS VLRCOTAS, '||        
                    '          TIPOCALCULO ' ||   
                    '     FROM ( ' ||
                    '           SELECT H.IDTIPORESERVA AS TIPO_RESERVA,' ||
                    '                  H.MESREFERENCIA,' ||
                    '                  POR.DATAOPCAOIR,' ||
                    '                  H.VALORINDICE, ' ||
                    '                  ''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(h.mesreferencia,1,4) AS DATARECEBIMENTO,' || --SIG 100613
                    '                  SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, H.VLRCOTAS)) AS VLRCOTAS,' ||
                    '                 (select nvl(flgregressiva, 0) from reservaxplano r where r.idtiporeserva = h.idtiporeserva and h.idplanoprev = r.idplanoprev) as tipocalculo '|| --Roberta                    
                    '             FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, CONTRIBUICAO CON ' ||
                    '            WHERE POR.idpessoa    = ' || vidpessoa_titular || -- inIDPessoa OTACILIO KINTANA 1501823 SOL 167930
                    '              AND POR.idpessjur   = ' || inidpessjur ||
                    '              AND POR.idplanoprev = 66 ' ||
                    '              AND H.IDTIPORESERVA IN (select idtiporeserva '||
                    '                                        from reservaxplano '||
                    '                                       where flgportabilidade = 1) ' ||
                    --'              AND (POR.TIPO = ''A'' OR (POR.TIPO is null AND CON.tipoportabilidade = ''A'') ) '||
                    --'              AND (POR.OPCAOIR = ''R'' OR '||
                    --'                  (POR.OPCAOIR = ''P'' AND POR.DATARECEBIMENTO <= TO_DATE('||v_data_corte_opcaoir||', ''DD/MM/YYYY'') ))' ||
                    '              AND HST.IDPESSOA        = H.IDPESSOA    ' ||
                    '              AND HST.IDPLANOPREV     = H.IDPLANOPREV ' ||
                    '              AND HST.NUMRECEBIMENTO  = H.NUMRECEBIMENTO ' ||
                    '              AND CON.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO    ' ||
                    '              AND POR.IDPORTABILIDADE = HST.IDPORTABILIDADE ' ||
                    '              AND POR.IDPLANOPREV     = HST.IDPLANOPREV     ' ||
                    '              AND POR.IDPESSOA        = HST.IDPESSOA ' ||
                    '              AND POR.IDPESSOA    = H.IDPESSOA    ' ||
                    '              AND POR.IDPLANOPREV = H.IDPLANOPREV ' ||
                    '              AND POR.IDPESSJUR   = H.IDPESSJUR   ' ||
                    '            GROUP BY H.IDTIPORESERVA, ' ||
                    '                     H.MESREFERENCIA, ' ||
                    '                     POR.DATAOPCAOIR, ' ||
                    '                     VALORINDICE,      ' ||
                    '                     h.idplanoprev '|| --Roberta
                    '            ORDER BY MESREFERENCIA)   ' ||
                    '      group by to_date(DATARECEBIMENTO, ''dd/mm/yyyy'') ,TIPOCALCULO ) ' ||                    
                    --'            ) order by 1 ' ||  --SIG 102889  
                    ' WHERE 1 = 1 ';     /*WO9102*/ 

      /*WO9102 : inicio*/
      IF inTipoCalculo <> 2 then
         vSQLReservas := vSQLReservas || '  AND TIPOCALCULO = '||inTipoCalculo;      
      END IF;
      /*WO9102 : fim*/

      vSQLReservas := vSQLReservas || 
                      ' GROUP BY MESREFERENCIA ' ||
                      ' ORDER BY 1 ';  --SIG 102889  
  
      log_consulta('PR_CALC_PMP Consulta Reserva REB', vSQLReservas);  
  
  
    vFP2Anterior := 0;
  
    --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    BEGIN
      -- INICIO OTACILIO SOL 191248 KINTANA 1812352
      SELECT TMP.DATAINICIOFUND
        INTO vDataDIB
        FROM (SELECT IDSITBENEFICIO, DATAINICIOFUND
                FROM BENEFBFCIARIO
              --  INTO VDATADIB FROM BENEFBFCIARIO
               WHERE IDPESSOA = inIDPESSOA
                 AND IDPLANOPREV = 66
                 AND IDSITBENEFICIO IN (1, 3) -- ALTERAÃ‡ÃƒO ROBETA 11/11/2014 SOL 229803
                 AND FONTEPAGADORA = 1 -- GETIF: SOL184950.10663 KINTANA 1739136
               ORDER BY IDSITBENEFICIO) TMP
       WHERE ROWNUM <= 1;
      -- FIM OTACILIO SOL 191248 KINTANA 1812352
    EXCEPTION
      WHEN OTHERS THEN
        vDataDIB := SYSDATE;
    END;
    --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
  
    --dbms_output.put_line(vSQLReservas);
    OPEN cReservasREB FOR vSQLReservas;
  
    LOOP
    
      FETCH cReservasREB
        INTO rReservasREB;
    
      --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
      IF (cReservasREB%NOTFOUND) and (vNumReg > 1) THEN     /*WO9102*/      

        IF (vDataDIB < rReservasREB.MESREFERENCIA) THEN
            /*20491 : inicio*/
            PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                              inIDPessoa, 66,
                              vSomaValorCotas,
                              vFP2Atual,
                              (vFP2Atual / vSomaValorCotas),
                              0,
                              vTotalCotas);
            /*20491 : fim*/
        
        ELSE
          --vNDiasMesAnterior := TO_DATE(vDataDIB, 'DD/MM/YYYY') -
          --vMesReferenciaAnt; Rafael Vasconcelos SIG 101474
          vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                       'DD/MM/YYYY') - vMesReferenciaAnt;
          --POSITIVO
          IF (vTotalCotas >= 0) THEN
            vFP2Atual    := (vFP2Atual +
                            ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior + 0)) / 365);
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (vTotalCotas < 0) THEN
            vFP2Atual    := (vFP2Atual +
                            (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                            (1 + 0 / vVLRSaldoCotaAcumulado);
            vFP2Anterior := vFP2Atual;
          END IF;
          
          /*20491 : inicio*/
           PR_GravaHistorico(TO_CHAR(vDataDIB,'MM/YYYY'),
                             inIDPessoa, 66,
                             vSomaValorCotas,
                             vFP2Atual,
                             (vFP2Atual / vSomaValorCotas),
                             0,
                             0);
          /*20491 : fim*/
          
        END IF;
      END IF;
      --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
    
      EXIT WHEN cReservasREB%NOTFOUND;

      vNumReg := vNumReg + 1;    /*WO9102*/
    
      vPA := 0;
    
      IF rReservasREB.MESREFERENCIA IS NOT NULL THEN
        IF (NOT vPrimeiroMes) THEN
          vPrimeiroMes := TRUE;
        
          --BRUNO AZEVEDO SOL 167821
          BEGIN
            SELECT SUM(DECODE(HI.FLGENTRADA, 1, HI.VLRCOTAS, -HI.VLRCOTAS))
              INTO vValorAntigo
              FROM HISTMOVRESERVA HI
             WHERE HI.IDPESSOA = inIDPessoa
               AND HI.DATARECEBIMENTO IS NOT NULL
               -- AND HI.IDTIPORESERVA IN (100, 101)                                           -- SIG 129414 - Inclusão do ID 218
         AND HI.IDTIPORESERVA IN (51, 52, 53, 55, 167, 59, 60, 61, 62, 117, 134, 170, 218)    -- SIG 129414 - Inclusão do ID 218
               AND HI.DATARECEBIMENTO <= rReservasREB.MESREFERENCIA
               AND HI.IDPLANOPREV = 66;
          EXCEPTION
            WHEN OTHERS THEN
              vValorAntigo := 0;
          END;
        
          IF (vValorAntigo > 0) THEN
            vVLRSaldoCotaAcumulado := vValorAntigo;
          ELSE
            vVLRSaldoCotaAcumulado := rReservasREB.VLRCOTAS;
          END IF;
          --BRUNO AZEVEDO SOL 167821
        
          vNDiasMesAnterior := 1;
          vFP1Valor         := ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior) / 365);
          vFP2Anterior      := vFP2Anterior + vFP1Valor;
          vNDiasMesAnterior := substr(last_day(rReservasREB.MESREFERENCIA),
                                      1,
                                      2);
          --vMesReferenciaAnt := TO_DATE(rReservasREB.MESREFERENCIA,
          --'DD/MM/YYYY'); Rafael Vasconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
          vFP2Atual         := vFP1Valor;
        
          --BRUNO AZEVEDO SOL 167821
        
          IF (vValorAntigo > 0) THEN
            vSomaValorCotas := vSomaValorCotas + vValorAntigo;
          ELSE
            vSomaValorCotas := vSomaValorCotas + abs(rReservasREB.VLRCOTAS);
          END IF;
        
          --BRUNO AZEVEDO SOL 167821
        
          vTotalCotas := vSomaValorCotas;
        
          --BRUNO AZEVEDO
          vPA := vFP1Valor;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP1Valor / vSomaValorCotas);
          END IF;
          --BRUNO AZEVEDO
        
          --BRUNO AZEVEDO SOL 167821
          IF (vValorAntigo > 0) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               vValorAntigo);
             /*20491 : fim*/
          
          ELSE
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP1Valor,
                               VPa,
                               0,
                               rReservasREB.VLRCOTAS);
             /*20491 : fim*/
          
          END IF;
          --BRUNO AZEVEDO SOL 167821
        ELSE
          --IF (TO_DATE(to_char(rReservasREB.MESREFERENCIA,'dd/mm/yyyy'), 'DD/MM/YYYY') <>
          --vMesReferenciaAnt) RAfael Vasconcelos SIG 101474
          IF (TO_DATE(to_char(rReservasREB.MESREFERENCIA, 'dd/mm/yyyy'),
                      'DD/MM/YYYY') <> vMesReferenciaAnt) THEN
            vNDiasMesAnterior := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                                 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vMesReferenciaAnt;
            IF (vFim = FALSE) THEN
              vUltMes := vMesReferenciaAnt;
            END IF;
          END IF;
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          --POSITIVO
          IF (rReservasREB.VLRCOTAS >= 0) THEN
            vFP2Atual := (vFP2Anterior +
                         ((vVLRSaldoCotaAcumulado * vNDiasMesAnterior +
                         rReservasREB.VLRCOTAS)) / 365);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
        
          --NEGATIVO
          --FÃ“RMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
          IF (rReservasREB.VLRCOTAS < 0) THEN
            vFP2Atual := (vFP2Anterior +
                         (vVLRSaldoCotaAcumulado * vNDiasMesAnterior / 365)) *
                         (1 +
                         rReservasREB.VLRCOTAS / vVLRSaldoCotaAcumulado);
            IF (vFim = FALSE) THEN
              vUltFP := vFP2Anterior;
            END IF;
            vFP2Anterior := vFP2Atual;
          END IF;
          IF (vFim = FALSE) THEN
            vUltSaldo := vVLRSaldoCotaAcumulado;
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        
          vVLRSaldoCotaAcumulado := vVLRSaldoCotaAcumulado +
                                    rReservasREB.VLRCOTAS;
        
          --vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,'dd/mm/yyyy'),
          --'DD/MM/YYYY'); Rafael VAsconcelos SIG 101474
          vMesReferenciaAnt := TO_DATE(to_char(rReservasREB.MESREFERENCIA,
                                               'dd/mm/yyyy'),
                                       'DD/MM/YYYY');
        
          vSomaValorCotas := vSomaValorCotas + rReservasREB.VLRCOTAS;
          --BRUNO AZEVEDO
          VpA := vFP2Atual;
          IF (vSomaValorCotas <> 0) THEN
            vPA := (vFP2Atual / vSomaValorCotas);
          END IF;
        
          --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
          IF (rReservasREB.MESREFERENCIA < vDataDIB) THEN
             /*20491 : inicio*/
             PR_GravaHistorico(TO_CHAR(rReservasREB.MESREFERENCIA,'MM/YYYY'),
                               inIDPessoa, 66,
                               vSomaValorCotas,
                               vFP2Atual,
                               VPa,
                               0,
                               rReservasREB.VLRCOTAS);
             /*20491 : fim*/

            vTotalCotas := 0;
          ELSE
            IF (vFim = FALSE) THEN
              vFim := TRUE;
            END IF;
          
            --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            vTotalCotas := vTotalCotas + rReservasREB.VLRCOTAS;
          
            --INICIO BRUNO AZEVEDO SOL 158860 KINTANA 1374740
            --vNDiasMesAnterior := TO_DATE(to_char(vDataDIB,'dd/mm/yyyy'), 'DD/MM/YYYY') - vUltMes; SIG 101474
          
            vNDiasMesAnterior := TO_DATE(to_char(vDataDIB, 'dd/mm/yyyy'),
                                         'DD/MM/YYYY') - vUltMes;
          
            --POSITIVO
            IF (vTotalCotas >= 0) THEN
              vFP2Atual    := (vUltFP +
                              ((vUltSaldo * nvl(vNDiasMesAnterior, 0) +
                              vTotalCotas)) / 365);
              vFP2Anterior := vFP2Atual;
            END IF;
          
            --NEGATIVO
            --FORMULA = (fator de permanencia anterior + (saldo de cota anterior * prazo/365))*(1-quantidade cotas/saldo de cotas anterior).
            IF (vTotalCotas < 0) THEN
              vFP2Atual    := (vUltFP +
                              (vUltSaldo * vNDiasMesAnterior / 365)) *
                              (1 + vTotalCotas / vUltSaldo);
              vFP2Anterior := vFP2Atual;
            END IF;
          
          END IF;
          --FIM BRUNO AZEVEDO SOL 158860 KINTANA 1374740
        END IF;
      END IF;
    
    END LOOP;
  
    CLOSE cReservasREB;
   
  END;
  /*WO9102 : fim*/  
  -- FIM Procedure PR_Calc_Reserva_Nova_REB -----------------------------------------------------------------------





  -- Procedure PRINCIPAL: Realiza o calculo do prazo medio ponderado -----------------------------------------
  PROCEDURE PR_CALC_PMP(inIDPessJur  IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                        inIDPessoa   IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                        inListaBenef IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                        inREB        IN PLS_INTEGER DEFAULT 1,
                        inNOVOPLANO  IN PLS_INTEGER DEFAULT 1,
                        --                        inDataPrevista IN DATE DEFAULT NULL,
                        inTipoOpcaoIR   IN CHAR DEFAULT 'R',
                        inDataPagamento IN DATE DEFAULT SYSDATE,
                        inMatricula     IN VARCHAR2,
                        outERRO         OUT VARCHAR,
                        inIDTitular    IN DEPENTIT.IDTITULAR%TYPE DEFAULT -1,    /*20491*/
                        inTipoCalculo  IN PLS_INTEGER DEFAULT 2                  /*WO9102*/
                        ) IS
  
    -- Prepara o CURSOR das pessoas que serÃ£o processada no cÃ¡lculo
    cPessoasAProcessar cPessoasAProcessar_TYPE;
  
    TYPE rPessoasAProcessar_TYPE IS RECORD(
      IDPESSJUR   PLS_INTEGER,
      IDPESSOA    PLS_INTEGER,
      IDTITULAR   PLS_INTEGER, /*95333*/
      IDPLANOPREV PLS_INTEGER /*,
      INSCRICAODATA DATE*/);
  
    rPessoasAProcessar rPessoasAProcessar_TYPE;
  
    vSQLPessoas  VARCHAR2(2000);     /*20491*/           
      
    vCommitedBy PLS_INTEGER;
  
  BEGIN
    -- Modo Debug: 0 Desativado / 1 Ativado
    vFLGGravaLog := 0;     /* 10872*/
    
  
    outERRO     := 'OK';
    vErroInsert := 'OK';
    vCommitedBy := 0;
  
    vFLGTipoOpcaoIR := upper(inTipoOpcaoIR);
  
    BEGIN
      -- EXCEPTION
      
      /*SIG20491 : inicio*/
      vIDPESSOA_TITULAR := 0;
      
      IF inIDTitular > 0 THEN 
         vIDPESSOA_TITULAR := inIDTitular; 
      ELSE 
        /* 95333 : inicio */
        IF (inListaBenef IS NULL) OR (inListaBenef <= 0) THEN
          /*SIG 99421*/
          -- OTACILIO KINTANA 1501823 SOL 167930 INICIO
          /*CASO O IDPESSOA SEJA DE UM DEPENDENTE BUSCAR INFORMAÇÕES PELO TITULAR*/
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
              block_to_execute := block_to_execute || 'AND D.MATRICULA=' ||
                                  inMatricula || ';' || ' END;'; --Rafael Vasconcelos --SIG 29337
            ELSE
              block_to_execute := block_to_execute ||
                                  'AND D.MATRICULA IS NULL' || ';' ||
                                  ' END;';
            END IF;
          
            EXECUTE IMMEDIATE block_to_execute
              USING OUT vIDTITULAR_LOCAL, OUT vIDPESSOA_LOCAL;
          
            IF (vIDTITULAR_LOCAL <> vIDPESSOA_LOCAL) THEN
                vIDPESSOA_TITULAR := vIDTITULAR_LOCAL;
            END IF;
          END;
          -- OTACILIO KINTANA 1501823 SOL 167930 FIM
        END IF;  
      END IF;       

      vSQLPessoas := PCK_CTB_CALC_PRAZOACUMULACAO.FN_MontaQueryPessoasAProcessar(inIDPessJur,
                                                                                 inIDPessoa,
                                                                                 inListaBenef,
                                                                                 inREB,
                                                                                 inNOVOPLANO);
      log_consulta('PR_CALC_PMP Consulta Reserva', vSQLPessoas );
      
      OPEN cPessoasAProcessar FOR vSQLPessoas;
      /*SIG20491 : fim */    
        
      -- LOOP Principal <PESSOAS>
      LOOP
      
        FETCH cPessoasAProcessar
          INTO rPessoasAProcessar;
      
        EXIT WHEN cPessoasAProcessar%NOTFOUND;
      
        /*SIG20491 : inicio */    
        IF vIDPESSOA_TITULAR = 0 THEN
          vIDPESSOA_TITULAR := rPessoasAProcessar.IDTITULAR;
        END IF;
      
        vFlgDependente := PCK_CTB_CALC_PRAZOACUMULACAO.FN_VerificaTitularFalecido(vIDPESSOA_TITULAR, 
                                                                                  rPessoasAProcessar.IDPLANOPREV);    

        -- NOVO PLANO - Calculos -------------------------------
        IF (vFlgDependente = 1) AND (vIDPESSOA_TITULAR = rPessoasAProcessar.IDPESSOA) THEN
           DELETE FROM HSTCALCULOPMP
            WHERE IDPESSOA = rPessoasAProcessar.IDPESSOA
              AND IDPLANOPREV = rPessoasAProcessar.IDPLANOPREV;        
        ELSE
           DELETE FROM HSTCALCULOPMP
            WHERE IDPESSOA = rPessoasAProcessar.IDPESSOA
              AND IDPLANOPREV = rPessoasAProcessar.IDPLANOPREV
              AND IDTITULAR = vIDPESSOA_TITULAR;
        END IF;
        /*SIG20491 : fim */    

      
        IF (rPessoasAProcessar.IDPLANOPREV = 74) THEN        
          --PR_Calc_Reserva_NP(rPessoasAProcessar.IDPESSJUR,
          PR_Calc_Reserva_Nova_NP(rPessoasAProcessar.IDPESSJUR,
                                  rPessoasAProcessar.IDPESSOA,
                                  inDataPagamento,
                                  inMatricula,
                                  inIDTitular,             /*20491*/ 
                                  inTipoCalculo           /*WO9102*/
                                 );
        END IF;
        -- FIM Novo Plano --------------------------------------
      
        -- REB - Calculos --------------------------------------
      
        IF (rPessoasAProcessar.IDPLANOPREV = 66) THEN
          --PR_Calc_Reserva_REB(rPessoasAProcessar.IDPESSJUR,
          PR_Calc_Reserva_Nova_REB(rPessoasAProcessar.IDPESSJUR,
                                   rPessoasAProcessar.IDPESSOA,
                                   inDataPagamento,
                                   inMatricula,
                                   inIDTitular,             /*20491*/ 
                                   inTipoCalculo           /*WO9102*/
                                  );
        END IF;
        -- FIM REB ---------------------------------------------
      
        -- FIM CORPO DO PROCEDIMENTO PRINCIPAL --------------------------------------------------------
      
      END LOOP;
      -- FIM LOOP <PESSOAS>.
    
      CLOSE cPessoasAProcessar;
    
    EXCEPTION
      WHEN OTHERS THEN
        BEGIN
          CLOSE cPessoasAProcessar;
          outERRO := 'ERRO - PKG_PREV_CALC_PRAZOACUMULACAO: ' ||
                     to_char(SQLCODE) || ' - ' || SQLERRM;
          ROLLBACK; --Renato Visoni
        END;
    END;
  
    IF (vErroInsert <> 'OK') THEN
      outERRO := vErroInsert;
    ELSE
      COMMIT; --Renato Visoni
    END IF;
  
  END PR_CALC_PMP;
  -- FIM Procedure PRINCIPAL: Realiza o calculo do prazo medio ponderado --------------------------------------
END;