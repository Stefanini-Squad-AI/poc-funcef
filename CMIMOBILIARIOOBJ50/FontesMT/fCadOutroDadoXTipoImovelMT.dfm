inherited frmCadOutroDadoXTipoImovelMT: TfrmCadOutroDadoXTipoImovelMT
  Left = 150
  Top = 256
  HelpContext = 640048
  Caption = 'Dados Complementares por Tipo de Imóvel'
  ClientHeight = 283
  ClientWidth = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 493
    Height = 197
    object Label1: TLabel
      Left = 144
      Top = 32
      Width = 67
      Height = 13
      Caption = 'Tipo Imóvel'
    end
    object Label2: TLabel
      Left = 48
      Top = 112
      Width = 161
      Height = 13
      Caption = 'Tipo de Dado Complementar'
    end
    object Label3: TLabel
      Left = 48
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 144
      Top = 48
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODTIPIMOVEL'#9'10'#9'Código'#9'F'
        'DESCTIPOIMOVEL'#9'25'#9'Tipo Imóvel'#9'F')
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      LookupTable = CdsTipoImovel
      LookupField = 'CODTIPIMOVEL'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 48
      Top = 128
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ODODESCRICAO'#9'40'#9'Dado Complementar'#9'F')
      DataField = 'IDOUTRODADO'
      DataSource = ds
      LookupTable = CdsOutroDado
      LookupField = 'IDOUTRODADO'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 48
      Top = 47
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 493
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 493
    inherited tb97Fundo: TToolbar97
      Left = 323
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
  end
  inherited ImlPadrao: TImageList
    Left = 0
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 92
    Top = 39
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOIMOVEL.CODTIPIMOVEL'
      'TIPOIMOVEL.DESCTIPOIMOVEL'
      'OUTRODADO.ODODESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo Imóvel'
      'Dado Complementar')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOIMOVEL'
      'OUTRODADO'
      'OUTRODADOXTIPOIMO')
    CamposChave.Strings = (
      'OUTRODADOXTIPOIMO.CODTIPIMOVEL'
      'OUTRODADOXTIPOIMO.IDOUTRODADO')
    Filtro.Strings = (
      'OUTRODADOXTIPOIMO.CODTIPIMOVEL = TIPOIMOVEL.CODTIPIMOVEL'
      'OUTRODADOXTIPOIMO.IDOUTRODADO = OUTRODADO.IDOUTRODADO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '25'
      '40')
    Left = 440
    Top = 7
  end
  object CdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 79
    object CdsTipoImovelCODTIPIMOVEL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsTipoImovelDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 25
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object CdsOutroDado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 159
    object CdsOutroDadoODODESCRICAO: TStringField
      DisplayLabel = 'Dado Complementar'
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object CdsOutroDadoIDOUTRODADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
  end
end
