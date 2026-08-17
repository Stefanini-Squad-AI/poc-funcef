create or replace PROCEDURE  CM.SP_FB_RETORNA_DARF_INFORME (PIDPLANOPREV   IN NUMBER
                             ,PIDPESSOA      IN NUMBER
                             ,PIDTITULAR     IN NUMBER
                             ,PIDRUBRICA     IN NUMBER
                             ,PIDBENEFICIO   IN NUMBER
                             ,PFONTEPAGADORA IN NUMBER
                             ,PIDLOTE        IN NUMBER
                             ,PDATAPAGAMENTO IN DATE
                             ,SIDINFORME     OUT NUMBER
                             ,SCODIRRFDARF   OUT VARCHAR2) IS
  /********************************************************************************************************************
    =*= Histórico de Alterações =*=
    27/07/2017 15:45 - SIG 51448 - João Ricardo de Sousa Mello -
                       Título:     Reincidência SIG49055 - DARF / INFORME de IR
                       Descrição:  ## Identificamos que a Versão: 9.0.7.49 que entrou em produção hoje dia 24/07/2017 contendo
                                   os SIGs 48178, 49055 e 50426 esta apresentando erro no durante o processamento de Previa,
                                   conforme imagem em anexo. Diante disso, todos os processos judiciais, folha de benefícios,
                                   concessões, revisões, regaste, portabilidade, extra folha estão impossibilitados de serem
                                   executados. Solicitamos de forma TEMPESTIVA os ajustes que se fizerem necessários para que
                                   os processos de pagamento sejam restabelecidos.
                       Alteração:  Incremento do tamanho da variável V_RES para CHAR(2) e alteração do valor da variável para
                                   'NA' quando não forem recuperados dados na consulta.
    
    13/04/2026 15:30 - WO 36319  - Edilaine Ferraresi                               
                       Titulo:     Folha de Benefícios - Prévia da Folha de Benefícios
                       Descrição:  Identificamos erro no calculo de IR para a matricula 2507460 DENIO MELO MACAMBIRA. Na Folha 
                                   de fevereiro de 2026 a rubrica de Diferença de IR Total foi gerada com valor de 1777,30. 
                                   Ocorre que o valor correto seria de R$ 1.005,09. conforme evidenciado na planilha anexa
                       Alteração:  Foi implementado a busca da opção de IR para beneficiários
    ****************************************************************************************************************************/
  B_TIPOOPCAOIRPROGRESSIVO BOOLEAN;
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
  PROCEDURE RETORNADARF_RESIDENTE_EXTERIOR(PIDRUBRICA INT) IS
  BEGIN
    BEGIN
      SELECT PD.IDINFORMEEXTERIOR
          ,PD.CODIRRFDARFEXTERIOR
        INTO SIDINFORME
          ,SCODIRRFDARF
        FROM PROVDESC PD
       WHERE PD.IDPROVENTO = PIDRUBRICA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        SIDINFORME   := NULL;
        SCODIRRFDARF := NULL;
    END;
  END RETORNADARF_RESIDENTE_EXTERIOR;
  PROCEDURE RETORNADARF(PIDRUBRICA INT, PPROGRESSIVO INT) IS
  BEGIN
    BEGIN
      SELECT DECODE(PPROGRESSIVO, 1, PD.IDINFORME, PD.IDINFORMEREG) AS IDINFORME
          ,DECODE(PPROGRESSIVO, 1, PD.CODIRRFDARF, PD.CODIRRFDARFREG) AS CODIRRFDARF
        INTO SIDINFORME
          ,SCODIRRFDARF
        FROM PROVDESC PD
       WHERE PD.IDPROVENTO = PIDRUBRICA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        SIDINFORME   := NULL;
        SCODIRRFDARF := NULL;
    END;
  END RETORNADARF;
  PROCEDURE RETORNADARF_PLANOBD(PIDRUBRICA INT) IS
  BEGIN
    BEGIN
      SELECT PD.IDINFORMEREGBD
          ,PD.CODIRRFDARFREGBD
        INTO SIDINFORME
          ,SCODIRRFDARF
        FROM PROVDESC PD
       WHERE PD.IDPROVENTO = PIDRUBRICA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        SIDINFORME   := NULL;
        SCODIRRFDARF := NULL;
    END;
  END RETORNADARF_PLANOBD;
  FUNCTION IS_PLANOBD(PIDBENEFICIO INT, PIDPLANOPREV INT) RETURN BOOLEAN IS
    V_RES CHAR(2); /*SIG 51448 - Apresenta erro no durante o processamento de Previa. ORA-06502: numeric or valuer error. Charactter string buffer too small.*/
  BEGIN
    BEGIN
      SELECT BP.TPMODALIDADE
        INTO V_RES
        FROM BENEFPLANPREV BP
       WHERE BP.IDBENEFICIO = PIDBENEFICIO
         AND BP.IDPLANOPREV = PIDPLANOPREV;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_RES := 'NA'; /*SIG 51448 - Apresenta erro no durante o processamento de Previa. ORA-06502: numeric or valuer error. Charactter string buffer too small.*/
    END;
    RETURN(V_RES = 'BD');
  END IS_PLANOBD;
  FUNCTION IS_RESGATE(PIDLOTE INT) RETURN NUMBER IS
    V_RES NUMBER;
  BEGIN
    BEGIN
      SELECT C.FLGRESGATE
        INTO V_RES
        FROM CTRLINTERFACE C
       WHERE ((C.FLGRESGATE = 1) OR (C.FLGRESGATEPARCELADO = 1))
         AND C.IDLOTE = PIDLOTE;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_RES := 0;
    END;
    RETURN(V_RES);
  END IS_RESGATE;
  FUNCTION IS_REGIMEPROGRESSIVO(PIDTITULAR INT, PIDPLANOPREV INT) RETURN BOOLEAN IS
    V_TIPOOPCAO NUMBER;
  BEGIN
    BEGIN
      SELECT DECODE(NVL(PPP.TIPOOPCAOIR, 1)
             ,0
             ,1
             ,NVL(PPP.TIPOOPCAOIR, 1))
        INTO V_TIPOOPCAO
        FROM PARTPREVPLAN PPP
       WHERE PPP.IDPESSOA = PIDTITULAR
         AND PPP.IDPLANOPREV = PIDPLANOPREV;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        V_TIPOOPCAO := 1;
    END;
    RETURN(V_TIPOOPCAO = 1);
  END IS_REGIMEPROGRESSIVO;
  /*edilaine WO36319: inicio*/
  FUNCTION IS_REGIMEPROGRESSIVODEP(PIDTITULAR INT, PIDPESSOA INT, PIDPLANOPREV INT) RETURN BOOLEAN IS
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
    RETURN(V_TIPOOPCAO = 1);
  END IS_REGIMEPROGRESSIVODEP;
  /*edilaine WO36319: fim*/  
BEGIN    
  /*edilaine WO36319 : inicio*/
  IF pIDPESSOA <> pIDTITULAR THEN
     B_TIPOOPCAOIRPROGRESSIVO := IS_REGIMEPROGRESSIVODEP(PIDTITULAR, PIDPESSOA, PIDPLANOPREV);
  ELSE
     B_TIPOOPCAOIRPROGRESSIVO := IS_REGIMEPROGRESSIVO(PIDTITULAR, PIDPLANOPREV);
  END IF;
  /*edilaine WO36319 : inicio*/
  
  IF IS_RESIDENTE_EXTERIOR(PIDPESSOA) THEN
    /*Caso seja residente no exterior utiliza 0473 para INSS e 9466 para Funcef
        e utiliza os valores parametrizado nos campos IDINFORMEEXTERIOR e CODIRRFDARFEXTERIOR*/
    RETORNADARF_RESIDENTE_EXTERIOR(PIDRUBRICA);
  ELSIF IS_RESGATE(PIDLOTE) = 1 THEN
    /*Para resgate não verificamos fonte pagadora*/
    IF IS_PLANOBD(PIDBENEFICIO, PIDPLANOPREV) THEN
      /*Caso seja modalidade BD utiliza os valores parametrizado nos
            campos IDINFORMEREGBD e CODIRRFDARFREGBD*/
      RETORNADARF_PLANOBD(PIDRUBRICA);
    ELSE
      /*Para folha de resgate modalidade CD verificamos a opção de ir*/
      IF B_TIPOOPCAOIRPROGRESSIVO THEN
        /*Para a opção progressiva utiliza os valores parametrizado nos
                campos IDINFORME e CODIRRFDARF*/
        RETORNADARF(PIDRUBRICA, 1);
      ELSE
        /*Para a opção regressiva utiliza os valores parametrizado nos
                campos IDINFORMEREG e CODIRRFDARFREG*/
        RETORNADARF(PIDRUBRICA, 0);
      END IF;
    END IF;
  ELSE
    /*Para Folha diferente de resgate verificamos a fonte pagadora*/
    IF PFONTEPAGADORA = 2 THEN
      /*Para fonte pagadora INSS consideramos sempre como progressivo*/
      RETORNADARF(PIDRUBRICA, 1);
    ELSE
      IF B_TIPOOPCAOIRPROGRESSIVO THEN
        /*Para a opção progressiva utiliza os valores parametrizado nos
                campos IDINFORME e CODIRRFDARF*/
        RETORNADARF(PIDRUBRICA, 1);
      ELSE
        /*Para a opção regressiva utiliza os valores parametrizado nos
                campos IDINFORMEREG e CODIRRFDARFREG*/
        RETORNADARF(PIDRUBRICA, 0);
      END IF;
    END IF;
  END IF;
END;