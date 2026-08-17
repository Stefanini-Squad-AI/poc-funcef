inherited frmCadTransfFundoTipo: TfrmCadTransfFundoTipo
  Left = 127
  Top = 55
  HelpContext = 790208
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Operação'
  ClientHeight = 543
  ClientWidth = 792
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 457
    inherited Bevel2: TBevel
      Top = 37
      Width = 790
    end
    inherited pnlTitulo: TPanel
      Width = 790
      Height = 36
      TabOrder = 2
      inherited lbNomItem: TfcLabel
        Top = 6
        Width = 361
        Caption = 'Transferência entre Tipos de Fundo'
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 73
      Width = 790
      Height = 383
      Align = alClient
      TabOrder = 1
      object pnlDestino: TPanel
        Left = 1
        Top = 154
        Width = 788
        Height = 228
        Align = alClient
        TabOrder = 1
        object dbgDetDestino: TwwDBGrid
          Left = 321
          Top = 25
          Width = 466
          Height = 202
          TabStop = False
          Selected.Strings = (
            'DATAAPLICACAO'#9'10'#9'Aplicação'#9'F'
            'VLRAPLICADO'#9'18'#9'Valor Aplicado'#9'F'
            'SALDOQTDCOTAS'#9'23'#9'Quantidade'#9'F'
            'SALDOVLRFUNDO'#9'18'#9'Saldo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDetDestino
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          IndicatorColor = icBlack
        end
        object pnlDestinoGeral: TPanel
          Left = 1
          Top = 25
          Width = 320
          Height = 202
          Align = alLeft
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object lblTipFndDestino: TLabel
            Left = 10
            Top = 5
            Width = 83
            Height = 13
            Caption = 'Tipo de Fundo'
          end
          object lbTipoCotaDest: TLabel
            Left = 10
            Top = 46
            Width = 74
            Height = 13
            Caption = 'Tipo de Cota'
          end
          object dblTipoFundoDestino: TwwDBLookupCombo
            Left = 10
            Top = 19
            Width = 250
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
            LookupTable = QryTipoFundoDestino
            LookupField = 'IDTIPOFUNDOINVEST'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblTipoFundoDestinoChange
            OnCloseUp = dblTipoFundoDestinoCloseUp
            OnExit = dblTipoFundoDestinoExit
          end
          object dblTipoCotaDest: TwwDBLookupCombo
            Left = 10
            Top = 60
            Width = 220
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
            LookupTable = QryTipoCotaDestino
            LookupField = 'IDTIPOCOTA'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblTipoCotaDestChange
            OnCloseUp = dblTipoCotaDestCloseUp
            OnExit = dblTipoCotaDestExit
          end
        end
        object pnlTitDestino: TPanel
          Left = 1
          Top = 1
          Width = 786
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Destino'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object pnlOrigem: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 153
        Align = alTop
        TabOrder = 0
        object dbgDetOrigem: TwwDBGrid
          Left = 321
          Top = 25
          Width = 466
          Height = 127
          Hint = 'Para transferência: Botão Direito ou Arraste e Solte'
          TabStop = False
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDetOrigem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          PopupMenu = mnuTransfFundosOrigem
          ShowHint = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object pnlDetalheFndOrigem: TPanel
          Left = 321
          Top = 25
          Width = 466
          Height = 127
          Align = alClient
          BevelOuter = bvLowered
          PopupMenu = mnuTransfFundosOrigem
          TabOrder = 2
          object lblDtAplicacaoOrigem: TLabel
            Left = 19
            Top = 5
            Width = 88
            Height = 13
            Caption = 'Data Aplicação'
            Enabled = False
          end
          object lblQtdOrigem: TLabel
            Left = 20
            Top = 49
            Width = 66
            Height = 13
            Caption = 'Quantidade'
            Enabled = False
          end
          object lblPreco: TLabel
            Left = 160
            Top = 5
            Width = 105
            Height = 13
            Caption = 'Cota da Aplicação'
            Enabled = False
          end
          object lblVlrApliOrigem: TLabel
            Left = 301
            Top = 5
            Width = 83
            Height = 13
            Caption = 'Valor Aplicado'
            Enabled = False
          end
          object lblLotePadrao: TLabel
            Left = 301
            Top = 49
            Width = 98
            Height = 13
            Caption = 'Valor Transferido'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSaldoOrigem: TLabel
            Left = 160
            Top = 49
            Width = 33
            Height = 13
            Caption = 'Saldo'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbDtaAplicacaoOrigem: TCMDateTimePicker
            Left = 19
            Top = 21
            Width = 128
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAAPLICACAO'
            DataSource = dsDetOrigem
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
            Enabled = False
            PopupMenu = mnuTransfFundosOrigem
            ShowButton = True
            TabOrder = 3
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtVlrTransfOrigem: TRealEdit
            Left = 301
            Top = 64
            Width = 134
            Height = 22
            Alignment = taRightJustify
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            PopupMenu = mnuTransfFundosOrigem
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object btnVoltarDetOrigem: TBitBtn
            Left = 228
            Top = 97
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Voltar'
            Enabled = False
            TabOrder = 2
            OnClick = btnVoltarDetOrigemClick
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
          object dbeQtdOrigem: TDBRealEdit
            Left = 20
            Top = 65
            Width = 126
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00000000')
            PopupMenu = mnuTransfFundosOrigem
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 8
            NumberFormat = fNumber
            Signal = False
            DataField = 'SALDOQTDCOTAS'
            DataSource = dsDetOrigem
          end
          object dbeCotaAplicOrigem: TDBRealEdit
            Left = 160
            Top = 21
            Width = 128
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,000000')
            PopupMenu = mnuTransfFundosOrigem
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRCOTAAPLICACAO'
            DataSource = dsDetOrigem
          end
          object dbeVlrAplicOrigem: TDBRealEdit
            Left = 301
            Top = 21
            Width = 135
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            PopupMenu = mnuTransfFundosOrigem
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRAPLICADO'
            DataSource = dsDetOrigem
          end
          object dbeSaldoOrigem: TDBRealEdit
            Left = 160
            Top = 65
            Width = 128
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            PopupMenu = mnuTransfFundosOrigem
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'SALDOVLRFUNDO'
            DataSource = dsDetOrigem
          end
          object BtOkTransf: TBitBtn
            Left = 134
            Top = 97
            Width = 85
            Height = 27
            Caption = '&OK'
            Default = True
            Enabled = False
            TabOrder = 1
            OnClick = BtOkTransfClick
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
        end
        object pnlTitOrigem: TPanel
          Left = 1
          Top = 1
          Width = 786
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Origem'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object pnlOrigemGeral: TPanel
          Left = 1
          Top = 25
          Width = 320
          Height = 127
          Align = alLeft
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object lblTipFndOrigem: TLabel
            Left = 10
            Top = 7
            Width = 83
            Height = 13
            Caption = 'Tipo de Fundo'
          end
          object lblFundoOrigem: TLabel
            Left = 10
            Top = 46
            Width = 130
            Height = 13
            Caption = 'Fundo de Investimento'
          end
          object lbTipoCotaOrig: TLabel
            Left = 10
            Top = 85
            Width = 74
            Height = 13
            Caption = 'Tipo de Cota'
          end
          object dblTipoFundoOrigem: TwwDBLookupCombo
            Left = 10
            Top = 21
            Width = 250
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
            LookupTable = QryTipoFundoOrigem
            LookupField = 'IDTIPOFUNDOINVEST'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblTipoFundoOrigemChange
            OnCloseUp = dblTipoFundoOrigemCloseUp
            OnExit = dblTipoFundoOrigemExit
          end
          object dblFundoOrigem: TwwDBLookupCombo
            Left = 10
            Top = 60
            Width = 303
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'50'#9'Descrição'#9'F')
            LookupTable = QryFundoOrigem
            LookupField = 'IDFUNDOINVEST'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblFundoOrigemChange
            OnCloseUp = dblFundoOrigemCloseUp
            OnExit = dblFundoOrigemExit
          end
          object dblTipoCotaOrig: TwwDBLookupCombo
            Left = 10
            Top = 99
            Width = 220
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
            LookupTable = QryTipoCotaOrigem
            LookupField = 'IDTIPOCOTA'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblTipoCotaOrigChange
            OnCloseUp = dblTipoCotaOrigCloseUp
            OnExit = dblTipoCotaOrigExit
          end
        end
      end
    end
    object pnlData: TPanel
      Left = 1
      Top = 40
      Width = 790
      Height = 33
      Align = alTop
      TabOrder = 0
      object lblDataTransf: TLabel
        Left = 22
        Top = 10
        Width = 128
        Height = 13
        Caption = 'Data de Transferência'
      end
      object dbDtaTransf: TCMDateTimePicker
        Left = 160
        Top = 6
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
        TabOrder = 0
        DisplayFormat = 'DD/MM/YYYY'
        OnEnter = dbDtaTransfEnter
        OnExit = dbDtaTransfExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 792
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 679
      inherited bbtnAjuda: TmaHelpBitBtn
        OnClick = bbtnAjudaClick
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 367
      DockPos = 426
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
        Caption = '&Confirmar'
        Enabled = False
        TabOrder = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 168
        Enabled = False
        TabOrder = 2
      end
      object bbtnTransferir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Transferir'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnTransferirClick
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
    end
    inline fraMens: TfraMensagem
      Width = 368
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 368
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 264
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 262
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 265
          Width = 102
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 100
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 748
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
    Left = 347
    Top = 6
  end
  inherited upd: TUpdateSQL
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
      '  QTDUSUFRUTO = :QTDUSUFRUTO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, IDFUNDOINVEST, '
      '   DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLROPERACAO, '
      'VLRCOTA, VLRIR, '
      '   VLRIOF, VLRRENDIMENTO, STACONFIRMA, IDOPERACAOORIGEM, '
      'IDPLANPREVCTBPATR, '
      '   DATACOTIZACAO, VLRDESCONTO, IDCOMPOSICAOFUNDO, '
      'STAESPECIFICADO, VLRCOLOCACAO, '
      '   VLRTAXAS, VLRCORRETAGEM, OBSERVACAO, PLANO, PLNCODIGO, '
      'CODDOCUMENTO, '
      
        '   IDOPERACAODIREITO, QTDUSUFRUTO, IDTIPOCOTA, IDCOTAINTEGRALIZA' +
        ')'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVEST, '
      '   :DATAOPERACAO, :DATALIQUIDACAO, :QTDOPERACAO, :VLROPERACAO, '
      ':VLRCOTA, '
      
        '   :VLRIR, :VLRIOF, :VLRRENDIMENTO, :STACONFIRMA, :IDOPERACAOORI' +
        'GEM, '
      ':IDPLANPREVCTBPATR, '
      '   :DATACOTIZACAO, :VLRDESCONTO, :IDCOMPOSICAOFUNDO, '
      ':STAESPECIFICADO, '
      
        '   :VLRCOLOCACAO, :VLRTAXAS, :VLRCORRETAGEM, :OBSERVACAO, :PLANO' +
        ', '
      ':PLNCODIGO, '
      
        '   :CODDOCUMENTO, :IDOPERACAODIREITO, :QTDUSUFRUTO, :IDTIPOCOTA,' +
        ' '
      ':IDCOTAINTEGRALIZA)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 307
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERACAODESTINO.DATAOPERACAO'
      'HISTFUNDO.DATAAPLICACAO'
      'FUNDODESTINO.DESCFUNDOINVEST'
      'TIPOFUNDODESTINO.DESCTIPOFUNDOINV'
      'OPERACAODESTINO.QTDOPERACAO'
      'OPERACAODESTINO.VLROPERACAO')
    TipodeDado.Strings = (
      'D'
      'D'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Operação'
      'Aplicação'
      'Fundo de Investimentos'
      'Tipo de Fundo(Destino)'
      'Quantidade'
      'Valor Transferido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNDOINVEST     FUNDODESTINO'
      'TIPOFUNDOINVEST TIPOFUNDODESTINO'
      'OPERACAOFUNDO   OPERACAODESTINO'
      'OPERACAOFUNDO   OPERACAOORIGEM'
      'HISTFUNDO')
    CamposChave.Strings = (
      'OPERACAODESTINO.IDOPERACAOORIGEM'
      'OPERACAODESTINO.DATAOPERACAO'
      'HISTFUNDO.DATAAPLICACAO'
      'OPERACAODESTINO.IDTIPOINVEST')
    Filtro.Strings = (
      'OPERACAODESTINO.IDTIPOOPERACAO     = -161'
      
        'FUNDODESTINO.IDFUNDOINVEST         = OPERACAODESTINO.IDFUNDOINVE' +
        'ST'
      
        'TIPOFUNDODESTINO.IDTIPOFUNDOINVEST = FUNDODESTINO.IDTIPOFUNDOINV' +
        'EST'
      
        'OPERACAOORIGEM.IDOPERACAOFUNDO     = OPERACAODESTINO.IDOPERACAOO' +
        'RIGEM'
      
        'HISTFUNDO.IDTIPOINVEST             = OPERACAODESTINO.IDTIPOINVES' +
        'T'
      
        'HISTFUNDO.IDPLANPREVCTBPATR        = OPERACAODESTINO.IDPLANPREVC' +
        'TBPATR'
      
        'HISTFUNDO.IDFUNDOINVEST            = OPERACAODESTINO.IDFUNDOINVE' +
        'ST'
      
        'HISTFUNDO.DATAMOVFUNDO             = OPERACAODESTINO.DATAOPERACA' +
        'O'
      
        'HISTFUNDO.IDOPERACAOFUNDO          = OPERACAODESTINO.IDOPERACAOF' +
        'UNDO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,###,##0.000000000000'
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '10'
      '40'
      '25'
      '22'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
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
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 395
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 452
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
      84000000FF0000008400000084000000000084848400FFFFFF0000FFFF0000FF
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
      FF00000000000000000000000000000000000000840000008400000084000000
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
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
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
    OnFind = CmeCadastroFind
    Left = 517
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOFUNDO'
      'WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO')
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryTipoOperTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO, FLGGE' +
        'RACONTAB, FLGGERACAPCAR'
      'FROM   TIPOOPERACAO'
      'WHERE  IDTIPOINVEST   = :IDTIPOINVEST   AND'
      '       IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 550
    Top = 398
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryTipoFundoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (:IDTIPOFUNDOINVEST' +
        ' = IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL))   AND'
      
        '      (((:IDTIPOINVEST <> 0) AND (:IDTIPOINVEST = IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 249
    Top = 147
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
    object QryTipoFundoOrigemDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoOrigemIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoOrigemIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoOrigemDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
  end
  object QryFundoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCFUNDOINVEST,'
      '   IDFUNDOINVEST,'
      '   IDTIPOFUNDOINVEST,'
      '   DTAINIPROC,'
      '   QTDDECVALOR,'
      '   IDGESTORCARTEIRA,'
      '   IDCARTEIRAINVEST'
      'FROM HISTFUNDOINVEST'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT FUN.IDFUNDOINVEST || TO_CHAR(MAX(FUN.DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      '       WHERE'
      '           (TFI.IDTIPOINVEST = :IDTIPOINVEST)    AND'
      ''
      '            (((:IDFUNDOINVEST IS NOT NULL)       AND'
      '           (FUN.IDFUNDOINVEST = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL) )         AND'
      ''
      
        '           (TRUNC(FUN.DTAVIGENCIA) < TO_DATE(:DATAMOVFUNDO,'#39'DD/M' +
        'M/YYYY'#39')+1) AND'
      ''
      '           (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      '       GROUP BY IDFUNDOINVEST)) AND'
      ''
      '   (((:IDTIPOFUNDOINVEST IS NOT NULL)   AND'
      '      (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '     (:IDTIPOFUNDOINVEST IS NULL) )'
      'ORDER BY DESCFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        ParamType = ptInput
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
    object QryFundoOrigemDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoOrigemIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QryFundoOrigemIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
    object QryFundoOrigemDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
    object QryFundoOrigemQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
    end
    object QryFundoOrigemIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
    end
    object QryFundoOrigemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
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
      '    (IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      '    (DATACOTA  = :DATACOTA)          AND'
      '  ((:IDTIPOCOTA IS NULL) OR (IDTIPOCOTA =:IDTIPOCOTA)) ')
    ValidateWithMask = True
    Left = 546
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryCotaFundoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
  end
  object qryDetOrigem: TwwQuery
    AfterScroll = qryDetOrigemAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H1.IDTIPOINVEST, H1.DATAULTPGTOIR, H1.IDCARTEIRAINVEST,'
      
        '       H1.IDFUNDOINVEST, H1.DATAAPLICACAO, H1.DATAMOVFUNDO, H1.C' +
        'OTAAPLICACAO AS VLRCOTAAPLICACAO,'
      '       DECODE(NVL(H1.VLRAPLICADO,0),0, '
      
        '             ROUND(H1.SALDOQTDCOTAS*(SELECT CF.VLRCOTA FROM COTA' +
        'FUNDO CF  WHERE '
      
        '                                    (CF.IDFUNDOINVEST = H1.IDFUN' +
        'DOINVEST) AND'
      
        '                                    (CF.DATACOTA = H1.DATAAPLICA' +
        'CAO)),2), H1.VLRAPLICADO) AS VLRAPLICADO,'
      '       H1.SALDOVLRFUNDO, H1.IDPLANPREVCTBPATR, H1.SALDOQTDCOTAS,'
      
        '       H1.VLRIRPROV, H1.VLRIOFPROV, H1.VLRVARIACAO, H1.IDOPERACA' +
        'OFUNDO, H1.IDTIPOCOTA, TC.DESCTIPOCOTA'
      'FROM   HISTFUNDO H1, TIPOCOTA TC'
      'WHERE  H1.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO)'
      '                          FROM HISTFUNDO'
      
        '                          WHERE (IDTIPOINVEST      = :IDTIPOINVE' +
        'ST)       AND'
      
        '                                (IDPLANPREVCTBPATR = :IDPLANPREV' +
        'CTBPATR)  AND'
      
        '                                (IDFUNDOINVEST     = :IDFUNDOINV' +
        'EST)      AND'
      
        '                                (DATAAPLICACAO    <= :DATAMOVFUN' +
        'DO)       AND'
      
        '                                (DATAMOVFUNDO      = :DATAMOVFUN' +
        'DO)'
      
        '                          GROUP BY IDTIPOINVEST, IDPLANPREVCTBPA' +
        'TR, IDFUNDOINVEST, DATAAPLICACAO, IDTIPOCOTA) AND'
      '      (H1.SALDOQTDCOTAS > 0)                 AND'
      '         (H1.IDTIPOCOTA    = TC.IDTIPOCOTA(+))'
      'ORDER BY DATAAPLICACAO DESC '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 655
    Top = 313
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
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object qryDetOrigemDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetOrigemVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 18
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetOrigemSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 23
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object qryDetOrigemSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 18
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '##,###,###,###,##0.00'
    end
    object qryDetOrigemIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetOrigemIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDetOrigemIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetOrigemDATAMOVFUNDO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMOVFUNDO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetOrigemDATAULTPGTOIR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTPGTOIR'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetOrigemVLRCOTAAPLICACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCOTAAPLICACAO'
      Visible = False
      DisplayFormat = '##,###,##0.00'
    end
    object qryDetOrigemIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetOrigemVLRIRPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIRPROV'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetOrigemVLRIOFPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIOFPROV'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetOrigemVLRVARIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetOrigemIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetOrigemIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object qryDetOrigemDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
  end
  object dsDetOrigem: TDataSource
    AutoEdit = False
    DataSet = qryDetOrigem
    OnStateChange = dsDetOrigemStateChange
    Left = 731
    Top = 313
  end
  object mnuTransfFundosOrigem: TPopupMenu
    Left = 625
    Top = 7
    object mnuTrfFndParcial: TMenuItem
      Caption = 'Parcial'
    end
    object mnuTrfFndTotal: TMenuItem
      Caption = 'Total'
      OnClick = mnuTrfFndTotalClick
    end
  end
  object qryDetDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H1.IDTIPOINVEST, H1.DATAULTPGTOIR, H1.IDCARTEIRAINVEST,'
      
        '       H1.IDFUNDOINVEST, H1.DATAAPLICACAO, H1.DATAMOVFUNDO, H1.C' +
        'OTAAPLICACAO AS VLRCOTAAPLICACAO,'
      '       DECODE(NVL(H1.VLRAPLICADO,0),0, '
      
        '             ROUND(H1.SALDOQTDCOTAS*(SELECT CF.VLRCOTA FROM COTA' +
        'FUNDO CF  WHERE '
      
        '                                    (CF.IDFUNDOINVEST = H1.IDFUN' +
        'DOINVEST) AND'
      
        '                                    (CF.DATACOTA = H1.DATAAPLICA' +
        'CAO)),2), H1.VLRAPLICADO) AS VLRAPLICADO,'
      '       H1.SALDOVLRFUNDO, H1.IDPLANPREVCTBPATR, H1.SALDOQTDCOTAS,'
      
        '       H1.VLRIRPROV, H1.VLRIOFPROV, H1.VLRVARIACAO, H1.IDOPERACA' +
        'OFUNDO, H1.IDTIPOCOTA, TC.DESCTIPOCOTA'
      'FROM   HISTFUNDO H1, TIPOCOTA TC'
      'WHERE  H1.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO)'
      '                          FROM HISTFUNDO'
      
        '                          WHERE (IDTIPOINVEST      = :IDTIPOINVE' +
        'ST)       AND'
      
        '                                (IDPLANPREVCTBPATR = :IDPLANPREV' +
        'CTBPATR)  AND'
      
        '                                (IDFUNDOINVEST     = :IDFUNDOINV' +
        'EST)      AND'
      
        '                                (DATAAPLICACAO    <= :DATAMOVFUN' +
        'DO)       AND'
      
        '                                (DATAMOVFUNDO      = :DATAMOVFUN' +
        'DO)'
      
        '                          GROUP BY IDTIPOINVEST, IDPLANPREVCTBPA' +
        'TR, IDFUNDOINVEST, DATAAPLICACAO, IDTIPOCOTA) AND'
      '      (H1.SALDOQTDCOTAS > 0)                AND'
      '         (H1.IDTIPOCOTA    = TC.IDTIPOCOTA(+))'
      'ORDER BY DATAAPLICACAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 655
    Top = 377
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
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object qryDetDestinoDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetDestinoVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 18
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetDestinoSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 23
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object qryDetDestinoSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 18
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '##,###,###,###,##0.00'
    end
    object qryDetDestinoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetDestinoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDetDestinoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetDestinoDATAMOVFUNDO: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetDestinoDATAULTPGTOIR: TDateTimeField
      FieldName = 'DATAULTPGTOIR'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetDestinoVLRCOTAAPLICACAO: TFloatField
      FieldName = 'VLRCOTAAPLICACAO'
      Visible = False
      DisplayFormat = '##,###,##0.00'
    end
    object qryDetDestinoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetDestinoVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetDestinoVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetDestinoVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetDestinoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object qryDetDestinoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object qryDetDestinoDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
  end
  object dsDetDestino: TDataSource
    AutoEdit = False
    DataSet = qryDetDestino
    Left = 731
    Top = 377
  end
  object qryExcluiIRLitigio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE '
      'FROM IRLITIGIO '
      'WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 546
    Top = 454
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
        Value = Null
      end>
  end
  object QryTipoFundoDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST IS NOT NULL) AND (:IDTIPOINVEST <> IDTIPO' +
        'INVEST)) OR'
      '        (:IDTIPOINVEST IS NULL))'
      'ORDER BY DESCTIPOFUNDOINV'
      '')
    ValidateWithMask = True
    Left = 226
    Top = 371
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
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoFundoDestinoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoDestinoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoDestinoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoDestinoDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 546
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoCotaDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'WHERE ((:IDTIPOCOTA IS NULL) OR (IDTIPOCOTA =:IDTIPOCOTA))'
      'ORDER BY DESCTIPOCOTA')
    ValidateWithMask = True
    Left = 233
    Top = 427
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryTipoCotaDestinoDESCTIPOCOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object QryTipoCotaDestinoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object QryTipoCotaOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'WHERE ((:IDTIPOCOTA IS NULL) OR (IDTIPOCOTA =:IDTIPOCOTA))'
      'ORDER BY DESCTIPOCOTA'
      ' ')
    ValidateWithMask = True
    Left = 249
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryTipoCotaOrigemDESCTIPOCOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object QryTipoCotaOrigemIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object qryOperacaoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsDetOrigem
    SQL.Strings = (
      'SELECT * FROM OPERACAOFUNDO'
      'WHERE '
      '       (IDOPERACAOORIGEM = :IDOPERACAOFUNDO)')
    UpdateObject = updOperacaoFundo
    ValidateWithMask = True
    Left = 320
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object dsOperacaoFundo: TwwDataSource
    AutoEdit = False
    DataSet = qryOperacaoFundo
    Left = 384
    Top = 72
  end
  object updOperacaoFundo: TUpdateSQL
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
      '  QTDUSUFRUTO = :QTDUSUFRUTO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA,'
      '  IDLOTE = :IDLOTE'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO'
      ' ')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO,'
      'IDTIPOINVEST,'
      '   IDTIPOOPERACAO, IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO,'
      'QTDOPERACAO,'
      '   VLROPERACAO, VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO,'
      'STACONFIRMA,'
      '   IDOPERACAOORIGEM, IDPLANPREVCTBPATR, DATACOTIZACAO,'
      'VLRDESCONTO,'
      '   IDCOMPOSICAOFUNDO, STAESPECIFICADO,  VLRCOLOCACAO, VLRTAXAS,'
      'VLRCORRETAGEM,'
      '   OBSERVACAO, PLANO, PLNCODIGO, CODDOCUMENTO,'
      'IDOPERACAODIREITO,'
      '   QTDUSUFRUTO, IDTIPOCOTA, IDCOTAINTEGRALIZA, IDLOTE)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO,'
      ':IDTIPOINVEST,'
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO,'
      ':QTDOPERACAO,'
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO,'
      ':STACONFIRMA,'
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :DATACOTIZACAO,'
      ':VLRDESCONTO,'
      
        '   :IDCOMPOSICAOFUNDO, :STAESPECIFICADO, :VLRCOLOCACAO, :VLRTAXA' +
        'S,'
      ':VLRCORRETAGEM,'
      '   :OBSERVACAO, :PLANO, :PLNCODIGO, :CODDOCUMENTO,'
      ':IDOPERACAODIREITO,'
      '   :QTDUSUFRUTO, :IDTIPOCOTA, :IDCOTAINTEGRALIZA, :IDLOTE) ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 444
    Top = 72
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 706
    Top = 446
  end
  object QryHistCotaOrigem: TwwQuery
    AfterScroll = qryDetOrigemAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H1.IDTIPOCOTA, H1.IDFUNDOINVEST, H1.IDTIPOINVEST, H1.PLNC' +
        'ODIGO, H1.IDCOTAINTEGRALIZA, '
      
        '       H1.IDPLANPREVCTBPATR, H1.DATAHISTCOTAINTEG, H1.VLRCOTAINT' +
        'EGR, H1.VLRHISTCOTAINTEGR, '
      
        '       H1.QTDHISTCOTAINTEGR, H1.VLRVARIACAODIA, H1.TRGDTINCLUSAO' +
        ', H1.TRGUSERINCLUSAO, '
      
        '       H1.PLANO, H1.TIPMOVCOTAINTEGR, H1.QTDMOVCOTAINTEGR, H1.ID' +
        'OPERACAOFUNDO, '
      '       H1.DATAAPLICACAO, TC.DESCTIPOCOTA'
      'FROM   HISTCOTAINTEGRALIZA H1, TIPOCOTA TC'
      'WHERE  H1.IDHISTCOTAINTEGR IN (SELECT MAX(IDHISTCOTAINTEGR)'
      '                          FROM HISTCOTAINTEGRALIZA'
      
        '                          WHERE (IDTIPOINVEST      = :IDTIPOINVE' +
        'ST)       AND'
      
        '                                (IDPLANPREVCTBPATR = :IDPLANPREV' +
        'CTBPATR)  AND'
      
        '                                (IDFUNDOINVEST     = :IDFUNDOINV' +
        'EST)      AND'
      
        '                                (DATAAPLICACAO    <= :DATATRANS)' +
        '       AND'
      '                                (DATAHISTCOTAINTEG = :DATATRANS)'
      
        '                          GROUP BY IDTIPOINVEST, IDPLANPREVCTBPA' +
        'TR, IDFUNDOINVEST, DATAAPLICACAO, IDTIPOCOTA) '
      'AND (H1.VLRCOTAINTEGR > 0)'
      'AND  (H1.IDTIPOCOTA    = TC.IDTIPOCOTA(+))'
      'ORDER BY DATAAPLICACAO DESC')
    ValidateWithMask = True
    Left = 415
    Top = 345
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
        DataType = ftString
        Name = 'DATATRANS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATATRANS'
        ParamType = ptUnknown
      end>
    object QryHistCotaOrigemIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
    object QryHistCotaOrigemIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QryHistCotaOrigemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryHistCotaOrigemPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object QryHistCotaOrigemIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
    end
    object QryHistCotaOrigemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryHistCotaOrigemDATAHISTCOTAINTEG: TDateTimeField
      FieldName = 'DATAHISTCOTAINTEG'
    end
    object QryHistCotaOrigemVLRCOTAINTEGR: TFloatField
      FieldName = 'VLRCOTAINTEGR'
    end
    object QryHistCotaOrigemVLRHISTCOTAINTEGR: TFloatField
      FieldName = 'VLRHISTCOTAINTEGR'
    end
    object QryHistCotaOrigemQTDHISTCOTAINTEGR: TFloatField
      FieldName = 'QTDHISTCOTAINTEGR'
    end
    object QryHistCotaOrigemVLRVARIACAODIA: TFloatField
      FieldName = 'VLRVARIACAODIA'
    end
    object QryHistCotaOrigemTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object QryHistCotaOrigemTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object QryHistCotaOrigemPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object QryHistCotaOrigemTIPMOVCOTAINTEGR: TStringField
      FieldName = 'TIPMOVCOTAINTEGR'
      FixedChar = True
      Size = 3
    end
    object QryHistCotaOrigemQTDMOVCOTAINTEGR: TFloatField
      FieldName = 'QTDMOVCOTAINTEGR'
    end
    object QryHistCotaOrigemIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object QryHistCotaOrigemDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object QryHistCotaOrigemDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
  end
  object QryHistCotaDestino: TwwQuery
    AfterScroll = qryDetOrigemAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H1.IDTIPOCOTA, H1.IDFUNDOINVEST, H1.IDTIPOINVEST, H1.PLNC' +
        'ODIGO, H1.IDCOTAINTEGRALIZA, '
      
        '       H1.IDPLANPREVCTBPATR, H1.DATAHISTCOTAINTEG, H1.VLRCOTAINT' +
        'EGR, H1.VLRHISTCOTAINTEGR, '
      
        '       H1.QTDHISTCOTAINTEGR, H1.VLRVARIACAODIA, H1.TRGDTINCLUSAO' +
        ', H1.TRGUSERINCLUSAO, '
      
        '       H1.PLANO, H1.TIPMOVCOTAINTEGR, H1.QTDMOVCOTAINTEGR, H1.ID' +
        'OPERACAOFUNDO, '
      '       H1.DATAAPLICACAO, TC.DESCTIPOCOTA'
      'FROM   HISTCOTAINTEGRALIZA H1, TIPOCOTA TC'
      'WHERE  H1.IDHISTCOTAINTEGR IN (SELECT MAX(IDHISTCOTAINTEGR)'
      '                          FROM HISTCOTAINTEGRALIZA'
      
        '                          WHERE (IDTIPOINVEST      = :IDTIPOINVE' +
        'ST)       AND'
      
        '                                (IDPLANPREVCTBPATR = :IDPLANPREV' +
        'CTBPATR)  AND'
      
        '                                (IDFUNDOINVEST     = :IDFUNDOINV' +
        'EST)      AND'
      
        '                                (DATAAPLICACAO    <= :DATATRANS)' +
        '       AND'
      '                                (DATAHISTCOTAINTEG = :DATATRANS)'
      
        '                          GROUP BY IDTIPOINVEST, IDPLANPREVCTBPA' +
        'TR, IDFUNDOINVEST, DATAAPLICACAO, IDTIPOCOTA) '
      'AND  (H1.IDTIPOCOTA    = TC.IDTIPOCOTA(+))'
      'ORDER BY DATAAPLICACAO DESC')
    ValidateWithMask = True
    Left = 407
    Top = 417
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
        DataType = ftString
        Name = 'DATATRANS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATATRANS'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDTIPOCOTA'
    end
    object FloatField2: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object FloatField3: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object FloatField4: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object FloatField5: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
    end
    object FloatField6: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAHISTCOTAINTEG'
    end
    object FloatField7: TFloatField
      FieldName = 'VLRCOTAINTEGR'
    end
    object FloatField8: TFloatField
      FieldName = 'VLRHISTCOTAINTEGR'
    end
    object FloatField9: TFloatField
      FieldName = 'QTDHISTCOTAINTEGR'
    end
    object FloatField10: TFloatField
      FieldName = 'VLRVARIACAODIA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object StringField1: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object FloatField11: TFloatField
      FieldName = 'PLANO'
    end
    object StringField2: TStringField
      FieldName = 'TIPMOVCOTAINTEGR'
      FixedChar = True
      Size = 3
    end
    object FloatField12: TFloatField
      FieldName = 'QTDMOVCOTAINTEGR'
    end
    object FloatField13: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object StringField3: TStringField
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
  end
  object QryHistAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 346
    Top = 370
  end
end
