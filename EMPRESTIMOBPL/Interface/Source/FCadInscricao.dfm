inherited frmCadInscricao: TfrmCadInscricao
  Left = 233
  Top = 61
  HelpContext = 150002
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Inscrição em Empréstimo'
  ClientHeight = 590
  ClientWidth = 935
  Menu = MainMenu1
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label23: TLabel [0]
    Left = 20
    Top = 208
    Width = 68
    Height = 13
    Caption = 'Beneficiário'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label26: TLabel [1]
    Left = 301
    Top = 137
    Width = 68
    Height = 13
    Caption = 'Beneficiário'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 935
    Height = 522
    BorderWidth = 0
    object pnlDetalhe: TPanel
      Left = 0
      Top = 175
      Width = 935
      Height = 347
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pgcValores: TPageControl
        Left = 0
        Top = 0
        Width = 815
        Height = 347
        ActivePage = tbsDivida
        Align = alClient
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object tbsGeral: TTabSheet
          Caption = 'Condições Contratuais'
          ImageIndex = 3
          object Label40: TLabel
            Left = 426
            Top = 58
            Width = 86
            Height = 13
            Caption = 'Carência (dias)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 152
            Top = 58
            Width = 109
            Height = 13
            Caption = 'Data da Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 16
            Top = 58
            Width = 113
            Height = 13
            Caption = 'Data da Solicitação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 10
            Width = 88
            Height = 13
            Caption = 'Res. Poupança'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 184
            Top = 106
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
          object Label14: TLabel
            Left = 328
            Top = 106
            Width = 81
            Height = 13
            Caption = 'Taxa de Juros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 474
            Top = 106
            Width = 33
            Height = 13
            Caption = 'Prazo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 546
            Top = 106
            Width = 100
            Height = 13
            Caption = 'Prestação Básica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 288
            Top = 58
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
          object Label20: TLabel
            Left = 530
            Top = 58
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
          object Label27: TLabel
            Left = 13
            Top = 271
            Width = 50
            Height = 13
            Caption = 'SP Ativo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label32: TLabel
            Left = 224
            Top = 178
            Width = 69
            Height = 13
            Caption = 'SP Aux Doe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label34: TLabel
            Left = 120
            Top = 178
            Width = 66
            Height = 13
            Caption = 'SP Mantido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label33: TLabel
            Left = 325
            Top = 271
            Width = 54
            Height = 13
            Caption = 'Beneficio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label37: TLabel
            Left = 117
            Top = 10
            Width = 72
            Height = 13
            Caption = 'Salário Base'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 16
            Top = 106
            Width = 132
            Height = 13
            Caption = 'Valor Máximo Permitido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 140
            Top = 194
            Width = 57
            Height = 13
            Caption = 'Indexador'
          end
          object Label42: TLabel
            Left = 228
            Top = 10
            Width = 83
            Height = 13
            Caption = 'Total Parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label43: TLabel
            Left = 316
            Top = 10
            Width = 67
            Height = 13
            Caption = 'Pendências'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 16
            Top = 154
            Width = 139
            Height = 13
            Caption = 'Suspensão de Cobrança'
          end
          object lblHoraEncerra: TLabel
            Left = 15
            Top = 194
            Width = 110
            Height = 13
            Caption = 'Hora Encerramento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label35: TLabel
            Left = 428
            Top = 154
            Width = 112
            Height = 13
            Caption = 'Término Suspensão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 424
            Top = 128
            Width = 43
            Height = 17
            DataField = 'TCELEGENDAEXIBE'
            DataSource = dtsTipoContrato
          end
          object lblMargemConsignavel: TLabel
            Left = 403
            Top = 10
            Width = 118
            Height = 13
            Caption = 'Margem Consignável'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 320
            Top = 154
            Width = 90
            Height = 13
            Caption = 'Parc. Suspensa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 545
            Top = 154
            Width = 123
            Height = 13
            Caption = 'Valor Parc. Suspensa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rdgMargemConsignavel: TRadioButton
            Left = 404
            Top = 7
            Width = 140
            Height = 17
            Caption = 'Margem Consignável'
            Checked = True
            TabOrder = 31
            TabStop = True
            OnClick = rdgMargemConsignavelClick
          end
          object DBspeParcelas: TwwDBSpinEdit
            Left = 474
            Top = 120
            Width = 57
            Height = 30
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 1
            AutoFillDate = False
            AutoSize = False
            DataField = 'NUMPARCELAS'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
            UnboundDataType = wwDefault
            OnEnter = DBspeParcelasEnter
            OnExit = DBspeParcelasExit
            BeforeUpClick = DBspeParcelasAfterDownClick
            BeforeDownClick = DBspeParcelasAfterDownClick
          end
          object DBedtDataInsc: TCMDateTimePicker
            Left = 16
            Top = 72
            Width = 121
            Height = 30
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINSC'
            DataSource = ds
            Epoch = 1950
            ButtonWidth = 22
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
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 8
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
            OnEnter = DBedtDataInscEnter
            OnExit = DBedtDataInscExit
          end
          object edtDataCredito: TCMDateTimePicker
            Left = 288
            Top = 72
            Width = 121
            Height = 30
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 22
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
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 10
            DisplayFormat = 'dd/mm/yyyy'
            OnCloseUp = edtDataCreditoCloseUp
            OnChange = edtDataCreditoChange
            OnExit = edtDataCreditoExit
            OnKeyPress = edtDataCreditoKeyPress
          end
          object edtDataAssinatura: TCMDateTimePicker
            Left = 152
            Top = 72
            Width = 121
            Height = 30
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 22
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
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 9
            DisplayFormat = 'dd/mm/yyyy'
            OnEnter = edtDataAssinaturaEnter
            OnExit = edtDataAssinaturaExit
          end
          object edtCarencia: TEdit
            Left = 426
            Top = 72
            Width = 89
            Height = 30
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object edtPercentJuros: TRealEdit
            Left = 328
            Top = 120
            Width = 89
            Height = 30
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object edtValMargem: TRealEdit
            Left = 148
            Top = 325
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtValReserva: TRealEdit
            Left = 16
            Top = 24
            Width = 97
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtValorParcela: TRealEdit
            Left = 546
            Top = 120
            Width = 105
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
            WordWrap = False
            OnChange = edtValorParcelaChange
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DBedtValorSolic: TDBEdit
            Left = 184
            Top = 120
            Width = 129
            Height = 30
            AutoSize = False
            DataField = 'VLRSOLIC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            OnEnter = DBedtValorSolicEnter
            OnExit = DBedtValorSolicExit
          end
          object edtDataPrimParcela: TCMDateTimePicker
            Left = 530
            Top = 72
            Width = 121
            Height = 30
            TabStop = False
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 22
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
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 12
            DisplayFormat = 'dd/mm/yyyy'
          end
          object pnlRecebimento: TPanel
            Left = 425
            Top = 192
            Width = 129
            Height = 41
            BevelOuter = bvNone
            TabOrder = 24
            TabStop = True
            Visible = False
            object Label15: TLabel
              Left = 8
              Top = 2
              Width = 106
              Height = 13
              Caption = 'Data Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object DBedtDtRecebimento: TCMDateTimePicker
              Left = 8
              Top = 16
              Width = 109
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATARECEB'
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
              TabOrder = 0
              DisplayFormat = 'dd/mm/yyyy'
              Visible = False
            end
          end
          object edtSalParticipacao: TRealEdit
            Left = 13
            Top = 285
            Width = 89
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtSalAuxDoenca: TRealEdit
            Left = 221
            Top = 285
            Width = 89
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtSalMantido: TRealEdit
            Left = 117
            Top = 285
            Width = 89
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtSalBenef: TRealEdit
            Left = 325
            Top = 285
            Width = 89
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DBcboSuspensaoCobranca: TDBCheckBox
            Left = 15
            Top = 237
            Width = 326
            Height = 17
            TabStop = False
            Caption = 'Suspender indefinidamente cobrança das prestações'
            DataField = 'FLGSUSPENSAOAUTO'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 25
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
          end
          object RealEdit1: TRealEdit
            Left = 12
            Top = 325
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object btnAlteraSalarioBase: TBitBtn
            Left = 198
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Altera o Salário Base'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnAlteraSalarioBaseClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
              77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
              7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
              077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
              F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
              FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
              077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
              FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
              777777777787FF88777777777778887777777777777888777777}
            NumGlyphs = 2
          end
          object btnAlteraMargem: TBitBtn
            Left = 514
            Top = 24
            Width = 26
            Height = 22
            Hint = 'Altera a Margem Consignável'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnAlteraMargemClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
              77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
              7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
              077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
              F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
              FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
              077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
              FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
              777777777787FF88777777777778887777777777777888777777}
            NumGlyphs = 2
          end
          object DBEdtVlrMaxPermit: TDBEdit
            Left = 15
            Top = 120
            Width = 125
            Height = 30
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            DataField = 'VLRMAXPERMIT'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            OnExit = DBEdtVlrMaxPermitExit
          end
          object DBEdtMargem: TDBEdit
            Left = 405
            Top = 24
            Width = 108
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'VLRMARGEM'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnEnter = DBEdtMargemEnter
            OnExit = DBEdtMargemExit
          end
          object DBEdtSalarioBase: TDBEdit
            Left = 117
            Top = 24
            Width = 81
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'VLRSALBASE'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnEnter = DBEdtSalarioBaseEnter
            OnExit = DBEdtSalarioBaseExit
          end
          object dbcboMoeda: TwwDBLookupCombo
            Left = 140
            Top = 208
            Width = 81
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookMoeda
            LookupField = 'MOECODIGO'
            DropDownWidth = 8
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object btnAlteraVlrMax: TBitBtn
            Left = 148
            Top = 120
            Width = 30
            Height = 30
            Hint = 'Altera o Salário Base'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnClick = btnAlteraVlrMaxClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
              77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
              7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
              077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
              F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
              FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
              077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
              FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
              777777777787FF88777777777778887777777777777888777777}
            NumGlyphs = 2
          end
          object edtTotalParcelas: TRealEdit
            Left = 228
            Top = 24
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtTotalPendencias: TRealEdit
            Left = 316
            Top = 24
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DBcboSuspensao: TwwDBLookupCombo
            Left = 16
            Top = 168
            Width = 298
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TSEDESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = dtmLookEmptmo.qryLookTipoSusp
            LookupField = 'IDTIPOSUSPEMPTMO'
            DropDownWidth = 8
            TabOrder = 28
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = DBcboSuspensaoCloseUp
          end
          object edtHoraEncerra: TCMDateTimePicker
            Left = 15
            Top = 208
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
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
            ShowButton = True
            TabOrder = 29
            UnboundDataType = wwDTEdtTime
            Visible = False
          end
          object edtDataFinalSuspensao: TCMDateTimePicker
            Left = 428
            Top = 168
            Width = 113
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
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 30
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtTxJurosExibe: TRealEdit
            Left = 328
            Top = 120
            Width = 89
            Height = 30
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object rdgMargemAlt: TRadioButton
            Left = 548
            Top = 8
            Width = 131
            Height = 17
            Caption = 'Margem Alternativa'
            TabOrder = 32
            OnClick = rdgMargemConsignavelClick
          end
          object dbEdtMargemAlt: TDBEdit
            Left = 549
            Top = 24
            Width = 126
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'VLRMARGEMALT'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 33
            OnEnter = DBEdtMargemEnter
            OnExit = dbEdtMargemAltExit
          end
          object edtValMargemAlt: TRealEdit
            Left = 276
            Top = 325
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 34
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object btMudaPrazoSuspensao: TBitBtn
            Left = 398
            Top = 167
            Width = 25
            Height = 22
            Hint = 'Altera o Salário Base'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 35
            OnClick = btMudaPrazoSuspensaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
              77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
              7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
              077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
              F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
              FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
              077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
              FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
              777777777787FF88777777777778887777777777777888777777}
            NumGlyphs = 2
          end
          object edtValorParcSusp: TRealEdit
            Left = 546
            Top = 167
            Width = 103
            Height = 23
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object pnSuspParc: TPanel
            Left = 950
            Top = 7
            Width = 196
            Height = 127
            Color = clGray
            TabOrder = 36
            Visible = False
            object rgSuspParc: TRadioGroup
              Left = 7
              Top = 5
              Width = 182
              Height = 113
              Caption = ' Numero de Parcelas: '
              Columns = 3
              TabOrder = 0
              OnClick = rgSuspParcClick
              OnExit = rgSuspParcExit
            end
          end
          object edtPrazoSuspensao: TEdit
            Left = 319
            Top = 168
            Width = 77
            Height = 21
            ReadOnly = True
            TabOrder = 38
          end
          object btnLimpaSuspensao: TBitBtn
            Left = 654
            Top = 167
            Width = 25
            Height = 22
            Cancel = True
            Enabled = False
            ModalResult = 2
            TabOrder = 39
            OnClick = btnLimpaSuspensaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
        end
        object tbsItens: TTabSheet
          Caption = 'Itens'
          ImageIndex = 3
          object Label24: TLabel
            Left = 8
            Top = 6
            Width = 113
            Height = 13
            Caption = 'Itens de Concessão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBgrdItensConcessao: TwwDBGrid
            Left = 8
            Top = 20
            Width = 765
            Height = 269
            Selected.Strings = (
              'ITEM'#9'40'#9'Item'#9'F'
              'VALOR'#9'13'#9'Valor'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dtsItensConcessao
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = DBgrdItensConcessaoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdItensConcessaoTopRowChanged
          end
        end
        object tbsIntegracao: TTabSheet
          Caption = 'Integração'
          ImageIndex = 2
          object pnlIntegracao: TPanel
            Left = 0
            Top = 0
            Width = 807
            Height = 319
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel1: TBevel
              Left = 8
              Top = 108
              Width = 633
              Height = 2
              Shape = bsTopLine
            end
            object pnlCAP: TPanel
              Left = 168
              Top = 16
              Width = 465
              Height = 89
              BevelOuter = bvNone
              TabOrder = 0
              object lbFormPag: TLabel
                Left = 8
                Top = 50
                Width = 120
                Height = 13
                Caption = 'Forma de Pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label31: TLabel
                Left = 224
                Top = 50
                Width = 154
                Height = 13
                Caption = 'Conta-Caixa x Forma Pagto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBgBanco: TDBGrid
                Left = 8
                Top = 8
                Width = 454
                Height = 40
                DataSource = dsBanco
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -8
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 190
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMAGENCIA'
                    Title.Alignment = taCenter
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CONTACORRENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'Conta Corrente'
                    Width = 128
                    Visible = True
                  end>
              end
              object DBcboFormaPagamento: TwwDBLookupCombo
                Left = 8
                Top = 64
                Width = 201
                Height = 21
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
                DataField = 'CODFORMAPAG'
                DataSource = ds
                LookupTable = dtmLookEmptmo.qryLookFormaRecPag
                LookupField = 'CODFORMA'
                Style = csDropDownList
                ParentFont = False
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object DBcboCCaixaxFPagto: TwwDBLookupCombo
                Left = 224
                Top = 64
                Width = 241
                Height = 21
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
                DataField = 'PORTFORMAPAG'
                DataSource = ds
                LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
                LookupField = 'CODPORTFORMA'
                Style = csDropDownList
                ParentFont = False
                TabOrder = 2
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
            end
            object pnlCAR: TPanel
              Left = 168
              Top = 112
              Width = 473
              Height = 89
              BevelOuter = bvNone
              TabOrder = 2
              object Label30: TLabel
                Left = 8
                Top = 50
                Width = 195
                Height = 13
                Caption = 'Conta-Caixa x Forma Recebimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBcboFormaRecebimento: TwwDBLookupCombo
                Left = 8
                Top = 64
                Width = 457
                Height = 21
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
                DataField = 'PORTFORMAREC'
                DataSource = ds
                LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
                LookupField = 'CODPORTFORMA'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object DBGrid2: TDBGrid
                Left = 8
                Top = 8
                Width = 454
                Height = 40
                DataSource = dsBancoDeb
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -8
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 190
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMAGENCIA'
                    Title.Alignment = taCenter
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CONTACORRENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'Conta Corrente'
                    Width = 128
                    Visible = True
                  end>
              end
            end
            object DBrdgCredito: TDBRadioGroup
              Left = 11
              Top = 18
              Width = 154
              Height = 61
              BiDiMode = bdLeftToRight
              Caption = ' Crédito '
              DataField = 'FLGFORMAPAG'
              DataSource = ds
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Contas a Pagar'
                'Folha de Pagamento')
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Values.Strings = (
                'C'
                'F')
              OnChange = DBrdgCreditoChange
              OnEnter = DBrdgCreditoEnter
              OnExit = DBrdgCreditoExit
            end
            object DBrdgDebito: TDBRadioGroup
              Left = 10
              Top = 115
              Width = 154
              Height = 61
              Caption = ' Débito '
              DataField = 'FLGFORMAREC'
              DataSource = ds
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Contas a Receber'
                'Folha de Pagamento')
              ParentFont = False
              TabOrder = 3
              Values.Strings = (
                'C'
                'F')
              OnChange = DBrdgDebitoChange
              OnExit = DBrdgDebitoExit
            end
          end
        end
        object tbsDivida: TTabSheet
          Caption = 'Dívidas de Empréstimo'
          object Label44: TLabel
            Left = 367
            Top = 288
            Width = 311
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor total para quitação do(s) Contrato(s) anterior(es):'
          end
          object DBgrdDivEmp: TwwDBGrid
            Left = 3
            Top = 32
            Width = 780
            Height = 247
            Selected.Strings = (
              'FLGESCOLHA'#9'2'#9' '
              'IDCONTRATOEMPTMO'#9'10'#9'Contrato'
              'TCEDESCRICAO'#9'15'#9'Tipo Contrato'
              'VLRCONTRATO'#9'10'#9'Vlr. Contrato'
              'DATACREDITO'#9'10'#9'Data Crédito'
              'NUMPARCELAS'#9'4'#9'Prazo'
              'VLRPARCELA'#9'7'#9'Parcela'
              'HMESALDODEV'#9'10'#9'Saldo Dev.'
              'VLREMABERTO'#9'10'#9'Pendências'
              'NUMPARCPAGAS'#9'5'#9'Pagas'
              'VLRATUAL'#9'11'#9'Vlr a Quitar'
              'ULT_PARC'#9'6'#9'Ult. Parc')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dtsContratoAnteriores
            EditCalculated = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'Arial'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = DBgrdDivEmpCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdDivEmpTopRowChanged
          end
          object pnlDividaTop: TPanel
            Left = 0
            Top = 0
            Width = 807
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object btnIncluirQuitar: TSpeedButton
              Left = 717
              Top = 4
              Width = 32
              Height = 25
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                77777777777777777777777777788877777777777700087777777777770F0877
                77777777770F087777777778880F088888777700000F00000877770FFFFFFFFF
                08777700000F000007777777770F087777777777770F087777777777770F0877
                7777777777000777777777777777777777777777777777777777}
              OnClick = btnIncluirQuitarClick
            end
            object btnRetirarQuitar: TSpeedButton
              Left = 750
              Top = 4
              Width = 32
              Height = 25
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888877777777777888800000000000788880FFFFFFFFF
                0788880000000000088888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              OnClick = btnIncluirQuitarClick
            end
          end
          object edtQuitacao: TRealEdit
            Left = 684
            Top = 284
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Outras Dívidas'
          ImageIndex = 6
          object Label11: TLabel
            Left = 453
            Top = 172
            Width = 225
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor total para quitação da(s) Dívidas:'
            Visible = False
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 807
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btnIncluirQuitarDividas: TSpeedButton
              Left = 711
              Top = 4
              Width = 34
              Height = 25
              Enabled = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                77777777777777777777777777788877777777777700087777777777770F0877
                77777777770F087777777778880F088888777700000F00000877770FFFFFFFFF
                08777700000F000007777777770F087777777777770F087777777777770F0877
                7777777777000777777777777777777777777777777777777777}
              Visible = False
              OnClick = btnIncluirQuitarClick
            end
            object btnRetirarQuitarDividas: TSpeedButton
              Left = 748
              Top = 4
              Width = 34
              Height = 25
              Enabled = False
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888877777777777888800000000000788880FFFFFFFFF
                0788880000000000088888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              Visible = False
              OnClick = btnIncluirQuitarClick
            end
          end
          object wwDBGrid1: TwwDBGrid
            Left = 1
            Top = 32
            Width = 784
            Height = 269
            Selected.Strings = (
              'FLGESCOLHA'#9'2'#9' '
              'TIPO'#9'22'#9'Tipo de Dívida'
              'NUMPARCELA'#9'5'#9'Parcela'
              'MESREFERENCIA'#9'15'#9'Mês Referência'
              'MESCOBRANCA'#9'23'#9'Mês de Cobrança'
              'DATAPREVISAORECE'#9'13'#9'Data Prevista'
              'VALORCALCULADO'#9'16'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsOutrasDividas
            EditCalculated = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'Arial'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = DBgrdDivEmpCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdDivEmpTopRowChanged
            object wwIButton1: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 22
              AllowAllUp = True
              Enabled = False
            end
          end
          object edtQuitacaoDividas: TRealEdit
            Left = 688
            Top = 168
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 2
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Outras Informações'
          ImageIndex = 7
          object pgcOutrasInfo: TPageControl
            Left = 0
            Top = 0
            Width = 807
            Height = 319
            ActivePage = tbsAvalistas
            Align = alClient
            TabOrder = 0
            object TabSheet5: TTabSheet
              Caption = 'Beneficiário(s) do Seguro'
              ImageIndex = 1
              object Label25: TLabel
                Left = 16
                Top = 32
                Width = 122
                Height = 13
                Caption = 'Nome do Beneficiário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Visible = False
              end
              object Label45: TLabel
                Left = 400
                Top = 32
                Width = 91
                Height = 13
                Caption = 'Indenização (%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Visible = False
              end
              object dbEdtNomeBenef: TDBEdit
                Left = 16
                Top = 47
                Width = 369
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'NOME'
                DataSource = dsBenefSeguro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Visible = False
              end
              object dbEdtPercIndeniz: TDBEdit
                Left = 401
                Top = 48
                Width = 88
                Height = 21
                DataField = 'PERCINDENIZACAO'
                DataSource = dsBenefSeguro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Visible = False
              end
              object Dock974: TDock97
                Left = 0
                Top = 0
                Width = 799
                Height = 29
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  BorderStyle = bsNone
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object sbtnInsereBenef: TToolbarButton97
                    Left = 73
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Inserir'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                      8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                      BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                      B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                      B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                      0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                      FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                      BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                      88B888888888888888888888888B888888888888888888888888}
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                    OnClick = sbtnInsereBenefClick
                  end
                  object sbtnAlteraBenef: TToolbarButton97
                    Left = 146
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Alterar'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                      77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                      7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                      077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                      F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                      FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                      077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                      FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                      777777777787FF88777777777778887777777777777888777777}
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnAlteraBenefClick
                  end
                  object sbtnExcluiBenef: TToolbarButton97
                    Left = 219
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Excluir'
                    AllowAllUp = True
                    Caption = '&Excluir'
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnExcluiBenefClick
                  end
                  object sbtnNovoBenef: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Novo'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                      8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                      BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                      B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                      B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                      0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                      FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                      BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                      88B888888888888888888888888B888888888888888888888888}
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnNovoBenefClick
                  end
                end
              end
              object bbtnOkDetBenef: TBitBtn
                Left = 559
                Top = 32
                Width = 81
                Height = 25
                Caption = 'OK'
                Enabled = False
                TabOrder = 3
                Visible = False
                OnClick = bbtnOkDetBenefClick
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
                Margin = 4
                NumGlyphs = 2
              end
              object bbtnCancelarDetBenef: TBitBtn
                Left = 559
                Top = 57
                Width = 81
                Height = 25
                Cancel = True
                Caption = 'Cancelar'
                Enabled = False
                TabOrder = 4
                Visible = False
                OnClick = bbtnCancelarDetBenefClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                  88888887788888778F88887991919191088888788888888878F8879919191919
                  108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                  19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                  19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                  190878F877787778887887917F919F71908887F88788878887F8879919191919
                  1088878F88888888878888799191919108888878FF88888F7888888779999977
                  8888888778FFFF77888888888777778888888888877777888888}
                Margin = 4
                NumGlyphs = 2
              end
              object DBGrdBenefSeg: TwwDBGrid
                Left = 0
                Top = 32
                Width = 778
                Height = 245
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsBenefSeguro
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 5
                TitleAlignment = taLeftJustify
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object tbsAvalistas: TTabSheet
              Caption = 'Avalistas'
              object dbgrdDet: TwwDBGrid
                Left = 0
                Top = 29
                Width = 799
                Height = 262
                Selected.Strings = (
                  'NOME'#9'57'#9'Nome'
                  'RENDACOMP'#9'13'#9'Renda'
                  'MARGEMCONSIG'#9'13'#9'Margem')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsAvalista
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
              object Dock975: TDock97
                Left = 0
                Top = 0
                Width = 799
                Height = 29
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar973: TToolbar97
                  Left = 0
                  Top = 0
                  BorderStyle = bsNone
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object sbtnInsAval: TToolbarButton97
                    Left = 73
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Inserir'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                      8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                      BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                      B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                      B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                      0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                      FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                      BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                      88B888888888888888888888888B888888888888888888888888}
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnInsAvalClick
                  end
                  object ToolbarButton972: TToolbarButton97
                    Left = 146
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Alterar'
                    Enabled = False
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                      77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                      7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                      077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                      F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                      FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                      077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                      FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                      777777777787FF88777777777778887777777777777888777777}
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                  end
                  object sbtnExcluiAval: TToolbarButton97
                    Left = 219
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Excluir'
                    AllowAllUp = True
                    Caption = '&Excluir'
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnExcluiAvalClick
                  end
                  object sbtnNovoAval: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 73
                    Height = 23
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    Caption = '&Novo'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                      8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                      BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                      B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                      B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                      0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                      FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                      BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                      88B888888888888888888888888B888888888888888888888888}
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnNovoAvalClick
                  end
                end
              end
            end
          end
        end
      end
      object pnlLiquidoFundo: TPanel
        Left = 815
        Top = 0
        Width = 120
        Height = 347
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object pnlLiquidoTop: TPanel
          Left = 0
          Top = 0
          Width = 120
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pnlLiquido: TPanel
          Left = 0
          Top = 20
          Width = 120
          Height = 327
          Align = alClient
          BevelInner = bvRaised
          TabOrder = 1
          object lblLimiteDisp: TLabel
            Left = 5
            Top = 61
            Width = 99
            Height = 13
            Caption = 'Limite Disponível'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label28: TLabel
            Left = 5
            Top = 162
            Width = 78
            Height = 13
            Caption = 'Líquido Geral'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 5
            Top = 10
            Width = 82
            Height = 13
            Caption = 'Saldo a Quitar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lblDescontos: TLabel
            Left = 5
            Top = 111
            Width = 102
            Height = 13
            Caption = 'Outros Descontos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtLiquidoGeral: TRealEdit
            Left = 5
            Top = 176
            Width = 111
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtSaldoAQuitar: TRealEdit
            Left = 5
            Top = 24
            Width = 111
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtOutrosDescontos: TRealEdit
            Left = 5
            Top = 125
            Width = 111
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtLimiteDisp: TRealEdit
            Left = 5
            Top = 76
            Width = 111
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
      end
    end
    object pnlDados: TPanel
      Left = 0
      Top = 0
      Width = 935
      Height = 175
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 512
        Top = 90
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
      object Label3: TLabel
        Left = 232
        Top = 90
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
      object Label17: TLabel
        Left = 16
        Top = 8
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
        Top = 90
        Width = 141
        Height = 13
        Caption = 'Situação do Participante'
      end
      object Label10: TLabel
        Left = 16
        Top = 130
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 46
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label7: TLabel
        Left = 204
        Top = 47
        Width = 36
        Height = 13
        Caption = 'C.P.F.'
      end
      object DBedtPatro: TDBEdit
        Left = 512
        Top = 104
        Width = 265
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBedtPlanoPrev: TDBEdit
        Left = 232
        Top = 104
        Width = 271
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'PLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBedtSitPart: TDBEdit
        Left = 16
        Top = 104
        Width = 206
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBedtBeneficiario: TDBEdit
        Left = 16
        Top = 22
        Width = 345
        Height = 21
        Color = clWhite
        DataField = 'BENEFICIARIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBcboTipoContrato: TwwDBLookupCombo
        Left = 16
        Top = 144
        Width = 377
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TceDescricao'#9'55'#9'Tipo de Contrato'#9'F'
          'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
        DataField = 'IDTIPOCONTREMPTMO'
        DataSource = ds
        LookupTable = qryTipoContrato
        LookupField = 'IDTipoContrEmptmo'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboTipoContratoCloseUp
      end
      object grpTitular: TGroupBox
        Left = 376
        Top = 6
        Width = 401
        Height = 83
        Caption = ' Dados do Participante Titular '
        Enabled = False
        TabOrder = 5
        object Label21: TLabel
          Left = 16
          Top = 39
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label16: TLabel
          Left = 144
          Top = 39
          Width = 36
          Height = 13
          Caption = 'C.P.F.'
        end
        object Label18: TLabel
          Left = 271
          Top = 39
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
          Left = 16
          Top = 52
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MATRICULA_TIT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBedtCPF: TDBEdit
          Left = 144
          Top = 52
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CPF_TIT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBedtInscricao: TDBEdit
          Left = 272
          Top = 52
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'INSCRICAONUMERO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBedtParticipante: TDBEdit
          Left = 16
          Top = 16
          Width = 369
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TITULAR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 60
        Width = 165
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit2: TDBEdit
        Left = 204
        Top = 60
        Width = 157
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'CPF'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBgrdResponsavel: TDBGrid
        Left = 408
        Top = 130
        Width = 371
        Height = 40
        DataSource = dsResponsavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERESPONSAVEL'
            Title.Caption = 'Nome do Responsável'
            Visible = True
          end>
      end
    end
  end
  inherited Dock972: TDock97
    Width = 935
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 201
      end
      inherited sbtnApagar: TToolbarButton97
        Width = 15
        Enabled = False
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 377
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 402
        Width = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 371
        Visible = False
      end
      object sbtnCancelar: TToolbarButton97
        Left = 185
        Top = 0
        Width = 16
        Height = 29
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Cancelar'
        Enabled = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
          F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
          F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
          7777777700000007777777777777777777777777777777777777}
        ImageIndex = 2
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnCancelarClick
      end
      object sbtnImprimir: TToolbarButton97
        Left = 286
        Top = 0
        Width = 85
        Height = 29
        Caption = '&Imprimir'
        Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000000000000000000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF000000000000C0C0C08080808080800000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF000000000000
          C0C0C0C0C0C00000000000000000008080808080800000000000000000FF0000
          FF0000FF0000FF0000000000FF0000FF000000000000C0C0C0C0C0C000000000
          0000C0C0C08080808080800000000000008080808080800000000000000000FF
          0000FF0000000000FF000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0
          C08080808080808080808080800000000000008080808080800000000000FF00
          00000000FF808080000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080808080808080800000000000000000000000FF0000000000
          FF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808080808080
          80808080808080808080808080808080800000000000FF0000000000FF808080
          C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C08080808080
          808080808080808080808080800000000000FF0000000000FF808080C0C0C0C0
          C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080800000000000FF0000000000FF808080FFFFFFFFFFFFC0C0
          C0C0C0C0C0C0C00000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
          80808080800000000000FF0000000000FF808080C0C0C0C0C0C0C0C0C000FF00
          00FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
          C00000000000FF0000000000FF0000FF808080808080FFFFFFC0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF000000C0C0C08080808080800000FF
          0000FF0000000000FF0000FF0000FF0000FF808080808080FFFFFFC0C0C08080
          80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF00
          00000000FF0000FF0000FF0000FF0000FF0000FF808080808080808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080FFFFFFFFFF
          FFFFFFFF8080808080800000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080808080
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000}
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimirClick
      end
    end
    object chkTRAVARDATAS: TCheckBox
      Left = 445
      Top = 9
      Width = 179
      Height = 17
      Caption = 'TRAVAR DATAS'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      Visible = False
    end
    object chkExcepcional: TCheckBox
      Left = 626
      Top = 8
      Width = 141
      Height = 17
      Caption = 'Excepcional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = chkExcepcionalClick
    end
    object chkFinanciamento: TCheckBox
      Left = 446
      Top = 9
      Width = 169
      Height = 17
      Caption = 'Financiamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = chkExcepcionalClick
    end
    object chkLiquidoZero: TCheckBox
      Left = 771
      Top = 8
      Width = 143
      Height = 17
      Caption = 'Líquido Zero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = chkLiquidoZeroClick
    end
  end
  inherited Dock971: TDock97
    Top = 557
    Width = 935
    inherited tb97Fundo: TToolbar97
      Left = 763
      DockPos = 1010
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 226
      DockPos = 471
      inherited ToolbarSep971: TToolbarSep97
        Left = 299
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 100
        SizeHorz = 50
      end
      inherited ToolbarSep975: TToolbarSep97
        Left = 450
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 301
        Width = 149
        Caption = 'Confirmar Inscrição'
        Default = False
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 452
      end
      object bbtnContrato: TBitBtn
        Left = 150
        Top = 0
        Width = 149
        Height = 27
        Caption = 'Contratar EP'
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnContratoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777778877
          77777777777F88F7777777777700B077777777777F8878F77777777700FBF077
          7777777F8877F87F77777700BFB4BF0777777F8877F8778F777700FBF44BFB07
          7777887778877787F7778FBF4FBFBFB077778F778777FF78F7778BFBFBF44BF0
          777787F777F887787F7778BFB44FBFBF077778F778877FF78F7778FB8BFB44FB
          0777787F877F887787F7778FBF44BFBFB077778F778877FF787F778BF4FBF44B
          FB077787F877F88777877778BFB44FBFBFB07778F778877777F87778FB4BFBFB
          F88777787F877777F88777778FBFBFB88777777787F777F88777777778FBF887
          77777777787FF887777777777788877777777777778887777777}
        NumGlyphs = 2
      end
      object bbtnSimula: TBitBtn
        Left = 0
        Top = 0
        Width = 100
        Height = 27
        Caption = 'Simulação'
        Enabled = False
        ModalResult = 1
        TabOrder = 3
        OnClick = bbtnSimulaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
      end
    end
  end
  inherited ds: TwwDataSource [5]
    OnStateChange = dsStateChange
    Left = 260
    Top = 359
  end
  inherited qry: TwwQuery [6]
    AfterOpen = qryAfterOpen
    AfterScroll = qryAfterOpen
    SQL.Strings = (
      'SELECT'
      '   DECODE(INS.FLGSITUACAO, '#39'A'#39', '#39'Ativa'#39') AS DESCSITINSCRICAO,'
      '   PPP.INSCRICAONUMERO,'
      ''
      '   SIT.IDSITPART,'
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SIT.FLGINTERNO,'
      ''
      '   DECODE(PLP2.NOME, NULL, PLP.NOME, PLP2.NOME) AS PLANO,'
      '   JUR.NOME AS PATRO,'
      ''
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, TIT.NUMDOCUMENTO, BEN.NUM' +
        'DOCUMENTO) AS CPF,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39', DEP.IDPESSOA, ELP.MATRICULA, ' +
        'DEP.MATRICULA) AS MATRICULA,'
      ''
      '   ELP.MATRICULA       AS MATRICULA_TIT,'
      '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT,'
      ''
      '   TIT.NOME            AS TITULAR,'
      '   TIT.NUMDOCUMENTO    AS CPF_TIT,'
      '   BEN.NOME            AS BENEFICIARIO,'
      ''
      '   TEM.DESCTIPOEMPTMO,'
      '   TIP.TCEDESCRICAO,'
      '   TIP.IDTIPOEMPTMO,'
      ''
      '   TIP.IDTIPOCONTREMPTMO, ---------------MONICA SOL 172525'
      '   INS.IDPLANOPREV,'
      ''
      
        '   INS.IDINSCRICAOEMPTMO, INS.IDTIPOCONTREMPTMO, INS.IDPESSOA   ' +
        ' ,'
      
        '   INS.IDPATRO          , INS.VLRSOLIC         , INS.IDBENEF    ' +
        ' , INS.IDCBANCARIA ,'
      
        '   INS.FLGFORMAPAG      , INS.PORTFORMAPAG     , INS.CODFORMAPAG' +
        ' , INS.NUMPARCELAS ,'
      
        '   INS.FLGFORMAREC      , INS.PORTFORMAREC     , INS.FLGPENDENTE' +
        ' , INS.FLGSITUACAO ,'
      
        '   INS.DATAINSC         , INS.DATACANCINSC     , INS.DATACREDITO' +
        ','
      '   INS.FLGSUSPENSAOAUTO,'
      
        '   INS.VLRSALBASE       , INS.VLRMARGEM        , INS.VLRMAXPERMI' +
        'T, INS.VLRPARCELAMES,'
      '   INS.VLRPARCATRASO    , INS.MOECODIGO,'
      ''
      
        '   INS.FLGALTSALARIO, INS.FLGALTMARGEM, INS.FLGALTVALMAX, INS.ID' +
        'RESPONSAVEL,'
      '   INS.IDCBANCARIADEB   , INS.DATAENVIO        , INS.DATARECEB,'
      ''
      '   NVL(INS.FLGINTERNET, 0) AS FLGINTERNET,'
      '   0 AS VLRMARGEMALT'
      ''
      ''
      'FROM'
      '   PESSOA          JUR,'
      '   PESSOA          TIT,'
      '   PESSOA          BEN,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   DEPENTIT        DEP,'
      '   INSCRICAOEMPTMO INS,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM,'
      '   SITPART         SIT,'
      '   PLANPREV        PLP,'
      '   PLANPREV        PLP2,'
      '   ('
      '   SELECT DISTINCT'
      '      IDPESSOA, IDPLANOPREV'
      '   FROM'
      '      BENEFBFCIARIO'
      '   WHERE'
      
        '          (DATAFINAL IS NULL OR DATAFINAL > (SELECT SYSDATE FROM' +
        ' DUAL))'
      '      AND IDSITBENEFICIO IN (1, 2, 7)'
      '   ) BFC'
      ''
      'WHERE'
      '            INS.IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO'
      '   AND TEM.IDEMPRESAPROP     =:PIDEMPRESAPROP'
      '   AND INS.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND INS.IDPATRO           = JUR.IDPESSOA'
      '   AND INS.IDPESSOA          = ELP.IDPESSOA'
      '   AND INS.IDPATRO           = ELP.IDPESSJUR'
      '   AND INS.IDPESSOA          = TIT.IDPESSOA'
      '   AND INS.IDBENEF           = BEN.IDPESSOA'
      '   AND INS.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND INS.IDPESSOA          = DEP.IDTITULAR'
      '   AND INS.IDBENEF           = DEP.IDPESSOA'
      '   AND DEP.IDPESSOA          = BFC.IDPESSOA(+)'
      '   AND BFC.IDPLANOPREV       = PLP2.IDPLANOPREV(+)'
      '     AND (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev) '
      '                         FROM partprevplan ppp2 '
      '                         WHERE ppp2.flgdesativado = 0  '
      '                         AND   ppp2.idpessoa = ppp.idpessoa )'
      '     AND NOT EXISTS (SELECT 1 FROM partprevplan ppp2 '
      '                     WHERE ppp2.idplanoprev = 2 '
      '                     AND   ppp2.idsitplanoprev = 25 '
      '                     AND   ppp2.idpessoa = ppp.idpessoa) '
      '     OR '
      '     ppp.idsitplanoprev = 25)')
    Left = 660
    Top = 462
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDInscricaoEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryDESCSITINSCRICAO: TStringField
      FieldName = 'DESCSITINSCRICAO'
      Size = 5
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryFLGPENDENTE: TStringField
      FieldName = 'FLGPENDENTE'
      FixedChar = True
      Size = 1
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryDATACANCINSC: TDateTimeField
      FieldName = 'DATACANCINSC'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
      DisplayFormat = '#,#0.00'
      EditFormat = '#0.00'
    end
    object qryFLGALTSALARIO: TFloatField
      FieldName = 'FLGALTSALARIO'
    end
    object qryFLGALTMARGEM: TFloatField
      FieldName = 'FLGALTMARGEM'
    end
    object qryFLGALTVALMAX: TFloatField
      FieldName = 'FLGALTVALMAX'
    end
    object qryMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object qryINSCRICAO_TIT: TFloatField
      FieldName = 'INSCRICAO_TIT'
    end
    object qryCPF_TIT: TStringField
      FieldName = 'CPF_TIT'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 18
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryDATAENVIO: TDateTimeField
      FieldName = 'DATAENVIO'
    end
    object qryDATARECEB: TDateTimeField
      FieldName = 'DATARECEB'
    end
    object qryFLGINTERNET: TFloatField
      FieldName = 'FLGINTERNET'
    end
    object qryVLRMARGEMALT: TFloatField
      FieldName = 'VLRMARGEMALT'
    end
  end
  inherited ImlPadrao: TImageList [7]
    Left = 989
    Top = 53
  end
  inherited CmeCadastro: TCmEventosCadastro [8]
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 848
    Top = 40
  end
  inherited MontaSelect: TMontaSelect [9]
    Colunas.Strings = (
      'INS.IDINSCRICAOEMPTMO'
      'PP.NOME               AS TITULAR'
      'PP.NUMDOCUMENTO       AS CPF'
      'ST.DESCRICAO          AS SIT_PART'
      'EL.MATRICULA          AS MATRICULA_PATRO'
      'PPP.INSCRICAONUMERO   AS INSCRICAO_PLANO'
      'TC.TCEDESCRICAO       AS TIPO_CONTRATO'
      'TE.DESCTIPOEMPTMO     AS TIPO_EP'
      'PL.NOME               AS PLANO_PREV'
      'PA.NOME               AS PATRO'
      'PB.NOME               AS BENEFICIARIO'
      'INS.DATAINSC          AS DATA_INSCRICAO'
      'DECODE( INS.FLGINTERNET, 1, '#39'SIM'#39', '#39'NÃO'#39' )')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Inscrição'
      'Nome Titular'
      'C.P.F. Titular'
      'Sit. Participante'
      'Matrícula'
      'Insc. Plano'
      'Tipo Contrato'
      'Tipo Empréstimo'
      'Plano Previdenciário'
      'Patrocinadora'
      'Beneficiário'
      'Data Inscrição'
      'Feito pela Internet')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PP'
      'PESSOA PB'
      'PESSOA PA'
      'ELEGPATRO EL'
      'PARTPREVPLAN PPP'
      'INSCRICAOEMPTMO INS'
      'PLANPREV PL'
      'TIPOCONTREMPTMO TC'
      'TIPOEMPTMO TE'
      'SITPART ST')
    CamposChave.Strings = (
      'INS.IDINSCRICAOEMPTMO'
      'PP.IDPESSOA AS IDTITULAR'
      'PB.IDPESSOA AS IDBENEF'
      'PP.NOME AS NOME_TITULAR'
      'PB.NOME AS NOME_BENEF')
    Filtro.Strings = (
      'INS.FLGSITUACAO         = '#39'A'#39
      'INS.IDPESSOA            = PP.IDPESSOA'
      'INS.IDBENEF             = PB.IDPESSOA(+)'
      'INS.IDPATRO             = PA.IDPESSOA'
      'INS.IDPATRO             = PPP.IDPESSJUR'
      'INS.IDPLANOPREV         = PL.IDPLANOPREV'
      'INS.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'
      'TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO'
      'EL.IDPESSJUR            = INS.IDPATRO'
      'EL.IDPESSOA             = INS.IDPESSOA'
      'INS.IDPATRO             = PPP.IDPESSJUR'
      'INS.IDPESSOA            = PPP.IDPESSOA'
      'PPP.IDSITPART           = ST.IDSITPART'
      'PPP.FLGDESATIVADO       = 0 ')
    Mascaras.Strings = (
      ''
      ''
      '999.999.999-99;0;'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '10'
      '35'
      '14'
      '15'
      '13'
      '10'
      '25'
      '25'
      '25'
      '25'
      '35'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
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
      ''
      ''
      ''
      ''
      '')
    Left = 588
    Top = 68
  end
  inherited upd: TUpdateSQL [10]
    ModifySQL.Strings = (
      'update INSCRICAOEMPTMO'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEF = :IDBENEF,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  FLGPENDENTE = :FLGPENDENTE,'
      '  FLGSITUACAO = :FLGSITUACAO,'
      '  FLGFORMAREC = :FLGFORMAREC,'
      '  FLGFORMAPAG = :FLGFORMAPAG,'
      '  CODFORMAPAG = :CODFORMAPAG,'
      '  PORTFORMAPAG = :PORTFORMAPAG,'
      '  PORTFORMAREC = :PORTFORMAREC,'
      '  DATAINSC = :DATAINSC,'
      '  DATACANCINSC = :DATACANCINSC,'
      '  VLRSOLIC = :VLRSOLIC,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  FLGSUSPENSAOAUTO = :FLGSUSPENSAOAUTO,'
      '  VLRSALBASE = :VLRSALBASE,'
      '  VLRMARGEM = :VLRMARGEM,'
      '  VLRMAXPERMIT = :VLRMAXPERMIT,'
      '  FLGALTSALARIO = :FLGALTSALARIO,'
      '  FLGALTMARGEM = :FLGALTMARGEM,'
      '  FLGALTVALMAX = :FLGALTVALMAX,'
      '  VLRPARCELAMES = :VLRPARCELAMES,'
      '  VLRPARCATRASO = :VLRPARCATRASO,'
      '  DATACREDITO = :DATACREDITO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDCBANCARIADEB = :IDCBANCARIADEB,'
      '  DATAENVIO = :DATAENVIO,'
      '  DATARECEB = :DATARECEB'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO'
      ''
      '')
    InsertSQL.Strings = (
      'insert into INSCRICAOEMPTMO'
      '  (IDINSCRICAOEMPTMO, IDTIPOCONTREMPTMO, MOECODIGO, IDPESSOA,'
      'IDPATRO,'
      '   IDPLANOPREV, IDBENEF, IDCBANCARIA, FLGPENDENTE, FLGSITUACAO,'
      'FLGFORMAREC,'
      '   FLGFORMAPAG, CODFORMAPAG, PORTFORMAPAG, PORTFORMAREC,'
      'DATAINSC, DATACANCINSC,'
      '   VLRSOLIC, NUMPARCELAS, FLGSUSPENSAOAUTO, VLRSALBASE,'
      'VLRMARGEM, VLRMAXPERMIT,'
      '   FLGALTSALARIO, FLGALTMARGEM, FLGALTVALMAX, VLRPARCELAMES,'
      'VLRPARCATRASO,'
      
        '   DATACREDITO, IDRESPONSAVEL, IDCBANCARIADEB, DATAENVIO, DATARE' +
        'CEB)'
      'values'
      
        '  (:IDINSCRICAOEMPTMO, :IDTIPOCONTREMPTMO, :MOECODIGO, :IDPESSOA' +
        ','
      ':IDPATRO,'
      
        '   :IDPLANOPREV, :IDBENEF, :IDCBANCARIA, :FLGPENDENTE, :FLGSITUA' +
        'CAO,'
      ':FLGFORMAREC,'
      '   :FLGFORMAPAG, :CODFORMAPAG, :PORTFORMAPAG, :PORTFORMAREC,'
      ':DATAINSC,'
      '   :DATACANCINSC, :VLRSOLIC, :NUMPARCELAS, :FLGSUSPENSAOAUTO,'
      ':VLRSALBASE,'
      '   :VLRMARGEM, :VLRMAXPERMIT, :FLGALTSALARIO, :FLGALTMARGEM,'
      ':FLGALTVALMAX,'
      
        '   :VLRPARCELAMES, :VLRPARCATRASO, :DATACREDITO, :IDRESPONSAVEL,' +
        ' :IDCBANCARIADEB, :DATAENVIO, :DATARECEB)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from INSCRICAOEMPTMO'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO')
    Left = 620
    Top = 511
  end
  inherited ivTradutor: TIvExtendedTranslator [11]
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object dsBanco: TDataSource
    DataSet = dtmLookEmptmo.qryLookDadosBancarios
    Left = 806
    Top = 179
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      '   TCE.IDTIPOEMPTMO,'
      ''
      '   TCE.FLGOBRIGBENEF,'
      '   TCE.TCEMINRENOVA,'
      '   TCE.NUMPARCDESCONTO,'
      '   TCE.MOECODIGO,'
      '   TCE.FLGCONCESSAOZERO,'
      ''
      '   TCE.IDREGRAJURCONC,'
      '   TCE.IDREGRAJUREXIBE,'
      '   TCE.IDREGRAELEG,'
      '   TCE.IDREGRALIMITES,'
      '   TCE.IDREGRAPRAZOSCONC,'
      '   TCE.IDREGRAMARGEM,'
      '   TCE.IDREGRARESERVA,'
      '   TCE.IDREGRASALBAS,'
      '   TCE.IDREGRADATACRED,'
      '   TCE.IDREGRAPRAZOMAX,'
      ''
      '   TCE.TCELEGENDACALC,'
      
        '   NVL(TCE.TCELEGENDAEXIBE, TCE.TCELEGENDACALC) AS TCELEGENDAEXI' +
        'BE,'
      ''
      '   NVL(TCE.IDREGRAPRIMPARC, 0) AS IDREGRAPRIMPARC,'
      ''
      '   TEP.DESCTIPOEMPTMO,'
      '   TEP.TEPMAXCONTRATO,'
      ''
      '   TCE.TCEMAXCONTRATO,'
      ''
      '   TCE.FLGOBRIGACONCZERO,'
      '   NVL(TCE.FLGVERPRAZOTIPOQUIT,0) AS FLGVERPRAZOTIPOQUIT,'
      '   NVL(TCE.FLGVERIFICACONTRATO,2) AS FLGVERIFICACONTRATO,'
      ''
      '   TCE.FLGFORMAPAG,'
      '   TCE.FLGFORMAREC,'
      ''
      '   TCE.IDREGRAMARGEMALT,'
      '   TCE.IDREGRAMARGEMAVAL,'
      '   TCE.IDREGRAELEGAVAL,'
      ''
      '   NVL(TCE.FLGNAOVERIFICAMRGPCL, 0) AS FLGNAOVERIFICAMRGPCL,'
      '   NVL(TCE.FLGVERIFICAITEMABERTO, 0) AS FLGVERIFICAITEMABERTO'
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       ( TCE.IDTIPOEMPTMO   = TEP.IDTIPOEMPTMO )'
      
        '   AND ( (TCE.IDPLANOPREV IS NULL) OR (TCE.IDPLANOPREV =:PIDPLAN' +
        'OPREV) )'
      '   AND ( TEP.IDEMPRESAPROP  =:PIDEMPRESAPROP )'
      '   AND ( TCE.FLGSITUACAO    = '#39'A'#39' )'
      ''
      '   AND ( :PIDMODULO <> 19 OR TCE.FLGUSOCENTRAL = 1 )'
      ''
      '   AND ( :PIDMODULO <> 15 OR TCE.FLGUSOEMPTMO  = 1 )'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 856
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end>
    object qryTipoContratoTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 55
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      DisplayLabel = 'Tipo de Empréstimo'
      DisplayWidth = 30
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
      Visible = False
    end
    object qryTipoContratoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAJURCONC'
      Visible = False
    end
    object qryTipoContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAELEG'
      Visible = False
    end
    object qryTipoContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRALIMITES'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOSCONC'
      Visible = False
    end
    object qryTipoContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAMARGEM'
      Visible = False
    end
    object qryTipoContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRARESERVA'
      Visible = False
    end
    object qryTipoContratoTEPMAXCONTRATO: TFloatField
      FieldName = 'TEPMAXCONTRATO'
      Visible = False
    end
    object qryTipoContratoFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.FLGOBRIGBENEF'
      Visible = False
    end
    object qryTipoContratoIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
      Visible = False
    end
    object qryTipoContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryTipoContratoFLGCONCESSAOZERO: TFloatField
      FieldName = 'FLGCONCESSAOZERO'
      Visible = False
    end
    object qryTipoContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
      Visible = False
    end
    object qryTipoContratoIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRAZOMAX: TFloatField
      FieldName = 'IDREGRAPRAZOMAX'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOMAX'
      Visible = False
    end
    object qryTipoContratoNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
      Visible = False
    end
    object qryTipoContratoIDREGRAPRIMPARC: TFloatField
      FieldName = 'IDREGRAPRIMPARC'
      Visible = False
    end
    object qryTipoContratoIDREGRAJUREXIBE: TFloatField
      FieldName = 'IDREGRAJUREXIBE'
    end
    object qryTipoContratoTCELEGENDACALC: TStringField
      FieldName = 'TCELEGENDACALC'
      Size = 10
    end
    object qryTipoContratoTCELEGENDAEXIBE: TStringField
      FieldName = 'TCELEGENDAEXIBE'
      Size = 10
    end
    object qryTipoContratoFLGOBRIGACONCZERO: TFloatField
      FieldName = 'FLGOBRIGACONCZERO'
    end
    object qryTipoContratoTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
    end
    object qryTipoContratoFLGVERPRAZOTIPOQUIT: TFloatField
      FieldName = 'FLGVERPRAZOTIPOQUIT'
    end
    object qryTipoContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoContratoFLGVERIFICACONTRATO: TFloatField
      FieldName = 'FLGVERIFICACONTRATO'
    end
    object qryTipoContratoIDREGRAMARGEMALT: TFloatField
      FieldName = 'IDREGRAMARGEMALT'
    end
    object qryTipoContratoIDREGRAMARGEMAVAL: TFloatField
      FieldName = 'IDREGRAMARGEMAVAL'
    end
    object qryTipoContratoIDREGRAELEGAVAL: TFloatField
      FieldName = 'IDREGRAELEGAVAL'
    end
    object qryTipoContratoFLGNAOVERIFICAMRGPCL: TFloatField
      FieldName = 'FLGNAOVERIFICAMRGPCL'
    end
    object qryTipoContratoFLGVERIFICAITEMABERTO: TFloatField
      FieldName = 'FLGVERIFICAITEMABERTO'
    end
  end
  object qryContratosAnteriores: TwwQuery
    CachedUpdates = True
    AfterScroll = qryContratosAnterioresAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        0 AS FLGESCOLHA,'
      '        0 AS FLGOBRIGATORIO,'
      '        NVL(CON.FLGPERDAEFETIVA, 0) AS FLGPERDAEFETIVA,'
      '        CON.IDCONTRATOEMPTMO,'
      '        CON.VLRCONTRATO,'
      '        CON.DATACREDITO,'
      '        CON.FLGFORMAREC,'
      '        CON.DATAASSINATURA,'
      '        CON.IDINSCRICAOEMPTMO,'
      '        CON.NUMPARCELAS,'
      '        CON.IDTIPOCONTREMPTMO,'
      '        CON.VLRPARCELA,'
      '        CON.IDTIPOSUSPEMPTMO,'
      '        CON.DATAINICIOSUSP,'
      '        CON.DATAFIMSUSP,'
      '        CON.FLGSUSPENSAOAUTO,'
      '        CON.DATALIBSUSP,'
      '        CON.MOECODIGO,'
      '        MOE.MOESIGLA,'
      '        CON.IDPATRO,'
      '        CON.IDPESSOA,'
      '        CON.IDPLANOPREV,'
      '        CON.IDBENEF,'
      '        CON.DATAPRIMPARC,'
      '        TCE.TCEDESCRICAO,'
      '        TCE.IDTIPOEMPTMO,'
      '        TCE.TCEMINRENOVA,'
      
        '        NVL(PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO,' +
        ':PHMEDATAATUALIZA),0) AS HMESALDODEV,'
      '        CON.FLGSITUACAO,'
      '        CON.TXJUROS,'
      
        '        PCK_EMPRESTIMO.FN_QUANTPARCELASPAGAS(CON.IDCONTRATOEMPTM' +
        'O) AS NUMPARCPAGAS,'
      '        0 AS VLRATUAL,'
      '        0 AS VLRDEVSEG,'
      
        '        NVL(PCK_EMPRESTIMO.FN_VALOREMABERTO(CON.IDCONTRATOEMPTMO' +
        ', :PHMEDATA),0) AS VLREMABERTO,'
      
        '        PCK_EMPRESTIMO.FN_ULTIMAPRESTACAO(CON.IDCONTRATOEMPTMO) ' +
        'ULT_PARC,'
      '        CON.IDPLANOORIGEM,'
      
        '        PCK_EMPRESTIMO.FN_VALORULTIMAPRESTACAO(CON.IDCONTRATOEMP' +
        'TMO) VLRULTPARCELA'
      '  FROM CONTRATOEMPTMO CON'
      
        '  INNER JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.' +
        'IDTIPOCONTREMPTMO'
      '  LEFT JOIN MOEDA MOE ON CON.MOECODIGO = MOE.MOECODIGO'
      'WHERE CON.IDPESSOA = :PIDPESSOA'
      '      AND CON.IDBENEF = :PIDBENEF'
      '      AND TCE.IDTIPOEMPTMO = :PIDTIPOEMPTMO'
      '      AND CON.FLGSITUACAO NOT IN ('#39'C'#39', '#39'Q'#39')'
      
        '      AND (NVL(PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPT' +
        'MO,:PHMEDATAATUALIZA),0) > 0 OR'
      
        '           NVL(PCK_EMPRESTIMO.FN_VALOREMABERTO(CON.IDCONTRATOEMP' +
        'TMO, :PHMEDATA),0) > 0)'
      '      AND (:PQUITAVEL IS NULL OR CON.IDTIPOCONTREMPTMO IN ('
      
        '                                                            SELE' +
        'CT'
      
        '                                                                ' +
        'IDTIPOCONTRQUIT'
      
        '                                                            FROM' +
        ' TIPOCONTRXQUIT'
      
        '                                                            WHER' +
        'E IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'
      '                                                          )'
      '          )'
      'ORDER BY CON.IDCONTRATOEMPTMO')
    UpdateObject = updContratosAnteriores
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 156
    Top = 332
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
        Value = 37504d
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '518'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
        Value = '421'
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
        Value = '9'
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryContratosAnterioresFLGESCOLHA: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'FLGESCOLHA'
    end
    object qryContratosAnterioresIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosAnterioresTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo Contrato'
      DisplayWidth = 15
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratosAnterioresVLRCONTRATO: TFloatField
      DisplayLabel = 'Vlr. Contrato'
      DisplayWidth = 10
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryContratosAnterioresDATACREDITO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Crédito'
      DisplayWidth = 10
      FieldName = 'DATACREDITO'
    end
    object qryContratosAnterioresNUMPARCELAS: TFloatField
      DisplayLabel = 'Prazo'
      DisplayWidth = 4
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosAnterioresVLRPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryContratosAnterioresHMESALDODEV: TFloatField
      DisplayLabel = 'Saldo Dev.'
      DisplayWidth = 10
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,#0.00;(#,#0.00)'
      EditFormat = '#,##0.00'
    end
    object qryContratosAnterioresVLREMABERTO: TFloatField
      DisplayLabel = 'Pendências'
      DisplayWidth = 10
      FieldName = 'VLREMABERTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryContratosAnterioresNUMPARCPAGAS: TFloatField
      DisplayLabel = 'Pagas'
      DisplayWidth = 5
      FieldName = 'NUMPARCPAGAS'
    end
    object qryContratosAnterioresVLRATUAL: TFloatField
      DisplayLabel = 'Vlr a Quitar'
      DisplayWidth = 11
      FieldName = 'VLRATUAL'
      DisplayFormat = '#,#0.00;(#,#0.00)'
      EditFormat = '#,##0.00'
    end
    object qryContratosAnterioresULT_PARC: TFloatField
      DisplayLabel = 'Ult. Parc'
      DisplayWidth = 6
      FieldName = 'ULT_PARC'
    end
    object qryContratosAnterioresTCEMINRENOVA: TFloatField
      DisplayWidth = 10
      FieldName = 'TCEMINRENOVA'
      Visible = False
    end
    object qryContratosAnterioresIDPLANOORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryContratosAnterioresVLRULTPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRULTPARCELA'
      Visible = False
    end
    object qryContratosAnterioresFLGOBRIGATORIO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGOBRIGATORIO'
      Visible = False
    end
    object qryContratosAnterioresFLGSITUACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSITUACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContratosAnterioresTXJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'TXJUROS'
      Visible = False
    end
    object qryContratosAnterioresFLGPERDAEFETIVA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPERDAEFETIVA'
      Visible = False
    end
    object qryContratosAnterioresIDINSCRICAOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSCRICAOEMPTMO'
      Visible = False
    end
    object qryContratosAnterioresFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryContratosAnterioresMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryContratosAnterioresMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object qryContratosAnterioresIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryContratosAnterioresIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryContratosAnterioresIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContratosAnterioresIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryContratosAnterioresIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Visible = False
    end
    object qryContratosAnterioresDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
      Visible = False
    end
    object qryContratosAnterioresDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
      Visible = False
    end
    object qryContratosAnterioresFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
      Visible = False
    end
    object qryContratosAnterioresDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
      Visible = False
    end
    object qryContratosAnterioresIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Visible = False
    end
    object qryContratosAnterioresDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
      Visible = False
    end
    object qryContratosAnterioresDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
      Visible = False
    end
    object qryContratosAnterioresIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Visible = False
    end
    object qryContratosAnterioresVLRDEVSEG: TFloatField
      FieldName = 'VLRDEVSEG'
      Visible = False
    end
  end
  object dtsContratoAnteriores: TDataSource
    DataSet = qryContratosAnteriores
    Left = 464
    Top = 320
  end
  object updContratosAnteriores: TUpdateSQL
    ModifySQL.Strings = (
      'update INSCRICAOEMPTMO'
      'set'
      '  VLRATUAL = :VLRATUAL'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into INSCRICAOEMPTMO'
      '  (VLRATUAL)'
      'values'
      '  (:VLRATUAL)')
    DeleteSQL.Strings = (
      'delete from INSCRICAOEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 852
    Top = 468
  end
  object dtsItensConcessao: TDataSource
    DataSet = qryItensConcessao
    Left = 48
    Top = 411
  end
  object qryItensConcessao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDITEMEMPTMO,'
      '   '#39'NOME'#39' AS ITEM,'
      '   0 AS VALOR,'
      '   0 AS SEQCALCULO,'
      '   -1 AS IDREGRA,'
      '   0 AS FLGCENTRALIZA,'
      '   0 AS FLGDESTACADO'
      'FROM '
      'DUAL'
      ' ')
    ValidateWithMask = True
    Left = 92
    Top = 279
    object qryItensConcessaoITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 40
      FieldName = 'ITEM'
      FixedChar = True
      Size = 4
    end
    object qryItensConcessaoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryItensConcessaoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Visible = False
    end
    object qryItensConcessaoSEQCALCULO: TFloatField
      FieldName = 'SEQCALCULO'
    end
    object qryItensConcessaoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensConcessaoFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
    end
    object qryItensConcessaoFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
    end
  end
  object MainMenu1: TMainMenu
    Left = 991
    Top = 108
  end
  object updAvalista: TUpdateSQL
    InsertSQL.Strings = (
      'insert into CONTRATOXAVALISTA'
      '  (IDINSCRICAOEMPTMO, IDAVALISTA)'
      'values'
      '  (:IDINSCRICAOEMPTMO, :IDAVALISTA)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXAVALISTA'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    Left = 857
    Top = 487
  end
  object qryAvalista: TwwQuery
    CachedUpdates = True
    BeforeClose = qryAvalistaBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.IDINSCRICAOEMPTMO,'
      '       CA.IDAVALISTA,'
      '       P.NOME,'
      '       A.RENDACOMP,'
      '       A.MARGEMCONSIG'
      'FROM   CONTRATOXAVALISTA CA, PESSOA P, AVALISTA A'
      'WHERE  A.IDAVALISTA = P.IDPESSOA'
      'AND    CA.IDAVALISTA = A.IDAVALISTA'
      'AND    CA.IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO'
      ''
      ''
      ''
      ' ')
    UpdateObject = updAvalista
    ValidateWithMask = True
    Left = 741
    Top = 343
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryAvalistaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 57
      FieldName = 'NOME'
      Size = 60
    end
    object qryAvalistaRENDACOMP: TFloatField
      DisplayLabel = 'Renda'
      DisplayWidth = 13
      FieldName = 'RENDACOMP'
      DisplayFormat = ',0.00'
    end
    object qryAvalistaMARGEMCONSIG: TFloatField
      DisplayLabel = 'Margem'
      DisplayWidth = 13
      FieldName = 'MARGEMCONSIG'
      DisplayFormat = ',0.00'
    end
    object qryAvalistaIDINSCRICAOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSCRICAOEMPTMO'
      Visible = False
    end
    object qryAvalistaIDAVALISTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAVALISTA'
      Visible = False
    end
  end
  object dsAvalista: TDataSource
    DataSet = qryAvalista
    Left = 849
    Top = 483
  end
  object qryBenefSeguro: TwwQuery
    CachedUpdates = True
    BeforeClose = qryBenefSeguroBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   CONTRATOXBENEFSEG'
      'WHERE  IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefSeguro
    ValidateWithMask = True
    Left = 758
    Top = 284
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryBenefSeguroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 75
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NOME'
      Size = 60
    end
    object qryBenefSeguroPERCINDENIZACAO: TFloatField
      DisplayLabel = '% Indenização'
      DisplayWidth = 11
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDINSCRICAOEMPTMO'
      Visible = False
    end
    object qryBenefSeguroIDBENEFSEGURO: TFloatField
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDBENEFSEGURO'
      Visible = False
    end
    object qryBenefSeguroTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.TRGDTINCLUSAO'
      Visible = False
    end
    object qryBenefSeguroTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryBenefSeguroVLRSALDOREC: TFloatField
      FieldName = 'VLRSALDOREC'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.VLRSALDOREC'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryBenefSeguroVLRREPASSE: TFloatField
      FieldName = 'VLRREPASSE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.VLRREPASSE'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryBenefSeguroDATAREPASSE: TDateTimeField
      FieldName = 'DATAREPASSE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.DATAREPASSE'
      Visible = False
    end
    object qryBenefSeguroNUMBANCO: TFloatField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NUMBANCO'
      Visible = False
    end
    object qryBenefSeguroCODAGENCIA: TStringField
      FieldName = 'CODAGENCIA'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.CODAGENCIA'
      Visible = False
      Size = 10
    end
    object qryBenefSeguroCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.CONTACORRENTE'
      Visible = False
      Size = 10
    end
    object qryBenefSeguroOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.OBS'
      Visible = False
      Size = 200
    end
  end
  object dsBenefSeguro: TDataSource
    DataSet = qryBenefSeguro
    OnStateChange = dsBenefSeguroStateChange
    Left = 714
    Top = 415
  end
  object qryContratoQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   CONTRATOEMPTMO'
      'SET'
      '   IDCONTRQUITACAO =:PIDCONTRQUITACAO'
      'WHERE '
      '   IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 389
    Top = 407
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryItensEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HME.IDHISTMOVEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV          NOT IN (0, 5, 8) )'
      ''
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.FLGBAIXADO            = 0'
      ''
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO     =' +
        ' 1) )'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGSUSPENSAO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      '   AND ('
      '       (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||'
      '       (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39'))))'
      '       ) <:PANOMESCOBRANCA')
    ValidateWithMask = True
    Left = 433
    Top = 511
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryItensEmAbertoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensEmAbertoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryUpdateContratoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.VLRSALDODEV     =:PVLRSALDODEV,'
      '   CON.VLRPENDENCIA    =:PVLRPENDENCIA,'
      '   CON.DATASALDODEV    =:PDATA,'
      '   CON.DATAPENDENCIA   =:PDATA'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 345
    Top = 467
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PVLRSALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRPENDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   BTP.IDRESPONNAOREC AS IDRESPONSAVEL,'
      '   PES.NOME AS NOMERESPONSAVEL'
      'FROM'
      '   BENEFBFCIARIO BFC, BFCIARIOTITPLAN BTP, PESSOA PES'
      'WHERE'
      '       IDSITBENEFICIO      IN (1,2,7)'
      '   AND BFC.IDTITULAR       =:iIDPessoa'
      '   AND BFC.IDPESSOA        =:iIDBenef'
      '   AND BFC.IDTITULAR       = BTP.IDTITULAR'
      '   AND BFC.IDPESSOA        = BTP.IDPESSOA'
      '   AND BFC.IDBENEFICIO     = BTP.IDBENEFICIO'
      '   AND BTP.IDRESPONNAOREC  = PES.IDPESSOA'
      '   AND BFC.IDPLANOPREV     = BTP.IDPLANOPREV'
      '   AND ( DATAFIMRECEB IS NULL OR DATAFIMRECEB > SYSDATE )')
    ValidateWithMask = True
    Left = 812
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iIDBenef'
        ParamType = ptInput
      end>
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryResponsavelNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
  end
  object dsResponsavel: TDataSource
    DataSet = qryResponsavel
    Left = 792
    Top = 40
  end
  object dsBancoDeb: TDataSource
    DataSet = dtmLookEmptmo.qryLookDadosBancarios
    Left = 846
    Top = 187
  end
  object qryEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODESTADO,'
      '      IDPAIS'
      'FROM '
      '     ENDPESS'
      'WHERE '
      '    IDPESSOA = :PIDPESSOA'
      '')
    ValidateWithMask = True
    Left = 845
    Top = 483
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryEnderecoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ENDPESS.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEnderecoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ENDPESS.IDPAIS'
    end
  end
  object qryUpdateInsc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '     INSCRICAOEMPTMO'
      'SET'
      '     DATAENVIO = :PDATAENVIO'
      'WHERE'
      '    IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO')
    ValidateWithMask = True
    Left = 705
    Top = 512
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
  end
  object updOutrasDividas: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA,'
      'where'
      '  TIPO = :OLD_TIPO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  DATAPREVISAORECE = :OLD_DATAPREVISAORECE and'
      '  VALORCALCULADO = :OLD_VALORCALCULADO')
    DeleteSQL.Strings = (
      '')
    Left = 772
    Top = 408
  end
  object dsOutrasDividas: TDataSource
    DataSet = qryOutrasDividas
    Left = 888
    Top = 76
  end
  object qryOutrasDividas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS FLGESCOLHA,'
      '   1                AS CODTIPO,'
      '   '#39'Previdenciária'#39' AS TIPO,'
      '   MESREFERENCIA AS ORDEM,'
      
        '   DECODE(SUBSTR(MESREFERENCIA,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'03'#39', '#39'Março/'#39'    || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'04'#39', '#39'Abril/'#39'    || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'05'#39', '#39'Maio/'#39'     || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'06'#39', '#39'Junho/'#39'    || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'07'#39', '#39'Julho/'#39'    || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'09'#39', '#39'Setembro/'#39' || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'11'#39', '#39'Novembro/'#39' || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR' +
        '(MESREFERENCIA,1,4),'
      
        '                                     '#39'13'#39','#39'Contrib. sobre 13º Sa' +
        'l/'#39' || SUBSTR(MESREFERENCIA,1,4),'
      
        '                                           SUBSTR(MESREFERENCIA,' +
        '6,12) || '#39'/'#39' || SUBSTR(MESREFERENCIA,1,4)) AS MESREFERENCIA,'
      ''
      
        '   DECODE(SUBSTR(MESCOBRANCA,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'03'#39', '#39'Março/'#39'    || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'04'#39', '#39'Abril/'#39'    || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'05'#39', '#39'Maio/'#39'     || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'06'#39', '#39'Junho/'#39'    || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'07'#39', '#39'Julho/'#39'    || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'09'#39', '#39'Setembro/'#39' || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'11'#39', '#39'Novembro/'#39' || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR(M' +
        'ESCOBRANCA,1,4),'
      
        '                                   '#39'13'#39','#39'Contrib. sobre 13º Sal/' +
        #39' || SUBSTR(MESCOBRANCA,1,4),'
      
        '                                         SUBSTR(MESCOBRANCA,6,12' +
        ') || '#39'/'#39' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA,'
      '   DATAPREVISAORECE,'
      '   0 AS NUMPARCELA,'
      
        '   SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS V' +
        'ALORCALCULADO'
      'FROM'
      '   HSTCONTRIBPREV'
      'WHERE'
      '       IDPESSOA = :PIDPESSOA'
      '   AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0)'
      '   AND DATAPREVISAORECE < :PDATAPREVISAORECE'
      'GROUP BY'
      '   MESREFERENCIA, MESCOBRANCA, DATAPREVISAORECE'
      ''
      'UNION'
      ''
      'SELECT'
      '    0 AS FLGESCOLHA,'
      '    2                AS CODTIPO,'
      '    '#39'Assistencial  '#39' AS TIPO,'
      '    MES AS ORDEM,'
      
        '    DECODE(SUBSTR(MES,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'03'#39', '#39'Março/'#39'    || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'04'#39', '#39'Abril/'#39'    || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'05'#39', '#39'Maio/'#39'     || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'06'#39', '#39'Junho/'#39'    || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'07'#39', '#39'Julho/'#39'    || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'09'#39', '#39'Setembro/'#39' || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'11'#39', '#39'Novembro/'#39' || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR(MES,1,4)' +
        ','
      
        '                            '#39'13'#39','#39'Contrib. sobre 13º Sal/'#39' || SU' +
        'BSTR(MES,1,4),'
      
        '                                          SUBSTR(MES,6,12) || '#39'/' +
        #39' || SUBSTR(MES,1,4)) AS MESREFERENCIA,'
      ''
      
        '    DECODE(SUBSTR(MESCOBRANCA,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'03'#39', '#39'Março/'#39'    || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'04'#39', '#39'Abril/'#39'    || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'05'#39', '#39'Maio/'#39'     || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'06'#39', '#39'Junho/'#39'    || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'07'#39', '#39'Julho/'#39'    || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'09'#39', '#39'Setembro/'#39' || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'11'#39', '#39'Novembro/'#39' || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR(' +
        'MESCOBRANCA,1,4),'
      
        '                                    '#39'13'#39','#39'Contrib. sobre 13º Sal' +
        '/'#39' || SUBSTR(MESCOBRANCA,1,4),'
      
        '                                          SUBSTR(MESCOBRANCA,6,1' +
        '2) || '#39'/'#39' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA,'
      '    DATAPREVISAO AS DATAPREVISAORECE,'
      '    0 AS NUMPARCELA,'
      '    SUM(VALORESPERADO) AS VALORCALCULADO'
      'FROM'
      '    HSTCONTRIBASS'
      'WHERE'
      '    IDTITULAR = :PIDPESSOA'
      'AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0)'
      'AND DATAPREVISAO < :PDATAPREVISAORECE'
      'GROUP BY'
      '    MES,'
      '    MESCOBRANCA,'
      '    DATAPREVISAO'
      ''
      'UNION'
      ''
      'SELECT'
      '    0 AS FLGESCOLHA,'
      '    3                AS CODTIPO,'
      '    '#39'Fin. Habitac. '#39' AS TIPO,'
      '    REFERENCIA AS ORDEM,'
      
        '    DECODE(SUBSTR(REFERENCIA,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR(R' +
        'EFERENCIA,1,4),'
      
        '                            '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'03'#39', '#39'Março/'#39'    || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'04'#39', '#39'Abril/'#39'    || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'05'#39', '#39'Maio/'#39'     || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'06'#39', '#39'Junho/'#39'    || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'07'#39', '#39'Julho/'#39'    || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'09'#39', '#39'Setembro/'#39' || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'11'#39', '#39'Novembro/'#39' || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR(REFERENC' +
        'IA,1,4),'
      
        '                            '#39'13'#39','#39'Contrib. sobre 13º Sal/'#39' || SU' +
        'BSTR(REFERENCIA,1,4),'
      
        '                                          SUBSTR(REFERENCIA,6,12' +
        ') || '#39'/'#39' || SUBSTR(REFERENCIA,1,4)) AS MESREFERENCIA,'
      ''
      
        '    DECODE(SUBSTR(COBRANCA,6,12),'#39'01'#39', '#39'Janeiro/'#39'  || SUBSTR(COB' +
        'RANCA,1,4),'
      
        '                                    '#39'02'#39', '#39'Fevereiro/'#39'|| SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'03'#39', '#39'Março/'#39'    || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'04'#39', '#39'Abril/'#39'    || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'05'#39', '#39'Maio/'#39'     || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'06'#39', '#39'Junho/'#39'    || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'07'#39', '#39'Julho/'#39'    || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'08'#39', '#39'Agosto/'#39'   || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'09'#39', '#39'Setembro/'#39' || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'10'#39', '#39'Outubro/'#39'  || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'11'#39', '#39'Novembro/'#39' || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'12'#39', '#39'Dezembro/'#39' || SUBSTR(' +
        'COBRANCA,1,4),'
      
        '                                    '#39'13'#39','#39'Contrib. sobre 13º Sal' +
        '/'#39' || SUBSTR(COBRANCA,1,4),'
      
        '                                          SUBSTR(COBRANCA,6,12) ' +
        '|| '#39'/'#39' || SUBSTR(COBRANCA,1,4)) AS MESCOBRANCA,'
      '    DATAVENCTO AS DATAPREVISAORECE,'
      '    NUMPARCELA,'
      
        '    SUM(VLRPARCELA+MULTAEP+JUROSEP+CORRECAOEP+SEGUROEP+MULTASEGE' +
        'P+JUROSSEGEP+CORRECAOSEGEP-DESCONTOEP) AS VALORCALCULADO'
      'FROM'
      '   EPHISTSIAFI'
      'WHERE'
      '       IDPESSOA = :PIDPESSOA'
      '   AND (VLRPARCELAPG IS NULL OR VLRPARCELAPG = 0)'
      '   AND DATAVENCTO < :PDATAPREVISAORECE'
      'GROUP BY'
      '   NUMPARCELA, REFERENCIA, COBRANCA, DATAVENCTO')
    UpdateObject = updOutrasDividas
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 728
    Top = 512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '30572'
      end
      item
        DataType = ftDateTime
        Name = 'PDATAPREVISAORECE'
        ParamType = ptInput
        Value = '05/06/2003'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAPREVISAORECE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAPREVISAORECE'
        ParamType = ptInput
      end>
    object qryOutrasDividasFLGESCOLHA: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'FLGESCOLHA'
    end
    object qryOutrasDividasTIPO: TStringField
      DisplayLabel = 'Tipo de Dívida'
      DisplayWidth = 22
      FieldName = 'TIPO'
      FixedChar = True
      Size = 14
    end
    object qryOutrasDividasNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
    end
    object qryOutrasDividasMESREFERENCIA: TStringField
      DisplayLabel = 'Mês Referência'
      DisplayWidth = 15
      FieldName = 'MESREFERENCIA'
      Size = 27
    end
    object qryOutrasDividasMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de Cobrança'
      DisplayWidth = 23
      FieldName = 'MESCOBRANCA'
      Size = 27
    end
    object qryOutrasDividasDATAPREVISAORECE: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 13
      FieldName = 'DATAPREVISAORECE'
    end
    object qryOutrasDividasVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VALORCALCULADO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryOutrasDividasCODTIPO: TFloatField
      FieldName = 'CODTIPO'
      Visible = False
    end
    object qryOutrasDividasORDEM: TStringField
      FieldName = 'ORDEM'
      Visible = False
      Size = 7
    end
  end
  object qryInsertHistMovInsc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVINSCRICAO'
      '   (IDHISTMOVINSC,'
      '    IDREGRA,'
      '    IDINSCRICAOEMPTMO,'
      '    IDITEMEMPTMO,'
      '    HMICENTRALIZA,'
      '    HMIDESTACADO,'
      '    HMIVLRPREVISTO)'
      'VALUES'
      '    (SEQHISTMOVINSCRICAO.NEXTVAL,'
      '     :PIDREGRA,'
      '     :PIDINSCRICAOEMPTMO,'
      '     :PIDITEMEMPTMO,'
      '     :PHMICENTRALIZA,'
      '     :PHMIDESTACADO,'
      '     :PHMIVLRPREVISTO)'
      '')
    ValidateWithMask = True
    Left = 573
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMICENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMIDESTACADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMIVLRPREVISTO'
        ParamType = ptInput
      end>
  end
  object qrySaldoQuitacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.IDITEMEMPTMO     =:PIDITEMEMPTMO')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 464
    Top = 512
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoQuitacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
  end
  object qryTipoContrXQuit: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*) AS QUANTIDADE'
      'FROM'
      '   TIPOCONTRXQUIT'
      'WHERE'
      '       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND IDTIPOCONTRQUIT   =:PIDTIPOCONTRQUIT')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 628
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRQUIT'
        ParamType = ptInput
      end>
    object qryTipoContrXQuitQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object qrySaldoQuitacaoBAK: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME,'
      '    CONTRATOEMPTMO CON'
      'WHERE'
      '       CON.IDCONTRQUITACAO  =:PIDCONTRQUITACAO'
      '   AND HME.IDITEMEMPTMO     =:PIDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 492
    Top = 512
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRQUITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
  end
  object qrySuspAnterior: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.IDHISTSUSPCOBEP'
      '      ,H.IDTIPOSUSPEMPTMO'
      '      ,H.IDCONTRATOEMPTMO'
      '      ,H.FLGSTATUS'
      '      ,H.FLGFERIAS'
      '      ,H.HSCINICIOSUSP'
      '      ,H.HSCFINALSUSP'
      '      ,H.HSCMESES'
      '      ,H.HSCUSUATEND'
      '      ,H.HSCDATAATEND'
      '      ,H.HSCDATALIBER'
      '      ,H.HSCUSULIBER'
      '      ,H.HSCDATAATU'
      '      ,H.HSCANOCOBRANCA'
      '      ,H.HSCMESCOBRANCA'
      '  FROM HISTSUSPCOBEP H'
      '      ,TIPOCONTRXSUSP T'
      '      ,contratoemptmo c'
      ' WHERE H.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO'
      '   AND c.idcontratoemptmo = h.idcontratoemptmo'
      '   AND c.idtipocontremptmo = t.idtipocontremptmo'
      '   AND H.IDTIPOSUSPEMPTMO(+) = T.IDTIPOSUSPEMPTMO'
      '   AND T.IDTIPOCONTREMPTMO   =:PIDTIPOCONTREMPTMO'
      
        '   AND (H.HSCFINALSUSP       >=:PHSCFINALSUSP OR H.HSCFINALSUSP ' +
        'IS NULL)'
      
        '   AND (:PIDTIPOSUSPEMPTMO   IS NULL OR H.IDTIPOSUSPEMPTMO =:PID' +
        'TIPOSUSPEMPTMO)'
      '   AND H.FLGSTATUS           NOT IN ('#39'C'#39', '#39'E'#39')'
      
        '   AND (H.HSCDATALIBER       IS NULL OR H.HSCDATALIBER >:PHSCFIN' +
        'ALSUSP)'
      'ORDER BY'
      '   H.HSCFINALSUSP DESC'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 552
    Top = 512
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHSCFINALSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHSCFINALSUSP'
        ParamType = ptInput
      end>
    object qrySuspAnteriorIDHISTSUSPCOBEP: TFloatField
      FieldName = 'IDHISTSUSPCOBEP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDHISTSUSPCOBEP'
    end
    object qrySuspAnteriorIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDTIPOSUSPEMPTMO'
    end
    object qrySuspAnteriorIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDCONTRATOEMPTMO'
    end
    object qrySuspAnteriorFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qrySuspAnteriorFLGFERIAS: TFloatField
      FieldName = 'FLGFERIAS'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.FLGFERIAS'
    end
    object qrySuspAnteriorHSCINICIOSUSP: TDateTimeField
      FieldName = 'HSCINICIOSUSP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCINICIOSUSP'
    end
    object qrySuspAnteriorHSCFINALSUSP: TDateTimeField
      FieldName = 'HSCFINALSUSP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCFINALSUSP'
    end
    object qrySuspAnteriorHSCMESES: TFloatField
      FieldName = 'HSCMESES'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCMESES'
    end
    object qrySuspAnteriorHSCUSUATEND: TStringField
      FieldName = 'HSCUSUATEND'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCUSUATEND'
      Size = 30
    end
    object qrySuspAnteriorHSCDATAATEND: TDateTimeField
      FieldName = 'HSCDATAATEND'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATAATEND'
    end
    object qrySuspAnteriorHSCDATALIBER: TDateTimeField
      FieldName = 'HSCDATALIBER'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATALIBER'
    end
    object qrySuspAnteriorHSCUSULIBER: TStringField
      FieldName = 'HSCUSULIBER'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCUSULIBER'
      Size = 30
    end
    object qrySuspAnteriorHSCDATAATU: TDateTimeField
      FieldName = 'HSCDATAATU'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATAATU'
    end
    object qrySuspAnteriorHSCANOCOBRANCA: TFloatField
      FieldName = 'HSCANOCOBRANCA'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCANOCOBRANCA'
    end
    object qrySuspAnteriorHSCMESCOBRANCA: TFloatField
      FieldName = 'HSCMESCOBRANCA'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCMESCOBRANCA'
    end
  end
  object updBenefSeguro: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXBENEFSEG'
      'set'
      '  PERCINDENIZACAO = :PERCINDENIZACAO,'
      '  VLRSALDOREC = :VLRSALDOREC,'
      '  VLRREPASSE = :VLRREPASSE,'
      '  DATAREPASSE = :DATAREPASSE,'
      '  NUMBANCO = :NUMBANCO,'
      '  CODAGENCIA = :CODAGENCIA,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  NOME = :NOME,'
      '  OBS = :OBS'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    InsertSQL.Strings = (
      'insert into CONTRATOXBENEFSEG'
      '  (IDINSCRICAOEMPTMO, IDBENEFSEGURO, PERCINDENIZACAO, '
      'TRGDTINCLUSAO, TRGUSERINCLUSAO, '
      '   VLRSALDOREC, VLRREPASSE, DATAREPASSE, NUMBANCO, CODAGENCIA, '
      'CONTACORRENTE, '
      '   NOME, OBS)'
      'values'
      '  (:IDINSCRICAOEMPTMO, :IDBENEFSEGURO, :PERCINDENIZACAO, '
      ':TRGDTINCLUSAO, '
      '   :TRGUSERINCLUSAO, :VLRSALDOREC, :VLRREPASSE, :DATAREPASSE, '
      ':NUMBANCO, '
      '   :CODAGENCIA, :CONTACORRENTE, :NOME, :OBS)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXBENEFSEG'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    Left = 570
    Top = 511
  end
  object qryBuscaItens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(ITCORDEMIMP,0) AS ITCORDEMIMP,'
      '    NVL(ITCITEMIMPRESSO,0) AS ITCITEMIMPRESSO'
      'FROM'
      '    ITEMXTIPOCONTR'
      'WHERE'
      '    IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO'
      'AND IDITEMEMPTMO      = :PIDITEMEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 463
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaItensITCORDEMIMP: TFloatField
      FieldName = 'ITCORDEMIMP'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCORDEMIMP'
    end
    object qryBuscaItensITCITEMIMPRESSO: TFloatField
      FieldName = 'ITCITEMIMPRESSO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCITEMIMPRESSO'
    end
  end
  object qryItensImpressao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDITEMEMPTMO,'
      '   '#39'NOME'#39' AS ITEM,'
      '   0 AS VALOR,'
      '   0 AS SEQIMPRESSAO,'
      '   -1 AS IDREGRA,'
      '   0 AS FLGCENTRALIZA,'
      '   0 AS FLGDESTACADO'
      'FROM'
      'DUAL'
      '')
    ValidateWithMask = True
    Left = 484
    Top = 395
    object qryItensImpressaoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensImpressaoITEM: TStringField
      FieldName = 'ITEM'
      FixedChar = True
      Size = 4
    end
    object qryItensImpressaoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryItensImpressaoSEQIMPRESSAO: TFloatField
      FieldName = 'SEQIMPRESSAO'
    end
    object qryItensImpressaoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensImpressaoFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
    end
    object qryItensImpressaoFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
    end
  end
  object qryInsertHistSuspensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTSUSPCOBEP'
      '('
      'IDHISTSUSPCOBEP,'
      'IDTIPOSUSPEMPTMO,'
      'IDCONTRATOEMPTMO,'
      'FLGSTATUS,'
      'FLGFERIAS,'
      'HSCINICIOSUSP,'
      'HSCFINALSUSP,'
      'HSCMESES,'
      'HSCUSUATEND,'
      'HSCDATAATEND'
      ')'
      'VALUES'
      '('
      'SEQHISTSUSPCOBEP.NEXTVAL,'
      ':PIDTIPOSUSPEMPTMO,'
      ':PIDCONTRATOEMPTMO,'
      ':PFLGSTATUS,'
      ':PFLGFERIAS,'
      ':PHSCINICIOSUSP,'
      ':PHSCFINALSUSP,'
      ':PHSCMESES,'
      ':PHSCUSUATEND,'
      ':PHSCDATAATEND'
      ')'
      ' ')
    ValidateWithMask = True
    Left = 785
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGFERIAS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHSCINICIOSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHSCFINALSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHSCMESES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHSCUSUATEND'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHSCDATAATEND'
        ParamType = ptInput
      end>
  end
  object qryContratosAnteriores2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CON.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO,  NVL(VAL.VLRTOTA' +
        'L, 0) AS VLREMABERTO'
      'FROM'
      '   CONTRATOEMPTMO CON,'
      #9'('
      #9'SELECT'
      #9#9'SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO'
      #9'FROM'
      #9#9'HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      #9'WHERE'
      '          ( C.IDPESSOA           =:PIDPESSOA )'
      '      AND ( C.IDBENEF            =:PIDBENEF )'
      '      AND ( H.HMEDATAPREVISTA    <=:PHMEDATA )'
      '      AND ( H.HMETIPOMOV         NOT IN (0, 5, 8) )'
      
        '      AND ( (H.HMEDATAEFETIVA    IS NULL) OR (H.HMEDATAEFETIVA >' +
        ':PHMEDATA) )'
      
        '      AND ( (H.HMEVLREFETIVO     IS NULL) OR (H.HMEDATAEFETIVA >' +
        ':PHMEDATA) )'
      
        '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) ' +
        ')'
      
        '      AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0' +
        ') )'
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      
        '      AND ( ( C.IDTIPOSUSPEMPTMO   IS NULL AND (H.FLGSUSPENSAO I' +
        'S NULL OR H.FLGSUSPENSAO = 0) ) )'
      ''
      '   GROUP BY'
      '      H.IDCONTRATOEMPTMO'
      #9') VAL'
      'WHERE'
      '       CON.IDPESSOA     =:PIDPESSOA'
      '   AND CON.IDBENEF      =:PIDBENEF'
      '   AND CON.FLGSITUACAO  NOT IN ('#39'C'#39', '#39'Q'#39')'
      '   AND CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+)'
      '')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 592
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '518'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
        Value = '421'
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end>
    object qryContratosAnteriores2IDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosAnteriores2IDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosAnteriores2VLREMABERTO: TFloatField
      FieldName = 'VLREMABERTO'
    end
  end
  object dtsTipoContrato: TwwDataSource
    DataSet = qryTipoContrato
    Left = 781
    Top = 108
  end
  object qryContratosAnteriores_ANTIGA: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   0 AS FLGESCOLHA,'
      
        '   CON.IDCONTRATOEMPTMO , CON.VLRCONTRATO, CON.DATACREDITO, CON.' +
        'FLGFORMAREC, CON.DATAASSINATURA,'
      
        '   CON.IDINSCRICAOEMPTMO, CON.NUMPARCELAS, CON.IDTIPOCONTREMPTMO' +
        ', CON.VLRPARCELA,'
      
        '   CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUSP, CON.DATAFIMSUSP, CO' +
        'N.FLGSUSPENSAOAUTO, CON.DATALIBSUSP,'
      
        '   CON.MOECODIGO, MOE.MOESIGLA, CON.IDPATRO, CON.IDPESSOA, CON.I' +
        'DPLANOPREV, CON.IDBENEF,'
      
        '   CON.DATAPRIMPARC, TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO, TCE.TCE' +
        'MINRENOVA,'
      '   SLD.HMESALDODEV,'
      '   NVL(PAR.NUMPARCPAGAS, 0) AS NUMPARCPAGAS,'
      '   0 AS VLRATUAL,'
      '   0 AS VLRDEVSEG,'
      '   NVL(VAL.VLRTOTAL, 0) AS VLREMABERTO,'
      ''
      '   ATU.ULT_PARC,'
      ''
      '   SIT.IDSITPART'
      ''
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   PARTPREVPLAN    PPP,'
      '   MOEDA           MOE,'
      '   TIPOCONTREMPTMO TCE,'
      '   SITPART         SIT,'
      ''
      '   ('
      '   SELECT'
      '      H.IDCONTRATOEMPTMO, MAX(H.HMEPARCELA) AS ULT_PARC'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      CONTRATOEMPTMO C'
      '   WHERE'
      '          ( C.IDPESSOA         =:PIDPESSOA )'
      '      AND ( C.IDBENEF          =:PIDBENEF )'
      '      AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      H.IDCONTRATOEMPTMO'
      '   ) ATU,'
      ''
      #9'('
      #9'SELECT'
      #9#9'COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS,'
      #9#9'C.IDCONTRATOEMPTMO'
      #9'FROM'
      #9#9'CONTRATOEMPTMO C,'
      #9#9'('
      #9#9'SELECT'
      #9#9#9'H.IDCONTRATOEMPTMO,'
      #9#9#9'H.HMEPARCELA,'
      
        '         SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO,' +
        ' 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL'
      #9#9'FROM'
      #9#9#9'HISTMOVEMPTMO H,'
      '         CONTRATOEMPTMO C'
      '      WHERE'
      '             ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 )'
      '         AND ( C.IDPESSOA         =:PIDPESSOA )'
      '         AND ( C.IDBENEF          =:PIDBENEF )'
      '         AND ( C.FLGSITUACAO      NOT IN ('#39'C'#39', '#39'Q'#39') )'
      
        '         AND ( H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO = 0 ' +
        ')'
      
        '         AND ( H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO = 0 ' +
        ')'
      '         AND ( H.FLGABONADO       IS NULL OR H.FLGABONADO = 0 )'
      '         AND ( H.HMETIPOMOV       = 1 )'
      '         AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )'
      #9#9'GROUP BY'
      #9#9#9'H.IDCONTRATOEMPTMO, H.HMEPARCELA'
      #9#9'HAVING'
      
        '             ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVI' +
        'STO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 )'
      #9#9#9'AND ( HMEPARCELA <> 0 )'
      #9#9') PAG'
      '   WHERE'
      '          ( C.IDPESSOA           =:PIDPESSOA )'
      '      AND ( C.IDBENEF            =:PIDBENEF )'
      '      AND ( C.FLGSITUACAO        NOT IN ('#39'C'#39', '#39'Q'#39') )'
      '      AND ( C.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) )'
      '   GROUP BY'
      '      C.IDCONTRATOEMPTMO'
      '   ) PAR,'
      ''
      #9'('
      #9'SELECT'
      #9#9'H.IDHISTMOVEMPTMO, H.HMESALDODEV, H.IDCONTRATOEMPTMO'
      #9'FROM'
      #9#9'HISTMOVEMPTMO H,'
      '      ('
      '      SELECT'
      
        '         MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONT' +
        'RATOEMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             ( CON.IDPESSOA           =:PIDPESSOA )'
      '         AND ( CON.IDBENEF            =:PIDBENEF )'
      '         AND ( HME.HMEDATAATUALIZA   <=:PHMEDATAATUALIZA )'
      '         AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '         AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO ' +
        'IS NULL) )'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         HME.IDCONTRATOEMPTMO'
      '      ) ULT'
      #9'WHERE'
      '          ( H.HMEDATAATUALIZA <=:PHMEDATAATUALIZA )'
      #9#9'AND ( H.IDHISTMOVEMPTMO = ULT.IDHISTMOVEMPTMO )'
      #9') SLD,'
      ''
      #9'('
      #9'SELECT'
      #9#9'SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO'
      #9'FROM'
      #9#9'HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      #9'WHERE'
      '          ( C.IDPESSOA           =:PIDPESSOA )'
      '      AND ( C.IDBENEF            =:PIDBENEF )'
      '      AND ( H.HMEDATAPREVISTA    <=:PHMEDATA )'
      '      AND ( H.HMETIPOMOV         NOT IN (0, 5, 8) )'
      
        '      AND ( (H.HMEDATAEFETIVA    IS NULL) OR (H.HMEDATAEFETIVA >' +
        ':PHMEDATA) )'
      
        '      AND ( (H.HMEVLREFETIVO     IS NULL) OR (H.HMEDATAEFETIVA >' +
        ':PHMEDATA) )'
      
        '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) ' +
        ')'
      
        '      AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0' +
        ') )'
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      
        '      AND ( ( C.IDTIPOSUSPEMPTMO   IS NULL AND (H.FLGSUSPENSAO I' +
        'S NULL OR H.FLGSUSPENSAO = 0) ) )'
      ''
      '   GROUP BY'
      '      H.IDCONTRATOEMPTMO'
      #9') VAL'
      ''
      'WHERE'
      '       ( CON.IDPESSOA            =:PIDPESSOA )'
      '   AND ( CON.IDBENEF             =:PIDBENEF )'
      '   AND ( TCE.IDTIPOEMPTMO        =:PIDTIPOEMPTMO )'
      '   AND ( CON.FLGSITUACAO         NOT IN ('#39'C'#39', '#39'Q'#39') )'
      '   AND ( VAL.VLRTOTAL > 0        OR SLD.HMESALDODEV > 0 )'
      '   AND ( PPP.IDPESSOA            = CON.IDPESSOA )'
      ''
      
        '   AND ( :PJOINPLANO             IS NOT NULL OR (:PJOINPLANO IS ' +
        'NULL AND PPP.IDPLANOPREV = CON.IDPLANOPREV) )'
      ''
      
        '   AND ( :PQUITAVEL              IS NULL OR CON.IDTIPOCONTREMPTM' +
        'O IN'
      '                                             ('
      '                                             SELECT'
      '                                                 IDTIPOCONTRQUIT'
      '                                             FROM'
      '                                                 TIPOCONTRXQUIT'
      '                                             WHERE'
      
        '                                                 IDTIPOCONTREMPT' +
        'MO =:PIDTIPOCONTREMPTMO'
      '                                             )'
      '       )'
      ''
      '   AND ( SIT.IDSITPART           = PPP.IDSITPART )'
      '   AND ( CON.IDCONTRATOEMPTMO    = PAR.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = SLD.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = ATU.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( CON.MOECODIGO           = MOE.MOECODIGO(+) )'
      '   AND PPP.FLGDESATIVADO         = 0')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 244
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '518'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
        Value = '421'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
        Value = 37504d
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
        Value = '9'
      end
      item
        DataType = ftInteger
        Name = 'PJOINPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PJOINPLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PQUITAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
  end
  object qrySuspContratoAnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDTIPOSUSPEMPTMO'
      '      ,C.DATAINICIOSUSP'
      '      ,C.DATAFIMSUSP'
      '  FROM CONTRATOEMPTMO C'
      '      ,TIPOCONTRXSUSP T'
      'WHERE  C.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '  AND  C.IDTIPOSUSPEMPTMO  IS NOT NULL'
      '  AND  C.IDTIPOSUSPEMPTMO  = T.IDTIPOSUSPEMPTMO'
      '  AND  T.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '  AND  :PDATA BETWEEN C.DATAINICIOSUSP AND C.DATAFIMSUSP'
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 524
    Top = 512
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATA'
        ParamType = ptInput
      end>
    object qrySuspContratoAntIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDTIPOSUSPEMPTMO'
    end
    object qrySuspContratoAntDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.DATAINICIOSUSP'
    end
    object qrySuspContratoAntDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.DATAFIMSUSP'
    end
  end
  object qryEncerraSuspensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTSUSPCOBEP'
      'SET FLGSTATUS = '#39'E'#39
      'WHERE IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 881
    Top = 195
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryVerificaCarencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO, NVL(TCE.TCEMINRENOV' +
        'A,0) AS TCEMINRENOVA'
      'FROM'
      '    TIPOCONTREMPTMO TCE,'
      '    TIPOCONTRXQUIT TCQ'
      'WHERE'
      '    TCE.IDTIPOCONTREMPTMO = TCQ.IDTIPOCONTREMPTMO'
      'AND TCQ.IDTIPOCONTRQUIT IN (SELECT IDTIPOCONTREMPTMO'
      '                            FROM   TIPOCONTREMPTMO'
      
        '                            WHERE  IDTIPOCONTREMPTMO = :PIDTIPOC' +
        'ONTREMPTMO)'
      'UNION'
      'SELECT'
      
        '    TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO, NVL(TCE.TCEMINRENOV' +
        'A,0) AS TCEMINRENOVA'
      'FROM'
      '    TIPOCONTREMPTMO TCE'
      'WHERE'
      '    TCE.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 809
    Top = 511
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryVerificaCarenciaTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryVerificaCarenciaIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryVerificaCarenciaTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
  end
  object qryInsereAvalista: TwwQuery
    CachedUpdates = True
    BeforeClose = qryAvalistaBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM AVALISTA'
      'WHERE IDAVALISTA = :PIDPESSOA'
      ''
      ''
      ''
      ' ')
    UpdateObject = updInsereAvalista
    ValidateWithMask = True
    Left = 653
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryInsereAvalistaIDAVALISTA: TFloatField
      FieldName = 'IDAVALISTA'
      Origin = 'BASEDADOS.AVALISTA.IDAVALISTA'
    end
    object qryInsereAvalistaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.AVALISTA.NOME'
      Size = 60
    end
    object qryInsereAvalistaORIGEMREND: TStringField
      FieldName = 'ORIGEMREND'
      Origin = 'BASEDADOS.AVALISTA.ORIGEMREND'
      Size = 60
    end
    object qryInsereAvalistaRENDACOMP: TFloatField
      FieldName = 'RENDACOMP'
      Origin = 'BASEDADOS.AVALISTA.RENDACOMP'
    end
    object qryInsereAvalistaMARGEMCONSIG: TFloatField
      FieldName = 'MARGEMCONSIG'
      Origin = 'BASEDADOS.AVALISTA.MARGEMCONSIG'
    end
    object qryInsereAvalistaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'BASEDADOS.AVALISTA.CPF'
      Size = 15
    end
    object qryInsereAvalistaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.AVALISTA.TRGDTINCLUSAO'
    end
    object qryInsereAvalistaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.AVALISTA.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object updInsereAvalista: TUpdateSQL
    ModifySQL.Strings = (
      'update AVALISTA'
      'set'
      '  IDAVALISTA = :IDAVALISTA,'
      '  NOME = :NOME,'
      '  RENDACOMP = :RENDACOMP,'
      '  MARGEMCONSIG = :MARGEMCONSIG'
      'where'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    InsertSQL.Strings = (
      'insert into AVALISTA'
      '  (IDAVALISTA, NOME, RENDACOMP, MARGEMCONSIG )'
      'values'
      '  (:IDAVALISTA, :NOME, :RENDACOMP, :MARGEMCONSIG )')
    DeleteSQL.Strings = (
      'delete from AVALISTA'
      'where'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    Left = 801
    Top = 191
  end
  object qryBuscaPlanoContabil: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PXP.IDPLANOPREV, PXP.IDPLANPREVC,'
      ''
      '   PP.NOME AS PLANO_PREV, EC.NOME AS ENTIDADE_CONTABIL'
      ''
      'FROM'
      '   PLANPREVXCONTABIL PXP, PLANPREV PP, PLANPREVCONTABIL EC'
      ''
      'WHERE'
      '       ( PXP.IDPLANOPREV = PP.IDPLANOPREV )'
      '   AND ( PXP.IDPLANPREVC = EC.IDPLANOPREV )'
      '   AND ( PP.IDPLANOPREV = :PIDPLANOPREV )')
    ValidateWithMask = True
    Left = 808
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryBuscaPlanoContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANOPREV'
    end
    object qryBuscaPlanoContabilIDPLANPREVC: TFloatField
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANPREVC'
    end
    object qryBuscaPlanoContabilPLANO_PREV: TStringField
      FieldName = 'PLANO_PREV'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryBuscaPlanoContabilENTIDADE_CONTABIL: TStringField
      FieldName = 'ENTIDADE_CONTABIL'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryContratoQuitavel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(FLGOBRIGATORIO,0) AS FLOBRIGATORIO'
      'FROM'
      '   TIPOCONTRXQUIT'
      'WHERE'
      '       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND IDTIPOCONTRQUIT   =:PIDTIPOCONTRQUIT')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 812
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRQUIT'
        ParamType = ptInput
      end>
    object qryContratoQuitavelFLOBRIGATORIO: TFloatField
      FieldName = 'FLOBRIGATORIO'
    end
  end
  object qryContratosAnteriores2BKP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '       CON.IDPESSOA     =:PIDPESSOA'
      '   AND CON.IDBENEF      =:PIDBENEF'
      '   AND CON.FLGSITUACAO  NOT IN ('#39'C'#39', '#39'Q'#39')')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 216
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '518'
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
        Value = '421'
      end>
    object FloatField1: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 817
    Top = 211
  end
  object QryBuscaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' select '
      '        FLGPERDAEFETIVA, '
      '        idpessoa'
      'from contratoemptmo'
      'where  FLGPERDAEFETIVA = 1'
      'and idpessoa  = :idpessoa')
    ValidateWithMask = True
    Left = 40
    Top = 342
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 0
      end>
    object QryBuscaContratoFLGPERDAEFETIVA: TFloatField
      FieldName = 'FLGPERDAEFETIVA'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGPERDAEFETIVA'
    end
    object QryBuscaContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPESSOA'
    end
  end
  object qryVerificaAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      HME.IDCONTRATOEMPTMO, DECODE(HME.FLGENVIO,NULL,1,'
      
        '                                                                ' +
        '                                    1,1,'
      
        '                                                                ' +
        '                                    0,0) AS FLGENVIO,  HME.HMEDA' +
        'TAPREVISTA '
      '  FROM HISTMOVEMPTMO HME'
      ' WHERE HME.HMETIPOMOV      = 2'
      '   AND HME.HMECENTRALIZA   = 1 '
      '   AND HME.FLGBAIXADO      = 0'
      '   AND HME.HMEVLREFETIVO  IS NULL '
      '   AND HME.HMEDATAEFETIVA IS NULL '
      '   AND NVL(HME.FLGESTORNADO, 0) = 0 '
      '   AND NVL(HME.FLGQUITADO, 0) = 0 '
      '   AND NVL(HME.FLGABONADO, 0) = 0       '
      '   AND HME.IDCONTRATOEMPTMO =:IDCONTRATOEMPTMO'
      '   AND HME.HMEDATAPREVISTA > :HMEDATAPREVISTA '
      '  '
      '                 '
      '')
    ValidateWithMask = True
    Left = 184
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HMEDATAPREVISTA'
        ParamType = ptUnknown
      end>
    object qryVerificaAmortizacaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryVerificaAmortizacaoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryVerificaAmortizacaoFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
  end
end
