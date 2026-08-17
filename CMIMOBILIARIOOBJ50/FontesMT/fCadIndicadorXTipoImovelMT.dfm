inherited frmCadIndicadorXTipoImovelMT: TfrmCadIndicadorXTipoImovelMT
  HelpContext = 640054
  Caption = 'Indicadores por Tipo de Imóvel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    HelpContext = 640054
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
      Width = 54
      Height = 13
      Caption = 'Indicador'
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
    object wwDBEdit1: TwwDBEdit
      Left = 48
      Top = 47
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 48
      Top = 128
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'INMDESCRICAO'#9'60'#9'Indicador'#9'F')
      DataField = 'IDINDICADORIMOVEL'
      DataSource = ds
      LookupTable = CdsIndicador
      LookupField = 'IDINDICADORIMOVEL'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'T.CODTIPIMOVEL'
      'T.DESCTIPOIMOVEL'
      'I.INMDESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo Imóvel'
      'Indicador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDICADORIMOVEL I'
      'TIPOIMOVEL T'
      'INDICADORXTIPOIMO IT')
    CamposChave.Strings = (
      'IT.CODTIPIMOVEL'
      'IT.IDINDICADORIMOVEL'
      'T.DESCTIPOIMOVEL'
      'I.INMDESCRICAO')
    Filtro.Strings = (
      'IT.CODTIPIMOVEL = T.CODTIPIMOVEL'
      'IT.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '25'
      '60')
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
  object CdsIndicador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 159
    object CdsIndicadorINMDESCRICAO: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object CdsIndicadorIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
end
