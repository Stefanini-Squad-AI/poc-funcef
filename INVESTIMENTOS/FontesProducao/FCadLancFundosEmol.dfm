inherited FrmCadLancFundosEmol: TFrmCadLancFundosEmol
  Left = 118
  Top = 152
  HelpContext = 790220
  Caption = 'Lançamentos'
  ClientHeight = 543
  ClientWidth = 801
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 801
    Height = 457
    inherited Bevel2: TBevel
      Width = 799
    end
    inherited pnlTitulo: TPanel
      Width = 799
      inherited lbNomItem: TfcLabel
        Width = 414
        Caption = 'Operação em Fundos com Emolumentos'
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 45
      Width = 799
      Height = 52
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 13
        Top = 7
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label7: TLabel
        Left = 157
        Top = 7
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
      object Label33: TLabel
        Left = 427
        Top = 7
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DtEdDataReferenciaGeral: TCMDateTimePicker
        Left = 14
        Top = 22
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
      object DblTipoFundo: TwwDBLookupCombo
        Left = 157
        Top = 22
        Width = 250
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DblTipoFundoCloseUp
      end
      object dblGestorCarteira: TwwDBLookupCombo
        Left = 429
        Top = 22
        Width = 345
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = qryGestorCart
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loColLines, loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblGestorCarteiraCloseUp
      end
    end
    object PnlDetalhe: TPanel
      Left = 1
      Top = 97
      Width = 799
      Height = 359
      Align = alClient
      TabOrder = 2
      object PgcSaldos: TPageControl
        Left = 1
        Top = 1
        Width = 797
        Height = 357
        ActivePage = TbsResgate
        Align = alClient
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TbsAplicacao: TTabSheet
          Caption = '&Aplicação '
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 789
            Height = 329
            ActivePage = TbSheet
            Align = alClient
            TabOrder = 0
            object TbSheet: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object PnlAplicacao: TPanel
                Left = 0
                Top = 56
                Width = 696
                Height = 263
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 1
                object Label17: TLabel
                  Left = 16
                  Top = 4
                  Width = 130
                  Height = 13
                  Caption = 'Fundo de Investimento'
                end
                object Label18: TLabel
                  Left = 16
                  Top = 91
                  Width = 83
                  Height = 13
                  Caption = 'Valor Aplicado'
                end
                object Label19: TLabel
                  Left = 190
                  Top = 91
                  Width = 84
                  Height = 13
                  Caption = 'Cota do Fundo'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label20: TLabel
                  Left = 507
                  Top = 91
                  Width = 118
                  Height = 13
                  Caption = 'Quantidade Operada'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label25: TLabel
                  Left = 16
                  Top = 48
                  Width = 106
                  Height = 13
                  Caption = 'Data da Aplicação'
                end
                object Label26: TLabel
                  Left = 190
                  Top = 48
                  Width = 112
                  Height = 13
                  Caption = 'Data da Liquidação'
                end
                object Label15: TLabel
                  Left = 378
                  Top = 48
                  Width = 106
                  Height = 13
                  Caption = 'Data da Cotização'
                end
                object Label6: TLabel
                  Left = 17
                  Top = 135
                  Width = 118
                  Height = 13
                  Caption = 'Comissão Colocação'
                end
                object Label22: TLabel
                  Left = 190
                  Top = 135
                  Width = 124
                  Height = 13
                  Caption = 'Taxas e Emolumentos'
                end
                object Label29: TLabel
                  Left = 378
                  Top = 135
                  Width = 65
                  Height = 13
                  Caption = 'Corretagem'
                end
                object Label30: TLabel
                  Left = 378
                  Top = 91
                  Width = 113
                  Height = 13
                  Caption = 'Cotação Negociada'
                end
                object Label31: TLabel
                  Left = 507
                  Top = 135
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object DbLkcFundoInvest: TwwDBLookupCombo
                  Left = 16
                  Top = 20
                  Width = 352
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
                  DataField = 'IDFUNDOINVEST'
                  DataSource = DsAplicacao
                  LookupTable = QryFundoInvestAplic
                  LookupField = 'IDFUNDOINVEST'
                  Options = [loColLines, loRowLines]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = DbLkcFundoInvestCloseUp
                end
                object DbEdValorApl: TDBRealEdit
                  Left = 16
                  Top = 106
                  Width = 158
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 4
                  WordWrap = False
                  OnChange = DbEdValorAplChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLROPERACAO'
                  DataSource = DsAplicacao
                end
                object DbEdCota: TDBRealEdit
                  Left = 190
                  Top = 106
                  Width = 169
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '       0,00000000')
                  TabOrder = 5
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                end
                object DbEdQtdOper: TDBRealEdit
                  Left = 507
                  Top = 106
                  Width = 169
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '0,000000000')
                  TabOrder = 7
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 9
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QTDOPERACAO'
                  DataSource = DsAplicacao
                end
                object DbDtDataAplicacao: TCMDateTimePicker
                  Left = 16
                  Top = 64
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAOPERACAO'
                  DataSource = DsAplicacao
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
                object DbDtDataLiquidacao: TCMDateTimePicker
                  Left = 190
                  Top = 64
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
                  DataSource = DsAplicacao
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
                object DbDtDataCotizacaoAplic: TCMDateTimePicker
                  Left = 378
                  Top = 64
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATACOTIZACAO'
                  DataSource = DsAplicacao
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
                end
                object DbEdValorComissaoApl: TDBRealEdit
                  Left = 17
                  Top = 150
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 8
                  WordWrap = False
                  OnChange = DbEdValorComissaoAplChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOLOCACAO'
                  DataSource = DsAplicacao
                end
                object DbEdTaxasEmolApl: TDBRealEdit
                  Left = 190
                  Top = 150
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 9
                  WordWrap = False
                  OnChange = DbEdValorComissaoAplChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTAXAS'
                  DataSource = DsAplicacao
                end
                object DbEdCorretagemApl: TDBRealEdit
                  Left = 378
                  Top = 150
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 10
                  WordWrap = False
                  OnChange = DbEdValorComissaoAplChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCORRETAGEM'
                  DataSource = DsAplicacao
                end
                object DbEdCotaNegApl: TDBRealEdit
                  Left = 378
                  Top = 106
                  Width = 118
                  Height = 21
                  Alignment = taRightJustify
                  Color = clWhite
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 6
                  WordWrap = False
                  OnChange = DbEdValorAplChange
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                  DataSource = DsAplicacao
                end
                object DbEdValorTotalApl: TDBRealEdit
                  Left = 507
                  Top = 150
                  Width = 167
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 11
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALORTOTAL'
                  DataSource = DsAplicacao
                end
              end
              object DbGrdAplicacao: TwwDBGrid
                Left = 0
                Top = 56
                Width = 696
                Height = 263
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'30'#9'Fundo'#9'F'
                  'CODFUNCETIP'#9'14'#9'CETIP'#9'F'
                  'IDOPERACAOFUNDO'#9'10'#9'Boleta'#9'F'
                  'DATAOPERACAO'#9'10'#9'Operação'#9'F'
                  'DATACOTIZACAO'#9'10'#9'Cotização'#9'F'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'#9'F'
                  'VLROPERACAO'#9'18'#9'Valor Aplicado'#9'F'
                  'VLRCOLOCACAO'#9'12'#9'Comissão Coloc.'#9'F'
                  'VLRTAXAS'#9'12'#9'Taxas e Emol.'#9'F'
                  'VLRCORRETAGEM'#9'12'#9'Corretagem'#9'F'
                  'VALORTOTAL'#9'18'#9'Valor Total'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsAplicacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 4
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
              object Dock977: TDock97
                Left = 0
                Top = 25
                Width = 781
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar974: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncAplic: TSpeedButton
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
                    OnClick = BtIncAplicClick
                  end
                  object BtAltAplic: TSpeedButton
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Enabled = False
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
                    OnClick = BtExcAplicClick
                  end
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 781
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                BevelOuter = bvNone
                Caption = 'Aplicação'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object Dock978: TDock97
                Left = 696
                Top = 56
                Width = 85
                Height = 263
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                Visible = False
                object Toolbar975: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtOkAplic: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 80
                    Height = 27
                    Caption = '&OK'
                    Default = True
                    Enabled = False
                    TabOrder = 0
                    OnClick = BtOkAplicClick
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
                  object BtCancAplic: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 80
                    Height = 28
                    Cancel = True
                    Caption = '&Cancelar'
                    Enabled = False
                    TabOrder = 1
                    OnClick = BtCancAplicClick
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
                  object BtVoltaAplic: TBitBtn
                    Left = 0
                    Top = 55
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 2
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
            end
          end
        end
        object TbsResgate: TTabSheet
          Caption = '&Resgate'
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 789
            Height = 329
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object DbGrdrResgate: TwwDBGrid
                Left = 0
                Top = 56
                Width = 781
                Height = 263
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'30'#9'Fundo'#9'F'
                  'CODFUNCETIP'#9'14'#9'CETIP'#9'F'
                  'IDPEDIDOFUNDO'#9'10'#9'Boleta'#9'F'
                  'DATAPEDIDO'#9'10'#9'Operação'#9'F'
                  'DATACOTIZACAO'#9'10'#9'Cotização'#9'F'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'#9'F'
                  'VLRPEDIDO'#9'18'#9'Valor da Operação'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsResgate
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 3
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
              object pnlResgate: TPanel
                Left = 0
                Top = 56
                Width = 781
                Height = 263
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 1
                object Label13: TLabel
                  Left = 16
                  Top = 92
                  Width = 107
                  Height = 13
                  Caption = 'Valor da Operação'
                end
                object Label23: TLabel
                  Left = 16
                  Top = 7
                  Width = 105
                  Height = 13
                  Caption = 'Data da Operação'
                end
                object Label24: TLabel
                  Left = 378
                  Top = 50
                  Width = 112
                  Height = 13
                  Caption = 'Data da Liquidação'
                end
                object Label12: TLabel
                  Left = 16
                  Top = 50
                  Width = 130
                  Height = 13
                  Caption = 'Fundo de Investimento'
                end
                object Label28: TLabel
                  Left = 507
                  Top = 92
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Saldo Sintético'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 188
                  Top = 92
                  Width = 84
                  Height = 13
                  Caption = 'Cota do Fundo'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 507
                  Top = 50
                  Width = 106
                  Height = 13
                  Caption = 'Data da Cotização'
                end
                object Label32: TLabel
                  Left = 378
                  Top = 92
                  Width = 113
                  Height = 13
                  Caption = 'Cotação Negociada'
                end
                object Label5: TLabel
                  Left = 17
                  Top = 136
                  Width = 118
                  Height = 13
                  Caption = 'Comissão Colocação'
                end
                object Label34: TLabel
                  Left = 190
                  Top = 136
                  Width = 124
                  Height = 13
                  Caption = 'Taxas e Emolumentos'
                end
                object Label35: TLabel
                  Left = 378
                  Top = 136
                  Width = 65
                  Height = 13
                  Caption = 'Corretagem'
                end
                object Label36: TLabel
                  Left = 507
                  Top = 136
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object DbRValorLiquido: TDBRealEdit
                  Left = 16
                  Top = 107
                  Width = 158
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 4
                  WordWrap = False
                  OnChange = DbRValorLiquidoChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRPEDIDO'
                  DataSource = DsResgate
                end
                object dbDDataOperacao: TCMDateTimePicker
                  Left = 16
                  Top = 21
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAPEDIDO'
                  DataSource = DsResgate
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
                end
                object dbDDataLiquidacaoResg: TCMDateTimePicker
                  Left = 378
                  Top = 64
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
                  DataSource = DsResgate
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
                object DbLkcFundoInvestResg: TwwDBLookupCombo
                  Left = 16
                  Top = 64
                  Width = 352
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
                  DataField = 'IDFUNDOINVEST'
                  DataSource = DsResgate
                  LookupTable = QryFundoInvestResg
                  LookupField = 'IDFUNDOINVEST'
                  Options = [loColLines, loRowLines]
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = DbLkcFundoInvestResgCloseUp
                end
                object Dock974: TDock97
                  Left = 695
                  Top = 1
                  Width = 85
                  Height = 261
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  Visible = False
                  object Toolbar973: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object BtOkResg: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 80
                      Height = 27
                      Caption = '&OK'
                      Default = True
                      Enabled = False
                      TabOrder = 0
                      OnClick = BtOkResgClick
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
                    object BtCancResg: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 80
                      Height = 28
                      Cancel = True
                      Caption = '&Cancelar'
                      Enabled = False
                      TabOrder = 1
                      OnClick = BtCancResgClick
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
                    object BtVoltaResg: TBitBtn
                      Left = 0
                      Top = 55
                      Width = 80
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 2
                      OnClick = BtCancResgClick
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
                object rVlrBruto: TDBRealEdit
                  Left = 507
                  Top = 107
                  Width = 164
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 7
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'SALDOVLRFUNDO'
                  DataSource = dsSaldoFundoTotal
                end
                object DbEdCotaResg: TDBRealEdit
                  Left = 188
                  Top = 107
                  Width = 169
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '       0,00000000')
                  TabOrder = 5
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                end
                object DbDtDataCotizacaoResg: TCMDateTimePicker
                  Left = 507
                  Top = 64
                  Width = 119
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATACOTIZACAO'
                  DataSource = DsResgate
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
                end
                object DbEdCotaNegResg: TDBRealEdit
                  Left = 378
                  Top = 107
                  Width = 118
                  Height = 21
                  Alignment = taRightJustify
                  Color = clWhite
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 6
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                  DataSource = DsResgate
                end
                object DbEdValorComissaoResg: TDBRealEdit
                  Left = 17
                  Top = 151
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 8
                  WordWrap = False
                  OnChange = DbEdValorComissaoResgChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOLOCACAO'
                  DataSource = DsResgate
                end
                object DbEdTaxasEmolResg: TDBRealEdit
                  Left = 190
                  Top = 151
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 9
                  WordWrap = False
                  OnChange = DbEdValorComissaoResgChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTAXAS'
                  DataSource = DsResgate
                end
                object DbEdCorretagemResg: TDBRealEdit
                  Left = 378
                  Top = 151
                  Width = 120
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 10
                  WordWrap = False
                  OnChange = DbEdValorComissaoResgChange
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCORRETAGEM'
                  DataSource = DsResgate
                end
                object DbEdValorTotalReg: TDBRealEdit
                  Left = 507
                  Top = 151
                  Width = 167
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 11
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALORTOTAL'
                  DataSource = DsResgate
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 781
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                BevelOuter = bvNone
                Caption = 'Resgate'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object Dock973: TDock97
                Left = 0
                Top = 25
                Width = 781
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncResg: TSpeedButton
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
                    OnClick = BtIncResgClick
                  end
                  object BtAltResg: TSpeedButton
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Enabled = False
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
                  end
                  object BtExcResg: TSpeedButton
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
                    OnClick = BtExcResgClick
                  end
                end
              end
            end
          end
        end
        object TbsSaldo: TTabSheet
          Caption = '&Saldo'
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 789
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvNone
            Caption = 'Saldo dos Fundos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 0
            Top = 25
            Width = 789
            Height = 43
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label3: TLabel
              Left = 6
              Top = 2
              Width = 64
              Height = 13
              Caption = 'Data Saldo'
            end
            object Label14: TLabel
              Left = 145
              Top = 2
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
            object DbLkcSaldo: TwwDBLookupCombo
              Left = 145
              Top = 17
              Width = 321
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              LookupTable = QryFundoInvestOperacao
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DbLkcSaldoCloseUp
            end
            object DbDtRefSaldo: TCMDateTimePicker
              Left = 6
              Top = 17
              Width = 113
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
              OnExit = DbDtRefSaldoExit
            end
          end
          object pnlTotais: TPanel
            Left = 0
            Top = 286
            Width = 789
            Height = 43
            Align = alBottom
            Caption = ' '
            TabOrder = 2
            object Label1: TLabel
              Left = 135
              Top = 2
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quantidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 283
              Top = 2
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Bruto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 579
              Top = 2
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'IRRF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 453
              Top = 2
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'IOF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 673
              Top = 2
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Líquido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBReQtd: TDBRealEdit
              Left = 33
              Top = 19
              Width = 168
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,000000000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOQTDCOTAS'
              DataSource = dsSaldoFundoTotal
            end
            object DBReBruto: TDBRealEdit
              Left = 202
              Top = 19
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOVLRFUNDO'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIRRF: TDBRealEdit
              Left = 475
              Top = 19
              Width = 134
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIRPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIOF: TDBRealEdit
              Left = 348
              Top = 19
              Width = 126
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIOFPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReLiq: TDBRealEdit
              Left = 610
              Top = 19
              Width = 139
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOLIQUIDO'
              DataSource = dsSaldoFundoTotal
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 68
            Width = 789
            Height = 218
            Align = alClient
            TabOrder = 3
            object dbGrdSaldos: TwwDBGrid
              Left = 1
              Top = 1
              Width = 787
              Height = 216
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'30'#9'Fundos'
                'DATAAPLICACAO'#9'10'#9'Aplicação'
                'DATAMOVFUNDO'#9'10'#9'Data Cota'
                'SALDOQTDCOTAS'#9'20'#9'Quantidade'
                'VLRCOTAATUAL'#9'18'#9'Valor da Cota'
                'SALDOVLRFUNDO'#9'18'#9'Valor Bruto'#9'F'
                'VLRIOFPROV'#9'12'#9'IOF'
                'VLRIRPROV'#9'14'#9'IR'
                'SALDOLIQUIDO'#9'18'#9'Valor Líquido')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DsSaldoFundo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
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
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 801
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnMovimento: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Movimento'
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
        OnClick = sbtnMovimentoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 801
    inherited tb97Fundo: TToolbar97
      Left = 346
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 328
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 260
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from dual')
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MAX(DATAULTFECH) AS DATAULTFECH FROM TIPOFUNDOINVEST WHER' +
        'E'
      '  (IDTIPOINVEST      = :IDTIPOINVEST)                      AND'
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )'
      ' ')
    ValidateWithMask = True
    Left = 511
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerSaldoFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        ' AND'
      
        '    (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST =:IDFUNDOI' +
        'NVEST)) OR'
      
        '      (:IDFUNDOINVEST IS NULL))                                 ' +
        '        AND'
      
        '      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39'))' +
        ' AND'
      '      (IDTIPOINVEST      = :IDTIPOINVEST)'
      'GROUP BY IDFUNDOINVEST, DATAAPLICACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 599
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 678
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT G.IdGestorCarteira , P.IdPessoa, P.Nome'
      'FROM Pessoa P, GestorCarteira G, FUNDOINVEST F'
      'WHERE P.IdPessoa = G.IdGestorCarteira AND'
      '      G.IdGestorCarteira(+) = F.IdGestorCarteira'
      'ORDER BY P.Nome')
    ValidateWithMask = True
    Left = 750
    Top = 10
    object qryGestorCartNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryGestorCartIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'GESTORCARTEIRA.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object QryFundoInvestAplic: TwwQuery
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
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTAPLIC       , FUN.DTAINIPROC' +
        '        , TFI.IDTIPOINVEST'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      '    (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '    (((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      '      (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))  OR'
      '      (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '    (((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '      (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '      (:IDTIPOFUNDOINVEST IS NULL) )                AND'
      ''
      '    (((:IDTIPOINVEST <> 0)                          AND'
      '      (TFI.IDTIPOINVEST = :IDTIPOINVEST))           OR'
      '      (:IDTIPOINVEST = 0) )'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 187
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestAplicIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestAplicDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestAplicIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestAplicTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestAplicTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestAplicMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestAplicIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestAplicCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestAplicSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestAplicPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestAplicPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestAplicPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestAplicQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestAplicQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestAplicSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestAplicPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestAplicPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestAplicCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestAplicSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
    object QryFundoInvestAplicDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
    end
    object QryFundoInvestAplicPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTAPLIC'
    end
    object QryFundoInvestAplicIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestAplicIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object QryFundoInvestAplicDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QryFundoInvestResg: TwwQuery
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
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTRESG        , FUN.DTAINIPROC' +
        '        , TFI.IDTIPOINVEST'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '(FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      '  (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))  OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '  (:IDTIPOFUNDOINVEST IS NULL))                 AND'
      ''
      '(((:IDTIPOINVEST <> 0)                          AND'
      '  (TFI.IDTIPOINVEST = :IDTIPOINVEST))           OR'
      '  (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 626
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestResgIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestResgDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestResgIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestResgTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestResgTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestResgMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestResgIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestResgIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestResgCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestResgSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestResgPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestResgPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestResgPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestResgQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestResgQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestResgSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestResgPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestResgPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestResgCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestResgSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
    object QryFundoInvestResgDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
    end
    object QryFundoInvestResgPZOCOTRESG: TFloatField
      FieldName = 'PZOCOTRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTRESG'
    end
    object QryFundoInvestResgIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object QryFundoInvestResgDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO      , SUM(NVL(H1.VLRIRPRO' +
        'V,0))  AS VLRIRPROV , SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV  ' +
        '    ,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO , SUM(H1.COTASMOVFUND' +
        'O) AS COTASMOVFUNDO    , SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO ,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDHISTFUNDO  IN ('
      
        '                 SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM HIS' +
        'TFUNDO'
      '                 WHERE'
      
        '                      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                    (((:IDFUNDOINVEST IS NOT NULL)             A' +
        'ND'
      
        '                       (IDFUNDOINVEST    =:IDFUNDOINVEST)) OR (:' +
        'IDFUNDOINVEST IS NULL)) AND'
      
        '                      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) AND'
      
        '                     ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      
        '                      (IDTIPOINVEST      = :IDTIPOINVEST)      A' +
        'ND'
      '                      (TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                 GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVF' +
        'UNDO)) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)                             AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                          AND'
      '  (FI.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))               OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                            AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )                           AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = '2000'
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object FloatField9: TFloatField
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField11: TFloatField
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField12: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField13: TFloatField
      FieldName = 'COTASMOVFUNDO'
    end
    object FloatField14: TFloatField
      FieldName = 'VLRMOVFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField15: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.00000000000'
    end
    object FloatField16: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField18: TFloatField
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object QrySaldoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' FI.DESCFUNDOINVEST,'
      
        ' H1.IDHISTFUNDO       , H1.CODDOCUMENTO      , H1.PLNCODIGO     ' +
        '    , H1.PLANO             ,'
      
        ' H1.IDTIPOINVEST      , H1.IDTIPOOPERACAO    , H1.IDCARTEIRAINVE' +
        'ST  , H1.IDFUNDOINVEST     ,'
      
        ' H1.DATAAPLICACAO     , H1.DATAMOVFUNDO      , H1.HISTMOVFUNDO  ' +
        '    , H1.NATURMOVFUNDO     ,'
      
        ' H1.TIPMOVFUNDO       , H1.VLRAPLICADO       , NVL(H1.VLRIRPROV,' +
        '0) AS VLRIRPROV  , NVL(H1.VLRIOFPROV,0) AS VLRIOFPROV ,'
      
        ' H1.VLRVARIACAO       , H1.COTASMOVFUNDO     , H1.VLRMOVFUNDO   ' +
        '    , H1.FLGCALCSALDO      ,'
      
        ' H1.SALDOQTDCOTAS     , H1.SALDOVLRFUNDO     , H1.COTAAPLICACAO ' +
        'AS VLRCOTAAPLICACAO,'
      ' CF.VLRCOTA AS VLRCOTAATUAL,'
      
        '(H1.SALDOVLRFUNDO-(nvl(H1.VLRIOFPROV,0)+nvl(H1.VLRIRPROV,0))) AS' +
        '  SALDOLIQUIDO'
      ''
      'FROM HISTFUNDO H1, COTAFUNDO CF, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                AND'
      ''
      '(H1.IDHISTFUNDO  IN ('
      
        '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM HIST' +
        'FUNDO'
      '                WHERE'
      
        '                      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                    (((:IDFUNDOINVEST IS NOT NULL)             A' +
        'ND'
      
        '                       (IDFUNDOINVEST    =:IDFUNDOINVEST)) OR (:' +
        'IDFUNDOINVEST IS NULL)) AND'
      
        '                      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) AND'
      
        '                     ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      
        '                      (IDTIPOINVEST      = :IDTIPOINVEST)      A' +
        'ND'
      '                      (TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)                             AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                          AND'
      '  (FI.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))               OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                            AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )                           AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)                  AND'
      ''
      '(CF.IDFUNDOINVEST     = H1.IDFUNDOINVEST)                  AND'
      ''
      '(CF.DATACOTA          = H1.DATAMOVFUNDO)                   '
      ''
      'ORDER BY DESCFUNDOINVEST, DATAAPLICACAO'
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
      ' '
      ' ')
    ValidateWithMask = True
    Left = 522
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QrySaldoFundoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundos'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySaldoFundoDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoFundoDATAMOVFUNDO: TDateTimeField
      DisplayLabel = 'Data Cota'
      DisplayWidth = 10
      FieldName = 'DATAMOVFUNDO'
    end
    object QrySaldoFundoSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRCOTAATUAL: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTAATUAL'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 18
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 12
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRIRPROV: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 14
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRCOTAAPLICACAO: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTAAPLICACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 17
      FieldName = 'VLRAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Visible = False
    end
    object QrySaldoFundoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QrySaldoFundoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QrySaldoFundoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QrySaldoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QrySaldoFundoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QrySaldoFundoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QrySaldoFundoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QrySaldoFundoHISTMOVFUNDO: TStringField
      FieldName = 'HISTMOVFUNDO'
      Visible = False
      Size = 60
    end
    object QrySaldoFundoNATURMOVFUNDO: TStringField
      FieldName = 'NATURMOVFUNDO'
      Visible = False
      Size = 1
    end
    object QrySaldoFundoTIPMOVFUNDO: TStringField
      FieldName = 'TIPMOVFUNDO'
      Visible = False
      Size = 3
    end
    object QrySaldoFundoVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
      Visible = False
    end
    object QrySaldoFundoVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Visible = False
      Size = 1
    end
  end
  object dsSaldoFundoTotal: TwwDataSource
    DataSet = QrySaldoFundoTotal
    Left = 626
    Top = 244
  end
  object DsSaldoFundo: TwwDataSource
    DataSet = QrySaldoFundo
    Left = 626
    Top = 292
  end
  object QryResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ''
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      
        '  PED.VLRPEDIDO         , PED.DATACOTIZACAO     , PED.VLRCOTA   ' +
        '        ,'
      
        '  PED.VLRCOLOCACAO      , PED.VLRTAXAS          , PED.VLRCORRETA' +
        'GEM     ,'
      
        ' (PED.VLRPEDIDO - (PED.VLRCOLOCACAO+PED.VLRTAXAS+PED.VLRCORRETAG' +
        'EM)) As VALORTOTAL,'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.DTAINIPROC        ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      
        '  TPO.NATUREZAOPERACAO  , CAR.IDPLANOPREV       , CAR.IDPATROCIN' +
        'ADORA   ,'
      '  '#39' '#39' AS STACONFIRMA       ,'
      '  '#39' '#39' As STATUS,'
      '  PED.IDPLANPREVCTBPATR'
      'FROM'
      
        '  PEDIDOFUNDO PED, FUNDOINVEST FUN, TIPOOPERACAO TPO, CARTEIRAIN' +
        'VEST CAR'
      'WHERE'
      
        '  (PED.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        'AND'
      
        '  (PED.DATAPEDIDO        = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      ''
      
        '(((:IDFUNDOINVEST IS NOT NULL)                                  ' +
        'AND'
      
        '  (PED.IDFUNDOINVEST = :IDFUNDOINVEST))                         ' +
        'OR'
      
        '  (:IDFUNDOINVEST IS NULL) )                                    ' +
        'AND'
      ''
      
        '(((:IDTIPOINVEST <> 0)                                          ' +
        'AND'
      
        '  (PED.IDTIPOINVEST = :IDTIPOINVEST))                           ' +
        'OR'
      
        '  (:IDTIPOINVEST = 0) )                                         ' +
        'AND'
      ''
      
        '  (PED.IDTIPOOPERACAO IN (-56,-55))                             ' +
        'AND'
      
        '  (PED.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '(((:IDGESTORCARTEIRA IS NOT NULL)                               ' +
        'AND'
      
        '  (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                   ' +
        'OR'
      
        '  (:IDGESTORCARTEIRA IS NULL) )                                 ' +
        'AND'
      ''
      
        '(((:IDTIPOFUNDOINVEST IS NOT NULL)                              ' +
        'AND'
      
        '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))                 ' +
        'OR'
      
        '  (:IDTIPOFUNDOINVEST IS NULL) )                                ' +
        'AND'
      ''
      ''
      
        '  (CAR.IDCARTEIRAINVEST  = FUN.IDCARTEIRAINVEST)                ' +
        'AND'
      
        '  (FUN.IDFUNDOINVEST     = PED.IDFUNDOINVEST)                   ' +
        'AND'
      ''
      
        '  (PED.IDTIPOINVEST      = TPO.IDTIPOINVEST(+))                 ' +
        'AND'
      
        '  (PED.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO(+))               ' +
        'AND'
      ''
      '  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      ''
      'ORDER BY'
      ''
      '  FUN.DESCFUNDOINVEST, PED.DATAPEDIDO'
      ' '
      ' ')
    UpdateObject = UpdResgate
    ControlType.Strings = (
      'STATUS;CheckBox;S;N'
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 523
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QryResgateDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryResgateCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 14
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryResgateIDPEDIDOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
    end
    object QryResgateDATAPEDIDO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAPEDIDO'
    end
    object QryResgateDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryResgateDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryResgateVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 18
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryResgateVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object QryResgateSTACONFIRMA: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTATUS: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryResgateIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryResgateIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryResgateIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryResgateIDFUNDOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryResgateIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryResgateTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryResgateTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryResgateMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryResgateIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryResgateIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryResgateCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryResgateSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryResgatePZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryResgatePZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryResgatePZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryResgateQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryResgateQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryResgateSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryResgatePERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryResgatePERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryResgateSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryResgateIDTIPOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object QryResgateIDTIPOOPERACAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryResgateDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryResgateNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryResgateIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryResgateIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryResgateVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object QryResgateVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Visible = False
    end
    object QryResgateVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
    object QryResgateVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Visible = False
    end
    object QryResgateDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
  end
  object DsResgate: TwwDataSource
    DataSet = QryResgate
    Left = 627
    Top = 387
  end
  object QryAplicacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     ,'
      
        '  OPE.IDTIPOINVEST      , OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINV' +
        'EST     ,'
      
        '  OPE.DATAOPERACAO      , OPE.DATALIQUIDACAO    , OPE.QTDOPERACA' +
        'O       ,'
      
        '  OPE.VLROPERACAO       , OPE.VLRCOTA           , OPE.VLRIR     ' +
        '        ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.IDPLANPREVCTBPATR , OPE.DATACOTIZACAO     , OPE.VLRCOLOCAC' +
        'AO      ,'
      '  OPE.VLRTAXAS          , OPE.VLRCORRETAGEM     ,'
      
        '  (OPE.VLROPERACAO - (OPE.VLRCOLOCACAO+OPE.VLRTAXAS+OPE.VLRCORRE' +
        'TAGEM)) As VALORTOTAL,'
      
        '  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D009999999999'#39') AS Q' +
        'TDMOSTRA,'
      
        '  OPE.PLANO             , OPE.PLNCODIGO         , OPE.CODDOCUMEN' +
        'TO      ,'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.PZOCOTAPLIC       , FUN.DTAINIPROC        ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      
        '  TPO.NATUREZAOPERACAO  , CAR.IDPLANOPREV       , CAR.IDPATROCIN' +
        'ADORA   ,'
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S'
      'FROM'
      
        '  OPERACAOFUNDO OPE, FUNDOINVEST FUN, TIPOOPERACAO TPO, CARTEIRA' +
        'INVEST CAR'
      'WHERE'
      
        '  (OPE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        'AND'
      ''
      
        '  (OPE.DATAOPERACAO     = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ) ' +
        'AND'
      ''
      
        '(((:IDTIPOINVEST <> 0)                                          ' +
        'AND'
      
        '  (OPE.IDTIPOINVEST = :IDTIPOINVEST))                           ' +
        'OR'
      
        '  (:IDTIPOINVEST = 0) )                                         ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO IN (-56,-55))                             ' +
        'AND'
      ''
      
        '  (OPE.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '  (CAR.IDCARTEIRAINVEST = FUN.IDCARTEIRAINVEST)                 ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOINVEST     = TPO.IDTIPOINVEST(+))                  ' +
        'AND'
      
        '  (OPE.IDTIPOOPERACAO   = TPO.IDTIPOOPERACAO(+))                ' +
        'AND'
      
        '  (OPE.IDFUNDOINVEST    = FUN.IDFUNDOINVEST)                    ' +
        'AND'
      ''
      
        '(((:IDGESTORCARTEIRA IS NOT NULL)                               ' +
        'AND'
      
        '  (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                   ' +
        'OR'
      
        '  (:IDGESTORCARTEIRA IS NULL) )                                 ' +
        'AND'
      ''
      
        '(((:IDTIPOFUNDOINVEST IS NOT NULL)                              ' +
        'AND'
      
        '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))                 ' +
        'OR'
      
        '  (:IDTIPOFUNDOINVEST IS NULL) )                                ' +
        'AND'
      ''
      '  (TPO.NATUREZAOPERACAO = '#39'A'#39')'
      ''
      'ORDER BY'
      ''
      '  FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO'
      ' '
      ' '
      ' ')
    UpdateObject = UpdAplicacao
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 523
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
        Value = '09/04/2001'
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QryAplicacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryAplicacaoCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 14
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryAplicacaoIDOPERACAOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
    end
    object QryAplicacaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object QryAplicacaoDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryAplicacaoDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryAplicacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '############0.00'
    end
    object QryAplicacaoVLRCOLOCACAO: TFloatField
      DisplayLabel = 'Comissão Coloc.'
      DisplayWidth = 12
      FieldName = 'VLRCOLOCACAO'
    end
    object QryAplicacaoVLRTAXAS: TFloatField
      DisplayLabel = 'Taxas e Emol.'
      DisplayWidth = 12
      FieldName = 'VLRTAXAS'
    end
    object QryAplicacaoVLRCORRETAGEM: TFloatField
      DisplayLabel = 'Corretagem'
      DisplayWidth = 12
      FieldName = 'VLRCORRETAGEM'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryAplicacaoVALORTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 18
      FieldName = 'VALORTOTAL'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryAplicacaoSTACONFIRMA: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STACONFIRMA'
      Visible = False
      Size = 1
    end
    object QryAplicacaoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 23
      FieldName = 'QTDOPERACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryAplicacaoVLRCOTA: TFloatField
      DisplayLabel = 'Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTA'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryAplicacaoIDFUNDOINVEST: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryAplicacaoIDPEDIDOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryAplicacaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryAplicacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryAplicacaoVLRIR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIR'
      Visible = False
    end
    object QryAplicacaoVLRIOF: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIOF'
      Visible = False
    end
    object QryAplicacaoVLRRENDIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object QryAplicacaoIDFUNDOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryAplicacaoIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryAplicacaoTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryAplicacaoTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryAplicacaoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryAplicacaoIDCARTEIRAINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST_1'
      Visible = False
    end
    object QryAplicacaoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryAplicacaoSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryAplicacaoPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryAplicacaoPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryAplicacaoPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryAplicacaoQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryAplicacaoQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryAplicacaoSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryAplicacaoPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryAplicacaoPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryAplicacaoSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object QryAplicacaoSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object QryAplicacaoCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryAplicacaoIDTIPOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object QryAplicacaoIDTIPOOPERACAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryAplicacaoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryAplicacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoQTDMOSTRA: TStringField
      Alignment = taRightJustify
      DisplayWidth = 29
      FieldName = 'QTDMOSTRA'
      Visible = False
      Size = 29
    end
    object QryAplicacaoSTATUS: TStringField
      DisplayWidth = 10
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryAplicacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryAplicacaoIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryAplicacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryAplicacaoPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Visible = False
    end
    object QryAplicacaoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QryAplicacaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QryAplicacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QryAplicacaoDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
  end
  object DsAplicacao: TwwDataSource
    DataSet = QryAplicacao
    Left = 627
    Top = 435
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
        'ONAIOF  , FUN.CONTRCETIP'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '(FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)          AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                        AND'
      '  (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))           OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                          AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                       AND'
      '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))          OR'
      '  (:IDTIPOFUNDOINVEST IS NULL))                          AND'
      ''
      '(((:IDTIPOINVEST <> 0)                                   AND'
      '  (TFI.IDTIPOINVEST = :IDTIPOINVEST))                    OR'
      '  (:IDTIPOINVEST = 0))'
      ''
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 730
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestOperacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestOperacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestOperacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestOperacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestOperacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestOperacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestOperacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestOperacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 513
    Top = 60
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIP.IDTIPOINVEST      , TIP.IDTIPOOPERACAO    , '
      '  TIP.DESCTIPOOPERACAO  , TIP.NATUREZAOPERACAO  '
      'FROM '
      '  TIPOOPERACAO TIP'
      'WHERE'
      '  TIP.IDTIPOINVEST IN (6)'
      'ORDER BY '
      '  TIP.DESCTIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 600
    Top = 59
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
  end
  object UpdResgate: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      
        '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, D' +
        'ATAPEDIDO, '
      
        '   DATALIQUIDACAO, VLRPEDIDO, DATACOTIZACAO, VLRCOTA, VLRCOLOCAC' +
        'AO, VLRTAXAS, '
      '   VLRCORRETAGEM, IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T, :DATAPEDIDO, '
      
        '   :DATALIQUIDACAO, :VLRPEDIDO, :DATACOTIZACAO, :VLRCOTA, :VLRCO' +
        'LOCACAO, '
      '   :VLRTAXAS, :VLRCORRETAGEM, :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 731
    Top = 386
  end
  object UpdAplicacao: TUpdateSQL
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
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDPLANPREVCTBPATR, '
      '   DATACOTIZACAO, VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, PLANO, '
      'PLNCODIGO, '
      '   CODDOCUMENTO)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      
        '   :IDPLANPREVCTBPATR, :DATACOTIZACAO, :VLRCOLOCACAO, :VLRTAXAS,' +
        ' '
      ':VLRCORRETAGEM, '
      '   :PLANO, :PLNCODIGO, :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 731
    Top = 434
  end
  object QryVerificaOperacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   OPE.IDFUNDOINVEST,'
      '   OPE.DATAOPERACAO,'
      '   DESCTIPOOPERACAO'
      'FROM'
      '   OPERACAOFUNDO OPE, TIPOOPERACAO TPO'
      'WHERE'
      '   OPE.IDPLANPREVCTBPATR=:IDPLANPREVCTBPATR   AND'
      '   OPE.IDFUNDOINVEST    =:IDFUNDOINVEST       AND'
      '   OPE.DATAOPERACAO     =:DATAOPERACAO        AND'
      '   TPO.NATUREZAOPERACAO =:NATUREZAOPERACAO    AND'
      '   OPE.IDTIPOOPERACAO   = TPO.IDTIPOOPERACAO  '
      ''
      '')
    ValidateWithMask = True
    Left = 414
    Top = 187
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryVerAtualizacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      ''
      '  MIN(DATAMOVFUNDO) AS DATAMOVFUNDO'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)         AND'
      ''
      '(H1.IDHISTFUNDO  IN ('
      ''
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                     (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDO' +
        'INVEST=:IDFUNDOINVEST)) OR'
      
        '                      ((:IDFUNDOINVEST IS NULL)     AND (IDFUNDO' +
        'INVEST IS NOT NULL)))   AND'
      
        '                      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) AND'
      
        '                     ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO' +
        ', '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      '                      (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)     AND'
      ''
      '(FI.IDFUNDOINVEST = H1.IDFUNDOINVEST)'
      '')
    ValidateWithMask = True
    Left = 417
    Top = 251
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryParaminvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM PARAMINVEST  ')
    ValidateWithMask = True
    Left = 681
    Top = 59
  end
  object QryUpdParaminvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST  '
      'SET DATAULTFECHFDO=:DATAULTFECHFDO')
    ValidateWithMask = True
    Left = 439
    Top = 436
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHFDO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField19: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField21: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object StringField4: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object FloatField26: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object FloatField27: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object FloatField32: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object QryUpdTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TIPOFUNDOINVEST SET DATAULTFECH=:DATAULTFECH WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  '
      ' ')
    ValidateWithMask = True
    Left = 329
    Top = 436
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECH'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
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
    Left = 751
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerDelAplicacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT *'
      'FROM  HISTFUNDO'
      'WHERE IDFUNDOINVEST = :IDFUNDOINVEST  AND'
      '      DATAAPLICACAO = :DATAAPLICACAO')
    ValidateWithMask = True
    Left = 518
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptUnknown
      end>
  end
  object QryDelEspecificoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '*'
      'FROM'
      '    OPERACAOFUNDO OP, COMPOSICAOFUNDO CF'
      'WHERE'
      
        '   CF.IDFUNDOINVEST     = :IDFUNDOINVEST                      AN' +
        'D'
      
        '   OP.IDCOMPOSICAOFUNDO = CF.IDCOMPOSICAOFUNDO                AN' +
        'D'
      
        '   OP.DATAOPERACAO      = :DATAOPERACAO                       AN' +
        'D'
      
        '   OP.IDTIPOOPERACAO    = :IDTIPOOPERACAO                     AN' +
        'D'
      
        '   OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR                  AN' +
        'D'
      '   OP.IDTIPOINVEST      = :IDTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 601
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryUpdPedido: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE PEDIDOFUNDO SET'
      ''
      'CODDOCUMENTO =:CODDOCUMENTO,'
      ''
      'PLNCODIGO =:PLNCODIGO,'
      ''
      'PLANO =:PLANO'
      ''
      'WHERE IDPEDIDOFUNDO =:IDPEDIDOFUNDO')
    ValidateWithMask = True
    Left = 233
    Top = 436
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryVerDelResgate: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAMOVFUNDO'
      ''
      'FROM'
      '('
      'SELECT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAMOVFUNDO'
      ''
      'FROM HISTFUNDO'
      'WHERE'
      '       (IDTIPOOPERACAO NOT IN (-12,-13))  AND'
      '       (IDOPERACAOFUNDO IN ('
      '        SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO'
      '        WHERE IDPEDIDOFUNDO =:IDPEDIDOFUNDO))'
      ''
      'UNION'
      ''
      'SELECT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAPEDIDO AS DATAMOVFUNDO'
      'FROM'
      '   PEDIDOFUNDO'
      'WHERE'
      '   (CODDOCUMENTO IS NOT NULL) AND'
      '   (PLNCODIGO IS NOT NULL)    AND'
      '   (IDPEDIDOFUNDO =:IDPEDIDOFUNDO))'
      ''
      ''
      ''
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 681
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdOperacaoFundo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET '
      'PLANO = :PLANO, '
      'PLNCODIGO = :PLNCODIGO,'
      'CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO')
    Left = 421
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
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
      ' WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO'
      '   AND NOT TIPMOVFUNDO = '#39'ATU'#39)
    ValidateWithMask = True
    Left = 731
    Top = 236
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
      'FROM   HISTFUNDO'
      ''
      'WHERE'
      '       IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '   AND IDFUNDOINVEST     = :IDFUNDOINVEST'
      '   AND DATAAPLICACAO     = :DATAAPLICACAO'
      '   AND DATAMOVFUNDO      = :DATAMOVFUNDO'
      '   AND IDTIPOINVEST      = :IDTIPOINVEST'
      '   AND IDTIPOOPERACAO    = :IDTIPOOPERACAO'
      '   AND IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '   AND NATURMOVFUNDO     = :NATURMOVFUNDO'
      '   AND TIPMOVFUNDO       = '#39'ATU'#39
      ''
      ' ')
    ValidateWithMask = True
    Left = 731
    Top = 291
    ParamData = <
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
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NATURMOVFUNDO'
        ParamType = ptResult
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
    Left = 731
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptUnknown
      end>
  end
end
