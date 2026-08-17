create or replace PROCEDURE CM.SP_FB_RETORNA_NATUREZA_REINF (PIDPLANOPREV   IN NUMBER,
                                               PIDPESSOA      IN NUMBER,
                                               PIDTITULAR     IN NUMBER,
                                               PIDRUBRICA     IN NUMBER,
                                               PIDBENEFICIO   IN NUMBER,
                                               PFONTEPAGADORA IN NUMBER,
                                               PDATAPAGAMENTO IN DATE,
                                               SCODNATUREZAREINF   OUT NUMBER) IS
                                               
  /********************************************************************************************************************
    =*= Histórico de Alterações =*=
    14/04/2026 15:30 - WO 36319  - Edilaine Ferraresi                               
                       Titulo:     Folha de Benefícios - Prévia da Folha de Benefícios
                       Descrição:  Identificamos erro no calculo de IR para a matricula 2507460 DENIO MELO MACAMBIRA. Na Folha 
                                   de fevereiro de 2026 a rubrica de Diferença de IR Total foi gerada com valor de 1777,30. 
                                   Ocorre que o valor correto seria de R$ 1.005,09. conforme evidenciado na planilha anexa
                       Alteração:  Foi implementado a busca da opção de IR para beneficiários
  ****************************************************************************************************************************/                                               
                                               
  I_TIPOOPCAOIRPROGRESSIVO INT;
  I_TIPOMODALIDADEBD       INT;
  FUNCTION IS_RESIDENTE_EXTERIOR(PIDPESSOA INT) RETURN BOOLEAN IS
    V_RES CHAR(1);
  BEGIN
    BEGIN
      SELECT PP.VALOR
        INTO V_RES
        FROM PESSOAPARAM PP
       WHERE PP.IDPARAM = 210
         AND (PDATAPAGAMENTO >= PP.DATAINICIO)
         AND (PP.DATAFIM IS NULL OR PP.DATAFIM >= PDATAPAGAMENTO)
         AND IDPESSOA = PIDPESSOA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_RES := 'N';
    END;
    RETURN(V_RES = 'S');
  END IS_RESIDENTE_EXTERIOR;
  FUNCTION IS_PLANOBD(PIDBENEFICIO INT, PIDPLANOPREV INT) RETURN INT IS
    V_RES CHAR(2);
  BEGIN
    BEGIN
      SELECT BP.TPMODALIDADE
        INTO V_RES
        FROM BENEFPLANPREV BP
       WHERE BP.IDBENEFICIO = PIDBENEFICIO
         AND BP.IDPLANOPREV = PIDPLANOPREV;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_RES := 'NA';
    END;
    IF V_RES = 'BD' THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END IS_PLANOBD;
  FUNCTION IS_REGIMEPROGRESSIVO(PIDTITULAR INT, PIDPLANOPREV INT)
    RETURN INT IS
    V_TIPOOPCAO NUMBER;
  BEGIN
    BEGIN
      SELECT DECODE(NVL(PPP.TIPOOPCAOIR, 1), 0, 1, NVL(PPP.TIPOOPCAOIR, 1))
        INTO V_TIPOOPCAO
        FROM PARTPREVPLAN PPP
       WHERE PPP.IDPESSOA = PIDTITULAR
         AND PPP.IDPLANOPREV = PIDPLANOPREV;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_TIPOOPCAO := 1;
    END;
    IF V_TIPOOPCAO = 1 THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END IS_REGIMEPROGRESSIVO;
  /*edilaine WO36319: inicio*/
  FUNCTION IS_REGIMEPROGRESSIVODEP(PIDTITULAR INT, PIDPESSOA INT, PIDPLANOPREV INT)
    RETURN INT IS
    V_TIPOOPCAO NUMBER;
  BEGIN
    BEGIN
      SELECT MAX(DECODE(BTT.TIPOOPCAOIR, 2, 2, 1))      
        INTO V_TIPOOPCAO
        FROM BFCIARIOTITPLAN BTT
       WHERE BTT.IDPESSOA    = PIDPESSOA
         AND BTT.IDTITULAR   = PIDTITULAR
         AND BTT.IDPLANOPREV = PIDPLANOPREV;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_TIPOOPCAO := 1;
    END;
    IF V_TIPOOPCAO = 1 THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END IS_REGIMEPROGRESSIVODEP;
  /*edilaine WO36319: fim*/     
  PROCEDURE RETORNA_NATUREZA_REINF(PIDRUBRICA INT, PPROGRESSIVO INT, PMODALIDADEBD INT) IS
  BEGIN
    BEGIN
      SELECT DECODE(PPROGRESSIVO,
              1,
              DECODE(PMODALIDADEBD,
                     1,
                     CODNATREINF_PROG_BD,
                     CODNATREINF_PROG_CD),
              DECODE(PMODALIDADEBD,
                     1,
                     CODNATREINF_REGR_BD,
                     NVL(CODNATREINF_REGR_CD,CODNATREINF_REGR_BD))) AS CODNATUREZA_REINF
        INTO SCODNATUREZAREINF
        FROM PROVDESC PD
       WHERE PD.IDPROVENTO = PIDRUBRICA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        SCODNATUREZAREINF := NULL;
    END;
  END RETORNA_NATUREZA_REINF;
  PROCEDURE RETORNANATUREZA_RESIDENTE_EXTERIOR(PIDRUBRICA INT) IS
  BEGIN
    BEGIN
      SELECT PD.CODNATREINF_EXTERIOR
        INTO SCODNATUREZAREINF
        FROM PROVDESC PD
       WHERE PD.IDPROVENTO = PIDRUBRICA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        SCODNATUREZAREINF := NULL;
    END;
  END RETORNANATUREZA_RESIDENTE_EXTERIOR;
BEGIN
  /*edilaine WO36319 : inicio*/
  IF pIDPESSOA <> pIDTITULAR THEN
     I_TIPOOPCAOIRPROGRESSIVO := IS_REGIMEPROGRESSIVODEP(PIDTITULAR, PIDPESSOA, PIDPLANOPREV);
  ELSE
     I_TIPOOPCAOIRPROGRESSIVO := IS_REGIMEPROGRESSIVO(PIDTITULAR, PIDPLANOPREV);
  END IF;
  /*edilaine WO36319 : inicio*/
  
  I_TIPOMODALIDADEBD       := IS_PLANOBD(PIDBENEFICIO, PIDPLANOPREV);
  --IF IS_RESIDENTE_EXTERIOR(PIDPESSOA) THEN          -- Andre Imakawa - WO5170
    --RETORNANATUREZA_RESIDENTE_EXTERIOR(PIDRUBRICA); -- Andre Imakawa - WO5170
  --ELSE                                              -- Andre Imakawa - WO5170
    IF PFONTEPAGADORA = 2 THEN
      /*Para fonte pagadora INSS consideramos sempre como progressivo*/
      RETORNA_NATUREZA_REINF(PIDRUBRICA, 1, I_TIPOMODALIDADEBD);
    ELSE
      RETORNA_NATUREZA_REINF(PIDRUBRICA, I_TIPOOPCAOIRPROGRESSIVO, I_TIPOMODALIDADEBD);
    END IF;
  --END IF;                                           -- Andre Imakawa - WO5170
END;