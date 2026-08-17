inherited frmCadDemo2ColunasMT: TfrmCadDemo2ColunasMT
  Left = 214
  Top = 123
  Caption = 'Cadastro dos Elementos do Balanço Patrimonial'
  ClientHeight = 389
  ClientWidth = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 561
    Height = 303
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Demonstrativo'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label4: TLabel
      Left = 288
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Posição'
    end
    object Label3: TLabel
      Left = 288
      Top = 56
      Width = 53
      Height = 13
      Caption = 'Elemento'
    end
    object wwDBGrid1: TwwDBGrid
      Left = 24
      Top = 112
      Width = 513
      Height = 169
      Selected.Strings = (
        'POSICAO'#9'23'#9'Posição'#9'F'
        'EBPDESCRICAO'#9'36'#9'Descrição'#9'F'
        'ELEDESCELEM'#9'60'#9'Elemento'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsGrid
      TabOrder = 4
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object dblkDemonstrativo: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DEMDESCDEMONSTRAT'#9'60'#9'Descrição'#9'F')
      DataField = 'IDDEMONSTRATIVO'
      DataSource = ds
      LookupTable = CdsDemonstrativo
      LookupField = 'IDDEMONSTRATIVO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkDemonstrativoCloseUp
      OnExit = dblkDemonstrativoExit
    end
    object cboPosicao: TComboBox
      Left = 288
      Top = 32
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Posição #01 - 1ª coluna'
        'Posição #02 - 1ª coluna'
        'Posição #03 - 1ª coluna'
        'Posição #04 - 1ª coluna'
        'Posição #05 - 1ª coluna'
        'Posição #06 - 1ª coluna'
        'Posição #07 - 1ª coluna'
        'Posição #08 - 1ª coluna'
        'Posição #09 - 1ª coluna'
        'Posição #10 - 1ª coluna'
        'Posição #11 - 1ª coluna'
        'Posição #12 - 1ª coluna'
        'Posição #13 - 1ª coluna'
        'Posição #14 - 1ª coluna'
        'Posição #15 - 1ª coluna'
        'Posição #16 - 1ª coluna'
        'Posição #17 - 1ª coluna'
        'Posição #18 - 1ª coluna'
        'Posição #19 - 1ª coluna'
        'Posição #20 - 1ª coluna'
        'Posição #21 - 1ª coluna'
        'Posição #22 - 1ª coluna'
        'Posição #23 - 1ª coluna'
        'Posição #24 - 1ª coluna'
        'Posição #25 - 1ª coluna'
        'Posição #26 - 1ª coluna'
        'Posição #27 - 1ª coluna'
        'Posição #28 - 1ª coluna'
        'Posição #29 - 1ª coluna'
        'Posição #30 - 1ª coluna'
        'Posição #31 - 1ª coluna'
        'Posição #32 - 1ª coluna'
        'Posição #33 - 1ª coluna'
        'Posição #34 - 1ª coluna'
        'Posição #35 - 1ª coluna'
        'Posição #36 - 1ª coluna'
        'Posição #37 - 1ª coluna'
        'Posição #38 - 1ª coluna'
        'Posição #39 - 1ª coluna'
        'Posição #40 - 1ª coluna'
        'Posição #01 - 2ª coluna'
        'Posição #02 - 2ª coluna'
        'Posição #03 - 2ª coluna'
        'Posição #04 - 2ª coluna'
        'Posição #05 - 2ª coluna'
        'Posição #06 - 2ª coluna'
        'Posição #07 - 2ª coluna'
        'Posição #08 - 2ª coluna'
        'Posição #09 - 2ª coluna'
        'Posição #10 - 2ª coluna'
        'Posição #11 - 2ª coluna'
        'Posição #12 - 2ª coluna'
        'Posição #13 - 2ª coluna'
        'Posição #14 - 2ª coluna'
        'Posição #15 - 2ª coluna'
        'Posição #16 - 2ª coluna'
        'Posição #17 - 2ª coluna'
        'Posição #18 - 2ª coluna'
        'Posição #19 - 2ª coluna'
        'Posição #20 - 2ª coluna'
        'Posição #21 - 2ª coluna'
        'Posição #22 - 2ª coluna'
        'Posição #23 - 2ª coluna'
        'Posição #24 - 2ª coluna'
        'Posição #25 - 2ª coluna'
        'Posição #26 - 2ª coluna'
        'Posição #27 - 2ª coluna'
        'Posição #28 - 2ª coluna'
        'Posição #29 - 2ª coluna'
        'Posição #30 - 2ª coluna'
        'Posição #31 - 2ª coluna'
        'Posição #32 - 2ª coluna'
        'Posição #33 - 2ª coluna'
        'Posição #34 - 2ª coluna'
        'Posição #35 - 2ª coluna'
        'Posição #36 - 2ª coluna'
        'Posição #37 - 2ª coluna'
        'Posição #38 - 2ª coluna'
        'Posição #39 - 2ª coluna'
        'Posição #40 - 2ª coluna')
    end
    object dblkElemento: TwwDBLookupCombo
      Left = 288
      Top = 72
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ELEDESCELEM'#9'60'#9'Descrição')
      DataField = 'IDELEMDEMONSTRAT'
      DataSource = ds
      LookupTable = CdsElemento
      LookupField = 'IDELEMDEMONSTRAT'
      DropDownWidth = 8
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeDescricao: TwwDBEdit
      Left = 24
      Top = 72
      Width = 249
      Height = 21
      DataField = 'EBPDESCRICAO'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 561
  end
  inherited Dock971: TDock97
    Top = 350
    Width = 561
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 351
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 351
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      'ELEMDEMONSTRATIVO.ELEDESCELEM'
      'ELEMBALPATR.ELEPOSICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Demonstrativo'
      'Elemento'
      'Posição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEMONSTRATIVO'
      'ELEMDEMONSTRATIVO'
      'ELEMBALPATR')
    CamposChave.Strings = (
      'ELEMBALPATR.IDELEMBALPATR'
      'DEMONSTRATIVO.IDDEMONSTRATIVO')
    Filtro.Strings = (
      'DEMONSTRATIVO.IDDEMONSTRATIVO = ELEMBALPATR.IDDEMONSTRATIVO'
      
        'ELEMDEMONSTRATIVO.IDELEMDEMONSTRAT = ELEMBALPATR.IDELEMDEMONSTRA' +
        'T')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10')
    Left = 448
    Top = 7
  end
  object CdsGrid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 207
  end
  object dsGrid: TDataSource
    DataSet = CdsGrid
    Left = 256
    Top = 207
  end
  object CdsElemento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 111
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 63
  end
end
