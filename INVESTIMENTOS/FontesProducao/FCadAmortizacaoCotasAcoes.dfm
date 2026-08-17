inherited FrmCadAmortizacaoCotasAcoes: TFrmCadAmortizacaoCotasAcoes
  Left = 224
  Top = 54
  HelpContext = 790224
  Caption = 'Amortização'
  ClientHeight = 536
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 450
    object Panel2: TPanel
      Left = 1
      Top = 42
      Width = 790
      Height = 407
      Align = alClient
      TabOrder = 1
      object pnlMestre: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 50
        Align = alTop
        TabOrder = 0
        object Label14: TLabel
          Left = 144
          Top = 9
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
          Left = 12
          Top = 9
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object DblFundosInvest: TwwDBLookupCombo
          Left = 144
          Top = 25
          Width = 456
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
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DblFundosInvestCloseUp
          OnEnter = DblFundosInvestEnter
          OnExit = DblFundosInvestExit
        end
        object DtEdDataReferenciaGeral: TCMDateTimePicker
          Left = 12
          Top = 25
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
          TabOrder = 0
          OnExit = DtEdDataReferenciaGeralExit
        end
      end
      object tbcDetalhe: TTabControlDetalhe
        Left = 1
        Top = 51
        Width = 788
        Height = 355
        Align = alClient
        TabOrder = 1
        detdbGrids.Strings = (
          'dbgrdDet')
        object pgctrlDetalhe: TPageControl
          Left = 4
          Top = 62
          Width = 780
          Height = 266
          ActivePage = tbsDet
          Align = alClient
          TabOrder = 1
          object tbsDet: TTabSheet
            Caption = 'Detalhe'
            TabVisible = False
            object dbgrdDet: TwwDBGrid
              Left = 0
              Top = 0
              Width = 772
              Height = 256
              Selected.Strings = (
                'DATAAPLICACAO'#9'12'#9'Data da~Aplicação'
                'DATAMOVFUNDO'#9'11'#9'Data da Cota'
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
              Width = 772
              Height = 256
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label1: TLabel
                Left = 375
                Top = 170
                Width = 107
                Height = 13
                Caption = 'Valor da Operação'
              end
              object Label3: TLabel
                Left = 11
                Top = 1
                Width = 117
                Height = 13
                Caption = 'Total do Custo Atual'
              end
              object Label4: TLabel
                Left = 11
                Top = 84
                Width = 117
                Height = 13
                Caption = 'Total do Saldo Atual'
              end
              object Label5: TLabel
                Left = 11
                Top = 126
                Width = 105
                Height = 13
                Caption = 'Data da Operação'
              end
              object Label6: TLabel
                Left = 11
                Top = 42
                Width = 119
                Height = 13
                Caption = 'Total do Rendimento'
              end
              object lblDtLiquidacao: TLabel
                Left = 193
                Top = 126
                Width = 112
                Height = 13
                Caption = 'Data de Liquidação'
              end
              object lblPU: TLabel
                Left = 11
                Top = 170
                Width = 18
                Height = 13
                Caption = 'PU'
              end
              object lblQtd: TLabel
                Left = 193
                Top = 170
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object Dock974: TDock97
                Left = 682
                Top = 0
                Width = 90
                Height = 256
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
              object DbValorCustoNovo: TDBRealEdit
                Left = 375
                Top = 186
                Width = 170
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 7
                WordWrap = False
                OnExit = DbValorCustoNovoExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLROPERACAO'
                DataSource = DsOperacao
              end
              object dbrVlrCustoTotal: TDBRealEdit
                Left = 11
                Top = 16
                Width = 170
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
              object dbrVlrSaldoAtual: TDBRealEdit
                Left = 11
                Top = 99
                Width = 170
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
                Width = 130
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAOPERACAO'
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
                TabOrder = 3
                OnExit = DtEdDataOperacaoExit
              end
              object dbrVlrRendTotal: TDBRealEdit
                Left = 11
                Top = 57
                Width = 170
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
              object DtEdDataLiquidacao: TCMDateTimePicker
                Left = 193
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
              object dbPU: TRealEdit
                Left = 11
                Top = 186
                Width = 170
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 5
                WordWrap = False
                OnExit = dbPUExit
                IntDigits = 15
                DecDigits = 9
                NumberFormat = fNumber
                Signal = True
              end
              object dbQtdCotas: TRealEdit
                Left = 193
                Top = 186
                Width = 170
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 6
                WordWrap = False
                OnExit = dbQtdCotasExit
                IntDigits = 15
                DecDigits = 9
                NumberFormat = fNumber
                Signal = True
              end
            end
          end
        end
        object Dock973: TDock97
          Left = 4
          Top = 31
          Width = 780
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
        object Panel1: TPanel
          Left = 4
          Top = 6
          Width = 780
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'Lançamento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pnlTotais: TPanel
          Left = 4
          Top = 328
          Width = 780
          Height = 23
          Align = alBottom
          Caption = ' '
          Enabled = False
          TabOrder = 3
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
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 251
        Height = 24
        Caption = 'Amortização de Principal'
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
      Left = 620
      DockPos = 634
      TabOrder = 0
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 451
      DockPos = 465
      TabOrder = 1
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    inline fraMensIntCotFdo: TfraMensagem
      Width = 464
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 464
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Width = 267
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 265
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 360
    Top = 1
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
  inherited ds: TwwDataSource
    Left = 376
    Top = 158
  end
  inherited upd: TUpdateSQL
    Left = 312
    Top = 158
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Fundo de Investimentos'
      'Data da Operação'
      'Valor da Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO = -43'
      'FUNDOINVEST.IDFUNDOINVEST     = OPERACAOFUNDO.IDFUNDOINVEST')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,###0.00')
    Larguras.Strings = (
      '60'
      '18'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    Left = 656
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 433
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 564
    Top = 1
  end
  inherited qry: TwwQuery
    Left = 243
    Top = 158
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
      '  (DATAAPLICACAO, DATAMOVFUNDO, VLRAPLICADO, VLRCUSTOATUAL, '
      'SALDOVLRFUNDO, '
      
        '   IDFUNDOINVEST, IDHISTFUNDO, IDTIPOOPERACAO, IDCARTEIRAINVEST,' +
        ' '
      'IDOPERACAOFUNDO, '
      '   DATAULTPGTOIR, VLRMOVFUNDO, VLRIRPROV, VLRIOFPROV, '
      'COTASMOVFUNDO, SALDOQTDCOTAS, '
      '   COTAAPLICACAO, CODDOCUMENTO, PLNCODIGO, PLANO, IDTIPOINVEST, '
      'SALDOQTDCOTASBLQ, IDHISTFUNDO)'
      'values'
      '  (:DATAAPLICACAO, :DATAMOVFUNDO, :VLRAPLICADO, :VLRCUSTOATUAL, '
      ':SALDOVLRFUNDO, '
      
        '   :IDFUNDOINVEST, :IDHISTFUNDO, :IDTIPOOPERACAO, :IDCARTEIRAINV' +
        'EST, '
      ':IDOPERACAOFUNDO, '
      '   :DATAULTPGTOIR, :VLRMOVFUNDO, :VLRIRPROV, :VLRIOFPROV, '
      ':COTASMOVFUNDO, '
      '   :SALDOQTDCOTAS, :COTAAPLICACAO, :CODDOCUMENTO, :PLNCODIGO, '
      ':PLANO, :IDTIPOINVEST, '
      '   :SALDOQTDCOTASBLQ, :IDHISTFUNDO)')
    DeleteSQL.Strings = (
      'delete from HISTFUNDO'
      'where'
      '  IDHISTFUNDO = :OLD_IDHISTFUNDO')
    Left = 312
    Top = 201
  end
  object QryDetalhe: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HISTFUNDO.DATAAPLICACAO, HISTFUNDO.DATAMOVFUNDO, HISTFUNDO.VL' +
        'RAPLICADO,'
      '   HISTFUNDO.VLRCUSTOATUAL,'
      ''
      '   DECODE(HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL,'
      '            (ABS(HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL)*-1),0,'
      
        '                     HISTFUNDO.SALDOVLRFUNDO-VLRCUSTOATUAL) AS V' +
        'LRRENDIMENTO,'
      ''
      
        '  (HISTFUNDO.VLRAPLICADO+(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRA' +
        'PLICADO)) AS SALDOVLRFUNDO,'
      
        '   HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.IDHISTFUNDO, HISTFUNDO.IDT' +
        'IPOOPERACAO,'
      '   HISTFUNDO.IDCARTEIRAINVEST, HISTFUNDO.IDOPERACAOFUNDO, '
      '   HISTFUNDO.DATAULTPGTOIR, HISTFUNDO.VLRMOVFUNDO,'
      
        '   HISTFUNDO.VLRIRPROV, HISTFUNDO.VLRIOFPROV, HISTFUNDO.COTASMOV' +
        'FUNDO,'
      
        '   HISTFUNDO.SALDOQTDCOTAS, HISTFUNDO.COTAAPLICACAO, HISTFUNDO.C' +
        'ODDOCUMENTO,'
      '   HISTFUNDO.PLNCODIGO, HISTFUNDO.PLANO, HISTFUNDO.IDTIPOINVEST,'
      '   HISTFUNDO.SALDOQTDCOTASBLQ'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      '   (HISTFUNDO.IDHISTFUNDO IN (SELECT'
      
        '                                 MAX(HI.IDHISTFUNDO) AS IDHISTFU' +
        'NDO'
      '                              FROM'
      '                                 HISTFUNDO HI,'
      
        '                                (SELECT IDTIPOINVEST, IDTIPOOPER' +
        'ACAO'
      '                                 FROM   TIPOOPERACAO'
      
        '                                 WHERE  IDTIPOINVEST      = :IDT' +
        'IPOINVEST'
      
        '                                 AND    NATUREZAOPERACAO <> '#39'R'#39')' +
        ' TP'
      '                              WHERE'
      
        '                                (HI.IDTIPOINVEST      = :IDTIPOI' +
        'NVEST) AND'
      
        '                                (HI.IDPLANPREVCTBPATR = :IDPLANP' +
        'REVCTBPATR) AND'
      
        '                                (HI.IDFUNDOINVEST     = :IDFUNDO' +
        'INVEST) AND'
      
        '                                (HI.DATAAPLICACAO    <= :DATAMOV' +
        'FUNDO) AND'
      
        '                                (HI.DATAMOVFUNDO     <= :DATAMOV' +
        'FUNDO) AND'
      
        '                                (TP.IDTIPOINVEST      = HI.IDTIP' +
        'OINVEST) AND'
      
        '                                (TP.IDTIPOOPERACAO    = HI.IDTIP' +
        'OOPERACAO)'
      
        '                             GROUP BY HI.IDTIPOINVEST, HI.IDPLAN' +
        'PREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO)) AND'
      '   (HISTFUNDO.SALDOQTDCOTAS    > 0) '
      
        'ORDER BY HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.DATAAPLICACAO, HISTF' +
        'UNDO.DATAMOVFUNDO, HISTFUNDO.IDHISTFUNDO  DESC'
      ' '
      ' ')
    UpdateObject = UpdDetalhe
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T'
      'VLRAPLICADO'#9'###,###,###,###0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 243
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object QryDetalheDATAAPLICACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da~Aplicação'
      DisplayWidth = 12
      FieldName = 'DATAAPLICACAO'
    end
    object QryDetalheDATAMOVFUNDO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data da Cota'
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
    object QryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
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
    Left = 376
    Top = 201
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
      
        'AND ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST = :I' +
        'DTIPOFUNDOINVEST))'
      'ORDER BY FUN.DESCFUNDOINVEST'
      '')
    ValidateWithMask = True
    Left = 498
    Top = 156
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
    Left = 243
    Top = 244
    object QryOperacaoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOFUNDO'
    end
    object QryOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCARTEIRAINVEST'
    end
    object QryOperacaoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPEDIDOFUNDO'
    end
    object QryOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOINVEST'
    end
    object QryOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOOPERACAO'
    end
    object QryOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDFUNDOINVEST'
    end
    object QryOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object QryOperacaoDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATALIQUIDACAO'
    end
    object QryOperacaoQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
    end
    object QryOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
    end
    object QryOperacaoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
    end
    object QryOperacaoVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIR'
    end
    object QryOperacaoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIOF'
    end
    object QryOperacaoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRRENDIMENTO'
    end
    object QryOperacaoSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object QryOperacaoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOORIGEM'
    end
    object QryOperacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPLANPREVCTBPATR'
    end
    object QryOperacaoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATACOTIZACAO'
    end
    object QryOperacaoVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRDESCONTO'
    end
    object QryOperacaoIDCOMPOSICAOFUNDO: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOMPOSICAOFUNDO'
    end
    object QryOperacaoSTAESPECIFICADO: TStringField
      FieldName = 'STAESPECIFICADO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STAESPECIFICADO'
      FixedChar = True
      Size = 1
    end
    object QryOperacaoVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOLOCACAO'
    end
    object QryOperacaoVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRTAXAS'
    end
    object QryOperacaoVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCORRETAGEM'
    end
    object QryOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGDTINCLUSAO'
    end
    object QryOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryOperacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object QryOperacaoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLANO'
    end
    object QryOperacaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLNCODIGO'
    end
    object QryOperacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.CODDOCUMENTO'
    end
    object QryOperacaoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAODIREITO'
    end
    object QryOperacaoQTDUSUFRUTO: TFloatField
      FieldName = 'QTDUSUFRUTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDUSUFRUTO'
    end
    object QryOperacaoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOCOTA'
    end
    object QryOperacaoIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOTAINTEGRALIZA'
    end
  end
  object DsOperacao: TwwDataSource
    DataSet = QryOperacao
    Left = 376
    Top = 244
  end
  object UpdOperacao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
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
        'T,'
      
        '   IDTIPOOPERACAO,  IDFUNDOINVEST,    DATAOPERACAO, DATALIQUIDAC' +
        'AO, '
      'QTDOPERACAO,'
      '   VLROPERACAO,     VLRCOTA, VLRIR,   VLRIOF, VLRRENDIMENTO, '
      'STACONFIRMA,'
      '   IDOPERACAOORIGEM,IDPLANPREVCTBPATR)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST,'
      '   :IDTIPOOPERACAO,  :IDFUNDOINVEST,    :DATAOPERACAO, '
      ':DATALIQUIDACAO, :QTDOPERACAO,'
      
        '   :VLROPERACAO,     :VLRCOTA, :VLRIR,  :VLRIOF, :VLRRENDIMENTO,' +
        ' '
      ':STACONFIRMA,'
      '   :IDOPERACAOORIGEM,:IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 312
    Top = 244
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 498
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 607
    Top = 202
  end
  object QryVerOperAmortizacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTFUNDO, IDOPERACAOFUNDO'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      '   IDTIPOINVEST      = :IDTIPOINVEST        AND'
      '   IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR   AND'
      '   IDFUNDOINVEST     = :IDFUNDOINVEST       AND'
      '   DATAMOVFUNDO      = :DATAMOVFUNDO        AND'
      '   IDTIPOOPERACAO    = -43')
    ValidateWithMask = True
    Left = 607
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object QryVerOperAmortizacaoIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.IDHISTFUNDO'
    end
    object QryVerOperAmortizacaoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.IDOPERACAOFUNDO'
    end
  end
  object DsTotalDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryTotalDetalhe
    Left = 376
    Top = 295
  end
  object QryTotalDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(NVL(VLRAPLICADO,0)) AS VLRTOTAPL, SUM(NVL(VLRCUSTOATUAL,0' +
        ')) AS VLRTOTCUST,'
      
        '   SUM(NVL(DECODE(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUA' +
        'L,'
      
        '            (ABS(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUAL' +
        ')*-1),0,'
      
        '                 HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRCUSTOATUAL' +
        '),0)) AS VLRTOTREND,'
      
        '   SUM(NVL(VLRAPLICADO,0)+(NVL(SALDOVLRFUNDO,0)-NVL(VLRAPLICADO,' +
        '0))) AS SLDTOTFUNDO'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      '   (IDHISTFUNDO IN (SELECT MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO'
      '                    FROM'
      '                        HISTFUNDO HI,'
      '                       (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '                        FROM   TIPOOPERACAO'
      '                        WHERE  IDTIPOINVEST      = :IDTIPOINVEST'
      '                        AND    NATUREZAOPERACAO <> '#39'R'#39') TP'
      '                    WHERE'
      
        '                       (HI.IDTIPOINVEST      = :IDTIPOINVEST) AN' +
        'D'
      
        '                       (HI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPAT' +
        'R) AND'
      
        '                       (HI.IDFUNDOINVEST     = :IDFUNDOINVEST) A' +
        'ND'
      
        '                       (HI.DATAAPLICACAO    <= :DATAMOVFUNDO) AN' +
        'D'
      
        '                       (HI.DATAMOVFUNDO     <= :DATAMOVFUNDO) AN' +
        'D'
      
        '                       (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) ' +
        'AND'
      
        '                       (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO' +
        ')'
      
        '                    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPA' +
        'TR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO)) AND'
      '   (SALDOQTDCOTAS > 0)'
      ' '
      ' ')
    PictureMasks.Strings = (
      'DATAAPLICACAO'#9'###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 243
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
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
    Left = 602
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryAux1: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 607
    Top = 156
  end
  object QryValorAmortizado: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   OPERACAOFUNDO.VLROPERACAO'
      'FROM'
      '   OPERACAOFUNDO'
      'WHERE'
      '   IDTIPOINVEST      =:IDTIPOINVEST      AND'
      '   IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '   IDFUNDOINVEST     =:IDFUNDOINVEST     AND'
      '   DATAOPERACAO      =:DATAOPERACAO      AND'
      '   IDTIPOOPERACAO    =:IDTIPOOPERACAO ')
    ValidateWithMask = True
    Left = 498
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
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
      '       TIPOOPERACAO TP'
      'WHERE'
      '       TP.IDTIPOINVEST      = :TIPOINVEST      AND'
      '       TP.IDTIPOOPERACAO    = :TIPOOPERACAO ')
    ValidateWithMask = True
    Left = 607
    Top = 250
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptResult
      end>
    object QryBuscaTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryBuscaTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object QryBuscaTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
    end
    object QryBuscaTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object QryBuscaTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryBuscaTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
  end
  object QryOperFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOFUNDO'
      'WHERE'
      '     IDOPERACAOFUNDO=:IDOPERACAOFUNDO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 498
    Top = 202
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object qryLancAmortFutura: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVFUNDO) FROM HISTFUNDO'
      'WHERE'
      '    IDTIPOINVEST      =:IDTIPOINVEST'
      'AND IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR'
      'AND IDFUNDOINVEST     =:IDFUNDOINVEST'
      'AND DATAMOVFUNDO     >=:DATAMOVFUNDO'
      'AND IDTIPOOPERACAO    =:IDTIPOOPERACAO')
    Left = 610
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
end
