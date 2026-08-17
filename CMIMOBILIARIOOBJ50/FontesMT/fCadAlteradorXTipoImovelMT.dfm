inherited frmCadAlteradorXTipoImovelMT: TfrmCadAlteradorXTipoImovelMT
  Left = 129
  HelpContext = 640041
  Caption = 'Alteradores por Tipo de Imóvel'
  ClientWidth = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    object Label3: TLabel
      Left = 48
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 144
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Tipo Imóvel'
    end
    object Label2: TLabel
      Left = 48
      Top = 80
      Width = 52
      Height = 13
      Caption = 'Alterador'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 48
      Top = 39
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 144
      Top = 40
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
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object DBcboAlterador: TwwDBLookupCombo
      Left = 48
      Top = 96
      Width = 383
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'#9'F')
      DataField = 'CODALTERADOR'
      DataSource = ds
      LookupTable = CdsAlterador
      LookupField = 'CODALTERADOR'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 48
      Top = 136
      Width = 385
      Height = 41
      Columns = 2
      DataField = 'RECPAG'
      DataSource = dsAlterador
      Items.Strings = (
        'Receber'
        'Pagar')
      ReadOnly = True
      TabOrder = 3
      Values.Strings = (
        'R'
        'P')
    end
  end
  inherited Dock972: TDock97
    Width = 486
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 486
    inherited tb97Fundo: TToolbar97
      Left = 316
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 149
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    object CdsCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object CdsRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'T.CODTIPIMOVEL'
      'T.DESCTIPOIMOVEL'
      'A.DESCRICAO'
      'A.RECPAG')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Cód. Tipo Imóvel'
      'Tipo Imóvel'
      'Alterador'
      '(R)eceber / (P)agar')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ALTERADORXTIPOIMO AT'
      'TIPOALTERADOR A'
      'TIPOIMOVEL T')
    CamposChave.Strings = (
      'AT.CODTIPIMOVEL'
      'AT.CODALTERADOR')
    Filtro.Strings = (
      'AT.CODALTERADOR = A.CODALTERADOR'
      'AT.CODTIPIMOVEL = T.CODTIPIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '25'
      '35'
      '1')
  end
  object CdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 71
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
  object CdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 293
    Top = 124
    object CdsAlteradorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object CdsAlteradorRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object CdsAlteradorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   AXT.CODTIPIMOVEL, AXT.CODALTERADOR,'
      '   T.DESCRICAO, T.ACRESDECRES, T.RECPAG'
      ''
      'FROM'
      '   ALTERADORXTIPOIMO AXT, TIPOALTERADOR T'
      ''
      'WHERE'
      '   ( AXT.CODTIPIMOVEL ='#39'RENDA'#39' )'
      '   AND ( T.IDPESSOA =2 )'
      '   AND ( AXT.CODALTERADOR = T.CODALTERADOR )'
      ''
      'ORDER BY'
      '   T.DESCRICAO')
    ValidateWithMask = True
    Left = 440
    Top = 71
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 448
    Top = 119
  end
  object dsAlterador: TwwDataSource
    DataSet = CdsAlterador
    Left = 352
    Top = 127
  end
end
