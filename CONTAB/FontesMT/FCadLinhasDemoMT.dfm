inherited frmCadLinhasDemoMT: TfrmCadLinhasDemoMT
  Left = 183
  Caption = 'Cadastro de Linhas do Demonstrativo Colunado'
  ClientHeight = 244
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 490
    Height = 158
    object Label4: TLabel
      Left = 24
      Top = 24
      Width = 82
      Height = 13
      Caption = 'Demonstrativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 392
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Ordem'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 111
      Height = 13
      Caption = 'Descrição da Linha'
    end
    object dblkDemo: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 353
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
      DataField = 'IDDEMONSTRATIVO'
      DataSource = ds
      LookupTable = CdsDemonstrativo
      LookupField = 'IDDEMONSTRATIVO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkDemoCloseUp
      OnExit = dblkDemoExit
    end
    object dbrOrdem: TDBRealEdit
      Left = 392
      Top = 40
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 5
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
      DataField = 'ORDEMLINHA'
      DataSource = ds
    end
    object dbeDescLinha: TwwDBEdit
      Left = 24
      Top = 80
      Width = 281
      Height = 21
      DataField = 'NOMELINHA'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbckLinhaMonetaria: TDBCheckBox
      Left = 24
      Top = 112
      Width = 129
      Height = 17
      Caption = 'Linha Monetária'
      DataField = 'FLGMONETARIA'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbrgPassaTraco: TDBRadioGroup
      Left = 164
      Top = 106
      Width = 302
      Height = 37
      Caption = ' Traço '
      Columns = 3
      DataField = 'FLGPASSATRACO'
      DataSource = ds
      Items.Strings = (
        '&Não Passa'
        '&Simples'
        '&Duplo')
      TabOrder = 4
      Values.Strings = (
        'N'
        'S'
        'D')
    end
    object dbrgNatureza: TDBRadioGroup
      Left = 320
      Top = 66
      Width = 145
      Height = 37
      Caption = ' Natureza  da Linha '
      Columns = 2
      DataField = 'FLGNATUREZA'
      DataSource = ds
      Items.Strings = (
        'Débito'
        'Crédito')
      TabOrder = 5
      Values.Strings = (
        'D'
        'C')
    end
  end
  inherited Dock972: TDock97
    Width = 490
  end
  inherited Dock971: TDock97
    Top = 205
    Width = 490
    inherited tb97Fundo: TToolbar97
      Left = 318
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 149
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 207
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 207
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 368
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterInsert = CdsAfterInsert
    Left = 300
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEMLINHA.NOMELINHA'
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      'DEMLINHA.ORDEMLINHA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição da Linha'
      'Demonstrativo'
      'Ordem da Linha')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEMONSTRATIVO'
      'DEMLINHA')
    CamposChave.Strings = (
      'DEMLINHA.IDLINHA')
    Filtro.Strings = (
      'DEMLINHA.IDDEMONSTRATIVO = DEMONSTRATIVO.IDDEMONSTRATIVO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '60'
      '10')
    Left = 424
    Top = 7
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 71
  end
end
