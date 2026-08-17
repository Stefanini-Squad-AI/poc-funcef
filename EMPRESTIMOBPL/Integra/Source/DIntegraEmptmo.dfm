object dtmIntegraEmptmo: TdtmIntegraEmptmo
  OldCreateOrder = False
  Left = 404
  Top = 88
  Height = 580
  Width = 808
  object qryRemarcaEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGENVIO      = 0,'
      '   HME.HMEDATAENVIO  = NULL,'
      '   HME.CODDOCUMENTO  = NULL,'
      '   HME.IDTMPDESC     = NULL'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      
        '   AND (:PCODDOCUMENTO           IS NULL OR HME.CODDOCUMENTO    ' +
        '  =:PCODDOCUMENTO)'
      
        '   AND (:PIDTMPDESC              IS NULL OR HME.IDTMPDESC       ' +
        '  =:PIDTMPDESC)'
      '   AND HMETIPOMOV                NOT IN (5, 8)'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMEDATARECEB          IS NULL'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND HME.HMEDATAQUITABONO      IS NULL'
      
        '   AND ( (:PHMEFORMACOBRANCA     IS NULL) OR (HME.HMEFORMACOBRAN' +
        'CA   =:PHMEFORMACOBRANCA) )'
      
        '   AND ( (:PHMEANOCOBRANCA       IS NULL) OR (HME.HMEANOCOBRANCA' +
        '     =:PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOBRANCA       IS NULL) OR (HME.HMEMESCOBRANCA' +
        '     =:PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEPARCELA           IS NULL) OR (HME.HMEPARCELA    ' +
        '     =:PHMEPARCELA) )')
    ValidateWithMask = True
    Left = 56
    Top = 162
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
  end
  object qryExcluiTMPDESC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   TMPDESC'
      'WHERE'
      '       ( IDMODULO          = 15 )'
      '   AND ( IDDESCONTO        =:PIDDESCONTO )'
      '   AND ( (IDHISTMOVEMPTMO  =:PORDEM) OR (:PORDEM IS NULL ) )'
      
        '   AND ( (MESCOBRANCA      =:PMESCOBRANCA) OR (:PMESCOBRANCA IS ' +
        'NULL) )')
    ValidateWithMask = True
    Left = 56
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
  end
  object qryDocumentosExclusao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.CODDOCUMENTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO         = 0'
      
        '   AND ( (:PHMEANOCOBRANCA    IS NULL) OR (HME.HMEANOCOBRANCA  =' +
        ':PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOBRANCA    IS NULL) OR (HME.HMEMESCOBRANCA  =' +
        ':PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEPARCELA        IS NULL) OR (HME.HMEPARCELA      =' +
        ':PHMEPARCELA) )')
    ValidateWithMask = True
    Left = 56
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
    object qryDocumentosExclusaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.CODDOCUMENTO'
    end
  end
  object qryExcluiFinanceiro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 56
    Top = 210
  end
  object qryUpdateDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   CODDOCUMENTO  =:PCODDOCUMENTO,'
      '   FLGENVIO      = NULL,'
      '   HMEDATAENVIO  =SYSDATE'
      ''
      'WHERE'
      '   IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 576
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateFlgEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGENVIO          = NULL,'
      ''
      '   HMEDATAENVIO      = SYSDATE,'
      '   IDTMPDESC         =:PIDTMPDESC'
      'WHERE'
      '   IDHISTMOVEMPTMO   =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 296
    Top = 226
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdatePlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   PLNCODIGO =:PPLNCODIGO'
      'WHERE'
      '   IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 296
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateEstornoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   PLNCODIGOESTORNO  =:PPLNCODIGO '
      'WHERE'
      '   IDHISTMOVEMPTMO   =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEDATAESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateAbonoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   PLNCODIGOESTORNO  =:PPLNCODIGO,'
      '   HMEDATAQUITABONO  =:PHMEDATAQUITABONO,'
      '   FLGABONADO        = 1'
      'WHERE'
      '   IDHISTMOVEMPTMO   =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 48
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptResult
      end>
  end
  object qryBuscaPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NOME'
      'FROM'
      '   PESSOA'
      'WHERE'
      '   IDPESSOA =:PIDPESSOA')
    ValidateWithMask = True
    Left = 292
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryBuscaPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryBuscaPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   IDPLANOPREV =:PIDPLANOPREV')
    ValidateWithMask = True
    Left = 292
    Top = 90
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBuscaPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryPlanilhasLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNDATDIA,'
      '   HME.IDHISTMOVEMPTMO'
      'FROM'
      '   PLANILHA      PLN,'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       PLN.PLNDATDIA  BETWEEN :PDATAINI AND :PDATAFIM'
      '   AND PLN.IDMODULO   = 15'
      '   AND HME.PLNCODIGO  = PLN.PLNCODIGO'
      '   AND HME.HMETIPOMOV =:PHMETIPOMOV')
    ValidateWithMask = True
    Left = 47
    Top = 282
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end>
    object qryPlanilhasLotePLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.PLANILHA.PLNCODIGO'
    end
    object qryPlanilhasLotePLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
      Origin = 'BASEDADOS.PLANILHA.PLNDATDIA'
    end
    object qryPlanilhasLoteIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryDesfazPlanilhaPorHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   PLNCODIGO =NULL'
      'WHERE'
      '   IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 146
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryExcluiLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 400
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 400
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LOTEXDOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 400
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 400
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiLancContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO'
      'WHERE'
      '   ( PLNCODIGO =:PPLNCODIGO)')
    ValidateWithMask = True
    Left = 400
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA'
      'WHERE'
      '   ( PLNCODIGO =:PPLNCODIGO)')
    ValidateWithMask = True
    Left = 296
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateVlrPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PLANILHA'
      'SET'
      '   PLNTOTDEB = 0,'
      '   PLNTOTCRE = 0,'
      '   PLNNUMLAN = 0'
      'WHERE'
      '   PLNCODIGO =:PPLNCODIGO')
    ValidateWithMask = True
    Left = 184
    Top = 258
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end>
  end
  object qryDesfazPlanilhaPorPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HMECONTABILIZACAO'
      'SET'
      '   PLNCODIGO = NULL'
      'WHERE'
      '   PLNCODIGO =:PPLNCODIGO')
    ValidateWithMask = True
    Left = 184
    Top = 210
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end>
  end
  object qryExcluiRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RECBTOPAGTO'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 400
    Top = 202
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateCCHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   CCDEBFINAN        =:PCCDEBFINAN,'
      '   CCCREDFINAN       =:PCCCREDFINAN,'
      '   CCDEBFOLHA        =:PCCDEBFOLHA,'
      '   CCCREDFOLHA       =:PCCCREDFOLHA'
      'WHERE'
      '   IDHISTMOVEMPTMO   =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 306
    ParamData = <
      item
        DataType = ftString
        Name = 'PCCDEBFINAN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCCREDFINAN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCDEBFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCCREDFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryInsertTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TMPDESC'
      '('
      'IDTMPDESC,'
      
        'IDPESSOA  , IDTITULAR    , IDPESSJUR     , IDPLANOPREV    , IDPL' +
        'ANPREVCONTAB,'
      'MATRICULA , INSCRICAONUMERO,'
      
        'IDLOTE    , IDMOTIVO     , IDFUNDACAO    , IDMODULO       , TIPC' +
        'ODIGO, NUMPRIORIDADE  ,'
      
        'IDPROVENTO, MESREFERENCIA, IDEMPRESA     , DATAREFERENCIA , EXER' +
        'CICIO, PLNCODIGOPREV  ,'
      
        'IDDESCONTO, MESCOBRANCA  , IDEMPRESAPROP , SISTORIGEM     , DESC' +
        'RICAO, COMPLDOCUMENTO ,'
      
        'PLACONTAD , FLGTIPODESC  , FLGDESCONTO   , CODCENTROCUSTOD, CODT' +
        'IPDOC, CODCENTRORESPON,'
      
        'PLACONTAC , FLGDESCFOLHA , FLGATRASODEVOL, CODCENTROCUSTOC, UNID' +
        'NEGOC, CODTIPRECDES   ,'
      
        'PERIODO   , CODPROVDESC  , CODPORTFORMA  , DATACOBRANCA   , SITE' +
        'NVIO , REFERENCIA     ,'
      
        'ORDEM     , RECPAG       , NODOCUMENTO   , CODALTERADOR   , PLAN' +
        'O    , VALOR,'
      
        'VALORINFO , PARCELA      , NUMPARCELAS   , IDHISTMOVEMPTMO, DATA' +
        'INICIO'
      ')'
      'VALUES'
      '('
      ':PIDTMPDESC,'
      
        ':PIDPESSOA  , :PIDTITULAR    , :PIDPESSJUR     , :PIDPLANOPREV  ' +
        '  , :PIDPLANPREVCONTAB,'
      ':PMATRICULA , :PINSCRICAONUMERO,'
      
        ':PIDLOTE    , :PIDMOTIVO     , :PIDFUNDACAO    , :PIDMODULO     ' +
        '  , :PTIPCODIGO, :PNUMPRIORIDADE  ,'
      
        ':PIDPROVENTO, :PMESREFERENCIA, :PIDEMPRESA     , :PDATAREFERENCI' +
        'A , :PEXERCICIO, :PPLNCODIGOPREV  ,'
      
        ':PIDDESCONTO, :PMESCOBRANCA  , :PIDEMPRESAPROP , :PSISTORIGEM   ' +
        '  , :PDESCRICAO, :PCOMPLDOCUMENTO ,'
      
        ':PPLACONTAD , :PFLGTIPODESC  , :PFLGDESCONTO   , :PCODCENTROCUST' +
        'OD, :PCODTIPDOC, :PCODCENTRORESPON,'
      
        ':PPLACONTAC , :PFLGDESCFOLHA , :PFLGATRASODEVOL, :PCODCENTROCUST' +
        'OC, :PUNIDNEGOC, :PCODTIPRECDES   ,'
      
        ':PPERIODO   , :PCODPROVDESC  , :PCODPORTFORMA  , :PDATACOBRANCA ' +
        '  , :PSITENVIO , :PREFERENCIA     ,'
      
        ':PORDEM     , :PRECPAG       , :PNODOCUMENTO   , :PCODALTERADOR ' +
        '  , :PPLANO    , :PVALOR,'
      
        ':PVALORINFO , :PPARCELA      , :PNUMPARCELAS   , :PORDEM        ' +
        '  , :PDATAINICIO'
      ')')
    ValidateWithMask = True
    Left = 80
    Top = 306
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANPREVCONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINSCRICAONUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PTIPCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPRIORIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEXERCICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSISTORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMPLDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGTIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODTIPDOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCENTRORESPON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGATRASODEVOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PUNIDNEGOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODPROVDESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNODOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALORINFO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINICIO'
        ParamType = ptInput
      end>
  end
  object qryInsertCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CTRLINTERFACE'
      '('
      
        '  IDLOTE  , TIPO  , DATAIDATMP   , FLGIDATMP      , FLGVOLTATMP ' +
        '     , VLRTOTAL,'
      
        '  IDPESSOA, NUMREG, MESREFERENCIA, FLGIDAINTERFACE, FLGVOLTAINTE' +
        'RFACE, FLGRESGATE'
      ')'
      'VALUES'
      '('
      
        '  :PIDLOTE  , :PTIPO  , :PDATAIDATMP   , :PFLGIDATMP      , :PFL' +
        'GVOLTATMP      , :PVLRTOTAL,'
      
        '  :PIDPESSOA, :PNUMREG, :PMESREFERENCIA, :PFLGIDAINTERFACE, :PFL' +
        'GVOLTAINTERFACE, :PFLGRESGATE'
      ')'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 282
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAIDATMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGIDATMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGVOLTATMP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRTOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMREG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGIDAINTERFACE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGVOLTAINTERFACE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PFLGRESGATE'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaBaixaEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANT'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO       =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV             =:PHMETIPOMOV'
      
        '   AND (:PHMEDATAPREVISTA         IS NULL OR HME.HMEDATAPREVISTA' +
        ' =:PHMEDATAPREVISTA)'
      '   AND (HME.HMECENTRALIZA         = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0)   = 0'
      '   AND ('
      '            ('
      '               HME.FLGBAIXADO     IS NULL'
      '            OR HME.HMEVLREFETIVO  IS NOT NULL'
      '            OR HME.HMEDATAEFETIVA IS NOT NULL'
      '            )'
      '        AND HME.HMEVLREFETIVO    <> 0'
      '       )')
    ValidateWithMask = True
    Left = 400
    Top = 346
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryVerificaBaixaEventoQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qryVerificaEnvioEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANT'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV           =:PHMETIPOMOV'
      
        '   AND (:PHMEDATAPREVISTA       IS NULL OR HME.HMEDATAPREVISTA =' +
        ':PHMEDATAPREVISTA)'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      
        '   AND (HME.FLGENVIO            IS NULL OR HME.CODDOCUMENTO IS N' +
        'OT NULL OR HME.IDTMPDESC IS NOT NULL)'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0')
    ValidateWithMask = True
    Left = 400
    Top = 442
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryVerificaEnvioEventoQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qryUpdateTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   TMPDESC'
      'SET'
      '   SITENVIO = '#39'9'#39
      'WHERE'
      '   IDTMPDESC =:PIDTMPDESC')
    ValidateWithMask = True
    Left = 296
    Top = 410
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end>
  end
  object qryDeleteTMPDESCporTmp: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   TMPDESC TMP'
      'WHERE'
      '       TMP.IDMODULO        = 15'
      '   AND IDTMPDESC           =:PIDTMPDESC'
      
        '   AND (:PIDDESCONTO       IS NULL OR IDDESCONTO      =:PIDDESCO' +
        'NTO)'
      
        '   AND (:PIDHISTMOVEMPTMO  IS NULL OR IDHISTMOVEMPTMO =:PIDHISTM' +
        'OVEMPTMO)'
      
        '   AND (:PMESCOBRANCA      IS NULL OR MESCOBRANCA     =:PMESCOBR' +
        'ANCA)')
    ValidateWithMask = True
    Left = 56
    Top = 66
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
  end
  object qryLimpaIDTmpDescPorHist: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   IDTMPDESC = NULL'
      'WHERE'
      '   IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 184
    Top = 98
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateDocConciliado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   DOCUMENTO'
      'SET'
      
        '   FLGNAOCONCILIADO = DECODE(:PFLGNAOCONCILIADO,0,NULL,:PFLGNAOC' +
        'ONCILIADO)'
      'WHERE'
      '   CODDOCUMENTO  =:PCODDOCUMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGNAOCONCILIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGNAOCONCILIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object qryLimpaIDTmpDescPorTmp: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   IDTMPDESC = NULL'
      'WHERE'
      '       IDTMPDESC           =:PIDTMPDESC'
      
        '   AND (:PIDCONTRATOEMPTMO IS NULL OR IDCONTRATOEMPTMO =:PIDCONT' +
        'RATOEMPTMO)')
    ValidateWithMask = True
    Left = 184
    Top = 50
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryBuscaItemCentralizador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   H.IDHISTMOVEMPTMO'
      ''
      'FROM'
      '   HISTMOVEMPTMO H,'
      '   ('
      '   SELECT'
      
        '      HST.IDHISTMOVEMPTMO, HST.IDCONTRATOEMPTMO, HST.IDITEMEMPTM' +
        'O,'
      '      HST.HMEPARCELA, HST.HMETIPOMOV, HST.IDITEMCENTRALIZA,'
      '      HST.HMEDATA, HST.HMEANOCOMPETENCIA, HST.HMEMESCOMPETENCIA,'
      '      HST.HMEANOCOBRANCA, HST.HMEMESCOBRANCA, HST.HMEORIGEM,'
      '      HST.HMEDATAPREVISTA'
      '   FROM'
      '      HISTMOVEMPTMO HST'
      '   WHERE'
      '      HST.IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO'
      '   ) HME'
      ''
      'WHERE'
      '       NVL(H.FLGESTORNADO, 0) = 0'
      '   AND H.HMECENTRALIZA        = 1'
      '   AND H.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO'
      '   AND H.HMEPARCELA           = HME.HMEPARCELA'
      '   AND H.HMETIPOMOV           = HME.HMETIPOMOV'
      '   AND H.HMEDATA              = HME.HMEDATA'
      '   AND H.HMEDATAPREVISTA      = HME.HMEDATAPREVISTA'
      '   AND H.HMEANOCOMPETENCIA    = HME.HMEANOCOMPETENCIA'
      '   AND H.HMEMESCOMPETENCIA    = HME.HMEMESCOMPETENCIA'
      '   AND H.HMEANOCOBRANCA       = HME.HMEANOCOBRANCA'
      '   AND H.HMEMESCOBRANCA       = HME.HMEMESCOBRANCA'
      '   AND H.HMEORIGEM            = HME.HMEORIGEM'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 462
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptResult
      end>
    object qryBuscaItemCentralizadorIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
  end
  object qryVerificaExclusaoTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TMP.IDDESCONTO, SITENVIO'
      'FROM'
      '   TMPDESC TMP'
      'WHERE'
      '       TMP.IDMODULO              = 15'
      '   AND TMP.IDDESCONTO            =:PIDDESCONTO'
      
        '   AND (:PIDTMPDESC              IS NULL OR TMP.IDTMPDESC       ' +
        '=:PIDTMPDESC)'
      
        '   AND (:PIDHISTMOVEMPTMO        IS NULL OR TMP.IDHISTMOVEMPTMO ' +
        '=:PIDHISTMOVEMPTMO)'
      
        '   AND (:PMESCOBRANCA            IS NULL OR TMP.MESCOBRANCA     ' +
        '=:PMESCOBRANCA)'
      
        '   AND (TMP.SITENVIO             <> '#39'0'#39'  OR NVL(TMP.VALORRECEBID' +
        'O, 0) <> 0)'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 394
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryVerificaExclusaoTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryVerificaExclusaoTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdateCCHistGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.CCDEBFINAN    =:PCCDEBFINAN,'
      '   HME.CCCREDFINAN   =:PCCCREDFINAN,'
      '   HME.CCDEBFOLHA    =:PCCDEBFOLHA,'
      '   HME.CCCREDFOLHA   =:PCCCREDFOLHA'
      'WHERE'
      '       HME.HMEDATAPREVISTA       =:PHMEDATAPREVISTA'
      '   AND HME.IDITEMEMPTMO          =:PIDITEMEMPTMO'
      '   AND NVL(HME.HMECENTRALIZA, 0) = 0'
      '   AND HME.HMETIPOMOV            = 5'
      '   AND HME.IDCONTRATOEMPTMO      IN'
      '                                 ('
      '                                 SELECT'
      '                                    IDCONTRATOEMPTMO'
      '                                 FROM'
      '                                    CONTRATOEMPTMO CON'
      '                                 WHERE'
      
        '                                        CON.IDTIPOCONTREMPTMO =:' +
        'PIDTIPOCONTREMPTMO'
      
        '                                    AND (CON.IDPATRO          =:' +
        'PIDPATRO OR :PIDPATRO IS NULL)'
      
        '                                    AND (CON.IDPLANOORIGEM    =:' +
        'PIDPLANOORIGEM OR :PIDPLANOORIGEM IS NULL)'
      '                                 )'
      ''
      '   AND HME.IDHISTMOVEMPTMO       IN'
      '                                 ('
      '                                 SELECT'
      '                                    IDHISTMOVEMPTMO'
      '                                 FROM'
      '                                    HISTMOVEMPTMO  HST,'
      '                                    CONTRATOEMPTMO CON,'
      '                                    ITEMXTIPOCONTR ITC'
      '                                 WHERE'
      
        '                                        CON.IDTIPOCONTREMPTMO   ' +
        '  =:PIDTIPOCONTREMPTMO'
      
        '                                    AND HST.HMEDATAPREVISTA     ' +
        '  =:PHMEDATAPREVISTA'
      
        '                                    AND HST.IDITEMEMPTMO        ' +
        '  =:PIDITEMEMPTMO'
      
        '                                    AND ITC.IDTIPOCONTREMPTMO   ' +
        '  =:PIDTIPOCONTREMPTMO'
      
        '                                    AND ITC.IDITEMEMPTMO        ' +
        '  =:PIDITEMEMPTMO'
      
        '                                    AND NVL(ITC.FLGNAOCONTAB, 0)' +
        '  = 0'
      
        '                                    AND HST.HMETIPOMOV          ' +
        '  = 5'
      
        '                                    AND HST.IDCONTRATOEMPTMO    ' +
        '  = CON.IDCONTRATOEMPTMO'
      
        '                                    AND CON.IDTIPOCONTREMPTMO   ' +
        '  = ITC.IDTIPOCONTREMPTMO'
      
        '                                    AND HST.IDITEMEMPTMO        ' +
        '  = ITC.IDITEMEMPTMO'
      '                                 )'
      ''
      '   AND ('
      '       :PESTORNO = 1'
      '       OR ('
      '              :PESTORNO = 0'
      '          AND ('
      '              ( NVL(HME.FLGESTORNADO, 0) = 0 ) OR'
      
        '              ( NVL(HME.FLGESTORNADO, 1) = 1 AND HME.PLNCODIGOES' +
        'TORNO IS NOT NULL )'
      '              )'
      '          )'
      '       )'
      ''
      '   AND ('
      '       :PESTORNO = 0'
      '       OR ('
      '              :PESTORNO = 1'
      '          AND HME.PLNCODIGO            IS  NOT NULL'
      '          AND NVL(HME.FLGESTORNADO, 0) = 1'
      '          AND HME.PLNCODIGOESTORNO     IS NULL'
      '          )'
      '       )')
    ValidateWithMask = True
    Left = 536
    Top = 258
    ParamData = <
      item
        DataType = ftString
        Name = 'PCCDEBFINAN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCCREDFINAN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCDEBFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCCCREDFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PESTORNO'
        ParamType = ptInput
      end>
  end
  object qryUpdateAbonoContabilGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.PLNCODIGOESTORNO =:PPLNCODIGO,'
      '   HME.HMEDATAQUITABONO =:PHMEDATAQUITABONO,'
      '   HME.FLGABONADO       = 1'
      'WHERE'
      '       HME.HMEDATAPREVISTA       =:PHMEDATAPREVISTA'
      '   AND HME.IDITEMEMPTMO          =:PIDITEMEMPTMO'
      '   AND NVL(HME.HMECENTRALIZA, 0) = 0'
      '   AND HME.IDCONTRATOEMPTMO      IN'
      '                                 ('
      '                                 SELECT'
      '                                    IDCONTRATOEMPTMO'
      '                                 FROM'
      '                                    CONTRATOEMPTMO CON'
      '                                 WHERE'
      
        '                                        CON.IDTIPOCONTREMPTMO  =' +
        ':PIDTIPOCONTREMPTMO'
      
        '                                    AND CON.IDPATRO            =' +
        ':PIDPATRO'
      '                                 )')
    ValidateWithMask = True
    Left = 536
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
  end
  object qryUpdateEstornoContabilGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.PLNCODIGOESTORNO  =:PPLNCODIGO,'
      '   HME.HMEDATAESTORNO    =:PHMEDATAESTORNO,'
      '   HME.IDUSUARIOESTORNO  =:PIDUSUARIOESTORNO,'
      '   HME.FLGESTORNADO      = 1'
      'WHERE'
      '       HME.HMEDATAPREVISTA       =:PHMEDATAPREVISTA'
      '   AND HME.IDITEMEMPTMO          =:PIDITEMEMPTMO'
      '   AND NVL(HME.HMECENTRALIZA, 0) = 0'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 1'
      '   AND HMETIPOMOV                = 5'
      '   AND HME.PLNCODIGO            IS NOT NULL'
      '   AND HME.PLNCODIGOESTORNO     IS NULL'
      ''
      '   AND HME.IDCONTRATOEMPTMO      IN'
      '                                 ('
      '                                 SELECT'
      '                                    IDCONTRATOEMPTMO'
      '                                 FROM'
      '                                    CONTRATOEMPTMO CON'
      '                                 WHERE'
      
        '                                        CON.IDTIPOCONTREMPTMO =:' +
        'PIDTIPOCONTREMPTMO'
      
        '                                    AND (CON.IDPATRO          =:' +
        'PIDPATRO OR :PIDPATRO IS NULL)'
      '                                 )'
      ''
      '   AND HME.IDHISTMOVEMPTMO       IN'
      '                                 ('
      '                                 SELECT'
      '                                    IDHISTMOVEMPTMO'
      '                                 FROM'
      '                                    HISTMOVEMPTMO  HST,'
      '                                    CONTRATOEMPTMO CON,'
      '                                    ITEMXTIPOCONTR ITC'
      '                                 WHERE'
      
        '                                        CON.IDTIPOCONTREMPTMO   ' +
        '  =:PIDTIPOCONTREMPTMO'
      
        '                                    AND HST.HMEDATAPREVISTA     ' +
        '  =:PHMEDATAPREVISTA'
      
        '                                    AND HST.IDITEMEMPTMO        ' +
        '  =:PIDITEMEMPTMO'
      
        '                                    AND ITC.IDTIPOCONTREMPTMO   ' +
        '  =:PIDTIPOCONTREMPTMO'
      
        '                                    AND ITC.IDITEMEMPTMO        ' +
        '  =:PIDITEMEMPTMO'
      
        '                                    AND NVL(ITC.FLGNAOCONTAB, 0)' +
        '  = 0'
      
        '                                    AND HST.HMETIPOMOV          ' +
        '  = 5'
      
        '                                    AND HST.IDCONTRATOEMPTMO    ' +
        '  = CON.IDCONTRATOEMPTMO'
      
        '                                    AND CON.IDTIPOCONTREMPTMO   ' +
        '  = ITC.IDTIPOCONTREMPTMO'
      
        '                                    AND HST.IDITEMEMPTMO        ' +
        '  = ITC.IDITEMEMPTMO'
      '                                 )')
    ValidateWithMask = True
    Left = 536
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdatePlanilhaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'MERGE INTO hmecontabilizacao hcontab'
      'USING (SELECT ha.idhistmovemptmo,'
      '              :PPLNCODIGO AS PLNCODIGO'
      '       FROM hmeatudiaria ha'
      
        '            JOIN contratoemptmo c ON c.idcontratoemptmo = ha.idc' +
        'ontratoemptmo'
      
        '            JOIN itemxtipocontr ixt ON  ixt.iditememptmo = ha.id' +
        'itememptmo'
      
        '                                    AND ixt.idtipocontremptmo = ' +
        'c.idtipocontremptmo'
      
        '            LEFT JOIN hmecontabilizacao hc ON hc.idhistmovemptmo' +
        ' = ha.idhistmovemptmo'
      '       WHERE ha.dataprevista = :PHMEDATAPREVISTA'
      '       AND   ha.iditememptmo = :PIDITEMEMPTMO'
      '       AND   ha.naturezaitem < 2'
      '       AND   ha.vlrprevisto <> 0'
      '       AND   hc.plncodigo IS NULL'
      '       AND   NVL(ixt.flgnaocontab,0) = 0'
      '       AND   c.idtipocontremptmo = :PIDTIPOCONTREMPTMO'
      '       AND   (c.idpatro = :PIDPATRO OR :PIDPATRO IS NULL)'
      '       AND   (ha.flgestornado = 0 '
      '              OR '
      
        '             (ha.flgestornado = 1 AND hc.plncodigoestorno IS NUL' +
        'L))'
      '       AND   (NVL(c.flgperdaefetiva,0) <> 1 '
      '              OR'
      
        '             (c.flgperdaefetiva = 1 AND ixt.flgcontabilizaperdae' +
        'fetiva = 1) '
      '              OR '
      
        '             (c.flgperdaefetiva = 1 AND ha.dataprevista <= c.dat' +
        'aperdaefetiva AND '#39'N'#39' = :PSTIPOCONTAB)'
      '              OR'
      
        '             (c.flgperdaefetiva = 1 AND ha.dataestorno <= c.data' +
        'perdaefetiva AND '#39'E'#39' = :PSTIPOCONTAB))) d'
      'ON (hcontab.idhistmovemptmo = d.idhistmovemptmo)'
      'WHEN MATCHED THEN UPDATE SET hcontab.PLNCODIGO = d.PLNCODIGO'
      'WHEN NOT MATCHED THEN INSERT VALUES (d.IDHISTMOVEMPTMO,'
      '                                     d.PLNCODIGO,'
      '                                     NULL,'
      '                                     NULL,'
      '                                     NULL,'
      '                                     NULL,'
      '                                     NULL)')
    ValidateWithMask = True
    Left = 536
    Top = 210
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDITEMEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PSTIPOCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PSTIPOCONTAB'
        ParamType = ptUnknown
      end>
  end
  object qryBenefBFCiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   IDPESSOA,'
      '   IDTITULAR,'
      '   IDPLANOORIGEM,'
      '   IDPLANOPREV,'
      '   IDPLANPREVCONTAB'
      'FROM'
      '   BENEFBFCIARIO'
      'WHERE'
      '       IDPESSOA       = :PIDPESSOA'
      '   AND IDPLANOPREV    = :PIDPLANOPREV'
      '   AND IDSITBENEFICIO = 1'
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 34
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBenefBFCiarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
    end
    object qryBenefBFCiarioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDTITULAR'
    end
    object qryBenefBFCiarioIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOORIGEM'
    end
    object qryBenefBFCiarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
    end
    object qryBenefBFCiarioIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANPREVCONTAB'
    end
  end
  object qryHistMovXDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVXDOCUM'
      '('
      'IDHISTMOVEMPTMO,'
      'HMDCODDOCUMENTO,'
      'HMDDATA'
      ')'
      'VALUES'
      '('
      ':PIDHISTMOVEMPTMO,'
      ':PHMDCODDOCUMENTO,'
      ':PHMDDATA'
      ')')
    ValidateWithMask = True
    Left = 504
    Top = 90
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMDCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMDDATA'
        ParamType = ptInput
      end>
  end
  object qryBaixaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   DOCUMENTO DOC'
      'SET'
      '   DOC.STATUS = '#39'2'#39
      'WHERE'
      '   DOC.CODDOCUMENTO =:PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 520
    Top = 354
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object qryExcluiContaBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CCBAIXASXDOCUM'
      'WHERE'
      '   CODDOCUMENTO =:PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 400
    Top = 490
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanilha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      ''
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      ''
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      ''
      '   PLN.PLNEFETIVADO,'
      '   DECODE(PLN.PLNEFETIVADO, '#39'S'#39', '#39'efetivada'#39', '#39#39') AS EFETIVADA,'
      ''
      '   COUNT(DISTINCT(HME.IDCONTRATOEMPTMO)) AS TOTAL_CONTRATOS'
      ''
      'FROM'
      '   PLANILHA      PLN,'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       PLN.IDPESSOA   =:PIDEMPRESAPROP'
      '   AND PLN.IDMODULO   = 15'
      '   AND PLN.PLNDATDIA  BETWEEN :PDATAINI AND :PDATAFIM'
      '   AND HME.HMETIPOMOV =:PHMETIPOMOV'
      
        '   AND (PLN.PLNCODIGO = HME.PLNCODIGO OR PLN.PLNCODIGO = HME.PLN' +
        'CODIGOESTORNO)'
      ''
      'GROUP BY'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNPLANIL,'
      ''
      '   PLN.PLNDATDIA,'
      '   PLN.PERNUMERO,'
      '   PLN.PEREXERCICIO,'
      ''
      '   PLN.IDMODULO,'
      '   PLN.IDPESSOA,'
      ''
      '   PLN.PLNEFETIVADO'
      ''
      'ORDER BY'
      '   PLN.PLNDATDIA, PLN.PLNPLANIL')
    ValidateWithMask = True
    Left = 386
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
        Value = '0'
      end>
    object qryPlanilhaPLNDATDIA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'PLNDATDIA'
      Origin = 'BASEDADOS.PLANILHA.PLNDATDIA'
    end
    object qryPlanilhaPLNCODIGO: TFloatField
      DisplayLabel = 'Cód. Planilha'
      DisplayWidth = 15
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.PLANILHA.PLNCODIGO'
    end
    object qryPlanilhaPLNPLANIL: TFloatField
      DisplayLabel = 'Nº Planilha'
      DisplayWidth = 15
      FieldName = 'PLNPLANIL'
      Origin = 'BASEDADOS.PLANILHA.PLNPLANIL'
    end
    object qryPlanilhaTOTAL_CONTRATOS: TFloatField
      DisplayLabel = 'Total de Contratos'
      DisplayWidth = 15
      FieldName = 'TOTAL_CONTRATOS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryPlanilhaEFETIVADA: TStringField
      DisplayLabel = ' '
      DisplayWidth = 20
      FieldName = 'EFETIVADA'
      Size = 9
    end
    object qryPlanilhaPLNEFETIVADO: TStringField
      DisplayWidth = 1
      FieldName = 'PLNEFETIVADO'
      Origin = 'BASEDADOS.PLANILHA.PLNEFETIVADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPlanilhaPERNUMERO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERNUMERO'
      Origin = 'BASEDADOS.PLANILHA.PERNUMERO'
      Visible = False
    end
    object qryPlanilhaPEREXERCICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PEREXERCICIO'
      Origin = 'BASEDADOS.PLANILHA.PEREXERCICIO'
      Visible = False
    end
    object qryPlanilhaIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.PLANILHA.IDMODULO'
      Visible = False
    end
    object qryPlanilhaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PLANILHA.IDPESSOA'
      Visible = False
    end
  end
  object dtsPlanilha: TwwDataSource
    DataSet = qryPlanilha
    Left = 520
    Top = 410
  end
  object qryDesfazPlanilhaEstornoPorPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HMECONTABILIZACAO'
      'SET'
      '   PLNCODIGOESTORNO = NULL'
      'WHERE'
      '   PLNCODIGOESTORNO =:PPLNCODIGO')
    ValidateWithMask = True
    Left = 184
    Top = 194
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end>
  end
  object qryExcluiDocumentoHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   CODDOCUMENTO = NULL'
      'WHERE'
      '   CODDOCUMENTO =:PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 400
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object qryDataCredito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATACREDITO'
      'FROM'
      '   CONTRATOEMPTMO'
      'WHERE'
      '   IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 48
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryDataCreditoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.DATACREDITO'
    end
  end
  object qryContratoQuitado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   CON.IDCONTRATOEMPTMO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '   CON.IDCONTRQUITACAO =:PIDCONTRQUITACAO')
    ValidateWithMask = True
    Left = 48
    Top = 378
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRQUITACAO'
        ParamType = ptInput
      end>
    object qryContratoQuitadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
  end
  object qryValorBaixadoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(DECODE(LDO.OPERACAO, 5, LDO.VALOR, 0)) AS VALOR_BAIXADO'
      'FROM'
      '    LANCTODOCUM LDO,'
      '    DOCUMENTO   DOC'
      'WHERE'
      '       DOC.CODDOCUMENTO =:PCODDOCUMENTO'
      '   AND LDO.ESTORNO      IS NULL'
      '   AND DOC.CODDOCUMENTO = LDO.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 184
    Top = 490
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryValorBaixadoDocVALOR_BAIXADO: TFloatField
      FieldName = 'VALOR_BAIXADO'
    end
  end
  object qryUltDataBaixaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(DATABAIXA) AS DATA_BAIXA'
      'FROM'
      '   RECBTOPAGTO'
      'WHERE'
      '   CODDOCUMENTO =:PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 184
    Top = 478
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryUltDataBaixaDocDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
  end
  object qryUltDataLancDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(DATALANCTO) AS DATA_BAIXA'
      'FROM'
      '   LANCTODOCUM'
      'WHERE'
      '       CODDOCUMENTO =:PCODDOCUMENTO'
      '   AND OPERACAO     IN (4, 5)')
    ValidateWithMask = True
    Left = 184
    Top = 466
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryUltDataLancDocDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
  end
  object qryVlrBaixadoTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TMP.IDTMPDESC,'
      ''
      '   TMP.MESCOBRANCA, TMP.MESREFERENCIA,'
      '   TMP.FLGDESCFOLHA,'
      '   TMP.SITENVIO,'
      '   TMP.IDDESCONTO,'
      '   TMP.ORDEM, TMP.IDHISTMOVEMPTMO,'
      ''
      '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR,'
      '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO,'
      '   TMP.DATARECEBIMENTO,'
      ''
      '   TMP.IDLOTE,'
      '   TMP.LOTEPREVIA'
      ''
      'FROM'
      '   TMPDESC TMP'
      ''
      'WHERE'
      '       TMP.IDTMPDESC       =:PIDTMPDESC'
      '   AND TMP.IDMODULO        IN (15, 32)')
    ValidateWithMask = True
    Left = 184
    Top = 538
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end>
    object qryVlrBaixadoTmpDescIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryVlrBaixadoTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryVlrBaixadoTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryVlrBaixadoTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryVlrBaixadoTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryVlrBaixadoTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryVlrBaixadoTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryVlrBaixadoTmpDescIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryVlrBaixadoTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryVlrBaixadoTmpDescVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryVlrBaixadoTmpDescDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryVlrBaixadoTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryVlrBaixadoTmpDescLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
  end
  object qryItensContabilizados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1'
      'FROM'
      '   HMEATUDIARIA HME'
      
        '   JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME' +
        '.IDHISTMOVEMPTMO'
      'WHERE'
      '   HME.DATAPREVISTA  = :PHMEDATAPREVISTA'
      
        'AND (CONTAB.PLNCODIGO IS NOT NULL OR CONTAB.PLNCODIGOESTORNO IS ' +
        'NOT NULL)')
    ValidateWithMask = True
    Left = 504
    Top = 138
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end>
  end
  object qryPlanoPrevOrigemFUNCEF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   CTB.IDPLANOPREV'
      'FROM     PARTPREVPLAN ATU,'
      '         PARTPREVPLAN ANT,'
      '         PLANPREVCONTABIL CTB'
      'WHERE    ATU.IDPESSOA = :PIDPESSOA'
      'AND      ATU.IDPLANOPREV = 74'
      'AND      CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV'
      'AND      CTB.IDPLANOPREV = 28'
      'AND      ANT.IDPESSOA = ATU.IDPESSOA'
      'AND      ANT.INSCRICAODATA ='
      '         (SELECT MAX(INSCRICAODATA)'
      '          FROM   PARTPREVPLAN'
      '          WHERE  IDPESSOA = ATU.IDPESSOA'
      '          AND    IDPLANOPREV = 2'
      '          AND    IDSITPLANOPREV IN (25,27,28,29)'
      '          AND    FLGDESATIVADO = 1'
      '          AND    INSCRICAODATA < ATU.INSCRICAODATA)')
    ValidateWithMask = True
    Left = 336
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryPlanoPrevOrigemFUNCEFIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object qryBuscaMenorContratoPorTipo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDCONTRATOEMPTMO,'
      '    IDPESSOA,'
      '    IDBENEF,'
      '    DATACREDITO,'
      '    IDTIPOCONTREMPTMO'
      'FROM'
      '    CONTRATOEMPTMO'
      'WHERE'
      '    IDBENEF           = :PIDPESSOA'
      'AND IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'
      'AND IDCONTRATOEMPTMO  = ('
      '                         SELECT '
      '                             MIN(IDCONTRATOEMPTMO)'
      '                         FROM'
      '                             CONTRATOEMPTMO'
      '                         WHERE'
      '                             IDBENEF           = :PIDPESSOA'
      
        '                         AND IDTIPOCONTREMPTMO = :PIDTIPOCONTREM' +
        'PTMO'
      '                         AND FLGSITUACAO      <> '#39'C'#39
      '                        )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
  end
  object qryBuscaPlanoContabil: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PXP.IDPLANOPREV, PXP.IDPLANPREVC,'
      ''
      '   PP.NOME AS PLANO_PREV, EC.NOME AS ENTIDADE_CONTABIL'
      ''
      'FROM'
      '   PLANPREVXCONTABIL PXP, PLANPREV PP, PLANPREVCONTABIL EC'
      ''
      'WHERE'
      '       ( PXP.IDPLANOPREV = PP.IDPLANOPREV )'
      '   AND ( PXP.IDPLANPREVC = EC.IDPLANOPREV )'
      '   AND ( PP.IDPLANOPREV = :PIDPLANOPREV )')
    ValidateWithMask = True
    Left = 184
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBuscaPlanoContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANOPREV'
    end
    object qryBuscaPlanoContabilIDPLANPREVC: TFloatField
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANPREVC'
    end
    object qryBuscaPlanoContabilPLANO_PREV: TStringField
      FieldName = 'PLANO_PREV'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryBuscaPlanoContabilENTIDADE_CONTABIL: TStringField
      FieldName = 'ENTIDADE_CONTABIL'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryBuscaPlanoPrev: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PXP.IDPLANOPREV, PXP.IDPLANPREVC,'
      ''
      '   PP.NOME AS PLANO_PREV, EC.NOME AS ENTIDADE_CONTABIL'
      ''
      'FROM'
      '   PLANPREVXCONTABIL PXP, PLANPREV PP, PLANPREVCONTABIL EC'
      ''
      'WHERE'
      '       ( PXP.IDPLANOPREV = PP.IDPLANOPREV )'
      '   AND ( PXP.IDPLANPREVC = EC.IDPLANOPREV )'
      '   AND ( PXP.IDPLANPREVC = :PIDPLANOCONTAB )'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOCONTAB'
        ParamType = ptInput
      end>
    object qryBuscaPlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANOPREV'
    end
    object qryBuscaPlanoPrevIDPLANPREVC: TFloatField
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANPREVC'
    end
    object qryBuscaPlanoPrevPLANO_PREV: TStringField
      FieldName = 'PLANO_PREV'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryBuscaPlanoPrevENTIDADE_CONTABIL: TStringField
      FieldName = 'ENTIDADE_CONTABIL'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryUpdateCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CTRLINTERFACE '
      ''
      'SET FLGRESGATE = :PFLGRESGATE'
      ''
      'WHERE IDLOTE = :PIDLOTE')
    ValidateWithMask = True
    Left = 296
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGRESGATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end>
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   PLN.PLNCODIGO,'
      '   PLN.PLNDATDIA,'
      '   HME.IDHISTMOVEMPTMO'
      'FROM'
      '   PLANILHA      PLN,'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       PLN.PLNDATDIA  BETWEEN :PDATAINI AND :PDATAFIM'
      '   AND PLN.IDMODULO   = 15'
      '   AND HME.PLNCODIGO  = PLN.PLNCODIGO'
      '   AND HME.HMETIPOMOV =:PHMETIPOMOV')
    ValidateWithMask = True
    Left = 47
    Top = 282
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.PLANILHA.PLNCODIGO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'PLNDATDIA'
      Origin = 'BASEDADOS.PLANILHA.PLNDATDIA'
    end
    object FloatField2: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
end
