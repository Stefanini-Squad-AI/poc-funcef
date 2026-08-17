inherited frmExecBuscaCaPMT: TfrmExecBuscaCaPMT
  Left = 290
  Top = 167
  HelpContext = 240012
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Busca de Impostos (Contas a Pagar)'
  ClientHeight = 439
  ClientWidth = 776
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 776
    Height = 400
    inherited PagControle: TPageControl
      Width = 774
      Height = 398
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Left = 8
          Width = 482
          Align = alNone
          Caption = 'Busca de Impostos (Contas a Pagar) [ Seleção ]'
        end
        object GroupBox1: TGroupBox
          Left = 512
          Top = 328
          Width = 249
          Height = 49
          Caption = ' Período para busca '
          TabOrder = 5
          object Label4: TLabel
            Left = 120
            Top = 22
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtDataInicio: TCMDateTimePicker
            Left = 16
            Top = 18
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
            ShowButton = True
            TabOrder = 0
          end
          object edtDataFim: TCMDateTimePicker
            Left = 136
            Top = 18
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
            ShowButton = True
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 32
          Width = 753
          Height = 177
          Caption = ' Impostos a Buscar '
          TabOrder = 0
          object Label1: TLabel
            Left = 280
            Top = 13
            Width = 129
            Height = 13
            Caption = 'Natureza da Operação'
          end
          object Label2: TLabel
            Left = 280
            Top = 53
            Width = 129
            Height = 13
            Caption = 'Natureza da Operação'
          end
          object Label3: TLabel
            Left = 280
            Top = 93
            Width = 129
            Height = 13
            Caption = 'Natureza da Operação'
          end
          object Label5: TLabel
            Left = 280
            Top = 133
            Width = 129
            Height = 13
            Caption = 'Natureza da Operação'
          end
          object chkProcIR: TCheckBox
            Left = 24
            Top = 28
            Width = 241
            Height = 17
            Caption = 'IRRF . . . . . . . . . . . . . . . . . . . . . . . . . . .'
            TabOrder = 0
          end
          object chkProcINSS: TCheckBox
            Left = 24
            Top = 68
            Width = 241
            Height = 17
            Caption = 'INSS . . . . . . . . . . . . . . . . . . . . . . . . '
            TabOrder = 2
          end
          object chkProcPIS: TCheckBox
            Left = 24
            Top = 108
            Width = 241
            Height = 17
            Caption = 'CSLL / PIS / COFINS . . . . . . . . . . . . '
            TabOrder = 4
          end
          object DBcboNatuIR: TwwDBLookupCombo
            Left = 280
            Top = 27
            Width = 457
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODNATUREZA'#9'4'#9'Código')
            LookupTable = dtmLookIRRF.cdsLookNatureza
            LookupField = 'CODNATUREZA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object chkProcISS: TCheckBox
            Left = 24
            Top = 148
            Width = 241
            Height = 17
            Caption = 'ISS . . . . . . . . . . . . . . . . . . . . . . . . . .'
            TabOrder = 6
          end
          object DBcboNatuINSS: TwwDBLookupCombo
            Left = 280
            Top = 68
            Width = 457
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODNATUREZA'#9'4'#9'Código')
            LookupTable = dtmLookIRRF.cdsLookNatureza
            LookupField = 'CODNATUREZA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBcboNatuPIS: TwwDBLookupCombo
            Left = 280
            Top = 107
            Width = 457
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODNATUREZA'#9'4'#9'Código')
            LookupTable = dtmLookIRRF.cdsLookNatureza
            LookupField = 'CODNATUREZA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBcboNatuISS: TwwDBLookupCombo
            Left = 280
            Top = 147
            Width = 457
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODNATUREZA'#9'4'#9'Código')
            LookupTable = dtmLookIRRF.cdsLookNatureza
            LookupField = 'CODNATUREZA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 272
          Width = 489
          Height = 105
          Caption = ' Documento '
          TabOrder = 2
          object Label6: TLabel
            Left = 16
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label7: TLabel
            Left = 16
            Top = 58
            Width = 125
            Height = 13
            Caption = 'Número/Complemento'
          end
          object Label8: TLabel
            Left = 192
            Top = 18
            Width = 64
            Height = 13
            Caption = 'Favorecido'
          end
          object Label11: TLabel
            Left = 264
            Top = 58
            Width = 75
            Height = 13
            Caption = 'Data Lancto.'
          end
          object Label9: TLabel
            Left = 376
            Top = 58
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object edtCodDocumento: TEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object edtNumDocumento: TEdit
            Left = 16
            Top = 72
            Width = 137
            Height = 21
            ReadOnly = True
            TabOrder = 4
          end
          object edtNomeFavorecido: TEdit
            Left = 192
            Top = 32
            Width = 281
            Height = 21
            ReadOnly = True
            TabOrder = 3
          end
          object btnBuscaDoc: TBitBtn
            Left = 128
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Busca um Documento'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnBuscaDocClick
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
          object edtDataLancto: TCMDateTimePicker
            Left = 264
            Top = 72
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
            ReadOnly = True
            ShowButton = False
            TabOrder = 5
          end
          object edtValorDoc: TEdit
            Left = 376
            Top = 72
            Width = 97
            Height = 21
            ReadOnly = True
            TabOrder = 6
          end
          object btnLimpaDoc: TBitBtn
            Left = 152
            Top = 32
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Documento'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnLimpaDocClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
        end
        object CMProcuraForCli: TCMProcuraForCli
          Left = 8
          Top = 216
          Width = 489
          Height = 49
          Caption = ' Favorecido '
          TabOrder = 1
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object GroupBox4: TGroupBox
          Left = 512
          Top = 242
          Width = 249
          Height = 81
          Caption = ' Operação '
          TabOrder = 4
          object btnBuscar: TSpeedButton
            Left = 24
            Top = 18
            Width = 201
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Buscar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
            ParentFont = False
          end
          object btnDesfazer: TSpeedButton
            Left = 24
            Top = 46
            Width = 201
            Height = 25
            GroupIndex = 1
            Caption = 'Desfazer Busca'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
        end
        object chkRendimento: TCheckBox
          Left = 520
          Top = 220
          Width = 241
          Height = 17
          Caption = 'Considerar rendimentos sem imposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Left = 8
          Width = 487
          Align = alNone
          Caption = 'Busca de Impostos (Contas a Pagar) [ Geração ]'
        end
        object lblRegisros: TLabel
          Left = 16
          Top = 368
          Width = 92
          Height = 13
          Caption = '10.000 registros'
        end
        object lblDesfazer: TfcLabel
          Left = 668
          Top = 0
          Width = 89
          Height = 24
          Caption = 'Desfazer'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Transparent = True
          Visible = False
        end
        object dbgINSS: TwwDBGrid
          Left = 8
          Top = 64
          Width = 753
          Height = 297
          ControlType.Strings = (
            'FLAG;CheckBox;1;0')
          Selected.Strings = (
            'NODOCUMENTO'#9'9'#9'Nº Doc.'#9'F'
            'RAZAOSOCIAL'#9'24'#9'Favorecido'#9'F'
            'DATALANCTO'#9'11'#9'Data'#9'F'
            'VALBASE'#9'11'#9'Valor Base'#9'F'
            'NOMEIMPOSTO'#9'17'#9'Imposto'#9'F'
            'CODNATUREZA'#9'5'#9'Nat.'#9'F'
            'CODIGOGPS'#9'8'#9'Cód.Pag.'#9'F'
            'VALOR'#9'12'#9'Valor Imposto'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsDocumento
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgINSSTitleButtonClick
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 8
          Top = 40
          Width = 753
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Documentos / Lançamentos encontrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 8
          Top = 0
          Width = 504
          Height = 24
          Caption = 'Busca de Impostos (Contas a Pagar) [ Resultado ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object memResult: TMemo
          Left = 8
          Top = 64
          Width = 753
          Height = 161
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object memErro: TMemo
          Left = 8
          Top = 264
          Width = 753
          Height = 113
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
        object Panel1: TPanel
          Left = 8
          Top = 40
          Width = 753
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Processados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object Panel2: TPanel
          Left = 8
          Top = 240
          Width = 753
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 320
      inherited sep1: TToolbarSep97
        Left = 91
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 93
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 184
      end
      inherited bbtnSair: TBitBtn
        Left = 290
        TabOrder = 3
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 371
        TabOrder = 4
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 95
        Width = 89
        Layout = blGlyphRight
        TabOrder = 1
      end
      inherited btnVoltar: TfcShapeBtn
        Width = 89
        TabOrder = 0
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 209
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1003
    Top = 19
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object sqlDocumento: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DOC.IDMODULO,'
      '  DOC.DATAVENCTO,'
      
        '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DO' +
        'C.IDPESSOA,'
      '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO,'
      
        '  LDC.CODDOCUMENTO, LDC.NUMLANCTO, decode(debcre,'#39'D'#39',LDC.VALOR,-' +
        'LDC.VALOR) AS VALOR, LDC.CODALTERADOR,'
      '  TAL.PLACONTA, TAL.PLANO AS PLANO,'
      '  BAS.VALOR AS VALBASE,'
      '  '#39'          '#39' AS CODTIPRECDES,'
      '  BAS.DATALANCTO,'
      '  0 AS IDLANCIRRF,'
      '  TAL.CODNATUREZA,'
      '  AXI.CODIMPOSTO,'
      '  '#39'INSS'#39' AS NOMEIMPOSTO,'
      '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP,'
      '  0 AS CODIGOGPS,'
      '  PES.NUMDOCUMENTO AS PROXNUMDOC'
      'FROM'
      '  PARAMIRRF     PIR,'
      '  LANCTODOCUM   LDC,'
      '  ALTXIMPOSTO   AXI,'
      '  DOCUMENTO     DOC,'
      '  PESSOA        PES,'
      '  TIPOALTERADOR TAL,'
      '  ('
      '  SELECT'
      '    CODDOCUMENTO, VALOR, DATALANCTO'
      '  FROM'
      '    LANCTODOCUM'
      '  WHERE'
      '        OPERACAO   = 2'
      
        '    AND DATALANCTO BETWEEN TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE('#39'31/01/2007'#39', '#39'DD/MM/YYYY'#39')'
      '    AND ESTORNO    IS NULL'
      '  ) BAS'
      'WHERE'
      '      LDC.CODALTERADOR   = AXI.CODALTERADOR'
      '  AND AXI.CODIMPOSTO     = 2'
      '  AND LDC.CODDOCUMENTO   = BAS.CODDOCUMENTO'
      '  AND LDC.CODDOCUMENTO   = DOC.CODDOCUMENTO'
      '  AND DOC.IDFORCLI       = PES.IDPESSOA'
      '  AND LDC.ESTORNO        IS NULL'
      '  AND LDC.CODALTERADOR   = TAL.CODALTERADOR'
      
        '  AND LDC.DATALANCTO     BETWEEN TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YY' +
        'YY'#39') AND TO_DATE('#39'31/01/2007'#39', '#39'DD/MM/YYYY'#39')'
      '  AND NOT EXISTS ('
      '                 SELECT  IDLANCIRRF'
      '                 FROM    LANCIRRF'
      '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO'
      '                    AND  NUMLANCTO    = LDC.NUMLANCTO'
      '                 )'
      '  AND NOT EXISTS ('
      '                 SELECT  IDIMPOSTORETIDO'
      '                 FROM    IMPOSTORETIDO'
      '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO'
      '                    AND  NUMLANCTO    = LDC.NUMLANCTO'
      '                 )'
      'UNION'
      'SELECT'
      'DOC.IDMODULO, '
      
        '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DO' +
        'C.IDPESSOA,'
      '  PES.RAZAOSOCIAL AS RAZAOSOCIAL, PES.NUMDOCUMENTO,'
      
        '  DOC.CODDOCUMENTO, 0 AS NUMLANCTO, IRT.VLRRETIDO AS VALOR, -1 A' +
        'S CODALTERADOR,'
      '  TCA.PLACONTA, TCA.PLANO,'
      '  IRT.VLRBASE AS VALBASE,'
      '  '#39'          '#39' AS CODTIPRECDES,'
      '  IRT.DATARETENCAO AS DATALANCTO,'
      '  0 AS IDLANCIRRF,'
      '  TAG.CODNATUREZA,'
      '  TAG.CODIMPOSTO,'
      '  '#39'INSS'#39' AS NOMEIMPOSTO,'
      '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP,'
      '  TAG.CODIGOGPS,'
      '  PES.NUMDOCUMENTO AS PROXNUMDOC'
      'FROM'
      '  PARAMIRRF          PIR,'
      '  TIPOAGRE           TAG,'
      '  TIPCUSTAGREGCONTA  TCA,'
      '  IMPOSTORETIDO      IRT,'
      '  PESSOA             PES,'
      '  DOCUMENTO          DOC'
      'WHERE'
      '      TAG.CODIMPOSTO       = 2'
      '  AND TAG.FLGUSAVALFORCLI  = '#39'N'#39
      '  AND IRT.IDPESSOA         = 2'
      
        '  AND IRT.DATARETENCAO     BETWEEN TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/' +
        'YYYY'#39') AND TO_DATE('#39'31/01/2007'#39', '#39'DD/MM/YYYY'#39')'
      '  AND TAG.CODTIPOCUSTAGREG = TCA.CODTIPOCUSTAGREG(+)'
      '  AND TAG.CODTIPOCUSTAGREG = IRT.CODTIPOCUSTAGREG'
      '  AND IRT.IDFORCLI         = PES.IDPESSOA'
      '  AND IRT.CODDOCUMENTO     = DOC.CODDOCUMENTO'
      '  AND NOT EXISTS ('
      '                 SELECT  IDLANCIRRF'
      '                 FROM    LANCIRRF'
      '                 WHERE   IDIMPOSTORETIDO = IRT.IDIMPOSTORETIDO'
      '                 )'
      'UNION'
      'SELECT'
      ' DOC.IDMODULO, '
      
        '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DO' +
        'C.IDPESSOA,'
      '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO,'
      
        '  DOC.CODDOCUMENTO, 0 AS NUMLANCTO, 0 AS VALOR, -1 AS CODALTERAD' +
        'OR,'
      '  '#39' '#39' AS PLACONTA, 0 AS PLANO,'
      '  BAS.VALOR AS VALBASE,'
      '  '#39'          '#39' AS CODTIPRECDES,'
      '  BAS.DATALANCTO,'
      '  0 AS IDLANCIRRF,'
      '  FSV.CODNATUREZA,'
      '  0 AS CODIMPOSTO,'
      '  '#39'(Rendimentos)'#39' AS NOMEIMPOSTO,'
      '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP,'
      '  0 AS CODIGOGPS,'
      '  PES.NUMDOCUMENTO AS PROXNUMDOC'
      'FROM'
      '  PARAMIRRF     PIR,'
      '  DOCUMENTO     DOC,'
      '  PESSOA        PES,'
      '  FORNSERV      FSV,'
      '  ('
      '  SELECT'
      '     CODDOCUMENTO, VALOR, DATALANCTO'
      '  FROM'
      '     LANCTODOCUM'
      '  WHERE'
      '        OPERACAO   = '#39'2'#39
      
        '    AND DATALANCTO BETWEEN TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE('#39'31/01/2007'#39', '#39'DD/MM/YYYY'#39')'
      '    AND ESTORNO    IS NULL'
      '  ) BAS'
      'WHERE'
      '      DOC.CODDOCUMENTO   = BAS.CODDOCUMENTO'
      '  AND DOC.IDFORCLI       = PES.IDPESSOA'
      '  AND DOC.IDFORCLI       = FSV.IDPESSOA'
      '  AND NOT EXISTS ('
      '                 SELECT  IDLANCIRRF'
      '                 FROM    LANCIRRF'
      '                 WHERE   CODDOCUMENTO    = DOC.CODDOCUMENTO'
      '                 )'
      '  AND NOT EXISTS ('
      '                 SELECT  IDIMPOSTORETIDO'
      '                 FROM    IMPOSTORETIDO'
      '                 WHERE   CODDOCUMENTO = DOC.CODDOCUMENTO'
      '                 )'
      '  AND FSV.CODNATUREZA    IS NOT NULL'
      'ORDER BY'
      '  RAZAOSOCIAL, DATALANCTO, IDFORCLI'
      ' '
      ' ')
    ClientDataSet = cdsDocumento
    Left = 560
    Top = 8
  end
  object cdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 4
  end
  object dtsDocumento: TwwDataSource
    DataSet = cdsDocumento
    Left = 504
  end
end
