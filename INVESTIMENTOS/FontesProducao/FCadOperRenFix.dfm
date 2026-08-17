inherited frmCadOperRenFix: TfrmCadOperRenFix
  Left = 131
  Top = 144
  HelpContext = 790252
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Operação'
  ClientHeight = 512
  ClientWidth = 796
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 796
    Height = 426
    inherited Bevel2: TBevel
      Width = 794
    end
    inherited pnlTitulo: TPanel
      Width = 794
      TabOrder = 2
      inherited lbNomItem: TfcLabel
        Width = 260
        Caption = 'Operações de Renda Fixa'
      end
      object lblSaldos: TLabel
        Left = 528
        Top = 14
        Width = 43
        Height = 13
        Caption = 'Saldos:'
        OnClick = bbtnCancelarClick
      end
      object lblSldQtdTit: TLabel
        Left = 584
        Top = 5
        Width = 70
        Height = 13
        Caption = 'Quantidade:'
      end
      object lblSldVlrTit: TLabel
        Left = 584
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Valor:'
      end
      object lblSldQtd: TLabel
        Left = 740
        Top = 5
        Width = 8
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object lblSldVlr: TLabel
        Left = 740
        Top = 24
        Width = 8
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
    end
    object pnlFundoCurvas: TPanel
      Left = 1
      Top = 261
      Width = 794
      Height = 164
      Align = alClient
      TabOrder = 1
      object Bevel1: TBevel
        Left = 1
        Top = 1
        Width = 792
        Height = 3
        Align = alTop
        Shape = bsBottomLine
      end
      object pnlCurvasFundo: TPanel
        Left = 1
        Top = 33
        Width = 792
        Height = 130
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object pnlCurvasDet: TPanel
          Left = 518
          Top = 2
          Width = 272
          Height = 126
          Align = alRight
          TabOrder = 1
          Visible = False
          object lblPercentual: TLabel
            Left = 150
            Top = 42
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object lblPercItem: TLabel
            Left = 236
            Top = 62
            Width = 10
            Height = 13
            Caption = '%'
          end
          object pnlMoeda: TPanel
            Left = 5
            Top = 36
            Width = 145
            Height = 48
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 6
              Top = 7
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object dblkMoeda: TwwDBLookupCombo
              Left = 6
              Top = 23
              Width = 128
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Moeda'#9'F')
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object pnlVlrTv: TPanel
            Left = 1
            Top = 32
            Width = 145
            Height = 48
            BevelOuter = bvNone
            TabOrder = 3
            object lblVlrItem: TLabel
              Left = 11
              Top = 12
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbrValor: TDBRealEdit
              Left = 10
              Top = 27
              Width = 128
              Height = 20
              Alignment = taRightJustify
              Lines.Strings = (
                '    100,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 6
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'JUROSRENFIX'
            end
          end
          object dbrPercentual: TDBRealEdit
            Left = 151
            Top = 58
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '    100,00')
            TabOrder = 1
            WordWrap = False
            OnKeyDown = dbrPercentualKeyDown
            IntDigits = 6
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'JUROSRENFIX'
          end
          object Dock977: TDock97
            Left = 1
            Top = 1
            Width = 270
            Height = 29
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar974: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnOkDet: TSpeedButton
                Left = 0
                Top = 0
                Width = 46
                Height = 23
                Hint = 'Inserir novo registro|'
                AllowAllUp = True
                GroupIndex = 1
                Caption = 'Ok'
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
                ParentShowHint = False
                ShowHint = True
                Spacing = 0
                OnClick = BtIncDetClick
              end
            end
            object pnlChkMoeda: TPanel
              Left = 49
              Top = 0
              Width = 219
              Height = 27
              Align = alClient
              TabOrder = 1
              object chkMoeda: TCheckBox
                Left = 25
                Top = 6
                Width = 177
                Height = 17
                Caption = 'Moedas do Investimento'
                TabOrder = 0
                OnClick = chkMoedaClick
              end
            end
          end
        end
        object trvCurvas: TTreeView
          Left = 2
          Top = 2
          Width = 516
          Height = 126
          Align = alClient
          Images = imgCurvas
          Indent = 19
          ReadOnly = True
          TabOrder = 0
          OnChange = trvCurvasChange
        end
      end
      object pnlTituloCurvas: TPanel
        Left = 1
        Top = 4
        Width = 792
        Height = 29
        Align = alTop
        Caption = 'Perfil'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlMestre: TPanel
      Left = 1
      Top = 45
      Width = 794
      Height = 216
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object pgMestre: TPageControl
        Left = 1
        Top = 1
        Width = 792
        Height = 214
        ActivePage = tbCombos
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object tbCombos: TTabSheet
          Caption = 'Dados'
          object pnlValores: TPanel
            Left = 0
            Top = 153
            Width = 767
            Height = 51
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object pnlPUEmissao: TPanel
              Left = 625
              Top = 2
              Width = 115
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 6
              object Label7: TLabel
                Left = 7
                Top = 6
                Width = 68
                Height = 13
                Caption = 'PU Emissão'
              end
              object dbePUEmissao: TDBRealEdit
                Tag = -3
                Left = 5
                Top = 21
                Width = 110
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,000000000')
                TabOrder = 0
                WordWrap = False
                IntDigits = 12
                DecDigits = 9
                NumberFormat = fNumber
                Signal = False
                DataField = 'PUEMISSAO'
                DataSource = ds
              end
            end
            object pnlDataEmissao: TPanel
              Left = 527
              Top = 2
              Width = 98
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 5
              object Label8: TLabel
                Left = 10
                Top = 6
                Width = 64
                Height = 13
                Caption = 'Dt Emissão'
              end
              object dbdDtaEmissao: TCMDateTimePicker
                Left = 9
                Top = 21
                Width = 89
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAEMISSAO'
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
                TabOrder = 0
                OnExit = dbdDtaEmissaoExit
              end
            end
            object pnlPUOperacao: TPanel
              Left = 413
              Top = 2
              Width = 114
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 4
              object Label17: TLabel
                Left = 5
                Top = 6
                Width = 77
                Height = 13
                Caption = 'PU Operação'
              end
              object dbePuOperacao: TDBRealEdit
                Tag = -4
                Left = 4
                Top = 21
                Width = 110
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,000000000')
                TabOrder = 0
                WordWrap = False
                OnExit = dbePuOperacaoExit
                IntDigits = 12
                DecDigits = 9
                NumberFormat = fNumber
                Signal = True
                DataField = 'PUOPERACAO'
                DataSource = ds
              end
            end
            object pnlQuantidade: TPanel
              Left = 304
              Top = 2
              Width = 109
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 3
              object Label5: TLabel
                Left = 3
                Top = 6
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object dbrQtdeOperacao: TDBRealEdit
                Tag = -2
                Left = 3
                Top = 21
                Width = 106
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,000000000')
                TabOrder = 0
                WordWrap = False
                OnExit = dbrQtdeOperacaoExit
                IntDigits = 10
                DecDigits = 9
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEOPERACAO'
                DataSource = ds
              end
            end
            object pnlValor: TPanel
              Left = 193
              Top = 2
              Width = 111
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
              object Label16: TLabel
                Left = 8
                Top = 6
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object dbrVlrOperacao: TDBRealEdit
                Tag = -1
                Left = 5
                Top = 21
                Width = 106
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                OnExit = dbrVlrOperacaoExit
                IntDigits = 15
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
                DataField = 'VLROPERACAO'
                DataSource = ds
              end
            end
            object pnlDataVencimento: TPanel
              Left = 97
              Top = 2
              Width = 96
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object Label4: TLabel
                Left = 9
                Top = 6
                Width = 67
                Height = 13
                Caption = 'Vencimento'
              end
              object dbdDtaVencimento: TCMDateTimePicker
                Left = 7
                Top = 21
                Width = 89
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'VENCOPERACAO'
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
                TabOrder = 0
              end
            end
            object pnlDataOperacao: TPanel
              Left = 2
              Top = 2
              Width = 95
              Height = 47
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Label2: TLabel
                Left = 8
                Top = 6
                Width = 73
                Height = 13
                Caption = 'Dt Operação'
              end
              object dbdDataOperacao: TCMDateTimePicker
                Left = 6
                Top = 21
                Width = 89
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAOPERACAO'
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
                TabOrder = 0
                OnExit = dbdDataOperacaoExit
              end
            end
          end
          object pnlCombos: TPanel
            Left = 0
            Top = 0
            Width = 767
            Height = 153
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object lblInvestimento: TLabel
              Left = 382
              Top = 4
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object lblEmissor: TLabel
              Left = 10
              Top = 4
              Width = 44
              Height = 13
              Caption = 'Emissor'
            end
            object lblOperacao: TLabel
              Left = 10
              Top = 40
              Width = 56
              Height = 13
              Caption = 'Operação'
            end
            object lblCarteira: TLabel
              Left = 382
              Top = 41
              Width = 49
              Height = 13
              Caption = 'Carteira '
            end
            object lblCustodiante: TLabel
              Left = 382
              Top = 78
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object lblForCli: TLabel
              Left = 10
              Top = 77
              Width = 72
              Height = 13
              Caption = 'Contra Parte'
            end
            object Label9: TLabel
              Left = 10
              Top = 112
              Width = 68
              Height = 13
              Caption = 'Autorização'
            end
            object Label3: TLabel
              Left = 382
              Top = 112
              Width = 130
              Height = 13
              Caption = 'Classificação de Risco'
            end
            object dblkClasseRisco: TwwDBLookupCombo
              Left = 382
              Top = 126
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMECLASSRISCO'#9'30'#9'Nome da Classe de Risco'#9'F')
              DataField = 'IDCLASSRISCORENFIX'
              DataSource = ds
              LookupTable = qryCasseRisco
              LookupField = 'IDCLASSRISCORENFIX'
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblkClasseRiscoExit
            end
            object dblkOperacao: TwwDBLookupCombo
              Left = 10
              Top = 54
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = ds
              LookupTable = qryTipoOperacao
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkInvestimento: TwwDBLookupCombo
              Left = 382
              Top = 18
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = ds
              LookupTable = qryInvestimento
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblkInvestimentoCloseUp
            end
            object dblkEmissor: TwwDBLookupCombo
              Left = 10
              Top = 18
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SIGLAEMISSOR'#9'40'#9'Emissor'#9'F')
              LookupTable = qryEmissor
              LookupField = 'IDEMISSOR'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblkEmissorCloseUp
              OnExit = dblkEmissorExit
            end
            object dblkCustodiante: TwwDBLookupCombo
              Left = 382
              Top = 90
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'60'#9'Custodiante'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = ds
              LookupTable = qryCustodiante
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkCarteira: TwwDBLookupCombo
              Left = 382
              Top = 54
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
              DataField = 'IDCARTEIRAINVEST'
              DataSource = ds
              LookupTable = qryCarteira
              LookupField = 'IDCARTEIRAINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkAutorizacao: TwwDBLookupCombo
              Left = 10
              Top = 126
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
              DataField = 'IDUSUARIO'
              DataSource = ds
              LookupTable = qryAutorizacao
              LookupField = 'IDUSUARIO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkForCli: TwwDBLookupCombo
              Left = 10
              Top = 90
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Contra Parte'#9'F')
              DataField = 'IDFORCLI'
              DataSource = ds
              LookupTable = qryContraParte
              LookupField = 'IDPESSOA'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
        object tbObs: TTabSheet
          Caption = 'Observação'
          ImageIndex = 1
          object pnlObsBt: TPanel
            Left = 0
            Top = 0
            Width = 767
            Height = 204
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object pnlObs: TPanel
              Left = 1
              Top = 1
              Width = 765
              Height = 202
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvNone
              TabOrder = 0
              object dbRtObs: TwwDBRichEdit
                Left = 1
                Top = 81
                Width = 763
                Height = 120
                TabStop = False
                Align = alClient
                AutoURLDetect = False
                DataField = 'OBSERVACAO'
                DataSource = ds
                PrintJobName = 'Delphi 5'
                TabOrder = 1
                EditorCaption = 'Edit Rich Text'
                EditorPosition.Left = 0
                EditorPosition.Top = 0
                EditorPosition.Width = 0
                EditorPosition.Height = 0
                MeasurementUnits = muInches
                PrintMargins.Top = 1
                PrintMargins.Bottom = 1
                PrintMargins.Left = 1
                PrintMargins.Right = 1
                RichEditVersion = 2
                Data = {
                  660000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
                  66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
                  696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
                  5C7061720D0A7D0D0A00}
              end
              object pnlDetObs: TPanel
                Left = 1
                Top = 1
                Width = 763
                Height = 80
                Align = alTop
                TabOrder = 0
                object lblDtLeilao: TLabel
                  Left = 102
                  Top = 8
                  Width = 52
                  Height = 13
                  Caption = 'Dt Leilão'
                end
                object lblCorretagem: TLabel
                  Left = 196
                  Top = 8
                  Width = 65
                  Height = 13
                  Caption = 'Corretagem'
                end
                object lblEmolumento: TLabel
                  Left = 308
                  Top = 8
                  Width = 75
                  Height = 13
                  Caption = 'Emolumentos'
                end
                object lblBoleta: TLabel
                  Left = 553
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Boleta'
                end
                object lblPuMercado: TLabel
                  Left = 421
                  Top = 8
                  Width = 71
                  Height = 13
                  Caption = 'PU Mercado'
                end
                object lblDtLiquidacao: TLabel
                  Left = 7
                  Top = 8
                  Width = 80
                  Height = 13
                  Caption = 'Dt Liquidação'
                end
                object pnlQtdHipo: TPanel
                  Left = 378
                  Top = 49
                  Width = 223
                  Height = 28
                  BevelOuter = bvNone
                  TabOrder = 8
                  Visible = False
                  object Label6: TLabel
                    Left = 14
                    Top = 8
                    Width = 70
                    Height = 13
                    Caption = 'Quantidade:'
                  end
                  object dbrQtdCartHipo: TDBRealEdit
                    Left = 88
                    Top = 4
                    Width = 128
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,000000000')
                    TabOrder = 0
                    WordWrap = False
                    OnExit = dbrQtdeOperacaoExit
                    IntDigits = 10
                    DecDigits = 9
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'QTDCARTHIPO'
                    DataSource = ds
                  end
                end
                object dbdDtaLeilao: TCMDateTimePicker
                  Left = 102
                  Top = 23
                  Width = 89
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALEILAO'
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
                object chkFlgCartHipo: TDBCheckBox
                  Left = 238
                  Top = 56
                  Width = 139
                  Height = 17
                  Caption = 'Carteira Hipotecária'
                  DataField = 'FLGCARTHIPO'
                  DataSource = ds
                  TabOrder = 7
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnClick = chkFlgCartHipoClick
                end
                object chkFlgNegociacao: TDBCheckBox
                  Left = 8
                  Top = 56
                  Width = 193
                  Height = 17
                  Caption = 'Investimento para Negociação'
                  DataField = 'FLGNEGOCIACAO'
                  DataSource = ds
                  TabOrder = 6
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbreCorretagem: TDBRealEdit
                  Tag = -13
                  Left = 196
                  Top = 23
                  Width = 106
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 2
                  WordWrap = False
                  OnExit = dbrVlrOperacaoExit
                  IntDigits = 15
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'TXOPERACIONAL'
                  DataSource = ds
                end
                object dbreEmolumentos: TDBRealEdit
                  Tag = -12
                  Left = 308
                  Top = 23
                  Width = 106
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 3
                  WordWrap = False
                  OnExit = dbrVlrOperacaoExit
                  IntDigits = 15
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'TXBOLSA'
                  DataSource = ds
                end
                object dbeBoleta: TwwDBEdit
                  Left = 553
                  Top = 23
                  Width = 121
                  Height = 21
                  DataField = 'BOLETA'
                  DataSource = ds
                  TabOrder = 5
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbrePuMercado: TDBRealEdit
                  Tag = -21
                  Left = 420
                  Top = 23
                  Width = 128
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 4
                  WordWrap = False
                  IntDigits = 9
                  DecDigits = 9
                  NumberFormat = fNumber
                  Signal = True
                  DataField = 'PUMERCADO'
                  DataSource = ds
                end
                object dtLiquidacao: TCMDateTimePicker
                  Left = 7
                  Top = 23
                  Width = 89
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
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
                  TabOrder = 0
                  OnExit = dtLiquidacaoExit
                end
              end
            end
          end
        end
        object tbsHistorico: TTabSheet
          Caption = 'Histórico'
          ImageIndex = 2
          object dbgHistorico: TwwDBGrid
            Left = 0
            Top = 0
            Width = 767
            Height = 204
            Selected.Strings = (
              'DATAVIGENCIA'#9'31'#9'Data de Vigência'
              'DATAVENCTOANT'#9'41'#9'Data de Vencimento Anterior'
              'DATAVENCTOATU'#9'31'#9'Data de Vencimento Atual')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHistorico
            TabOrder = 0
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
    end
  end
  inherited Dock972: TDock97
    Width = 796
    inherited Toolbar971: TToolbar97
      object sbtnBuscaSaldos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 84
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Saldo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = sbtnBuscaSaldosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 473
    Width = 796
    inherited tb97Fundo: TToolbar97
      Left = 624
      DockPos = 950
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 374
      DockPos = 700
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
      end
      inherited bbtnCancelar: TBitBtn
        Left = 165
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        Visible = False
        OnClick = bbtnImprimirClick
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
    inline fraMensOper: TfraMensagem
      Left = 1
      Top = 1
      Width = 382
      Height = 35
      Align = alClient
      TabOrder = 2
      Visible = False
      inherited pnlProgresso: TPanel
        Width = 382
        Height = 35
        inherited pnlProgressoMensagem: TPanel
          Height = 33
          inherited lblProgressoMensagem: TfcLabel
            Height = 31
          end
        end
        inherited pnlProgressoBarra: TPanel
          Width = 185
          Height = 33
          inherited pgbProcesso: TProgressBar
            Width = 183
            Height = 31
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 384
    Top = 6
    TargetsData = (
      1
      5
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        ''
        'Items'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 486
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERRENFIX'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDFORCLI = :IDFORCLI,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PUOPERACAO = :PUOPERACAO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  PUEMISSAO = :PUEMISSAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VENCOPERACAO = :VENCOPERACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC,'
      '  FLGOPERIMPLANT = :FLGOPERIMPLANT,'
      '  DATALEILAO = :DATALEILAO,'
      '  FLGNEGOCIACAO = :FLGNEGOCIACAO,'
      '  FLGCARTHIPO = :FLGCARTHIPO,'
      '  QTDCARTHIPO = :QTDCARTHIPO,'
      '  TXOPERACIONAL = :TXOPERACIONAL,'
      '  TXBOLSA = :TXBOLSA,'
      '  IDCLASSRISCORENFIX = :IDCLASSRISCORENFIX,'
      '  FLGRECALC = :FLGRECALC,'
      '  BOLETA = :BOLETA,'
      '  PUMERCADO = :PUMERCADO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  IDOPERRENFIXORIG = :IDOPERRENFIXORIG'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into OPERRENFIX'
      
        '  (IDOPERRENFIX, IDINVESTIMENTO, IDTIPOOPERACAO, IDCARTEIRAINVES' +
        'T, '
      'IDCUSTODIANTE,  IDFORCLI, MOECODIGO, IDPLANPREVCTBPATR, '
      'DATAOPERACAO, PUOPERACAO, DATAEMISSAO, PUEMISSAO, VLROPERACAO, '
      'QTDEOPERACAO, VENCOPERACAO, OBSERVACAO, IDUSUARIO, '
      'IDOPERRENFIXAPLIC, FLGOPERIMPLANT, DATALEILAO, FLGNEGOCIACAO,'
      'FLGCARTHIPO, QTDCARTHIPO, TXOPERACIONAL, TXBOLSA, '
      'IDCLASSRISCORENFIX,FLGRECALC, BOLETA,PUMERCADO,DATALIQUIDACAO,'
      'IDOPERRENFIXORIG )'
      'values'
      '  (:IDOPERRENFIX, :IDINVESTIMENTO, :IDTIPOOPERACAO, '
      ':IDCARTEIRAINVEST,  :IDCUSTODIANTE, :IDFORCLI, :MOECODIGO, '
      ':IDPLANPREVCTBPATR, :DATAOPERACAO,  :PUOPERACAO, :DATAEMISSAO, '
      ':PUEMISSAO, :VLROPERACAO, :QTDEOPERACAO,  :VENCOPERACAO, '
      ':OBSERVACAO, :IDUSUARIO, :IDOPERRENFIXAPLIC, :FLGOPERIMPLANT, '
      ':DATALEILAO, :FLGNEGOCIACAO, :FLGCARTHIPO, :QTDCARTHIPO, '
      ':TXOPERACIONAL, :TXBOLSA, :IDCLASSRISCORENFIX,:FLGRECALC, '
      ':BOLETA,:PUMERCADO,:DATALIQUIDACAO,'
      ':IDOPERRENFIXORIG)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERRENFIX'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    Left = 514
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERRENFIX.DATAOPERACAO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPERRENFIX.VLROPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'APLICACAO.DATAOPERACAO'
      'APLICACAO.VLROPERACAO'
      'APLICACAO.QTDEOPERACAO'
      'OPERRENFIX.VENCOPERACAO'
      'CARTEIRAINVEST.DESCCARTINVEST')
    TipodeDado.Strings = (
      'D'
      'C'
      'N'
      'C'
      'D'
      'N'
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Data'
      'Tipo de Operação'
      'Valor da Operação'
      'Investimento'
      'Data da Aplicação'
      'Valor Aplicado'
      'Quantidade Aplicada'
      'Vencimento da Aplicação'
      'Carteira')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'TIPOOPERACAO'
      'OPERRENFIX'
      'CARTEIRAINVEST'
      'OPERRENFIX APLICACAO')
    CamposChave.Strings = (
      'OPERRENFIX.IDOPERRENFIX'
      'INVESTIMENTO.IDEMISSOR'
      'TIPOOPERACAO.NATUREZAOPERACAO')
    Filtro.Strings = (
      'INVESTIMENTO.IDTIPOINVEST = 1'
      'TIPOOPERACAO.IDTIPOINVEST = 1'
      'OPERRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERRENFIX.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO'
      'OPERRENFIX.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVEST'
      'OPERRENFIX.IDTIPOOPERACAO NOT IN (-17,-18,-19)'
      'OPERRENFIX.IDOPERRENFIXAPLIC = APLICACAO.IDOPERRENFIX(+)')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,##0.00'
      ''
      'dd/mm/yyyy'
      '###,###,###,##0.00'
      '###,###,###,##0.'
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '10'
      '30'
      '18'
      '40'
      '18'
      '10'
      '10'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    Left = 366
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 353
    Top = 6
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      0002000200020002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000200020002
      00020002000200020002000200000000000000000000000000000000007C0040
      007C0040007C00000000000000000000000000000000000000000000E07FE07F
      E07FE07FE07F0000000000000000000000000000000000000000000010001000
      100010001000000000000000000000000000000000001042E003000200020000
      000000020002000200020002000200000000000000001042007C007C0040007C
      0040007C0040007C00400000000000000000000000001042E07FE07FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000010421000100010001042
      FF7F10421000100010000000000000000000000000001042E0030002FF7FFF7F
      FF7F0000000200020002000200020000000000001042007C007C0040007C0040
      007C0040007C0040007C004000000040000000001042FF7FE07F104200001042
      E07FE07FE07FE07FE07FE07F000000000000000010421000100010001000FF7F
      FF7FFF7F100010001000100000000000000000001042E00300020002FF7FFF7F
      FF7FFF7F000000020002000200020002000000001042007C00401042FF7F007C
      0040007CFF7F10420040007C00000000000000001042FF7FE07F000000000000
      E07FE07FE07FE07FE07FE07F0000000000000000104210001000100010001042
      FF7F1042100010001000100000000000000000001042E00300020002FF7FFF7F
      FF7FFF7FFF7F0000000200020002004200001042007C0040007CFF7FFF7FFF7F
      007CFF7FFF7FFF7F007C0040007C000000001042FF7FE07FE07F000000000000
      E07FE07FE07F0000E07FE07FE07F0000000010421F0010001000100010001000
      10001000100010001000100010000000000000001042E00300020002FF7FFF7F
      0000FF7FFF7FFF7F000000020002000200001042007C007C0040007CFF7FFF7F
      FF7FFF7FFF7F007C0040007C0040000000001042FF7FE07FE07F000000000000
      1042E07F00000000E07FE07FE07F0000000010421F0010001000100010001000
      FF7F0000100010001000100010000000000000001042E00300020002FF7FFF7F
      00000002FF7FFF7FFF7F00000002000200001042007C0040007C0040007CFF7F
      FF7FFF7F007C0040007C0040007C000000001042FF7FE07FE07FE07F00000000
      0000000000000000E07FE07FE07F0000000010421F0010001000100010001000
      FF7F0000100010001000100010000000000000001042E00300020002FF7FFF7F
      000200020002FF7FFF7F00000002000200001042007C007C0040007CFF7FFF7F
      FF7FFF7FFF7F007C0040007C0040000000001042FF7FE07FE07FE07FE07F1042
      0000000000000000E07FE07FE07F0000000010421F0010001000100010001000
      0000FF7FFF7F100010001000100000000000000000001042E003000200020002
      0002000200020002FF7FFF7F0002000000001042007C0040007CFF7FFF7FFF7F
      007CFF7FFF7FFF7F007C0040007C000000001042FF7FE07FE07FE07FE07F0000
      0000000000000000E07FE07FE07F0000000010421F0010001000FF7FFF7F1000
      10000000FF7FFF7F10001000100000000000000000001042E003000200020002
      00020002000200020002000200020000000000001042007C00401042FF7F007C
      0040007CFF7F10420040007C00000000000000001042FF7FE07FE07F00000000
      0000000000001042E07FE07F000000000000000010421F001000FF7FFF7F0000
      10000000FF7FFF7F100010000000000000000000000000001042E003E0030002
      00020002000200020002000200000000000000001042007C007C0040007C0040
      007C0040007C0040007C004000000000000000001042FF7FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F000000000000000010421F0010001000FF7FFF7F
      FF7FFF7FFF7F000010001000000000000000000000000000000010421042E003
      E003E003E003E00310421042000000000000000000001042007C007C0040007C
      0040007C0040007C00400000000000000000000000001042FF7FFF7FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000010421F001F001000FF7F
      FF7FFF7F10001000100000000000000000000000000000000000000000001042
      10421042104210420000000000000000000000000000000010421042007C007C
      007C007C007C10421042000000000000000000000000000010421042FF7FFF7F
      FF7FFF7FFF7F104210420000000000000000000000000000104210421F001F00
      1F001F001F001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000010421042
      1042104210420000000000000000000000000000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421042000000000000000000000000E07F0000000000000000E07F
      E07F104210420000000000000000E07F00000000000000000000000000001042
      1042FF7FFF7F0000104200000000000000000000000000000000000000000000
      0000000010421042000000000000000000000000000000000000000000000000
      00000000FF7F00000000000000000000000000000000E07FE07F000000000000
      0000FF7F000000000000E07FE07F00000000000000000000000010421042FF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7F00000000000000000000000000000000E07FE07F00000000FF7F
      FF7FFF7F0000E07FE07FE07FE07F000000000000000000001042FF7FFF7FFF7F
      FF7F10421042FF7F000000000000000000000000000000000000000000000000
      FF7FFF7FFF7F00000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000E07FE07F0000000000000000000000001042FF7FFF7F0000
      0000FF7F0000FF7FFF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F00000000000000000000000000001042FF7FFF7FFF7FFF7F
      FF7F1F00FF7F0000E07F0000000000000000000000000000000000000000FF7F
      FF7FFF7F0000FF7FFF7F00000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F000000000000004000000040000000001042FF7FFF7F1F00
      1F001F00FF7FFF7FFF7F0000000000000000000000001042FF7FFF7F1F001F00
      1F00FF7FFF7FFF7F0000E07F0000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7F0000000000000000000000400040004000400040
      1F001F00FF7FFF7FFF7F000000000000000000400040004000001042FF7FFF7F
      FF7FFF7FFF7F1F00FF7F000000000000000000000000E07F1042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F0000E07FE07F00000000000000001042FF7FFF7FFF7FFF7F
      FF7F1F00FF7F0000FF7FFF7FFF7F0000000000000040007C007C007C007C007C
      0040FF7FFF7F1F00FF7F000000000000000000400040004000001042FF7FFF7F
      1F001F001F00FF7FFF7FFF7F000000000000E07FE07FE07F1042FF7FFF7F1F00
      1F001F00FF7FFF7FFF7F0000E07FE07FE07F000000001042FF7FFF7F1F001F00
      1F00FF7FFF7FFF7F0000FF7FFF7FFF7F0000007C007C007C007C007C007C007C
      007C00401F00FF7FFF7FFF7F0000000000000000004000400040000000000000
      0000FF7FFF7FFF7F1F00FF7FFF7F0000000000000000E07FE07F1042FF7FFF7F
      FF7FFF7FFF7F1F40FF7FFF7F0000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F0000FF7F104210420000007C007C0000FF7F007CFF7FFF7F
      007C0040FF7FFF7F1F00FF7FFF7F004000000000000000400000FF030000FF03
      0000000010021F00FF7FFF7FFF7FFF7F0000000000000000E07F1042FF7FFF7F
      1F001F001F00FF7FFF7FFF7FFF7F000000000000000000001042FF7FFF7F1F00
      1F001F00FF7FFF7FFF7F0000000000000000007C007C007C0000FF7FFF7F007C
      007C00401F001F00FF7FFF7FFF7FFF7F0000000000000000FF030000FF030000
      FF0300000000FF7FFF7FFF7F104210420000000000000000E07FE07F1042FF7F
      FF7FFF7FFF7FFF7FFF7F104210420000000000000000000000001042FF7FFF7F
      FF7FFF7FFF7F1F00FF7FFF7F000000000000007C007C007CFF7FFF7F0000007C
      007C0040FF7FFF7FFF7FFF7F1042104200000000000000000000FF030000FF03
      0000FF030000FF7F1042104200000000000000000000E07FE07FE07FE07F1042
      FF7FFF7FFF7F10421042E07FE07F0000000000000000000000001042FF7FFF7F
      1F001F001F00FF7FFF7FFF7FFF7F00000000007C007C0000FF7F007CFF7FFF7F
      007C0040FF7FFF7F10421042000000000000000000000000FF030000FF030000
      FF030000000010420000000000000000000000000000E07FE07F00000000E07F
      10421042104200000000E07FE07F00000000000000000000000000001042FF7F
      FF7FFF7FFF7FFF7FFF7F10421042000000000000007C007C007C007C007C007C
      0040104210421042000000000000000000000000000000000000FF030000FF03
      0000FF0300000000000000000000000000000000E07F00000000000000000000
      E07F000000000000000000000000E07F00000000000000000000000000001042
      FF7FFF7FFF7F10421042000000000000000000000000007C007C007C007C007C
      00000000000000000000000000000000000000000000000000000000FF030000
      FF03000000000000000000000000000000000000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      1042104210420000000000000000000000000000000000000000000000000000
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
    Left = 338
    Top = 6
  end
  inherited qry: TwwQuery
    Tag = 0
    SQL.Strings = (
      
        'SELECT IDOPERRENFIX, IDINVESTIMENTO, IDTIPOOPERACAO, IDCARTEIRAI' +
        'NVEST, IDCUSTODIANTE,'
      '       IDFORCLI, MOECODIGO,IDPLANPREVCTBPATR,'
      
        '       DATAOPERACAO, PUOPERACAO, DATAEMISSAO, PUEMISSAO, VLROPER' +
        'ACAO, QTDEOPERACAO, VENCOPERACAO,'
      '       OBSERVACAO, IDUSUARIO, IDOPERRENFIXAPLIC,FLGOPERIMPLANT,'
      
        '       DATALEILAO, TXBOLSA, TXOPERACIONAL, FLGNEGOCIACAO, FLGCAR' +
        'THIPO, QTDCARTHIPO,'
      
        '       PLNCODIGO, CODDOCUMENTO, IDCLASSRISCORENFIX,FLGRECALC,BOL' +
        'ETA, PUMERCADO, DATALIQUIDACAO,'
      '       IDOPERRENFIXORIG '
      'FROM   OPERRENFIX'
      'WHERE  IDOPERRENFIX = :IDOPERRENFIX'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 458
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
    object qryIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIX'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERRENFIX.IDINVESTIMENTO'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.IDTIPOOPERACAO'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERRENFIX.IDCARTEIRAINVEST'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERRENFIX.IDCUSTODIANTE'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERRENFIX.IDFORCLI'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.OPERRENFIX.MOECODIGO'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERRENFIX.IDPLANPREVCTBPATR'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATAOPERACAO'
    end
    object qryPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.PUOPERACAO'
    end
    object qryPUEMISSAO: TFloatField
      FieldName = 'PUEMISSAO'
      Origin = 'BASEDADOS.OPERRENFIX.PUEMISSAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VLROPERACAO'
    end
    object qryQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.QTDEOPERACAO'
    end
    object qryVENCOPERACAO: TDateTimeField
      FieldName = 'VENCOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VENCOPERACAO'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERRENFIX.OBSERVACAO'
      Size = 200
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.OPERRENFIX.IDUSUARIO'
    end
    object qryIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
    end
    object qryFLGOPERIMPLANT: TStringField
      FieldName = 'FLGOPERIMPLANT'
      Origin = 'BASEDADOS.OPERRENFIX.FLGOPERIMPLANT'
      FixedChar = True
      Size = 1
    end
    object qryDATALEILAO: TDateTimeField
      FieldName = 'DATALEILAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATALEILAO'
    end
    object qryFLGNEGOCIACAO: TStringField
      FieldName = 'FLGNEGOCIACAO'
      Origin = 'BASEDADOS.OPERRENFIX.FLGNEGOCIACAO'
      FixedChar = True
      Size = 1
    end
    object qryTXBOLSA: TFloatField
      FieldName = 'TXBOLSA'
      Origin = 'BASEDADOS.OPERRENFIX.TXBOLSA'
    end
    object qryTXOPERACIONAL: TFloatField
      FieldName = 'TXOPERACIONAL'
      Origin = 'BASEDADOS.OPERRENFIX.TXOPERACIONAL'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryIDCLASSRISCORENFIX: TFloatField
      FieldName = 'IDCLASSRISCORENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDCLASSRISCORENFIX'
    end
    object qryFLGCARTHIPO: TStringField
      FieldName = 'FLGCARTHIPO'
      FixedChar = True
      Size = 1
    end
    object qryQTDCARTHIPO: TFloatField
      FieldName = 'QTDCARTHIPO'
    end
    object qryFLGRECALC: TStringField
      FieldName = 'FLGRECALC'
      Origin = 'BASEDADOS.OPERRENFIX.FLGRECALC'
      FixedChar = True
      Size = 1
    end
    object qryBOLETA: TStringField
      FieldName = 'BOLETA'
      Origin = 'BASEDADOS.OPERRENFIX.BOLETA'
      Size = 30
    end
    object qryPUMERCADO: TFloatField
      FieldName = 'PUMERCADO'
      Origin = 'BASEDADOS.OPERRENFIX.PUMERCADO'
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATALIQUIDACAO'
    end
    object qryIDOPERRENFIXORIG: TFloatField
      FieldName = 'IDOPERRENFIXORIG'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIXORIG'
    end
  end
  object imgCurvas: TImageList
    Left = 423
    Top = 5
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000000000
      0000000000000000003300000000000000000000000000000033000000000000
      0000000000000000003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000000000
      0000000000000000003300000000000000000000000000000033000000000000
      0000000000000000003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000000000
      0000003300330033003300000000000000000000000000000033000000000000
      0000003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000000000
      0000000000000033003300000000000000000000000000000033000000000000
      0000000000000033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000033003300330033
      0033003300330033003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033000000000000
      0000003300330000000000000000000000000000000000000033000000000000
      0000003300330000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033003300330033
      0033003300330000000000000000000000000000000000000033003300330033
      0033003300330000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      8073807380738073807300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      807380738073807380730000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000FF7F00000000000000000000000000008073000000000000
      000000000000000080730000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F0000000000000000000000000000E07FF75EE07FF75E
      E07FF75EE07FF75EE07F0000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      807380738073807380730000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F000000000000000000000000FF7F0000E07FF75EE07F
      F75EE07FF75EE07FF75EE07F000000000000000000000000FF7F000000000000
      0000000000000000FF7F00000000000000000000000000008073000000000000
      000000000000000080730000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000E07FFF7F0000E07FF75E
      E07FF75EE07FF75EE07FF75EE07F00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      807380738073807380730000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F000000000000000000000000FF7FE07FFF7F00000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000008073000000000000
      000080738073807380730000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F00000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      8073807380738073807300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000000000000000000000000000FF7F000000000000
      000000000000FF7FFF7F00000000000000000000000000008073000000000000
      0000000000008073807300000000000000000000000000000000FF7FE07FFF7F
      E07F0000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7F00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000008073807380738073
      807380738073807380730000000000000000000000000000EF3D000000000000
      0000EF3D0000000000000000000000000000000000000000E07FFF7FE07FFF7F
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000FF7FFF7F0000000000000000000000000000000000008073000000000000
      0000807380730000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3D0000000000000000
      EF3D00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000008073807380738073
      8073807380730000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000C007C00700000000
      C007C00700000000C007C00700000000C007C00700000000C007C00700000000
      C007C00700000000C007C00700000000C007C00700000000C007C00700000000
      C007C00700000000C007C00700000000C007C00700000000C01FC01F00000000
      C01FC01F00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFC007C007
      FFFFFFFFC007C007E007FFFFC007C007C007C00FC007C007C0078007C007C007
      C0078003C007C007C0078001C007C007C0078001C007C007C007800FC007C007
      C00F800FC007C007E07F801FC007C007E07FC0FFC007C007FFFFC0FFC01FC01F
      FFFFFFFFC01FC01FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE EM.IDEMISSOR = IV.IDEMISSOR AND'
      '      IV.IDTIPOINVEST = 1'
      'ORDER BY SIGLAEMISSOR'
      ' ')
    ValidateWithMask = True
    Left = 318
    Top = 109
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 40
      FieldName = 'SIGLAEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.IDINVESTIMENTO,IV.DESCINVESTIMENTO,IV.CODISIN,IV.IDCLA' +
        'SSETIT,IV.IDEMISSOR,'
      '       IV.FLGREPACTUA, IV.DATAEMISSAO, IV.PUEMISSAO'
      'FROM INVESTIMENTO IV, CLASSETITRENFIX CL'
      'WHERE (IV.IDTIPOINVEST = 1)'
      '  AND ((:IDEMISSOR IS NULL) OR (IV.IDEMISSOR = :IDEMISSOR))'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      'ORDER BY IV.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 702
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoCODISIN: TStringField
      DisplayWidth = 14
      FieldName = 'CODISIN'
      Origin = 'BASEDADOS.INVESTIMENTO.CODISIN'
      Visible = False
      Size = 14
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.INVESTIMENTO.IDCLASSETIT'
      Visible = False
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
    end
    object qryInvestimentoFLGREPACTUA: TStringField
      FieldName = 'FLGREPACTUA'
      FixedChar = True
      Size = 1
    end
    object qryInvestimentoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.INVESTIMENTO.DATAEMISSAO'
    end
    object qryInvestimentoPUEMISSAO: TFloatField
      FieldName = 'PUEMISSAO'
      Origin = 'BASEDADOS.INVESTIMENTO.PUEMISSAO'
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO,FLGGERACONTA' +
        'B,FLGGERACAPCAR,'
      
        '   RECPAG,TIPCREDOR,FLGTRATAIR,SIGLATIPOOPER,CODTIPDOC,FLGCONTAI' +
        'NVEST, VENCIMENTO'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST = 1)'
      
        '   AND ((IDTIPOOPERACAO > 0) or (IDTIPOOPERACAO IN (-166,-167,-1' +
        '68,-169)))'
      
        '   AND (((:NATUREZAOPERACAO IS NOT NULL) AND (NATUREZAOPERACAO =' +
        ' :NATUREZAOPERACAO)) OR (:NATUREZAOPERACAO IS NULL))'
      
        '   AND ((1 = 1) AND (IDTIPOOPERACAO NOT IN (-166,-167,-168,-169)' +
        ') OR (:IDTIPOPENHORA = 1))'
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
      ' ')
    ValidateWithMask = True
    Left = 326
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NATUREZAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'NATUREZAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'NATUREZAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOPENHORA'
        ParamType = ptUnknown
      end>
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoSIGLATIPOOPER: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperacaoRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
    object qryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTEIRAINVEST, DESCCARTINVEST,IDGESTORCARTEIRA'
      'FROM CARTEIRAINVEST'
      'WHERE'
      '(IDTIPOINVEST = 1) OR (IDTIPOINVEST IS NULL)'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 702
    Top = 145
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDGESTORCARTEIRA'
    end
  end
  object qryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCUSTODIANTE,SGLCUSTODIANTE'
      'FROM'
      '   CUSTODIANTE ')
    ValidateWithMask = True
    Left = 702
    Top = 181
    object qryCustodianteIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC, MOESIGLA'
      'FROM MOEDA'
      'WHERE MOESIGLA LIKE '#39'INV_%'#39
      'ORDER BY MOESIGLA')
    ValidateWithMask = True
    Left = 634
    Top = 390
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.MOEDA.MOECODIGO'
      Visible = False
    end
    object qryMoedaMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'BASEDADOS.MOEDA.MOEDESC'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 626
    Top = 6
  end
  object msBuscaSaldos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Saldos'
    Colunas.Strings = (
      'HISTRENFIX.DATAHISTRENFIX'
      'HISTRENFIX.SALDOVLRHISTRENFI'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERRENFIX.DATAOPERACAO'
      'OPERRENFIX.QTDEOPERACAO'
      'OPERRENFIX.VLROPERACAO'
      'OPERRENFIX.VENCOPERACAO')
    TipodeDado.Strings = (
      'D'
      'N'
      'C'
      'D'
      'N'
      'N'
      'D')
    Descricao.Strings = (
      'Data do Saldo'
      'Saldo'
      'Investimento'
      'Data da Aplicação'
      'Quantidade Aplicada'
      'Valor Aplicado'
      'Vencimento da Aplicação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRENFIX'
      
        '(SELECT MAX(IDHISTRENFIX) AS IDHISTRENFIX FROM HISTRENFIX H, PAR' +
        'AMINVEST P WHERE (H.DATAHISTRENFIX >= (P.DATAULTFECHRF-30)) GROU' +
        'P BY DATAHISTRENFIX, IDINVESTIMENTO, IDOPERRENFIXAPLIC) IDS'
      'INVESTIMENTO'
      'OPERRENFIX')
    CamposChave.Strings = (
      'INVESTIMENTO.IDEMISSOR'
      'HISTRENFIX.IDINVESTIMENTO'
      'HISTRENFIX.IDCARTEIRAINVEST'
      'OPERRENFIX.IDFORCLI'
      'OPERRENFIX.IDCUSTODIANTE'
      'HISTRENFIX.DATAHISTRENFIX'
      'OPERRENFIX.VENCOPERACAO'
      'HISTRENFIX.SALDOVLRHISTRENFI'
      'HISTRENFIX.SALDOQTDHISTRENFI'
      'OPERRENFIX.DATAEMISSAO'
      'OPERRENFIX.PUEMISSAO'
      'HISTRENFIX.IDOPERRENFIXAPLIC'
      'OPERRENFIX.IDUSUARIO'
      'INVESTIMENTO.IDCLASSETIT'
      'OPERRENFIX.DATAOPERACAO'
      'INVESTIMENTO.CARENCIA'
      'NVL(OPERRENFIX.IDCLASSRISCORENFIX,0)'
      'OPERRENFIX.FLGCARTHIPO'
      'OPERRENFIX.QTDCARTHIPO')
    Filtro.Strings = (
      'HISTRENFIX.IDHISTRENFIX = IDS.IDHISTRENFIX'
      'HISTRENFIX.SALDOVLRHISTRENFI > 0'
      'INVESTIMENTO.IDTIPOINVEST = 1'
      'INVESTIMENTO.IDINVESTIMENTO = HISTRENFIX.IDINVESTIMENTO'
      'HISTRENFIX.IDOPERRENFIXAPLIC = OPERRENFIX.IDOPERRENFIX')
    Mascaras.Strings = (
      'dd/mm/yyyy'
      '###,###,###,##0.00'
      ''
      'dd/mm/yyyy'
      '###,###,###,##0'
      '###,###,###,##0.00'
      'dd/mm/yyyy')
    Larguras.Strings = (
      '10'
      '18'
      '40'
      '10'
      '18'
      '18'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
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
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 408
    Top = 5
  end
  object qryAutorizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDUSUARIO, NOMEUSUARIO'
      'FROM AUTORIZAOPERACAO'
      'WHERE FLGATIVO = '#39'S'#39
      'ORDER BY NOMEUSUARIO')
    ValidateWithMask = True
    Left = 326
    Top = 217
    object qryAutorizacaoNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.NOMEUSUARIO'
    end
    object qryAutorizacaoIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.AUTORIZAOPERACAO.IDUSUARIO'
      Visible = False
    end
  end
  object qrySaldoTotalPoup: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 664
    Top = 6
  end
  object qryBuscaPagtoJuros: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'VLROPERACAO'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '    DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AND'
      '    IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC  AND'
      '    IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR  AND'
      '    IDTIPOOPERACAO    = -17'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 698
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryBuscaPagtoJurosVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
  end
  object qryBuscaTaxas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IT.IDITEMRENFIX'
      'FROM INVESTIMENTO IV, ITEMRENFIX IT, CURVASRENFIX CR,'
      '     INVESTXCURVARENFIX IC, CURVASXITEMRENFIX CI'
      ''
      'WHERE IV.IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '      IT.IDITEMRENFIX IN (-12,-13) AND'
      '      IT.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      '      CI.IDCURVARENFIX = CR.IDCURVARENFIX AND'
      '      IC.IDCURVARENFIX = CR.IDCURVARENFIX AND'
      '      IC.IDINVESTIMENTO = IV.IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 732
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryBuscaTaxasIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
    end
  end
  object qryCasseRisco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, CORCLASSRISCO'
      'FROM CLASSRISCORENFIX'
      'ORDER BY NIVELCLASSRISCO')
    ValidateWithMask = True
    Left = 702
    Top = 217
    object qryCasseRiscoNOMECLASSRISCO: TStringField
      DisplayLabel = 'Nome da Classe de Risco'
      DisplayWidth = 30
      FieldName = 'NOMECLASSRISCO'
      Origin = 'CLASSRISCORENFIX.NOMECLASSRISCO'
      Size = 60
    end
    object qryCasseRiscoIDCLASSRISCORENFIX: TFloatField
      FieldName = 'IDCLASSRISCORENFIX'
      Origin = 'CLASSRISCORENFIX.IDCLASSRISCORENFIX'
      Visible = False
    end
    object qryCasseRiscoCORCLASSRISCO: TFloatField
      FieldName = 'CORCLASSRISCO'
      Origin = 'CLASSRISCORENFIX.CORCLASSRISCO'
      Visible = False
    end
  end
  object qryExcluiCotacoes: TwwQuery
    SQL.Strings = (
      'SELECT * '
      'FROM COTACAORENFIX CR, '
      '     (SELECT DISTINCT IDINVESTIMENTO, VENCOPERACAO'
      '      FROM OPERRENFIX'
      '      WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '        AND VENCOPERACAO = TO_DATE(:DATAVENCTO,'#39'DD/MM/YYYY'#39')) OP'
      'WHERE CR.IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND CR.DATAVENCTO = TO_DATE(:DATAVENCTO,'#39'DD/MM/YYYY'#39')'
      '  AND CR.IDINVESTIMENTO = OP.IDINVESTIMENTO(+)'
      '  AND CR.DATAVENCTO = OP.VENCOPERACAO(+)'
      '  AND OP.IDINVESTIMENTO IS NULL'
      '')
    ValidateWithMask = True
    Left = 397
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAVENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAVENCTO'
        ParamType = ptUnknown
      end>
  end
  object qryContraParte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PE.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, '
      '     (SELECT EM.IDEMISSOR AS IDFORCLI'
      '      FROM EMISSOR EM'
      '      UNION'
      '      SELECT CU.IDCUSTODIANTE AS IDFORCLI'
      '      FROM CUSTODIANTE CU'
      '      UNION'
      '      SELECT BV.IDBOLSAVALORES AS IDFORCLI'
      '      FROM BOLSAVALORES BV'
      '      UNION'
      '      SELECT CT.IDCORRETVALORES AS IDFORCLI'
      '      FROM CORRETVALORES CT ) FORCLI'
      ''
      'WHERE PE.IDPESSOA = FORCLI.IDFORCLI'
      ''
      'ORDER BY PE.NOME')
    ValidateWithMask = True
    Left = 326
    Top = 181
    object qryContraParteNOME: TStringField
      DisplayLabel = 'Contra Parte'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryContraParteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qryExisteOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OP.IDOPERRENFIX, TP.FLGGERACONTAB, TP.FLGCONTAINVEST'
      'FROM'
      '   (SELECT IDOPERRENFIX'
      '    FROM   HISTRENFIX'
      '    WHERE  TIPMOVHISRENFIX = '#39'OPE'#39
      '      AND  DATAHISTRENFIX = TO_DATE(:DDATAPROC,'#39'DD/MM/YYYY'#39')'
      
        '      AND  (((:IDINVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO =' +
        ' :IDINVESTIMENTO)) OR'
      '            (:IDINVESTIMENTO IS NULL))'
      
        '      AND  (((:IDOPERRENFIXAPLIC IS NOT NULL) AND (IDOPERRENFIXA' +
        'PLIC = :IDOPERRENFIXAPLIC)) OR'
      '            (:IDOPERRENFIXAPLIC IS NULL))     ) HT,'
      '   OPERRENFIX OP, TIPOOPERACAO TP'
      'WHERE (OP.DATAOPERACAO = TO_DATE(:DDATAPROC,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (((:IDINVESTIMENTO IS NOT NULL) AND (OP.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR'
      '       (:IDINVESTIMENTO IS NULL))'
      
        '  AND (((:IDOPERRENFIXAPLIC IS NOT NULL) AND (OP.IDOPERRENFIXAPL' +
        'IC = :IDOPERRENFIXAPLIC)) OR'
      '       (:IDOPERRENFIXAPLIC IS NULL))'
      
        '  AND (((:REPROCESSO IS NULL) AND (OP.IDTIPOOPERACAO NOT IN(-17,' +
        '-18,-19))) OR'
      '       (:REPROCESSO IS NOT NULL))'
      '  AND (OP.IDOPERRENFIX = HT.IDOPERRENFIX(+))'
      '  AND (HT.IDOPERRENFIX IS NULL)'
      '  AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      'ORDER BY OP.IDOPERRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 588
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataProc'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DDATAPROC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'REPROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'REPROCESSO'
        ParamType = ptInput
      end>
    object qryExisteOperacoesIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
    end
    object qryExisteOperacoesFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object qryExisteOperacoesFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
  end
  object rptBoletaRenFix: TppReport
    AutoStop = False
    DataPipeline = pplBoletaRenFix
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 346
    Top = 360
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBoletaRenFix'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 80433
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 12700
        mmLeft = 0
        mmTop = 66675
        mmWidth = 197115
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 20108
        mmLeft = 0
        mmTop = 30163
        mmWidth = 197115
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 13229
        mmLeft = 0
        mmTop = 51858
        mmWidth = 197115
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 10848
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197115
        BandType = 0
      end
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Boleta de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 35454
        BandType = 0
      end
      object lblNomeEmpresa: TppLabel
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1323
        mmWidth = 24342
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 20638
        mmWidth = 8996
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Operacao :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 32808
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'Investimento :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 38100
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'LPeriodo3'
        Caption = 'Emissor :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100013
        mmTop = 32808
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'LPeriodo4'
        Caption = 'Contra-Parte :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100013
        mmTop = 38100
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'LPeriodo5'
        Caption = 'Custodiante :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100013
        mmTop = 43392
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'LPeriodo7'
        Caption = 'Data Operação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47890
        mmTop = 20638
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'PU Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61383
        mmTop = 53446
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 53446
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 53446
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Observação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 68263
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 53446
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLROPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 59267
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 59267
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PUOPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 61383
        mmTop = 59267
        mmWidth = 26458
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'OBSERVACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 73554
        mmWidth = 187061
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data Liquidação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 20638
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Prazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 53446
        mmWidth = 8202
        BandType = 0
      end
      object rptlblPrazo: TppLabel
        UserName = 'rptlblPrazo'
        Caption = 'Prazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 59267
        mmWidth = 8202
        BandType = 0
      end
      object rptdbeBoleta: TppDBText
        UserName = 'rptdbeBoleta'
        DataField = 'BOLETA'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 20638
        mmWidth = 27252
        BandType = 0
      end
      object rptdbeDtaOper: TppDBText
        UserName = 'rptdbeDtaOper'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 20638
        mmWidth = 17198
        BandType = 0
      end
      object rptlblDtaLiquidacao: TppLabel
        UserName = 'lblPrazo1'
        Caption = 'Data Liquid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 20638
        mmWidth = 17463
        BandType = 0
      end
      object rptlblOperacao: TppLabel
        UserName = 'LPeriodo6'
        Caption = 'Operacao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 32808
        mmWidth = 14023
        BandType = 0
      end
      object rptlblInvestimento: TppLabel
        UserName = 'rptlblInvestimento'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 38100
        mmWidth = 17992
        BandType = 0
      end
      object rptlblCustodiante: TppLabel
        UserName = 'rptlblCustodiante'
        Caption = 'Custodiante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 43392
        mmWidth = 16933
        BandType = 0
      end
      object rptlblContraParte: TppLabel
        UserName = 'rptlblContraParte'
        Caption = 'Contra Parte'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 38100
        mmWidth = 17992
        BandType = 0
      end
      object rptlblEmissor: TppLabel
        UserName = 'rptlblEmissor'
        Caption = 'Emissor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 32808
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VENCOPERACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 59267
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 57944
        mmWidth = 197115
        BandType = 0
      end
    end
    object ppbBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283634
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283634
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
  end
  object pplBoletaRenFix: TppBDEPipeline
    DataSource = ds
    UserName = 'lBoletaRenFix'
    Left = 308
    Top = 408
    object pplBoletaRenFixppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERRENFIX'
      FieldName = 'IDOPERRENFIX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplBoletaRenFixppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplBoletaRenFixppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplBoletaRenFixppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplBoletaRenFixppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplBoletaRenFixppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplBoletaRenFixppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplBoletaRenFixppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplBoletaRenFixppField9: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplBoletaRenFixppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplBoletaRenFixppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUEMISSAO'
      FieldName = 'PUEMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplBoletaRenFixppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplBoletaRenFixppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplBoletaRenFixppField14: TppField
      FieldAlias = 'VENCOPERACAO'
      FieldName = 'VENCOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplBoletaRenFixppField15: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 14
    end
    object pplBoletaRenFixppField16: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object pplBoletaRenFixppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDUSUARIO'
      FieldName = 'IDUSUARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplBoletaRenFixppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERRENFIXAPLIC'
      FieldName = 'IDOPERRENFIXAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplBoletaRenFixppField19: TppField
      FieldAlias = 'FLGOPERIMPLANT'
      FieldName = 'FLGOPERIMPLANT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplBoletaRenFixppField20: TppField
      FieldAlias = 'DATALEILAO'
      FieldName = 'DATALEILAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object pplBoletaRenFixppField21: TppField
      FieldAlias = 'FLGNEGOCIACAO'
      FieldName = 'FLGNEGOCIACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object pplBoletaRenFixppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TXBOLSA'
      FieldName = 'TXBOLSA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplBoletaRenFixppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TXOPERACIONAL'
      FieldName = 'TXOPERACIONAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplBoletaRenFixppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplBoletaRenFixppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplBoletaRenFixppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCLASSRISCORENFIX'
      FieldName = 'IDCLASSRISCORENFIX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplBoletaRenFixppField27: TppField
      FieldAlias = 'FLGCARTHIPO'
      FieldName = 'FLGCARTHIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object pplBoletaRenFixppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDCARTHIPO'
      FieldName = 'QTDCARTHIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplBoletaRenFixppField29: TppField
      FieldAlias = 'FLGRECALC'
      FieldName = 'FLGRECALC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object pplBoletaRenFixppField30: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 29
    end
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAVIGENCIA, DATAVENCTOANT, DATAVENCTOATU'
      'FROM HISTOPERRENFIX'
      'WHERE IDOPERRENFIX = :IDOPERRENFIX'
      'ORDER BY DATAVIGENCIA DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 742
    Top = 257
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptResult
      end>
    object qryHistoricoDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Data de Vigência'
      DisplayWidth = 31
      FieldName = 'DATAVIGENCIA'
      Origin = 'BASEDADOS.HISTOPERRENFIX.DATAVIGENCIA'
    end
    object qryHistoricoDATAVENCTOANT: TDateTimeField
      DisplayLabel = 'Data de Vencimento Anterior'
      DisplayWidth = 41
      FieldName = 'DATAVENCTOANT'
      Origin = 'BASEDADOS.HISTOPERRENFIX.DATAVENCTOANT'
    end
    object qryHistoricoDATAVENCTOATU: TDateTimeField
      DisplayLabel = 'Data de Vencimento Atual'
      DisplayWidth = 31
      FieldName = 'DATAVENCTOATU'
      Origin = 'BASEDADOS.HISTOPERRENFIX.DATAVENCTOATU'
    end
  end
  object dsHistorico: TwwDataSource
    AutoEdit = False
    DataSet = qryHistorico
    Left = 714
    Top = 258
  end
end
