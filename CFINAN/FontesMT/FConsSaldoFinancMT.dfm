inherited frmConsSaldoFinancMT: TfrmConsSaldoFinancMT
  Left = 179
  Top = 210
  HelpContext = 90047
  Caption = 'Consulta de Saldo Financeiro'
  ClientHeight = 441
  ClientWidth = 772
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 402
    object Splitter1: TSplitter
      Left = 379
      Top = 109
      Width = 3
      Height = 260
      Cursor = crHSplit
    end
    object PnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 770
      Height = 108
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 27
        Top = 12
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Programa:'
      end
      object Label5: TLabel
        Left = 8
        Top = 44
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Patrocinador:'
      end
      object Label6: TLabel
        Left = 14
        Top = 76
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plano Prev.:'
      end
      object dblcPrograma: TwwDBLookupCombo
        Left = 88
        Top = 8
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
        LookupTable = cdsPrograma
        LookupField = 'IDPROGRAMA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblcPatrocinador: TwwDBLookupCombo
        Left = 88
        Top = 40
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
        LookupTable = cdsPatrocinador
        LookupField = 'IDPESSOA'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblcPlanoPrev: TwwDBLookupCombo
        Left = 88
        Top = 72
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object gpbPeriodo: TGroupBox
        Left = 480
        Top = 8
        Width = 273
        Height = 89
        Caption = 'Período'
        TabOrder = 3
        object Label7: TLabel
          Left = 7
          Top = 28
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Inicial:'
        end
        object Label8: TLabel
          Left = 14
          Top = 60
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Final:'
        end
        object edDataInicial: TCMDateTimePicker
          Left = 80
          Top = 24
          Width = 177
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
          TabOrder = 0
          OnChange = edDataChange
        end
        object edDataFinal: TCMDateTimePicker
          Left = 80
          Top = 56
          Width = 177
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
      end
    end
    object PnlSaldo: TPanel
      Left = 1
      Top = 369
      Width = 770
      Height = 32
      Align = alBottom
      TabOrder = 1
      object Label3: TLabel
        Left = 549
        Top = 8
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo:'
      end
      object edSaldo: TDBRealEdit
        Left = 590
        Top = 5
        Width = 159
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
        DataField = 'LACVALOR'
      end
    end
    object PnlSaidas: TPanel
      Left = 382
      Top = 109
      Width = 389
      Height = 260
      Align = alClient
      TabOrder = 2
      object pnlCabSaidas: TPanel
        Left = 1
        Top = 1
        Width = 387
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Saídas'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PnlRodSaidas: TPanel
        Left = 1
        Top = 229
        Width = 387
        Height = 30
        Align = alBottom
        TabOrder = 1
        object Label2: TLabel
          Left = 168
          Top = 8
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total:'
        end
        object edTotalSaidas: TDBRealEdit
          Left = 208
          Top = 5
          Width = 159
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
          DataField = 'LACVALOR'
        end
      end
      object dbgSaidas: TwwDBGrid
        Left = 1
        Top = 25
        Width = 387
        Height = 204
        Selected.Strings = (
          'HISTORICO'#9'27'#9'Histórico'
          'VALORLANCFINAN'#9'14'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSaidas
        ReadOnly = True
        TabOrder = 2
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
    end
    object PnlEntradas: TPanel
      Left = 1
      Top = 109
      Width = 378
      Height = 260
      Align = alLeft
      TabOrder = 3
      object pnlCabEntradas: TPanel
        Left = 1
        Top = 1
        Width = 376
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Entradas'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PnlRodEntradas: TPanel
        Left = 1
        Top = 229
        Width = 376
        Height = 30
        Align = alBottom
        TabOrder = 1
        object Label1: TLabel
          Left = 168
          Top = 8
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total:'
        end
        object edTotalEntradas: TDBRealEdit
          Left = 208
          Top = 5
          Width = 159
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
          DataField = 'LACVALOR'
        end
      end
      object dbgEntradas: TwwDBGrid
        Left = 1
        Top = 25
        Width = 376
        Height = 204
        Selected.Strings = (
          'HISTORICO'#9'27'#9'Histórico'#9'No'
          'VALORLANCFINAN'#9'14'#9'Valor'#9'No')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsEntradas
        ReadOnly = True
        TabOrder = 2
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
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 228
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 145
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 147
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 230
        HelpContext = 90047
      end
      object bbtnProcessarConsulta: TBitBtn
        Left = 0
        Top = 0
        Width = 145
        Height = 33
        Cancel = True
        Caption = '&Processar Consulta'
        TabOrder = 2
        OnClick = bbtnProcessarConsultaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 395
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsEntradas: TwwDataSource
    DataSet = cdsEntradas
    Left = 328
    Top = 152
  end
  object dsSaidas: TwwDataSource
    DataSet = cdsSaidas
    Left = 720
    Top = 152
  end
  object cdsEntradas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 264
    Top = 152
  end
  object cdsSaidas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 152
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 8
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 32
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 368
    Top = 56
  end
end
