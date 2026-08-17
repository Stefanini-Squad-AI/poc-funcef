inherited frmCadLanctoFundoVdAcoes: TfrmCadLanctoFundoVdAcoes
  Left = 213
  Top = 222
  HelpContext = 790221
  ActiveControl = bbtnAjuda
  Caption = ''
  ClientHeight = 536
  ClientWidth = 772
  OnKeyDown = FormKeyDown 
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 450
    object Panel2: TPanel
      Left = 1
      Top = 78
      Width = 770
      Height = 371
      Align = alClient
      TabOrder = 1
      object pnlRV: TPanel
        Left = 1
        Top = 1
        Width = 768
        Height = 245
        Align = alClient
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 28
          Width = 766
          Height = 216
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object PageControl1: TPageControl
            Left = 1
            Top = 1
            Width = 764
            Height = 214
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object dbgOperacao: TwwDBGrid
                Left = 0
                Top = 31
                Width = 756
                Height = 173
                Selected.Strings = (
                  'DATAOPERACAO'#9'16'#9'Data da Operação'
                  'DESCCARTINVEST'#9'36'#9'Carteira de Investimentos'
                  'DESCINVESTIMENTO'#9'28'#9'Investimento'
                  'VLROPERACAO'#9'18'#9'Valor'
                  'QTDEOPERACAO'#9'20'#9'Quantidade'
                  'PRECOUNITOPERACAO'#9'16'#9'Cotação'
                  'DATAVENCOPER'#9'15'#9'Data Liquidação'
                  'DESCTIPOOPERACAO'#9'60'#9'Tipo de operação'
                  'SGLCUSTODIANTE'#9'20'#9'Custodiante'
                  'NUMDOCUMENTO'#9'12'#9'Boleta')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsDetalhe
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = [dgEnterToTab, dgAllowDelete, dgAllowInsert]
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
                ParentFont = False
                TabOrder = 2
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icYellow
              end
              object pnlOperacoes: TPanel
                Left = 0
                Top = 31
                Width = 756
                Height = 173
                Align = alClient
                TabOrder = 0
                object Label1: TLabel
                  Left = 358
                  Top = 5
                  Width = 105
                  Height = 13
                  Caption = 'Data da Operação'
                end
                object Label3: TLabel
                  Left = 10
                  Top = 91
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object Label4: TLabel
                  Left = 10
                  Top = 48
                  Width = 73
                  Height = 13
                  Caption = 'Investimento'
                end
                object Label5: TLabel
                  Left = 10
                  Top = 5
                  Width = 45
                  Height = 13
                  Caption = 'Carteira'
                end
                object Label6: TLabel
                  Left = 359
                  Top = 48
                  Width = 68
                  Height = 13
                  Caption = 'Custodiante'
                end
                object Label7: TLabel
                  Left = 485
                  Top = 5
                  Width = 112
                  Height = 13
                  Caption = 'Data de Liquidação'
                end
                object Label8: TLabel
                  Left = 10
                  Top = 133
                  Width = 66
                  Height = 13
                  Caption = 'Quantidade'
                end
                object Label9: TLabel
                  Left = 359
                  Top = 133
                  Width = 30
                  Height = 13
                  Caption = 'Valor'
                  OnClick = bbtnCancelarClick
                end
                object Label13: TLabel
                  Left = 175
                  Top = 133
                  Width = 22
                  Height = 13
                  Caption = 'PU '
                end
                object dblCarteiraRV: TwwDBLookupCombo
                  Left = 10
                  Top = 20
                  Width = 342
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCARTINVEST'#9'50'#9'Descrição'#9'F')
                  DataField = 'ID'
                  DataSource = dsDetalhe
                  LookupTable = QryCarteiraRV
                  LookupField = 'ID'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblAcao: TwwDBLookupCombo
                  Left = 10
                  Top = 63
                  Width = 342
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
                  DataField = 'IDINVESTIMENTO'
                  DataSource = dsDetalhe
                  LookupTable = QryInvestimento
                  LookupField = 'IDINVESTIMENTO'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnExit = dblAcaoExit
                end
                object dblCustodiante: TwwDBLookupCombo
                  Left = 359
                  Top = 63
                  Width = 247
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'SGLCUSTODIANTE'#9'20'#9'Descrição'#9'F')
                  DataField = 'IDCUSTODIANTE'
                  DataSource = dsDetalhe
                  LookupTable = QryCustodiante
                  LookupField = 'IDCUSTODIANTE'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object Dock978: TDock97
                  Left = 670
                  Top = 1
                  Width = 85
                  Height = 171
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  object Toolbar975: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object BtOkDet: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 80
                      Height = 27
                      Caption = '&OK'
                      Default = True
                      Enabled = False
                      TabOrder = 0
                      OnClick = BtOkDetClick
                      Glyph.Data = {
                        BE060000424DBE06000000000000360400002800000024000000120000000100
                        0800000000008802000000000000000000000001000000010000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A600000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        03030303030303030303030303030303030303030303FF030303030303030303
                        03030303030303040403030303030303030303030303030303F8F8FF03030303
                        03030303030303030303040202040303030303030303030303030303F80303F8
                        FF030303030303030303030303040202020204030303030303030303030303F8
                        03030303F8FF0303030303030303030304020202020202040303030303030303
                        0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                        0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                        040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                        03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                        FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                        0303030303030303030303FA0202020403030303030303030303030303F8FF03
                        03F8FF03030303030303030303030303FA020202040303030303030303030303
                        0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                        03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                        030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                        0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                        03030303FA0202030303030303030303030303030303F8FFF803030303030303
                        030303030303030303FA0303030303030303030303030303030303F803030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303}
                      NumGlyphs = 2
                    end
                    object BtCancDet: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 80
                      Height = 27
                      Cancel = True
                      Caption = '&Cancelar'
                      Enabled = False
                      TabOrder = 1
                      OnClick = BtCancDetClick
                      Glyph.Data = {
                        BE060000424DBE06000000000000360400002800000024000000120000000100
                        0800000000008802000000000000000000000001000000010000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A600000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303F8F80303030303030303030303030303030303FF03030303030303030303
                        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                        030101010101F80303030303030303030303F8FF0303030303F8030303030303
                        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                        0303030303030303F90101010101F8030303030303030303030303F803030303
                        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                        03030303030303030303030303030303030303030303030303F8F8F803030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303}
                      NumGlyphs = 2
                    end
                    object BtVoltaDet: TBitBtn
                      Left = 0
                      Top = 54
                      Width = 80
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 2
                      OnClick = BtVoltaDetClick
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
                object dblTipoOperRV: TwwDBLookupCombo
                  Left = 10
                  Top = 106
                  Width = 596
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'#9'F')
                  DataField = 'IDTIPOOPERACAO'
                  DataSource = dsDetalhe
                  LookupTable = QryTipoOperRV
                  LookupField = 'IDTIPOOPERACAO'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dbdDataOperacao: TCMDateTimePicker
                  Left = 358
                  Top = 20
                  Width = 120
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAOPERACAO'
                  DataSource = dsDetalhe
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
                  OnExit = dbdDataOperacaoExit
                end
                object CMDateTimePicker1: TCMDateTimePicker
                  Left = 485
                  Top = 20
                  Width = 120
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAOPERACAO'
                  DataSource = dsDetalhe
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
                  TabOrder = 2
                end
                object dbrQtdProv: TDBRealEdit
                  Left = 10
                  Top = 148
                  Width = 145
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 6
                  WordWrap = False
                  OnExit = dbrQtdProvExit
                  IntDigits = 14
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QTDEOPERACAO'
                  DataSource = dsDetalhe
                end
                object dbrVlrProv: TDBRealEdit
                  Left = 359
                  Top = 148
                  Width = 148
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 8
                  WordWrap = False
                  OnClick = bbtnCancelarClick
                  OnExit = dbrVlrProvExit
                  IntDigits = 14
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLROPERACAO'
                  DataSource = dsDetalhe
                end
                object dbeDivPorAcao: TDBRealEdit
                  Left = 175
                  Top = 148
                  Width = 164
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,000000000000000')
                  TabOrder = 7
                  WordWrap = False
                  OnExit = dbeDivPorAcaoExit
                  IntDigits = 14
                  DecDigits = 15
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PRECOUNITOPERACAO'
                  DataSource = dsDetalhe
                end
              end
              object Dock977: TDock97
                Left = 0
                Top = 0
                Width = 756
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar974: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncDet: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir novo registro|'
                    AllowAllUp = True
                    GroupIndex = 1
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
                    OnClick = BtIncDetClick
                  end
                  object BtAltDet: TSpeedButton
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
                    OnClick = BtAltDetClick
                  end
                  object BtDelDet: TSpeedButton
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Remover o registro selecionado|'
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
                    OnClick = BtDelDetClick
                  end
                end
              end
            end
          end
        end
        object pnlDeAcoes: TPanel
          Left = 1
          Top = 1
          Width = 766
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Venda de Ações'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlFundos: TPanel
        Left = 1
        Top = 246
        Width = 768
        Height = 124
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object lblGestorFundo: TLabel
          Left = 419
          Top = 49
          Width = 47
          Height = 16
          Caption = 'Gestor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFundos: TLabel
          Left = 10
          Top = 31
          Width = 36
          Height = 13
          Caption = 'Fundo'
        end
        object lblGestorFundo1: TLabel
          Left = 419
          Top = 31
          Width = 38
          Height = 13
          Caption = 'Gestor'
        end
        object pnlParaFundos: TPanel
          Left = 2
          Top = 2
          Width = 764
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Aplicação em Fundo'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dblFundo: TwwDBLookupCombo
          Left = 10
          Top = 47
          Width = 402
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento'#9'F')
          LookupTable = QryFundos
          LookupField = 'IDFUNDOINVEST'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblFundoExit
        end
        object pnlDetalheFD: TPanel
          Left = 2
          Top = 73
          Width = 764
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object lblVlrFD: TLabel
            Left = 374
            Top = 4
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label2: TLabel
            Left = 10
            Top = 4
            Width = 105
            Height = 13
            Caption = 'Data da Operação'
          end
          object lblCota: TLabel
            Left = 235
            Top = 4
            Width = 78
            Height = 13
            Caption = 'Valor da Cota'
          end
          object lblQtdFD: TLabel
            Left = 515
            Top = 4
            Width = 66
            Height = 13
            Caption = 'Quantidade'
          end
          object lblDataLiqFD: TLabel
            Left = 644
            Top = 4
            Width = 112
            Height = 13
            Caption = 'Data de Liquidação'
          end
          object Label10: TLabel
            Left = 122
            Top = 4
            Width = 106
            Height = 13
            Caption = 'Data da Cotização'
          end
          object dbeVlrFD: TDBEdit
            Left = 374
            Top = 20
            Width = 136
            Height = 21
            Color = clWhite
            DataField = 'VLROPERACAO'
            DataSource = dsAuxFD
            TabOrder = 3
            OnExit = dbeVlrFDExit
          end
          object dbDtaCotaFD: TCMDateTimePicker
            Left = 10
            Top = 20
            Width = 108
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
            DataSource = dsAuxFD
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
            OnExit = dbDtaCotaFDExit
          end
          object dbDtaLiqFD: TCMDateTimePicker
            Left = 644
            Top = 20
            Width = 108
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATALIQUIDACAO'
            DataSource = dsAuxFD
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
            TabOrder = 5
          end
          object dbeQtdFD: TDBRealEdit
            Left = 515
            Top = 20
            Width = 124
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '             0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 17
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
            DataField = 'QTDOPERACAO'
            DataSource = dsAuxFD
          end
          object dbeCotaFD: TDBRealEdit
            Left = 235
            Top = 20
            Width = 134
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '             0,00')
            TabOrder = 2
            WordWrap = False
            OnExit = dbeCotaFDExit
            IntDigits = 17
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRCOTA'
            DataSource = dsAuxFD
          end
          object dbDtaCotizaFD: TCMDateTimePicker
            Left = 122
            Top = 20
            Width = 108
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATACOTIZACAO'
            DataSource = dsAuxFD
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
            OnExit = dbDtaCotizaFDExit
          end
        end
      end
    end
    object pnlData: TPanel
      Left = 1
      Top = 42
      Width = 770
      Height = 36
      Align = alTop
      TabOrder = 0
      object lblDataTransf: TLabel
        Left = 10
        Top = 12
        Width = 128
        Height = 13
        Caption = 'Data da Transferência'
      end
      object dbDtaTransf: TCMDateTimePicker
        Left = 157
        Top = 8
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
        OnExit = dbDtaTransfExit
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 770
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 10
        Top = 8
        Width = 582
        Height = 24
        Caption = 'Compra de Fundos de Investimento com Venda de Ações'
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
    Width = 772
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 247
      end
      object sbtnImprimir: TToolbarButton97
        Left = 180
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
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
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 600
      DockPos = 666
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 431
      DockPos = 497
    end
    inline fraMens: TfraMensagem
      Width = 430
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 430
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 346
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 344
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 347
          Width = 82
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 80
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 280
    Top = 6
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 419
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 459
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.DATACOTIZACAO'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO'
      'FUNDOINVEST.DESCFUNDOINVEST')
    TipodeDado.Strings = (
      'D'
      'D'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Operação'
      'Cotização'
      'Quantidade'
      'Valor da Operação'
      'Fundo de Investimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOINVEST = 6'
      'OPERACAOFUNDO.IDTIPOOPERACAO = -34'
      'OPERACAOFUNDO.IDFUNDOINVEST = FUNDOINVEST.IDFUNDOINVEST')
    Mascaras.Strings = (
      ''
      ''
      '#,##0'
      '#,##0.00'
      '')
    Larguras.Strings = (
      '12'
      '12'
      '18'
      '16'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 557
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 6
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000008400000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000008400000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 500
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOINVEST,IDOPERACAOFUNDO'
      'FROM'
      '   OPERINVXOPERFDO'
      'WHERE'
      
        '   ( ( (:IDOPERACAOINVEST IS NOT NULL) AND (IDOPERACAOINVEST = :' +
        'IDOPERACAOINVEST) ) OR (:IDOPERACAOINVEST IS NULL) ) AND'
      
        '   ( ( (:IDOPERACAOFUNDO  IS NOT NULL) AND (IDOPERACAOFUNDO  = :' +
        'IDOPERACAOFUNDO) )  OR (:IDOPERACAOFUNDO  IS NULL) )')
    Left = 378
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERINVXOPERFDO.IDOPERACAOINVEST'
    end
    object qryIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.OPERINVXOPERFDO.IDOPERACAOFUNDO'
    end
  end
  object QryTipoOperRV: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO,'
      '    FLGTRATAIR, IDMERCADO, FLGCONTAINVEST, VENCIMENTO'
      'FROM'
      '    TIPOOPERACAO '
      'WHERE '
      '    (IDTIPOOPERACAO in (-35, -118)) ')
    ValidateWithMask = True
    Left = 397
    Top = 253
    object QryTipoOperRVDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperRVIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperRVNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTipoOperRVFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTipoOperRVIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object QryTipoOperRVFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object QryTipoOperRVVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
  end
  object QryCustodiante: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    CS.IDCUSTODIANTE,CS.SGLCUSTODIANTE'
      'FROM'
      '    CUSTODIANTE CS,'
      '    PARAMINVEST PA'
      'WHERE'
      '    CS.IDCUSTODIANTE <> PA.IDBMF'
      'ORDER BY CS.SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 277
    Top = 229
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryTipoOperFD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO, FLGCONTAIN' +
        'VEST, '
      '    VENCIMENTO'
      'FROM'
      '    TIPOOPERACAO'
      'WHERE'
      '    (IDTIPOOPERACAO = -34)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 42
    Top = 222
    object QryTipoOperFDDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperFDIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperFDNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTipoOperFDFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
    object QryTipoOperFDVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
  end
  object QryCarteiraRV: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGERENC,2,'#39 +
        '0'#39') AS ID,'
      
        '       C.IDCARTEIRAINVEST, C.IDCARTEIRAGERENC, C.DESCCARTGERENC ' +
        'AS DESCCARTINVEST'
      'FROM CARTEIRAGERENC C, PARAMINVEST P'
      'WHERE P.FLGCARTGERENC = '#39'S'#39
      'UNION'
      'SELECT LPAD(C.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(0,2,'#39'0'#39') AS ID,'
      
        '       C.IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, C.DESCCARTINVE' +
        'ST'
      'FROM   CARTEIRAINVEST C, PARAMINVEST P'
      'WHERE C.IDTIPOINVEST = 2'
      
        '  AND C.IDCARTEIRAINVEST NOT IN (SELECT IDCARTEIRAINVEST FROM CA' +
        'RTEIRAGERENC)'
      '  AND P.FLGCARTGERENC = '#39'S'#39
      'UNION'
      'SELECT LPAD(C.IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS ID,'
      
        '       C.IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, C.DESCCARTINVE' +
        'ST'
      'FROM  CARTEIRAINVEST C, PARAMINVEST P'
      'WHERE C.IDTIPOINVEST = 2'
      '  AND C.IDTIPOINVEST IS NOT NULL'
      '  AND C.IDTIPOINVEST NOT IN (1,8)'
      '  AND ((P.FLGCARTGERENC IS NULL) OR (P.FLGCARTGERENC = '#39'N'#39'))'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 276
    Top = 181
    object QryCarteiraRVDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraRVIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryCarteiraRVID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 4
    end
    object QryCarteiraRVIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    IV.IDINVESTIMENTO, IV.IDEMISSOR, IV.DESCINVESTIMENTO,'
      '    AC.CODTIPOACAO'
      'FROM '
      '    INVESTIMENTO IV,'
      '    ACAO AC'
      'WHERE '
      '    (IV.IDTIPOINVEST=2) AND'
      '    (IV.IDINVESTIMENTO = AC.IDACAO)'
      'ORDER BY DESCINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 210
    Top = 102
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object QryInvestimentoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'BASEDADOS.ACAO.CODTIPOACAO'
      Visible = False
      Size = 5
    end
  end
  object QryFundos: TwwQuery
    CachedUpdates = True
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
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTAPLIC       , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC'
      'FROM'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY' +
        #39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '    (TFI.IDTIPOINVEST = :IDTIPOINVEST)              AND'
      '    (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      ''
      'ORDER BY FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 42
    Top = 270
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryFundosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundosIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundosIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundosQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundosQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundosPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundosIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundosIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object QryFundosTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object QryFundosTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundosMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryFundosCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Size = 25
    end
    object QryFundosSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundosPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
    end
    object QryFundosPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
    end
    object QryFundosPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
    end
    object QryFundosSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundosPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
    end
    object QryFundosPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
    end
    object QryFundosPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
    end
    object QryFundosCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryFundosSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundosSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundosCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Size = 30
    end
    object QryFundosDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
    end
    object QryFundosPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
    end
    object QryFundosDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object QryCotacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    QTDTITLOTE'
      'FROM'
      '    COTACAOINVEST'
      'WHERE'
      '    (IDINVESTIMENTO = :iIdInvestimento)')
    ValidateWithMask = True
    Left = 298
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end>
    object QryCotacaoInvestQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
      DisplayFormat = '###,###,###,###,###,##0'
      EditFormat = '###############0'
    end
  end
  object QryVendaAcao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    OP.IDTIPOOPERACAO,OP.IDTIPOINVEST,OP.VLROPERACAO, OP.IDINVES' +
        'TIMENTO, OP.IDOPERACAOINVEST,'
      
        '    OP.QTDEOPERACAO,OP.DATAOPERACAO,OP.DATAVENCOPER,OP.IDCUSTODI' +
        'ANTE,OP.PRECOUNITOPERACAO,'
      
        '    CU.SGLCUSTODIANTE,IV.DESCINVESTIMENTO,OP.NUMDOCUMENTO, TP.DE' +
        'SCTIPOOPERACAO,'
      
        '    CT.ID,OP.IDCARTEIRAINVEST,OP.IDCARTEIRAGERENC,CT.DESCCARTINV' +
        'EST, TP.FLGCONTAINVEST'
      'FROM'
      '    OPERACAOINVEST OP, CUSTODIANTE CU,'
      '    INVESTIMENTO IV, TIPOOPERACAO TP,'
      
        '    (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(IDCARTEIRAGEREN' +
        'C,2,'#39'0'#39') AS ID,'
      
        '            C.IDCARTEIRAINVEST, C.IDCARTEIRAGERENC, C.DESCCARTGE' +
        'RENC AS DESCCARTINVEST'
      '     FROM CARTEIRAGERENC C, PARAMINVEST P'
      '     WHERE P.FLGCARTGERENC = '#39'S'#39
      '     UNION'
      
        '     SELECT LPAD(C.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(0,2,'#39'0'#39') AS I' +
        'D,'
      
        '            C.IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, C.DESCCAR' +
        'TINVEST'
      '     FROM   CARTEIRAINVEST C, PARAMINVEST P'
      '     WHERE C.IDTIPOINVEST = 2'
      
        '       AND C.IDCARTEIRAINVEST NOT IN (SELECT IDCARTEIRAINVEST FR' +
        'OM CARTEIRAGERENC)'
      '       AND P.FLGCARTGERENC = '#39'S'#39
      '     UNION'
      '     SELECT LPAD(C.IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS ID,'
      
        '            C.IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, C.DESCCAR' +
        'TINVEST'
      '     FROM  CARTEIRAINVEST C, PARAMINVEST P'
      '     WHERE C.IDTIPOINVEST = 2'
      '       AND C.IDTIPOINVEST IS NOT NULL'
      '       AND C.IDTIPOINVEST NOT IN (1,8)'
      
        '       AND ((P.FLGCARTGERENC IS NULL) OR (P.FLGCARTGERENC = '#39'N'#39')' +
        ')) CT'
      ''
      'WHERE (OP.IDOPERACAOINVEST IN ( :X ))'
      '  AND (OP.IDTIPOINVEST = 2)'
      '  AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      
        '  AND ((LPAD(OP.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OP.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CT.ID)'
      '  AND (OP.IDCUSTODIANTE = CU.IDCUSTODIANTE)'
      '  AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 530
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'X'
        ParamType = ptUnknown
      end>
  end
  object QryGestor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     NOME'
      'FROM'
      '     PESSOA'
      'WHERE'
      '    (IDPESSOA = :iIdGestor)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 42
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdGestor'
        ParamType = ptUnknown
      end>
    object QryGestorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object QryAuxFD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      QTDOPERACAO,VLROPERACAO,VLRCOTA,DATAOPERACAO,DATALIQUIDACA' +
        'O,'
      '      DATACOTIZACAO'
      'FROM '
      '      OPERACAOFUNDO'
      'WHERE'
      '      1=2'
      ' ')
    UpdateObject = updAuxFD
    ValidateWithMask = True
    Left = 586
    Top = 312
    object QryAuxFDQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
    end
    object QryAuxFDVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###############0.00'
    end
    object QryAuxFDVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
    end
    object QryAuxFDDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object QryAuxFDDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATALIQUIDACAO'
    end
    object QryAuxFDDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATACOTIZACAO'
    end
  end
  object dsAuxFD: TwwDataSource
    AutoEdit = False
    DataSet = QryAuxFD
    Left = 587
    Top = 342
  end
  object updAuxFD: TUpdateSQL
    Left = 587
    Top = 366
  end
  object QryCotaFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    VLRCOTA'
      'FROM'
      '    COTAFUNDO'
      'WHERE'
      '    (IDFUNDOINVEST = :iIdFundoInvest) AND'
      '    (DATACOTA  = TO_DATE(:dbDtaCotaFD,'#39'DD/MM/YYYY'#39') )')
    ValidateWithMask = True
    Left = 458
    Top = 311
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdFundoInvest'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dbDtaCotaFD'
        ParamType = ptUnknown
      end>
    object QryCotaFundoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
  end
  object dsCotaFundo: TwwDataSource
    AutoEdit = False
    DataSet = QryCotaFundo
    Left = 459
    Top = 342
  end
  object QryInsOperacaoinvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCORRETVALORES, MOECODIGO, IDMODULO, EMPRE' +
        'SAPROP,'
      
        '   IDINVESTIMENTO, IDCARTEIRAINVEST, IDTIPOINVEST, IDTIPOOPERACA' +
        'O,'
      
        '   DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, PRECOUNITOPERACAO, ' +
        'VLROPERACAO,'
      
        '   DATAVENCOPER, IDFORCLI, IDLOTE, IDCUSTODIANTE, VLRIR, FLGSTAT' +
        'USFECHBOL,'
      '   FLGSTATUSORDMOV, IDPLANPREVCTBPATR, IDCARTEIRAGERENC)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDCORRETVALORES, :MOECODIGO, :IDMODULO, :' +
        'EMPRESAPROP,'
      
        '   :IDINVESTIMENTO, :IDCARTEIRAINVEST, :IDTIPOINVEST, :IDTIPOOPE' +
        'RACAO,'
      
        '   :DATAOPERACAO, :NUMDOCUMENTO, :QTDEOPERACAO, :PRECOUNITOPERAC' +
        'AO, :VLROPERACAO,'
      
        '   :DATAVENCOPER, :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :VLRIR, :F' +
        'LGSTATUSFECHBOL,'
      '   :FLGSTATUSORDMOV, :IDPLANPREVCTBPATR, :IDCARTEIRAGERENC)')
    ValidateWithMask = True
    Left = 136
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end>
  end
  object qryBuscaOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OI.NUMDOCUMENTO, OI.IDOPERACAOINVEST, OI.IDINVESTIMENTO,'
      
        '       OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, OI.IDTIPOOPERAC' +
        'AO,'
      
        '       IV.DESCINVESTIMENTO, OI.DATAOPERACAO, AC.CODTIPOACAO, OI.' +
        'VLROPERACAO,'
      '       TP.DESCTIPOOPERACAO'
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, ACAO AC, TIPOOPERACAO T' +
        'P'
      'WHERE OI.NUMDOCUMENTO = :IDBOLETA'
      '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OI.IDINVESTIMENTO = AC.IDACAO'
      '  AND OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 626
    Top = 102
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryBuscaOperNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaOperIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object qryBuscaOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryBuscaOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryBuscaOperIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAGERENC'
    end
    object qryBuscaOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object qryBuscaOperDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaOperDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object qryBuscaOperCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'BASEDADOS.ACAO.CODTIPOACAO'
      Size = 5
    end
    object qryBuscaOperVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
    end
    object qryBuscaOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
  end
  object QryAcao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    CODTIPOACAO'
      'FROM '
      '    ACAO'
      'WHERE '
      '    IDACAO = :iIdInvestimento ')
    ValidateWithMask = True
    Left = 397
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end>
    object QryAcaoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'BASEDADOS.ACAO.CODTIPOACAO'
      Size = 5
    end
  end
  object QryInsOperacaoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into OPERACAOFUNDO'
      '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDTIPOINVEST,'
      
        '   IDTIPOOPERACAO, IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, ' +
        'QTDOPERACAO,'
      
        '   VLROPERACAO, VLRCOTA, STACONFIRMA, IDPLANPREVCTBPATR, DATACOT' +
        'IZACAO)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDTIPOINVEST,'
      
        '   :IDTIPOOPERACAO,  :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDA' +
        'CAO, :QTDOPERACAO,'
      
        '   :VLROPERACAO, :VLRCOTA, :STACONFIRMA, :IDPLANPREVCTBPATR, :DA' +
        'TACOTIZACAO)')
    ValidateWithMask = True
    Left = 232
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
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
        DataType = ftDateTime
        Name = 'DATALIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STACONFIRMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTIZACAO'
        ParamType = ptInput
      end>
  end
  object QryInsOperInvXOperFdo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into OPERINVXOPERFDO'
      '  (IDOPERACAOINVEST, IDOPERACAOFUNDO, DATAOPERACAO)'
      'values'
      '  (:IDOPERACAOINVEST, :IDOPERACAOFUNDO, :DATAOPERACAO)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDINVESTIMENTO,DATAOPERACAO,QTDEOPERACAO,PRECOUNITOPERACAO,'
      
        '    DATAVENCOPER,VLROPERACAO,IDCARTEIRAINVEST, IDCARTEIRAGERENC,' +
        ' IDCUSTODIANTE,'
      
        '    IDOPERACAOINVEST, IDTIPOINVEST, NUMDOCUMENTO, IDTIPOOPERACAO' +
        ','
      
        '    LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(NVL(IDCARTEIRAGERENC,0)' +
        ',2,'#39'0'#39') AS ID'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '    IDOPERACAOINVEST = -1'
      'ORDER BY NUMDOCUMENTO, IDOPERACAOINVEST')
    UpdateObject = updDetalhe
    ControlType.Strings = (
      'ID;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 538
    Top = 314
    object QryDetalheDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 16
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object QryDetalheDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimentos'
      DisplayWidth = 36
      FieldKind = fkLookup
      FieldName = 'DESCCARTINVEST'
      LookupDataSet = QryCarteiraRV
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'ID'
      Size = 60
      Lookup = True
    end
    object QryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 28
      FieldKind = fkLookup
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 30
      Lookup = True
    end
    object QryDetalheVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryDetalheQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object QryDetalhePRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 16
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###,##0.000000'
    end
    object QryDetalheDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Liquidação'
      DisplayWidth = 15
      FieldName = 'DATAVENCOPER'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAVENCOPER'
    end
    object QryDetalheDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de operação'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'DESCTIPOOPERACAO'
      LookupDataSet = QryTipoOperRV
      LookupKeyFields = 'IDTIPOOPERACAO'
      LookupResultField = 'DESCTIPOOPERACAO'
      KeyFields = 'IDTIPOOPERACAO'
      Size = 60
      Lookup = True
    end
    object QryDetalheSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SGLCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 10
      Lookup = True
    end
    object QryDetalheNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryDetalheIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object QryDetalheIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAOINVEST'
      Visible = False
    end
    object QryDetalheIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
      Visible = False
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheID: TStringField
      FieldName = 'ID'
      Visible = False
      Size = 4
    end
  end
  object dsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 539
    Top = 345
  end
  object updDetalhe: TUpdateSQL
    Left = 539
    Top = 374
  end
  object QryCompraFundos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        HF.IDHISTFUNDO,'
      
        '        DECODE(NVL(HF.CODDOCUMENTO,0),0,OP.CODDOCUMENTO, HF.CODD' +
        'OCUMENTO) AS CODDOCUMENTO,'
      
        '        DECODE(NVL(HF.PLNCODIGO,0),0,OP.PLNCODIGO, HF.PLNCODIGO)' +
        ' AS PLNCODIGO,'
      '        DECODE(NVL(HF.PLANO,0),0,OP.PLANO, HF.PLANO) AS PLANO,'
      
        '        HF.IDTIPOOPERACAO, HF.IDCARTEIRAINVEST, HF.DATAAPLICACAO' +
        ', HF.IDTIPOINVEST, HF.VLRAPLICADO,'
      
        '        HF.NATURMOVFUNDO, HF.TIPMOVFUNDO, HF.IDFUNDOINVEST, HF.D' +
        'ATAMOVFUNDO, HF.VLRMOVFUNDO,'
      '        HF.COTASMOVFUNDO, HF.COTAAPLICACAO, HF.IDOPERACAOFUNDO,'
      '        OP.DATALIQUIDACAO, OP.VLRCOTA,'
      '        CA.DESCCARTINVEST,'
      '        FI.DESCFUNDOINVEST,'
      
        '        PE.NOME, OP.DATACOTIZACAO, OP.DATAOPERACAO, OP.IDPLANPRE' +
        'VCTBPATR'
      'FROM'
      
        '        PESSOA PE, HISTFUNDO HF, OPERACAOFUNDO OP, CARTEIRAINVES' +
        'T CA, FUNDOINVEST FI'
      'WHERE'
      '        (HF.IDOPERACAOFUNDO = :IDOPERACAOFUNDO) AND'
      '        (HF.IDTIPOOPERACAO = -34) AND'
      '        (HF.IDOPERACAOFUNDO = OP.IDOPERACAOFUNDO) AND'
      '        (HF.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND'
      '        (HF.IDFUNDOINVEST = FI.IDFUNDOINVEST) AND'
      '        (FI.IDGESTORCARTEIRA = PE.IDPESSOA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 434
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
    object QryCompraFundosIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
    end
    object QryCompraFundosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryCompraFundosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object QryCompraFundosPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object QryCompraFundosIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryCompraFundosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryCompraFundosDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object QryCompraFundosIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryCompraFundosVLRAPLICADO: TFloatField
      FieldName = 'VLRAPLICADO'
    end
    object QryCompraFundosNATURMOVFUNDO: TStringField
      FieldName = 'NATURMOVFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryCompraFundosTIPMOVFUNDO: TStringField
      FieldName = 'TIPMOVFUNDO'
      Size = 3
    end
    object QryCompraFundosIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QryCompraFundosDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
    end
    object QryCompraFundosCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
    end
    object QryCompraFundosCOTAAPLICACAO: TFloatField
      FieldName = 'COTAAPLICACAO'
    end
    object QryCompraFundosIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object QryCompraFundosDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryCompraFundosDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryCompraFundosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryCompraFundosVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object QryCompraFundosDATAMOVFUNDO: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.DATAMOVFUNDO'
    end
    object QryCompraFundosVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      Origin = 'BASEDADOS.HISTFUNDO.VLRMOVFUNDO'
    end
    object QryCompraFundosDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
    end
    object QryCompraFundosDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryCompraFundosIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object updCotaFundo: TUpdateSQL
    Left = 459
    Top = 374
  end
  object QryBuscaAplicFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTFUNDO'
      'FROM'
      '   HISTFUNDO'
      'WHERE'
      '   (IDTIPOOPERACAO= -34) AND'
      '   (IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      '   (IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      '   (DATAAPLICACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 186
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaVlrLiquido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VLROPERACAO) AS VALORLIQUIDO'
      'FROM OPERACAOINVEST'
      'WHERE NUMDOCUMENTO = :IDBOLETA'
      '  AND IDCARTEIRAGERENC IS NULL')
    ValidateWithMask = True
    Left = 626
    Top = 158
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryBuscaVlrLiquidoVALORLIQUIDO: TFloatField
      FieldName = 'VALORLIQUIDO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
    end
  end
  object QryPesqHistFundoDel: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDHISTFUNDO,'
      '       IDTIPOINVEST,'
      '       IDTIPOOPERACAO,'
      '       IDCARTEIRAINVEST,'
      '       IDFUNDOINVEST,'
      '       DATAAPLICACAO,'
      '       DATAMOVFUNDO,'
      '       NATURMOVFUNDO,'
      '       TIPMOVFUNDO,'
      '       IDPLANPREVCTBPATR'
      ''
      '  FROM HISTFUNDO'
      ''
      'WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO'
      '   AND NOT TIPMOVFUNDO = '#39'ATU'#39
      'ORDER BY DATAMOVFUNDO DESC, IDHISTFUNDO ')
    ValidateWithMask = True
    Left = 691
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QyDelHistFundoATU: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE'
      ''
      '  FROM HISTFUNDO'
      ''
      ' WHERE IDTIPOINVEST      = :IDTIPOINVEST'
      '   AND IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR '
      '   AND IDFUNDOINVEST     = :IDFUNDOINVEST'
      '   AND DATAAPLICACAO     = :DATAAPLICACAO'
      '   AND DATAMOVFUNDO      = :DATAMOVFUNDO'
      '   AND IDTIPOOPERACAO    = :IDTIPOOPERACAO'
      '   AND IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '   AND NATURMOVFUNDO     = :NATURMOVFUNDO'
      '   AND TIPMOVFUNDO       = '#39'ATU'#39
      ''
      ' ')
    ValidateWithMask = True
    Left = 691
    Top = 292
    ParamData = <
      item
        DataType = ftInterface
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATURMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDelHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE'
      ''
      '  FROM HISTFUNDO'
      ''
      ' WHERE IDHISTFUNDO = :IDHISTFUNDO')
    ValidateWithMask = True
    Left = 691
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptUnknown
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
    Left = 42
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryBoleta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO, PLNCODIGO, CODDOCUMENTO'
      'FROM BOLETA '
      'WHERE IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 626
    Top = 46
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryBoletaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.BOLETA.PLANO'
    end
    object qryBoletaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.BOLETA.PLNCODIGO'
    end
    object qryBoletaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.BOLETA.CODDOCUMENTO'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 618
    Top = 6
  end
end
