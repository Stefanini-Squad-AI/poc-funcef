object dtmAtualizacaoDiaria: TdtmAtualizacaoDiaria
  OldCreateOrder = False
  Top = 122
  Height = 450
  Width = 732
  object qryRetornaValor: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 16
  end
  object spAtualizaSaldo: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.SP_EMP_ATUALIZASALDODEV'
    ValidateWithMask = True
    Left = 273
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FSALDODEV'
        ParamType = ptInput
      end>
  end
  object qryUpdateSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTMOVEMPTMO'
      'SET    HMESALDODEV     = :PHMESALDODEV'
      'WHERE  IDHISTMOVEMPTMO = :PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 169
    Top = 160
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryParcelasEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO               = 1,'
      '   HMEDATAESTORNO             = SYSDATE,'
      '   IDUSUARIOESTORNO           =:PIDUSUARIOESTORNO'
      'WHERE'
      
        '       ((:PIDCONTRATOEMPTMO   IS NULL) OR (IDCONTRATOEMPTMO =:PI' +
        'DCONTRATOEMPTMO))'
      '   AND HMEDATAATUALIZA        =:PHMEDATAATUALIZA'
      '   AND HMETIPOMOV             = 5'
      '   AND NVL(FLGESTORNADO, 0)   = 0')
    ValidateWithMask = True
    Left = 168
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
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
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
  end
  object qryAtualizaSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.IDHISTMOVEMPTMO,'
      '    HME.HMEVLRPREVISTO,'
      '    ITC.ITCTRATASALDODEV'
      'FROM'
      '    HISTMOVEMPTMO HME,'
      '    CONTRATOEMPTMO CNT,'
      '    ITEMXTIPOCONTR ITC'
      'WHERE'
      '    HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      'AND HME.HMEDATAATUALIZA   >= :PHMEDATAATUALIZA'
      'AND HME.HMETIPOMOV        IN (1,2,3,4)'
      'AND CNT.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO'
      'AND ITC.IDTIPOCONTREMPTMO  = CNT.IDTIPOCONTREMPTMO'
      'AND ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 169
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qryAtualizaSaldoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryAtualizaSaldoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryAtualizaSaldoITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
  end
  object qryParcelasAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(SUM(HMEVLRPREVISTO), 0) AS TOTAL'
      'FROM'
      '    HISTMOVEMPTMO'
      'WHERE'
      '    IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      'AND HMEDATAPREVISTA <:PHMEDATAPREVISTA'
      'AND HMEDATAEFETIVA  IS NULL'
      'AND (HMECENTRALIZA  = 1 OR HMEDESTACADO = 1)'
      'AND (FLGESTORNADO   = 0 OR FLGESTORNADO IS NULL)'
      'AND (FLGSUSPENSAO   = 0 OR FLGSUSPENSAO IS NULL)'
      'AND HMETIPOMOV      = 1'
      '   AND FLGBAIXADO      = 0')
    ValidateWithMask = True
    Left = 57
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasAbertoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryParcelasNaoPagas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV       = 1 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEVLRPREVISTO   > 0 )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryInsertHistMovEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVEMPTMO'
      '('
      
        '  IDHISTMOVEMPTMO  , IDITEMCENTRALIZA , IDITEMEMPTMO    , IDCONT' +
        'RATOEMPTMO,'
      
        '  HMEMESCOMPETENCIA, HMEANOCOMPETENCIA, IDREGRA         , IDRUBR' +
        'ICA     ,'
      
        '  HMEMESCOBRANCA   , HMEANOCOBRANCA   , HMEFORMACOBRANCA, HMESEQ' +
        'COBRANCA,'
      
        '  HMEDATAPREVISTA  , HMEDATAATUALIZA  , HMEDATA         , HMETXJ' +
        'UROS    ,'
      
        '  HMEPARCELA       , HMESALDODEV      , HMEVLREFETIVO   , HMEVLR' +
        'PREVISTO,'
      
        '  HMERECPAG        , HMETIPOMOV       , HMECENTRALIZA   , HMEORI' +
        'GEM     ,'
      
        '  HMEPRIORIDADE    , FLGENVIO         , FLGBAIXADO      , FLGDIV' +
        'ERGPEND, FLGTIPODIVERG,'
      
        '  HMENUMPARCELAS   , HMEDESTACADO     , HMEDATAVENCTO   , HMEDAT' +
        'AEFETIVA,'
      '  HMETIPOFOLHA, VERSAO, HMEDATARECEB'
      ')'
      'VALUES'
      '('
      
        ' SEQHISTMOVEMPTMO.NEXTVAL  , :PIDITEMCENTRALIZA , :PIDITEMEMPTMO' +
        '    , :PIDCONTRATOEMPTMO,'
      
        ' :PHMEMESCOMPETENCIA, :PHMEANOCOMPETENCIA, :PIDREGRA         , :' +
        'PIDRUBRICA       ,'
      
        ' :PHMEMESCOBRANCA   , :PHMEANOCOBRANCA   , :PHMEFORMACOBRANCA, :' +
        'PHMESEQCOBRANCA  ,'
      
        ' :PHMEDATAPREVISTA  , :PHMEDATAATUALIZA  , SYSDATE         , :PH' +
        'METXJUROS      ,'
      
        ' :PHMEPARCELA       , :PHMESALDODEV      , :PHMEVLREFETIVO   , :' +
        'PHMEVLRPREVISTO  ,'
      
        ' :PHMERECPAG        , :PHMETIPOMOV       , :PHMECENTRALIZA   , :' +
        'PHMEORIGEM       ,'
      
        ' :PHMEPRIORIDADE    , :PFLGENVIO         , :PFLGBAIXADO      , :' +
        'PFLGDIVERGPEND   , :PFLGTIPODIVERG,'
      
        ' :PHMENUMPARCELAS   , :PHMEDESTACADO     , :PHMEDATAVENCTO   , :' +
        'PHMEDATAEFETIVA,'
      ' :PHMETIPOFOLHA, :PVERSAO, :PHMEDATARECEB'
      ')')
    ValidateWithMask = True
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDITEMCENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMESEQCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMETXJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLRPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMECENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPRIORIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMENUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEDESTACADO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMETIPOFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDHISTMOVEMPTMO'
      'FROM'
      '    HISTMOVEMPTMO'
      'WHERE'
      '    IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND HMETIPOMOV       = 5'
      'AND HMEDATAPREVISTA  = :PHMEDATAPREVISTA'
      'AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0)')
    ValidateWithMask = True
    Left = 56
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryAuxIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object spUpdateEstornado: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.SP_EMP_ATUALIZAFLGESTORNO'
    ValidateWithMask = True
    Left = 273
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DDATAFIM'
        ParamType = ptInput
      end>
  end
  object qryBuscaItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RCT.IDITEMEMPTMO,'
      '   RCT.ITCRECPAG,'
      '   RCT.IDREGRACALC,'
      '   RCT.ITCPRIORIDADE,'
      '   RCT.IDPROVENTON,'
      '   RCT.ITCEVENTO,'
      '   RCT.ITCSEQCALCULO,'
      '   RCT.ITCTRATASALDODEV,'
      ''
      '   RCT.FLGCENTRALIZA,'
      '   RCT.FLGDESTACADO,'
      '   RCT.FLGGRAVAZERO,'
      ''
      '   TOTALGRUPO.IDITEMEMPTMO AS IDITEMCENTRALIZA,'
      ''
      '   IRC.ITEDESCRICAO'
      ''
      'FROM'
      '   ITEMXTIPOCONTR RCT,'
      '   ITEMEMPTMO IRC,'
      ''
      '   ('
      '   SELECT'
      '      IDITEMEMPTMO, ITCEVENTO'
      '   FROM'
      '      ITEMXTIPOCONTR'
      '   WHERE'
      '          ( IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '      AND ( FLGCENTRALIZA     = 1 )'
      '   ) TOTALGRUPO'
      ''
      'WHERE'
      '       ( RCT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( RCT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( RCT.ITCEVENTO         = TOTALGRUPO.ITCEVENTO(+) )'
      '   AND'
      '   ('
      
        '   ((:PEVENTO = 0) AND ((RCT.ITCEVENTO =:PEVENTO) OR (RCT.ITCEVE' +
        'NTO = 1 AND RCT.FLGCENTRALIZA = 1)))'
      '   OR'
      '   ((:PEVENTO <> 0) AND (RCT.ITCEVENTO =:PEVENTO))'
      '   )'
      '   AND IRC.IDITEMEMPTMO     = :PIDITEMEMPTMO'
      'ORDER BY'
      '   RCT.ITCSEQCALCULO, RCT.ITCSEQCALCULO'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDITEMEMPTMO'
        ParamType = ptUnknown
      end>
    object qryBuscaItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryBuscaItensFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
    end
    object qryBuscaItensITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaItensIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
    end
    object qryBuscaItensITCPRIORIDADE: TFloatField
      FieldName = 'ITCPRIORIDADE'
    end
    object qryBuscaItensIDPROVENTON: TFloatField
      FieldName = 'IDPROVENTON'
    end
    object qryBuscaItensITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
    end
    object qryBuscaItensITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryBuscaItensIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryBuscaItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryBuscaItensITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
    object qryBuscaItensFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
    end
    object qryBuscaItensFLGGRAVAZERO: TFloatField
      FieldName = 'FLGGRAVAZERO'
    end
  end
  object qryDatasAtualiza: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*) AS DIAS'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND HMETIPOMOV               = 5'
      '   AND HMEDATAPREVISTA BETWEEN  :PDATAINI AND :PDATAFIM')
    ValidateWithMask = True
    Left = 168
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
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
      end>
    object qryDatasAtualizaDIAS: TFloatField
      FieldName = 'DIAS'
    end
  end
  object spAtualizaDiaria: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_ATUALIZA_DIARIA'
    ValidateWithMask = True
    Left = 273
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iModulo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iTipoEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITipoContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iPatro'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iPlano'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bEstorna'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bAtualizaSaldo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataConsidera'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataInicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataFinal'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iCalculaProv'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bInArquivo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bNotInArquivo'
        ParamType = ptInput
      end>
  end
  object qryUltAtuDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(HME.HMEDATAATUALIZA) AS HMEDATAATUALIZA'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      
        '   AND ( :PHMEDATAATUALIZA      IS NULL OR HME.HMEDATAATUALIZA <' +
        '=:PHMEDATAATUALIZA )')
    ValidateWithMask = True
    Left = 168
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qryUltAtuDiaHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
  end
  object qryEstornaItensAtualizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGESTORNADO              = 1,'
      '   HME.HMEDATAESTORNO            = SYSDATE,'
      '   HME.IDUSUARIOESTORNO          =:PIDUSUARIOESTORNO'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMEDATAQUITABONO      =:PHMEDATAQUITABONO'
      '   AND HME.HMETIPOMOV            = 4'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )')
    ValidateWithMask = True
    Left = 280
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAQUITABONO'
        ParamType = ptInput
      end>
  end
  object qryContratosGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOEMPTMO,'
      ''
      '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO,'
      '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO,'
      ''
      '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA,'
      '   C.IDPESSOA, C.IDBENEF,'
      ''
      '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG,'
      '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG,'
      '   C.IDCBANCARIA,'
      ''
      '   C.DATAASSINATURA, C.DATASITUACAO,'
      '   C.DATACREDITO, C.DATAPRIMPARC,'
      '   C.DATACANC,'
      ''
      '   C.MOECODIGO, M.MOESIGLA,'
      ''
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      '   C.NUMPARCELAS,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC'
      ''
      'FROM'
      '   CONTRATOEMPTMO  C,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE'
      ''
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( C.IDPATRO            IN ( 1 ) )'
      '   AND ( C.IDPLANOPREV        IN ( 1 ) )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 268
    object qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosGeracaoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosGeracaoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosGeracaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosGeracaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosGeracaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosGeracaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosGeracaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosGeracaoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosGeracaoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosGeracaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosGeracaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosGeracaoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratosGeracaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosGeracaoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosGeracaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosGeracaoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosGeracaoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object qryContratosGeracaoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryContratosGeracaoIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object qryContratosGeracaoIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object qryContratosGeracaoIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object qryContratosGeracaoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryContratosGeracaoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryContratosGeracaoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
  end
  object spProvPerdas: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_PROVISAO_DE_PERDAS'
    ValidateWithMask = True
    Left = 369
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iTipoEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iTipoContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iPatro'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iPlano'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bEstorna'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bAtualizaSaldo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bInArquivo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bNotInArquivo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataConsidera'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataInicial'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dDataFinal'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iCalculaProv'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iModulo'
        ParamType = ptInput
      end>
  end
end
