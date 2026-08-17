inherited frmCadFaixa: TfrmCadFaixa
  Left = 161
  Top = 158
  Caption = 'Cadastro de Faixas Salariais'
  ClientHeight = 329
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 510
    Height = 243
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 16
      Top = 59
      Width = 111
      Height = 13
      Caption = 'Data de Efetivação'
    end
    object lblTit9: TLabel
      Left = 361
      Top = 19
      Width = 38
      Height = 13
      Caption = 'Step 9'
    end
    object lblTit8: TLabel
      Left = 316
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Step 8'
    end
    object lblTit7: TLabel
      Left = 277
      Top = 67
      Width = 38
      Height = 13
      Caption = 'Step 7'
    end
    object lblTit6: TLabel
      Left = 229
      Top = 91
      Width = 38
      Height = 13
      Caption = 'Step 6'
    end
    object lblTit5: TLabel
      Left = 190
      Top = 115
      Width = 38
      Height = 13
      Caption = 'Step 5'
    end
    object lblTit4: TLabel
      Left = 145
      Top = 139
      Width = 38
      Height = 13
      Caption = 'Step 4'
    end
    object lblTit3: TLabel
      Left = 102
      Top = 163
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 3'
    end
    object lblTit2: TLabel
      Left = 57
      Top = 187
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 2'
    end
    object lblTit1: TLabel
      Left = 15
      Top = 211
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 1'
    end
    object dbedCodigo: TwwDBEdit
      Left = 16
      Top = 29
      Width = 67
      Height = 21
      DataField = 'IDFAIXASALARIAL'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtedDataEfet: TCMDateTimePicker
      Left = 16
      Top = 74
      Width = 100
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAEFETIV'
      DataSource = ds
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 1
    end
    object dbredVal9: TDBRealEdit
      Left = 403
      Top = 16
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP9'
      DataSource = ds
    end
    object dbredVal8: TDBRealEdit
      Left = 358
      Top = 40
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP8'
      DataSource = ds
    end
    object dbredVal7: TDBRealEdit
      Left = 319
      Top = 64
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP7'
      DataSource = ds
    end
    object dbredVal6: TDBRealEdit
      Left = 271
      Top = 88
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP6'
      DataSource = ds
    end
    object dbredVal5: TDBRealEdit
      Left = 232
      Top = 112
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP5'
      DataSource = ds
    end
    object dbredVal4: TDBRealEdit
      Left = 187
      Top = 136
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP4'
      DataSource = ds
    end
    object dbredVal3: TDBRealEdit
      Left = 145
      Top = 160
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP3'
      DataSource = ds
    end
    object dbredVal2: TDBRealEdit
      Left = 100
      Top = 184
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP2'
      DataSource = ds
    end
    object dbredVal1: TDBRealEdit
      Left = 58
      Top = 208
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 10
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'STEP1'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 510
    inherited Toolbar971: TToolbar97
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object bbtnHistFaixa: TToolbarButton97
        Left = 260
        Top = 0
        Width = 64
        Height = 41
        Hint = 'Mostrar/Ocultar Histórico da Faixa Selecionada (alternar)'
        Caption = '&Histórico'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = bbtnHistFaixaClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 510
    inherited tb97Fundo: TToolbar97
      Left = 340
      DockPos = 410
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 173
      DockPos = 242
    end
  end
  object pnlHistFaixa: TPanel [3]
    Left = 74
    Top = 70
    Width = 354
    Height = 171
    TabOrder = 3
    Visible = False
    object lblHistFaixa: TLabel
      Left = 5
      Top = 4
      Width = 344
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Histórico da Faixa'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbGridHistFaixa: TwwDBGrid
      Left = 5
      Top = 25
      Width = 345
      Height = 142
      Selected.Strings = (
        'DATAEFETIVACAO'#9'18'#9'Data de Efetivação'#9'F'
        'IDFAIXASALEXT'#9'15'#9'Nº do Nível'#9'F'
        'VALOR'#9'16'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsHistFaixa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 14
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    OnStateChange = dsStateChange
    Left = 354
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 467
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 403
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 326
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Faixa Salarial'
    Colunas.Strings = (
      'FAIXASAL.IDFAIXASALARIAL'
      'FAIXASAL.DATAEFETIV')
    TipodeDado.Strings = (
      'N'
      'D')
    Descricao.Strings = (
      'Código'
      'Data de Efetivação')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FAIXASAL')
    CamposChave.Strings = (
      'FAIXASAL.IDFAIXASALARIAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '18')
    ExibePergunta = False
    Left = 403
    Top = 1
  end
  object CdsHistFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 210
    Top = 145
  end
  object dsHistFaixa: TwwDataSource
    AutoEdit = False
    DataSet = CdsHistFaixa
    OnStateChange = dsStateChange
    Left = 268
    Top = 145
  end
end
