inherited frmCalculaReservaPart: TfrmCalculaReservaPart
  Left = 164
  Top = 60
  HelpContext = 160055
  Caption = 'Alimentação mensal de reservas'
  ClientHeight = 472
  ClientWidth = 719
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 719
    Height = 433
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 717
      Height = 133
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 256
        Height = 27
        Caption = 'Informações para o cálculo'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 27
        Width = 290
        Height = 61
        Caption = ' Mês e Ano de Cobrança das Contribuições '
        TabOrder = 0
        object cmbMesRef: TComboBox
          Left = 6
          Top = 20
          Width = 219
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro')
        end
        object spedAnoRef: TSpinEdit
          Left = 228
          Top = 20
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
        object ChBxProcessaAnteriores: TCheckBox
          Left = 7
          Top = 42
          Width = 274
          Height = 17
          Caption = 'Processa meses anteriores em aberto '
          TabOrder = 2
        end
      end
      object bbtnEnviar: TBitBtn
        Left = 596
        Top = 6
        Width = 115
        Height = 38
        Caption = 'Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnEnviarClick
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
        Left = 596
        Top = 48
        Width = 115
        Height = 38
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
      object rgrpTipoCobranca: TRadioGroup
        Left = 428
        Top = 27
        Width = 157
        Height = 61
        Caption = 'Tipo de Cobrança'
        ItemIndex = 2
        Items.Strings = (
          'Desconto em Folha'
          'Cobrança Bancária'
          'Ambas')
        TabOrder = 4
        TabStop = True
      end
      object grpDataAlimentacao: TGroupBox
        Left = 300
        Top = 27
        Width = 124
        Height = 61
        Caption = ' Data de Alimentação '
        TabOrder = 5
        object dtAlimentacao: TCMDateTimePicker
          Left = 6
          Top = 22
          Width = 108
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
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
        end
      end
      object grpIntegraContab: TGroupBox
        Left = 6
        Top = 88
        Width = 580
        Height = 44
        TabOrder = 6
        object lblIntegraContab: TLabel
          Left = 6
          Top = 17
          Width = 155
          Height = 13
          Caption = 'Integrar com Contabilidade ? Sim'
        end
        object chkIntegra: TCheckBox
          Left = 256
          Top = 9
          Width = 169
          Height = 17
          Caption = 'Efetuar apenas integração'
          TabOrder = 0
        end
        object chkIntegraLocal: TCheckBox
          Left = 256
          Top = 24
          Width = 217
          Height = 17
          Caption = 'Marca/Desmarca integração localmente'
          TabOrder = 1
          OnClick = chkIntegraLocalClick
        end
      end
    end
    object pnlControle: TPanel
      Left = 1
      Top = 134
      Width = 717
      Height = 298
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object pnlResult: TPanel
        Left = 0
        Top = 0
        Width = 717
        Height = 298
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object memResult: TMemo
          Left = 8
          Top = 25
          Width = 585
          Height = 225
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object bbtnVoltar: TBitBtn
          Left = 597
          Top = 15
          Width = 115
          Height = 38
          Caption = '&Voltar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bbtnVoltarClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
            DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
            4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
            DD00DDDDDDDDDDDDDD00}
        end
        object bbtnSalvar: TBitBtn
          Left = 597
          Top = 59
          Width = 115
          Height = 38
          Caption = 'S&alvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
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
        object StaticText3: TStaticText
          Left = 8
          Top = 3
          Width = 99
          Height = 22
          AutoSize = False
          Caption = 'Resultado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
      end
      object pnlOpcoes: TPanel
        Left = 0
        Top = 0
        Width = 717
        Height = 298
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pgctrlReserva: TPageControl
          Left = 1
          Top = 32
          Width = 715
          Height = 265
          ActivePage = tbsPrincipal
          Align = alBottom
          TabOrder = 3
          object tbsPrincipal: TTabSheet
            Caption = ' Opções Básicas ... '
            object lbPatro: TLabel
              Left = 3
              Top = 11
              Width = 71
              Height = 13
              Caption = 'Patrocinadoras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 287
              Top = 10
              Width = 107
              Height = 13
              Caption = 'Planos Previdenciários'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object chklstPatro: TCheckListBox
              Left = 3
              Top = 26
              Width = 278
              Height = 188
              Columns = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              OnClick = chklstPatroClick
            end
            object chklstPlano: TCheckListBox
              Left = 287
              Top = 26
              Width = 278
              Height = 189
              Columns = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
              OnClick = chklstPlanoClick
            end
          end
          object tbshtpart: TTabSheet
            Caption = ' Outras Opções ... '
            ImageIndex = 1
            object GroupBox2: TGroupBox
              Left = 3
              Top = 6
              Width = 325
              Height = 210
              Caption = ' Escolher um Participante '
              TabOrder = 0
              object lblParticip: TLabel
                Left = 11
                Top = 19
                Width = 56
                Height = 13
                Caption = 'Participante'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 11
                Top = 61
                Width = 97
                Height = 13
                Caption = 'Plano Previdenciário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lblPatro: TLabel
                Left = 11
                Top = 101
                Width = 66
                Height = 13
                Caption = 'Patrocinadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lblMatricula: TLabel
                Left = 205
                Top = 101
                Width = 45
                Height = 13
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label1: TLabel
                Left = 11
                Top = 139
                Width = 188
                Height = 13
                Caption = 'Data do lançamento Contabil (Desfazer)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object edNome: TEdit
                Left = 11
                Top = 34
                Width = 304
                Height = 24
                Color = clSilver
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object edPlano: TEdit
                Left = 11
                Top = 74
                Width = 304
                Height = 24
                Color = clSilver
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object edPatro: TEdit
                Left = 11
                Top = 114
                Width = 188
                Height = 24
                Color = clSilver
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object edMatricula: TEdit
                Left = 205
                Top = 114
                Width = 110
                Height = 24
                Color = clSilver
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object bbtnProcurar: TBitBtn
                Left = 166
                Top = 165
                Width = 77
                Height = 40
                Hint = 'Procurar participante'
                Caption = '&Procurar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = bbtnProcurarClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000012000000120000000100
                  040000000000D800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                  FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                  0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                  870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                  FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                  0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                  DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              end
              object btndesfazselec: TBitBtn
                Left = 243
                Top = 165
                Width = 77
                Height = 40
                Hint = 'Procurar participante'
                Caption = 'Limpar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = btndesfazselecClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
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
                NumGlyphs = 2
              end
              object dtLancContabil: TCMDateTimePicker
                Left = 11
                Top = 154
                Width = 108
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
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 6
              end
            end
            object GroupBox3: TGroupBox
              Left = 333
              Top = 6
              Width = 372
              Height = 210
              Caption = ' Escolher Contribuição '
              TabOrder = 1
              object dbgrdContribuicao: TwwDBGrid
                Left = 2
                Top = 15
                Width = 368
                Height = 193
                Selected.Strings = (
                  'FLGALIMENTA'#9'5'#9'.'
                  'NOME'#9'43'#9'Contribuição')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsContribuicao
                KeyOptions = []
                Options = [dgEditing, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                PopupMenu = pmnu
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
          end
          object tbshtdecterc: TTabSheet
            Caption = ' Décimo Terceiro'
            ImageIndex = 2
            object rdgrpopindice: TRadioGroup
              Left = 8
              Top = 16
              Width = 329
              Height = 105
              Caption = ' Data do índice '
              ItemIndex = 0
              Items.Strings = (
                'Mês efetivo de cobrança da contribuição'
                'Mês normal de cobrança de décimo terceiro')
              TabOrder = 0
            end
          end
        end
        object StaticText2: TStaticText
          Left = 7
          Top = 3
          Width = 170
          Height = 27
          Caption = 'Opções do cálculo'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object chkResult: TCheckBox
          Left = 10
          Top = 275
          Width = 121
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Exibir exceções ...'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object bbtnVerResultado: TBitBtn
          Left = 596
          Top = 5
          Width = 115
          Height = 38
          Hint = 'Ir para tela de resultado '
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnVerResultadoClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
            DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
            4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
            DD00DDDDDDDDDDDDDD00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 719
    inherited tb97Fundo: TToolbar97
      Left = 547
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 378
      DockPos = 390
      Visible = False
    end
  end
  object pnlProgresso: TPanel [2]
    Left = 79
    Top = 137
    Width = 570
    Height = 152
    BevelWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object lblTitulo: TLabel
      Left = 11
      Top = 31
      Width = 425
      Height = 15
      AutoSize = False
      Caption = 'Titulo :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSubTitulo: TLabel
      Left = 11
      Top = 7
      Width = 396
      Height = 15
      AutoSize = False
      Caption = 'SubTitulo :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSubTitulo2: TLabel
      Left = 11
      Top = 54
      Width = 396
      Height = 17
      AutoSize = False
      Caption = 'SubTitulo 2 :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object pBarGeral: TGauge
      Left = 458
      Top = 10
      Width = 96
      Height = 95
      BorderStyle = bsNone
      Kind = gkPie
      Progress = 0
    end
    object btncancelaprogress: TBitBtn
      Left = 464
      Top = 110
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btncancelaprogressClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object pBarDocs: TProgressBar
      Left = 9
      Top = 122
      Width = 440
      Height = 15
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object pBarAlimenta: TProgressBar
      Left = 9
      Top = 102
      Width = 440
      Height = 15
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
    object pBarWhile1: TProgressBar
      Left = 9
      Top = 82
      Width = 440
      Height = 15
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 427
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de Reservas de Participantes'
    Left = 638
    Top = 288
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA,    PESSOA.NOME'
      'FROM   PESSOA, PATRO'
      'WHERE  PESSOA.IDPESSOA=PATRO.IDPESSOA'
      'AND    PATRO.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 422
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 196
    Top = 422
  end
  object qryReservaXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ RULE*/ DISTINCT'
      '  RP.IDTIPORESERVA,'
      '  RP.NOME ,'
      '  PL.IDPLANOPREV,'
      '  PL.NOME NOMEPLANO,'
      '  RP.FLGCOLETIVA,'
      '  PL.FLGRESERVAULTCOT,'
      '  RP.FLGCONTROLE,'
      '  RC.IDCONTRIBUICAO,'
      '  RC.PERCENTUAL,'
      '  C.NOME AS NOMECONTRIBUICAO,'
      '  CT.FLGPARCELAMENTO,'
      '  '#39'          '#39' AS DATAINDICECORRECAO'
      'FROM'
      '  PLANPREV PL,'
      '  CONTPREV CT,'
      '  RESERVAXPLANO RP,'
      '  CONTRIBUICAO C,'
      '  RESERVAXCONTRIB RC,'
      '  HSTCONTRIBPREV H'
      ''
      'WHERE (RP.ANALITICOSINTETI = '#39'A'#39')'
      '  AND (H.IDPLANOPREV       = RC.IDPLANOPREV)'
      '  AND (H.IDPLANOPREV       = :IDPLANO)'
      '  AND (RC.IDPLANOPREV      = RP.IDPLANOPREV)'
      '  AND (RC.IDTIPORESERVA    = RP.IDTIPORESERVA)'
      '  AND (RC.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)'
      '  AND (CT.IDPLANOPREV      = PL.IDPLANOPREV)'
      '  AND (CT.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)'
      '  AND (H.MESCOBRANCA      <= :MESCOBRANCA)'
      '  AND (H.IDPESSJUR         = :IDPESSJUR)'
      '  AND (H.IDPLANOPREV       = PL.IDPLANOPREV)'
      '  AND (H.IDCONTRIBUICAO    = RC.IDCONTRIBUICAO)'
      '  AND (NVL(H.VALORRECEBIDO,0) > 0)'
      ''
      'ORDER BY RC.IDCONTRIBUICAO, RP.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 564
    Top = 102
    ParamData = <
      item
        DataType = ftString
        Name = 'IdPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 530
    Top = 103
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 250
    Top = 422
  end
  object qryUpdReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RESERVAPART'
      'SET VALORRESERVA = :VALORRESERVA'
      ',   DATAREFERENCIASA= :DATA'
      'WHERE IDTIPORESERVA = :IDTIPORESERVA'
      'AND   IDPLANOPREV   = :IDPLANOPREV'
      'AND   IDPESSJUR     = :IDPESSJUR'
      'AND   IDPESSOA      = :IDPESSOA'
      'AND   SEQPROPOSTA   = :SEQPROPOSTA')
    ValidateWithMask = True
    Left = 632
    Top = 101
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VALORRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPORESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  0  as flgentrada, '
      '  0  as ValorRecebido,'
      '  0  as ValorReserva,'
      '  0  as VALORESPERADO,'
      '  0  as IdPessJur,'
      '  0  as idpessoa,'
      '  0 as idplanoprev,'
      '  0 as idtiporeserva,'
      '  '#39' '#39' as seqproposta,'
      '  0 as idcontribuicao,'
      '  '#39'           '#39' as PERCRECEB,'
      '  '#39'           '#39' as DATALANCTO,'
      '  '#39'           '#39' as NUMRECEBIMENTO,'
      '  '#39'           '#39' as MESREFERENCIA,'
      '  '#39'           '#39' as MESCOBRANCA,'
      '  '#39'           '#39' as IDMOTIVO,'
      '  '#39'           '#39' as IDREGRACALCULORE,'
      '  '#39'           '#39' as FLGRESERVAULTCOT,'
      '  '#39'           '#39' as MESREFERENCIA,'
      '  '#39'           '#39' as DATARECEBIMENTO,'
      '  '#39'           '#39' as DATAPREVISAORECE,'
      '  0 as VALOROP1,'
      '  0 as VALOROP2,'
      '  0 as VALOROP3,'
      '  0 as INDICEREAJUSTE,'
      '  0 as PERCENTUAL,'
      '  0 AS FLGMODATUALIZACAO,'
      '  0 AS VALORMAXIMORATEIO,'
      '  0 AS VALORPARARESERVA,'
      '  0 AS SALPARTICIPACAO,'
      '  0 AS IDPARTICIPANTE'
      'from reservapart where 1=2'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updRes
    ValidateWithMask = True
    Left = 434
  end
  object updRes: TUpdateSQL
    ModifySQL.Strings = (
      'update reservapart'
      'set'
      '  FLGENTRADA = :FLGENTRADA,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  VALORRESERVA = :VALORRESERVA,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  PERCRECEB = :PERCRECEB,'
      '  DATALANCTO = :DATALANCTO,'
      '  NUMRECEBIMENTO = :NUMRECEBIMENTO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDREGRACALCULORE = :IDREGRACALCULORE,'
      '  FLGRESERVAULTCOT = :FLGRESERVAULTCOT,'
      '  MESREFERENCIA_1 = :MESREFERENCIA_1,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  INDICEREAJUSTE = :INDICEREAJUSTE,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO'
      'where'
      ' FLGENTRADA = :OLD_FLGENTRADA and'
      '  VALORRECEBIDO = :OLD_VALORRECEBIDO and'
      '  VALORRESERVA = :OLD_VALORRESERVA and'
      '  VALORESPERADO = :OLD_VALORESPERADO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  PERCRECEB = :OLD_PERCRECEB and'
      '  DATALANCTO = :OLD_DATALANCTO and'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDREGRACALCULORE = :OLD_IDREGRACALCULORE and'
      '  FLGRESERVAULTCOT = :OLD_FLGRESERVAULTCOT and'
      '  MESREFERENCIA_1 = :OLD_MESREFERENCIA_1 and'
      '  DATARECEBIMENTO = :OLD_DATARECEBIMENTO and'
      '  INDICEREAJUSTE = :OLD_INDICEREAJUSTE and'
      '  PERCENTUAL = :OLD_PERCENTUAL and'
      '  SALPARTICIPACAO = :old_SALPARTICIPACAO')
    InsertSQL.Strings = (
      'insert into reservapart'
      '  (FLGENTRADA, VALORRECEBIDO, VALORRESERVA, VALORESPERADO, '
      'IDPESSJUR, IDPESSOA, IDPLANOPREV, '
      '   IDTIPORESERVA, SEQPROPOSTA, IDCONTRIBUICAO, PERCRECEB, '
      'DATALANCTO, NUMRECEBIMENTO, '
      '   MESREFERENCIA, MESCOBRANCA, IDMOTIVO, IDREGRACALCULORE, '
      'FLGRESERVAULTCOT, '
      
        '   MESREFERENCIA_1, DATARECEBIMENTO, INDICEREAJUSTE, PERCENTUAL,' +
        ' '
      'SALPARTICIPACAO)'
      'values'
      '  (:FLGENTRADA, :VALORRECEBIDO, :VALORRESERVA, :VALORESPERADO, '
      ':IDPESSJUR, :IDPESSOA, '
      '   :IDPLANOPREV, :IDTIPORESERVA, :SEQPROPOSTA, :IDCONTRIBUICAO, '
      ':PERCRECEB, '
      '   :DATALANCTO, :NUMRECEBIMENTO, :MESREFERENCIA, :MESCOBRANCA, '
      ':IDMOTIVO, '
      '   :IDREGRACALCULORE, :FLGRESERVAULTCOT, :MESREFERENCIA_1, '
      ':DATARECEBIMENTO, '
      '   :INDICEREAJUSTE, :PERCENTUAL, SALPARTICIPACAO)')
    DeleteSQL.Strings = (
      'delete from reservapart'
      'where'
      ' FLGENTRADA = :OLD_FLGENTRADA and'
      '  VALORRECEBIDO = :OLD_VALORRECEBIDO and'
      '  VALORRESERVA = :OLD_VALORRESERVA and'
      '  VALORESPERADO = :OLD_VALORESPERADO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  PERCRECEB = :OLD_PERCRECEB and'
      '  DATALANCTO = :OLD_DATALANCTO and'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDREGRACALCULORE = :OLD_IDREGRACALCULORE and'
      '  FLGRESERVAULTCOT = :OLD_FLGRESERVAULTCOT and'
      '  MESREFERENCIA_1 = :OLD_MESREFERENCIA_1 and'
      '  DATARECEBIMENTO = :OLD_DATARECEBIMENTO and'
      '  INDICEREAJUSTE = :OLD_INDICEREAJUSTE and'
      '  PERCENTUAL = :OLD_PERCENTUAL and'
      '  SALPARTICIPACAO = :old_SALPARTICIPACAO')
    Left = 598
    Top = 101
  end
  object qrySituacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select PartPrevPlan.idSitPart,sitpart.flginterno '
      'from PartPrevPlan,SitPart'
      'where PartPrevPlan.IdSitPart=SitPart.IdSitPart'
      'and PartPrevPlan.IdPessoa=:IdPessoa')
    ValidateWithMask = True
    Left = 81
    Top = 422
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qrydata: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 142
    Top = 422
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGIVEL'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PARTPREVPLAN.IDPLANOPREV'
      'PLANPREV.NOME'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '30'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 664
    Top = 160
  end
  object qryReservasACalcular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT :IDPLANOPREV, :IDCONTRIBUICAO, :FLGCALCRESERVA1, :FLGCALC' +
        'RESERVA2,'
      ':IDTIPORESERVA'
      'FROM   DUAL'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 555
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'qryre'
        ParamType = ptUnknown
      end>
  end
  object qryReserva: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT :IDPLANOPREV, :IDCONTRIBUICAO, :FLGCALCRESERVA1, :FLGCALC' +
        'RESERVA2,'
      ':IDTIPORESERVA'
      'FROM   DUAL')
    ValidateWithMask = True
    Left = 374
    Top = 65529
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPORESERVA'
        ParamType = ptUnknown
      end>
  end
  object qryPlanilhasExcluir: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT -1 AS PLNCODIGO, SYSDATE AS DATAALIMENTACAO, '#39'0000/00'#39' AS' +
        ' MESREFERENCIA'
      'FROM DUAL')
    UpdateObject = updPlanilhasExcluir
    ValidateWithMask = True
    Left = 535
    Top = 318
  end
  object updPlanilhasExcluir: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 537
    Top = 276
  end
  object qryParamContabil: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 298
    Top = 413
  end
  object updContribuicao: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBUICAO'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBUICAO'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from CONTRIBUICAO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 375
    Top = 321
  end
  object qryContribuicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS FLGALIMENTA, IDCONTRIBUICAO, NOME'
      'FROM   CONTRIBUICAO'
      'ORDER BY NOME ')
    ControlType.Strings = (
      'FLGALIMENTA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 373
    Top = 339
  end
  object dsContribuicao: TwwDataSource
    DataSet = qryContribuicao
    Left = 378
    Top = 360
  end
  object pmnu: TPopupMenu
    Left = 481
    Top = 304
    object DesmarcarTodas1: TMenuItem
      Caption = '&Desmarcar Todas'
      OnClick = DesmarcarTodas1Click
    end
    object MarcarTodas1: TMenuItem
      Caption = '&Marcar Todas'
      OnClick = MarcarTodas1Click
    end
  end
  object qryDatasIndice: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT -1 AS IDPLANOPREV, -1 AS IDTIPORESERVA,  '#39'          '#39' AS ' +
        'DATAINDICECORRECAO'
      'FROM   DUAL'
      '')
    UpdateObject = updDatasIndice
    ValidateWithMask = True
    Left = 606
    Top = 223
  end
  object updDatasIndice: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 566
    Top = 227
  end
  object qryPARAMCONTABRESERVA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, CODSUBCONTA, CODCENTROCUSTOC, '
      
        '               PLACONTAC, CODCENTROCUSTOD, PLACONTAD            ' +
        '     '
      'FROM PARAMCONTABRESERVA  '
      'WHERE IDPESSJUR          = :IDPESSJUR'
      '      AND IDPLANOPREV     = :IDPLANOPREV'
      '      AND IDTIPORESERVA  = :IDTIPORESERVA')
    ValidateWithMask = True
    Left = 430
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPORESERVA'
        ParamType = ptInput
      end>
  end
  object qryReservaAlimenta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 338
    Top = 438
  end
end
