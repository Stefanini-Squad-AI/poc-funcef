inherited frmParamBescCnab240MT: TfrmParamBescCnab240MT
  Left = 236
  Top = 119
  Caption = 'Cobrança BESC - Cnab 240'
  ClientHeight = 442
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 403
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 560
      Height = 401
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object NtbCnab: TNotebook
        Left = 85
        Top = 1
        Width = 474
        Height = 399
        Align = alClient
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Geral'
          object Label1: TLabel
            Left = 340
            Top = 13
            Width = 90
            Height = 13
            Caption = 'Data do Crédito'
            Color = clScrollBar
            ParentColor = False
          end
          object Label2: TLabel
            Left = 13
            Top = 58
            Width = 45
            Height = 13
            Caption = 'Carteira'
            Color = clScrollBar
            ParentColor = False
          end
          object Label3: TLabel
            Left = 245
            Top = 109
            Width = 119
            Height = 13
            Caption = 'Emissão do Bloqueto'
            Color = clScrollBar
            ParentColor = False
          end
          object Label6: TLabel
            Left = 245
            Top = 160
            Width = 119
            Height = 13
            Caption = 'Código para protesto'
            Color = clScrollBar
            ParentColor = False
          end
          object Label7: TLabel
            Left = 413
            Top = 160
            Width = 26
            Height = 13
            Caption = 'Dias'
            Color = clScrollBar
            ParentColor = False
          end
          object Label8: TLabel
            Left = 245
            Top = 214
            Width = 139
            Height = 13
            Caption = 'Código baixa/devolução'
            Color = clScrollBar
            ParentColor = False
          end
          object Label9: TLabel
            Left = 413
            Top = 214
            Width = 26
            Height = 13
            Caption = 'Dias'
            Color = clScrollBar
            ParentColor = False
          end
          object Label10: TLabel
            Left = 157
            Top = 13
            Width = 158
            Height = 13
            Caption = 'Num. Contrato oper. crédito'
            Color = clScrollBar
            ParentColor = False
          end
          object Label25: TLabel
            Left = 13
            Top = 261
            Width = 237
            Height = 13
            Caption = 'Mensagem 1 (Header do Lote do Arquivo)'
            Color = clScrollBar
            ParentColor = False
          end
          object Label27: TLabel
            Left = 13
            Top = 303
            Width = 237
            Height = 13
            Caption = 'Mensagem 2 (Header do Lote do Arquivo)'
            Color = clScrollBar
            ParentColor = False
          end
          object Label29: TLabel
            Left = 245
            Top = 57
            Width = 114
            Height = 13
            Caption = 'Espécie dos Títulos'
            Color = clScrollBar
            ParentColor = False
          end
          object Label30: TLabel
            Left = 13
            Top = 13
            Width = 87
            Height = 13
            Caption = 'Num. Convênio'
            Color = clScrollBar
            ParentColor = False
          end
          object DtCredito: TCMDateTimePicker
            Left = 340
            Top = 29
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
            TabOrder = 1
          end
          object CmbCarteira: TComboBox
            Left = 13
            Top = 74
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 2
            Items.Strings = (
              '1 - Cobrança Simples'
              '3 - Cobrança Caucionada')
          end
          object RgFormaCad: TRadioGroup
            Left = 13
            Top = 100
            Width = 217
            Height = 49
            Caption = ' Cadastramento '
            Color = clScrollBar
            ItemIndex = 1
            Items.Strings = (
              '1 - Com Cadastramento'
              '2 - Sem Cadastramento')
            ParentColor = False
            TabOrder = 3
          end
          object RgTipoDoc: TRadioGroup
            Left = 13
            Top = 152
            Width = 219
            Height = 49
            Caption = ' Tipo de Documento '
            Color = clScrollBar
            ItemIndex = 0
            Items.Strings = (
              '1 - Tradicional'
              '2 - Escritural')
            ParentColor = False
            TabOrder = 4
          end
          object RgDistribuicao: TRadioGroup
            Left = 13
            Top = 204
            Width = 97
            Height = 49
            Caption = ' Distribuição '
            Color = clScrollBar
            ItemIndex = 0
            Items.Strings = (
              '1 - Banco'
              '2 - Cliente')
            ParentColor = False
            TabOrder = 5
          end
          object CmbEmissao: TComboBox
            Left = 245
            Top = 125
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 6
            Items.Strings = (
              '1 - Banco emite'
              '2 - Cliente emite'
              '4 - Banco reemite'
              '5 - Banco não reemite')
          end
          object RgAceite: TRadioGroup
            Left = 113
            Top = 204
            Width = 119
            Height = 49
            Caption = ' Aceite '
            Color = clScrollBar
            ItemIndex = 0
            Items.Strings = (
              'A - Aceite'
              'N - Não Aceite')
            ParentColor = False
            TabOrder = 7
          end
          object CmbProtesto: TComboBox
            Left = 245
            Top = 176
            Width = 156
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 8
            Items.Strings = (
              '1 - Protestar dias corridos'
              '2 - Protestar dias úteis'
              '3 - Não protestar')
          end
          object SpNumDiasProtesto: TSpinEdit
            Left = 415
            Top = 176
            Width = 47
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 9
            Value = 0
          end
          object CmbBaixaDevol: TComboBox
            Left = 245
            Top = 230
            Width = 156
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 10
            Items.Strings = (
              '1 - Baixa dias corridos'
              '2 - Baixa dias úteis'
              '3 - Não Baixar')
          end
          object SpNumDiasBaixa: TSpinEdit
            Left = 415
            Top = 230
            Width = 47
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 11
            Value = 0
          end
          object ReContrato: TRealEdit
            Left = 159
            Top = 29
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object EdtMens1: TEdit
            Left = 13
            Top = 277
            Width = 447
            Height = 21
            MaxLength = 40
            TabOrder = 12
          end
          object EdtMens2: TEdit
            Left = 13
            Top = 321
            Width = 447
            Height = 21
            MaxLength = 40
            TabOrder = 13
          end
          object CmEspecie: TComboBox
            Left = 245
            Top = 73
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 14
            Items.Strings = (
              '01 - CH   CHEQUE'
              '02 - DM   DUPLICATA MERCANTIL'
              '03 - DMI  DUPLICATA MERCANTIL P/INDICAÇÃO'
              '04 - DS   DUPLICATA DE SERVIÇO'
              '05 - DSI  DUPLICATA DE SERVIÇO P/INDICAÇÃO'
              '06 - DR   DUPLICATA RURAL'
              '07 - LC   LETRA DE CAMBIO'
              '08 - NCC  NOTA DE CRÉDITO COMERCIAL'
              '09 - NCE  NOTA DE CRÉDITO A EXPORTAÇÃO'
              '10 - NCI  NOTA DE CRÉDITO INSDUSTRIAL'
              '11 - NCR  NOTA DE CRÉDITO RURAL'
              '12 - NP   NOTA PROMISSÓRIA'
              '13 - NPR  NOTA PROMISSÓRIA RURAL'
              '14 - TM   TRIPLICATA MERCANTIL'
              '15 - TS   TRIPLICATA DE SERVIÇO'
              '16 - NS   NOTA DE SEGURO'
              '17 - RC   RECIBO'
              '18 - FAT  FATURA'
              '19 - ND   NOTA DE DÉBITO'
              '20 - AP   APÓLICE DE SEGURO'
              '21 - ME   MENSALIDADE ESCOLAR'
              '22 - PC   PARCELA DE CONSÓRCIO'
              '99 - OUTROS')
          end
          object rgTipo: TRadioGroup
            Left = 13
            Top = 350
            Width = 448
            Height = 41
            Caption = ' Tipo de Cobrança '
            Color = clScrollBar
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Cobrança Registrada'
              'Cobrança não Registrada')
            ParentColor = False
            TabOrder = 15
          end
          object ReNumConvenio: TEdit
            Left = 14
            Top = 28
            Width = 124
            Height = 21
            TabOrder = 16
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Alteradores'
          object Label11: TLabel
            Left = 12
            Top = 88
            Width = 125
            Height = 13
            Caption = 'Código do desconto 2'
          end
          object LblCodDesc3: TLabel
            Left = 12
            Top = 136
            Width = 125
            Height = 13
            Caption = 'Código do desconto 3'
          end
          object Label13: TLabel
            Left = 12
            Top = 183
            Width = 92
            Height = 13
            Caption = 'Código da multa'
          end
          object Label14: TLabel
            Left = 12
            Top = 9
            Width = 445
            Height = 26
            Caption = 
              'Atenção: Os Dados informados nesta seção são genéricos e serão a' +
              'ssociados a todos os documentos do arquivo'
            WordWrap = True
          end
          object Label12: TLabel
            Left = 235
            Top = 88
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label15: TLabel
            Left = 342
            Top = 88
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label16: TLabel
            Left = 235
            Top = 136
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label17: TLabel
            Left = 342
            Top = 136
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label18: TLabel
            Left = 235
            Top = 184
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label19: TLabel
            Left = 342
            Top = 184
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label24: TLabel
            Left = 12
            Top = 265
            Width = 238
            Height = 13
            Caption = 'Mensagem 3 ( Opcional para alteradores )'
          end
          object Label26: TLabel
            Left = 12
            Top = 307
            Width = 238
            Height = 13
            Caption = 'Mensagem 4 ( Opcional para alteradores )'
          end
          object Label4: TLabel
            Left = 12
            Top = 41
            Width = 92
            Height = 13
            Caption = 'Código do Juros'
          end
          object Label5: TLabel
            Left = 238
            Top = 41
            Width = 116
            Height = 13
            Caption = 'Código do Desconto'
          end
          object Label28: TLabel
            Left = 12
            Top = 243
            Width = 442
            Height = 13
            Caption = 
              'Atenção: As mensagems informadas abaixo anularão as mensagens an' +
              'teriores'
          end
          object Bevel1: TBevel
            Left = 12
            Top = 230
            Width = 448
            Height = 2
            ParentShowHint = False
            Shape = bsTopLine
            ShowHint = False
            Style = bsRaised
          end
          object CmbCodDesc2: TComboBox
            Left = 12
            Top = 104
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 0
            Items.Strings = (
              '1 - Valor fixo até a data informa'
              '2 - Percentual até a data informada'
              '3 - Valor por antecipação dia corrido'
              '4 - Valor por antecipação dia útil'
              '5 - Percentual sobre o valor nominal dia corrido'
              '6 - Percentual sobre o valor nominal dia útil')
          end
          object CmbCodDesc3: TComboBox
            Left = 12
            Top = 152
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 1
            Items.Strings = (
              '1 - Valor fixo até a data informa'
              '2 - Percentual até a data informada'
              '3 - Valor por antecipação dia corrido'
              '4 - Valor por antecipação dia útil'
              '5 - Percentual sobre o valor nominal dia corrido'
              '6 - Percentual sobre o valor nominal dia útil')
          end
          object CmbMulta: TComboBox
            Left = 12
            Top = 199
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 2
            Items.Strings = (
              '1 - Valor fixo'
              '2 - Percentual')
          end
          object DtDesc2: TCMDateTimePicker
            Left = 235
            Top = 104
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
            TabOrder = 3
          end
          object ReValDesc2: TRealEdit
            Left = 341
            Top = 104
            Width = 119
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DtDesc3: TCMDateTimePicker
            Left = 235
            Top = 152
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
            TabOrder = 5
          end
          object ReValDesc3: TRealEdit
            Left = 341
            Top = 152
            Width = 119
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DtMulta: TCMDateTimePicker
            Left = 235
            Top = 200
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
            TabOrder = 7
          end
          object ReValMulta: TRealEdit
            Left = 341
            Top = 200
            Width = 119
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object EdtMens3: TEdit
            Left = 12
            Top = 281
            Width = 447
            Height = 21
            MaxLength = 40
            TabOrder = 9
          end
          object EdtMens4: TEdit
            Left = 12
            Top = 325
            Width = 447
            Height = 21
            MaxLength = 40
            TabOrder = 10
          end
          object CmbCodJuros: TComboBox
            Left = 12
            Top = 57
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 11
            Items.Strings = (
              '1 - Valor por dia'
              '2 - Taxa Mensal'
              '3 - Isento')
          end
          object CmbCodDesc: TComboBox
            Left = 238
            Top = 57
            Width = 217
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 12
            Items.Strings = (
              '1 - Valor fixo até a data informa'
              '2 - Percentual até a data informada'
              '3 - Valor por antecipação dia corrido'
              '4 - Valor por antecipação dia útil'
              '5 - Percentual sobre o valor nominal dia corrido'
              '6 - Percentual sobre o valor nominal dia útil')
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Mensagens'
          object Label20: TLabel
            Left = 12
            Top = 15
            Width = 105
            Height = 13
            Caption = 'Tipo de Impressão'
          end
          object Label21: TLabel
            Left = 238
            Top = 85
            Width = 171
            Height = 13
            Caption = 'Numero da linha de impressão'
          end
          object Label22: TLabel
            Left = 12
            Top = 65
            Width = 185
            Height = 13
            Caption = 'Tipo de Caracter para impressão'
          end
          object Label23: TLabel
            Left = 14
            Top = 117
            Width = 197
            Height = 13
            Caption = 'Mensagem Frente\Verso Cobrança'
          end
          object CmbTipoImpressao: TComboBox
            Left = 12
            Top = 31
            Width = 442
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 0
            Items.Strings = (
              '1- Frente do Bloqueto'
              '2 - Verso do Bloqueto'
              '3 - Campo deinstruções da ficha de compensação do bloqueto')
          end
          object SpeNumLinhas: TSpinEdit
            Left = 412
            Top = 83
            Width = 42
            Height = 22
            MaxValue = 36
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object cmbTipChar: TComboBox
            Left = 12
            Top = 83
            Width = 217
            Height = 22
            Style = csDropDownList
            DropDownCount = 500
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            Sorted = True
            TabOrder = 2
            Items.Strings = (
              '01 - Normal'
              '02 - Itálico'
              '03 - Normal negrito'
              '04 - Itálico negrito')
          end
          object EdtMesnCnab: TEdit
            Left = 14
            Top = 134
            Width = 443
            Height = 21
            MaxLength = 140
            TabOrder = 3
          end
        end
      end
      object fcObParametros: TfcOutlookBar
        Left = 1
        Top = 1
        Width = 84
        Height = 399
        ActivePage = fcObParametrosfcShapeBtn1
        Align = alLeft
        Animation.Enabled = True
        Animation.Interval = 1
        Animation.Steps = 7
        AutoBold = True
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ButtonSize = 20
        ButtonClassName = 'TfcShapeBtn'
        Layout = loVertical
        Options = [cboAutoCreateOutlookList]
        PanelAlignment = paDynamic
        ShowButtons = True
        TabOrder = 1
        object fcObParametrosfcShapeBtn1: TfcShapeBtn
          Left = 0
          Top = 0
          Width = 80
          Height = 20
          Caption = 'Parâmetros'
          Color = clBtnFace
          DitherColor = clWhite
          Down = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          GroupIndex = 1
          Options = [boOverrideActionGlyph]
          ParentClipping = False
          ParentFont = False
          RoundRectBias = 60
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object TfcOutlookPanel
          Left = 0
          Top = 20
          Width = 80
          Height = 375
          object fcListPrametros: TfcOutlookList
            Left = 0
            Top = 0
            Width = 80
            Height = 375
            Align = alClient
            BorderStyle = bsSingle
            ClickStyle = csSelect
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphTop
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = True
                Separation = 10
                Tag = 0
                Text = 'Geral'
              end
              item
                ImageIndex = 2
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Alteradores'
              end
              item
                ImageIndex = 1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Layout'
              end>
            ItemSpacing = 20
            ItemsWidth = 60
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
end
