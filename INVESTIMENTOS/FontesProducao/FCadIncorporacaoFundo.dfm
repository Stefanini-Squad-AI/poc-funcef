inherited FrmCadIncorporacaoFundo: TFrmCadIncorporacaoFundo
  Left = 2
  Top = 39
  HelpContext = 790212
  Caption = 'Operação'
  ClientHeight = 451
  ClientWidth = 786
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 786
    Height = 365
    inherited Bevel2: TBevel
      Width = 784
    end
    inherited pnlTitulo: TPanel
      Width = 784
      inherited lbNomItem: TfcLabel
        Width = 441
        Caption = 'Incorporação dos Fundos de Investimentos'
      end
    end
    object PnlAplicacao: TPanel
      Left = 354
      Top = 125
      Width = 346
      Height = 239
      Align = alRight
      TabOrder = 4
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 344
        Height = 24
        Align = alTop
        Caption = 'Aplicação'
        Color = clNavy
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pgcAplicacao: TPageControl
        Left = 1
        Top = 25
        Width = 344
        Height = 213
        ActivePage = tbsDadosApl
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        TabPosition = tpRight
        object tbsDadosApl: TTabSheet
          Caption = 'Dados'
          object PnlFdoApl: TPanel
            Left = 0
            Top = 0
            Width = 319
            Height = 203
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvLowered
            TabOrder = 0
            object Label17: TLabel
              Left = 6
              Top = 5
              Width = 130
              Height = 13
              Caption = 'Fundo de Investimento'
            end
            object Label15: TLabel
              Left = 6
              Top = 45
              Width = 106
              Height = 13
              Caption = 'Data da Cotização'
            end
            object Label19: TLabel
              Left = 161
              Top = 45
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
            object Label18: TLabel
              Left = 6
              Top = 85
              Width = 83
              Height = 13
              Caption = 'Valor Aplicado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 161
              Top = 84
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
            object DbLkcFundoInvestApl: TwwDBLookupCombo
              Left = 6
              Top = 19
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              DataField = 'IDFUNDOINVEST'
              DataSource = DsDestino
              LookupTable = QryFundoDestino
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DbLkcFundoInvestAplCloseUp
            end
            object DbDtDataCotizacaoAplic: TCMDateTimePicker
              Left = 6
              Top = 59
              Width = 119
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOTIZACAO'
              DataSource = DsDestino
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
            object dbrCota: TDBRealEdit
              Left = 161
              Top = 59
              Width = 154
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00000000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 17
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = DsDestino
            end
            object dbrValorAplic: TDBRealEdit
              Left = 6
              Top = 99
              Width = 155
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPEDIDO'
              DataSource = DsDestino
            end
            object dbrQtdOper: TDBRealEdit
              Left = 161
              Top = 98
              Width = 154
              Height = 22
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,000000000')
              TabOrder = 4
              WordWrap = False
              IntDigits = 17
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDOPERACAO'
              DataSource = DsDestino
            end
            object Panel2: TPanel
              Left = 2
              Top = 129
              Width = 315
              Height = 72
              Align = alBottom
              BevelInner = bvLowered
              BevelOuter = bvSpace
              Enabled = False
              TabOrder = 5
              object dbrQtdFinancApl: TDBRealEdit
                Left = 158
                Top = 49
                Width = 154
                Height = 21
                Alignment = taRightJustify
                Color = clMenu
                Enabled = False
                Lines.Strings = (
                  '0,000000000')
                TabOrder = 4
                WordWrap = False
                IntDigits = 17
                DecDigits = 9
                NumberFormat = fNumber
                Signal = False
              end
              object dbrSaldoFinancApl: TDBRealEdit
                Left = 1
                Top = 49
                Width = 157
                Height = 21
                Alignment = taRightJustify
                Color = clMenu
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 3
                WordWrap = False
                OnExit = dbrValorLiquidoExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object Edit3: TEdit
                Left = 1
                Top = 28
                Width = 157
                Height = 21
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                Text = 'Financeiro'
              end
              object Edit4: TEdit
                Left = 158
                Top = 28
                Width = 154
                Height = 21
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                Text = 'Quantidade'
              end
              object Panel3: TPanel
                Left = 2
                Top = 2
                Width = 311
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Saldo Sintético'
                Color = clInactiveBorder
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object DbgAplicacao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 319
            Height = 203
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'23'#9'Fundo de Investimento'
              'VLRPEDIDO'#9'16'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsDestino
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
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
        object tbsObsApl: TTabSheet
          Caption = 'Obs.'
          ImageIndex = 1
          object pnlObsAplic: TPanel
            Left = 0
            Top = 0
            Width = 319
            Height = 195
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbeObsApl: TDBMemo
              Left = 0
              Top = 0
              Width = 319
              Height = 195
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = DsOperacaoFundo
              MaxLength = 300
              TabOrder = 0
            end
          end
        end
      end
    end
    object PnlOrigem: TPanel
      Left = 1
      Top = 45
      Width = 784
      Height = 49
      Align = alTop
      TabOrder = 1
      object PnlData: TPanel
        Left = 1
        Top = 1
        Width = 782
        Height = 46
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object Label23: TLabel
          Left = 348
          Top = 5
          Width = 105
          Height = 13
          Caption = 'Data da Operação'
        end
        object lblTipFndOrigem: TLabel
          Left = 10
          Top = 4
          Width = 83
          Height = 13
          Caption = 'Tipo de Fundo'
        end
        object dbDDataOperacao: TCMDateTimePicker
          Left = 348
          Top = 20
          Width = 119
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
          OnExit = dbDDataOperacaoExit
        end
        object dblTipoFundo: TwwDBLookupCombo
          Left = 10
          Top = 19
          Width = 287
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOFUNDOINV'#9'25'#9'Descrição'#9'F')
          LookupTable = QryTipoFundo
          LookupField = 'IDTIPOFUNDOINVEST'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblTipoFundoExit
        end
      end
    end
    object PnlResgate: TPanel
      Left = 1
      Top = 125
      Width = 346
      Height = 239
      Align = alLeft
      TabOrder = 2
      object pgcResgate: TPageControl
        Left = 1
        Top = 25
        Width = 344
        Height = 213
        ActivePage = tbsDadosResg
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object tbsDadosResg: TTabSheet
          Caption = 'Dados'
          object DbgResgate: TwwDBGrid
            Left = 0
            Top = 0
            Width = 319
            Height = 203
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'23'#9'Fundo de Investimentos'
              'VLRPEDIDO'#9'16'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = ds
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
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
          object PnlFdoResg: TPanel
            Left = 0
            Top = 0
            Width = 319
            Height = 203
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvLowered
            TabOrder = 0
            OnDblClick = PnlFdoResgDblClick
            object Label16: TLabel
              Left = 6
              Top = 45
              Width = 106
              Height = 13
              Caption = 'Data da Cotização'
            end
            object Label13: TLabel
              Left = 6
              Top = 85
              Width = 99
              Height = 13
              Caption = 'Valor do Resgate'
            end
            object Label4: TLabel
              Left = 162
              Top = 45
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
            object Label12: TLabel
              Left = 6
              Top = 6
              Width = 130
              Height = 13
              Caption = 'Fundo de Investimento'
            end
            object DbDtDataCotizacaoResg: TCMDateTimePicker
              Left = 6
              Top = 59
              Width = 119
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOTIZACAO'
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
            object dbrValorLiquido: TDBRealEdit
              Left = 6
              Top = 99
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = dbrValorLiquidoExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPEDIDO'
              DataSource = ds
            end
            object dbrCotaResg: TDBRealEdit
              Left = 162
              Top = 59
              Width = 152
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00000000')
              TabOrder = 3
              WordWrap = False
              IntDigits = 17
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = ds
            end
            object DbLkcFundoInvestResg: TwwDBLookupCombo
              Left = 6
              Top = 19
              Width = 309
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              DataField = 'IDFUNDOINVEST'
              DataSource = ds
              LookupTable = QryFundoOrigem
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DbLkcFundoInvestResgCloseUp
            end
            object PnlSaldoSintetico: TPanel
              Left = 2
              Top = 129
              Width = 315
              Height = 72
              Align = alBottom
              BevelInner = bvLowered
              BevelOuter = bvSpace
              Enabled = False
              TabOrder = 4
              object dbrQtdFinancResg: TDBRealEdit
                Left = 156
                Top = 49
                Width = 156
                Height = 21
                Alignment = taRightJustify
                Color = clMenu
                Enabled = False
                Lines.Strings = (
                  '0,000000000')
                TabOrder = 4
                WordWrap = False
                IntDigits = 17
                DecDigits = 9
                NumberFormat = fNumber
                Signal = False
              end
              object dbrSaldoFinancResg: TDBRealEdit
                Left = 1
                Top = 49
                Width = 155
                Height = 21
                Alignment = taRightJustify
                Color = clMenu
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 3
                WordWrap = False
                OnExit = dbrValorLiquidoExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object Edit1: TEdit
                Left = 1
                Top = 28
                Width = 155
                Height = 21
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                Text = 'Financeiro'
              end
              object Edit2: TEdit
                Left = 156
                Top = 28
                Width = 156
                Height = 21
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                Text = 'Quantidade'
              end
              object PnlCab2: TPanel
                Left = 2
                Top = 2
                Width = 311
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Saldo Sintético'
                Color = clInactiveBorder
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
        object tbsObsResg: TTabSheet
          Caption = 'Obs.'
          ImageIndex = 1
          object pnlObsResg: TPanel
            Left = 0
            Top = 0
            Width = 319
            Height = 195
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbeObsResg: TDBMemo
              Left = 0
              Top = 0
              Width = 319
              Height = 195
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = ds
              MaxLength = 300
              TabOrder = 0
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 344
        Height = 24
        Align = alTop
        Caption = 'Resgate'
        Color = clNavy
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Dock973: TDock97
      Left = 1
      Top = 94
      Width = 784
      Height = 31
      AllowDrag = False
      BoundLines = [blTop, blBottom, blLeft, blRight]
      object Toolbar972: TToolbar97
        Left = 0
        Top = 0
        Caption = 'tb97BotoesDetalhe'
        DockPos = 0
        TabOrder = 0
        object sbtnExcluiDet: TToolbarButton97
          Left = 50
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Excluir'
          AllowAllUp = True
          ImageIndex = 2
          Images = ImlPadrao
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnExcluiDetClick
        end
        object sbtnAltDet: TToolbarButton97
          Left = 25
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Alterar'
          AllowAllUp = True
          GroupIndex = 2
          ImageIndex = 1
          Images = ImlPadrao
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAltDetClick
        end
        object sbtnInsDet: TToolbarButton97
          Left = 0
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Inserir'
          AllowAllUp = True
          GroupIndex = 2
          ImageIndex = 0
          Images = ImlPadrao
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnInsDetClick
        end
      end
      object Toolbar973: TToolbar97
        Left = 79
        Top = 0
        Caption = 'Toolbar973'
        DockPos = 79
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 692
          Height = 25
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object fcLabel6: TfcLabel
            Left = 267
            Top = 3
            Width = 176
            Height = 20
            Caption = 'Total da Incorporação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taCenter
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fclTotalApl: TfcLabel
            Left = 651
            Top = 3
            Width = 35
            Height = 20
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taRightJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
        end
      end
    end
    object Dock978: TDock97
      Left = 700
      Top = 125
      Width = 85
      Height = 239
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
  inherited Dock972: TDock97
    Width = 786
    object fcLOperador: TfcLabel [0]
      Left = 712
      Top = 10
      Width = 0
      Height = 0
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clGrayText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taRightJustify
      TextOptions.LineSpacing = 0
      TextOptions.OutlineColor = clGreen
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      object sbtnImprimir: TToolbarButton97
        Left = 240
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
    Top = 412
    Width = 786
    inherited tb97Fundo: TToolbar97
      Left = 614
      DockPos = 969
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 445
      DockPos = 800
    end
    inline fraMensagem: TfraMensagem
      Width = 449
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 449
        inherited pnlProgressoBarra: TPanel
          Width = 252
          inherited pgbProcesso: TProgressBar
            Width = 250
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 46
    Top = 358
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  PLANO = :PLANO,'
      '  IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO,'
      '  STAESPECIFICADO = :STAESPECIFICADO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST,'
      
        '   DATAPEDIDO, DATALIQUIDACAO, VLRPEDIDO, IDPLANPREVCTBPATR, DAT' +
        'ACOTIZACAO,'
      '   CODDOCUMENTO, NUMLANCTO, PLNCODIGO, PLANO, IDCOMPOSICAOFUNDO,'
      
        '   STAESPECIFICADO, VLRCOTA, VLRCOLOCACAO, VLRTAXAS, VLRCORRETAG' +
        'EM, OBSERVACAO)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T,'
      
        '   :DATAPEDIDO, :DATALIQUIDACAO, :VLRPEDIDO, :IDPLANPREVCTBPATR,' +
        ' :DATACOTIZACAO,'
      
        '   :CODDOCUMENTO, :NUMLANCTO, :PLNCODIGO, :PLANO, :IDCOMPOSICAOF' +
        'UNDO,'
      
        '   :STAESPECIFICADO, :VLRCOTA, :VLRCOLOCACAO, :VLRTAXAS, :VLRCOR' +
        'RETAGEM, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 74
    Top = 358
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DATAOPERACAO'
      'DESCFUNDOINVEST'
      'VLROPERACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Operação'
      'Fundo Incorporado'
      'Valor da Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOFUNDO'
      
        '(SELECT IDOPERACAOFUNDO FROM PEDIDOFUNDO, INCORPORACAOFUNDO WHER' +
        'E INCORPORACAOFUNDO.IDPEDIDOFUNDO = PEDIDOFUNDO.IDPEDIDOFUNDO) C' +
        'OMPOSICAOAPL'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO'
      'FUNDOINVEST.IDTIPOFUNDOINVEST'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO   = COMPOSICAOAPL.IDOPERACAOFUNDO'
      'FUNDOINVEST.IDFUNDOINVEST       = OPERACAOFUNDO.IDFUNDOINVEST ')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,###,##0.00')
    Larguras.Strings = (
      '14'
      '53'
      '28')
    UsaDistinct = True
  end
  inherited ImlPadrao: TImageList
    Left = 273
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 284
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   PED.IDPEDIDOFUNDO,     PED.IDTIPOINVEST,      PED.IDTIPOOPERA' +
        'CAO,     PED.IDFUNDOINVEST,'
      
        '   PED.DATAPEDIDO,        PED.DATALIQUIDACAO,    PED.VLRPEDIDO, ' +
        '         PED.IDPLANPREVCTBPATR,'
      
        '   PED.DATACOTIZACAO,     PED.CODDOCUMENTO,      PED.NUMLANCTO, ' +
        '         PED.PLNCODIGO,'
      
        '   PED.PLANO,             PED.IDCOMPOSICAOFUNDO, PED.STAESPECIFI' +
        'CADO,    PED.VLRCOTA,'
      
        '   PED.VLRCOLOCACAO,      PED.VLRTAXAS,          PED.VLRCORRETAG' +
        'EM,      PED.OBSERVACAO,'
      '   FDO.IDTIPOFUNDOINVEST, FDO.DESCFUNDOINVEST,   FDO.DTAINIPROC'
      'FROM'
      '   PEDIDOFUNDO PED, INCORPORACAOFUNDO INC, FUNDOINVEST FDO'
      'WHERE'
      '   INC.IDOPERACAOFUNDO    =:IDOPERACAOFUNDO     AND'
      '   PED.IDPEDIDOFUNDO      = INC.IDPEDIDOFUNDO  AND'
      '   FDO.IDFUNDOINVEST      = PED.IDFUNDOINVEST'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 18
    Top = 358
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
    object qryDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 23
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '###,###,###,###0.00'
    end
    object qryIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
      Visible = False
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Visible = False
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryIDCOMPOSICAOFUNDO: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
      Visible = False
    end
    object qrySTAESPECIFICADO: TStringField
      FieldName = 'STAESPECIFICADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object qryVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Visible = False
    end
    object qryVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
    object qryVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Visible = False
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object qryIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QryDestino: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    INC.IDINCORPORACAOFUNDO, INC.IDOPERACAOFUNDO, INC.DATAPEDIDO' +
        ','
      
        '    INC.IDPEDIDOFUNDO,       INC.IDFUNDOINVEST,   INC.IDTIPOINVE' +
        'ST,'
      
        '    INC.IDTIPOFUNDOINVEST,   INC.IDTIPOOPERACAO,  INC.IDPLANPREV' +
        'CTBPATR,'
      '    INC.DATALIQUIDACAO,      INC.DATACOTIZACAO,   INC.VLRPEDIDO,'
      
        '    INC.VLRCOTA,             INC.QTDOPERACAO,     INC.OBSERVACAO' +
        ','
      '    FDO.DESCFUNDOINVEST,     FDO.DTAINIPROC'
      'FROM'
      '    INCORPORACAOFUNDO INC, FUNDOINVEST FDO'
      'WHERE'
      '   INC.IDOPERACAOFUNDO = :IDOPERACAOFUNDO   AND'
      '   FDO.IDFUNDOINVEST   = INC.IDFUNDOINVEST'
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
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdDestino
    ValidateWithMask = True
    Left = 18
    Top = 310
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
    object QryDestinoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 23
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryDestinoVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '###,###,###,###0.00'
    end
    object QryDestinoIDINCORPORACAOFUNDO: TFloatField
      FieldName = 'IDINCORPORACAOFUNDO'
      Visible = False
    end
    object QryDestinoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryDestinoDATAPEDIDO: TDateTimeField
      FieldName = 'DATAPEDIDO'
      Visible = False
    end
    object QryDestinoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryDestinoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryDestinoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryDestinoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryDestinoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryDestinoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryDestinoDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Visible = False
    end
    object QryDestinoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object QryDestinoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object QryDestinoQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Visible = False
    end
    object QryDestinoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object QryDestinoDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object DsDestino: TwwDataSource
    DataSet = QryDestino
    Left = 46
    Top = 310
  end
  object UpdDestino: TUpdateSQL
    ModifySQL.Strings = (
      'update INCORPORACAOFUNDO'
      'set'
      '  IDINCORPORACAOFUNDO = :IDINCORPORACAOFUNDO,'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  VLRCOTA = :VLRCOTA,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDINCORPORACAOFUNDO = :OLD_IDINCORPORACAOFUNDO')
    InsertSQL.Strings = (
      'insert into INCORPORACAOFUNDO'
      
        '  (IDINCORPORACAOFUNDO, IDOPERACAOFUNDO, DATAPEDIDO, IDPEDIDOFUN' +
        'DO, IDFUNDOINVEST, '
      
        '   IDTIPOINVEST, IDTIPOFUNDOINVEST, IDTIPOOPERACAO, IDPLANPREVCT' +
        'BPATR, '
      
        '   DATALIQUIDACAO, DATACOTIZACAO, VLRPEDIDO, VLRCOTA, QTDOPERACA' +
        'O, OBSERVACAO)'
      'values'
      
        '  (:IDINCORPORACAOFUNDO, :IDOPERACAOFUNDO, :DATAPEDIDO, :IDPEDID' +
        'OFUNDO, '
      
        '   :IDFUNDOINVEST, :IDTIPOINVEST, :IDTIPOFUNDOINVEST, :IDTIPOOPE' +
        'RACAO, '
      
        '   :IDPLANPREVCTBPATR, :DATALIQUIDACAO, :DATACOTIZACAO, :VLRPEDI' +
        'DO, :VLRCOTA, '
      '   :QTDOPERACAO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from INCORPORACAOFUNDO'
      'where'
      '  IDINCORPORACAOFUNDO = :OLD_IDINCORPORACAOFUNDO')
    Left = 74
    Top = 310
  end
  object QryBuscaUsuario: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT NOMEUSUARIO'
      'FROM'
      '   USUARIOSISTEMA'
      'WHERE'
      '   IDUSUARIO =:IDUSUARIO   ')
    ValidateWithMask = True
    Left = 281
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object QryFundoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '      (((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '      (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )                AND'
      ''
      '      (((:IDTIPOINVEST <> 0)                          AND'
      '     (TFI.IDTIPOINVEST = :IDTIPOINVEST)) OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCFUNDOINVEST'
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
    Left = 282
    Top = 214
    ParamData = <
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
        Value = 0
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
  object QryFundoDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      '      (((:IDTIPOFUNDOINVEST IS NOT NULL) AND'
      ''
      '        (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) ) AND'
      ''
      '      (((:IDFUNDOINVORIGEM IS NOT NULL) AND'
      '        (FUN.IDFUNDOINVEST <> :IDFUNDOINVORIGEM)) OR'
      '        (:IDFUNDOINVORIGEM IS NULL) ) AND'
      ''
      '      (((:IDTIPOINVEST <> 0) AND'
      '        (TFI.IDTIPOINVEST = :IDTIPOINVEST)) OR'
      '        (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY DESCFUNDOINVEST'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 167
    ParamData = <
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
        Name = 'IDFUNDOINVORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVORIGEM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = 0
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
  object QryTpoOperDest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM '
      '     TIPOOPERACAO'
      'WHERE'
      '     (IDTIPOINVEST     =:IDTIPOINVEST)  AND'
      '     (IDTIPOOPERACAO   > 0  )           AND     '
      '     (NATUREZAOPERACAO = '#39'A'#39')           AND'
      '     (FLGTRANSF       <> '#39'N'#39')           AND     '
      '     (FLGTRANSF IS NOT NULL )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 168
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = 0
      end>
  end
  object QryTpoOperOrig: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM '
      '     TIPOOPERACAO'
      'WHERE'
      '     (IDTIPOINVEST     =:IDTIPOINVEST)  AND'
      '     (IDTIPOOPERACAO   > 0  )           AND     '
      '     (NATUREZAOPERACAO = '#39'D'#39')           AND'
      '     (FLGTRANSF       <> '#39'N'#39')           AND'
      '     (FLGTRANSF IS NOT NULL )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 166
    Top = 310
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = 0
      end>
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO    , SUM(NVL(H1.VLRIRPROV,' +
        '0))  AS VLRIRPROV , SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV    ' +
        '  ,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO      , SUM(H1.COTASMO' +
        'VFUNDO) AS COTASMOVFUNDO    , SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO' +
        ' ,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O'
      ''
      'FROM HISTFUNDO H1'
      ''
      'WHERE'
      ''
      '(H1.IDHISTFUNDO  IN ('
      ''
      '                 SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                 FROM   HISTFUNDO HF'
      '                 WHERE'
      
        '                      (HF.IDTIPOINVEST      = :IDTIPOINVEST)    ' +
        '  AND'
      
        '                      (HF.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR' +
        ') AND'
      
        '                      (HF.IDFUNDOINVEST     = :IDFUNDOINVEST)   ' +
        '  AND'
      
        '                      (HF.DATAAPLICACAO    <= TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) AND'
      
        '                      (HF.DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) AND'
      
        '                     ((HF.DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) OR HF.IDHISTFUNDO < 999999999) AND'
      '                      (HF.TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                 GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBPATR,' +
        ' HF.IDFUNDOINVEST, HF.DATAAPLICACAO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                   AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)'
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 335
    ParamData = <
      item
        DataType = ftInteger
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
        Name = 'DATAMOVFUNDO'
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
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 282
    Top = 113
  end
  object QryTipoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      'WHERE'
      
        '      (((:IDTIPOFUNDOINVEST <> 0)  AND (:IDTIPOFUNDOINVEST = IDT' +
        'IPOFUNDOINVEST)) OR'
      
        '        (:IDTIPOFUNDOINVEST  = 0))                              ' +
        '                 AND'
      
        '      (((:IDTIPOINVEST      <> 0)  AND (:IDTIPOINVEST      = IDT' +
        'IPOINVEST))      OR'
      '        (:IDTIPOINVEST       = 0))'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 166
    Top = 210
    ParamData = <
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
    Left = 567
    Top = 337
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
  object QryUpdOperacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET'
      '       PLANO =:PLANO,'
      '       PLNCODIGO =:PLNCODIGO,'
      '       CODDOCUMENTO =:CODDOCUMENTO'
      'WHERE'
      '       IDOPERACAOFUNDO =:IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 567
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
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
    Left = 170
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryOperacaoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT IDOPERACAOFUNDO, IDTIPOINVEST, PLANO, PLNCODIGO, CODDOCUM' +
        'ENTO, DATAOPERACAO'
      'FROM  OPERACAOFUNDO'
      'WHERE (IDTIPOINVEST      = :IDTIPOINVEST)               AND'
      '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)          AND'
      '      (DATAOPERACAO      = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDOPERACAOFUNDO   = :IDOPERACAOFUNDO)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 446
    Top = 282
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
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryUpdIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE IRLITIGIO SET'
      '       PLANO =:PLANO,'
      '       PLNCODIGO =:PLNCODIGO'
      'WHERE'
      '       IDOPERACAOFUNDO =:IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 567
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      '    (FUN.IDFUNDOINVEST     = :IDFUNDOINVEST)         AND'
      '    (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      'ORDER BY DESCFUNDOINVEST'
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
    Left = 170
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end>
  end
  object QryOperacaoFundo: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OPE.IDOPERACAOFUNDO,      OPE.IDCARTEIRAINVEST,      OPE.IDPE' +
        'DIDOFUNDO,'
      
        '   OPE.IDTIPOINVEST,         OPE.IDTIPOOPERACAO,        OPE.IDFU' +
        'NDOINVEST,'
      
        '   OPE.DATAOPERACAO,         OPE.DATALIQUIDACAO,        OPE.QTDO' +
        'PERACAO,'
      
        '   OPE.VLROPERACAO,          OPE.VLRCOTA,               OPE.VLRI' +
        'R,'
      
        '   OPE.VLRIOF,               OPE.VLRRENDIMENTO,         OPE.STAC' +
        'ONFIRMA,'
      
        '   OPE.IDOPERACAOORIGEM,     OPE.IDPLANPREVCTBPATR,     OPE.DATA' +
        'COTIZACAO,'
      
        '   OPE.VLRDESCONTO,          OPE.IDCOMPOSICAOFUNDO,     OPE.STAE' +
        'SPECIFICADO,'
      
        '   OPE.VLRCOLOCACAO,         OPE.VLRTAXAS,              OPE.VLRC' +
        'ORRETAGEM,'
      
        '   OPE.OBSERVACAO,           OPE.PLANO,                 OPE.PLNC' +
        'ODIGO,'
      
        '   OPE.CODDOCUMENTO,         OPE.IDOPERACAODIREITO,     OPE.QTDU' +
        'SUFRUTO,'
      '   FDO.DESCFUNDOINVEST'
      'FROM'
      '   OPERACAOFUNDO OPE, FUNDOINVEST FDO'
      'WHERE'
      '   OPE.IDOPERACAOFUNDO = :IDOPERACAOFUNDO AND'
      '   FDO.IDFUNDOINVEST   = OPE.IDFUNDOINVEST'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdOperacaoFundo
    ValidateWithMask = True
    Left = 18
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 23
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOFUNDO.VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '###,###,###,###0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'OPERACAOFUNDO.IDOPERACAOFUNDO'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOFUNDO.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'OPERACAOFUNDO.IDPEDIDOFUNDO'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOFUNDO.IDTIPOINVEST'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOFUNDO.IDTIPOOPERACAO'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'OPERACAOFUNDO.IDFUNDOINVEST'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOFUNDO.DATAOPERACAO'
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'OPERACAOFUNDO.DATALIQUIDACAO'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'OPERACAOFUNDO.QTDOPERACAO'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'OPERACAOFUNDO.VLRCOTA'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'VLRIR'
      Origin = 'OPERACAOFUNDO.VLRIR'
      Visible = False
    end
    object FloatField11: TFloatField
      FieldName = 'VLRIOF'
      Origin = 'OPERACAOFUNDO.VLRIOF'
      Visible = False
    end
    object FloatField12: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Origin = 'OPERACAOFUNDO.VLRRENDIMENTO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'STACONFIRMA'
      Origin = 'OPERACAOFUNDO.STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField13: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'OPERACAOFUNDO.IDOPERACAOORIGEM'
      Visible = False
    end
    object FloatField14: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'OPERACAOFUNDO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'OPERACAOFUNDO.DATACOTIZACAO'
      Visible = False
    end
    object FloatField15: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'OPERACAOFUNDO.VLRDESCONTO'
      Visible = False
    end
    object FloatField16: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
      Origin = 'OPERACAOFUNDO.IDCOMPOSICAOFUNDO'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'STAESPECIFICADO'
      Origin = 'OPERACAOFUNDO.STAESPECIFICADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField17: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Origin = 'OPERACAOFUNDO.VLRCOLOCACAO'
      Visible = False
    end
    object FloatField18: TFloatField
      FieldName = 'VLRTAXAS'
      Origin = 'OPERACAOFUNDO.VLRTAXAS'
      Visible = False
    end
    object FloatField19: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Origin = 'OPERACAOFUNDO.VLRCORRETAGEM'
      Visible = False
    end
    object MemoField1: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OPERACAOFUNDO.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object FloatField20: TFloatField
      FieldName = 'PLANO'
      Origin = 'OPERACAOFUNDO.PLANO'
      Visible = False
    end
    object FloatField21: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'OPERACAOFUNDO.PLNCODIGO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'OPERACAOFUNDO.CODDOCUMENTO'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'OPERACAOFUNDO.IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField24: TFloatField
      FieldName = 'QTDUSUFRUTO'
      Origin = 'OPERACAOFUNDO.QTDUSUFRUTO'
      Visible = False
    end
  end
  object DsOperacaoFundo: TwwDataSource
    DataSet = QryOperacaoFundo
    Left = 46
    Top = 263
  end
  object UpdOperacaoFundo: TUpdateSQL
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
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO,'
      '  STAESPECIFICADO = :STAESPECIFICADO,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  QTDUSUFRUTO = :QTDUSUFRUTO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, IDTIPOOPERACAO,'
      
        '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLR' +
        'OPERACAO,'
      
        '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, IDOPERACA' +
        'OORIGEM,'
      
        '   IDPLANPREVCTBPATR, DATACOTIZACAO, VLRDESCONTO, IDCOMPOSICAOFU' +
        'NDO,'
      
        '   STAESPECIFICADO, VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, OBSER' +
        'VACAO, PLANO,'
      '   PLNCODIGO, CODDOCUMENTO, IDOPERACAODIREITO, QTDUSUFRUTO)'
      'values'
      
        '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, :IDTIPOI' +
        'NVEST, :IDTIPOOPERACAO,'
      
        '   :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDACAO, :QTDOPERACAO,' +
        ' :VLROPERACAO,'
      
        '   :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, :STACONFIRMA, :IDO' +
        'PERACAOORIGEM,'
      
        '   :IDPLANPREVCTBPATR, :DATACOTIZACAO, :VLRDESCONTO, :IDCOMPOSIC' +
        'AOFUNDO,'
      
        '   :STAESPECIFICADO, :VLRCOLOCACAO, :VLRTAXAS, :VLRCORRETAGEM, :' +
        'OBSERVACAO, :PLANO,'
      '   :PLNCODIGO, :CODDOCUMENTO, :IDOPERACAODIREITO, :QTDUSUFRUTO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 74
    Top = 263
  end
  object QryDelIncorporacaoFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'DELETE FROM INCORPORACAOFUNDO WHERE IDOPERACAOFUNDO   = :IDOPERA' +
        'CAOFUNDO')
    ValidateWithMask = True
    Left = 699
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryDelOperacaoFundoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = :IDOPERACAOFUN' +
        'DO'
      ' ')
    ValidateWithMask = True
    Left = 699
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryDelHistOperacaoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT *'
      'FROM     HISTFUNDO'
      'WHERE'
      #9'(HISTFUNDO.DATAMOVFUNDO      = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      #9'(HISTFUNDO.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)          AND'
      #9'(HISTFUNDO.IDOPERACAOFUNDO   = :IDOPERACAOFUNDO)')
    ValidateWithMask = True
    Left = 699
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryBuscaPedidos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPEDIDOFUNDO'
      'FROM'
      '     INCORPORACAOFUNDO I, PEDIDOFUNDO P'
      'WHERE'
      '     I.IDOPERACAOFUNDO   = :IDOPERACAOFUNDO  AND'
      '     P.IDPEDIDOFUNDO     = I.IDPEDIDOFUNDO  AND'
      '     P.IDFUNDOINVEST     = :IDFUNDOINVEST'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end>
  end
  object QryBuscaIncorporacaoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINCORPORACAOFUNDO'
      'FROM'
      '     INCORPORACAOFUNDO'
      'WHERE'
      '     DATAPEDIDO        = :DATAPEDIDO     AND'
      '     IDFUNDOINVEST     = :IDFUNDOINVEST  AND'
      '     IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR '
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 312
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftIDispatch
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end>
  end
end
