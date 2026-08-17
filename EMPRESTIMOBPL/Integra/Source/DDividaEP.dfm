object dtmDividaEP: TdtmDividaEP
  OldCreateOrder = False
  Left = 37
  Top = 176
  Height = 507
  Width = 727
  object qryContratosTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCONTRATOEMPTMO, IDPATRO'
      'FROM'
      '   CONTRATOEMPTMO'
      'WHERE'
      '       IDPESSOA = :PIDPESSOA'
      '   AND IDBENEF  = :PIDBENEF'
      '   AND FLGSITUACAO NOT IN ('#39'C'#39', '#39'K'#39', '#39'Q'#39')')
    ValidateWithMask = True
    Left = 64
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end>
    object qryContratosTitularIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryContratosTitularIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
    end
  end
  object qryContratosDesfazer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CON.IDCONTRATOEMPTMO, CON.IDPATRO'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '       CON.IDPESSOA           =:PIDPESSOA'
      '   AND CON.IDBENEF            =:PIDBENEF'
      '   AND CON.FLGSITUACAO        NOT IN ('#39'C'#39', '#39'Q'#39')'
      '   AND HME.HMETIPOMOV         = 3'
      '   AND HME.HMEORIGEM          =:PHMEORIGEM'
      '   AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end>
    object qryContratosDesfazerIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosDesfazerIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object qryContratosMorteMutuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCONTRATOEMPTMO, IDPATRO'
      'FROM'
      '     VWCONTRATOEP'
      'WHERE'
      '       IDPESSOA  = :PIDPESSOA'
      '   AND IDBENEF   = :PIDBENEF'
      '   AND FLGSEGURO = 1'
      ''
      '   AND FLGSITUACAO NOT IN ('#39'C'#39', '#39'K'#39', '#39'Q'#39')')
    ValidateWithMask = True
    Left = 64
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end>
    object qryContratosMorteMutuarioIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosMorteMutuarioIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object qryBuscaModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NOMEMODULO'
      'FROM'
      '    MODULO'
      'WHERE'
      '    IDMODULO = :PIDMODULO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end>
    object qryBuscaModuloNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      Origin = 'BASEDADOS.MODULO.NOMEMODULO'
      FixedChar = True
      Size = 50
    end
  end
  object qryDividasSIAFI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SALDODEVQUIT,'
      '    VLRPARCELA,'
      '    MULTAQUIT,'
      '    JUROSQUIT,'
      '    CORRECAOQUIT,'
      '    SEGUROQUIT,'
      '    MULTASEGQUIT,'
      '    JUROSSEGQUIT,'
      '    CORRECAOSEGQUIT,'
      '    DESCONTOQUIT'
      'FROM'
      '     EPHISTSIAFI'
      'WHERE'
      '       IDPESSOA  = :PIDPESSOA'
      '   AND DATAATUALIZA IS NULL'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryDividasSIAFISALDODEVQUIT: TFloatField
      FieldName = 'SALDODEVQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.SALDODEVQUIT'
    end
    object qryDividasSIAFIVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      Origin = 'BASEDADOS.EPHISTSIAFI.VLRPARCELA'
    end
    object qryDividasSIAFIMULTAQUIT: TFloatField
      FieldName = 'MULTAQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.MULTAQUIT'
    end
    object qryDividasSIAFIJUROSQUIT: TFloatField
      FieldName = 'JUROSQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.JUROSQUIT'
    end
    object qryDividasSIAFICORRECAOQUIT: TFloatField
      FieldName = 'CORRECAOQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.CORRECAOQUIT'
    end
    object qryDividasSIAFISEGUROQUIT: TFloatField
      FieldName = 'SEGUROQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.SEGUROQUIT'
    end
    object qryDividasSIAFIMULTASEGQUIT: TFloatField
      FieldName = 'MULTASEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.MULTASEGQUIT'
    end
    object qryDividasSIAFIJUROSSEGQUIT: TFloatField
      FieldName = 'JUROSSEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.JUROSSEGQUIT'
    end
    object qryDividasSIAFICORRECAOSEGQUIT: TFloatField
      FieldName = 'CORRECAOSEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.CORRECAOSEGQUIT'
    end
    object qryDividasSIAFIDESCONTOQUIT: TFloatField
      FieldName = 'DESCONTOQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.DESCONTOQUIT'
    end
  end
  object qryDesfazQuitacaoSIAFI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '     EPHISTSIAFI'
      'SET'
      '     IDMODULO     = NULL,'
      '     PLNCODIGO    = NULL,'
      '     DATAATUALIZA = NULL,'
      '     IDDOCUMENTO  = NULL,'
      '     DATAEFETIVA  = NULL'
      'WHERE'
      '    IDPESSOA    = :PIDPESSOA'
      'AND IDDOCUMENTO = :PIDDOCUMENTO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object qryQuitaDividaSIAFI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '     EPHISTSIAFI'
      'SET'
      '     DATAATUALIZA = :PDATAEFETIVA,'
      '     IDMODULO     = :PIDMODULO,'
      '     PLNCODIGO    = :PPLNCODIGO,'
      '     IDDOCUMENTO  = :PIDDOCUMENTO,'
      '     NOMEMODULO   = :PNOMEMODULO,'
      '     VLRPARCELAPG = VLRPARCELA,'
      '     MULTAEPPG    = MULTAEP,'
      '     JUROSEPPG    = JUROSEP,'
      '     CORRECAOEPPG = CORRECAOEP,'
      '     SALDODEVEPPG = SALDODEVEP,'
      '     SEGUROEPPG   = SEGUROEP,'
      '     MULTASEGEPPG = MULTASEGEP,'
      '     JUROSSEGEPPG = JUROSSEGEP,'
      '     CORRECAOSEGEPPG = CORRECAOSEGEP,'
      '     DESCONTOEPPG = DESCONTOEP'
      ''
      'WHERE'
      '       IDPESSOA  = :PIDPESSOA'
      '   AND ((:PREFERENCIA IS NULL OR COBRANCA = :PREFERENCIA))'
      '   AND DATAATUALIZA IS NULL'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PNOMEMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end>
  end
  object qryHistSIAFI: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    COBRANCA,'
      '    VLRPARCELA,'
      '    MULTAQUIT,'
      '    JUROSQUIT,'
      '    CORRECAOQUIT,'
      '    SEGUROQUIT,'
      '    MULTASEGQUIT,'
      '    JUROSSEGQUIT,'
      '    CORRECAOSEGQUIT,'
      '    DESCONTOQUIT'
      'FROM'
      '    EPHISTSIAFI'
      'WHERE'
      '    IDPESSOA = :PIDPESSOA'
      'AND DATAATUALIZA IS NULL'
      'ORDER BY'
      '    COBRANCA'
      ''
      ' '
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 184
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '30572'
      end>
    object qryHistSIAFICOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Origin = 'BASEDADOS.EPHISTSIAFI.COBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryHistSIAFIVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      Origin = 'BASEDADOS.EPHISTSIAFI.VLRPARCELA'
    end
    object qryHistSIAFIMULTAQUIT: TFloatField
      FieldName = 'MULTAQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.MULTAQUIT'
    end
    object qryHistSIAFIJUROSQUIT: TFloatField
      FieldName = 'JUROSQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.JUROSQUIT'
    end
    object qryHistSIAFICORRECAOQUIT: TFloatField
      FieldName = 'CORRECAOQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.CORRECAOQUIT'
    end
    object qryHistSIAFISEGUROQUIT: TFloatField
      FieldName = 'SEGUROQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.SEGUROQUIT'
    end
    object qryHistSIAFIMULTASEGQUIT: TFloatField
      FieldName = 'MULTASEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.MULTASEGQUIT'
    end
    object qryHistSIAFIJUROSSEGQUIT: TFloatField
      FieldName = 'JUROSSEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.JUROSSEGQUIT'
    end
    object qryHistSIAFICORRECAOSEGQUIT: TFloatField
      FieldName = 'CORRECAOSEGQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.CORRECAOSEGQUIT'
    end
    object qryHistSIAFIDESCONTOQUIT: TFloatField
      FieldName = 'DESCONTOQUIT'
      Origin = 'BASEDADOS.EPHISTSIAFI.DESCONTOQUIT'
    end
  end
  object qryQuitaResgateSIAFI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '     EPHISTSIAFI'
      'SET'
      '     DATAATUALIZA      = :PDATAEFETIVA,'
      '     IDMODULO          = :PIDMODULO,'
      '     PLNCODIGO         = :PPLNCODIGO,'
      '     IDDOCUMENTO       = :PIDDOCUMENTO,'
      '     NOMEMODULO        = :PNOMEMODULO,'
      '     VLRPARCELAPG      = VLRPARCELA,'
      '     MULTAQUITPG       = MULTAQUIT,'
      '     JUROSQUITPG       = JUROSQUIT,'
      '     CORRECAOQUITPG    = CORRECAOQUIT,'
      '     SALDODEVQUITPG    = SALDODEVQUIT,'
      '     SEGUROQUITPG      = SEGUROQUIT,'
      '     MULTASEGQUITPG    = MULTASEGQUIT,'
      '     JUROSSEGQUITPG    = JUROSSEGQUIT,'
      '     CORRECAOSEGQUITPG = CORRECAOSEGQUIT,'
      '     DESCONTOQUITPG    = DESCONTOQUIT'
      ''
      'WHERE'
      '       IDPESSOA  = :PIDPESSOA'
      '   AND ((:PREFERENCIA IS NULL OR COBRANCA = :PREFERENCIA))'
      '   AND DATAATUALIZA IS NULL'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 224
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PNOMEMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end>
  end
  object qryAmortizacaoMesmaData: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV       = 2'
      '   AND HME.HMEDATAPREVISTA  =:PHMEDATAPREVISTA'
      '   AND (HME.FLGESTORNADO    = 0 OR FLGESTORNADO IS NULL)')
    ValidateWithMask = True
    Left = 312
    Top = 120
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
    object qryAmortizacaoMesmaDataIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryAmortizacaoPosterior: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV       = 2'
      '   AND HME.HMEDATAPREVISTA  >:PHMEDATAPREVISTA'
      '   AND (HME.FLGESTORNADO    = 0 OR FLGESTORNADO IS NULL)')
    ValidateWithMask = True
    Left = 312
    Top = 72
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
    object qryAmortizacaoPosteriorIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryAmortizacaoAnteriorEmAberto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV       = 2'
      '   AND HME.HMEDATAPREVISTA  <:PHMEDATAPREVISTA'
      '   AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   AND (HME.FLGESTORNADO    = 0 OR FLGESTORNADO IS NULL)'
      '   AND HME.FLGBAIXADO       = 0'
      '   AND HME.HMEVLREFETIVO    IS NULL')
    ValidateWithMask = True
    Left = 312
    Top = 24
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
    object qryAmortizacaoAnteriorEmAbertoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryItemPosterior: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV       NOT IN (4, 5)'
      '   AND HME.HMEDATAPREVISTA  >:PHMEDATAPREVISTA'
      '   AND (HME.FLGESTORNADO    = 0 OR FLGESTORNADO IS NULL)')
    ValidateWithMask = True
    Left = 312
    Top = 176
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
    object FloatField1: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
end
