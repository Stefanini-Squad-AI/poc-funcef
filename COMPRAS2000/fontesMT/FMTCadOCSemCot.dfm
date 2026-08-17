inherited FrmMTCadOCSemCot: TFrmMTCadOCSemCot
  Left = 166
  Top = 141
  HelpContext = 1130013
  Caption = 'O.C. sem Cotação'
  ClientHeight = 455
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 31
    Width = 665
    Height = 369
    inherited pnlMestre: TPanel
      Width = 663
      Height = 113
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label13: TLabel
        Left = 160
        Top = 64
        Width = 45
        Height = 13
        Caption = 'Contato'
      end
      object cmpForn: TCMProcuraForCli
        Left = 16
        Top = 8
        Width = 457
        Height = 50
        Caption = ' Fornecedor '
        TabOrder = 0
        OnExit = cmpFornExit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object edDataOC: TCMDateTimePicker
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAOC'
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
      object RgFrete: TDBRadioGroup
        Left = 480
        Top = 8
        Width = 137
        Height = 50
        Caption = ' Frete '
        DataField = 'FLGTIPOFRETE'
        DataSource = ds
        Items.Strings = (
          'CIF'
          'FOB')
        TabOrder = 2
        Values.Strings = (
          '1'
          '0')
      end
      object edContato: TDBEdit
        Left = 160
        Top = 80
        Width = 457
        Height = 21
        DataField = 'CONTATO'
        DataSource = ds
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 114
      Width = 663
      Height = 254
      Tabs.Strings = (
        'Itens da O.C.'
        'Prazo de Entrega'
        'Prazo de Pagamento'
        'Custos Agregados'
        'Observação')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 565
        Height = 195
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 557
            Height = 167
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Código'
            end
            object Label6: TLabel
              Left = 160
              Top = 8
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label8: TLabel
              Left = 160
              Top = 56
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object Label4: TLabel
              Left = 8
              Top = 56
              Width = 75
              Height = 13
              Caption = 'Qtde. Pedida'
            end
            object Label9: TLabel
              Left = 272
              Top = 56
              Width = 34
              Height = 13
              Caption = 'Preço'
            end
            object Label10: TLabel
              Left = 8
              Top = 104
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dblcItem: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODARTIGO'#9'14'#9'Código'
                'DESCRICAO'#9'50'#9'Descrição')
              LookupTable = cdsArtigo
              LookupField = 'CHAVE'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object dblcDesc: TwwDBLookupCombo
              Left = 160
              Top = 24
              Width = 353
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'45'#9'Descrição'#9'F'
                'NUMSOLCOMPRA'#9'10'#9'SCI'#9'F')
              LookupTable = cdsArtigo
              LookupField = 'CHAVE'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcDescCloseUp
            end
            object dblcUN: TwwDBLookupCombo
              Left = 160
              Top = 72
              Width = 97
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = cdsUnidMed
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edQtdePed: TDBRealEdit
              Left = 8
              Top = 72
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '    0,0000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEPEDIDA'
              DataSource = dsDet
            end
            object edPreco: TDBRealEdit
              Left = 272
              Top = 72
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '    0,0000')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORUN'
              DataSource = dsDet
            end
            object memObsItem: TDBMemo
              Left = 8
              Top = 120
              Width = 505
              Height = 49
              DataField = 'OBSITEMOC'
              DataSource = dsDet
              MaxLength = 200
              TabOrder = 5
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 557
            Height = 167
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'
              'DESCRICAO'#9'30'#9'Descrição'
              'QTDEPEDIDA'#9'10'#9'Quant. Pedida'
              'CODMEDIDA'#9'4'#9'Unidade'
              'VALORUN'#9'10'#9'Preço')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            UseTFields = False
          end
        end
        object TabPrazoEnt: TTabSheet
          Caption = 'TabPrazoEnt'
          ImageIndex = 1
          OnEnter = BtnLimpaEntClick
          object Label15: TLabel
            Left = 8
            Top = 64
            Width = 33
            Height = 13
            Caption = 'Prazo'
          end
          object Label16: TLabel
            Left = 96
            Top = 88
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 8
            Top = 120
            Width = 94
            Height = 13
            Caption = 'Data de Entrega'
          end
          object Label3: TLabel
            Left = 8
            Top = 16
            Width = 94
            Height = 13
            Caption = 'Quant. Entregue'
          end
          object plnPrazoEnt: TPanel
            Left = 187
            Top = 0
            Width = 370
            Height = 167
            Align = alRight
            BevelOuter = bvLowered
            Caption = 'plnPrazoEnt'
            TabOrder = 3
            TabStop = True
            object plnOpEnt: TPanel
              Left = 1
              Top = 1
              Width = 48
              Height = 165
              Align = alLeft
              TabOrder = 0
              TabStop = True
              object btnAddPrazoEnt: TBitBtn
                Left = 8
                Top = 48
                Width = 33
                Height = 33
                Hint = 'Adiciona Registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = btnAddPrazoEntClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                  66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                  66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                  660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object BtnDelPrazoEnt: TBitBtn
                Left = 8
                Top = 96
                Width = 33
                Height = 33
                Hint = 'Remove registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BtnDelPrazoEntClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                  66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                  66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                  660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object BtnLimpaEnt: TBitBtn
                Left = 8
                Top = 144
                Width = 33
                Height = 33
                Hint = 'Limpar comtroles'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = BtnLimpaEntClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777087777
                  777777000000777770D0877777777700000077770DD508777777770000007770
                  DD805087777777000000770DD8DD050877777700000070DD8DDDD05087777700
                  000070D8DDDDDD05087777000000708DDDDDDDD0608777000000770DDDDDDDDD
                  0608770000007770DDDDDDD8E0608700000077770DDDDD8E6E06070000007777
                  70DDD8E6E6E0070000007777770D8E6E6E6E0700000077777770E6E6E6E07700
                  0000777777770E6E6E07770000007777777770E6E0777700000077777777770E
                  077777000000777777777770777777000000}
              end
            end
            object wwDBGrid2: TwwDBGrid
              Left = 49
              Top = 1
              Width = 320
              Height = 165
              Selected.Strings = (
                'QTDEENTREGA'#9'10'#9'Qtde. Entrega'#9'F'
                'PRAZOENTREGA'#9'10'#9'Prazo em dias'#9'F'
                'DATAENTREGA'#9'10'#9'Data Entrega'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsPrazoEntOC
              TabOrder = 1
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
          end
          object edQtdeEnt: TRealEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edPrazoEnt: TRealEdit
            Left = 8
            Top = 80
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 1
            WordWrap = False
            OnExit = edPrazoEntExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object edDataEnt: TCMDateTimePicker
            Left = 8
            Top = 136
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
        end
        object TabPrazoPag: TTabSheet
          Caption = 'TabPrazoPag'
          ImageIndex = 2
          OnEnter = BtnLimpaPagClick
          object Label22: TLabel
            Left = 8
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Percentagem (%)'
          end
          object Label20: TLabel
            Left = 8
            Top = 64
            Width = 33
            Height = 13
            Caption = 'Prazo'
          end
          object Label21: TLabel
            Left = 96
            Top = 88
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 8
            Top = 120
            Width = 113
            Height = 13
            Caption = 'Data de Pagamento'
          end
          object plnPrazoPag: TPanel
            Left = 187
            Top = 0
            Width = 370
            Height = 167
            Align = alRight
            BevelOuter = bvLowered
            TabOrder = 3
            TabStop = True
            object plnOpBar: TPanel
              Left = 1
              Top = 1
              Width = 48
              Height = 157
              Align = alLeft
              TabOrder = 0
              TabStop = True
              object BtnAddPag: TBitBtn
                Left = 8
                Top = 48
                Width = 33
                Height = 33
                Hint = 'Adiciona Registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BtnAddPagClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                  66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                  66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                  660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object btnDelPag: TBitBtn
                Left = 8
                Top = 96
                Width = 33
                Height = 33
                Hint = 'Remove registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnDelPagClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                  66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                  66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                  660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object BtnLimpaPag: TBitBtn
                Left = 8
                Top = 144
                Width = 33
                Height = 33
                Hint = 'Limpar comtroles'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = BtnLimpaPagClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777087777
                  777777000000777770D0877777777700000077770DD508777777770000007770
                  DD805087777777000000770DD8DD050877777700000070DD8DDDD05087777700
                  000070D8DDDDDD05087777000000708DDDDDDDD0608777000000770DDDDDDDDD
                  0608770000007770DDDDDDD8E0608700000077770DDDDD8E6E06070000007777
                  70DDD8E6E6E0070000007777770D8E6E6E6E0700000077777770E6E6E6E07700
                  0000777777770E6E6E07770000007777777770E6E0777700000077777777770E
                  077777000000777777777770777777000000}
              end
            end
            object GrdPrazoPag: TwwDBGrid
              Left = 49
              Top = 1
              Width = 320
              Height = 157
              Selected.Strings = (
                'PERCPAGTO'#9'10'#9'Percentual'#9'F'
                'PRAZOPGTO'#9'10'#9'Prazo em dias'#9'F'
                'DATAPAGTO'#9'10'#9'Data Pagamento'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsPrazoPagOC
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
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
          end
          object edPercPag: TRealEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edPrazoPag: TRealEdit
            Left = 8
            Top = 80
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 1
            WordWrap = False
            OnExit = edPrazoPagExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object edDataPag: TCMDateTimePicker
            Left = 8
            Top = 136
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
        end
        object TabValAgreg: TTabSheet
          Caption = 'TabValAgreg'
          ImageIndex = 3
          OnEnter = btnLimpaAgregClick
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 91
            Height = 13
            Caption = 'Custo Agregado'
          end
          object Label11: TLabel
            Left = 8
            Top = 104
            Width = 93
            Height = 13
            Caption = 'Base de Cálculo'
          end
          object LbValPerc: TLabel
            Left = 8
            Top = 56
            Width = 47
            Height = 13
            Caption = 'Aliquota'
          end
          object Label12: TLabel
            Left = 8
            Top = 152
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object plnAgreg: TPanel
            Left = 98
            Top = 0
            Width = 459
            Height = 167
            Align = alRight
            BevelOuter = bvLowered
            Caption = 'plnAgreg'
            TabOrder = 4
            TabStop = True
            object PlnOPAgreg: TPanel
              Left = 1
              Top = 1
              Width = 48
              Height = 165
              Align = alLeft
              TabOrder = 0
              TabStop = True
              object btnAddAgreg: TBitBtn
                Left = 8
                Top = 48
                Width = 33
                Height = 33
                Hint = 'Adiciona Registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = btnAddAgregClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                  66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                  66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                  660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object btnDelAgreg: TBitBtn
                Left = 8
                Top = 96
                Width = 33
                Height = 33
                Hint = 'Remove registro'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnDelAgregClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                  66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                  66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                  660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
              end
              object btnLimpaAgreg: TBitBtn
                Left = 8
                Top = 144
                Width = 33
                Height = 33
                Hint = 'Limpar comtroles'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btnLimpaAgregClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777087777
                  777777000000777770D0877777777700000077770DD508777777770000007770
                  DD805087777777000000770DD8DD050877777700000070DD8DDDD05087777700
                  000070D8DDDDDD05087777000000708DDDDDDDD0608777000000770DDDDDDDDD
                  0608770000007770DDDDDDD8E0608700000077770DDDDD8E6E06070000007777
                  70DDD8E6E6E0070000007777770D8E6E6E6E0700000077777770E6E6E6E07700
                  0000777777770E6E6E07770000007777777770E6E0777700000077777777770E
                  077777000000777777777770777777000000}
              end
            end
            object wwDBGrid1: TwwDBGrid
              Left = 49
              Top = 1
              Width = 409
              Height = 165
              Selected.Strings = (
                'DESCCUSTAGREG'#9'25'#9'Descrição'#9'F'
                'ALIQUOTA'#9'10'#9'Aliquota'#9'F'
                'BASECALCULO'#9'10'#9'Base'#9'F'
                'VLRAGREGITEM'#9'10'#9'Valor'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              BorderStyle = bsNone
              DataSource = dsAgregItemOC
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
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
          end
          object dblcAgreg: TCMDBLookupCombo
            Left = 8
            Top = 24
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Descrição')
            LookupTable = cdsAgreg
            LookupField = 'CODTIPOCUSTAGREG'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dblcAgregCloseUp
          end
          object edBase: TRealEdit
            Left = 8
            Top = 120
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edAliquota: TRealEdit
            Left = 8
            Top = 72
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            OnExit = edAliquotaExit
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edValor: TRealEdit
            Left = 8
            Top = 168
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object TabOBS: TTabSheet
          Caption = 'TabOBS'
          ImageIndex = 4
          object memObsOC: TDBMemo
            Left = 0
            Top = 0
            Width = 549
            Height = 159
            Align = alClient
            DataField = 'OBSOC'
            DataSource = ds
            MaxLength = 250
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 655
      end
      inherited Dock974: TDock97
        Left = 569
        Height = 195
      end
    end
  end
  inherited Dock972: TDock97
    Width = 696
    object Label5: TLabel [0]
      Left = 496
      Top = 16
      Width = 63
      Height = 16
      Caption = 'O.C.  Nº :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
      end
      object btnCopiaPrazo: TToolbarButton97
        Left = 246
        Top = 0
        Width = 91
        Height = 41
        AllowAllUp = True
        GroupIndex = -1
        Caption = 'C&opiar Prazos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777FFFFFFFFF7777770000000007777777888888888F777777877777
          77077777778F7777778F7777778FFFFFF7077777778F7777778F7777778FCCCC
          F70777FFFF8F7777778F7000008FFFFFF7077888888F7777778F7877778FCCCC
          F70778F7778F7777778F78FFFF8FFFFFF70778F7778F7777FF8F78FCCC8FCCF0
          000778F7778F7778888778FFFF8FFFF7F87778F7778F7778F87778FCCC8FFFF7
          877778F7778FFFF8877778FFFF888888777778F777888888777778FCCCCF7077
          777778F7777778F7777778FFFFFF7077777778F7777778F7777778FFFFFF7077
          777778FFFFFFF8F7777778888888887777777888888888777777}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = btnCopiaPrazoClick
      end
    end
    object edNumOC: TDBEdit
      Left = 560
      Top = 16
      Width = 113
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NUMOC'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 524
      DockPos = 639
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130013
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 355
      DockPos = 470
    end
  end
  object plnArt: TPanel [3]
    Left = 0
    Top = 47
    Width = 31
    Height = 369
    Align = alLeft
    BevelInner = bvLowered
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    object LbArt: TfcLabel
      Left = 2
      Top = 2
      Width = 27
      Height = 365
      Align = alClient
      Caption = 'Artigo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Rotation = 90
      TextOptions.VAlignment = vaTop
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 778
    Top = 65519
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 382
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 704
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 88
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OC.NUMOC'
      'ITEMOC.CODARTIGO'
      
        'SUBSTR(DECODE(ITEMOC.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI.D' +
        'ESCPRODVARI),1,60)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº da O.C.'
      'Código do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OC'
      'ITEMOC'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'OC.NUMOC')
    Filtro.Strings = (
      'OC.NUMOC = ITEMOC.NUMOC '
      'ITEMOC.CODARTIGO = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO'
      'ITEMOC.IDPRODVARI = PRODVARI.IDPRODVARI(+)'
      '(OC.FLGCOMSEMCOT = '#39'S'#39') OR (OC.FLGCOMSEMCOT IS NULL)'
      '(OC.FLGCOMSEMOC = '#39'C'#39')  OR (OC.FLGCOMSEMOC IS NULL)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '14'
      '40')
    Left = 479
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 132
    Top = 170
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsItemOC
    OnDataChange = dsDetDataChange
    Left = 214
    Top = 170
  end
  object cdsItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 9
  end
  object cdsSCItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 104
  end
  object cdsAgregItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 48
  end
  object cdsPrazoPagOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 72
  end
  object cdsPrazoEntOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 32
  end
  object cdsAgreg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 361
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 360
  end
  object cdsUnidMed: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 361
  end
  object dsPrazoEntOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoEntOC
    Left = 496
    Top = 131
  end
  object dsPrazoPagOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoPagOC
    Left = 413
    Top = 138
  end
  object dsAgregItemOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsAgregItemOC
    Left = 584
    Top = 136
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 622
    Top = 332
  end
end
