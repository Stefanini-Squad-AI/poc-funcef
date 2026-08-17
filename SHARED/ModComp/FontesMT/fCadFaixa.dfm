inherited frmCadFaixa: TfrmCadFaixa
  Left = 355
  Top = 53
  Caption = 'Cadastro de Faixas Salariais'
  ClientHeight = 524
  ClientWidth = 579
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 579
    Height = 438
    BorderWidth = 2
    object bvFx2: TBevel
      Left = 364
      Top = 8
      Width = 206
      Height = 249
      Style = bsRaised
    end
    object bvFx1: TBevel
      Left = 144
      Top = 8
      Width = 206
      Height = 249
      Style = bsRaised
    end
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
      Tag = 9
      Left = 198
      Top = 211
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 9'
    end
    object lblTit8: TLabel
      Tag = 8
      Left = 198
      Top = 187
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 8'
    end
    object lblTit7: TLabel
      Tag = 7
      Left = 198
      Top = 163
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 7'
    end
    object lblTit6: TLabel
      Tag = 6
      Left = 198
      Top = 139
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 6'
    end
    object lblTit5: TLabel
      Tag = 5
      Left = 198
      Top = 115
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 5'
    end
    object lblTit4: TLabel
      Tag = 4
      Left = 198
      Top = 91
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 4'
    end
    object lblTit3: TLabel
      Tag = 3
      Left = 198
      Top = 67
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 3'
    end
    object lblTit2: TLabel
      Tag = 2
      Left = 198
      Top = 43
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 2'
    end
    object lblTit1: TLabel
      Tag = 1
      Left = 198
      Top = 19
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 1'
    end
    object lblTit10: TLabel
      Tag = 10
      Left = 191
      Top = 235
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 10'
      Visible = False
    end
    object lblTit19: TLabel
      Tag = 19
      Left = 411
      Top = 211
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 19'
      Visible = False
    end
    object lblTit18: TLabel
      Tag = 18
      Left = 411
      Top = 187
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 18'
      Visible = False
    end
    object lblTit17: TLabel
      Tag = 17
      Left = 411
      Top = 164
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 17'
      Visible = False
    end
    object lblTit16: TLabel
      Tag = 16
      Left = 411
      Top = 140
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 16'
      Visible = False
    end
    object lblTit15: TLabel
      Tag = 15
      Left = 411
      Top = 116
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 15'
      Visible = False
    end
    object lblTit14: TLabel
      Tag = 14
      Left = 411
      Top = 92
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 14'
      Visible = False
    end
    object lblTit13: TLabel
      Tag = 13
      Left = 411
      Top = 69
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 13'
      Visible = False
    end
    object lblTit12: TLabel
      Tag = 12
      Left = 411
      Top = 45
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 12'
      Visible = False
    end
    object lblTit11: TLabel
      Tag = 11
      Left = 411
      Top = 21
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 11'
      Visible = False
    end
    object lblTit20: TLabel
      Tag = 20
      Left = 411
      Top = 235
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Step 20'
      Visible = False
    end
    object Label3: TLabel
      Left = 16
      Top = 103
      Width = 105
      Height = 13
      Caption = 'Faixa Salarial PCS'
    end
    object dbedCodigo: TwwDBEdit
      Left = 16
      Top = 29
      Width = 67
      Height = 21
      TabStop = False
      AutoSelect = False
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
      Tag = 9
      Left = 240
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
    end
    object dbredVal8: TDBRealEdit
      Tag = 8
      Left = 240
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
    end
    object dbredVal7: TDBRealEdit
      Tag = 7
      Left = 240
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
    end
    object dbredVal6: TDBRealEdit
      Tag = 6
      Left = 240
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
    end
    object dbredVal5: TDBRealEdit
      Tag = 5
      Left = 240
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
    end
    object dbredVal4: TDBRealEdit
      Tag = 4
      Left = 240
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
    end
    object dbredVal3: TDBRealEdit
      Tag = 3
      Left = 240
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
    end
    object dbredVal2: TDBRealEdit
      Tag = 2
      Left = 240
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
    end
    object dbredVal1: TDBRealEdit
      Tag = 1
      Left = 240
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
    end
    object dbredVal10: TDBRealEdit
      Tag = 10
      Left = 240
      Top = 232
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal19: TDBRealEdit
      Tag = 19
      Left = 460
      Top = 208
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 20
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal18: TDBRealEdit
      Tag = 18
      Left = 460
      Top = 184
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 19
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal17: TDBRealEdit
      Tag = 17
      Left = 460
      Top = 160
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 18
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal16: TDBRealEdit
      Tag = 16
      Left = 460
      Top = 136
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 17
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal15: TDBRealEdit
      Tag = 15
      Left = 460
      Top = 112
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 16
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal14: TDBRealEdit
      Tag = 14
      Left = 460
      Top = 88
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 15
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal13: TDBRealEdit
      Tag = 13
      Left = 460
      Top = 64
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 14
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal12: TDBRealEdit
      Tag = 12
      Left = 460
      Top = 40
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 13
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal11: TDBRealEdit
      Tag = 11
      Left = 460
      Top = 16
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 12
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbredVal20: TDBRealEdit
      Tag = 20
      Left = 460
      Top = 232
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 21
      Visible = False
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbedCodFaixaPCS: TwwDBEdit
      Left = 16
      Top = 121
      Width = 67
      Height = 21
      DataField = 'CODFAIXAPCS'
      DataSource = ds
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 579
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
    Top = 485
    Width = 579
    inherited tb97Fundo: TToolbar97
      Left = 407
      DockPos = 411
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
      DockPos = 242
    end
  end
  object pnlHistFaixa: TPanel [3]
    Left = 1
    Top = 305
    Width = 569
    Height = 180
    TabOrder = 3
    Visible = False
    object lblHistFaixa: TLabel
      Left = 5
      Top = 4
      Width = 556
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
  end
  object dbGridHistFaixa: TwwDBGrid [4]
    Left = 7
    Top = 329
    Width = 557
    Height = 145
    Selected.Strings = (
      'IDNIVEL'#9'7'#9'Código'
      'DATAEFETIVACAO'#9'17'#9'Data da Efetivação'
      'NIVEL1'#9'12'#9'Nível 1'
      'NIVEL2'#9'12'#9'Nível 2'
      'NIVEL3'#9'12'#9'Nível 3'
      'NIVEL4'#9'12'#9'Nível 4'
      'NIVEL5'#9'12'#9'Nível 5'
      'NIVEL6'#9'12'#9'Nível 6'
      'NIVEL7'#9'12'#9'Nível 7'
      'NIVEL8'#9'12'#9'Nível 8'
      'NIVEL9'#9'12'#9'Nível 9'
      'NIVEL10'#9'12'#9'Nível 10'
      'NIVEL11'#9'12'#9'Nível 11'
      'NIVEL12'#9'12'#9'Nível 12'
      'NIVEL13'#9'12'#9'Nível 13'
      'NIVEL14'#9'12'#9'Nível 14'
      'NIVEL15'#9'12'#9'Nível 15'
      'NIVEL16'#9'12'#9'Nível 16'
      'NIVEL17'#9'12'#9'Nível 17'
      'NIVEL18'#9'12'#9'Nível 18'
      'NIVEL19'#9'12'#9'Nível 19'
      'NIVEL20'#9'12'#9'Nível 20')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnCellChanged = dbGridHistFaixaCellChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsHistFaixa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 4
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
    OnDrawDataCell = dbGridHistFaixaDrawDataCell
    IndicatorColor = icBlack
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 14
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
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
      'FAIXASAL.DATAEFETIV'
      'FAIXASAL.CODFAIXAPCS')
    TipodeDado.Strings = (
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Código'
      'Data de Efetivação'
      'Faixa PCS')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FAIXASAL')
    CamposChave.Strings = (
      'FAIXASAL.IDFAIXASALARIAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 512
    Top = 1
  end
  object CdsHistFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsHistFaixaAfterOpen
    Left = 26
    Top = 257
    object fltfldCdsHistFaixaNIVEL1: TFloatField
      FieldName = 'NIVEL1'
    end
    object fltfldCdsHistFaixaNIVEL2: TFloatField
      FieldName = 'NIVEL2'
    end
    object fltfldCdsHistFaixaNIVEL3: TFloatField
      FieldName = 'NIVEL3'
    end
    object fltfldCdsHistFaixaNIVEL4: TFloatField
      FieldName = 'NIVEL4'
    end
    object fltfldCdsHistFaixaNIVEL5: TFloatField
      FieldName = 'NIVEL5'
    end
    object fltfldCdsHistFaixaNIVEL6: TFloatField
      FieldName = 'NIVEL6'
    end
    object fltfldCdsHistFaixaNIVEL7: TFloatField
      FieldName = 'NIVEL7'
    end
    object fltfldCdsHistFaixaNIVEL8: TFloatField
      FieldName = 'NIVEL8'
    end
    object fltfldCdsHistFaixaNIVEL9: TFloatField
      FieldName = 'NIVEL9'
    end
    object fltfldCdsHistFaixaNIVEL10: TFloatField
      FieldName = 'NIVEL10'
    end
    object fltfldCdsHistFaixaNIVEL11: TFloatField
      FieldName = 'NIVEL11'
    end
    object fltfldCdsHistFaixaNIVEL12: TFloatField
      FieldName = 'NIVEL12'
    end
    object fltfldCdsHistFaixaNIVEL13: TFloatField
      FieldName = 'NIVEL13'
    end
    object fltfldCdsHistFaixaNIVEL14: TFloatField
      FieldName = 'NIVEL14'
    end
    object fltfldCdsHistFaixaNIVEL15: TFloatField
      FieldName = 'NIVEL15'
    end
    object fltfldCdsHistFaixaNIVEL16: TFloatField
      FieldName = 'NIVEL16'
    end
    object fltfldCdsHistFaixaNIVEL17: TFloatField
      FieldName = 'NIVEL17'
    end
    object fltfldCdsHistFaixaNIVEL18: TFloatField
      FieldName = 'NIVEL18'
    end
    object fltfldCdsHistFaixaNIVEL19: TFloatField
      FieldName = 'NIVEL19'
    end
    object fltfldCdsHistFaixaNIVEL20: TFloatField
      FieldName = 'NIVEL20'
    end
    object strngfldCdsHistFaixaIDNIVEL: TFloatField
      FieldName = 'IDNIVEL'
    end
    object dtmfldCdsHistFaixaDATAEFETIVACAO: TDateTimeField
      FieldName = 'DATAEFETIVACAO'
    end
  end
  object dsHistFaixa: TwwDataSource
    AutoEdit = False
    DataSet = CdsHistFaixa
    OnStateChange = dsStateChange
    Left = 28
    Top = 209
  end
end
