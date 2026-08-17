inherited frmConsMovBMF: TfrmConsMovBMF
  Left = 17
  Top = 96
  HelpContext = 790501
  Caption = 'Consulta'
  ClientHeight = 447
  ClientWidth = 775
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 775
    Height = 408
    inherited bvlSepTit: TBevel
      Top = 102
      Width = 773
    end
    inherited pnlTitulo: TPanel
      Width = 773
      TabOrder = 2
      inherited lbNomDescricao: TfcLabel
        Width = 307
        Caption = 'Operações e Ajustes de BM&&F'
      end
    end
    object pnlCabecario: TPanel
      Left = 1
      Top = 42
      Width = 773
      Height = 60
      Align = alTop
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 6
        Top = 2
        Width = 345
        Height = 51
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 10
          Top = 24
          Width = 34
          Height = 13
          Caption = 'Início'
        end
        object Label3: TLabel
          Left = 186
          Top = 24
          Width = 20
          Height = 13
          Caption = 'Fim'
        end
        object dtDtaInicio: TCMDateTimePicker
          Left = 55
          Top = 20
          Width = 110
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
          OnExit = dtDtaInicioExit
        end
        object dtDtaFim: TCMDateTimePicker
          Left = 227
          Top = 20
          Width = 110
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
    object PgcSaldos: TPageControl
      Left = 1
      Top = 105
      Width = 773
      Height = 302
      ActivePage = TbsOperacoes
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object TbsOperacoes: TTabSheet
        Caption = 'Operações'
        object dbgOperacoes: TwwDBGrid
          Left = 0
          Top = 46
          Width = 765
          Height = 228
          Selected.Strings = (
            'DATAOPERACAO'#9'12'#9'Data Operação'#9'F'
            'DESCTIPOOPERACAO'#9'28'#9'Operação'#9'F'
            'QTDEOPERADA'#9'10'#9'Quantidade'#9'F'
            'VLROPERADO'#9'14'#9'Valor Operação'#9'F'
            'DESCINVESTIMENTO'#9'10'#9'Série'#9'F'
            'DATAVENCOPER'#9'12'#9'Data Liquidação'#9'F'
            'SGLCORRETVALORES'#9'23'#9'Corretora'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = dsBuscaOperacoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icYellow
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 765
          Height = 46
          Align = alTop
          TabOrder = 1
          object Label6: TLabel
            Left = 376
            Top = 4
            Width = 88
            Height = 13
            Caption = 'Total Contratos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 668
            Top = 8
            Width = 80
            Height = 13
            Caption = 'C = Comprado'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label11: TLabel
            Left = 668
            Top = 26
            Width = 70
            Height = 13
            Caption = 'V = Vendido'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblQtdOperadaCV: TLabel
            Left = 500
            Top = 21
            Width = 11
            Height = 16
            Caption = 'C'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label13: TLabel
            Left = 520
            Top = 4
            Width = 86
            Height = 13
            Caption = 'Total Corretora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblQtdOperadaCorCV: TLabel
            Left = 644
            Top = 21
            Width = 11
            Height = 16
            Caption = 'C'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblSerie: TLabel
            Left = 8
            Top = 6
            Width = 30
            Height = 13
            Caption = 'Série'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCorretora: TLabel
            Left = 184
            Top = 6
            Width = 53
            Height = 13
            Caption = 'Corretora'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rQtdOperada: TRealEdit
            Left = 376
            Top = 20
            Width = 120
            Height = 19
            Alignment = taRightJustify
            Color = clSilver
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 18
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object rQtdOperadaCor: TRealEdit
            Left = 520
            Top = 20
            Width = 120
            Height = 19
            Alignment = taRightJustify
            Color = clSilver
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 1
            WordWrap = False
            IntDigits = 18
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object dblkSeries: TwwDBLookupCombo
            Left = 8
            Top = 20
            Width = 169
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'60'#9'SÉRIE'#9'F')
            LookupTable = QryInvestimento
            LookupField = 'IDINVESTIMENTO'
            Options = [loColLines, loRowLines]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkCorretora: TwwDBLookupCombo
            Left = 184
            Top = 20
            Width = 185
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SGLCORRETVALORES'#9'10'#9'CORRETORA'#9'F')
            LookupTable = QryCorretValores
            LookupField = 'IDCORRETVALORES'
            Options = [loColLines, loRowLines]
            ParentFont = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TbsAjustes: TTabSheet
        Caption = 'Ajustes'
        ImageIndex = 2
        object dbgAjustes: TwwDBGrid
          Left = 0
          Top = 46
          Width = 765
          Height = 228
          Selected.Strings = (
            'DATAMOVCARTINV'#9'12'#9'Data Operação'#9'F'
            'TIPOOPERACAO'#9'20'#9'Operação'#9'F'
            'VLRAJUSTE'#9'17'#9'Ajustes'#9'F'
            'VLRIR'#9'15'#9'I.R.'#9'F'
            'VLRCPMFPROV'#9'15'#9'CPMF Prov.'#9'F'
            'VLRCPMFAPU'#9'13'#9'CPMF Apurado'#9'F'
            'CORRETORA'#9'14'#9'CORRETORA'#9'F'
            'IDLOTE'#9'10'#9'Lote'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = dsBuscaAjustes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icYellow
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 765
          Height = 46
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 4
            Width = 94
            Height = 13
            Caption = 'Total Ajustes (+)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 144
            Top = 4
            Width = 91
            Height = 13
            Caption = 'Total Ajustes (-)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 272
            Top = 4
            Width = 58
            Height = 13
            Caption = 'Resultado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbTotalAjustes: TDBRealEdit
            Left = 272
            Top = 19
            Width = 120
            Height = 21
            Alignment = taRightJustify
            Color = clMenu
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
          end
          object dbTotalAjustesNeg: TDBRealEdit
            Left = 144
            Top = 19
            Width = 120
            Height = 21
            Alignment = taRightJustify
            Color = clMenu
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
          end
          object dbTotalAjustesPos: TDBRealEdit
            Left = 16
            Top = 19
            Width = 120
            Height = 21
            Alignment = taRightJustify
            Color = clMenu
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 603
      DockPos = 648
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 353
      DockPos = 398
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
      object btnImprimir: TBitBtn
        Left = 165
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 107
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCORRETVALORES,'
      '     SGLCORRETVALORES'
      'FROM'
      '     CORRETVALORES'
      'WHERE'
      '     FLGATIVABMF='#39'S'#39
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 461
    Top = 16
    object QryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'CORRETORA'
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IV.IDINVESTIMENTO,'
      '      IV.DESCINVESTIMENTO,'
      '      IV.IDTIPOINVEST,'
      '      IV.IDEMISSOR'
      'FROM '
      '      INVESTIMENTO IV,'
      '      SERIESBMF SB'
      'WHERE '
      '      (IV.IDTIPOINVEST = 8) AND'
      '      (IV.IDINVESTIMENTO = SB.IDINVESTIMENTO) AND'
      '      ('
      '       (TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39') IS NULL) OR'
      '       (SB.DATAVENCIMENTO >= TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39'))'
      '      )'
      'ORDER BY '
      '      DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptUnknown
      end>
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'SÉRIE'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
  end
  object dsBuscaOperacoes: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaOperacoes
    Left = 141
    Top = 168
  end
  object qryBuscaOperacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     OP2.DATAOPERACAO,ABS(SUM(OP2.VLROPERACAO)) AS VLROPERADO,'
      '     SUM(OP2.QTDEOPERACAO) AS QTDEOPERADA,OP2.DATAVENCOPER,'
      '     TP.DESCTIPOOPERACAO,'
      '     IV.DESCINVESTIMENTO,'
      '     CV.SGLCORRETVALORES'
      'FROM'
      '     OPERACAOINVEST OP2,'
      '     TIPOOPERACAO TP,'
      '     INVESTIMENTO IV,'
      '     CORRETVALORES CV,'
      '     ('
      '      SELECT'
      '           OP.IDOPERACAOINVEST'
      '      FROM'
      '           OPERACAOINVEST OP'
      '      WHERE'
      '          (OP.IDTIPOINVEST=8) AND'
      '          (OP.IDTIPOOPERACAO > 0) AND'
      
        '          (OP.DATAOPERACAO >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39')) A' +
        'ND'
      
        '          (OP.DATAOPERACAO <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) A' +
        'ND'
      
        '          ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OP.IDCORRETVA' +
        'LORES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND'
      
        '          ( ( (:IDINVESTIMENTO   IS NOT NULL) AND (OP.IDINVESTIM' +
        'ENTO   = :IDINVESTIMENTO ) ) OR (:IDINVESTIMENTO  IS NULL) )'
      '     ) OP1'
      'WHERE'
      '    (OP2.IDOPERACAOINVEST = OP1.IDOPERACAOINVEST) AND'
      '    (OP2.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '    (OP2.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '    (OP2.IDCORRETVALORES = CV.IDCORRETVALORES)'
      'GROUP BY'
      
        '    OP2.DATAOPERACAO,OP2.DATAVENCOPER,TP.DESCTIPOOPERACAO,IV.DES' +
        'CINVESTIMENTO,CV.SGLCORRETVALORES'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 143
    Top = 210
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryBuscaOperacoesDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaOperacoesDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 28
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaOperacoesQTDEOPERADA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEOPERADA'
      DisplayFormat = '###,###,###,##0.'
    end
    object qryBuscaOperacoesVLROPERADO: TFloatField
      DisplayLabel = 'Valor Operação'
      DisplayWidth = 14
      FieldName = 'VLROPERADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBuscaOperacoesDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Série'
      DisplayWidth = 10
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaOperacoesDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Liquidação'
      DisplayWidth = 12
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaOperacoesSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 23
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
  end
  object QryBuscaSaldoDiaAntTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'D'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDCOMPRADA,'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'A'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDVENDIDA'
      'FROM'
      '       HISTCARTINV HI'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      '       (HI.IDTIPOOPERACAO NOT IN(-10,-11)) AND'
      '       (HI.IDINVESTIMENTO = :IdInvestimento) AND'
      '       (HI.DATAMOVCARTINV < TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 576
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object FloatField2: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryBuscaSaldoDiaAntCorret: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'D'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDCOMPRADA,'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'A'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDVENDIDA'
      'FROM'
      '       HISTCARTINV HI'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      '       (HI.IDTIPOOPERACAO NOT IN(-10,-11)) AND'
      '       (HI.IDLOTE = :IdLote ) AND'
      '       (HI.IDINVESTIMENTO = :IdInvestimento) AND'
      '       (HI.DATAMOVCARTINV < TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      ' ')
    ValidateWithMask = True
    Left = 584
    Top = 26
    ParamData = <
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryBuscaSaldoDiaAntCorretQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryBuscaSaldoDiaAntCorretQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object qryBuscaAjustes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     Y.VLRAJUSTE,'
      '     Y.VLRIR,'
      '     Y.VLRCPMFAPU,'
      '     Y.VLRCPMFPROV,'
      '     Y.DATAMOVCARTINV,'
      '     Y.IDLOTE,'
      
        '     DECODE(Y.VLRAJUSTE,ABS(Y.VLRAJUSTE)*-1,'#39'AJUSTE NEGATIVO'#39','#39'A' +
        'JUSTE POSITIVO'#39') AS TIPOOPERACAO,'
      '     '#39'          '#39' AS CORRETORA'
      'FROM'
      '    ('
      '     SELECT'
      '          SUM(X.VLRAJPOS+X.VLRAJNORMAL) AS VLRAJUSTE,'
      '          SUM(X.VLRIR) AS VLRIR,'
      '          SUM(X.VLRCPMFAPU) AS VLRCPMFAPU,'
      '          SUM(X.VLRCPMFPROV) AS VLRCPMFPROV,'
      '          X.DATAMOVCARTINV,X.IDLOTE'
      '     FROM'
      '         ('
      '          SELECT'
      
        '               SUM ( DECODE(HI1.NATURMOVCARTINV,'#39'D'#39',(HI1.VLRMOVC' +
        'ARTINV*-1),HI1.VLRMOVCARTINV) ) AS VLRAJPOS,'
      '               0 AS VLRAJNORMAL,'
      '               SUM (VLRIRAPU) AS VLRIR,'
      '               0 AS VLRCPMFAPU,'
      '               0 AS VLRCPMFPROV,'
      
        '               HI1.DATAMOVCARTINV,HI1.IDLOTE,HI1.IDTIPOOPERACAO,' +
        'TP1.DESCTIPOOPERACAO,'
      '               '#39'          '#39' AS SGLCORRETVALORES'
      '          FROM'
      '               HISTCARTINV HI1,'
      '               TIPOOPERACAO TP1'
      '          WHERE'
      '               (HI1.IDTIPOINVEST= 8) AND'
      '               (HI1.IDTIPOOPERACAO IN (-10,-11)) AND'
      
        '               (HI1.DATAMOVCARTINV >= TO_DATE(:dDataIni,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      
        '               (HI1.DATAMOVCARTINV <= TO_DATE(:dDataFim,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      '               (HI1.IDTIPOOPERACAO = TP1.IDTIPOOPERACAO)'
      
        '          GROUP BY HI1.DATAMOVCARTINV,HI1.IDLOTE,HI1.IDTIPOOPERA' +
        'CAO,TP1.DESCTIPOOPERACAO'
      ''
      '          UNION'
      ''
      '          SELECT'
      '               0 AS VLRAJPOS,'
      '               SUM(HI2.VLRMOVCARTINV) AS VLRAJNORMAL,'
      '               0 AS VLRIR,'
      '               0 AS VLRCPMFAPU,'
      '               0 AS VLRCPMFPROV,'
      
        '               HI2.DATAMOVCARTINV,HI2.IDLOTE,HI2.IDTIPOOPERACAO,' +
        'TP2.DESCTIPOOPERACAO,'
      '              '#39'          '#39' AS SGLCORRETVALORES'
      '          FROM'
      '               HISTCARTINV HI2,'
      '               TIPOOPERACAO TP2'
      '          WHERE'
      '               (HI2.IDTIPOINVEST= 8) AND'
      
        '               ((HI2.IDTIPOOPERACAO > 0) AND (HI2.TIPMOVCARTINV ' +
        '= '#39'DOP'#39') AND ((HI2.HISTMOVCARTINV LIKE '#39'%Ajuste Normal%'#39') OR (HI' +
        '2.HISTMOVCARTINV LIKE '#39'%AJUSTE NORMAL%'#39'))) AND'
      
        '               (HI2.DATAMOVCARTINV >= TO_DATE(:dDataIni,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      
        '               (HI2.DATAMOVCARTINV <= TO_DATE(:dDataFim,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      '               (HI2.IDTIPOOPERACAO = TP2.IDTIPOOPERACAO)'
      
        '          GROUP BY HI2.DATAMOVCARTINV,HI2.IDLOTE,HI2.IDTIPOOPERA' +
        'CAO,TP2.DESCTIPOOPERACAO'
      ''
      '          UNION'
      ''
      '          SELECT'
      '               0 AS VLRAJPOS,'
      '               0 AS VLRAJNORMAL,'
      '               0 AS VLRIR,'
      '               SUM(VLRCPMFAPU) AS VLRCPMFAPU,'
      '               SUM(VLRCPMFPROV) AS VLRCPMFPROV,'
      
        '               HI3.DATAMOVCARTINV,HI3.IDLOTE,HI3.IDTIPOOPERACAO,' +
        'TP3.DESCTIPOOPERACAO,'
      '               '#39'          '#39' AS SGLCORRETVALORES'
      '          FROM'
      '               HISTCARTINV HI3,'
      '               TIPOOPERACAO TP3'
      '          WHERE'
      '               (HI3.IDTIPOINVEST= 8) AND'
      '               (HI3.IDTIPOOPERACAO > 0) AND'
      
        '               (HI3.DATAMOVCARTINV >= TO_DATE(:dDataIni,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      
        '               (HI3.DATAMOVCARTINV <= TO_DATE(:dDataFim,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      '               (HI3.IDTIPOOPERACAO = TP3.IDTIPOOPERACAO)'
      
        '          GROUP BY HI3.DATAMOVCARTINV,HI3.IDLOTE,HI3.IDTIPOOPERA' +
        'CAO,TP3.DESCTIPOOPERACAO'
      '         ) X'
      '     GROUP BY X.DATAMOVCARTINV,X.IDLOTE'
      '    ) Y'
      'WHERE'
      '   Y.VLRAJUSTE <> 0'
      '')
    UpdateObject = updBuscaAjustes
    ValidateWithMask = True
    Left = 263
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end>
    object qryBuscaAjustesDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 12
      FieldName = 'DATAMOVCARTINV'
    end
    object qryBuscaAjustesTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 20
      FieldName = 'TIPOOPERACAO'
      Size = 15
    end
    object qryBuscaAjustesVLRAJUSTE: TFloatField
      DisplayLabel = 'Ajustes'
      DisplayWidth = 17
      FieldName = 'VLRAJUSTE'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBuscaAjustesVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBuscaAjustesVLRCPMFPROV: TFloatField
      DisplayLabel = 'CPMF Prov.'
      DisplayWidth = 15
      FieldName = 'VLRCPMFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBuscaAjustesVLRCPMFAPU: TFloatField
      DisplayLabel = 'CPMF Apurado'
      DisplayWidth = 13
      FieldName = 'VLRCPMFAPU'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryBuscaAjustesCORRETORA: TStringField
      DisplayWidth = 14
      FieldName = 'CORRETORA'
      FixedChar = True
      Size = 10
    end
    object qryBuscaAjustesIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Size = 10
    end
  end
  object dsBuscaAjustes: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaAjustes
    Left = 261
    Top = 168
  end
  object QryTotalContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'D'#39',0,OP.QTDEOPERACAO) )' +
        ' AS QTDCOMPRADA,'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'A'#39',0,OP.QTDEOPERACAO) )' +
        ' AS QTDVENDIDA'
      'FROM'
      '       OPERACAOINVEST OP, TIPOOPERACAO TP'
      'WHERE'
      '       (OP.IDTIPOINVEST = 8) AND'
      '       (OP.IDTIPOOPERACAO > 0) AND'
      
        '       (TRUNC(OP.DATAOPERACAO) >= TO_DATE(:dDataIni, '#39'DD/MM/YYYY' +
        #39')) AND'
      
        '       (TRUNC(OP.DATAOPERACAO) <= TO_DATE(:dDataFim, '#39'DD/MM/YYYY' +
        #39')) AND'
      '       (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 162
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end>
    object QryTotalContratosQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryTotalContratosQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryTotalCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'D'#39',0,OP.QTDEOPERACAO) )' +
        ' AS QTDCOMPRADA,'
      
        '       SUM ( DECODE(TP.NATUREZAOPERACAO,'#39'A'#39',0,OP.QTDEOPERACAO) )' +
        ' AS QTDVENDIDA'
      'FROM'
      '       OPERACAOINVEST OP, TIPOOPERACAO TP'
      'WHERE'
      '       (OP.IDTIPOINVEST = 8) AND'
      '       (OP.IDTIPOOPERACAO > 0) AND'
      
        '       (TRUNC(OP.DATAOPERACAO) >= TO_DATE(:dDataIni, '#39'DD/MM/YYYY' +
        #39')) AND'
      
        '       (TRUNC(OP.DATAOPERACAO) <= TO_DATE(:dDataFim, '#39'DD/MM/YYYY' +
        #39')) AND'
      
        '       ( ( (:IDCORRETVALORES  IS NOT NULL) AND (OP.IDCORRETVALOR' +
        'ES  = :IDCORRETVALORES) ) OR (:IDCORRETVALORES IS NULL) ) AND   ' +
        '    '
      '       (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      'GROUP BY IDCORRETVALORES '
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end>
    object QryTotalCorretoraQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryTotalCorretoraQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QrySglCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CV.SGLCORRETVALORES'
      'FROM'
      '   OPERACAOINVEST OP,'
      '   CORRETVALORES CV'
      'WHERE'
      '   (OP.IDTIPOINVEST = 8) AND'
      '   (OP.IDLOTE = :IdLote) AND'
      '   (OP.IDCORRETVALORES = CV.IDCORRETVALORES)')
    ValidateWithMask = True
    Left = 360
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end>
    object QrySglCorretoraSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
  end
  object updBuscaAjustes: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 257
    Top = 265
  end
end
