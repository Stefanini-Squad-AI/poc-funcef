inherited frmRubricasIndividuaisEmLote: TfrmRubricasIndividuaisEmLote
  Left = 328
  Top = 202
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Rubricas em Lote'
  ClientHeight = 434
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 395
    object pgc: TPageControl
      Left = 1
      Top = 1
      Width = 495
      Height = 393
      ActivePage = tabOpcoes
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = pgcChange
      object tabOpcoes: TTabSheet
        Caption = 'Opções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object Label1: TLabel
          Left = 9
          Top = 252
          Width = 69
          Height = 13
          Caption = 'Observação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 16
          Width = 331
          Height = 54
          Caption = 'Arquivo de Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnAbrirArquivo: TSpeedButton
            Left = 213
            Top = 18
            Width = 28
            Height = 27
            Hint = 'Seleciona Arquivo'
            Glyph.Data = {
              56070000424D5607000000000000360400002800000028000000140000000100
              0800000000002003000000000000000000000001000000010000000000000000
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
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              030303030303030303FFFFFFFFFFFFFFFFFFFFFFFFFFFF0303030303F8000000
              00000000000000000000030303030303F8F8F8F8F8F8F8F8F8F8F8F8F8F803FF
              03030303000007FB07FB07FB07FB07FB07FB000303030303F8F803FF03030303
              030303030303F8FF0303030300FF0007FB07FB07FB07FB07FB07000303030303
              F8FFF8FF03030303030303030303F803FF03030300FB00FB07FB07FB07FB07FB
              07FB070003030303F8FFF803FF03030303030303030303F8FF03030300FFFB00
              FB07FB07FB07FB07FB07FB0003030303F8FF03F8FF03030303030303030303F8
              03FF030300FBFF0007FB07FB07FB07FB07FB07FB00030303F8FF03F803FFFFFF
              FFFF030303030303F8FF030300FFFBFF000000000007FB07FB07FB0700030303
              F8FF0303F8F8F8F8F803FFFFFFFFFFFFF803030300FBFFFBFFFBFFFBFF000000
              0000000003030303F8FF03030303030303F8F8F8F8F8F8F80303030300FFFBFF
              FBFFFBFFFBFFFBFFFB00030303030303F8FF0303030303030303030303F8FF03
              0303030300FBFFFBFFFBFFFBFFFBFFFBFF00030303030303F8FF0303030303FF
              FFFFFFFFFFF803030303030300FFFBFFFBFF0000000000000003030303030303
              F807FFFFFFFFF8F8F8F8F8F8F803030303030303030000000000030303030303
              030303030303030303F8F8F8F8F8030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303}
            NumGlyphs = 2
            OnClick = btnAbrirArquivoClick
          end
          object btnValidarArquivo: TToolbarButton97
            Left = 246
            Top = 15
            Width = 79
            Height = 33
            Hint = 'Validar Arquivo'
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Validar Arquivo'
            Flat = False
            Glyph.Data = {
              6E020000424D6E02000000000000760000002800000036000000120000000100
              040000000000F801000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777FFFFFF777777777777777777777770077777770000007777777
              777FF888888F7777777777777777777777007777700111111077017777F88777
              77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
              7777004444440770470077701119999911111177F877F88888F777F877704444
              4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
              47007701197777777111117F87F87777777877F870444C77777C444447007700
              0977777711111177888877777F8FFFF87044C777777744444700777777777779
              99999977FFFFF777788888887000C77777744444470070000007777777777778
              888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
              7777888800000077777777777700704444C7777777044C7877778777777F87F8
              011111C77777700097007044440077777044C778777788FFFFF8778701111C77
              7777701197007044444400000444C7787FF7778888877F870111100777770119
              7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
              7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
              C777777777777888888777777977991111119977770077777777777777777777
              777777777777777777777799999977777700}
            HighlightWhenDown = False
            NumGlyphs = 3
            Opaque = False
            WordWrap = True
            OnClick = btnValidarArquivoClick
          end
          object edtArquivo: TEdit
            Left = 8
            Top = 21
            Width = 201
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 346
          Top = 16
          Width = 137
          Height = 54
          Caption = ' Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object edtReferencia: TMaskEdit
            Left = 24
            Top = 20
            Width = 81
            Height = 21
            EditMask = '!99/9999;1;_'
            MaxLength = 7
            TabOrder = 0
            Text = '  /    '
            OnClick = dblcRegraClick
            OnExit = edtReferenciaExit
          end
        end
        object grpRegra: TGroupBox
          Left = 8
          Top = 74
          Width = 331
          Height = 57
          Caption = 'Regra para Cálculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object dblcRegra: TwwDBLookupCombo
            Left = 9
            Top = 23
            Width = 314
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'65'#9'NOMEREGRA'#9'F')
            LookupTable = qryRegraCalculo
            LookupField = 'NOMEREGRA'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 20
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcRegraCloseUp
          end
        end
        object GroupBox4: TGroupBox
          Left = 347
          Top = 74
          Width = 137
          Height = 57
          Caption = ' Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object edtValor: TEdit
            Left = 8
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            OnClick = dblcRegraClick
            OnKeyPress = edtValorKeyPress
          end
        end
        object grpRubrica: TGroupBox
          Left = 8
          Top = 137
          Width = 331
          Height = 49
          Caption = 'Rubrica a Processar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object dblcRubrica: TwwDBLookupCombo
            Left = 9
            Top = 20
            Width = 314
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'65'#9'DESCRICAO'#9'F')
            LookupTable = qryRubrica
            LookupField = 'DESCRICAO'
            Options = [loColLines, loRowLines, loTitles]
            DropDownCount = 20
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcRubricaCloseUp
          end
        end
        object GroupBox6: TGroupBox
          Left = 8
          Top = 194
          Width = 331
          Height = 48
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object spbRecebedor: TSpeedButton
            Left = 275
            Top = 14
            Width = 25
            Height = 25
            Hint = 'Selecione um recebedor'
            Anchors = [akTop, akRight]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333333333333333333333333333333333FF333333333333
              3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
              E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
              E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
              E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
              000033333373FF77777733333330003333333333333777333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbRecebedorClick
          end
          object SpeedButton1: TSpeedButton
            Left = 302
            Top = 14
            Width = 25
            Height = 25
            Hint = 'Selecione um recebedor'
            Anchors = [akTop, akRight]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
              305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
              B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
              B0557777FF577777F7F500000E055550805577777F7555575755500000555555
              05555777775555557F5555000555555505555577755555557555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object edtFavorecido: TEdit
            Left = 10
            Top = 16
            Width = 258
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 347
          Top = 138
          Width = 137
          Height = 85
          Caption = ' Processamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label2: TLabel
            Left = 12
            Top = 20
            Width = 14
            Height = 13
            Caption = 'De'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 9
            Top = 52
            Width = 16
            Height = 13
            Caption = 'Até'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dtDe: TCMDateTimePicker
            Left = 32
            Top = 16
            Width = 97
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
            OnClick = dblcRegraClick
          end
          object dtAte: TCMDateTimePicker
            Left = 32
            Top = 48
            Width = 97
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
            OnClick = dblcRegraClick
          end
        end
        object mmoObs: TMemo
          Left = 8
          Top = 269
          Width = 473
          Height = 92
          Lines.Strings = (
            '')
          MaxLength = 500
          ScrollBars = ssVertical
          TabOrder = 7
          OnClick = dblcRegraClick
        end
      end
      object tabResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object mmResultado: TMemo
          Left = 0
          Top = 0
          Width = 487
          Height = 365
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 497
    inherited tb97Fundo: TToolbar97
      Left = 325
      DockPos = 472
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
      DockPos = 201
      inherited bbtnConfirmar: TBitBtn
        Caption = 'OK'
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = 'Cancelar'
        OnClick = bbtnCancelarClick
      end
    end
    object bbtnProcessar: TBitBtn
      Left = 62
      Top = 1
      Width = 84
      Height = 34
      Caption = 'Processar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnProcessarClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
    end
    object bbtnDesfazer: TBitBtn
      Left = 151
      Top = 2
      Width = 84
      Height = 33
      Caption = 'Desfazer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnDesfazerClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
        0000333333338330000033333338803000003333338800300000333338809030
        0000333388099030000033388079703000003388099990300000388097979030
        0000330999999030000033307979703000003333099990300000333330979030
        0000333333099030000033333330703000003333333300300000333333333030
        00003333333333300000}
    end
    object bbtnSalvar: TBitBtn
      Left = 12
      Top = 2
      Width = 83
      Height = 33
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = 'S&alvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = bbtnSalvarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
    Top = 2
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryRegraCalculo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT R.IDREGRA, R.IDREGRA || '#39' - '#39' || R.NOMEREGRA NOMEREGRA '
      '  FROM REGRA R, TIPOREGRA T, GRUPOREGRA G '
      ' WHERE R.IDTIPOREGRA = T.IDTIPOREGRA'
      '   AND T.IDGRUPOREGRA = G.IDGRUPOREGRA'
      '   AND G.IDGRUPOREGRA = 4'
      '   AND T.IDTIPOREGRA = 100'
      ' ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 218
    Top = 1
    object qryRegraCalculoNOMEREGRA: TStringField
      DisplayWidth = 65
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Size = 103
    end
    object qryRegraCalculoIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object dsRegraCalculo: TDataSource
    DataSet = qryRegraCalculo
    Left = 302
    Top = 1
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsRegraCalculo
    SQL.Strings = (
      
        'SELECT P.IDPROVENTO, P.CODPROVDESC, P.CODPROVDESC || '#39' - '#39' || P.' +
        'DESCRICAO AS DESCRICAO, R.IDREGRA, FLGTPRUBRICA '
      '  FROM PROVDESC P, REGRAXRUBRICA R '
      ' WHERE P.IDPROVENTO = R.IDRUBRICA'
      '   AND FLGDESCONTO IN (0,1) '
      '   AND FLGESTADORUB IN ('#39'0'#39','#39'1'#39')'
      '   AND FLGTPRUBRICA LIKE '#39'%B%'#39
      '   AND R.IDREGRA = :IDREGRA   ')
    ValidateWithMask = True
    Left = 375
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDREGRA'
        ParamType = ptInput
      end>
    object qryRubricaDESCRICAO: TStringField
      DisplayWidth = 65
      FieldName = 'DESCRICAO'
      Size = 148
    end
    object qryRubricaIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Visible = False
    end
    object qryRubricaFLGTPRUBRICA: TStringField
      DisplayWidth = 15
      FieldName = 'FLGTPRUBRICA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryRubricaCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryRubricaIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
  end
  object dsRubrica: TDataSource
    DataSet = qryRubrica
    Left = 431
    Top = 1
  end
  object updRubicaIndiv: TUpdateSQL
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      
        '  (FLGUSAABONO, FLGANTECIPABONO, IDTITULAR, DATAINICIO, FLGBASEP' +
        'A, '
      'FLGANTECIPAABONOINSS, IDPESSOA, IDEMPRESA, NUMOCORRENCIAS, '
      
        'IDRUBRICA, SEQRUBRICAINDIV, IDFAVORECIDO,    IDREGRACALCULO, VAL' +
        'ORRUBRICA,'
      
        ' ANOMESINICIO, FLGPERMANENTE, PARCELAS,    FLGPERCENT, FLGTPRUBM' +
        'ANUT,'
      
        ' FLGPENSAOALIM, RUBRICAPROVENTOPA, DATAFINAL,    ANOMESREF, CODP' +
        'ORTFORMA,'
      
        ' FLGDESATIVADO, FLGUSADO, FLGCALCULACPMF, NUMPROCINSS,   FLGRETR' +
        'OACAO, '
      'IDRUBRICA13, IDRUBRICAPROVENTO13,IDSEQINTERNOFB,'
      'FLGCONTROLASALDO, FLGRUBRICARESGATE, VLRSALDOINICIAL, '
      'VLRTOTALPROC, MESCOMPREEM,'
      'SITUACAOAJ,OBSERVACAO, IDPLANOCONTABIL)'
      'values'
      
        '  (:FLGUSAABONO, :FLGANTECIPABONO, :IDTITULAR, :DATAINICIO, :FLG' +
        'BASEPA,'
      
        '   :FLGANTECIPAABONOINSS, :IDPESSOA, :IDEMPRESA, :NUMOCORRENCIAS' +
        ','
      
        ':IDRUBRICA,   :SEQRUBRICAINDIV, :IDFAVORECIDO, :IDREGRACALCULO, ' +
        ':VALORRUBRICA,'
      
        ':ANOMESINICIO,   :FLGPERMANENTE, :PARCELAS, :FLGPERCENT, :FLGTPR' +
        'UBMANUT,'
      
        ':FLGPENSAOALIM,   :RUBRICAPROVENTOPA, :DATAFINAL, :ANOMESREF, :C' +
        'ODPORTFORMA,'
      
        ':FLGDESATIVADO,   :FLGUSADO, :FLGCALCULACPMF, :NUMPROCINSS, :FLG' +
        'RETROACAO,'
      ':IDRUBRICA13,   :IDRUBRICAPROVENTO13, :IDSEQINTERNOFB,'
      ':FLGCONTROLASALDO, :FLGRUBRICARESGATE, :VLRSALDOINICIAL, '
      ':VLRTOTALPROC, :MESCOMPREEM,'
      ':SITUACAOAJ,:OBSERVACAO,:IDPLANOCONTABIL )')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 211
    Top = 315
  end
  object dsRubricaIndiv: TwwDataSource
    AutoEdit = False
    Left = 128
    Top = 315
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsRegraCalculo
    ValidateWithMask = True
    Left = 399
    Top = 313
  end
  object qryRubricaIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    DataSource = dsRegraCalculo
    SQL.Strings = (
      'SELECT *  FROM RUBRICAINDIV WHERE 1 = 2')
    UpdateObject = updRubicaIndiv
    ValidateWithMask = True
    Left = 47
    Top = 315
    object qryRubricaIndivIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDPESSOA'
    end
    object qryRubricaIndivIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDEMPRESA'
    end
    object qryRubricaIndivIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDRUBRICA'
    end
    object qryRubricaIndivNUMOCORRENCIAS: TFloatField
      FieldName = 'NUMOCORRENCIAS'
      Origin = 'BASEDADOS.RUBRICAINDIV.NUMOCORRENCIAS'
    end
    object qryRubricaIndivSEQRUBRICAINDIV: TFloatField
      FieldName = 'SEQRUBRICAINDIV'
      Origin = 'BASEDADOS.RUBRICAINDIV.SEQRUBRICAINDIV'
    end
    object qryRubricaIndivIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDFAVORECIDO'
    end
    object qryRubricaIndivIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDREGRACALCULO'
    end
    object qryRubricaIndivVALORRUBRICA: TFloatField
      FieldName = 'VALORRUBRICA'
      Origin = 'BASEDADOS.RUBRICAINDIV.VALORRUBRICA'
    end
    object qryRubricaIndivANOMESINICIO: TStringField
      FieldName = 'ANOMESINICIO'
      Origin = 'BASEDADOS.RUBRICAINDIV.ANOMESINICIO'
      FixedChar = True
      Size = 7
    end
    object qryRubricaIndivFLGPERMANENTE: TFloatField
      FieldName = 'FLGPERMANENTE'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGPERMANENTE'
    end
    object qryRubricaIndivPARCELAS: TFloatField
      FieldName = 'PARCELAS'
      Origin = 'BASEDADOS.RUBRICAINDIV.PARCELAS'
    end
    object qryRubricaIndivFLGPERCENT: TFloatField
      FieldName = 'FLGPERCENT'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGPERCENT'
    end
    object qryRubricaIndivFLGTPRUBMANUT: TStringField
      FieldName = 'FLGTPRUBMANUT'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGTPRUBMANUT'
      Size = 1
    end
    object qryRubricaIndivFLGPENSAOALIM: TFloatField
      FieldName = 'FLGPENSAOALIM'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGPENSAOALIM'
    end
    object qryRubricaIndivRUBRICAPROVENTOPA: TFloatField
      FieldName = 'RUBRICAPROVENTOPA'
      Origin = 'BASEDADOS.RUBRICAINDIV.RUBRICAPROVENTOPA'
    end
    object qryRubricaIndivDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.RUBRICAINDIV.DATAFINAL'
    end
    object qryRubricaIndivANOMESREF: TStringField
      FieldName = 'ANOMESREF'
      Origin = 'BASEDADOS.RUBRICAINDIV.ANOMESREF'
      Size = 7
    end
    object qryRubricaIndivTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.TRGDTINCLUSAO'
    end
    object qryRubricaIndivTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryRubricaIndivCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.RUBRICAINDIV.CODPORTFORMA'
    end
    object qryRubricaIndivIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDTITULAR'
    end
    object qryRubricaIndivDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.RUBRICAINDIV.DATAINICIO'
    end
    object qryRubricaIndivFLGBASEPA: TFloatField
      FieldName = 'FLGBASEPA'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGBASEPA'
    end
    object qryRubricaIndivFLGUSAABONO: TFloatField
      FieldName = 'FLGUSAABONO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGUSAABONO'
    end
    object qryRubricaIndivIDALIMENTADO: TFloatField
      FieldName = 'IDALIMENTADO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDALIMENTADO'
    end
    object qryRubricaIndivIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDLOTE'
    end
    object qryRubricaIndivFLGDESATIVADO: TFloatField
      FieldName = 'FLGDESATIVADO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGDESATIVADO'
    end
    object qryRubricaIndivFLGUSADO: TFloatField
      FieldName = 'FLGUSADO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGUSADO'
    end
    object qryRubricaIndivFLGCALCULACPMF: TFloatField
      FieldName = 'FLGCALCULACPMF'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGCALCULACPMF'
    end
    object qryRubricaIndivULTMESPREPARO: TStringField
      FieldName = 'ULTMESPREPARO'
      Origin = 'BASEDADOS.RUBRICAINDIV.ULTMESPREPARO'
      FixedChar = True
      Size = 7
    end
    object qryRubricaIndivVALORANTERIOR: TFloatField
      FieldName = 'VALORANTERIOR'
      Origin = 'BASEDADOS.RUBRICAINDIV.VALORANTERIOR'
    end
    object qryRubricaIndivIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDPROCESSO'
    end
    object qryRubricaIndivIDRUBRICA13: TFloatField
      FieldName = 'IDRUBRICA13'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDRUBRICA13'
    end
    object qryRubricaIndivIDRUBRICAPROVENTO13: TFloatField
      FieldName = 'IDRUBRICAPROVENTO13'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDRUBRICAPROVENTO13'
    end
    object qryRubricaIndivIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDMOTIVO'
    end
    object qryRubricaIndivIDLOTEREVISAO: TFloatField
      FieldName = 'IDLOTEREVISAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDLOTEREVISAO'
    end
    object qryRubricaIndivFLGANTECIPABONO: TFloatField
      FieldName = 'FLGANTECIPABONO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGANTECIPABONO'
    end
    object qryRubricaIndivIDSEQINTERNOFB: TFloatField
      FieldName = 'IDSEQINTERNOFB'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDSEQINTERNOFB'
    end
    object qryRubricaIndivNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.RUBRICAINDIV.NUMPROCINSS'
      Size = 15
    end
    object qryRubricaIndivIDMOVBENEF: TFloatField
      FieldName = 'IDMOVBENEF'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDMOVBENEF'
    end
    object qryRubricaIndivFLGCONTROLASALDO: TFloatField
      FieldName = 'FLGCONTROLASALDO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGCONTROLASALDO'
    end
    object qryRubricaIndivVLRSALDOINICIAL: TFloatField
      FieldName = 'VLRSALDOINICIAL'
      Origin = 'BASEDADOS.RUBRICAINDIV.VLRSALDOINICIAL'
    end
    object qryRubricaIndivVLRTOTALPROC: TFloatField
      FieldName = 'VLRTOTALPROC'
      Origin = 'BASEDADOS.RUBRICAINDIV.VLRTOTALPROC'
    end
    object qryRubricaIndivIDPLANOCONTABIL: TFloatField
      FieldName = 'IDPLANOCONTABIL'
      Origin = 'BASEDADOS.RUBRICAINDIV.IDPLANOCONTABIL'
    end
    object qryRubricaIndivFLGRETROACAO: TFloatField
      FieldName = 'FLGRETROACAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGRETROACAO'
    end
    object qryRubricaIndivTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.TRGDTALTERACAO'
    end
    object qryRubricaIndivTRGUSERALTERACAO: TStringField
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.TRGUSERALTERACAO'
      Size = 30
    end
    object qryRubricaIndivFLGANTECIPAABONOINSS: TFloatField
      FieldName = 'FLGANTECIPAABONOINSS'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGANTECIPAABONOINSS'
    end
    object qryRubricaIndivSITUACAOAJ: TStringField
      FieldName = 'SITUACAOAJ'
      Origin = 'BASEDADOS.RUBRICAINDIV.SITUACAOAJ'
      Size = 15
    end
    object qryRubricaIndivOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.RUBRICAINDIV.OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryRubricaIndivFLGRUBRICARESGATE: TFloatField
      FieldName = 'FLGRUBRICARESGATE'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGRUBRICARESGATE'
    end
    object qryRubricaIndivMESCOMPREEM: TStringField
      FieldName = 'MESCOMPREEM'
      Origin = 'BASEDADOS.RUBRICAINDIV.MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object qryRubricaIndivFLGRESGATEPARCELADO: TFloatField
      FieldName = 'FLGRESGATEPARCELADO'
      Origin = 'BASEDADOS.RUBRICAINDIV.FLGRESGATEPARCELADO'
    end
  end
  object dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 228
    Top = 93
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'CPF/CNPJ Favorecido'
      'Nome do Favorecido')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.NUMDOCUMENTO IS NOT NULL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 301
    Top = 315
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar arquivo'
    Left = 416
    Top = 96
  end
end
