object dtmLookEmptmo: TdtmLookEmptmo
  OldCreateOrder = False
  Left = 458
  Top = 61
  Height = 652
  Width = 798
  object qryLookTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPCODIGO, TIPDESCRICAO'
      'FROM'
      '  TIPOPER'
      'ORDER BY'
      '  TIPDESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 232
    object qryLookTipOperTIPDESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object qryLookTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryLookTipoReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      ''
      'FROM'
      '   TIPORECEBDESEMB'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ( RECPAG = '#39'R'#39' )'
      '   AND ( ANASINT = '#39'A'#39' )'
      ''
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookTipoRecebDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryLookTipoRecebCODTIPRECDES: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLookTipoRecebRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST'
      '   '
      'FROM'
      '   PLANOCONTA'
      ''
      'WHERE'
      '   PLANO =:PPLANO'
      '   AND ( PLAINATIVA = '#39'A'#39' )'
      ''
      'ORDER BY'
      '   PLACONTA')
    ValidateWithMask = True
    Left = 144
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryLookPlanoContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryLookPlanoContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryLookPlanoContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryLookPlanoContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
  end
  object qryLookPortadorFormaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.CODPORTFORMA, PF.DESCRICAO'
      ''
      'FROM'
      '   PORTADORFORMA PF'
      ''
      'WHERE'
      '   ( PF.IDPESSOA =:PIDPESSOA )'
      '   AND ( PF.RECPAG = '#39'R'#39' )'
      ''
      'ORDER BY'
      '   PF.DESCRICAO')
    ValidateWithMask = True
    Left = 144
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookPortadorFormaRDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaRCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
  end
  object qryLookPais: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, NOMEPAIS'
      'FROM'
      '   PAIS'
      'ORDER BY'
      '   NOMEPAIS')
    ValidateWithMask = True
    Left = 144
    Top = 136
    object qryLookPaisNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Size = 30
    end
    object qryLookPaisIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
      Visible = False
    end
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO, MOEDESC, MOESIGLA'
      'FROM'
      '   MOEDA'
      'ORDER BY'
      '   MOESIGLA')
    ValidateWithMask = True
    Left = 144
    Top = 40
    object qryLookMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object qryLookTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ( RECPAG = '#39'P'#39' )'
      '   AND ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 240
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookTipoDesembDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDesembCODTIPRECDES: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLookTipoDesembRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookCCredFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY'
      '   C.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptInput
      end>
    object StringField6: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField7: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookCCDebFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY'
      '   C.NOME')
    ValidateWithMask = True
    Left = 496
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField2: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookSbCredFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODSUBCONTA, SC.NOMESUBCONTA'
      ''
      'FROM'
      '   CONTASXSUBC X, SUBCONTA SC'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDPESSOA =:PIDPESSOA )'
      '   AND ( X.CODSUBCONTA = SC.CODSUBCONTA)'
      ''
      'ORDER BY'
      '   SC.NOMESUBCONTA')
    ValidateWithMask = True
    Left = 444
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookSbCredFolhaNOMESUBCONTA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qryLookSbCredFolhaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CONTASXSUBC.CODSUBCONTA'
      Visible = False
    end
  end
  object qryLookEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, CODESTADO, NOMEESTADO, IDESTADO'
      'FROM'
      '   ESTADO'
      'WHERE'
      '   IDPAIS =:PAIS'
      'ORDER BY'
      '   CODESTADO')
    ValidateWithMask = True
    Left = 48
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end>
    object qryLookEstadoCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryLookEstadoNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryLookEstadoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Visible = False
    end
    object qryLookEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
    end
  end
  object qryLookCidade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCIDADES, CODESTADO, IDPAIS, NOME, CODMUNICIPIO, IDESTADO'
      'FROM'
      '   CIDADES'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 48
    Top = 208
    object qryLookCidadeNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'CIDADES.NOME'
      Size = 50
    end
    object qryLookCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'CIDADES.IDCIDADES'
      Visible = False
    end
    object qryLookCidadeCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'CIDADES.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryLookCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'CIDADES.IDPAIS'
      Visible = False
    end
    object qryLookCidadeCODMUNICIPIO: TStringField
      DisplayWidth = 10
      FieldName = 'CODMUNICIPIO'
      Origin = 'CIDADES.CODMUNICIPIO'
      Visible = False
      Size = 10
    end
    object qryLookCidadeIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'CIDADES.IDESTADO'
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ( ANALITICOSINTET = '#39'A'#39' )'
      'ORDER BY'
      '   NOME'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 48
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CC.CODCENTROCUSTO, CC.NOME'
      ''
      'FROM'
      '   CENTCUST CC'
      ''
      'WHERE'
      '   ( CC.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( STATUSGRUPOCDC = '#39'A'#39' )'
      '   AND ( ATIVO = '#39'S'#39' )'
      ''
      'ORDER BY'
      '   CC.NOME')
    ValidateWithMask = True
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField4: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PB.NOME, PB.RAZAOSOCIAL,'
      '   B.NUMBANCO, B.IDPESSOA'
      'FROM'
      '   PESSOA PB, BANCO B'
      'WHERE'
      '   ( B.IDPESSOA = PB.IDPESSOA )'
      'ORDER BY'
      '   PB.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 48
    Top = 64
    object qryLookBancoRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryLookBancoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Visible = False
      Size = 60
    end
    object qryLookBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryLookBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BANCO.IDPESSOA'
      Visible = False
    end
  end
  object qryLookAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.CODALTERADOR, T.DESCRICAO,'
      '   T.RECPAG, T.ACRESDECRES'
      ''
      'FROM'
      '   TIPOALTERADOR T'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDEMPRESAPROP )'
      
        '   AND ( (:PACRESDECRES IS NULL) OR (T.ACRESDECRES =:PACRESDECRE' +
        'S) )'
      '   AND ( (:PRECPAG IS NULL) OR (T.RECPAG =:PRECPAG) )'
      ''
      'ORDER BY'
      '   T.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PACRESDECRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end>
    object qryLookAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 1
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryLookAlteradorCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
      Visible = False
    end
    object qryLookAlteradorRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOALTERADOR.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = 'TIPOALTERADOR.ACRESDECRES'
      Visible = False
      Size = 1
    end
  end
  object qryLookPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA, P.NOME,'
      '   PT.ANOFECHAEMPTMO, PT.MESFECHAEMPTMO,'
      '   PT.ANOFECHAPATROEP, PT.MESFECHAPATROEP,'
      '   PT.ANOFECHAFOLHAEP, PT.MESFECHAFOLHAEP,'
      ''
      '   DECODE(PT.MESFECHAEMPTMO,  1, '#39'Janeiro'#39','
      '                              2, '#39'Fevereiro'#39','
      '                              3, '#39'Março'#39','
      '                              4, '#39'Abril'#39','
      '                              5, '#39'Maio'#39','
      '                              6, '#39'Junho'#39','
      '                              7, '#39'Julho'#39','
      '                              8, '#39'Agosto'#39','
      '                              9, '#39'Setembro'#39','
      '                             10, '#39'Outubro'#39','
      '                             11, '#39'Novembro'#39','
      
        '                             12, '#39'Dezembro'#39') AS MES_FECHA_CAPCAR' +
        ','
      ''
      '   DECODE(PT.MESFECHAFOLHAEP, 1, '#39'Janeiro'#39','
      '                              2, '#39'Fevereiro'#39','
      '                              3, '#39'Março'#39','
      '                              4, '#39'Abril'#39','
      '                              5, '#39'Maio'#39','
      '                              6, '#39'Junho'#39','
      '                              7, '#39'Julho'#39','
      '                              8, '#39'Agosto'#39','
      '                              9, '#39'Setembro'#39','
      '                             10, '#39'Outubro'#39','
      '                             11, '#39'Novembro'#39','
      '                             12, '#39'Dezembro'#39') AS MES_FECHA_FOLHA,'
      ''
      '   DECODE(PT.MESFECHAPATROEP, 1, '#39'Janeiro'#39','
      '                              2, '#39'Fevereiro'#39','
      '                              3, '#39'Março'#39','
      '                              4, '#39'Abril'#39','
      '                              5, '#39'Maio'#39','
      '                              6, '#39'Junho'#39','
      '                              7, '#39'Julho'#39','
      '                              8, '#39'Agosto'#39','
      '                              9, '#39'Setembro'#39','
      '                             10, '#39'Outubro'#39','
      '                             11, '#39'Novembro'#39','
      '                             12, '#39'Dezembro'#39') AS MES_FECHA_PATRO'
      'FROM'
      '   PESSOA P, PATRO PT'
      ''
      'WHERE'
      '   ( P.IDPESSOA = PT.IDPESSOA )'
      ''
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 144
    Top = 184
    object qryLookPatroNOME: TStringField
      DisplayWidth = 47
      FieldName = 'NOME'
      Size = 60
    end
    object qryLookPatroMES_FECHA_PATRO: TStringField
      DisplayLabel = '    Mês'
      DisplayWidth = 9
      FieldName = 'MES_FECHA_PATRO'
      Size = 9
    end
    object qryLookPatroANOFECHAPATROEP: TFloatField
      Alignment = taCenter
      DisplayLabel = ' Ano'
      DisplayWidth = 5
      FieldName = 'ANOFECHAPATROEP'
      DisplayFormat = '0000'
    end
    object qryLookPatroMES_FECHA_FOLHA: TStringField
      DisplayLabel = '    Mês'
      DisplayWidth = 9
      FieldName = 'MES_FECHA_FOLHA'
      Size = 9
    end
    object qryLookPatroANOFECHAFOLHAEP: TFloatField
      Alignment = taCenter
      DisplayLabel = ' Ano'
      DisplayWidth = 5
      FieldName = 'ANOFECHAFOLHAEP'
      DisplayFormat = '0000'
    end
    object qryLookPatroMES_FECHA_CAPCAR: TStringField
      DisplayLabel = '    Mês'
      DisplayWidth = 9
      FieldName = 'MES_FECHA_CAPCAR'
      Size = 9
    end
    object qryLookPatroANOFECHAEMPTMO: TFloatField
      Alignment = taCenter
      DisplayLabel = ' Ano'
      DisplayWidth = 5
      FieldName = 'ANOFECHAEMPTMO'
      DisplayFormat = '0000'
    end
    object qryLookPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryLookPatroMESFECHAEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'MESFECHAEMPTMO'
      Visible = False
    end
    object qryLookPatroMESFECHAPATROEP: TFloatField
      DisplayWidth = 10
      FieldName = 'MESFECHAPATROEP'
      Visible = False
    end
    object qryLookPatroMESFECHAFOLHAEP: TFloatField
      DisplayWidth = 10
      FieldName = 'MESFECHAFOLHAEP'
      Visible = False
    end
  end
  object qryLookPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, NOME'
      ''
      'FROM'
      '   PLANPREV'
      ''
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 144
    Top = 280
    object qryLookPlanPrevNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryLookPlanPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
      Visible = False
    end
  end
  object qryLookItemIntegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDITEMEMPTMO, I.ITEDESCRICAO,'
      '   ITC.ITCRECPAG, ITC.FLGCENTRALIZA, ITC.FLGDESTACADO'
      ''
      'FROM'
      '   ITEMXTIPOCONTR ITC, ITEMEMPTMO I'
      ''
      'WHERE'
      '       ( ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO      = I.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   I.ITEDESCRICAO')
    ValidateWithMask = True
    Left = 48
    Top = 496
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end>
    object qryLookItemIntegraITEDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryLookItemIntegraIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
    object qryLookItemIntegraITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCRECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLookItemIntegraFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGCENTRALIZA'
    end
    object qryLookItemIntegraFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGDESTACADO'
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC, NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  ( IDPESSOA =:PIDPESSOA )'
      '  AND ( UNETIPO = '#39'A'#39' )'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 344
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryLookPlanPrevContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      ''
      'FROM'
      '  PLANPREVCONTABIL'
      ''
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 144
    Top = 328
    object qryLookPlanPrevContabNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryLookPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
      Visible = False
    end
  end
  object qryLookCCredFinan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY'
      '   C.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 496
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptInput
      end>
    object StringField8: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField9: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookCCDebFinan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      ''
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDEMPRESA =:PIDEMPRESA )'
      '   AND ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      ''
      'ORDER BY'
      '   C.NOME'
      ' ')
    ValidateWithMask = True
    Left = 496
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptInput
      end>
    object StringField10: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField11: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookSubDebFinan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODSUBCONTA, SC.NOMESUBCONTA'
      ''
      'FROM'
      '   CONTASXSUBC X, SUBCONTA SC'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDPESSOA =:PIDPESSOA )'
      '   AND ( X.CODSUBCONTA = SC.CODSUBCONTA)'
      ''
      'ORDER BY'
      '   SC.NOMESUBCONTA')
    ValidateWithMask = True
    Left = 496
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookSubDebFinanNOMESUBCONTA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qryLookSubDebFinanCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CONTASXSUBC.CODSUBCONTA'
      Visible = False
    end
  end
  object qryLookSbCredFinan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODSUBCONTA, SC.NOMESUBCONTA'
      ''
      'FROM'
      '   CONTASXSUBC X, SUBCONTA SC'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDPESSOA =:PIDPESSOA )'
      '   AND ( X.CODSUBCONTA = SC.CODSUBCONTA)'
      ''
      'ORDER BY'
      '   SC.NOMESUBCONTA'
      '')
    ValidateWithMask = True
    Left = 496
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookSbCredFinanNOMESUBCONTA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qryLookSbCredFinanCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CONTASXSUBC.CODSUBCONTA'
      Visible = False
    end
  end
  object qryLookSubDebFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODSUBCONTA, SC.NOMESUBCONTA'
      ''
      'FROM'
      '   CONTASXSUBC X, SUBCONTA SC'
      ''
      'WHERE'
      '   ( X.PLANO =:PPLANO )'
      '   AND ( X.PLACONTA =:PPLACONTA )'
      '   AND ( X.IDPESSOA =:PIDPESSOA )'
      '   AND ( X.CODSUBCONTA = SC.CODSUBCONTA)'
      ''
      'ORDER BY'
      '   SC.NOMESUBCONTA')
    ValidateWithMask = True
    Left = 432
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookSubDebFolhaNOMESUBCONTA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qryLookSubDebFolhaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CONTASXSUBC.CODSUBCONTA'
      Visible = False
    end
  end
  object qryLookRubricaNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROVENTO, DESCRICAO'
      'FROM'
      '   PROVDESC'
      'WHERE'
      '   ( FLGTPRUBRICA LIKE '#39'%E%'#39' )'
      '   AND ( FLGDESCONTO =:PFLGDESCONTO )'
      '   AND ( FLGATRASODEVOL = '#39'N'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGDESCONTO'
        ParamType = ptInput
      end>
    object qryLookRubricaNormalDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 1
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryLookRubricaNormalIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
      Visible = False
    end
  end
  object qryLookDadosBancarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CTB.IDCBANCARIA, CTB.FLGCONTAPREF, CTB.CONTACORRENTE,'
      '  AGB.NUMAGENCIA,  BAN.NOME AS BANCO'
      'FROM'
      ' PESSOA          BAN,'
      ' AGENCIABANCARIA AGB,'
      ' CONTABANCARIA   CTB'
      'WHERE'
      '    CTB.IDPESSOA  = :PIDPESSOA'
      'AND CTB.IDAGENCIA = AGB.IDPESSOA'
      'AND AGB.IDBANCO   = BAN.IDPESSOA'
      'ORDER BY CTB.FLGCONTAPREF DESC')
    ValidateWithMask = True
    Left = 48
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryLookDadosBancariosIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.CONTABANCARIA.IDCBANCARIA'
    end
    object qryLookDadosBancariosFLGCONTAPREF: TFloatField
      FieldName = 'FLGCONTAPREF'
      Origin = 'BASEDADOS.CONTABANCARIA.FLGCONTAPREF'
    end
    object qryLookDadosBancariosCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'BASEDADOS.CONTABANCARIA.CONTACORRENTE'
      Size = 15
    end
    object qryLookDadosBancariosNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.AGENCIABANCARIA.NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryLookDadosBancariosBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryLookTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TC.IDTIPOCONTREMPTMO,'
      '   TC.TCEDESCRICAO,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC,'
      '   TC.IDREGRASALBAS,'
      '   TC.FLGSITUACAO,'
      '   TC.FLGSUSPENSAO,'
      '   TC.FLGSEGURO,'
      '   TC.TCEMAXCONTRATO,'
      '   TC.TCEMAXINSCR,'
      '   TC.TCEMAXPARC,'
      '   TC.TCEMINPARC,'
      '   TC.TCEMINQUIT,'
      '   TC.TCEMINRENOVA,'
      ''
      '   TC.IDREPORTS,'
      ''
      '   TC.TCETRATAPARCATRAS,'
      '   TC.TCETRATAPARCPARC,'
      ''
      '   TE.IDTIPOEMPTMO,'
      '   TE.DESCTIPOEMPTMO,'
      '   TC.MOECODIGO,'
      '   TC.IDREGRADATACRED'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      ''
      'WHERE'
      '   ( TE.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO =:PIDTIPOE' +
        'MPTMO) )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      ''
      'ORDER BY'
      '   TC.TCEDESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 240
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
    object qryLookTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryLookTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEDESCRICAO'
      Size = 60
    end
    object qryLookTipoContratoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAJURCONC'
    end
    object qryLookTipoContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRALIMITES'
    end
    object qryLookTipoContratoIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRASUSPCOBR'
    end
    object qryLookTipoContratoIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRASLDDIA'
    end
    object qryLookTipoContratoIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAJURANTCONC'
    end
    object qryLookTipoContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAELEG'
    end
    object qryLookTipoContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRARESERVA'
    end
    object qryLookTipoContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAMARGEM'
    end
    object qryLookTipoContratoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAPRAZOSCONC'
    end
    object qryLookTipoContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryLookTipoContratoFLGSUSPENSAO: TStringField
      FieldName = 'FLGSUSPENSAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSUSPENSAO'
      FixedChar = True
      Size = 1
    end
    object qryLookTipoContratoFLGSEGURO: TStringField
      FieldName = 'FLGSEGURO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSEGURO'
      FixedChar = True
      Size = 1
    end
    object qryLookTipoContratoTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXCONTRATO'
    end
    object qryLookTipoContratoTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXINSCR'
    end
    object qryLookTipoContratoTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXPARC'
    end
    object qryLookTipoContratoTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMINPARC'
    end
    object qryLookTipoContratoTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMINQUIT'
    end
    object qryLookTipoContratoIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREPORTS'
    end
    object qryLookTipoContratoTCETRATAPARCATRAS: TStringField
      FieldName = 'TCETRATAPARCATRAS'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCETRATAPARCATRAS'
      FixedChar = True
      Size = 1
    end
    object qryLookTipoContratoTCETRATAPARCPARC: TStringField
      FieldName = 'TCETRATAPARCPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCETRATAPARCPARC'
      FixedChar = True
      Size = 1
    end
    object qryLookTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS."CM.TIPOEMPTMO".IDTIPOEMPTMO'
    end
    object qryLookTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS."CM.TIPOEMPTMO".DESCTIPOEMPTMO'
      Size = 60
    end
    object qryLookTipoContratoIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
    end
    object qryLookTipoContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryLookTipoContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryLookTipoContratoIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
    end
  end
  object qryLookTipoEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   E.IDTIPOEMPTMO, E.DESCTIPOEMPTMO,'
      '   E.IDEMPRESAPROP,'
      ''
      '   IDREGRAELEG, IDREGRAMARGEM, IDREGRARESERVA,'
      ''
      '   TEPMAXCONTRATO, TEPMAXINSCR,'
      '   TEPMAXPARC, TEPMINPARC, TEPMINQUIT, TEPMINRENOVA'
      ''
      'FROM'
      '   TIPOEMPTMO E'
      ''
      'WHERE'
      '   ( E.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      ''
      'ORDER BY'
      '   E.DESCTIPOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookTipoEmptmoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDTIPOEMPTMO'
    end
    object qryLookTipoEmptmoDESCTIPOEMPTMO: TStringField
      DisplayLabel = 'Tipo de Empréstimo'
      DisplayWidth = 30
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryLookTipoEmptmoIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDEMPRESAPROP'
    end
    object qryLookTipoEmptmoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDREGRAELEG'
    end
    object qryLookTipoEmptmoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDREGRAMARGEM'
    end
    object qryLookTipoEmptmoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDREGRARESERVA'
    end
    object qryLookTipoEmptmoTEPMAXCONTRATO: TFloatField
      FieldName = 'TEPMAXCONTRATO'
      Origin = 'BASEDADOS.TIPOEMPTMO.TEPMAXCONTRATO'
    end
    object qryLookTipoEmptmoTEPMAXINSCR: TFloatField
      FieldName = 'TEPMAXINSCR'
      Origin = 'BASEDADOS.TIPOEMPTMO.TEPMAXINSCR'
    end
    object qryLookTipoEmptmoTEPMAXPARC: TFloatField
      FieldName = 'TEPMAXPARC'
      Origin = 'BASEDADOS.TIPOEMPTMO.TEPMAXPARC'
    end
    object qryLookTipoEmptmoTEPMINPARC: TFloatField
      FieldName = 'TEPMINPARC'
      Origin = 'BASEDADOS.TIPOEMPTMO.TEPMINPARC'
    end
    object qryLookTipoEmptmoTEPMINQUIT: TFloatField
      FieldName = 'TEPMINQUIT'
      Origin = 'BASEDADOS.TIPOEMPTMO.TEPMINQUIT'
    end
    object qryLookTipoEmptmoTEPMINRENOVA: TFloatField
      FieldName = 'TEPMINRENOVA'
    end
  end
  object qryLookFormaRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FRP.CODFORMA,'
      '   FRP.RECPAG, FRP.DESCRICAO, FRP.IDPESSOA'
      ''
      'FROM'
      '   FORMARECPAG FRP'
      ''
      'WHERE'
      '   ( FRP.IDPESSOA =:PIDPESSOA )'
      '   AND ( FRP.RECPAG =:PRECPAG )'
      ''
      'ORDER BY'
      '   FRP.DESCRICAO')
    ValidateWithMask = True
    Left = 48
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end>
    object qryLookFormaRecPagDESCRICAO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryLookFormaRecPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object qryLookFormaRecPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookFormaRecPagIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORMARECPAG.IDPESSOA'
      Visible = False
    end
  end
  object qryLookPortadorFormaP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.CODPORTFORMA, PF.DESCRICAO'
      ''
      'FROM'
      '   PORTADORFORMA PF'
      ''
      'WHERE'
      '   ( PF.IDPESSOA =:PIDPESSOA )'
      '   AND ( PF.RECPAG = '#39'P'#39' )'
      ''
      'ORDER BY'
      '   PF.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaPCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
    end
    object qryLookPortadorFormaPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
  end
  object qryLookGrupoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   GR.IDGRUPOREGRA,'
      '   GR.DESCRICAO'
      ''
      'FROM'
      '   GRUPOREGRA GR'
      ''
      'ORDER BY'
      '   GR.DESCRICAO')
    ValidateWithMask = True
    Left = 48
    Top = 400
    object qryLookGrupoRegraDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.GRUPOREGRA.DESCRICAO'
      Size = 60
    end
    object qryLookGrupoRegraIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Origin = 'BASEDADOS.GRUPOREGRA.IDGRUPOREGRA'
      Visible = False
    end
  end
  object qryLookTipoCliente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TC.IDTIPOCLIENTE,'
      '   TC.DESCRICAO,'
      '   TC.CODREDUZIDO'
      ''
      'FROM'
      '   TIPOCLIENTE TC'
      ''
      'ORDER BY'
      '   TC.DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 344
    object qryLookTipoClienteDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object qryLookTipoClienteIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'BASEDADOS.TIPOCLIENTE.IDTIPOCLIENTE'
      Visible = False
    end
    object qryLookTipoClienteCODREDUZIDO: TStringField
      FieldName = 'CODREDUZIDO'
      Origin = 'BASEDADOS.TIPOCLIENTE.CODREDUZIDO'
      Visible = False
      Size = 3
    end
  end
  object qryLookPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PR.IDPROGRAMA,'
      '   PR.CODPROGRAMA, PR.DESCPROGRAMA'
      ''
      'FROM'
      '   PROGRAMA PR'
      ''
      'ORDER BY'
      '   PR.DESCPROGRAMA'
      ' ')
    ValidateWithMask = True
    Left = 240
    Top = 24
    object qryLookProgramaDESCPROGRAMA: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'BASEDADOS.PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryLookProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.PROGRAMA.IDPROGRAMA'
      Visible = False
    end
    object qryLookProgramaCODPROGRAMA: TStringField
      FieldName = 'CODPROGRAMA'
      Origin = 'BASEDADOS.PROGRAMA.CODPROGRAMA'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  object qryLookReports: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDREPORTS, R.NAME, R.ORIGEMCM'
      ''
      'FROM'
      '   REPORTS R'
      ''
      'WHERE'
      '   ( R.IDMODULO =:PIDMODULO )'
      '   AND ( (:PORIGEMCM IS NULL) OR (R.ORIGEMCM =:PORIGEMCM) )'
      ''
      'ORDER BY'
      '   R.NAME')
    ValidateWithMask = True
    Left = 239
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptInput
      end>
    object qryLookReportsNAME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 1
      FieldName = 'NAME'
      Origin = 'BASEDADOS.REPORTS.NAME'
      Size = 100
    end
    object qryLookReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.REPORTS.IDREPORTS'
      Visible = False
    end
  end
  object qryLookTipoRecebDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      ''
      'FROM'
      '   TIPORECEBDESEMB'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ( RECPAG =:PRECPAG )'
      '   AND ( ANASINT = '#39'A'#39' )'
      ''
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptInput
      end>
    object StringField12: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object StringField13: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object StringField14: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookTipoDocRecDevol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      ''
      'FROM'
      '   TIPODOCRECPAG'
      ''
      'WHERE'
      '   ( RECPAG = '#39'R'#39' )'
      '   AND ( DEBCRE = '#39'C'#39' )'
      ''
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 136
    object StringField15: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object FloatField2: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object StringField16: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPODOCRECPAG.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField17: TStringField
      FieldName = 'DEBCRE'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DEBCRE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryLookTipoDocRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      ''
      'FROM'
      '   TIPODOCRECPAG'
      ''
      'WHERE'
      '   ( RECPAG = '#39'R'#39' )'
      '   AND ( DEBCRE = '#39'D'#39' )'
      ''
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 88
    object StringField18: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object FloatField3: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object StringField19: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPODOCRECPAG.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField20: TStringField
      FieldName = 'DEBCRE'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DEBCRE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryLookTipoDocPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      ''
      'FROM'
      '   TIPODOCRECPAG'
      ''
      'WHERE'
      '   ( RECPAG = '#39'P'#39' )'
      '   AND ( DEBCRE = '#39'C'#39' )'
      ''
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 344
    Top = 40
    object StringField21: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object FloatField4: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object StringField22: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPODOCRECPAG.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField23: TStringField
      FieldName = 'DEBCRE'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DEBCRE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryLookRubricaAtraso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROVENTO, DESCRICAO'
      'FROM'
      '   PROVDESC'
      'WHERE'
      '   ( FLGTPRUBRICA LIKE '#39'%E%'#39' )'
      '   AND ( FLGDESCONTO =:PFLGDESCONTO )'
      '   AND ( FLGATRASODEVOL = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGDESCONTO'
        ParamType = ptInput
      end>
    object StringField24: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 1
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object FloatField5: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
      Visible = False
    end
  end
  object qryLookRubricaDevol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROVENTO, DESCRICAO'
      'FROM'
      '   PROVDESC'
      'WHERE'
      '   ( FLGTPRUBRICA LIKE '#39'%E%'#39' )'
      '   AND ( FLGDESCONTO = 0 )'
      '   AND ( FLGATRASODEVOL = '#39'D'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 168
    object StringField26: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 1
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object FloatField7: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
      Visible = False
    end
  end
  object qryLookRubricaInforma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPROVENTO, DESCRICAO'
      'FROM'
      '   PROVDESC'
      'WHERE'
      '   ( FLGTPRUBRICA LIKE '#39'%E%'#39' )'
      '   AND ( FLGDESCONTO = 2 )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 216
    object StringField27: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 1
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object FloatField8: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
      Visible = False
    end
  end
  object qryLookItemEmprestimo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDITEMEMPTMO, ITEDESCRICAO'
      'FROM '
      '   ITEMEMPTMO'
      'ORDER BY '
      '   ITEDESCRICAO')
    ValidateWithMask = True
    Left = 48
    Top = 448
    object qryLookItemEmprestimoITEDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryLookItemEmprestimoIDITEMEMPTMO: TFloatField
      DisplayLabel = 'Código do Item'
      DisplayWidth = 10
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
  end
  object qryLookSitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SIT.IDSITPART,'
      '   SIT.DESCRICAO,'
      '   SIT.FLGINTERNO,'
      '   SIT.FLGTIPO'
      'FROM'
      '   SITPART SIT'
      'ORDER BY'
      '   SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 312
    object qryLookSitPartIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.SITPART.IDSITPART'
    end
    object qryLookSitPartDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITPART.DESCRICAO'
      Size = 50
    end
    object qryLookSitPartFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryLookSitPartFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Origin = 'BASEDADOS.SITPART.FLGTIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qryLookSitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SPP.IDSITPLANOPREV,'
      '   SPP.DESCRICAO,'
      '   SPP.FLGINTERNO'
      'FROM'
      '   SITPLANOPREV SPP'
      'ORDER BY'
      '   SPP.DESCRICAO')
    ValidateWithMask = True
    Left = 240
    Top = 298
    object qryLookSitPlanoPrevIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
      Origin = 'BASEDADOS.SITPLANOPREV.IDSITPLANOPREV'
    end
    object qryLookSitPlanoPrevDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryLookSitPlanoPrevFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPLANOPREV.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
  end
  object qryLookTipoSusp: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    TSE.IDTIPOSUSPEMPTMO,       '
      '    TSE.IDREGRAENVIOPARC,       '
      '    TSE.IDREGRARECALCIOF,       '
      '    TSE.IDREGRARECALCSEG,       '
      '    TSE.IDREGRAVALIDSUSP,       '
      '    TSE.TSEDESCRICAO,           '
      '    TSE.TSEMESES,               '
      '    TSE.TSEINICIOSUSP,'
      '    TSE.TSEFINALSUSP,           '
      '    TSE.IDRUBRICAADFERIAS,'
      '    TSE.FLGGERAPARCELAS,        '
      '    TSE.FLGATUALSALDOPARC,'
      '    TSE.FLGSUSPCONCESSAO,       '
      '    TSE.FLGCOBRAENCARGOS,       '
      '    TSE.FLGDEDUZPARCREST,       '
      '    TSE.FLGATUALSALDOENV '
      'FROM'
      '    TIPOSUSPEMPTMO TSE,'
      '    TIPOCONTRXSUSP TCS'
      'WHERE'
      '    TCS.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'
      'AND TSE.IDTIPOSUSPEMPTMO = TCS.IDTIPOSUSPEMPTMO')
    ValidateWithMask = True
    Left = 352
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryLookTipoSuspTSEDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'TSEDESCRICAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEDESCRICAO'
      Size = 60
    end
    object qryLookTipoSuspIDTIPOSUSPEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDTIPOSUSPEMPTMO'
      Visible = False
    end
    object qryLookTipoSuspIDREGRAENVIOPARC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAENVIOPARC'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRAENVIOPARC'
      Visible = False
    end
    object qryLookTipoSuspIDREGRARECALCIOF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRARECALCIOF'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRARECALCIOF'
      Visible = False
    end
    object qryLookTipoSuspIDREGRARECALCSEG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRARECALCSEG'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRARECALCSEG'
      Visible = False
    end
    object qryLookTipoSuspIDREGRAVALIDSUSP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAVALIDSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRAVALIDSUSP'
      Visible = False
    end
    object qryLookTipoSuspTSEMESES: TFloatField
      DisplayWidth = 10
      FieldName = 'TSEMESES'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEMESES'
      Visible = False
    end
    object qryLookTipoSuspTSEINICIOSUSP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TSEINICIOSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEINICIOSUSP'
      Visible = False
    end
    object qryLookTipoSuspTSEFINALSUSP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TSEFINALSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEFINALSUSP'
      Visible = False
    end
    object qryLookTipoSuspIDRUBRICAADFERIAS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBRICAADFERIAS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDRUBRICAADFERIAS'
      Visible = False
    end
    object qryLookTipoSuspFLGGERAPARCELAS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERAPARCELAS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGGERAPARCELAS'
      Visible = False
    end
    object qryLookTipoSuspFLGATUALSALDOPARC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGATUALSALDOPARC'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGATUALSALDOPARC'
      Visible = False
    end
    object qryLookTipoSuspFLGSUSPCONCESSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSUSPCONCESSAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGSUSPCONCESSAO'
      Visible = False
    end
    object qryLookTipoSuspFLGCOBRAENCARGOS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCOBRAENCARGOS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGCOBRAENCARGOS'
      Visible = False
    end
    object qryLookTipoSuspFLGDEDUZPARCREST: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGDEDUZPARCREST'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGDEDUZPARCREST'
      Visible = False
    end
    object qryLookTipoSuspFLGATUALSALDOENV: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGATUALSALDOENV'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGATUALSALDOENV'
      Visible = False
    end
  end
end
