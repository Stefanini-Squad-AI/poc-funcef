inherited frmExecLiberaConcessao: TfrmExecLiberaConcessao
  Left = 1
  Top = 96
  HelpContext = 150005
  Caption = 'Liberação de Concessão'
  ClientHeight = 411
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 378
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 251
      Height = 24
      Caption = 'Liberação de Concessão'
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
    object Label29: TLabel
      Left = 16
      Top = 42
      Width = 114
      Height = 13
      Caption = 'Número do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 376
      Top = 266
      Width = 63
      Height = 13
      Caption = 'Taxa Juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label43: TLabel
      Left = 136
      Top = 266
      Width = 90
      Height = 13
      Caption = 'Data do Crédito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 266
      Width = 109
      Height = 13
      Caption = 'Data de Assinatura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 464
      Top = 266
      Width = 90
      Height = 13
      Caption = 'Valor Solicitado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 576
      Top = 266
      Width = 68
      Height = 13
      Caption = 'Nº Parcelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 648
      Top = 266
      Width = 95
      Height = 13
      Caption = 'Valor da Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 256
      Top = 266
      Width = 109
      Height = 13
      Caption = 'Data da 1º Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 314
      Width = 169
      Height = 13
      Caption = 'Débito - Forma de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 383
      Top = 178
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 178
      Width = 122
      Height = 13
      Caption = 'Plano Previdenciário '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 168
      Top = 42
      Width = 50
      Height = 13
      Caption = 'Mutuário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 16
      Top = 138
      Width = 141
      Height = 13
      Caption = 'Situação do Participante'
    end
    object Label7: TLabel
      Left = 16
      Top = 90
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label8: TLabel
      Left = 144
      Top = 90
      Width = 36
      Height = 13
      Caption = 'C.P.F.'
    end
    object Label11: TLabel
      Left = 382
      Top = 218
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 218
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBedtNumContrato: TDBEdit
      Left = 16
      Top = 56
      Width = 112
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDCONTRATOEMPTMO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnBuscaContrato: TBitBtn
      Left = 128
      Top = 56
      Width = 24
      Height = 22
      Hint = 'Busca o Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnBuscaContratoClick
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
    object DBedtJuros: TDBEdit
      Left = 376
      Top = 280
      Width = 73
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'TXJUROS'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBedtDataInsc: TCMDateTimePicker
      Left = 16
      Top = 280
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clBtnFace
      ButtonStyle = cbsCustom
      DataField = 'DATAASSINATURA'
      DataSource = dts
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
      ReadOnly = True
      ShowButton = True
      TabOrder = 3
    end
    object DBedtDataCredito: TCMDateTimePicker
      Left = 136
      Top = 280
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clBtnFace
      ButtonStyle = cbsCustom
      DataField = 'DATACREDITO'
      DataSource = dts
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
      ReadOnly = True
      ShowButton = True
      TabOrder = 4
    end
    object DBedtValSolic: TDBEdit
      Left = 464
      Top = 280
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'VLRCONTRATO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBedtValorParcela: TDBEdit
      Left = 646
      Top = 280
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'VLRPARCELA'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBedtParcelas: TDBEdit
      Left = 576
      Top = 280
      Width = 68
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DataField = 'PRAZO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBedtDataPrimParcela: TCMDateTimePicker
      Left = 256
      Top = 280
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clBtnFace
      ButtonStyle = cbsCustom
      DataField = 'DATAPRIMPARC'
      DataSource = dts
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
      ReadOnly = True
      ShowButton = True
      TabOrder = 8
    end
    object DBedtFormaPagto: TDBEdit
      Left = 16
      Top = 328
      Width = 433
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'FORMAPAGAMORT'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBedtPatro: TDBEdit
      Left = 16
      Top = 192
      Width = 361
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'PATRO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object DBedtPlanoPrev: TDBEdit
      Left = 382
      Top = 192
      Width = 361
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'PLANOPREV'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object DBedtSitPart: TDBEdit
      Left = 16
      Top = 152
      Width = 241
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'SITDESCRICAO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object DBedtBeneficiario: TDBEdit
      Left = 168
      Top = 56
      Width = 573
      Height = 21
      DataField = 'NOME_MUTUARIO'
      DataSource = dts
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object grpTitular: TGroupBox
      Left = 270
      Top = 84
      Width = 473
      Height = 89
      Caption = ' Dados do Participante Titular '
      Enabled = False
      TabOrder = 14
      object Label9: TLabel
        Left = 24
        Top = 42
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label16: TLabel
        Left = 152
        Top = 42
        Width = 36
        Height = 13
        Caption = 'C.P.F.'
      end
      object Label18: TLabel
        Left = 336
        Top = 42
        Width = 114
        Height = 13
        Caption = 'Insc. Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBedtMtrEmpresa: TDBEdit
        Left = 24
        Top = 56
        Width = 113
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'MATRICULA'
        DataSource = dts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBedtCPF: TDBEdit
        Left = 152
        Top = 56
        Width = 113
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'CPF_TITULAR'
        DataSource = dts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBedtInscricao: TDBEdit
        Left = 336
        Top = 56
        Width = 113
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'INSCRICAONUMERO'
        DataSource = dts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBedtParticipante: TDBEdit
        Left = 24
        Top = 16
        Width = 425
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NOME_TITULAR'
        DataSource = dts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 104
      Width = 113
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'MATRICULA_MUTUARIO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 104
      Width = 113
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CPF_MUTUARIO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object DBedtTipoEmptmo: TDBEdit
      Left = 382
      Top = 232
      Width = 361
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'TCEDESCRICAO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 232
      Width = 361
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DESCTIPOEMPTMO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
    object Panel1: TPanel
      Left = 512
      Top = 312
      Width = 233
      Height = 49
      TabOrder = 19
      object Label15: TLabel
        Left = 17
        Top = 20
        Width = 98
        Height = 13
        Caption = 'Data de Crédito: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataCredito: TCMDateTimePicker
        Left = 120
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
        ShowButton = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 375
      inherited sep1: TToolbarSep97
        Left = 299
      end
      inherited ToolbarSep971: TToolbarSep97
        Left = 216
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 382
      end
      inherited bbtnSair: TBitBtn
        Left = 218
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 301
        ClickHelpContext = 150001
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 216
        Height = 27
        Caption = '&Confirmar Alteração e Liberação'
        Enabled = False
        ModalResult = 8
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
      end
    end
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = dtmEmptmo.qryDadosContrato
    Left = 720
    Top = 8
  end
  object qryUpdateContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '     CONTRATOEMPTMO'
      'SET '
      '     DATACREDITO = :PDATACREDITO'
      'WHERE'
      '     IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '    ')
    ValidateWithMask = True
    Left = 576
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryUpdateContratoDESCSITINSCRICAO: TStringField
      FieldName = 'DESCSITINSCRICAO'
      Size = 5
    end
    object qryUpdateContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryUpdateContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryUpdateContratoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryUpdateContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryUpdateContratoPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryUpdateContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryUpdateContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryUpdateContratoTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryUpdateContratoBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryUpdateContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryUpdateContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryUpdateContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryUpdateContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryUpdateContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryUpdateContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryUpdateContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryUpdateContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryUpdateContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryUpdateContratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryUpdateContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryUpdateContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryUpdateContratoFLGPENDENTE: TStringField
      FieldName = 'FLGPENDENTE'
      FixedChar = True
      Size = 1
    end
    object qryUpdateContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryUpdateContratoVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryUpdateContratoDATACANCINSC: TDateTimeField
      FieldName = 'DATACANCINSC'
    end
    object qryUpdateContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryUpdateContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryUpdateContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryUpdateContratoCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object qryUpdateContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryUpdateContratoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryUpdateContratoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryUpdateContratoVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryUpdateContratoFLGALTSALARIO: TFloatField
      FieldName = 'FLGALTSALARIO'
    end
    object qryUpdateContratoFLGALTMARGEM: TFloatField
      FieldName = 'FLGALTMARGEM'
    end
    object qryUpdateContratoFLGALTVALMAX: TFloatField
      FieldName = 'FLGALTVALMAX'
    end
    object qryUpdateContratoMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object qryUpdateContratoINSCRICAO_TIT: TFloatField
      FieldName = 'INSCRICAO_TIT'
    end
    object qryUpdateContratoCPF_TIT: TStringField
      FieldName = 'CPF_TIT'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object qryUpdateContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryUpdateContratoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryUpdateContratoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryUpdateContratoDATAENVIO: TDateTimeField
      FieldName = 'DATAENVIO'
    end
    object qryUpdateContratoDATARECEB: TDateTimeField
      FieldName = 'DATARECEB'
    end
    object qryUpdateContratoFLGINTERNET: TFloatField
      FieldName = 'FLGINTERNET'
    end
  end
  object qryUpdateHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '     HISTMOVEMPTMO'
      'SET'
      '     HMEDATAPREVISTA = :PDATACREDITO,'
      '     HMEDATAVENCTO   = :PDATACREDITO'
      'WHERE'
      '     IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      ''
      '    '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'DESCSITINSCRICAO'
      Size = 5
    end
    object FloatField1: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDSITPART'
    end
    object StringField2: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object StringField4: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object StringField7: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object StringField9: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object FloatField3: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField4: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object FloatField5: TFloatField
      FieldName = 'IDPATRO'
    end
    object FloatField6: TFloatField
      FieldName = 'IDBENEF'
    end
    object FloatField7: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object StringField10: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField8: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object FloatField9: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object FloatField10: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object StringField11: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object FloatField11: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object StringField12: TStringField
      FieldName = 'FLGPENDENTE'
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object FloatField12: TFloatField
      FieldName = 'VLRSOLIC'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATACANCINSC'
    end
    object StringField14: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object FloatField13: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object FloatField14: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object StringField15: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object FloatField15: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object FloatField16: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object FloatField17: TFloatField
      FieldName = 'VLRSALBASE'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object FloatField18: TFloatField
      FieldName = 'VLRMARGEM'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object FloatField19: TFloatField
      FieldName = 'VLRMAXPERMIT'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object FloatField20: TFloatField
      FieldName = 'MOECODIGO'
    end
    object FloatField21: TFloatField
      FieldName = 'VLRPARCELAMES'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object FloatField22: TFloatField
      FieldName = 'VLRPARCATRASO'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object FloatField23: TFloatField
      FieldName = 'FLGALTSALARIO'
    end
    object FloatField24: TFloatField
      FieldName = 'FLGALTMARGEM'
    end
    object FloatField25: TFloatField
      FieldName = 'FLGALTVALMAX'
    end
    object StringField16: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object FloatField26: TFloatField
      FieldName = 'INSCRICAO_TIT'
    end
    object StringField17: TStringField
      FieldName = 'CPF_TIT'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object FloatField27: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object FloatField28: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAENVIO'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATARECEB'
    end
    object FloatField29: TFloatField
      FieldName = 'FLGINTERNET'
    end
  end
end
