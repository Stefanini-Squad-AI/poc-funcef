inherited frmTransfFundosMT: TfrmTransfFundosMT
  Left = 179
  Top = 160
  HelpContext = 90006
  Caption = 'Transferência entre Contas'
  ClientHeight = 473
  ClientWidth = 765
  KeyPreview = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 434
    BevelInner = bvRaised
    BevelOuter = bvNone
    object pgcTransfFundos: TPageControl
      Left = 4
      Top = 4
      Width = 757
      Height = 426
      ActivePage = tbsPrevidenciario
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object pnlGrids: TPanel
          Left = 0
          Top = 0
          Width = 749
          Height = 200
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object PnlDadosOrigem: TPanel
            Left = 2
            Top = 2
            Width = 371
            Height = 196
            Align = alLeft
            TabOrder = 0
            object pnlContaDe: TPanel
              Left = 1
              Top = 1
              Width = 369
              Height = 27
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Conta de Origem'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbgContaDe: TwwDBGrid
              Left = 1
              Top = 28
              Width = 369
              Height = 126
              Selected.Strings = (
                'DESCRICAO'#9'29'#9'Descrição da Conta'
                'NOCONTACORR'#9'12'#9'Número da Conta')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContaOrigem
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
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
            object pnlSaldoOrigem: TPanel
              Left = 1
              Top = 154
              Width = 369
              Height = 41
              Align = alBottom
              TabOrder = 2
              object Label7: TLabel
                Left = 8
                Top = 16
                Width = 37
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Saldo:'
              end
              object edSaldoOrigem: TRealEdit
                Left = 56
                Top = 12
                Width = 126
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Anchors = [akLeft, akBottom]
                Color = clInfoBk
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
            end
          end
          object pnlDadosDestino: TPanel
            Left = 373
            Top = 2
            Width = 374
            Height = 196
            Align = alClient
            TabOrder = 1
            object pnlContaPara: TPanel
              Left = 1
              Top = 1
              Width = 372
              Height = 27
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Conta de Destino'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbgContaPara: TwwDBGrid
              Left = 1
              Top = 28
              Width = 372
              Height = 126
              Selected.Strings = (
                'DESCRICAO'#9'29'#9'Descrição da Conta'
                'NOCONTACORR'#9'12'#9'Número da Conta')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContaDestino
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
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
            object pnlSaldoDestino: TPanel
              Left = 1
              Top = 154
              Width = 372
              Height = 41
              Align = alBottom
              TabOrder = 2
              object Label8: TLabel
                Left = 8
                Top = 16
                Width = 37
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Saldo:'
              end
              object edSaldoDestino: TRealEdit
                Left = 55
                Top = 12
                Width = 126
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Anchors = [akLeft, akBottom]
                Color = clInfoBk
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
            end
          end
        end
        object pnlDadosTransf: TPanel
          Left = 0
          Top = 200
          Width = 749
          Height = 198
          Align = alBottom
          TabOrder = 1
          object lblContaDe: TLabel
            Left = 10
            Top = 10
            Width = 110
            Height = 13
            Caption = 'Transferir da Conta'
          end
          object lblContaPara: TLabel
            Left = 247
            Top = 10
            Width = 121
            Height = 13
            Caption = 'Transferir para Conta'
          end
          object lblData: TLabel
            Left = 484
            Top = 10
            Width = 119
            Height = 13
            Caption = 'Data do Lançamento'
          end
          object lblValor: TLabel
            Left = 610
            Top = 10
            Width = 124
            Height = 13
            Caption = 'Valor Moeda Corrente'
          end
          object lblDocumento: TLabel
            Left = 610
            Top = 55
            Width = 130
            Height = 13
            Caption = 'Número do Documento'
          end
          object lblHistorico: TLabel
            Left = 168
            Top = 55
            Width = 142
            Height = 13
            Caption = 'Histórico do Lançamento'
          end
          object lblHistPad: TLabel
            Left = 10
            Top = 55
            Width = 95
            Height = 13
            Caption = 'Histórico Padrão'
          end
          object lblUnidNegoc: TLabel
            Left = 11
            Top = 99
            Width = 170
            Height = 13
            Caption = 'Atividade da Conta de Origem'
          end
          object Label3: TLabel
            Left = 11
            Top = 142
            Width = 174
            Height = 13
            Caption = 'Atividade da Conta de Destino'
          end
          object dbeContaOrigem: TwwDBEdit
            Left = 10
            Top = 25
            Width = 223
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = dsContaOrigem
            Enabled = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeContaDestino: TwwDBEdit
            Left = 247
            Top = 25
            Width = 226
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = dsContaDestino
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edDataLanc: TCMDateTimePicker
            Left = 484
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
            TabOrder = 2
          end
          object ednValorCorrente: TRealEdit
            Left = 610
            Top = 25
            Width = 131
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            OnExit = ednValorCorrenteExit
            IntDigits = 17
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edNumDoc: TEdit
            Left = 610
            Top = 69
            Width = 131
            Height = 21
            TabOrder = 4
          end
          object edHistorico: TEdit
            Left = 170
            Top = 69
            Width = 431
            Height = 21
            MaxLength = 60
            TabOrder = 5
          end
          object dblcHistPad: TwwDBLookupCombo
            Left = 10
            Top = 69
            Width = 151
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            LookupTable = cdsHistorico
            LookupField = 'HISTPADFINAN'
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dblcUnidNegocOri: TwwDBLookupCombo
            Left = 11
            Top = 114
            Width = 230
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            LookupTable = cdsUnidNegocio
            LookupField = 'UNIDNEGOC'
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dblcUnidNegocDest: TwwDBLookupCombo
            Left = 11
            Top = 157
            Width = 230
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            LookupTable = cdsUnidNegocio
            LookupField = 'UNIDNEGOC'
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object rgTipoDocTransf: TGroupBox
            Left = 256
            Top = 101
            Width = 345
            Height = 89
            Caption = 'Tipo de Documento para Transferência'
            TabOrder = 9
            object Label6: TLabel
              Left = 12
              Top = 24
              Width = 75
              Height = 13
              Caption = 'Recebimento'
            end
            object lblTituloTipoDes: TLabel
              Left = 10
              Top = 56
              Width = 69
              Height = 13
              Caption = 'Desembolso'
              Enabled = False
            end
            object dblcTipoRecTransf: TwwDBLookupCombo
              Left = 99
              Top = 20
              Width = 230
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
              LookupTable = cdsTipoRec
              LookupField = 'CODTIPRECDES'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcTipoRecTransfChange
            end
            object dblcTipoDesTransf: TwwDBLookupCombo
              Left = 99
              Top = 52
              Width = 230
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
              LookupTable = cdsTipoDes
              LookupField = 'CODTIPRECDES'
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object cbImprimecheque: TCheckBox
            Left = 619
            Top = 134
            Width = 113
            Height = 17
            Caption = 'Imprime Cheque'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
        end
      end
      object tbsPrevidenciario: TTabSheet
        Caption = 'Previdenciário'
        ImageIndex = 1
        object dbgRateio: TwwDBGrid
          Left = 0
          Top = 57
          Width = 608
          Height = 341
          Selected.Strings = (
            'DESCPATROORIG'#9'16'#9'Patroc. de Origem'#9'F'
            'DESCPATRODEST'#9'16'#9'Patroc. de Destino'#9'F'
            'DESCPLANOPREVORIG'#9'14'#9'Plano de Origem'#9'F'
            'DESCPLANOPREVDEST'#9'15'#9'Plano de Destino'#9'F'
            'VALOR'#9'16'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRateios
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object pnlDadosRateio: TPanel
          Left = 0
          Top = 0
          Width = 749
          Height = 57
          Align = alTop
          BevelInner = bvLowered
          BorderWidth = 1
          TabOrder = 1
          object Label4: TLabel
            Left = 11
            Top = 8
            Width = 73
            Height = 13
            Caption = 'Patrocinador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 315
            Top = 8
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 607
            Top = 8
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label2: TLabel
            Left = 11
            Top = 64
            Width = 138
            Height = 13
            Caption = 'Patrocinador de Destino'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label9: TLabel
            Left = 315
            Top = 64
            Width = 183
            Height = 13
            Caption = 'Plano Previdenciário de Destino'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object dblcPatrocinadorOrigem: TwwDBLookupCombo
            Left = 11
            Top = 24
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'RAZAOSOCIAL'#9'60'#9'Razão Social'#9'F')
            LookupTable = cdsPatrocinador
            LookupField = 'IDPESSOA'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcPlanoPrevOrigem: TwwDBLookupCombo
            Left = 315
            Top = 24
            Width = 278
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'NOME')
            LookupTable = cdsPlanoPrev
            LookupField = 'IDPLANOPREV'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object redValorRateio: TRealEdit
            Left = 607
            Top = 24
            Width = 126
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            OnKeyDown = redValorRateioKeyDown
            IntDigits = 17
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object dblcPatrocinadorDestino: TwwDBLookupCombo
            Left = 11
            Top = 80
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'RAZAOSOCIAL'#9'60'#9'Razão Social'#9'F')
            LookupTable = cdsPatrocinador
            LookupField = 'IDPESSOA'
            TabOrder = 2
            Visible = False
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcPlanoPrevDestino: TwwDBLookupCombo
            Left = 315
            Top = 80
            Width = 278
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'NOME')
            LookupTable = cdsPlanoPrev
            LookupField = 'IDPLANOPREV'
            TabOrder = 3
            Visible = False
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object pnlBotoesRateio: TPanel
          Left = 608
          Top = 57
          Width = 141
          Height = 341
          Align = alRight
          BevelInner = bvLowered
          BorderWidth = 1
          TabOrder = 2
          object Label10: TLabel
            Left = 15
            Top = 296
            Width = 82
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Valor Rateado'
          end
          object btnIncluirRateio: TBitBtn
            Left = 24
            Top = 16
            Width = 94
            Height = 33
            Caption = '&Incluir'
            Default = True
            TabOrder = 0
            OnClick = btnIncluirRateioClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888887777888888888888FFFF88888888888000078
              88888888887777F888888888880CC07888888888887F87F888888888880CC078
              88888888887F87F888888887770CC0777778888FFF7F87FFFFF88800000CC000
              007888777778877777F8880CCCCCCCCCC078887F8888888887F8880CCCCCCCCC
              C078887FFFFF88FFF7F88800000CC00000888877777F877777888888880CC078
              88888888887F87F888888888880CC07888888888887F87F888888888880CC078
              88888888887FF7F8888888888800008888888888887777888888888888888888
              8888888888888888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
          object btnExcluirRateio: TBitBtn
            Left = 24
            Top = 56
            Width = 94
            Height = 33
            Caption = '&Excluir'
            Default = True
            TabOrder = 1
            OnClick = btnExcluirRateioClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888888888888
              8888888888888888888888888888888888888888888888888888888888888888
              888888888888888888888887777777777778888FFFFFFFFFFFF8880000000000
              007888777777777777F88809999999999078887F8888888887F8880999999999
              9078887FFFFFFFFFF7F888000000000000888877777777777788888888888888
              8888888888888888888888888888888888888888888888888888888888888888
              8888888888888888888888888888888888888888888888888888888888888888
              8888888888888888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
          object redRateado: TRealEdit
            Left = 14
            Top = 312
            Width = 114
            Height = 21
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            OnKeyDown = redValorRateioKeyDown
            IntDigits = 17
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 427
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsContaOrigem: TwwDataSource
    DataSet = cdsContaOrigem
    Left = 40
    Top = 152
  end
  object dsContaDestino: TwwDataSource
    DataSet = cdsContaDestino
    Left = 424
    Top = 152
  end
  object cdsContaOrigem: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsContaOrigemAfterScroll
    Left = 40
    Top = 136
  end
  object cdsContaDestino: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsContaOrigemAfterScroll
    Left = 424
    Top = 136
  end
  object cdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 368
  end
  object cdsTipoRec: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 320
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 88
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 232
    Top = 136
  end
  object cdsHistorico: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 288
  end
  object dsRateios: TDataSource
    DataSet = cdsRateios
    OnDataChange = dsRateiosDataChange
    Left = 584
    Top = 112
  end
  object cdsRateios: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPATROORIG'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREVORIG'
        DataType = ftFloat
      end
      item
        Name = 'DESCPATROORIG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCPLANOPREVORIG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDPATRODEST'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREVDEST'
        DataType = ftFloat
      end
      item
        Name = 'DESCPATRODEST'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCPLANOPREVDEST'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsContaOrigemAfterScroll
    Left = 584
    Top = 96
  end
  object spRateios: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0 AS IDPATROORIG,'
      '   0 AS IDPLANOPREVORIG,'
      '   '#39'12345678901234567890'#39' AS DescPatroOrig,'
      '   '#39'12345678901234567890'#39' AS DescPlanoPrevOrig,'
      '   0 AS IDPATRODEST,'
      '   0 AS IDPLANOPREVDEST,'
      '   '#39'12345678901234567890'#39' AS DescPatroDest,'
      '   '#39'12345678901234567890'#39' AS DescPlanoPrevDest,'
      '   0 AS VALOR'
      'FROM PARAMFINANC'
      'WHERE (1=2)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsRateios
    Left = 704
    Top = 431
  end
  object cdsTipoDes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 368
  end
end
