inherited FrmCadTipoRegraMT: TFrmCadTipoRegraMT
  Left = 303
  Top = 60
  HelpContext = 450010
  Caption = 'Tipos de Regras MT'
  ClientHeight = 444
  ClientWidth = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 530
    Height = 358
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 72
      Height = 13
      Caption = 'Identificador'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 93
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label4: TLabel
      Left = 10
      Top = 53
      Width = 91
      Height = 13
      Caption = 'Grupo de Regra'
    end
    object Label3: TLabel
      Left = 10
      Top = 98
      Width = 81
      Height = 13
      Caption = 'SQL da Regra'
    end
    object EdCodigo: TDBEdit
      Left = 10
      Top = 29
      Width = 79
      Height = 21
      Color = clBtnFace
      DataField = 'IDTIPOREGRA'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdDescricao: TwwDBEdit
      Left = 93
      Top = 29
      Width = 428
      Height = 21
      DataField = 'DESCREGRA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbLkcGrupoRegra: TwwDBLookupCombo
      Left = 11
      Top = 69
      Width = 511
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = CdsGrpRegra
      LookupField = 'IDGRUPOREGRA'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object MemoSQL: TDBMemo
      Left = 10
      Top = 114
      Width = 509
      Height = 234
      DataField = 'SQLREGRA'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 530
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 530
    inherited tb97Fundo: TToolbar97
      Left = 360
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 405
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 374
    Top = 135
  end
  inherited ImlPadrao: TImageList
    Left = 376
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 347
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 404
    Top = 135
    object CdsIDTIPOREGRA: TFloatField
      FieldName = 'IDTIPOREGRA'
    end
    object CdsDESCREGRA: TStringField
      FieldName = 'DESCREGRA'
      Size = 60
    end
    object CdsIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object CdsSQLREGRA: TMemoField
      FieldName = 'SQLREGRA'
      BlobType = ftMemo
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOREGRA.IDTIPOREGRA'
      'TIPOREGRA.DESCREGRA'
      'GRUPOREGRA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição do Tipo de Regra'
      'Descrição do Grupo de Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOREGRA'
      'GRUPOREGRA')
    CamposChave.Strings = (
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'TIPOREGRA.IDGRUPOREGRA = GRUPOREGRA.IDGRUPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    ExibePergunta = False
    Left = 433
    Top = 7
  end
  object IvExtendedTranslator1: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 24
    Top = 46
    TargetsData = (
      1
      3
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object IvExtendedTranslator2: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 24
    Top = 46
    TargetsData = (
      1
      3
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object DsGrupoRegra: TwwDataSource
    AutoEdit = False
    DataSet = CdsGrpRegra
    Left = 374
    Top = 167
  end
  object CdsGrpRegra: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 167
    Data = {
      FA0000009619E0BD0100000018000000020006000000030000005A000C494447
      5255504F524547524108000400000000000944455343524943414F0100490000
      000100055749445448020002003C000100044C43494404000100090800000000
      000000000000F03F0A42454E45464943494F5300000000000000000040084341
      44415354524F000000000000000008400B454D5052C95354494D4F5300000000
      0000000010401D464F4C484120444520504147414D454E544F20454D50524547
      41444F5300000000000000001C4020464F4C484120444520504147414D454E54
      4F20444520454D5052454741444F530000000000000000144004494E5353}
    object CdsGrpRegraDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsGrpRegraIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Visible = False
    end
  end
end
