inherited frmCadLinha: TfrmCadLinha
  Left = 188
  Top = 189
  HelpContext = 210032
  Caption = 'Cadastro de Linhas de Transporte'
  ClientHeight = 236
  ClientWidth = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 150
    BorderWidth = 2
    object Label7: TLabel
      Left = 16
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label11: TLabel
      Left = 139
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label9: TLabel
      Left = 16
      Top = 54
      Width = 109
      Height = 13
      Caption = 'Tipo de Transporte'
    end
    object Label12: TLabel
      Left = 314
      Top = 54
      Width = 78
      Height = 13
      Caption = 'Valor Unitário'
    end
    object Label10: TLabel
      Left = 16
      Top = 97
      Width = 74
      Height = 13
      Caption = 'Número/Ref.'
    end
    object Label8: TLabel
      Left = 111
      Top = 97
      Width = 132
      Height = 13
      Caption = 'Empresa de Transporte'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 114
      Height = 21
      DataField = 'IDLINHATRANSP'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 139
      Top = 26
      Width = 296
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbcmbTipoTransp: TDBComboBox
      Left = 16
      Top = 69
      Width = 286
      Height = 21
      Style = csDropDownList
      DataField = 'TIPOLINHATRANSP'
      DataSource = ds
      DropDownCount = 7
      ItemHeight = 13
      Items.Strings = (
        'Ônibus'
        'Bonde'
        'Metrô'
        'Barca'
        'Trem'
        'Outros'
        'Cartão')
      TabOrder = 2
    end
    object dbredValorUnit: TDBRealEdit
      Left = 314
      Top = 69
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,90')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRLINHATRANSP'
      DataSource = ds
    end
    object dbedNumRef: TDBEdit
      Left = 16
      Top = 112
      Width = 85
      Height = 21
      DataField = 'NUMLINHATRANSP'
      DataSource = ds
      TabOrder = 4
    end
    object dblcEmpre: TwwDBLookupCombo
      Left = 111
      Top = 112
      Width = 324
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      DataField = 'IDPESSOA'
      DataSource = ds
      LookupTable = CdsEmprTransp
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 452
  end
  inherited Dock971: TDock97
    Top = 197
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 282
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 115
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 380
    Top = 14
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 380
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Linha de Transporte'
    Colunas.Strings = (
      'LINHATRANSP.IDLINHATRANSP'
      'LINHATRANSP.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LINHATRANSP')
    CamposChave.Strings = (
      'LINHATRANSP.IDLINHATRANSP')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
  object CdsEmprTransp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 44
    Top = 191
  end
end
