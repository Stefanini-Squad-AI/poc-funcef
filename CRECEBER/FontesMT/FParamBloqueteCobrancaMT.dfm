inherited FrmParamBloqueteCobrancaMT: TFrmParamBloqueteCobrancaMT
  Left = 253
  Top = 125
  HelpContext = 40040
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emissão de Bloquetos e Cobrança Eletrônica'
  ClientHeight = 441
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 402
    object LblNumDocs: TLabel
      Left = 492
      Top = 149
      Width = 177
      Height = 13
      Caption = 'Documentos Para Impressão: 0'
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 49
      Width = 710
      Height = 92
      TabOrder = 2
      object Label1: TLabel
        Left = 11
        Top = 48
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object Label5: TLabel
        Left = 11
        Top = 10
        Width = 87
        Height = 13
        Caption = 'Tipo de Cliente'
      end
      object Label7: TLabel
        Left = 259
        Top = 10
        Width = 106
        Height = 13
        Caption = 'Sistema de Origem'
      end
      object Label6: TLabel
        Left = 261
        Top = 50
        Width = 127
        Height = 13
        Caption = 'Dt. Programada Inicial'
      end
      object Label8: TLabel
        Left = 408
        Top = 50
        Width = 120
        Height = 13
        Caption = 'Dt. Programada Final'
      end
      object dblkTipClie: TwwDBLookupCombo
        Left = 11
        Top = 25
        Width = 233
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDTIPOCLIENTE'
        LookupTable = CdsTipClie
        LookupField = 'IDTIPOCLIENTE'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLcPortadorCloseUp
      end
      object CmbTipoDoc: TwwDBLookupCombo
        Left = 11
        Top = 63
        Width = 232
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição')
        LookupTable = CdsTipoDoc
        LookupField = 'CODTIPDOC'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 300
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CMDBMODULO: TCMDBLookupCombo
        Left = 259
        Top = 24
        Width = 272
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'NOMEMODULO')
        LookupTable = CdsModulo
        LookupField = 'IDMODULO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object BtnSelDoc: TBitBtn
        Left = 540
        Top = 24
        Width = 162
        Height = 60
        Caption = '&Seleciona Documentos'
        TabOrder = 3
        OnClick = BtnSelDocClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object DTPKdtprogIni: TCMDateTimePicker
        Left = 260
        Top = 63
        Width = 127
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
        TabOrder = 4
      end
      object DTPKdtprogFim: TCMDateTimePicker
        Left = 405
        Top = 63
        Width = 127
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
        TabOrder = 5
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 9
      Width = 710
      Height = 42
      Caption = ' Tipo de Cobrança '
      TabOrder = 0
      object DbLcPortador: TwwDBLookupCombo
        Left = 13
        Top = 15
        Width = 516
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição')
        LookupTable = CdsBanco
        LookupField = 'CODPORTFORMA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLcPortadorCloseUp
      end
    end
    object PnlOwner: TPanel
      Left = 15
      Top = 170
      Width = 706
      Height = 223
      BevelOuter = bvNone
      TabOrder = 1
      object PageForma: TPageControl
        Left = 0
        Top = 0
        Width = 706
        Height = 223
        ActivePage = TbsBloq
        Align = alClient
        TabOrder = 0
        object TbsBloq: TTabSheet
          Caption = 'Bloqueto Pré Impresso'
          Enabled = False
          object PnlBloq: TPanel
            Left = 0
            Top = 0
            Width = 698
            Height = 195
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 6
              Top = 55
              Width = 151
              Height = 13
              Caption = 'Mensagem ( máx 5 linhas )'
            end
            object Label3: TLabel
              Left = 6
              Top = 8
              Width = 154
              Height = 13
              Caption = 'Instrução de Recebimento:'
            end
            object Label4: TLabel
              Left = 344
              Top = 8
              Width = 60
              Height = 13
              Caption = 'Juros/Dia:'
            end
            object RgAceite: TRadioGroup
              Left = 421
              Top = 3
              Width = 68
              Height = 47
              Caption = ' Aceite '
              ItemIndex = 1
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 0
            end
            object EdLocalPagto: TEdit
              Left = 7
              Top = 28
              Width = 329
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 40
              TabOrder = 1
              Text = 'PAGAVEL EM QUALQUER BANCO ATÉ O VENCIMENTO'
            end
            object MemoBloq: TMemo
              Left = 0
              Top = 81
              Width = 698
              Height = 114
              Align = alBottom
              ScrollBars = ssVertical
              TabOrder = 2
              OnExit = MemoBloqExit
            end
            object RedJuros: TRealEdit
              Left = 343
              Top = 28
              Width = 71
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
        end
        object TbsCobranca: TTabSheet
          Caption = 'Cobrança Eletrônica'
          Enabled = False
          object PnlCobr: TPanel
            Left = 0
            Top = 0
            Width = 698
            Height = 195
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object RgNossNum: TRadioGroup
              Left = 25
              Top = 63
              Width = 456
              Height = 41
              Caption = ' Nosso Número '
              Columns = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'Gerado Pelo Sistema no Envio'
                'Gerado Pelo Banco  no Retorno')
              ParentFont = False
              TabOrder = 1
            end
            object PnlArquivoGerado: TPanel
              Left = 0
              Top = 48
              Width = 698
              Height = 147
              Align = alBottom
              TabOrder = 2
              Visible = False
              object GridCobr: TwwDBGrid
                Left = 156
                Top = 1
                Width = 541
                Height = 145
                Selected.Strings = (
                  'CONTROLEREMESSA'#9'11'#9'Controle'
                  'DESCRICAO'#9'27'#9'Tipo Crobrança')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = DsQryEmitidos
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 0
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                IndicatorColor = icBlack
              end
              object Panel1: TPanel
                Left = 1
                Top = 1
                Width = 155
                Height = 145
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object LblGridCobr: TLabel
                  Left = 12
                  Top = 62
                  Width = 125
                  Height = 13
                  Caption = 'Arquivos Gerados em:'
                end
                object DataIni: TCMDateTimePicker
                  Left = 12
                  Top = 77
                  Width = 133
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
                end
                object BtnAlteraDocsEmit: TBitBtn
                  Left = 14
                  Top = 107
                  Width = 129
                  Height = 32
                  Caption = 'Visualiza Doc'#39's'
                  TabOrder = 1
                  OnClick = BtnAlteraDocsEmitClick
                  Glyph.Data = {
                    96010000424D9601000000000000760000002800000018000000180000000100
                    0400000000002001000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDDDDDDD8DDDDDDDDDDDDDDDDDDDDDD83DDDDDDDDDDDDDDDDDDDDD833DDDD
                    DDDDDDDDDDDDDDDD833BDDDDDDDDDDDDDDDDDDD833B3DDDDDDDDDDDDDDDDDDD0
                    3B3DDDDDDDD80000008DDD0F83DDDDDDD800F7F7F700D0F8DDDDDDDD807FBB7F
                    7F7F0F8DDDDDDDD807FBF7F7F7F7F08DDDDDDD807F7F7F7F7F7F7F0DDDDDD808
                    8888F78887F78808DDDDD0087F788F788F788870DD8DD087F7F7F7F788F887F0
                    D8DDD08F7F7F7F7F78888F70D8DDD088888887F7F888F7F0D8DDD08F7F888F7F
                    78887F70D88DD087F78887F788F887F0D8DDD0087F887F78887F8808DDDDDD80
                    8887F78887F7880DDDDDDDD80F7F7F7F7FBF708DDDDDDDDD80F7F7F7BBF708DD
                    DDDDDDDDD8007F7F7F008DDDDDDDDDDDDDD80000008DDDDDDDDD}
                end
                object RgOpcaoRemessa: TRadioGroup
                  Left = 8
                  Top = 9
                  Width = 139
                  Height = 53
                  Caption = ' Operação '
                  ItemIndex = 0
                  Items.Strings = (
                    '&Regerar Arquivo'
                    '&Alterar Remessa')
                  TabOrder = 2
                end
              end
            end
            object RgOrigem: TRadioGroup
              Left = 23
              Top = 4
              Width = 456
              Height = 41
              Caption = ' Origem do Arquivo '
              Columns = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'Novo Arquivo de Remessa'
                'Seleciona do Arquivo Gerado')
              ParentFont = False
              TabOrder = 0
              OnClick = RgOrigemClick
            end
          end
        end
      end
    end
    object chkUsuarioLogado: TCheckBox
      Left = 28
      Top = 147
      Width = 276
      Height = 17
      Caption = 'Documentos lançados pelo Usuário Logado'
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 734
    inherited tb97Fundo: TToolbar97
      Left = 369
      DockPos = 369
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 40040
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
      DockPos = 79
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 192
    Top = 356
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsQryEmitidos: TwwDataSource
    DataSet = CdsEmitidos
    Left = 319
    Top = 342
  end
  object DsBloquete: TwwDataSource
    DataSet = CdsBloquete
    Left = 142
    Top = 397
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 351
    Top = 132
  end
  object SqlTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a'
      ' WHERE a.RECPAG =  :RECPAG'
      ' and not exists (select 1 from UsuarioxTpdocto b'
      '  where b.idusuario=:idusuario and recpag=:recpag)'
      ' union SELECT CODTIPDOC,DESCRICAO'
      '  FROM TIPODOCRECPAG a'
      ' WHERE a.RECPAG =  :RECPAG and  exists'
      ' (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc'
      ' and b.idusuario=:idusuario and recpag=:recpag)'
      '  ORDER BY DESCRICAO')
    ClientDataSet = CdsTipoDoc
    Left = 407
    Top = 132
  end
  object SqlTipClie: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOCLIENTE, DESCRICAO FROM TIPOCLIENTE')
    ClientDataSet = CdsTipClie
    Left = 151
    Top = 92
  end
  object CdsTipClie: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 143
    Top = 92
  end
  object SqlAtualiza: TCMSqlParams
    ClientDataSet = CdsAtualiza
    Left = 351
    Top = 252
  end
  object CdsAtualiza: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 335
    Top = 252
  end
  object SqlMensagemBloqueto: TCMSqlParams
    ClientDataSet = CdsMensagemBloqueto
    Left = 591
    Top = 324
  end
  object CdsMensagemBloqueto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 583
    Top = 308
  end
  object SqlAlteradores: TCMSqlParams
    SQL.Strings = (
      'SELECT A.DESCRICAO, L.VALOR FROM'
      'TIPOALTERADOR A, LANCTODOCUM L'
      'WHERE'
      '(RECPAG = '#39'R'#39') AND'
      '(L.OPERACAO = 4) AND'
      '(A.IDPESSOA = :PIDEMPRESA) AND'
      '(L.CODDOCUMENTO BETWEEN :PCODINI AND :PCODFIM) AND'
      '(L.CODALTERADOR = A.CODALTERADOR)')
    ClientDataSet = CdsAlteradores
    Left = 359
    Top = 412
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 343
    Top = 412
  end
  object SqlBanco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PF.CODPORTFORMA,'
      '  PF.DESCRICAO,'
      '  PF.CODBLOQCHE,'
      '  PF.CODARQUIVOREMESSA,'
      '  PF.NOSSONUMERO,'
      '  PF.JUROSPORDIA,'
      '  PF.PRAZOPROTESTO,'
      '  PF.NUMEMPRESABANCO,'
      '  PC.CONTROLEREMESSA,'
      '  PF.PATHARQUIVOREM,'
      '  C.FLGIMPCONDENSADO,'
      '  PF.IDCONFIGBARRAS,'
      '  PF.CODPORTADOR'
      'FROM'
      '  PORTADORFORMA PF,'
      '  TEMPLBLOQCHEQUE C,'
      '  PORTADORCONTA PC'
      'WHERE'
      '  PF.RECPAG = :RECPAG AND'
      '  PF.CODBLOQCHE = C.CODBLOQCHE(+) AND'
      '  PF.IDPESSOA = :IDPESSOA AND'
      '  PC.CODPORTADOR = PF.CODPORTADOR'
      'ORDER BY'
      '  PF.DESCRICAO'
      ' '
      '')
    ClientDataSet = CdsBanco
    Left = 231
    Top = 172
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 180
  end
  object SqlBloquete: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    idforcli,'
      '    CEP,'
      '    CODESTADO,'
      '    CIDADE,'
      '    BAIRRO,'
      '    COMPLEMENTO,'
      '    NUMERO,'
      '    LOGRADOURO,'
      '    NUMDOCUMENTO,'
      '    NOME,'
      '    VALORDESCONTO,'
      '    DATALIMITE,'
      '    DATAPROGRAMADA,'
      '    CODPORTFORMA,'
      '    DATAVENCTO,'
      '    DATAEMISSAO,'
      '    NODOCUMENTO,'
      '    MOESIGLA,'
      '    CODDOCUMENTO,'
      '    TIPO,'
      '    NOSSONUMERO,'
      '    COMPLDOCUMENTO,'
      '    TIPOENDERECO,'
      '    NUMAGENCIA,'
      '    NUMCONTA,'
      '    VALORJUROS,'
      '    FLGGRUPO,'
      '    VALOR,'
      '    VALOROM,'
      '    NUMRAZAOCC,'
      '    IDTIPOCLIENTE,'
      '    CODTIPDOC,'
      '    IDMODULO,'
      '    IDUSUARIOINCLUSAO'
      'FROM'
      '   (SELECT'
      '       d.idforcli,'
      '       E.CEP,'
      '       ES.CODESTADO,'
      '       C.NOME AS CIDADE,'
      '       E.BAIRRO,'
      '       E.COMPLEMENTO,'
      '       E.NUMERO,'
      '       E.LOGRADOURO,'
      
        '       DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000' +
        '000'#39',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.' +
        'NUMDOCUMENTO)) AS NUMDOCUMENTO,'
      '       P.RAZAOSOCIAL AS NOME,'
      '       D.VALORDESCONTO,'
      '       D.DATALIMITE,'
      '       D.DATAPROGRAMADA,'
      '       D.CODPORTFORMA,'
      '       D.DATAVENCTO,'
      
        '       (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39') ) AS' +
        ' DATAEMISSAO,'
      '       D.NODOCUMENTO,'
      '       M.MOESIGLA,'
      '       D.CODDOCUMENTO,'
      '       P.TIPO,'
      '       D.NOSSONUMERO,'
      '       D.COMPLDOCUMENTO,'
      '       E.TIPOENDERECO,'
      '       AB.NUMAGENCIA,'
      '       PC.NOCONTACORR AS NUMCONTA,'
      '       F.JUROSPORDIA AS VALORJUROS,'
      '       ('#39'N'#39') AS FLGGRUPO,'
      '       SALDO.VALOR,'
      '       SALDO.VALOROM,'
      '       F.NUMRAZAOCC,'
      '       CP.IDTIPOCLIENTE,'
      '       D.CODTIPDOC,'
      '       D.IDMODULO,'
      '       D.IDUSUARIOINCLUSAO'
      '   FROM'
      '       ENDPESS E, CIDADES C, ESTADO ES,'
      '       (SELECT'
      
        '          D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L' +
        '.VALOR)) AS VALOR,'
      
        '          SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROU' +
        'TRAMOEDA)) AS VALOROM'
      '       FROM'
      
        '            LANCTODOCUM L,DOCUMENTO D  WHERE (D.CODDOCUMENTO = L' +
        '.CODDOCUMENTO) AND'
      '           (D.RECPAG = '#39'R'#39') And (D.IDPESSOA =  :PIDPESSOA) and'
      '                 (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '       ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '        (D.CONTROLEREMESSA IS NULL                 OR'
      '        D.CONTROLEREMESSA = :PCONTROLEREMESSA)'
      ''
      '       GROUP BY'
      '           D.CODDOCUMENTO'
      '       HAVING'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) <> 0) ' +
        'OR'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) <> 0)'
      '           ) SALDO,'
      '       PESSOA P,'
      '       DOCUMENTO D,'
      '       PORTADORFORMA F ,'
      '       MOEDA M,'
      '       AGENCIABANCARIA AB,'
      '       PORTADORCONTA PC,'
      '       CLIENTEPESS CP,'
      '       MODULO'
      '   WHERE'
      
        '    (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE' +
        ' a.RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdocto ' +
        'b where recpag='#39'R'#39' and b.idusuario=:idusuario) union  SELECT COD' +
        'TIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '    and exists (select 1 from UsuarioxTpdocto b where a.codtipdo' +
        'c=b.codtipdoc and recpag='#39'R'#39' and b.idusuario=:idusuario))) and (' +
        'F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      '    (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '    (D.RECPAG = '#39'R'#39')                           AND'
      '    ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '    (D.IDPESSOA =  :PIDPESSOA)                 AND'
      '    (CP.IDPESSOA = D.IDFORCLI)                 AND'
      '    (D.CODGRUPOCNAB IS NULL)                   AND'
      '    (RTRIM(D.OPERACAO) IN ('#39'2'#39','#39'3'#39','#39'13'#39','#39'14'#39')) AND'
      '    (D.IDMODULO = MODULO.IDMODULO)             AND'
      '    (D.CONTROLEREMESSA IS NULL                 OR'
      '     D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '    (D.IDFORCLI=P.IDPESSOA)                    AND'
      '    (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      '    (D.MOECODIGO = M.MOECODIGO(+))             AND'
      '    (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      '    (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      '    (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      '    (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      '    (E.IDCIDADES = C.IDCIDADES(+))             AND'
      '    (ES.IDESTADO(+) = C.IDESTADO)'
      'UNION ALL'
      '   SELECT DISTINCT'
      '      d.idforcli,'
      
        '      E.CEP, '#9#9'   ES.CODESTADO, '#9'           C.NOME AS CIDADE, '#9' ' +
        '       E.BAIRRO,'
      '      E.COMPLEMENTO, '#9'   E.NUMERO, '#9#9'           E.LOGRADOURO,'
      
        '      DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'000000000000' +
        '00'#39',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.N' +
        'UMDOCUMENTO)) AS NUMDOCUMENTO,'
      
        '      P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO , D.DATALIMITE, '#9'D.' +
        'DATAPROGRAMADA,'
      
        '      D.CODPORTFORMA,'#9'   D.DATAVENCTO, '#9#9'   to_date(to_char(sysd' +
        'ate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  AS DATAEMISSAO, '#9'D.CODGRUPOCNAB' +
        ','
      
        '      M.MOESIGLA, '#9'   D.CODGRUPOCNAB AS CODDOCUMENTO, P.TIPO, '#9#9 +
        'D.NOSSONUMERO,'
      
        '      ('#39#39') AS COMPLDOC,    E.TIPOENDERECO,  '#9'           AB.NUMAG' +
        'ENCIA, '#9'PC.NOCONTACORR AS NUMCONTA,'
      
        '      SUM(F.JUROSPORDIA) AS VALORJUROS, ('#39'S'#39') AS FLGGRUPO,      ' +
        ' SUM(SALDO.VALOR), SUM(SALDO.VALOROM),  F.NUMRAZAOCC, CP.IDTIPOC' +
        'LIENTE, D.CODTIPDOC, D.IDMODULO,'
      '      D.IDUSUARIOINCLUSAO'
      '   FROM'
      '      ENDPESS E, CIDADES C, ESTADO ES,'
      '      (SELECT'
      
        '           D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,' +
        'L.VALOR)) AS VALOR,'
      
        '           SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) AS VALOROM'
      '       FROM'
      '          LANCTODOCUM L      , DOCUMENTO D'
      '       WHERE'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '           (D.RECPAG = '#39'R'#39') And'
      '           (D.IDPESSOA =  :PIDPESSOA) and'
      '                 (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '       ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '        (D.CONTROLEREMESSA IS NULL                 OR'
      '        D.CONTROLEREMESSA = :PCONTROLEREMESSA)'
      '       GROUP BY'
      '           D.CODDOCUMENTO'
      '       HAVING'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) <> 0) ' +
        'OR'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) <> 0)'
      '           ) SALDO,'
      '       PESSOA P,'
      '       DOCUMENTO D,'
      '       PORTADORFORMA F ,'
      '       MOEDA M,'
      '       AGENCIABANCARIA AB,'
      '       PORTADORCONTA PC,'
      '       CLIENTEPESS CP,'
      '       MODULO'
      '   WHERE'
      
        '      (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHE' +
        'RE a.RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdoct' +
        'o b where recpag='#39'R'#39' and b.idusuario=:idusuario) union  SELECT C' +
        'ODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '      and exists (select 1 from UsuarioxTpdocto b where a.codtip' +
        'doc=b.codtipdoc and b.idusuario=:idusuario and recpag='#39'R'#39'))) and'
      '      (F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      '      (D.CODGRUPOCNAB IS NOT NULL)               AND'
      '      (D.RECPAG = '#39'R'#39')                           AND'
      '      (RTRIM(D.OPERACAO) IN ('#39'2'#39','#39'3'#39','#39'13'#39','#39'14'#39')) AND'
      '      (D.STATUS <> '#39'2'#39')                          AND'
      '      (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '      (D.IDPESSOA =  :PIDPESSOA)                 AND'
      '      (CP.IDPESSOA = D.IDFORCLI)                 AND'
      '      (D.IDMODULO = MODULO.IDMODULO)             AND'
      '      (D.CONTROLEREMESSA IS NULL                 OR'
      '       D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '      (D.IDFORCLI=P.IDPESSOA)                    AND'
      '      (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      '      (D.MOECODIGO = M.MOECODIGO(+))             AND'
      '      (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      '      (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      '      (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      '      (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      '      (E.IDCIDADES = C.IDCIDADES(+))             AND'
      '      (ES.IDESTADO(+) = C.IDESTADO)'
      '   GROUP BY'
      '       D.idforcli,'
      '       D.CODGRUPOCNAB,'
      '       E.CEP, ES.CODESTADO, C.NOME, E.BAIRRO,'
      '       E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, NUMDOCUMENTO,'
      
        '       P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGR' +
        'AMADA,'
      '       D.CODPORTFORMA, D.DATAVENCTO,'
      '       M.MOESIGLA, P.TIPO, D.NOSSONUMERO,'
      
        '       E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR, F.JUROSPO' +
        'RDIA,'
      '       F.NUMRAZAOCC, CP.IDTIPOCLIENTE, D.CODTIPDOC, D.IDMODULO,'
      '       D.IDUSUARIOINCLUSAO)'
      'ORDER BY FLGGRUPO, NODOCUMENTO'
      ''
      ''
      ''
      '')
    ClientDataSet = CdsBloquete
    Left = 71
    Top = 308
  end
  object CdsBloquete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 15
    Top = 396
  end
  object SqlEmitidos: TCMSqlParams
    ClientDataSet = CdsEmitidos
    Left = 207
    Top = 292
  end
  object CdsEmitidos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 135
    Top = 292
  end
  object SqlBloqueteTipoCli: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      'idforcli,'
      'CEP,'
      'CODESTADO,'
      'CIDADE,'
      'BAIRRO,'
      'COMPLEMENTO,'
      'NUMERO,'
      'LOGRADOURO,'
      'NUMDOCUMENTO,'
      'NOME,'
      'VALORDESCONTO,'
      'DATALIMITE,'
      'DATAPROGRAMADA,'
      'CODPORTFORMA,'
      'DATAVENCTO,'
      'DATAEMISSAO,'
      'NODOCUMENTO,'
      'MOESIGLA,'
      'CODDOCUMENTO,'
      'TIPO,'
      'NOSSONUMERO,'
      'COMPLDOCUMENTO,'
      'TIPOENDERECO,'
      'NUMAGENCIA,'
      'NUMCONTA,'
      'VALORJUROS,'
      'FLGGRUPO,'
      'VALOR,'
      'VALOROM,'
      'NUMRAZAOCC,'
      'IDTIPOCLIENTE,'
      'CODTIPDOC,'
      'IDMODULO,'
      'IDUSUARIOINCLUSAO'
      'FROM'
      '(SELECT'
      ' D.idforcli,'
      ' E.CEP,'
      ' ES.CODESTADO,'
      ' C.NOME AS CIDADE,'
      ' E.BAIRRO,'
      ' E.COMPLEMENTO,'
      ' E.NUMERO,'
      ' E.LOGRADOURO,'
      
        ' DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000000'#39',P' +
        '.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.NUMDOC' +
        'UMENTO)) AS NUMDOCUMENTO,'
      ' P.RAZAOSOCIAL AS NOME,'
      ' D.VALORDESCONTO,'
      ' D.DATALIMITE,'
      ' D.DATAPROGRAMADA,'
      ' D.CODPORTFORMA,'
      ' D.DATAVENCTO,'
      
        ' (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39') ) AS DATAE' +
        'MISSAO,'
      ' D.NODOCUMENTO,'
      ' M.MOESIGLA,'
      ' D.CODDOCUMENTO,'
      ' P.TIPO,'
      ' D.NOSSONUMERO,'
      ' D.COMPLDOCUMENTO,'
      ' E.TIPOENDERECO,'
      ' AB.NUMAGENCIA,'
      ' PC.NOCONTACORR AS NUMCONTA,'
      ' F.JUROSPORDIA AS VALORJUROS,'
      ' ('#39'N'#39') AS FLGGRUPO,'
      ' SALDO.VALOR,'
      ' SALDO.VALOROM,'
      ' F.NUMRAZAOCC,'
      ' CP.IDTIPOCLIENTE,'
      ' D.CODTIPDOC,'
      ' D.IDMODULO,'
      ' D.IDUSUARIOINCLUSAO'
      'FROM'
      ' ENDPESS E, CIDADES C, ESTADO ES,'
      ' (SELECT'
      
        '    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR' +
        ')) AS VALOR,'
      
        '    SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOE' +
        'DA)) AS VALOROM'
      ' FROM'
      
        '     LANCTODOCUM L,DOCUMENTO D WHERE (D.CODDOCUMENTO = L.CODDOCU' +
        'MENTO) AND'
      '     (D.RECPAG = '#39'R'#39') And (D.IDPESSOA =  :PIDPESSOA) and'
      '      (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '       ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '        (D.CONTROLEREMESSA IS NULL                 OR'
      '        D.CONTROLEREMESSA = :PCONTROLEREMESSA)'
      ' GROUP BY'
      '     D.CODDOCUMENTO'
      ' HAVING'
      '     (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) <> 0) OR'
      
        '     (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAM' +
        'OEDA)) <> 0)'
      '     ) SALDO,'
      ' PESSOA P,'
      ' DOCUMENTO D,'
      ' PORTADORFORMA F ,'
      ' MOEDA M,'
      ' AGENCIABANCARIA AB,'
      ' PORTADORCONTA PC,'
      ' CLIENTEPESS CP,'
      ' MODULO'
      'WHERE'
      
        ' (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.' +
        'RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdocto b w' +
        'here b.idusuario=:idusuario and recpag='#39'R'#39') union  SELECT CODTIP' +
        'DOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '  and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=' +
        'b.codtipdoc and b.idusuario=:idusuario and recpag='#39'R'#39'))) and'
      ' (F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      ' (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      ' (D.RECPAG = '#39'R'#39')                           AND'
      ' ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      ' (D.IDPESSOA =  :PIDPESSOA)                 AND'
      ' (CP.IDPESSOA = D.IDFORCLI)                 AND'
      ' (D.IDMODULO = MODULO.IDMODULO)             AND'
      ' ((CP.IDTIPOCLIENTE = :IDTIPOCLIENTE)       OR'
      
        ' (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCL' +
        'IENTE = :IDTIPOCLIENTE))) AND'
      ' (D.CODGRUPOCNAB IS NULL)                   AND'
      ' (RTRIM(D.OPERACAO) IN ('#39'2'#39','#39'3'#39','#39'13'#39','#39'14'#39')) AND'
      ' (D.CONTROLEREMESSA IS NULL                 OR'
      '  D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      ' (D.IDFORCLI=P.IDPESSOA)                    AND'
      ' (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      ' (D.MOECODIGO = M.MOECODIGO(+))             AND'
      ' (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      ' (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      ' (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      ' (E.IDCIDADES = C.IDCIDADES(+))             AND'
      ' (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      ' (ES.IDESTADO(+) = C.IDESTADO)'
      'UNION ALL'
      'SELECT DISTINCT'
      ' D.idforcli,'
      
        ' E.CEP, '#9#9'   ES.CODESTADO, '#9'           C.NOME AS CIDADE, '#9'      ' +
        '  E.BAIRRO,'
      ' E.COMPLEMENTO, '#9'   E.NUMERO, '#9#9'           E.LOGRADOURO,'
      
        ' DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000000'#39',P' +
        '.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.NUMDOC' +
        'UMENTO)) AS NUMDOCUMENTO,'
      
        ' P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, '#9'           D.DATALIMIT' +
        'E, '#9'D.DATAPROGRAMADA,'
      
        ' D.CODPORTFORMA,'#9'   D.DATAVENCTO, '#9#9'   to_date(to_char(sysdate,'#39 +
        'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  AS DATAEMISSAO, '#9'D.CODGRUPOCNAB,'
      
        ' M.MOESIGLA, '#9'   D.CODGRUPOCNAB AS CODDOCUMENTO, P.TIPO, '#9#9'D.NOS' +
        'SONUMERO,'
      
        ' ('#39#39') AS COMPLDOC,    E.TIPOENDERECO,  '#9'           AB.NUMAGENCIA' +
        ', '#9'PC.NOCONTACORR AS NUMCONTA,'
      
        ' SUM(F.JUROSPORDIA) AS VALORJUROS, ('#39'S'#39') AS FLGGRUPO,       SUM(' +
        'SALDO.VALOR),SUM(SALDO.VALOROM),  F.NUMRAZAOCC, CP.IDTIPOCLIENTE' +
        ', D.CODTIPDOC, D.IDMODULO,'
      ' D.IDUSUARIOINCLUSAO'
      'FROM'
      ' ENDPESS E, CIDADES C, ESTADO ES,'
      ' (SELECT'
      
        '    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR' +
        ')) AS VALOR,'
      
        '    SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOE' +
        'DA)) AS VALOROM'
      ' FROM'
      '     LANCTODOCUM L   ,DOCUMENTO D'
      ' WHERE'
      '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '     (D.RECPAG = '#39'R'#39') And'
      '     (D.IDPESSOA =  :PIDPESSOA) and'
      '     (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '     ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '     (D.CONTROLEREMESSA IS NULL                 OR'
      '      D.CONTROLEREMESSA = :PCONTROLEREMESSA)'
      ' GROUP BY'
      '     D.CODDOCUMENTO'
      ' HAVING'
      '     (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) <> 0) OR'
      
        '     (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAM' +
        'OEDA)) <> 0)'
      '     ) SALDO,'
      ' PESSOA P,'
      ' DOCUMENTO D,'
      ' PORTADORFORMA F ,'
      ' MOEDA M,'
      ' AGENCIABANCARIA AB,'
      ' PORTADORCONTA PC,'
      ' CLIENTEPESS CP,'
      ' MODULO'
      'WHERE'
      
        ' (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.' +
        'RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdocto b w' +
        'here b.idusuario=:idusuario and recpag='#39'R'#39') union  SELECT CODTIP' +
        'DOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '  and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=' +
        'b.codtipdoc and b.idusuario=:idusuario and recpag='#39'R'#39'))) and   (' +
        'F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      '   (D.CODGRUPOCNAB IS NOT NULL)               AND'
      '   (D.RECPAG = '#39'R'#39')                           AND'
      '   (RTRIM(D.OPERACAO) IN ('#39'2'#39','#39'3'#39','#39'13'#39','#39'14'#39')) AND'
      '   (D.STATUS <> '#39'2'#39')                          AND'
      '   (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '   (D.IDPESSOA =  :PIDPESSOA)                 AND'
      '   (CP.IDPESSOA = D.IDFORCLI)                 AND'
      '   (D.IDMODULO = MODULO.IDMODULO)             AND'
      '   ((CP.IDTIPOCLIENTE = :IDTIPOCLIENTE)       OR'
      
        '   (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPO' +
        'CLIENTE = :IDTIPOCLIENTE))) AND'
      '   (D.CONTROLEREMESSA IS NULL                 OR'
      '    D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '   (D.IDFORCLI=P.IDPESSOA)                    AND'
      '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      '   (D.MOECODIGO = M.MOECODIGO(+))             AND'
      '   (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      '   (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      '   (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      '   (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      '   (E.IDCIDADES = C.IDCIDADES(+))             AND'
      '   (ES.IDESTADO(+) = C.IDESTADO)'
      'GROUP BY'
      '    d.idforcli,'
      '    D.CODGRUPOCNAB,'
      '    E.CEP, ES.CODESTADO, C.NOME, E.BAIRRO,'
      '    E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, NUMDOCUMENTO,'
      
        '    P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMA' +
        'DA,'
      '    D.CODPORTFORMA, D.DATAVENCTO,'
      '    M.MOESIGLA, P.TIPO, D.NOSSONUMERO,'
      
        '    E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR, F.JUROSPORDI' +
        'A,'
      '    F.NUMRAZAOCC, CP.IDTIPOCLIENTE, D.CODTIPDOC, D.IDMODULO,'
      '    D.IDUSUARIOINCLUSAO)'
      'ORDER BY FLGGRUPO, NODOCUMENTO'
      ''
      ''
      ''
      ' ')
    ClientDataSet = CdsBloqueteTipoCli
    Left = 471
    Top = 332
  end
  object CdsBloqueteTipoCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 407
    Top = 340
  end
  object SqlModulo: TCMSqlParams
    SQL.Strings = (
      'select  '
      '    IDMODULO ,'
      '    NOMEMODULO'
      'from  '
      '     MODULO'
      'order by    '
      '     NOMEMODULO    ')
    ClientDataSet = CdsModulo
    Left = 591
    Top = 244
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 567
    Top = 244
  end
end
