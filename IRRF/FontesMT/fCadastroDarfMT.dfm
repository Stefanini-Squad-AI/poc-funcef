inherited frmCadastroDarfMT: TfrmCadastroDarfMT
  Left = 141
  Top = 162
  HelpContext = 240002
  Caption = 'Lançamentos do Darf'
  ClientHeight = 448
  ClientWidth = 648
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 362
    object pgcDados: TPageControl
      Left = 1
      Top = 1
      Width = 646
      Height = 360
      ActivePage = tbsDados1
      Align = alClient
      TabOrder = 0
      object tbsDados1: TTabSheet
        Caption = 'Dados Básicos'
        object Label3: TLabel
          Left = 8
          Top = 74
          Width = 55
          Height = 13
          Caption = 'CPF/CGC'
        end
        object Label5: TLabel
          Left = 224
          Top = 74
          Width = 53
          Height = 13
          Caption = 'Processo'
        end
        object Label4: TLabel
          Left = 320
          Top = 74
          Width = 63
          Height = 13
          Caption = 'Referência'
        end
        object Label10: TLabel
          Left = 8
          Top = 122
          Width = 141
          Height = 13
          Caption = 'Natureza do Rendimento'
        end
        object Label11: TLabel
          Left = 8
          Top = 170
          Width = 69
          Height = 13
          Caption = 'Observação'
        end
        object GroupBox1: TGroupBox
          Left = 456
          Top = 256
          Width = 169
          Height = 65
          TabOrder = 9
          object Label13: TLabel
            Left = 40
            Top = 18
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object DBedtVlrTotal: TDBRealEdit
            Left = 40
            Top = 32
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Color = clSilver
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRTOTAL'
            DataSource = ds
          end
        end
        object PSubTipoBeneficiario1: TCMProcuraSubTipo
          Left = 8
          Top = 8
          Width = 401
          Height = 49
          Caption = ' Fonte Pagadora '
          Enabled = False
          TabOrder = 0
          CampoEdit = ceRazaoSocial
          MostraMensagens = False
          DataSource = ds
          DataField = 'IDPESSOA'
          Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
          Mensagens.NaoExiste = 'Beneficiário não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          SubTipo = stCliente
          FiltraSubTipo = False
        end
        object grpboxDatas: TGroupBox
          Left = 456
          Top = 8
          Width = 169
          Height = 241
          Caption = ' Datas '
          TabOrder = 1
          object Label14: TLabel
            Left = 24
            Top = 18
            Width = 110
            Height = 13
            Caption = 'Início da Apuração'
          end
          object Label7: TLabel
            Left = 24
            Top = 58
            Width = 104
            Height = 13
            Caption = 'Final da Apuração'
          end
          object Label8: TLabel
            Left = 24
            Top = 154
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label9: TLabel
            Left = 24
            Top = 194
            Width = 110
            Height = 13
            Caption = 'Pagamento do Darf'
          end
          object lblEmissao: TLabel
            Left = 24
            Top = 114
            Width = 96
            Height = 13
            Caption = 'Data de Emissão'
          end
          object edtDataIniApuracao: TCMDateTimePicker
            Left = 24
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINIAPURACAO'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
          end
          object edtDataFimApuracao: TCMDateTimePicker
            Left = 24
            Top = 72
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAFINALAPURACAO'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
          object edtVencimento: TCMDateTimePicker
            Left = 24
            Top = 168
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCDARF'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 3
          end
          object edtPagtoDarf: TCMDateTimePicker
            Left = 24
            Top = 208
            Width = 121
            Height = 21
            Hint = 'Data que o documento gerado para pagamento do Darf foi baixado.'
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPAGTODARF'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            ShowButton = True
            TabOrder = 4
          end
          object edtDataEmissao: TCMDateTimePicker
            Left = 24
            Top = 128
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAEMISDARF'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 2
          end
        end
        object DBedtCGC: TwwDBEdit
          Left = 8
          Top = 88
          Width = 201
          Height = 21
          DataField = 'NUMDOCUMENTO'
          DataSource = ds
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBedtProcesso: TwwDBEdit
          Left = 224
          Top = 88
          Width = 81
          Height = 21
          DataField = 'PROCESSO'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBedtReferencia: TwwDBEdit
          Left = 320
          Top = 88
          Width = 89
          Height = 21
          DataField = 'REFERENCIA'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBcboNatureza: TwwDBLookupCombo
          Left = 8
          Top = 136
          Width = 281
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição'
            'CODNATUREZA'#9'4'#9'Código')
          DataField = 'CODNATUREZA'
          DataSource = ds
          LookupTable = dtmLookIRRF.cdsLookNatureza
          LookupField = 'CODNATUREZA'
          Options = [loTitles]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBchkImpresso: TDBCheckBox
          Left = 304
          Top = 138
          Width = 111
          Height = 17
          Caption = 'DARF Impresso'
          DataField = 'FLGIMPRESSO'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBedtObservacao: TwwDBEdit
          Left = 8
          Top = 184
          Width = 401
          Height = 21
          DataField = 'OBSDARF'
          DataSource = ds
          MaxLength = 1000
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object gbValores: TGroupBox
          Left = 8
          Top = 216
          Width = 401
          Height = 105
          Caption = ' Valores '
          TabOrder = 8
          object lblBase: TLabel
            Left = 16
            Top = 18
            Width = 95
            Height = 13
            Caption = 'Base do Imposto'
          end
          object lblIRRF: TLabel
            Left = 152
            Top = 18
            Width = 76
            Height = 13
            Caption = 'Valor do Darf'
          end
          object Label1: TLabel
            Left = 152
            Top = 58
            Width = 83
            Height = 13
            Caption = 'Valor de Multa'
          end
          object Label2: TLabel
            Left = 288
            Top = 18
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object lblPerc: TLabel
            Left = 340
            Top = 34
            Width = 14
            Height = 16
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 16
            Top = 58
            Width = 82
            Height = 13
            Caption = 'Valor do Juros'
          end
          object Label6: TLabel
            Left = 288
            Top = 58
            Width = 88
            Height = 13
            Caption = 'Valor Desconto'
          end
          object DBedtVlrBase: TDBRealEdit
            Left = 16
            Top = 32
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRBASECALCULO'
            DataSource = ds
          end
          object DBedtVlrMulta: TDBRealEdit
            Left = 152
            Top = 72
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            OnExit = DBedtVlrDarfExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRMULTA'
            DataSource = ds
          end
          object DBedtPercDarf: TDBRealEdit
            Left = 288
            Top = 32
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCIRRF'
            DataSource = ds
          end
          object DBedtVlrDarf: TDBRealEdit
            Left = 152
            Top = 32
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            OnExit = DBedtVlrDarfExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRIRRF'
            DataSource = ds
          end
          object DBedtVlrJuros: TDBRealEdit
            Left = 16
            Top = 72
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            OnExit = DBedtVlrDarfExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRJUROS'
            DataSource = ds
          end
          object DBedtVlrDesconto: TDBRealEdit
            Left = 288
            Top = 72
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            OnExit = DBedtVlrDarfExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VlrDesconto'
            DataSource = ds
          end
        end
      end
      object tbsDados2: TTabSheet
        Caption = 'Dados Adicionais'
        ImageIndex = 1
        object lblPlanoPrevC: TLabel
          Left = 8
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object lblPatroC: TLabel
          Left = 208
          Top = 10
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object lblPrograma: TLabel
          Left = 424
          Top = 10
          Width = 54
          Height = 13
          Caption = 'Programa'
        end
        object Label17: TLabel
          Left = 8
          Top = 58
          Width = 145
          Height = 13
          Caption = 'Referência do C. a Pagar'
        end
        object LblFormaPag: TLabel
          Left = 208
          Top = 58
          Width = 73
          Height = 13
          Caption = 'Observação '
        end
        object Label15: TLabel
          Left = 8
          Top = 104
          Width = 27
          Height = 13
          Caption = 'Vara'
        end
        object Label16: TLabel
          Left = 8
          Top = 154
          Width = 57
          Height = 13
          Caption = 'Município'
        end
        object rgDeclaracao: TLabel
          Left = 208
          Top = 154
          Width = 100
          Height = 13
          Caption = 'Tipo de Processo'
        end
        object Label18: TLabel
          Left = 360
          Top = 154
          Width = 89
          Height = 13
          Caption = 'Medida Judicial'
        end
        object DBcboPlanoPrevC: TwwDBLookupCombo
          Left = 8
          Top = 24
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome')
          DataField = 'IDPLANOPREV'
          DataSource = ds
          LookupTable = dtmLookIRRF.cdsLookPlanoPrev
          LookupField = 'IDPLANOPREV'
          Options = [loColLines]
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboPatroC: TwwDBLookupCombo
          Left = 208
          Top = 24
          Width = 201
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome')
          DataField = 'IDPATRO'
          DataSource = ds
          LookupTable = dtmLookIRRF.cdsLookPatro
          LookupField = 'IDPESSOA'
          Options = [loColLines]
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboPrograma: TwwDBLookupCombo
          Left = 424
          Top = 24
          Width = 201
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPROGRAMA'#9'60'#9'Descrição'
            'CODPROGRAMA'#9'2'#9'Código')
          DataField = 'IDPROGRAMA'
          DataSource = ds
          LookupTable = dtmLookIRRF.cdsLookPrograma
          LookupField = 'IDPROGRAMA'
          Options = [loColLines]
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBEdit1: TwwDBEdit
          Left = 8
          Top = 118
          Width = 185
          Height = 21
          DataField = 'VARA'
          DataSource = ds
          MaxLength = 2
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBcboMunicipio: TwwDBLookupCombo
          Left = 8
          Top = 168
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME'#9'F')
          DataField = 'IDCIDADES'
          DataSource = ds
          LookupField = 'IDCIDADES'
          Options = [loColLines]
          Style = csDropDownList
          DropDownCount = 5
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object cboTipoProcesso: TComboBox
          Left = 208
          Top = 168
          Width = 133
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          MaxLength = 4
          TabOrder = 7
          Items.Strings = (
            ''
            'Sem Processo'
            'Administrativo'
            'Judicial')
        end
        object cboMedidaJudicial: TComboBox
          Left = 360
          Top = 168
          Width = 265
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          MaxLength = 4
          TabOrder = 8
          Items.Strings = (
            ''
            'Não se aplica'
            'Liminar em Mandado de Segurança'
            'Antecipação de Tutela'
            'Liminar em Medida Cautelar'
            'Outros')
        end
        object pnlPlanoPatroC: TPanel
          Left = 24
          Top = 287
          Width = 601
          Height = 40
          BevelOuter = bvNone
          TabOrder = 9
        end
        object edRef: TDBEdit
          Left = 8
          Top = 72
          Width = 184
          Height = 21
          DataField = 'REFCAP'
          DataSource = dsDados
          TabOrder = 3
        end
        object meOBS: TDBMemo
          Left = 208
          Top = 72
          Width = 417
          Height = 67
          DataField = 'OBS'
          DataSource = dsDados
          MaxLength = 1000
          ScrollBars = ssVertical
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 648
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 648
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 240003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 992
    Top = 0
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 960
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 336
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DARF.NUMDOCUMENTO'
      'DARF.DATAINIAPURACAO'
      'DARF.DATAFINALAPURACAO'
      'DARF.DATAVENCDARF'
      'DARF.DATAPAGTODARF'
      'DARF.VLRIRRF')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Cgc/Cpf'
      'Data Inicio da Apuração'
      'Data Final da Apuração'
      'Data de Vencimento'
      'Data de Pagamento'
      'Valor do Imposto Devido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'DARF')
    CamposChave.Strings = (
      'DARF.IDDARF')
    Filtro.Strings = (
      'DARF.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '60'
      '14'
      '1'
      '60'
      '10'
      '10'
      '10')
    Left = 420
    Top = 3
  end
  object cdsCodRendGer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 296
  end
  object cdsNatureza1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 736
    Top = 200
  end
  object cdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 152
  end
  object cdsBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 736
    Top = 104
  end
  object cdsLanctoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 736
    Top = 152
  end
  object cdsLancamentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 248
  end
  object cdsDadosDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 556
    Top = 65535
  end
  object dsDados: TDataSource
    DataSet = cdsDadosDoc
    Left = 496
    Top = 65535
  end
  object cdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 104
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 736
    Top = 248
  end
  object cdsLancAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 200
  end
  object cdsRateioAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 56
  end
  object cdsLancDarf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 736
    Top = 56
  end
end
