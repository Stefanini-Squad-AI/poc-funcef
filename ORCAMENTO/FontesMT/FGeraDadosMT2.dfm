inherited frmGeraDadosMT2: TfrmGeraDadosMT2
  Left = 102
  Top = 195
  HelpContext = 520078
  Caption = 'Geração dos Dados - MT2'
  ClientHeight = 428
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 389
    object lblExercicio: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblPeriodo: TLabel
      Left = 104
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label1: TLabel
      Left = 24
      Top = 242
      Width = 130
      Height = 13
      Caption = 'Contas não calculadas'
    end
    object imgAguarde: TImage
      Left = 223
      Top = 32
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000001000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF0077777700000000000000000007777777777770777FFF7777788888877077
        7777777777007F7880000000087007777777777777770773BB33388377077777
        7777777777770733BB333883370777777777777777770733BB33388337077777
        7777777777770733BB333883370777777777777777770733BB33388337077777
        7777777777770733BB333883370777777777777777770733BB33388337077777
        7777777777770773BB3338837707777777777777777770777FB3377770777777
        777777777777770077F377700777777777777777777777770777770777777777
        7777777777777777707770777777777777777777777777777707077777777777
        7777777777777777770707777777777777777777777777777077707777777777
        777777777777777707F377077777777777777777777777007F33377007777777
        7777777777777077FBB7737770777777777777777777077FF777778877077777
        777777777777077FF777778877077777777777777777077FF777778877077777
        777777777777077FF777778877077777777777777777077FF777778877077777
        777777777777077FF777778877077777777777777777077FF777778877077777
        777777777777077777777777770777777777777777007F700000000008700777
        7777777770777FFF777777788888707777777777770000000000000000000777
        7777}
      Transparent = True
    end
    object Label3: TLabel
      Left = 234
      Top = 178
      Width = 168
      Height = 13
      Caption = 'Calcular as Contas - Posição:'
    end
    object lblCenario: TLabel
      Left = 24
      Top = 177
      Width = 44
      Height = 13
      Caption = 'Cenário'
    end
    object Label7: TLabel
      Left = 234
      Top = 194
      Width = 35
      Height = 13
      Caption = 'Inicial'
    end
    object Label8: TLabel
      Left = 291
      Top = 194
      Width = 42
      Height = 13
      Caption = 'Dígitos'
    end
    object Label9: TLabel
      Left = 354
      Top = 194
      Width = 55
      Height = 13
      Caption = 'Conteúdo'
    end
    object pnlErroNaGeracao: TPanel
      Left = 24
      Top = 71
      Width = 480
      Height = 140
      Caption = 'pnlErroNaGeracao'
      TabOrder = 14
      Visible = False
      object memErroNaGeracao: TRichEdit
        Left = 10
        Top = 10
        Width = 460
        Height = 120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = memErroNaGeracaoChange
      end
    end
    object pnlAguarde: TPanel
      Left = 24
      Top = 193
      Width = 199
      Height = 17
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Painel invisível'
      TabOrder = 6
    end
    object pbAguarde: TProgressBar
      Left = 280
      Top = 48
      Width = 224
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 3
    end
    object dsNaoCalculadas: TwwDBGrid
      Left = 24
      Top = 257
      Width = 481
      Height = 122
      Selected.Strings = (
        'IDCONTAORCAMEN'#9'12'#9'Código '
        'NOMECONTAORCAMEN'#9'31'#9'Nome da Conta'
        'TipoOrc'#9'16'#9'Calculo do Orçado'
        'TipoReal'#9'16'#9'Cálculo do Realizado')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds
      TabOrder = 5
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
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'EXERCICIO')
      LookupTable = CdsExercicio
      LookupField = 'EXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnClick = dblkExercicioClick
      OnExit = dblkExercicioClick
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 32
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      LookupTable = CdsPeriodoIni
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cbCalcMes: TCheckBox
      Left = 24
      Top = 70
      Width = 193
      Height = 17
      Caption = 'Calcula por Período'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbBuscaSaldoAnterior: TCheckBox
      Left = 279
      Top = 70
      Width = 208
      Height = 17
      Caption = 'Calcula Saldo Anterior'
      TabOrder = 8
    end
    object sePosIni1: TwwDBSpinEdit
      Left = 234
      Top = 209
      Width = 49
      Height = 21
      Increment = 1
      TabOrder = 9
      UnboundDataType = wwDefault
    end
    object sePosFim1: TwwDBSpinEdit
      Left = 291
      Top = 209
      Width = 49
      Height = 21
      Increment = 1
      TabOrder = 10
      UnboundDataType = wwDefault
    end
    object edConteudo1: TEdit
      Left = 354
      Top = 209
      Width = 124
      Height = 21
      TabOrder = 11
    end
    object dblcCenario: TwwDBLookupCombo
      Left = 24
      Top = 191
      Width = 191
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMECENARIO'#9'60'#9'Nome do Cenário'#9'F')
      LookupTable = CdsCenario
      LookupField = 'IDCENARIOORCAMEN'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCenarioCloseUp
    end
    object edtStatus: TEdit
      Left = 232
      Top = 16
      Width = 281
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 13
      Text = 'Aguarde enquanto os dados são processados...'
      OnChange = daRepaint
    end
    object Panel1: TPanel
      Left = 232
      Top = 98
      Width = 273
      Height = 73
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object Label2: TLabel
        Left = 16
        Top = 30
        Width = 123
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Processando Tipo : '
      end
      object Label5: TLabel
        Left = 16
        Top = 50
        Width = 123
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Processando Conta : '
      end
      object Label6: TLabel
        Left = 16
        Top = 10
        Width = 123
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Processando Dia : '
      end
      object edtData: TEdit
        Left = 140
        Top = 10
        Width = 121
        Height = 18
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'edtData'
        OnChange = daRepaint
      end
      object edtTipo: TEdit
        Left = 140
        Top = 30
        Width = 121
        Height = 18
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = 'edtTipo'
        OnChange = daRepaint
      end
      object edtConta: TEdit
        Left = 140
        Top = 50
        Width = 121
        Height = 18
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = 'edtConta'
        OnChange = daRepaint
      end
    end
    object rgrpTipo: TRadioGroup
      Left = 24
      Top = 93
      Width = 193
      Height = 78
      Caption = 'Geração dos Dados'
      ItemIndex = 0
      Items.Strings = (
        'Somente Orçados'
        'Somente Realizados'
        'Orçados && Realizados')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 532
    inherited tb97Fundo: TToolbar97
      DockPos = 356
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520078
      end
    end
    inherited TB97oKCancelar: TToolbar97
      DockPos = 187
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 243
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ds: TwwDataSource
    DataSet = CdsNaoCalculadas
    Left = 112
    Top = 320
  end
  object CdsNaoCalculadas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 170
    Top = 320
  end
  object CdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 320
  end
  object CdsPeriodoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 286
    Top = 320
  end
  object CdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 320
  end
end
