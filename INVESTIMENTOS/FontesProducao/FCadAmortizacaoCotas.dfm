inherited FrmCadAmortizacaoCotas: TFrmCadAmortizacaoCotas
  Left = 34
  Top = 65
  HelpContext = 790216
  Caption = 'Amortização'
  ClientHeight = 536
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 88
    Width = 792
    Height = 409
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 95
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 95
        Align = alTop
        TabOrder = 0
        object lblDataMovto: TLabel
          Left = 267
          Top = 6
          Width = 111
          Height = 13
          Caption = 'Data do Movimento'
        end
        object lblTipoFundo: TLabel
          Left = 11
          Top = 6
          Width = 83
          Height = 13
          Caption = 'Tipo de Fundo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 384
          Top = 6
          Width = 134
          Height = 13
          Caption = 'Fundo de Investimento '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 11
          Top = 49
          Width = 103
          Height = 13
          Caption = 'Tipo de Operação'
        end
        object DtEdDataReferenciaGeral: TCMDateTimePicker
          Left = 267
          Top = 22
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
          OnExit = DtEdDataReferenciaGeralExit
        end
        object dblkTipoFundo: TwwDBLookupCombo
          Left = 11
          Top = 22
          Width = 251
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOFUNDOINV'#9'30'#9'Tipo de Fundo'#9'F')
          LookupTable = QryTipoFundo
          LookupField = 'IDTIPOFUNDOINVEST'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkTipoFundoCloseUp
          OnEnter = dblkTipoFundoEnter
          OnExit = dblkTipoFundoExit
        end
        object DblFundosInvest: TwwDBLookupCombo
          Left = 384
          Top = 22
          Width = 398
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
          LookupTable = QryFundoInvestOperacao
          LookupField = 'IDFUNDOINVEST'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DblFundosInvestCloseUp
          OnEnter = DblFundosInvestEnter
          OnExit = DblFundosInvestExit
        end
        object DblTipoOper: TwwDBLookupCombo
          Left = 11
          Top = 65
          Width = 366
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'30'#9'Descrição'#9'F')
          LookupTable = QryBuscaTipoOper
          LookupField = 'IDTIPOOPERACAO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DblTipoOperCloseUp
          OnEnter = DblTipoOperEnter
          OnExit = DblTipoOperExit
        end
      end
    end
    object tbcDetalhe: TTabControlDetalhe
      Left = 1
      Top = 96
      Width = 790
      Height = 312
      Align = alClient
      TabOrder = 1
      detdbGrids.Strings = (
        'dbgrdDet')
      object pgctrlDetalhe: TPageControl
        Left = 4
        Top = 37
        Width = 782
        Height = 248
        ActivePage = tbsDet
        Align = alClient
        TabOrder = 1
        object tbsDet: TTabSheet
          Caption = 'Detalhe'
          TabVisible = False
          object dbgrdDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 774
            Height = 238
            Selected.Strings = (
              'DESCTIPOOPERACAO'#9'30'#9'Tipo de Operação'
              'DATAAPLICACAO'#9'12'#9'Data da~Aplicação'
              'DATAMOVFUNDO'#9'11'#9'Data da~ Cota'#9'F'
              'VLRAPLICADO'#9'19'#9'Valor de~Custo Atual'
              'VLRCUSTOATUAL'#9'19'#9'Valor de~Custo Inicial'
              'VLRRENDIMENTO'#9'20'#9'Valor do~Rendimento'
              'SALDOVLRFUNDO'#9'20'#9'Saldo Atual')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            Color = clWhite
            DataSource = DsDetalhe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icYellow
          end
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 774
            Height = 238
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Dock974: TDock97
              Left = 684
              Top = 0
              Width = 90
              Height = 238
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object tb97Detalhe: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object bbtnOkDet: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = bbtnOkDetClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                    88888887788888778F88887222222222088888788888888878F887A228822222
                    208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                    22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                    22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                    220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                    2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                    8888888778FFFF77888888888777778888888888877777888888}
                  NumGlyphs = 2
                end
                object bbtnCancelarDet: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = bbtnCancelarDetClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                    88888887788888778F88887991919191088888788888888878F8879919191919
                    108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                    19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                    19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                    190878F877787778887887917F919F71908887F88788878887F8879919191919
                    1088878F88888888878888799191919108888878FF88888F7888888779999977
                    8888888778FFFF77888888888777778888888888877777888888}
                  NumGlyphs = 2
                  Spacing = -1
                end
                object bbtnVoltarDet: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = bbtnCancelarDetClick
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
                end
              end
            end
            object PageControl1: TPageControl
              Left = 0
              Top = 0
              Width = 684
              Height = 238
              ActivePage = TabSheet1
              Align = alClient
              TabOrder = 1
              object TabSheet1: TTabSheet
                Caption = 'Operação'
                object Label3: TLabel
                  Left = 11
                  Top = 3
                  Width = 117
                  Height = 13
                  Caption = 'Total do Custo Atual'
                end
                object Label6: TLabel
                  Left = 11
                  Top = 44
                  Width = 119
                  Height = 13
                  Caption = 'Total do Rendimento'
                end
                object Label4: TLabel
                  Left = 11
                  Top = 86
                  Width = 117
                  Height = 13
                  Caption = 'Total do Saldo Atual'
                end
                object Label5: TLabel
                  Left = 11
                  Top = 128
                  Width = 105
                  Height = 13
                  Caption = 'Data da Operação'
                end
                object lblDtLiquidacao: TLabel
                  Left = 141
                  Top = 128
                  Width = 112
                  Height = 13
                  Caption = 'Data de Liquidação'
                end
                object Label1: TLabel
                  Left = 280
                  Top = 128
                  Width = 107
                  Height = 13
                  Caption = 'Valor da Operação'
                end
                object dbrVlrCustoTotal: TDBRealEdit
                  Left = 11
                  Top = 18
                  Width = 167
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '0,00')
                  ReadOnly = True
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTOTAPL'
                  DataSource = DsTotalDetalhe
                end
                object dbrVlrRendTotal: TDBRealEdit
                  Left = 11
                  Top = 59
                  Width = 167
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '0,00')
                  ReadOnly = True
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTOTREND'
                  DataSource = DsTotalDetalhe
                end
                object dbrVlrSaldoAtual: TDBRealEdit
                  Left = 11
                  Top = 101
                  Width = 167
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '0,00')
                  ReadOnly = True
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'SLDTOTFUNDO'
                  DataSource = DsTotalDetalhe
                end
                object DtEdDataOperacao: TCMDateTimePicker
                  Left = 11
                  Top = 142
                  Width = 121
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
                  TabOrder = 3
                  OnExit = DtEdDataOperacaoExit
                end
                object DtEdDataLiquidacao: TCMDateTimePicker
                  Left = 141
                  Top = 142
                  Width = 130
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
                  DataSource = DsOperacao
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
                  TabOrder = 4
                end
                object DbValorCustoNovo: TDBRealEdit
                  Left = 280
                  Top = 142
                  Width = 169
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 5
                  WordWrap = False
                  OnExit = DbValorCustoNovoExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLROPERACAO'
                  DataSource = DsOperacao
                end
              end
              object TabSheet2: TTabSheet
                Caption = 'Taxa'
                ImageIndex = 1
                object Label9: TLabel
                  Left = 8
                  Top = 50
                  Width = 85
                  Height = 13
                  Caption = 'Taxa de Saída'
                end
                object Label10: TLabel
                  Left = 8
                  Top = 5
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object DBEVlrTaxa: TDBRealEdit
                  Left = 8
                  Top = 65
                  Width = 135
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTAXAS'
                end
                object DBEdit1: TDBEdit
                  Left = 8
                  Top = 21
                  Width = 561
                  Height = 21
                  Color = clBtnFace
                  DataField = 'DESCTIPOOPERACAO'
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
      object Dock973: TDock97
        Left = 4
        Top = 6
        Width = 782
        Height = 31
        AllowDrag = False
        BoundLines = [blTop, blBottom, blLeft, blRight]
        object Label7: TLabel
          Left = 107
          Top = 6
          Width = 143
          Height = 16
          Caption = 'Valor Amortizado R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label8: TLabel
          Left = 256
          Top = 6
          Width = 29
          Height = 16
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Toolbar974: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 0
          TabOrder = 0
          object BtAltAplic: TSpeedButton
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Alterar o registro selecionado|'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            Visible = False
          end
          object BtExcAplic: TSpeedButton
            Left = 50
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Excluir o registro selecionado|'
            AllowAllUp = True
            GroupIndex = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            Visible = False
          end
          object BtIncAplic: TSpeedButton
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Inserir novo registro|'
            AllowAllUp = True
            GroupIndex = 1
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = BtIncAplicClick
          end
        end
      end
      object pnlTotais: TPanel
        Left = 4
        Top = 285
        Width = 782
        Height = 23
        Align = alBottom
        Caption = ' '
        Enabled = False
        TabOrder = 2
        object DbQtdTotCotas: TDBRealEdit
          Left = 468
          Top = 1
          Width = 143
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTOTREND'
          DataSource = DsTotalDetalhe
        end
        object DbVlrTotCustoAtual: TDBRealEdit
          Left = 329
          Top = 1
          Width = 138
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTOTCUST'
          DataSource = DsTotalDetalhe
        end
        object DbSldTotAtual: TDBRealEdit
          Left = 612
          Top = 1
          Width = 146
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'SLDTOTFUNDO'
          DataSource = DsTotalDetalhe
        end
        object DbVlrTotCustoOrg: TDBRealEdit
          Left = 190
          Top = 1
          Width = 138
          Height = 21
          Alignment = taRightJustify
          Color = clWhite
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTOTAPL'
          DataSource = DsTotalDetalhe
        end
        object Panel9: TPanel
          Left = 4
          Top = 1
          Width = 185
          Height = 20
          BevelOuter = bvLowered
          Caption = 'Total'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 792
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        AllowAllUp = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        AllowAllUp = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 247
        AllowAllUp = False
      end
      inherited sbtnApagar: TToolbarButton97
        AllowAllUp = False
        Enabled = False
      end
      object sbtnImprimir: TToolbarButton97
        Left = 180
        Top = 0
        Width = 67
        Height = 41
        GroupIndex = 1
        Caption = '&Imprimir'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimirClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 792
    inherited tb97Fundo: TToolbar97
      TabOrder = 0
    end
    inherited TB97oKCancelar: TToolbar97
      TabOrder = 1
    end
  end
  object pnlTitulo: TPanel [3]
    Left = 0
    Top = 47
    Width = 792
    Height = 41
    Align = alTop
    TabOrder = 3
    object lbNomItem: TfcLabel
      Left = 16
      Top = 8
      Width = 505
      Height = 24
      Caption = 'Amortização de Cotas de Fundo de Investimentos'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 362
    Top = 4
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 373
    Top = 151
  end
  inherited upd: TUpdateSQL
    Left = 304
    Top = 151
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.DATALIQUIDACAO'
      'OPERACAOFUNDO.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Fundo de Investimentos'
      'Tipo de Operação'
      'Data Operação'
      'Data Liquidação'
      'Valor Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.IDTIPOOPERACAO'
      'FUNDOINVEST.IDTIPOFUNDOINVEST'
      'OPERACAOFUNDO.IDOPERACAOFUNDO')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO IN (-43,-143)'
      'FUNDOINVEST.IDFUNDOINVEST     = OPERACAOFUNDO.IDFUNDOINVEST'
      'TIPOOPERACAO.IDTIPOINVEST     = OPERACAOFUNDO.IDTIPOINVEST'
      'TIPOOPERACAO.IDTIPOOPERACAO   = OPERACAOFUNDO.IDTIPOOPERACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,###,###,###0.00')
    Larguras.Strings = (
      '35'
      '30'
      '15'
      '15'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    Left = 642
    Top = 4
  end
  inherited ImlPadrao: TImageList
    Left = 435
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 550
    Top = 4
  end
  inherited qry: TwwQuery
    Left = 227
    Top = 151
  end
  object UpdDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNDO'
      'set'
      '  DATAAPLICACAO = :DATAAPLICACAO,'
      '  DATAMOVFUNDO = :DATAMOVFUNDO,'
      '  VLRAPLICADO = :VLRAPLICADO,'
      '  VLRCUSTOATUAL = :VLRCUSTOATUAL,'
      '  SALDOVLRFUNDO = :SALDOVLRFUNDO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  IDHISTFUNDO = :IDHISTFUNDO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  DATAULTPGTOIR = :DATAULTPGTOIR,'
      '  VLRMOVFUNDO = :VLRMOVFUNDO,'
      '  VLRIRPROV = :VLRIRPROV,'
      '  VLRIOFPROV = :VLRIOFPROV,'
      '  COTASMOVFUNDO = :COTASMOVFUNDO,'
      '  SALDOQTDCOTAS = :SALDOQTDCOTAS,'
      '  COTAAPLICACAO = :COTAAPLICACAO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  PLANO = :PLANO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  SALDOQTDCOTASBLQ = :SALDOQTDCOTASBLQ'
      'where'
      '  IDHISTFUNDO = :OLD_IDHISTFUNDO')
    InsertSQL.Strings = (
      'insert into HISTFUNDO'
      
        '  (DATAAPLICACAO, DATAMOVFUNDO, VLRAPLICADO, VLRCUSTOATUAL, SALD' +
        'OVLRFUNDO,'
      
        '   IDFUNDOINVEST, IDHISTFUNDO, IDTIPOOPERACAO, IDCARTEIRAINVEST,' +
        ' IDOPERACAOFUNDO,'
      
        '   DATAULTPGTOIR, VLRMOVFUNDO, VLRIRPROV, VLRIOFPROV, COTASMOVFU' +
        'NDO, SALDOQTDCOTAS,'
      
        '   COTAAPLICACAO, CODDOCUMENTO, PLNCODIGO, PLANO, IDTIPOINVEST, ' +
        'SALDOQTDCOTASBLQ,'
      '   IDHISTFUNDO)'
      'values'
      
        '  (:DATAAPLICACAO, :DATAMOVFUNDO, :VLRAPLICADO, :VLRCUSTOATUAL, ' +
        ':SALDOVLRFUNDO,'
      
        '   :IDFUNDOINVEST, :IDHISTFUNDO, :IDTIPOOPERACAO, :IDCARTEIRAINV' +
        'EST, :IDOPERACAOFUNDO,'
      
        '   :DATAULTPGTOIR, :VLRMOVFUNDO, :VLRIRPROV, :VLRIOFPROV, :COTAS' +
        'MOVFUNDO,'
      
        '   :SALDOQTDCOTAS, :COTAAPLICACAO, :CODDOCUMENTO, :PLNCODIGO, :P' +
        'LANO, :IDTIPOINVEST,'
      '   :SALDOQTDCOTASBLQ, :IDHISTFUNDO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTFUNDO'
      'where'
      '  IDHISTFUNDO = :OLD_IDHISTFUNDO')
    Left = 304
    Top = 197
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (HI.XPKHISTFUNDO)*/'
      '   HISTFUNDO.DATAAPLICACAO,'
      '   HISTFUNDO.DATAMOVFUNDO,'
      '   HISTFUNDO.VLRAPLICADO,'
      '   HISTFUNDO.VLRCUSTOATUAL,'
      '   DECODE(HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL,'
      '            (ABS(HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL)*-1),0,'
      
        '                     HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL) AS V' +
        'LRRENDIMENTO,'
      
        '   (HISTFUNDO.VLRAPLICADO+(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLR' +
        'APLICADO)) AS SALDOVLRFUNDO,'
      '   HISTFUNDO.IDFUNDOINVEST,'
      '   HISTFUNDO.IDHISTFUNDO,'
      '   HISTFUNDO.IDTIPOOPERACAO,'
      '   HISTFUNDO.IDCARTEIRAINVEST,'
      '   HISTFUNDO.IDOPERACAOFUNDO,'
      '   HISTFUNDO.DATAULTPGTOIR,'
      '   HISTFUNDO.VLRMOVFUNDO,'
      '   HISTFUNDO.VLRIRPROV,'
      '   HISTFUNDO.VLRIOFPROV,'
      '   HISTFUNDO.COTASMOVFUNDO,'
      '   HISTFUNDO.SALDOQTDCOTAS,'
      '   HISTFUNDO.COTAAPLICACAO,'
      '   HISTFUNDO.CODDOCUMENTO,'
      '   HISTFUNDO.PLNCODIGO,'
      '   HISTFUNDO.PLANO,'
      '   HISTFUNDO.IDTIPOINVEST,'
      '   HISTFUNDO.SALDOQTDCOTASBLQ'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      
        '       (HISTFUNDO.IDHISTFUNDO IN (SELECT /*+INDEX (HI.XIE1HISTFU' +
        'NDO)*/ MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                                  FROM    HISTFUNDO'
      
        '                                  WHERE    (IDTIPOINVEST      = ' +
        ':IDTIPOINVEST)'
      
        '                                     AND   (IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR)'
      
        '                                     AND   (IDFUNDOINVEST     = ' +
        ':IDFUNDOINVEST)'
      
        '                                     AND   (DATAAPLICACAO    <= ' +
        'TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))'
      
        '                                     AND   (DATAMOVFUNDO     <= ' +
        'TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39'))'
      
        '                                     AND ((:IDOPERACAOFUNDO IS N' +
        'ULL) OR (IDOPERACAOFUNDO = :IDOPERACAOFUNDO))'
      
        '                                 GROUP BY IDTIPOINVEST, IDPLANPR' +
        'EVCTBPATR, IDFUNDOINVEST, DATAAPLICACAO))'
      '   AND (HISTFUNDO.SALDOQTDCOTAS > 0)'
      
        'ORDER BY HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.DATAAPLICACAO, HISTF' +
        'UNDO.DATAMOVFUNDO, HISTFUNDO.IDHISTFUNDO DESC')
    UpdateObject = UpdDetalhe
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRAPLICADO'#9'###,###,###,###0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 227
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
    object QryDetalheDATAAPLICACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da~Aplicação'
      DisplayWidth = 12
      FieldName = 'DATAAPLICACAO'
    end
    object QryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryDetalheDATAMOVFUNDO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da~ Cota'
      DisplayWidth = 11
      FieldName = 'DATAMOVFUNDO'
    end
    object QryDetalheVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor de~Custo Atual'
      DisplayWidth = 19
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDetalheVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Valor de~Custo Inicial'
      DisplayWidth = 19
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDetalheVLRRENDIMENTO: TFloatField
      DisplayLabel = 'Valor do~Rendimento'
      DisplayWidth = 20
      FieldName = 'VLRRENDIMENTO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDetalheSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 20
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDetalheIDHISTFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTFUNDO'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryDetalheDATAULTPGTOIR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTPGTOIR'
      Visible = False
    end
    object QryDetalheVLRMOVFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMOVFUNDO'
      Visible = False
    end
    object QryDetalheVLRIRPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIRPROV'
      Visible = False
    end
    object QryDetalheVLRIOFPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIOFPROV'
      Visible = False
    end
    object QryDetalheCOTASMOVFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'COTASMOVFUNDO'
      Visible = False
    end
    object QryDetalheSALDOQTDCOTAS: TFloatField
      DisplayWidth = 10
      FieldName = 'SALDOQTDCOTAS'
      Visible = False
    end
    object QryDetalheCOTAAPLICACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'COTAAPLICACAO'
      Visible = False
    end
    object QryDetalheCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QryDetalhePLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QryDetalhePLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheSALDOQTDCOTASBLQ: TFloatField
      FieldName = 'SALDOQTDCOTASBLQ'
      Visible = False
    end
  end
  object DsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 373
    Top = 197
  end
  object QryFundoInvestOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP,'
      '  FUN.DTAINIPROC'
      'FROM'
      '  HISTFUNDOINVEST FUN'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT F.IDFUNDOINVEST || TO_CHAR(MAX(F.DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      '       WHERE'
      '           (T.IDTIPOINVEST      = :IDTIPOINVEST)  AND'
      
        '           ((:IDTIPOFUNDOINVEST IS NULL) OR (F.IDTIPOFUNDOINVEST' +
        ' = :IDTIPOFUNDOINVEST))  AND'
      
        '           ((:DATAMOVFUNDO IS NULL) OR (F.DTAVIGENCIA < TO_DATE(' +
        ':DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+1)) AND'
      '           (T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST)'
      '       GROUP BY F.IDFUNDOINVEST))'
      
        'AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST))'
      'AND (FUN.STAFUNDO = 1)'
      'ORDER BY FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 498
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestOperacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestOperacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestOperacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestOperacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestOperacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestOperacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestOperacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoInvestOperacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestOperacaoDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QryBuscaTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      'FROM'
      '       TIPOOPERACAO '
      'WHERE'
      '       IDTIPOINVEST      = :IDTIPOINVEST  AND'
      '       IDTIPOOPERACAO    IN (-43,-143)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 607
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryBuscaTipoOperDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object QryBuscaTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryBuscaTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object QryBuscaTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryBuscaTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      Size = 1
    end
    object QryBuscaTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object QryBuscaTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object QryBuscaTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Visible = False
      Size = 1
    end
    object QryBuscaTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Visible = False
      Size = 1
    end
    object QryBuscaTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Visible = False
      Size = 1
    end
    object QryBuscaTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Visible = False
      Size = 1
    end
  end
  object QryOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '  OPERACAOFUNDO'
      'WHERE '
      '  IDOPERACAOFUNDO = -1'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdOperacao
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 227
    Top = 245
  end
  object DsOperacao: TwwDataSource
    DataSet = QryOperacao
    Left = 304
    Top = 245
  end
  object UpdOperacao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, IDTIPOOPERACAO, '
      
        '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLR' +
        'OPERACAO, '
      
        '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, IDOPERACA' +
        'OORIGEM, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, :IDTIPOI' +
        'NVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, :QTDOPERACAO, '
      
        '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, :STA' +
        'CONFIRMA, '
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 373
    Top = 245
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST')
    ValidateWithMask = True
    Left = 498
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoFundoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 30
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 609
    Top = 197
  end
  object DsTotalDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryTotalDetalhe
    Left = 304
    Top = 290
  end
  object QryTotalDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (HI.XPKHISTFUNDO)*/'
      
        'SUM(NVL(VLRAPLICADO,0)) AS VLRTOTAPL, SUM(NVL(VLRCUSTOATUAL,0)) ' +
        'AS VLRTOTCUST,'
      'SUM(NVL(DECODE(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUAL,'
      
        '         (ABS(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUAL)*-' +
        '1),0,'
      
        '                  HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUA' +
        'L),0)) AS VLRTOTREND,'
      
        'SUM(NVL(VLRAPLICADO,0)+(NVL(SALDOVLRFUNDO,0)-NVL(VLRAPLICADO,0))' +
        ') AS SLDTOTFUNDO'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      
        '       (IDHISTFUNDO IN (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/ MAX' +
        '(IDHISTFUNDO) AS IDHISTFUNDO'
      '                        FROM    HISTFUNDO'
      
        '                        WHERE  (IDTIPOINVEST       = :IDTIPOINVE' +
        'ST)'
      
        '                           AND (IDPLANPREVCTBPATR  = :IDPLANPREV' +
        'CTBPATR)'
      
        '                           AND (IDFUNDOINVEST      = :IDFUNDOINV' +
        'EST)'
      
        '                           AND (DATAAPLICACAO     <= TO_DATE(:DA' +
        'TAMOVFUNDO,'#39'DD/MM/YYYY'#39'))'
      
        '                           AND (DATAMOVFUNDO      <= TO_DATE(:DA' +
        'TAMOVFUNDO,'#39'DD/MM/YYYY'#39'))'
      
        '                           AND ((:IDOPERACAOFUNDO IS NULL) OR (I' +
        'DOPERACAOFUNDO = :IDOPERACAOFUNDO))'
      
        '                       GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR,' +
        ' IDFUNDOINVEST, DATAAPLICACAO))'
      '   AND (SALDOQTDCOTAS > 0)')
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 227
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 611
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryValorAmortizado: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   VLROPERACAO, IDOPERACAOFUNDO '
      'FROM'
      '   OPERACAOFUNDO'
      'WHERE'
      '   IDTIPOINVEST      =:IDTIPOINVEST      AND'
      '   IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '   IDFUNDOINVEST     =:IDFUNDOINVEST     AND'
      '   DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      '   IDTIPOOPERACAO    =:IDTIPOOPERACAO    AND'
      
        '((:IDOPERACAOFUNDO IS NULL) OR (IDOPERACAOFUNDO = :IDOPERACAOFUN' +
        'DO))'
      ' ')
    ValidateWithMask = True
    Left = 497
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryOperFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOFUNDO'
      'WHERE'
      '     IDOPERACAOFUNDO=:IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 497
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryVerLiquidacaoOper: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOFUNDO'
      'FROM'
      '   OPERACAOFUNDO'
      'WHERE'
      '   IDTIPOINVEST      =:IDTIPOINVEST      AND'
      '   IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '   IDFUNDOINVEST     =:IDFUNDOINVEST     AND'
      '   DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')   AND'
      '   DATALIQUIDACAO    = TO_DATE(:DATALIQUIDACAO,'#39'DD/MM/YYYY'#39') AND'
      '   IDTIPOOPERACAO    =:IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 500
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATALIQUIDACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
  end
  object QryVerOperAmortizacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOFUNDO'
      'FROM'
      '   OPERACAOFUNDO'
      'WHERE'
      '   IDTIPOINVEST      =:IDTIPOINVEST      AND'
      '   IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '   IDFUNDOINVEST     =:IDFUNDOINVEST     AND'
      '   DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      '   IDTIPOOPERACAO    =:IDTIPOOPERACAO    AND'
      
        '((:IDOPERACAOFUNDO IS NULL) OR (IDOPERACAOFUNDO = :IDOPERACAOFUN' +
        'DO))'
      ' ')
    ValidateWithMask = True
    Left = 609
    Top = 290
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
end
