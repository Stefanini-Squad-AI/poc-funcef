object dtmPreparaContrib: TdtmPreparaContrib
  OldCreateOrder = True
  Left = 93
  Top = 44
  Height = 479
  Width = 741
  object qryContribPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TP.QTDEMESES,                CP.ULTMESPREPARO,           ' +
        ' CP.IDPESSOA,'
      
        '       CP.IDPESSOA AS IDPESSJUR,    CP.IDPLANOPREV,             ' +
        ' CP.IDCONTRIBUICAO,'
      
        '       CP.UNIDNEGOC,                CP.TIPCODIGO,               ' +
        ' CP.CODCENTRORESPON,'
      
        '       CP.IDEMPRESA,                CP.IDEMPRESAPROP,           ' +
        ' CP.PLANO,'
      
        '       CP.CODSUBCONTA,              CP.PLACONTAC,               ' +
        ' CP.CODPORTFORMA,'
      
        '       CP.PLACONTAD,                CP.CODCENTROCUSTOC,         ' +
        ' CP.CODCENTROCUSTOD,'
      
        '       CP.DIAVENCIMENTO,            CP.VALORBASE1,              ' +
        ' CP.VALORBASE2,'
      
        '       CP.VALORBASE3,               DATAINICIO,                 ' +
        ' DATAFINAL,'
      '       C.IDREGRACALCULO,            C.FLGACEITAOPCAO,'
      
        '       C.NUMOPCOES ,                CONT.NOME AS CONTRIBUICAO,  ' +
        ' -1 AS NUMRECEBIMENTO,'
      
        '       C.IDREGRAPRIMPAGTO,          C.IDREGRAULTPAGTO,          ' +
        ' '#39'PT'#39' AS FLGINTERNO,'
      '       0 AS FLGDESCFOLHA,                    1 AS SEQPROPOSTA,'
      
        '       CP.QTDEPARCELAS,             '#39'Patrocinadora'#39' AS MATRICULA' +
        ', SYSDATE AS DATAADMISSAO,'
      
        '       C.IDREGRACALCULO13,          C.FLGNAOEXIGEREC,           ' +
        ' - 1 AS NUMRECEBIMENTO,'
      '       TO_CHAR(SYSDATE,'#39'dd/mm/yyyy'#39') AS INSCRICAODATA,'
      '       TO_CHAR(SYSDATE,'#39'dd/mm/yyyy'#39') AS DATANASC,'
      
        '       C.FLGCOBRADECTERC,           C.IDCONTRIBPAI,             ' +
        ' C.IDCONTRIBPAI2,'
      '       C.IDCONTRIBPAI3  , C.FLGPARCELAMENTO'
      
        'FROM   PLANPREV PL, CONTPREV C, CONTRIBUICAO  CONT, CONTRIBPREVP' +
        'ATRO CP,  TPPERIODICIDADE TP,'
      
        '       PATRO PT, CONTPREVEVENTO CPE, EVENTOGERADOR EG, PLANPREVP' +
        'ATRO PLP'
      'WHERE  (CP.IDPESSOA       = :piIdPessJur)'
      'AND    ((CP.ULTMESPREPARO  < :psMesCobranca ) OR'
      '        (CP.ULTMESPREPARO IS NULL) )'
      'AND    (CP.FLGCOBRA       = 1)'
      'AND    (C.FLGCONTINGENCIA = 0 )'
      'AND    (CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) )'
      'AND    (CP.IDPLANOPREV       = C.IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      'AND    (C.IDCONTRIBUICAO     = CONT.IDCONTRIBUICAO)'
      'AND    (C.IDPLANOPREV        = PL.IDPLANOPREV)'
      'AND    (CP.IDPESSOA          = PT.IDPESSOA)'
      'AND    (CP.IDPESSOA          = PLP.IDPESSJUR)'
      'AND    (CP.IDPLANOPREV       = PLP.IDPLANOPREV)'
      'AND    (C.IDPLANOPREV        = CPE.IDPLANOPREV)'
      'AND    (C.IDCONTRIBUICAO     = CPE.IDCONTRIBUICAO)'
      'AND    (CPE.IDEVENTOGERADOR  = EG.IDEVENTOGERADOR)'
      
        'AND    ((EG.FLGINTERNO       = '#39'MA'#39') OR (EG.FLGINTERNO = '#39'DM'#39') O' +
        'R'
      '        (EG.FLGINTERNO       = '#39'AF'#39') OR (EG.FLGINTERNO ='#39'PD'#39')  )'
      ' ')
    ValidateWithMask = True
    Left = 215
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end>
  end
  object qryNCalcAtivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBU' +
        'ICAO, CP.PLACONTAD,'
      
        '        CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESA' +
        'PROP, CP.PLACONTAC,'
      
        '        CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP' +
        '.CODCENTROCUSTOC,'
      
        '        CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFO' +
        'LHA, CP.VALORBASE1,'
      '        CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,'
      '        CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,'
      
        '        CP.DATAINICIO,CP.DATAFINAL,   CP.ULTMESPREPARO,  ST.FLGI' +
        'NTERNO,'
      '        CP.ULTANO13,  EL.DATAADMISSAO, '
      '        C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,'
      
        '        CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,       ' +
        ' EL.IDSITFUNC, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P' +
        '.NUMDOCUMENTO, PF.DATAMORTE,'
      '        PP.SALPARTICIPACAO,'
      '        PP.SALPARTICIPACAO  AS  VALORPROVENTO,'
      '        PP.SALPARTICIPACAO  AS  VALORREMTOTAL, PP.SALPARTIC13, '
      '        PP.INSCRICAODATA, PP.DTINICIOINSC,'
      
        '        C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,'#39'dd' +
        '/mm/yyyy'#39') AS DATAREF,'
      '        CP.SEQPROPOSTA, 0 AS RUBPARCIAL, EL.MATRICULA,'
      '        TP.QTDEMESES, PP.IDSITPART,'
      '        C.FLGNAOEXIGEREC ,   C.FLGCOBRA13DTFIM,'
      
        '       C.IDREGRAPRIMPGTO13, C.IDREGRAULTPGTO13, C.IDREGRACALCULO' +
        '13,'
      '       C.IDREGRAULTPGTO13, C.IDREGRAPRIMPGTO13'
      'FROM   PLANPREV PL,'
      '       TPPERIODICIDADE TP,'
      '       SITPART  ST,'
      '       CONTPREV C,'
      '       CONTRIBUICAO CONT,'
      '       PATRO PAT,'
      '       ELEGPATRO EL,'
      '       PLANPREVPATRO PLP,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       PESSOA P,'
      '       CONTRIBPREVPARTP CP'
      'WHERE  ST.FLGINTERNO      = :psSitFundacao    AND'
      '      PP.IDSITPART        = ST.IDSITPART      AND'
      '      PP.IDPESSJUR        = :piIdPessJur      AND'
      '      PP.IDPLANOPREV      = :piIdPlanoPrev    AND'
      '      PAT.IDPESSOA        = PP.IDPESSJUR      AND'
      '      PP.IDPESSJUR        = PLP.IDPESSJUR     AND'
      '      PP.IDPLANOPREV      = PLP.IDPLANOPREV   AND'
      '      CP.IDPESSOA         = PP.IDPESSOA       AND'
      '      CP.IDCONTRIBUICAO   = :piIdContribuicao AND'
      '      CP.SEQPROPOSTA      = PP.SEQPROPOSTA    AND'
      '      CP.IDPLANOPREV      = PP.IDPLANOPREV    AND'
      '      CP.IDPESSJUR        = PP.IDPESSJUR      AND'
      '     ( ( CP.ULTMESPREPARO    < :psMesCobranca) or'
      '       ( (TO_NUMBER(SUBSTR(:psMesCobranca,6,2)) = '#39'13'#39' ) and'
      '         (TO_CHAR(ULTANO13) < (SUBSTR(:psMesCobranca,1,4))  )'
      '       )'
      '     )  AND'
      '      CP.FLGCOBRA         = 1                 AND'
      
        '      ( CP.DIAVENCIMENTO >= :piDiaIni AND CP.DIAVENCIMENTO <= :p' +
        'iDiaFim) AND'
      
        '      ((CP.FLGDESCFOLHA = :piFlgDescFolha1) OR (CP.FLGDESCFOLHA ' +
        '= :piFlgDescFolha2))   AND'
      '     (((CP.FLGDESCFOLHA = 1) OR'
      '       (CP.FLGDESCFOLHA = 0)) )               AND'
      
        '      ((TO_CHAR(CP.DATAFINAL,'#39'YYYY/MM'#39') >= :psMesCobranca ) OR (' +
        'CP.DATAFINAL IS NULL)) AND'
      '      CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)  AND'
      '      P.IDPESSOA          = PP.IDPESSOA       AND'
      '      PF.IDPESSOA         = PP.IDPESSOA       AND'
      '      EL.IDPESSOA         = PP.IDPESSOA       AND'
      '      EL.IDPESSJUR        = PP.IDPESSJUR      AND'
      '      C.IDCONTRIBUICAO    = :piIdContribuicao AND'
      '      C.IDPLANOPREV       = PP.IDPLANOPREV    AND'
      '      CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO  AND'
      '      PL.IDPLANOPREV      = PP.IDPLANOPREV AND'
      
        '      (TO_CHAR(PP.INSCRICAODATA,'#39'YYYY/MM'#39') <= :psMesCobranca) AN' +
        'D'
      
        '      ((PP.DATACANCELAMENTO IS  NULL) OR (TO_CHAR(PP.DATACANCELA' +
        'MENTO,'#39'YYYY/MM'#39') >= :psMesCobranca))'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 201
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'psSitFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end>
  end
  object qryHSTCONTRIB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  NUMRECEBIMENTO ,  MESREFERENCIA ,    MESCOBRANCA ,'
      '        IDMOTIVO ,        IDPESSJUR ,        IDPESSOA ,'
      '        IDPLANOPREV ,     IDCONTRIBUICAO ,   IDREGRACALCULO ,'
      '        CODPORTFORMA ,    DATAPREVISAORECE , VALORESPERADO ,'
      '        FLGCALCRESERVA ,  VALORCALCULADO ,   VALOROP1 ,'
      '        VALOROP2 ,        VALOROP3 ,         FLGDESCFOLHA ,'
      '        DATAINICIO ,      DATAFINAL ,        '
      '        FLGSITFUNDACAO ,  SITRECEBIMENTO ,   TIPO ,'
      '        PARCELA ,         SEQPROPOSTA ,      IDLOTE,'
      '        VALORRECEBIDO,    DATARECEBIMENTO'
      'FROM    HSTCONTRIBPREV'
      'WHERE HSTCONTRIBPREV.NUMRECEBIMENTO = -1')
    UpdateObject = updHSTCONTRIB
    ValidateWithMask = True
    Left = 33
    Top = 193
  end
  object updHSTCONTRIB: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  DATAPREVISAORECE = :DATAPREVISAORECE,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  FLGCALCRESERVA = :FLGCALCRESERVA,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  FLGSITFUNDACAO = :FLGSITFUNDACAO,'
      '  SITRECEBIMENTO = :SITRECEBIMENTO,'
      '  TIPO = :TIPO,'
      '  PARCELA = :PARCELA,'
      '  IDLOTE = :IDLOTE,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBPREV'
      '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, '
      'IDPESSJUR, IDPESSOA, '
      '   IDPLANOPREV, IDCONTRIBUICAO, IDREGRACALCULO, CODPORTFORMA, '
      'DATAPREVISAORECE, '
      '   VALORESPERADO, FLGCALCRESERVA, VALORCALCULADO, VALOROP1, '
      'VALOROP2, VALOROP3, '
      '   FLGDESCFOLHA, DATAINICIO, DATAFINAL,  '
      'FLGSITFUNDACAO, '
      '   SITRECEBIMENTO, TIPO, PARCELA, SEQPROPOSTA, IDLOTE, '
      'VALORRECEBIDO, DATARECEBIMENTO)'
      'values'
      '  (:NUMRECEBIMENTO, :MESREFERENCIA, :MESCOBRANCA, :IDMOTIVO, '
      ':IDPESSJUR, '
      '   :IDPESSOA, :IDPLANOPREV, :IDCONTRIBUICAO, :IDREGRACALCULO, '
      ':CODPORTFORMA, '
      '   :DATAPREVISAORECE, :VALORESPERADO, :FLGCALCRESERVA, '
      ':VALORCALCULADO, '
      '   :VALOROP1, :VALOROP2, :VALOROP3, :FLGDESCFOLHA, :DATAINICIO, '
      ':DATAFINAL, '
      '   :FLGSITFUNDACAO, :SITRECEBIMENTO, :TIPO, :PARCELA, '
      '   :SEQPROPOSTA, :IDLOTE, :VALORRECEBIDO, :DATARECEBIMENTO)')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBPREV'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 124
    Top = 192
  end
  object qryNCalcMantido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBU' +
        'ICAO, CP.PLACONTAD,'
      
        '        CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESA' +
        'PROP, CP.PLACONTAC,'
      
        '        CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP' +
        '.CODCENTROCUSTOC,'
      
        '        CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFO' +
        'LHA, CP.VALORBASE1,'
      '        CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,'
      '        CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,'
      
        '        CP.DATAINICIO,CP.DATAFINAL,  CP.ULTMESPREPARO, ST.FLGINT' +
        'ERNO,'
      '        C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,'
      '        CP.ULTANO13,'
      
        '        CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,       ' +
        ' EL.IDSITFUNC,   EL.DATAADMISSAO,'
      '        EL.DATADEMISSAO,'
      
        '        EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOC' +
        'UMENTO, PF.DATAMORTE,PP.SALPARTICIPACAO,'
      
        '        PP.SALMANTIDO  AS VALORPROVENTO,  PP.SALMANTIDO ,  PP.IN' +
        'SCRICAODATA,'
      '        PP.DTINICIOINSC,'
      '        PP.SALMANTIDO  AS VALORREMTOTAL, PP.SALPARTIC13,'
      
        '        C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,'#39'dd' +
        '/mm/yyyy'#39') AS DATAREF,'
      
        '        CP.SEQPROPOSTA,  PP.SALMANTIDO  AS  RUBPARCIAL, EL.MATRI' +
        'CULA,'
      '        TP.QTDEMESES,  PP.IDSITPART,'
      '        C.FLGNAOEXIGEREC ,  C.FLGCOBRA13DTFIM,'
      
        '        C.IDREGRAPRIMPGTO13, C.IDREGRAULTPGTO13, C.IDREGRACALCUL' +
        'O13,'
      '        PP.DATAINICIOMANUT,'
      '        C.IDREGRAULTPGTO13,  C.IDREGRAPRIMPGTO13'
      'FROM    PLANPREV PL,'
      '        TPPERIODICIDADE TP,'
      '        SITPART  ST,'
      '        CONTPREV C,'
      '        CONTRIBUICAO CONT,'
      '        PATRO PAT,'
      '        ELEGPATRO EL,'
      '        PARTPREVPLAN PP,'
      '        PLANPREVPATRO PLP,'
      '        PESSOAFISICA PF,'
      '        PESSOA P,'
      '        CONTRIBPREVPARTP CP'
      'WHERE  ST.FLGINTERNO      = :psSitFundacao  AND'
      '      PP.IDSITPART        = ST.IDSITPART    AND'
      '      PP.IDPESSJUR        = :piIdPessJur    AND'
      '      PP.IDPLANOPREV      = :piIdPlanoPrev   AND'
      '      PAT.IDPESSOA        = PP.IDPESSJUR AND'
      '      PP.IDPESSJUR        = PLP.IDPESSJUR AND'
      '      PP.IDPLANOPREV      = PLP.IDPLANOPREV AND'
      '      CP.IDPESSJUR        = PP.IDPESSJUR AND'
      '      CP.IDPLANOPREV      = PP.IDPLANOPREV AND'
      '      CP.IDPESSOA         = PP.IDPESSOA AND'
      '      CP.SEQPROPOSTA      = PP.SEQPROPOSTA AND'
      '      CP.IDCONTRIBUICAO   = :piIdContribuicao AND'
      '      CP.IDPLANOPREV      = C.IDPLANOPREV AND'
      '      CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO AND'
      '      CP.IDCONTRIBUICAO   = :piIdContribuicao AND'
      '     ( ( CP.ULTMESPREPARO    <= :psMesCobranca) or'
      '       ( ((SUBSTR(:psMesCobranca,6,2)) = '#39'13'#39' ) and'
      
        '         (TO_CHAR(ULTANO13) < TO_NUMBER(SUBSTR(:psMesCobranca,1,' +
        '4))  )'
      '       )'
      '     )  AND'
      '      CP.FLGCOBRA = 1 AND'
      
        '      ( CP.DIAVENCIMENTO >= :piDiaIni AND CP.DIAVENCIMENTO <= :p' +
        'iDiaFim) AND'
      
        '      ((CP.FLGDESCFOLHA = :piFlgDescFolha1) OR (CP.FLGDESCFOLHA ' +
        '= :piFlgDescFolha2))    AND'
      '     (((CP.FLGDESCFOLHA = 1) OR'
      '       (CP.FLGDESCFOLHA = 0)) ) AND'
      
        '      ((TO_CHAR(CP.DATAFINAL,'#39'YYYY/MM'#39') >= :psMesCobranca ) OR (' +
        'CP.DATAFINAL IS NULL)) AND'
      '      CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)  AND'
      '      PP.IDPESSJUR        = EL.IDPESSJUR AND'
      '      PP.IDPESSOA         = EL.IDPESSOA AND'
      '      P.IDPESSOA          = EL.IDPESSOA AND'
      '      P.IDPESSOA          = PF.IDPESSOA AND'
      '      C.IDCONTRIBUICAO    = CONT.IDCONTRIBUICAO AND'
      '      PL.IDPLANOPREV      = PP.IDPLANOPREV'
      ' ')
    ValidateWithMask = True
    Left = 37
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'psSitFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end>
  end
  object qryLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE ,  IDPESSOA ,  NUMREG ,  VLRTOTAL ,'
      '  MESREFERENCIA ,  TIPO ,  FLGPREPARADO ,  DATAPREPARO ,'
      '  DESCRICAO'
      'FROM CTRLINTERFACE'
      'WHERE CTRLINTERFACE.IDLOTE = -1')
    UpdateObject = updLote
    ValidateWithMask = True
    Left = 35
    Top = 130
  end
  object updLote: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMREG = :NUMREG,'
      '  VLRTOTAL = :VLRTOTAL,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  TIPO = :TIPO,'
      '  FLGPREPARADO = :FLGPREPARADO,'
      '  DATAPREPARO = :DATAPREPARO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into CTRLINTERFACE'
      
        '  (IDLOTE, IDPESSOA, NUMREG, VLRTOTAL, MESREFERENCIA, TIPO, FLGP' +
        'REPARADO, '
      '   DATAPREPARO, DESCRICAO)'
      'values'
      
        '  (:IDLOTE, :IDPESSOA, :NUMREG, :VLRTOTAL, :MESREFERENCIA, :TIPO' +
        ', :FLGPREPARADO, '
      '   :DATAPREPARO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 117
    Top = 129
  end
  object qryAtivoBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBU' +
        'ICAO, CP.PLACONTAD,'
      
        '        CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESA' +
        'PROP, CP.PLACONTAC,'
      
        '        CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP' +
        '.CODCENTROCUSTOC,'
      
        '        CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFO' +
        'LHA, CP.VALORBASE1,'
      '        CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,'
      '        CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,'
      
        '        CP.DATAINICIO,CP.DATAFINAL,   CP.ULTMESPREPARO,  ST.FLGI' +
        'NTERNO,'
      '        CP.ULTANO13,  EL.DATAADMISSAO,'
      '        C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,'
      
        '        CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,       ' +
        ' EL.IDSITFUNC, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P' +
        '.NUMDOCUMENTO, PF.DATAMORTE,'
      '        PP.SALPARTICIPACAO, PP.SALPARTICIPACAO AS VALORPROVENTO,'
      
        '        PP.SALPARTICIPACAO AS VALORREMTOTAL, PP.INSCRICAODATA, P' +
        'P.DTINICIOINSC,'
      
        '        C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,'#39'dd' +
        '/mm/yyyy'#39') AS DATAREF,'
      '        CP.SEQPROPOSTA, 0 AS RUBPARCIAL, EL.MATRICULA,'
      '        TP.QTDEMESES, PP.IDSITPART,'
      '        C.FLGNAOEXIGEREC, PP.SALPARTIC13'
      'FROM   PLANPREV PL,'
      '       TPPERIODICIDADE TP,'
      '       SITPART  ST,'
      '       CONTPREV C,'
      '       CONTRIBUICAO CONT,'
      '       PATRO PAT,'
      '       ELEGPATRO EL,'
      '       PLANPREVPATRO PLP,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       PESSOA P,'
      '       CONTRIBPREVPARTP CP'
      'WHERE (ST.FLGINTERNO       = :psSitFundacao)    AND'
      '      (CP.IDCONTRIBUICAO   = :piIdContribuicao) AND'
      '      (PP.IDPESSJUR        = :piIdPessJur)      AND'
      '      (PP.IDPLANOPREV      = :piIdPlanoPrev)    AND'
      '      (C.IDCONTRIBUICAO    = :piIdContribuicao) AND'
      '     ( ( CP.ULTMESPREPARO    < :psMesCobranca) or'
      '       ( ((SUBSTR(:psMesCobranca,6,2)) = '#39'13'#39' ) and'
      '         (TO_CHAR(CP.ULTANO13) < (SUBSTR(:psMesCobranca,1,4))  )'
      '       )'
      '     )  AND'
      '      (CP.FLGCOBRA         = 1)                 AND'
      '      (PP.IDSITPART        = ST.IDSITPART)      AND'
      '      (PAT.IDPESSOA        = PP.IDPESSJUR)      AND'
      '      (PP.IDPESSJUR        = PLP.IDPESSJUR)     AND'
      '      (PP.IDPLANOPREV      = PLP.IDPLANOPREV)   AND'
      '      (CP.IDPESSJUR        = PP.IDPESSJUR)      AND'
      '      (CP.IDPLANOPREV      = PP.IDPLANOPREV)    AND'
      '      (CP.IDPESSOA         = PP.IDPESSOA)       AND'
      '      (CP.SEQPROPOSTA      = PP.SEQPROPOSTA)    AND'
      
        '      ( CP.DIAVENCIMENTO >= :piDiaIni AND CP.DIAVENCIMENTO <= :p' +
        'iDiaFim) AND'
      
        '      ((CP.FLGDESCFOLHA = :piFlgDescFolha1) OR (CP.FLGDESCFOLHA ' +
        '= :piFlgDescFolha2))   AND'
      '     (((CP.FLGDESCFOLHA = 1)  OR'
      '       (CP.FLGDESCFOLHA = 0)) ) AND'
      
        '      ((TO_CHAR(CP.DATAFINAL,'#39'YYYY/MM'#39') >= :psMesCobranca ) OR (' +
        'CP.DATAFINAL IS NULL)) AND'
      '      (CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+))  AND'
      '      (P.IDPESSOA          = PP.IDPESSOA) AND'
      '      (PF.IDPESSOA         = PP.IDPESSOA) AND'
      '      (EL.IDPESSOA         = PP.IDPESSOA) AND'
      '      (EL.IDPESSJUR        = PP.IDPESSJUR) AND'
      '      (C.IDPLANOPREV       = PP.IDPLANOPREV) AND'
      '      (CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO) AND'
      '      (PL.IDPLANOPREV      = PP.IDPLANOPREV)  AND'
      
        '      (TO_CHAR(PP.INSCRICAODATA,'#39'YYYY/MM'#39') <= :psMesCobranca) AN' +
        'D'
      
        '      ((PP.DATACANCELAMENTO IS  NULL) OR (TO_CHAR(PP.DATACANCELA' +
        'MENTO,'#39'YYYY/MM'#39') >= :psMesCobranca))'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 119
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'psSitFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end>
  end
  object qryNCalcMantido13: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBU' +
        'ICAO, CP.PLACONTAD,'
      
        '        CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESA' +
        'PROP, CP.PLACONTAC,'
      
        '        CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP' +
        '.CODCENTROCUSTOC,'
      
        '        CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFO' +
        'LHA, CP.VALORBASE1,'
      '        CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,'
      '        CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,'
      
        '        CP.DATAINICIO,CP.DATAFINAL,  CP.ULTMESPREPARO, ST.FLGINT' +
        'ERNO,'
      '        C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,'
      '        CP.ULTANO13,'
      
        '        CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,       ' +
        ' EL.IDSITFUNC,'
      
        '        EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOC' +
        'UMENTO, PF.DATAMORTE,PP.SALPARTICIPACAO,'
      
        '        PP.SALMANTIDO  AS VALORPROVENTO,  PP.SALMANTIDO ,  PP.IN' +
        'SCRICAODATA,'
      '        PP.DTINICIOINSC,'
      '        PP.SALMANTIDO  AS VALORREMTOTAL, PP.SALPARTIC13,'
      
        '        C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,'#39'dd' +
        '/mm/yyyy'#39') AS DATAREF,'
      
        '        CP.SEQPROPOSTA,  PP.SALMANTIDO  AS  RUBPARCIAL, EL.MATRI' +
        'CULA,'
      '        TP.QTDEMESES,  PP.IDSITPART,'
      '        C.FLGNAOEXIGEREC ,  C.FLGCOBRA13DTFIM,'
      
        '        C.IDREGRAPRIMPGTO13, C.IDREGRAULTPGTO13, C.IDREGRACALCUL' +
        'O13,'
      '        PP.DATAINICIOMANUT,'
      '        C.IDREGRAULTPGTO13,  C.IDREGRAPRIMPGTO13'
      'FROM    PLANPREV PL,'
      '        TPPERIODICIDADE TP,'
      '        SITPART  ST,'
      '        CONTPREV C,'
      '        CONTRIBUICAO CONT,'
      '        PATRO PAT,'
      '        ELEGPATRO EL,'
      '        PARTPREVPLAN PP,'
      '        PLANPREVPATRO PLP,'
      '        PESSOAFISICA PF,'
      '        PESSOA P,'
      '        CONTRIBPREVPARTP CP'
      'WHERE  ST.FLGINTERNO      = :psSitFundacao AND'
      '      PP.IDSITPART        = ST.IDSITPART    AND'
      '      PP.IDPESSJUR        = :piIdPessJur AND'
      '      PP.IDPLANOPREV      = :piIdPlanoPrev   AND'
      '      PAT.IDPESSOA        = PP.IDPESSJUR AND'
      '      PP.IDPESSJUR        = PLP.IDPESSJUR AND'
      '      PP.IDPLANOPREV      = PLP.IDPLANOPREV AND'
      '      CP.IDPESSJUR        = PP.IDPESSJUR AND'
      '      CP.IDPLANOPREV      = PP.IDPLANOPREV AND'
      '      CP.IDPESSOA         = PP.IDPESSOA AND'
      '      CP.SEQPROPOSTA      = PP.SEQPROPOSTA AND'
      '      CP.IDCONTRIBUICAO   = :piIdContribuicao AND'
      '      CP.IDPLANOPREV      = C.IDPLANOPREV AND'
      '      CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO AND'
      '      CP.IDCONTRIBUICAO   = :piIdContribuicao AND'
      '      TO_CHAR(CP.ULTANO13) < (SUBSTR(:psMesCobranca,1,4)) AND'
      '      CP.FLGCOBRA = 1 AND'
      
        '      ( CP.DIAVENCIMENTO >= :piDiaIni AND CP.DIAVENCIMENTO <= :p' +
        'iDiaFim) AND'
      
        '      ((CP.FLGDESCFOLHA = :piFlgDescFolha1) OR (CP.FLGDESCFOLHA ' +
        '= :piFlgDescFolha2))    AND'
      '     (((CP.FLGDESCFOLHA = 1)  OR'
      '       (CP.FLGDESCFOLHA = 0)) ) AND'
      
        '      ((TO_CHAR(CP.DATAFINAL,'#39'YYYY/MM'#39') >= :psMesCobranca ) OR (' +
        'CP.DATAFINAL IS NULL)) AND'
      '      CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)  AND'
      '      PP.IDPESSJUR        = EL.IDPESSJUR AND'
      '      PP.IDPESSOA         = EL.IDPESSOA AND'
      '      P.IDPESSOA          = EL.IDPESSOA AND'
      '      P.IDPESSOA          = PF.IDPESSOA AND'
      '      C.IDCONTRIBUICAO    = CONT.IDCONTRIBUICAO AND'
      '      PL.IDPLANOPREV      = PP.IDPLANOPREV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 301
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'psSitFundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piIdContribuicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDiaFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piFlgDescFolha2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'psMesCobranca'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'Basedados'
    ValidateWithMask = True
    Left = 32
    Top = 296
  end
end
