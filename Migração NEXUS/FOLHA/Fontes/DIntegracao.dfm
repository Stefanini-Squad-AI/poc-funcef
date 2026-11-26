object dtmIntegracao: TdtmIntegracao
  OldCreateOrder = True
  Left = 33
  Top = 93
  Height = 479
  Width = 741
  object dsTpReceb: TwwDataSource
    DataSet = qryTpReceb
    Left = 375
    Top = 3
  end
  object qryTpReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO, ANASINT, RECPAG'
      'FROM   TIPORECEBDESEMB'
      'WHERE  RECPAG = '#39'P'#39
      'AND    IDPESSOA = :IDEMPRESA'
      'AND    PLANO = :IDPLANO')
    ValidateWithMask = True
    Left = 375
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end>
    object qryTpRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryTpRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpRecebANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryTpRecebRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
  end
  object dsContaContabil1: TwwDataSource
    DataSet = qryContaContabil1
    Left = 35
    Top = 3
  end
  object qryContaContabil1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 35
    Top = 66
    object qryContaContabil1PLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabil1PLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabil1PLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object qryAtividade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  UNIDNEGOC,'
      '  IDPESSOA,'
      '  TRIM(UNIDNEGOC)||'#39' - '#39'||NOME AS NOME'
      'FROM  UNIDNEGOCIO'
      'WHERE IDPESSOA = :IDEMPRESA'
      'AND UNETIPO = '#39'A'#39
      'AND ATIVO = '#39'S'#39
      'ORDER BY UNIDNEGOC'
      '')
    ValidateWithMask = True
    Left = 211
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsAtividade: TwwDataSource
    DataSet = qryAtividade
    Left = 211
    Top = 3
  end
  object qryformapag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODPORTFORMA,PLANO,IDTEMPLCHEQUE,IDPESSOA,IDEMPRESA,PLACO' +
        'NTA,CODCENTROCUSTO,'
      
        '       CODBLOQCHE,CODPORTADOR,CODFORMA,RECPAG,LANCAFINANC,DMAIS,' +
        'IDUSUARIOINCLUSAO,'
      
        '       DESCRICAO,NUMEMPRESABANCO,NOSSONUMERO,JUROSPORDIA,PRAZOPR' +
        'OTESTO,'
      
        '       CONTROLEREMESSA,DATACONTRREMESSA,CODARQUIVOREMESSA,PATHAR' +
        'QUIVOREM,'
      '       PATHARQUIVORET,CODTIPOPAGTO,CODFORMAPAGTO,FLGEMITEAVISO'
      'FROM   PORTADORFORMA')
    ValidateWithMask = True
    Left = 294
    Top = 66
  end
  object dsformapag: TwwDataSource
    DataSet = qryformapag
    Left = 294
    Top = 3
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 131
    Top = 129
  end
  object dsTipoDocCAR: TwwDataSource
    DataSet = qryTipoDocCAR
    Left = 458
    Top = 3
  end
  object qryTipoDocCAR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC,DESCRICAO'
      'FROM   TIPODOCRECPAG'
      'WHERE  RECPAG = '#39'P'#39)
    ValidateWithMask = True
    Left = 458
    Top = 66
  end
  object qrycentrespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON,'
      '  IDPESSOA,'
      '  TRIM(CODCENTRORESPON)||'#39' - '#39'||NOME AS NOME,'
      '  ANALITICOSINTET,'
      '  IDUSUARIOINCLUSAO,'
      '  RESPONSAVEL,'
      '  ATIVO'
      ''
      'FROM CENTRESPON'
      'WHERE ATIVO = '#39'S'#39
      'ORDER BY '
      '  CODCENTRORESPON'
      ' ')
    ValidateWithMask = True
    Left = 459
    Top = 129
  end
  object dsContaContabil: TwwDataSource
    DataSet = qryContaContabil
    Left = 131
    Top = 3
  end
  object qryContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 131
    Top = 66
    object qryContaContabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
  end
  object qrytipooper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPCODIGO,TIPDESCRICAO'
      'FROM   TIPOPER')
    ValidateWithMask = True
    Left = 294
    Top = 129
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM   SUBCONTA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 376
    Top = 129
  end
  object qryUSistema: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 211
    Top = 129
  end
end
