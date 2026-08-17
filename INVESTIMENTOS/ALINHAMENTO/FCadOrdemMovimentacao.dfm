inherited frmOrdemMovimentacao: TfrmOrdemMovimentacao
  Left = 168 
  Top = 123
  HelpContext = 790274
  Caption = 'Cadastro de Ordens de Movimentação'
  ClientHeight = 453
  ClientWidth = 772
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 330
    Top = 84
    Width = 113
    Height = 13
    Caption = 'Carteira                :'
  end
  inherited pnlFundo: TPanel
    Width = 772
    Height = 367
    object Label1: TLabel
      Left = 10
      Top = 17
      Width = 113
      Height = 13
      Caption = 'Data de Operação :'
    end
    object Label2: TLabel
      Left = 10
      Top = 45
      Width = 113
      Height = 13
      Caption = 'Carteira                :'
    end
    object Label4: TLabel
      Left = 10
      Top = 72
      Width = 111
      Height = 13
      Caption = 'Sigla da Corretora :'
    end
    object Label5: TLabel
      Left = 439
      Top = 102
      Width = 105
      Height = 13
      Caption = 'Nº do Documento:'
      FocusControl = dbDocumento
    end
    object lblAcao: TLabel
      Left = 439
      Top = 44
      Width = 106
      Height = 13
      Caption = 'Ação                  :'
    end
    object Label7: TLabel
      Left = 10
      Top = 101
      Width = 111
      Height = 13
      Caption = 'Tipo de Operação :'
    end
    object Label8: TLabel
      Left = 439
      Top = 69
      Width = 104
      Height = 13
      Caption = 'Bolsa de Valores :'
    end
    object lblOpcao: TLabel
      Left = 439
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Opção                :'
      Visible = False
    end
    object dblCarteira: TwwDBLookupCombo
      Left = 126
      Top = 41
      Width = 304
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'35'#9'Descrição')
      LookupTable = QryBuscaCarteira
      LookupField = 'ID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblCarteiraExit
    end
    object dblSiglaCorretora: TwwDBLookupCombo
      Left = 125
      Top = 69
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCORRETVALORES'#9'40'#9'Descrição')
      LookupTable = QryCorretValores
      LookupField = 'IDCORRETVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblCarteiraExit
    end
    object dbDocumento: TDBEdit
      Left = 546
      Top = 98
      Width = 208
      Height = 21
      DataField = 'NUMDOCMOVINV'
      DataSource = DsDetalhe
      TabOrder = 6
      OnKeyUp = dbDocumentoKeyUp
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 126
      Width = 770
      Height = 240
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 7
      object TabSheet1: TTabSheet
        Caption = 'Informações Contábeis '
        TabVisible = False
        object dbgOperacao: TwwDBGrid
          Left = 1
          Top = 88
          Width = 675
          Height = 142
          Selected.Strings = (
            'HORAMOV'#9'5'#9'Hora'
            'SGLCUSTODIANTE'#9'20'#9'Custodiante'
            'QTDEORDENADA'#9'20'#9'Quantidade Negociada'
            'PUORDMOVINV'#9'20'#9'Preço'
            'VALOR'#9'22'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = dbgOperacaoRowChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = DsDetalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnColExit = dbgOperacaoColExit
          OnEnter = dbgOperacaoEnter
          OnExit = dbgOperacaoExit
          OnKeyDown = dbgOperacaoKeyDown
          OnKeyUp = dbgOperacaoKeyUp
          IndicatorColor = icYellow
          object dbgOperacaoIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object Dock977: TDock97
          Left = 0
          Top = 0
          Width = 762
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
              Enabled = False
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
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 56
          Top = 112
          Width = 145
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCUSTODIANTE'#9'11'#9'Descrição')
          DataField = 'IDCUSTODIANTE'
          DataSource = DsDetalhe
          LookupTable = QryBuscaCustodiante
          LookupField = 'IDCUSTODIANTE'
          Options = [loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object dbgSelecao: TDBGrid
          Left = 1
          Top = 31
          Width = 704
          Height = 37
          Color = clInfoBk
          DataSource = DsDetalhe
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clGray
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCCARTINVEST'
              Title.Alignment = taCenter
              Title.Caption = 'Carteira'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 232
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGLCORRETVALORES'
              Title.Caption = 'Corretora'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLATIPOOPER'
              Title.Caption = 'Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLAACAOBOLSA'
              Title.Caption = 'Ação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGLBOLSAVALORES'
              Title.Caption = 'Bolsa de Valores'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 123
              Visible = True
            end>
        end
        object Dock978: TDock97
          Left = 677
          Top = 31
          Width = 85
          Height = 199
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
              OnClick = BtCancDetClick
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
    object dbDtaOperacao: TCMDateTimePicker
      Left = 125
      Top = 13
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
      OnExit = dbDtaOperacaoExit
    end
    object dblBolsa: TwwDBLookupCombo
      Left = 546
      Top = 69
      Width = 208
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'15'#9'Sigla da Bolsa')
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblBolsaExit
    end
    object dblOperacao: TwwDBLookupCombo
      Left = 125
      Top = 98
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Descrição')
      LookupTable = QryBuscaOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblOperacaoExit
    end
    object dblAcao: TwwDBLookupCombo
      Left = 546
      Top = 40
      Width = 208
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAACAOBOLSA'#9'15'#9'Código de Negociação'#9'F')
      LookupTable = QryInvestimentoAcao
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblAcaoExit
    end
    object Panel1: TPanel
      Left = 5
      Top = 200
      Width = 677
      Height = 25
      BevelInner = bvLowered
      Caption = 'Movimentação'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object dblkOpcao: TwwDBLookupCombo
      Left = 546
      Top = 12
      Width = 208
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'60'#9'Opção'#9'F')
      LookupTable = qryOpcao
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 9
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblkOpcaoExit
    end
  end
  inherited Dock972: TDock97
    Width = 772
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnOpercoesDireito: TToolbarButton97
        Left = 307
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Importa '
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333FF333333333333300333333333
          33333773FF33333333333090033333333333373773FF33333333330990033333
          3333337F3773FF33333333099990033333333373F33773FFF333333099999007
          33333337F33337773333333099999903333333373F3333733333333309999033
          333333337F3337F333333333099990733333333373F3F77F3333333330900907
          3333333337F77F77F33333333003709073333333377377F77F33333337333709
          073333333733377F77F33333333333709033333333333377F7F3333333333337
          0733333333333337773333333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnOpercoesDireitoClick
      end
      object sbtnRelatorio: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Relatório'
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
        OnClick = sbtnRelatorioClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 772
    object Label9: TLabel [0]
      Left = 10
      Top = 2
      Width = 79
      Height = 13
      Caption = 'Qtde. do Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [1]
      Left = 111
      Top = 2
      Width = 69
      Height = 13
      Caption = 'Qtde.  Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel [2]
      Left = 423
      Top = 2
      Width = 107
      Height = 13
      Caption = 'Total da Operação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [3]
      Left = 267
      Top = 2
      Width = 82
      Height = 13
      Caption = 'Qtde. Prevista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 600
      DockPos = 602
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 431
      DockPos = 433
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Visible = False
      end
    end
    object rQtdLote: TRealEdit
      Left = 8
      Top = 16
      Width = 91
      Height = 19
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '0')
      ParentFont = False
      TabOrder = 2
      WordWrap = False
      OnKeyPress = EliminaDigitacao
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object rQtdAtual: TRealEdit
      Left = 112
      Top = 16
      Width = 142
      Height = 19
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 3
      WordWrap = False
      OnKeyPress = EliminaDigitacao
      IntDigits = 18
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object rTotalOperacao: TRealEdit
      Left = 423
      Top = 16
      Width = 155
      Height = 19
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 4
      WordWrap = False
      OnKeyPress = EliminaDigitacao
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object rQtdPrevista: TRealEdit
      Left = 266
      Top = 16
      Width = 142
      Height = 19
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 5
      WordWrap = False
      OnKeyPress = EliminaDigitacao
      IntDigits = 18
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 320
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 291
    Top = 54
  end
  inherited upd: TUpdateSQL
    Left = 319
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TRUNC(ORDMOVINV.DATAORDMOVINV) AS DATAORDMOVINV'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'CORRETVALORES.SGLCORRETVALORES'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'ACOESXBOLSA.SIGLAACAOBOLSA'
      'ORDMOVINV.NUMDOCMOVINV'
      'BOLSAVALORES.SGLBOLSAVALORES'
      'CARTEIRAGERENC.DESCCARTGERENC ')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data da Operação'
      'Carteira de Investimentos'
      'Sigla da Corretora'
      'Operação'
      'Ação'
      'Código do Ativo'
      'Nº do Documento:'
      'Bolsa de Valores'
      'Carteira Gerencial')
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
      'ORDMOVINV'
      'CARTEIRAINVEST'
      'CORRETVALORES'
      'INVESTIMENTO'
      'TIPOOPERACAO'
      'BOLSAVALORES'
      'CARTEIRAGERENC'
      'ACOESXBOLSA')
    CamposChave.Strings = (
      'TRUNC(ORDMOVINV.DATAORDMOVINV)'
      'ORDMOVINV.IDCARTEIRAINVEST'
      'ORDMOVINV.IDCORRETVALORES'
      'ORDMOVINV.IDTIPOOPERACAO'
      'ORDMOVINV.IDINVESTIMENTO'
      'ORDMOVINV.IDBOLSAVALORES '
      'ORDMOVINV.NUMDOCMOVINV'
      'ORDMOVINV.IDCARTEIRAGERENC')
    Filtro.Strings = (
      'ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVEST(+)'
      'ORDMOVINV.IDCORRETVALORES  = CORRETVALORES.IDCORRETVALORES(+)'
      'ORDMOVINV.IDINVESTIMENTO   = INVESTIMENTO.IDINVESTIMENTO(+)'
      'ORDMOVINV.IDTIPOOPERACAO   = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'ORDMOVINV.IDBOLSAVALORES   = BOLSAVALORES.IDBOLSAVALORES(+)'
      'ORDMOVINV.IDTIPOINVEST    <> 8'
      'ORDMOVINV.IDCARTEIRAGERENC = CARTEIRAGERENC.IDCARTEIRAGERENC(+)'
      'ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAGERENC.IDCARTEIRAINVEST(+)'
      'ACOESXBOLSA.IDACAO = INVESTIMENTO.IDINVESTIMENTO'
      'ACOESXBOLSA.IDEMISSOR = INVESTIMENTO.IDEMISSOR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '20'
      '20'
      '30'
      '20'
      '10'
      '20'
      '40')
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
    LookupSQL.Strings = (
      ''
      ''
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
      ''
      ''
      '')
    Left = 371
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 330
    Top = 2
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
      FF00000084000000000000008400000000000000000084848400FFFFFF0000FF
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
      FF0000000000008400000084840000000000848484000000FF00000084000000
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
    Left = 340
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIP' +
        'OINVEST,'
      #9'IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO,'
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      #9'MOECODIGO, IDCARTORIDEST, IDLOTE, IDMODULO, IDINVESTDEST,'
      '                IDORDMOVINV, IDCUSTORIG, IDCUSTDEST,VLRIR'
      ''
      'FROM OPERACAOINVEST'
      ''
      'WHERE IDOPERACAOINVEST = -1')
    Left = 263
    Top = 54
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS ID, IDCARTEIRAINV' +
        'EST, NULL AS IDCARTEIRAGERENC,'
      '             DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE (IDTIPOINVEST = 2) OR (IDTIPOINVEST IS NULL)'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS ID,'
      '             CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      '             CG.DESCCARTGERENC AS DESCCARTINVEST'
      'FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND CI.IDCARTEIRAINVEST = 1'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 385
    Top = 76
    object QryBuscaCarteiraID: TStringField
      FieldName = 'ID'
      Size = 4
    end
    object QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryBuscaCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCORRETVALORES,'
      '     SGLCORRETVALORES'
      'FROM'
      '      CORRETVALORES'
      'WHERE'
      '     FLGATIVARV='#39'S'#39
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 385
    Top = 105
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.IDCORRETVALORES'
    end
    object QryCorretValoresSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Origin = 'BASEDADOS.CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct QTDELOTE FROM ACOESXBOLSA')
    ValidateWithMask = True
    Left = 704
    Top = 2
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    AfterOpen = QryDetalheAfterOpen
    BeforePost = QryDetalheBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  ORDMOVINV.IDORDMOVINV ,'
      '  ORDMOVINV.IDCORRETVALORES,'
      '  ORDMOVINV.IDINVESTIMENTO,'
      '  ORDMOVINV.PUORDMOVINV,'
      '  ORDMOVINV.OBSMOVINV,'
      '  ORDMOVINV.DATAORDMOVINV,'
      '  ORDMOVINV.QTDEORDMOVINV,'
      '  ORDMOVINV.NUMDOCMOVINV,'
      '  ORDMOVINV.STATMOVINV,'
      '  ORDMOVINV.IDUSUARIO,'
      '  ORDMOVINV.IDAUTORIZACAO,'
      '  ORDMOVINV.TRGDTINCLUSAO,'
      '  ORDMOVINV.TRGUSERINCLUSAO,'
      '  ORDMOVINV.IDTIPOINVEST,'
      '  ORDMOVINV.IDTIPOOPERACAO,'
      '  ORDMOVINV.OBSAUTMOV,'
      '  ORDMOVINV.IDCARTEIRAINVEST,'
      '  ORDMOVINV.IDCARTEIRAGERENC,'
      '  ORDMOVINV.IDLOTE,'
      '  ORDMOVINV.IDBOLSAVALORES,'
      '  ORDMOVINV.IDCUSTODIANTE,'
      '  ORDMOVINV.QTDEORDENADA,'
      '  ORDMOVINV.DATAAUTORIZACAO,'
      '  ORDMOVINV.IDPLANPREVCTBPATR,'
      '  '#39'00:00'#39' AS HORAMOV,'
      '  0 AS VALOR,'
      '  CARTEIRAINVEST.DESCCARTINVEST,'
      '  CORRETVALORES.SGLCORRETVALORES,'
      '  TIPOOPERACAO.DESCTIPOOPERACAO,'
      '  TIPOOPERACAO.SIGLATIPOOPER,'
      '  INVESTIMENTO.DESCINVESTIMENTO,'
      '  BOLSAVALORES.SGLBOLSAVALORES,'
      '  TIPOOPERACAO.NATUREZAOPERACAO,'
      '  ACOESXBOLSA.SIGLAACAOBOLSA'
      'FROM'
      
        '  ORDMOVINV, CARTEIRAINVEST, CORRETVALORES, INVESTIMENTO, BOLSAV' +
        'ALORES, TIPOOPERACAO, ACOESXBOLSA'
      'WHERE'
      
        ' CARTEIRAINVEST.IDCARTEIRAINVEST = ORDMOVINV.IDCARTEIRAINVEST AN' +
        'D'
      
        ' CORRETVALORES.IDCORRETVALORES   = ORDMOVINV.IDCORRETVALORES  AN' +
        'D'
      
        ' INVESTIMENTO.IDINVESTIMENTO     = ORDMOVINV.IDINVESTIMENTO   AN' +
        'D'
      
        ' BOLSAVALORES.IDBOLSAVALORES     = ORDMOVINV.IDBOLSAVALORES   AN' +
        'D'
      
        ' TIPOOPERACAO.IDTIPOOPERACAO     = ORDMOVINV.IDTIPOOPERACAO   AN' +
        'D'
      
        ' ORDMOVINV.IDTIPOINVEST          <> 8                         AN' +
        'D'
      
        ' ACOESXBOLSA.IDEMISSOR = INVESTIMENTO.IDEMISSOR               AN' +
        'D'
      ' ACOESXBOLSA.IDACAO    = INVESTIMENTO.IDINVESTIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDetalhe
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 128
    Top = 176
    object QryDetalheHORAMOV: TStringField
      DisplayLabel = 'Hora'
      DisplayWidth = 5
      FieldName = 'HORAMOV'
      Size = 5
    end
    object QryDetalheSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SGLCUSTODIANTE'
      LookupDataSet = QryBuscaCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 40
      Lookup = True
    end
    object QryDetalheQTDEORDENADA: TFloatField
      DisplayLabel = 'Quantidade Negociada'
      DisplayWidth = 20
      FieldName = 'QTDEORDENADA'
      Origin = 'ORDMOVINV.QTDEORDENADA'
      DisplayFormat = '###,###,###,###'
    end
    object QryDetalhePUORDMOVINV: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 20
      FieldName = 'PUORDMOVINV'
      Origin = 'ORDMOVINV.PUORDMOVINV'
      DisplayFormat = '###,###,###,########0.00000000'
    end
    object QryDetalheVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 22
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryDetalheQTDEORDMOVINV: TFloatField
      DisplayLabel = 'Quantidade Negociada'
      DisplayWidth = 18
      FieldName = 'QTDEORDMOVINV'
      Origin = 'ORDMOVINV.QTDEORDMOVINV'
      Visible = False
    end
    object S: TFloatField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryDetalheIDORDMOVINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDMOVINV'
      Origin = 'ORDMOVINV.IDORDMOVINV'
      Visible = False
    end
    object QryDetalheIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'ORDMOVINV.IDCORRETVALORES'
      Visible = False
    end
    object v: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'ORDMOVINV.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheOBSMOVINV: TStringField
      DisplayWidth = 200
      FieldName = 'OBSMOVINV'
      Origin = 'ORDMOVINV.OBSMOVINV'
      Visible = False
      Size = 200
    end
    object QryDetalheDATAORDMOVINV: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAORDMOVINV'
      Origin = 'ORDMOVINV.DATAORDMOVINV'
      Visible = False
    end
    object QryDetalheNUMDOCMOVINV: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCMOVINV'
      Origin = 'ORDMOVINV.NUMDOCMOVINV'
      Visible = False
      Size = 30
    end
    object QryDetalheSTATMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'STATMOVINV'
      Origin = 'ORDMOVINV.STATMOVINV'
      Visible = False
      Size = 1
    end
    object QryDetalheIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'ORDMOVINV.IDUSUARIO'
      Visible = False
    end
    object QryDetalheIDAUTORIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAUTORIZACAO'
      Origin = 'ORDMOVINV.IDAUTORIZACAO'
      Visible = False
    end
    object QryDetalheTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'ORDMOVINV.TRGDTINCLUSAO'
      Visible = False
    end
    object QryDetalheTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'ORDMOVINV.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'ORDMOVINV.IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'ORDMOVINV.IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheOBSAUTMOV: TStringField
      DisplayWidth = 200
      FieldName = 'OBSAUTMOV'
      Origin = 'ORDMOVINV.OBSAUTMOV'
      Visible = False
      Size = 200
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'ORDMOVINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Origin = 'ORDMOVINV.IDLOTE'
      Visible = False
      Size = 10
    end
    object QryDetalheDATAAUTORIZACAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAAUTORIZACAO'
      Origin = 'ORDMOVINV.DATAAUTORIZACAO'
      Visible = False
    end
    object QryDetalheIDBOLSAVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Visible = False
    end
    object QryDetalheDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object QryDetalheSGLCORRETVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Visible = False
      Size = 10
    end
    object QryDetalheDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryDetalheDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryDetalheSGLBOLSAVALORES: TStringField
      DisplayWidth = 10
      FieldName = 'SGLBOLSAVALORES'
      Visible = False
      Size = 10
    end
    object QryDetalheSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object QryDetalheNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryDetalheIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object QryDetalheSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Visible = False
      Size = 10
    end
  end
  object DsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 156
    Top = 176
  end
  object QryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT I.IDINVESTIMENTO, I.DESCINVESTIMENTO, A.SIGLAACA' +
        'OBOLSA, I.IDTIPOINVEST, I.IDEMISSOR, I.STAOPCAO,'
      
        '       '#39#39' AS STATPAMERICANA, '#39#39' AS STAOPCCOMPRA, TO_DATE(NULL,'#39'D' +
        'D/MM/YYYY'#39') AS DTAVENCTO, 0 AS IDINVESTBASE'
      'FROM INVESTIMENTO I, ACOESXBOLSA A'
      'WHERE (I.IDTIPOINVEST = 2)'
      
        '  AND ( ( (:IDINVESTIMENTO IS NOT NULL) AND (I.IDINVESTIMENTO = ' +
        ':IDINVESTIMENTO)) OR'
      '        (:IDINVESTIMENTO IS NULL) )'
      
        '  AND ( ( (:STAOPCAO IS NULL) AND ( (I.STAOPCAO = '#39'N'#39') OR (STAOP' +
        'CAO IS NULL) ) ) OR'
      '        ( (:STAOPCAO IS NOT NULL) AND ( 1 = 2 )))'
      '  AND (A.IDACAO = I.IDINVESTIMENTO)'
      '  AND (A.IDEMISSOR = I.IDEMISSOR)'
      ''
      'UNION ALL'
      ''
      
        'SELECT DISTINCT I.IDINVESTIMENTO, I.DESCINVESTIMENTO, A.SIGLAACA' +
        'OBOLSA, I.IDTIPOINVEST, I.IDEMISSOR, I.STAOPCAO,'
      
        '       O.STATPAMERICANA, O.STAOPCCOMPRA, O.DTAVENCTO, O.IDINVEST' +
        'BASE'
      'FROM OPCOES O, INVESTIMENTO I, ACOESXBOLSA A'
      'WHERE (O.IDTIPOOPCAO = 2)'
      '  AND ( (O.DTAVENCTO >= TO_DATE(:DTAVENCTO,'#39'DD/MM/YYYY'#39')) OR'
      '        (O.DTAVENCTO IS NULL) )'
      
        '  AND ( ( (:STAOPCCOMPRA IS NOT NULL) AND (O.STAOPCCOMPRA = :STA' +
        'OPCCOMPRA) ) OR'
      '        (:STAOPCCOMPRA IS NULL) )'
      '  AND ( (:STAOPCAO IS NOT NULL ) AND (1 = 1))'
      '  AND ( O.IDINVESTIMENTO = I.IDINVESTIMENTO)'
      '  AND (A.IDACAO = I.IDINVESTIMENTO)'
      '  AND (A.IDEMISSOR = I.IDEMISSOR)'
      ''
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 710
    Top = 73
    ParamData = <
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
      end
      item
        DataType = ftString
        Name = 'STAOPCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAOPCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTAVENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAOPCCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAOPCCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAOPCCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STAOPCAO'
        ParamType = ptUnknown
      end>
    object QryInvestimentoAcaoSIGLAACAOBOLSA: TStringField
      DisplayLabel = 'Código de Negociação'
      DisplayWidth = 15
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object QryInvestimentoAcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryInvestimentoAcaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryInvestimentoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object QryInvestimentoAcaoSTAOPCAO: TStringField
      FieldName = 'STAOPCAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryInvestimentoAcaoSTATPAMERICANA: TStringField
      FieldName = 'STATPAMERICANA'
      Visible = False
      Size = 1
    end
    object QryInvestimentoAcaoSTAOPCCOMPRA: TStringField
      FieldName = 'STAOPCCOMPRA'
      Visible = False
      Size = 1
    end
    object QryInvestimentoAcaoDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Visible = False
    end
    object QryInvestimentoAcaoIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Visible = False
    end
  end
  object QryTotalOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 474
    Top = 2
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDMOVINV'
      'set'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  PUORDMOVINV = :PUORDMOVINV,'
      '  OBSMOVINV = :OBSMOVINV,'
      '  DATAORDMOVINV = :DATAORDMOVINV,'
      '  QTDEORDMOVINV = :QTDEORDMOVINV,'
      '  NUMDOCMOVINV = :NUMDOCMOVINV,'
      '  STATMOVINV = :STATMOVINV,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDAUTORIZACAO = :IDAUTORIZACAO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  OBSAUTMOV = :OBSAUTMOV,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDLOTE = :IDLOTE,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  QTDEORDENADA = :QTDEORDENADA,'
      '  DATAAUTORIZACAO = :DATAAUTORIZACAO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    InsertSQL.Strings = (
      'insert into ORDMOVINV'
      '  (IDORDMOVINV, IDCORRETVALORES, IDINVESTIMENTO, PUORDMOVINV, '
      'OBSMOVINV, '
      '   DATAORDMOVINV, QTDEORDMOVINV, NUMDOCMOVINV, STATMOVINV, '
      'IDUSUARIO, IDAUTORIZACAO, '
      
        '   TRGDTINCLUSAO, TRGUSERINCLUSAO, IDTIPOINVEST, IDTIPOOPERACAO,' +
        ' '
      'OBSAUTMOV, '
      '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDLOTE, IDBOLSAVALORES, '
      'IDCUSTODIANTE, '
      '   QTDEORDENADA, DATAAUTORIZACAO, IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDORDMOVINV, :IDCORRETVALORES, :IDINVESTIMENTO, :PUORDMOVINV' +
        ', '
      ':OBSMOVINV, '
      '   :DATAORDMOVINV, :QTDEORDMOVINV, :NUMDOCMOVINV, :STATMOVINV, '
      ':IDUSUARIO, '
      
        '   :IDAUTORIZACAO, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :IDTIPOINVE' +
        'ST, '
      ':IDTIPOOPERACAO, '
      '   :OBSAUTMOV, :IDCARTEIRAINVEST, :IDCARTEIRAGERENC, :IDLOTE, '
      ':IDBOLSAVALORES, '
      '   :IDCUSTODIANTE, :QTDEORDENADA, :DATAAUTORIZACAO, '
      ':IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from ORDMOVINV'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    Left = 100
    Top = 176
  end
  object QrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, '
      #9'IDEMISSOR, DATAULTOPERACAO, NOVODIREITO, NUMCLIENTECORRET '
      ''
      'FROM OPRACAO '
      ''
      'WHERE IDOPERACAOINVEST =:IDOPERACAOINVEST')
    UpdateObject = updSubTipo
    ValidateWithMask = True
    Left = 589
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 617
    Top = 176
  end
  object updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update OPRACAO'
      'set'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDACAO = :IDACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  DATAULTOPERACAO = :DATAULTOPERACAO,'
      '  NOVODIREITO = :NOVODIREITO,'
      '  NUMCLIENTECORRET = :NUMCLIENTECORRET'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPRACAO'
      '  (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR, '
      'DATAULTOPERACAO, '
      '   NOVODIREITO, NUMCLIENTECORRET)'
      'values'
      '  (:IDOPERACAOINVEST, :IDBOLSAVALORES, :IDACAO, :IDEMISSOR, '
      ':DATAULTOPERACAO, '
      '   :NOVODIREITO, :NUMCLIENTECORRET)')
    DeleteSQL.Strings = (
      'delete from OPRACAO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 561
    Top = 176
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES, SGLBOLSAVALORES, MOECODIGO, IDCUSTODIANTE'
      'FROM'
      '   BOLSAVALORES'
      'WHERE'
      
        '   (((:IDBOLSAVALORES IS NOT NULL) AND (IDBOLSAVALORES <> :IDBOL' +
        'SAVALORES )) OR (:IDBOLSAVALORES IS NULL))'
      'ORDER BY SGLBOLSAVALORES'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 712
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 15
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
    object QryBolsaValoresMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BOLSAVALORES.MOECODIGO'
      Visible = False
    end
    object QryBolsaValoresIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BOLSAVALORES.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryBuscaCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CUS.IDCUSTODIANTE, CUS.SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE CUS'
      ''
      'ORDER BY CUS.SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 93
    Top = 341
    object QryBuscaCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 11
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryBuscaCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryNumDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.NUMDOCMOVINV'
      'FROM ORDMOVINV O, TIPOOPERACAO T'
      
        'WHERE ((:DATAORDMOVINV IS NULL) OR (O.DATAORDMOVINV LIKE TO_DATE' +
        '(:DATAORDMOVINV,'#39'DD/MM/YYYY'#39')))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      
        '  AND ((:IDCORRETVALORES IS NULL) OR (O.IDCORRETVALORES = :IDCOR' +
        'RETVALORES))'
      
        '  AND ((:FLGCONTAINVEST IS NULL) OR (T.FLGCONTAINVEST = :FLGCONT' +
        'AINVEST))'
      '  AND (O.NUMDOCMOVINV IS NOT NULL)'
      '  AND (O.IDTIPOOPERACAO = T.IDTIPOOPERACAO)')
    ValidateWithMask = True
    Left = 725
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptResult
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTAINVEST'
        ParamType = ptResult
      end>
    object QryNumDocumentoNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
  end
  object qryOrdMovInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     TI.NATUREZAOPERACAO'
      'FROM'
      '     ORDMOVINV OM, TIPOOPERACAO TI'
      'WHERE'
      '  (OM.IDORDMOVINV =:IDORDMOVINV)       AND'
      '  (OM.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)')
    ValidateWithMask = True
    Left = 639
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDORDMOVINV'
        ParamType = ptUnknown
      end>
  end
  object QryVerOperDayTrade: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT TP.DESCTIPOOPERACAO,OM.IDINVESTIMENTO'
      'FROM   ORDMOVINV OM, TIPOOPERACAO TP'
      
        'WHERE TRUNC(OM.DATAORDMOVINV) = TO_DATE(:DATAORDMOVINV,'#39'DD/MM/YY' +
        'YY'#39')'
      '  AND OM.IDINVESTIMENTO       = :IDINVESTIMENTO'
      '  AND OM.IDTIPOOPERACAO      <> :IDTIPOOPERACAO'
      '  AND TP.NATUREZAOPERACAO    <> :NATUREZAOPERACAO'
      '  AND TP.IDTIPOOPERACAO       = OM.IDTIPOOPERACAO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 548
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptResult
      end>
    object QryVerOperDayTradeDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryVerOperDayTradeIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
  object QryBuscaOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  TP.IDTIPOOPERACAO, TP.SIGLATIPOOPER, TP.NATUREZAOPERACAO' +
        ',TP.TIPOCUSTODIA,'
      
        '        TP.FLGTRATAIR, TP.IDMERCADO, TP.DESCTIPOOPERACAO, TP.VEN' +
        'CIMENTO,'
      '        PAR.IDTIPOOPERLIQPEND, TP.FLGCONTAINVEST'
      'FROM TIPOOPERACAO TP, PARAMINVEST PAR'
      'WHERE (TP.IDTIPOINVEST = 2)'
      '  AND ((TP.IDTIPOOPERACAO > 0) OR'
      
        '       (TP.IDTIPOOPERACAO IN (-72,-73,-74,-75,-76,-77,-78,-79,-8' +
        '0,-81,-82,-83)))'
      '  AND ((:IDMERCADO IS NULL) OR (TP.IDMERCADO = :IDMERCADO))'
      
        '  AND ((:IDMERCADOOPC IS NULL) OR (TP.IDMERCADO <> :IDMERCADOOPC' +
        '))'
      
        '  AND ((PAR.IDTIPOOPERLIQPEND IS NULL) OR (TP.IDTIPOOPERACAO <> ' +
        'PAR.IDTIPOOPERLIQPEND))'
      '  AND ((TP.FLGOPDIREITO <> '#39'S'#39') OR (TP.FLGOPDIREITO IS NULL))'
      '  AND ((TP.FLGOPGERENC <> '#39'S'#39') OR (TP.FLGOPGERENC IS NULL))'
      '  AND (TP.STAATIVO = '#39'S'#39')'
      'ORDER BY TP.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 385
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADOOPC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADOOPC'
        ParamType = ptResult
      end>
    object QryBuscaOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryBuscaOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object QryBuscaOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryBuscaOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object QryBuscaOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object QryBuscaOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object QryBuscaOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object QryBuscaOperacaoIDTIPOOPERLIQPEND: TFloatField
      FieldName = 'IDTIPOOPERLIQPEND'
    end
    object QryBuscaOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
  end
  object qryOpcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT I.IDINVESTIMENTO, I.DESCINVESTIMENTO,'
      '   I.IDTIPOINVEST, I.IDEMISSOR, I.STAOPCAO, '
      '   OP.STATPAMERICANA, OP.STAOPCCOMPRA, OP.DTAVENCTO,'
      '   OP.IDINVESTBASE, OP.VLRPRECOEX'
      'FROM'
      '   INVESTIMENTO I, OPCOES OP'
      'WHERE'
      '   (I.IDTIPOINVEST = 2) AND'
      '   (STAOPCAO = '#39'S'#39') AND'
      
        '   ((OP.STAOPCCOMPRA = :STAOPCCOMPRA) OR (OP.STAOPCCOMPRA IS NUL' +
        'L)) AND'
      '   (I.IDINVESTIMENTO = OP.IDINVESTIMENTO(+)) AND'
      
        '   ((OP.DTAVENCTO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')) OR (OP.DTAV' +
        'ENCTO IS NULL))'
      'ORDER BY I.DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 711
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'STAOPCCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object qryOpcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Opção'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOpcaoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryOpcaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryOpcaoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryOpcaoSTAOPCAO: TStringField
      DisplayWidth = 1
      FieldName = 'STAOPCAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoSTATPAMERICANA: TStringField
      DisplayWidth = 1
      FieldName = 'STATPAMERICANA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoSTAOPCCOMPRA: TStringField
      DisplayWidth = 1
      FieldName = 'STAOPCCOMPRA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOpcaoDTAVENCTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTAVENCTO'
      Visible = False
    end
    object qryOpcaoIDINVESTBASE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTBASE'
      Visible = False
    end
    object qryOpcaoVLRPRECOEX: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRPRECOEX'
      Visible = False
    end
  end
  object qryBuscaLoteOpcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   DISTINCT IDLOTE '
      'FROM '
      '   ORDMOVINV '
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) '
      '   AND (IDCORRETVALORES = :IDCORRETVALORES)'
      '   AND (IDBOLSAVALORES = :IDBOLSAVALORES) ')
    ValidateWithMask = True
    Left = 373
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object qryBuscaLoteOpcoesIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.ORDMOVINV.IDLOTE'
      Size = 10
    end
  end
  object QryVerQtdLancada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    (SUM(DECODE(TI.NATUREZAOPERACAO,'#39'A'#39',OD.QTDEORDMOVINV,'
      #9#9'DECODE(TI.NATUREZAOPERACAO,'#39'V'#39',OD.QTDEORDMOVINV,'
      #9#9#9'DECODE(TI.NATUREZAOPERACAO,'#39'U'#39',OD.QTDEORDMOVINV,'
      #9#9#9#9'DECODE(TI.NATUREZAOPERACAO,'#39'M'#39',OD.QTDEORDMOVINV))))) -'
      ''
      '     SUM(DECODE(TI.NATUREZAOPERACAO,'#39'D'#39',OD.QTDEORDMOVINV,'
      #9#9'DECODE(TI.NATUREZAOPERACAO,'#39'S'#39',OD.QTDEORDMOVINV,'
      #9#9#9'DECODE(TI.NATUREZAOPERACAO,'#39'O'#39',OD.QTDEORDMOVINV,'
      
        '   '#9#9#9'                DECODE(TI.NATUREZAOPERACAO,'#39'R'#39',OD.QTDEORDM' +
        'OVINV,'
      
        '     '#9#9#9#9'                DECODE(TI.NATUREZAOPERACAO,'#39'I'#39',OD.QTDEO' +
        'RDMOVINV))))))) AS TOTALOPERADO'
      'FROM'
      '     ORDMOVINV OD, TIPOOPERACAO TI'
      'WHERE'
      '        (((:IDCARTEIRAINVEST IS NOT NULL)             AND'
      '        (OD.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))    OR'
      '          (:IDCARTEIRAINVEST IS NULL) )               AND'
      ''
      '        (((:IDCARTEIRAGERENC IS NOT NULL)             AND'
      '        (OD.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      '         ((:IDCARTEIRAGERENC IS NULL)                 AND'
      '        (OD.IDCARTEIRAGERENC IS NULL) ) )             AND'
      ''
      
        '  (TRUNC(OD.DATAORDMOVINV) = TO_DATE(:DATAORDMOVINV,'#39'DD/MM/YYYY'#39 +
        ')) AND'
      ''
      
        '        (OD.IDINVESTIMENTO = :IDINVESTIMENTO)                   ' +
        '   AND'
      ''
      '        (TI.IDTIPOOPERACAO = OD.IDTIPOOPERACAO)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 253
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
  end
end
