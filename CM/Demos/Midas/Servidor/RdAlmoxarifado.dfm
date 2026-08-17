object RdmAlmoxarifado: TRdmAlmoxarifado
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 157
  Top = 130
  Height = 375
  Width = 544
  object DspUnCusteio: TDataSetProvider
    DataSet = qryUnCusteio
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 190
    Top = 74
  end
  object qryUnCusteio: TwwQuery
    DatabaseName = 'DbnSvrAlmoxarifado'
    Constrained = True
    SQL.Strings = (
      'SELECT  '
      '           CODCUSTEIO,'
      '           DESCCUSTEIO,'
      '           UCCONTABIL'
      'FROM '
      '        UNCUSTEI '
      'WHERE '
      '       ( IDPESSOA = :IDPESSOA )'
      'ORDER  BY DESCCUSTEIO')
    ControlType.Strings = (
      'UCCONTABIL;CheckBox;T;F')
    ValidateWithMask = True
    Left = 190
    Top = 124
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryUnCusteioCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'UNCUSTEI.CODCUSTEIO'
    end
    object qryUnCusteioDESCCUSTEIO: TStringField
      FieldName = 'DESCCUSTEIO'
      Origin = 'UNCUSTEI.DESCCUSTEIO'
      Size = 30
    end
    object qryUnCusteioUCCONTABIL: TStringField
      FieldName = 'UCCONTABIL'
      Origin = 'UNCUSTEI.UCCONTABIL'
      Size = 1
    end
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'DbnSvrAlmoxarifado'
    SQL.Strings = (
      'SELECT '
      '          NOME,'
      '          CODCENTROCUSTO  '
      'FROM '
      '         CENTCUST '
      'WHERE '
      '         (IDEMPRESA = :IDEMPRESA)'
      '     AND (STATUSGRUPOCDC = '#39'A'#39')'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    OnFilterOptions = []
    Left = 118
    Top = 124
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
  end
  object DspCentroCusto: TDataSetProvider
    DataSet = qryCentroCusto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 118
    Top = 74
  end
  object Dsp: TDataSetProvider
    DataSet = qry
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 46
    Top = 74
  end
  object qry: TwwQuery
    DatabaseName = 'DbnSvrAlmoxarifado'
    SQL.Strings = (
      'SELECT'
      '     CODALMOXARIFADO,'
      '     CODCUSTEIO,'
      '     IDPESSOA,'
      '     CODCENTROCUSTO,'
      '     IDEMPRESA,'
      '     DESCALMOX,'
      '     PRINCIPSECUND,'
      '     CONTABIL'
      'FROM'
      '    ALMOX'
      'WHERE'
      '    (CODALMOXARIFADO = :pCODALMOX)')
    ValidateWithMask = True
    Left = 46
    Top = 124
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
    object qryCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Origin = 'BASEDADOS.ALMOX.CODALMOXARIFADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCODCUSTEIO: TFloatField
      FieldName = 'CODCUSTEIO'
      Origin = 'BASEDADOS.ALMOX.CODCUSTEIO'
      ProviderFlags = [pfInUpdate]
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.ALMOX.IDPESSOA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.ALMOX.CODCENTROCUSTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.ALMOX.IDEMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object qryDESCALMOX: TStringField
      FieldName = 'DESCALMOX'
      Origin = 'BASEDADOS.ALMOX.DESCALMOX'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 40
    end
    object qryPRINCIPSECUND: TStringField
      FieldName = 'PRINCIPSECUND'
      Origin = 'BASEDADOS.ALMOX.PRINCIPSECUND'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryCONTABIL: TStringField
      FieldName = 'CONTABIL'
      Origin = 'BASEDADOS.ALMOX.CONTABIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object DbSvrAlmoxarifado: TDatabase
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=cm'
      'USER NAME=cm'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=cmsol')
    SessionName = 'Default'
    Left = 48
    Top = 24
  end
end
