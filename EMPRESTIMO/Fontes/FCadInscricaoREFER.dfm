inherited frmCadInscricaoREFER: TfrmCadInscricaoREFER
  Left = 53
  Top = 104
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Inscrição em Empréstimo REFER'
  ClientHeight = 436
  ClientWidth = 738
  FormStyle = fsNormal
  Menu = MainMenu1
  Visible = False
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
    Width = 738
    Height = 368
    BorderWidth = 0
    object pnlDetalhe: TPanel
      Left = -7
      Top = 368
      Width = 661
      Height = 178
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object pgcValores: TPageControl
        Left = 0
        Top = 0
        Width = 661
        Height = 178
        ActivePage = tbsGeral
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
            Left = 424
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
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 216
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
          object Label6: TLabel
            Left = 16
            Top = 10
            Width = 88
            Height = 13
            Caption = 'Res. Poupança'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 192
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
            Left = 424
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
            Left = 344
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
            Left = 536
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
            Left = 528
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
          object Label37: TLabel
            Left = 128
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
            Left = 352
            Top = 10
            Width = 57
            Height = 13
            Caption = 'Indexador'
          end
          object DBspeParcelas: TwwDBSpinEdit
            Left = 344
            Top = 120
            Width = 65
            Height = 30
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 12
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
            TabOrder = 11
            UnboundDataType = wwDefault
            OnEnter = DBspeParcelasEnter
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
            TabOrder = 4
            UnboundDataType = wwDTEdtDate
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
            TabOrder = 6
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
            TabOrder = 5
          end
          object edtCarencia: TEdit
            Left = 424
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
            TabOrder = 7
          end
          object edtPercentJuros: TRealEdit
            Left = 424
            Top = 120
            Width = 97
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
            TabOrder = 12
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object edtValMargem: TRealEdit
            Left = 344
            Top = 328
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
            TabOrder = 15
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
            Left = 536
            Top = 120
            Width = 113
            Height = 30
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -20
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DBedtValorSolic: TDBEdit
            Left = 192
            Top = 120
            Width = 137
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
            TabOrder = 10
            OnEnter = DBedtValorSolicEnter
            OnExit = DBedtValorSolicExit
          end
          object edtDataPrimParcela: TCMDateTimePicker
            Left = 528
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
            Color = clBtnFace
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 8
          end
          object pnlCancela: TPanel
            Left = 520
            Top = 152
            Width = 129
            Height = 41
            BevelOuter = bvNone
            TabOrder = 14
            TabStop = True
          end
          object RealEdit1: TRealEdit
            Left = 208
            Top = 328
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
            TabOrder = 16
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object DBEdtVlrMaxPermit: TDBEdit
            Left = 16
            Top = 120
            Width = 132
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
            TabOrder = 9
          end
          object DBEdtMargem: TDBEdit
            Left = 216
            Top = 24
            Width = 97
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
            TabOrder = 2
          end
          object DBEdtSalarioBase: TDBEdit
            Left = 128
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
          end
          object dbcboMoeda: TwwDBLookupCombo
            Left = 352
            Top = 24
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
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object tbsItens: TTabSheet
          Caption = 'Itens'
          ImageIndex = 3
          object Label24: TLabel
            Left = 8
            Top = 10
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
            Top = 24
            Width = 413
            Height = 132
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
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 736
      Height = 368
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblTitulo: TfcLabel
        Left = 16
        Top = 8
        Width = 483
        Height = 24
        Caption = 'REFER - Contrataçào de Empréstimos [seleção]'
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
      object ntbPrincipal: TNotebook
        Left = 0
        Top = 5
        Width = 736
        Height = 363
        Align = alBottom
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Selecao'
          object btnContinuar: TfcShapeBtn
            Left = 632
            Top = 328
            Width = 89
            Height = 29
            Caption = 'Continuar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F88888888887F887FBBBBB0BBBB088878888887F8887887FBBBBBB00BB
              BB087F88FFFF77F888787FB00000000BBB087F877777777F88787FB000000000
              BB087F877777777788787FB00000000BBB087F877777777888787FBBBBBB00BB
              BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuarClick
          end
          object BitBtn3: TBitBtn
            Left = 679
            Top = 54
            Width = 21
            Height = 20
            Hint = 'Inverte a Seleção'
            TabOrder = 0
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
          end
          object BitBtn4: TBitBtn
            Left = 700
            Top = 54
            Width = 21
            Height = 20
            Hint = 'Seleciona Todos'
            TabOrder = 1
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 16
            Width = 721
            Height = 297
            Selected.Strings = (
              'IDINSCRICAOEMPTMO'#9'13'#9'Inscrição'
              'NOME'#9'73'#9'Nome'
              'OPCAO'#9'10'#9'Opção')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsArquivoLido
            TabOrder = 3
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Lancamentos'
          object Bevel1: TBevel
            Left = 16
            Top = 312
            Width = 713
            Height = 3
            Shape = bsTopLine
          end
          object Total: TLabel
            Left = 494
            Top = 134
            Width = 163
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total de Contratos gerados: '
          end
          object Label15: TLabel
            Left = 461
            Top = 286
            Width = 193
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total de Contratos NÃO gerados: '
          end
          object btnVoltar: TfcShapeBtn
            Left = 640
            Top = 328
            Width = 89
            Height = 29
            Caption = 'Voltar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
              BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
              BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
              BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
          end
          object memResult: TMemo
            Left = 16
            Top = 34
            Width = 713
            Height = 95
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 2
          end
          object Panel3: TPanel
            Left = 16
            Top = 8
            Width = 713
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos Gerados'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object memErro: TMemo
            Left = 16
            Top = 186
            Width = 713
            Height = 95
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 4
          end
          object Panel2: TPanel
            Left = 16
            Top = 160
            Width = 713
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos NÃO Gerados'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object edtNumResult: TRealEdit
            Left = 656
            Top = 130
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object edtNumErro: TRealEdit
            Left = 656
            Top = 283
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 738
    Visible = False
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 340
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 516
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 541
        Width = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 510
        Visible = False
      end
      object sbtnCancelar: TToolbarButton97
        Left = 255
        Top = 0
        Width = 85
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
        OnClick = sbtnCancelarClick
      end
      object sbtnImprimir: TToolbarButton97
        Left = 425
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
      end
    end
    object chkTRAVARDATAS: TCheckBox
      Left = 568
      Top = 38
      Width = 201
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
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 1010
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 29
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
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 452
        Enabled = False
        Visible = False
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
    Left = 664
    Top = 0
  end
  inherited qry: TwwQuery [6]
    SQL.Strings = (
      'SELECT'
      '   DECODE(INS.FLGSITUACAO, '#39'A'#39', '#39'Ativa'#39') AS DESCSITINSCRICAO,'
      '   PPP.INSCRICAONUMERO,'
      ''
      '   SIT.IDSITPART,'
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SIT.FLGINTERNO,'
      ''
      '   PLV.NOME AS PLANO,'
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
      
        '   INS.IDINSCRICAOEMPTMO, INS.IDTIPOCONTREMPTMO, INS.IDPESSOA   ' +
        ' , INS.IDPLANOPREV ,'
      
        '   INS.IDPATRO          , INS.VLRSOLIC         , INS.IDBENEF    ' +
        ' , INS.IDCBANCARIA ,'
      
        '   INS.FLGFORMAPAG      , INS.PORTFORMAPAG     , INS.CODFORMAPAG' +
        ' , INS.NUMPARCELAS ,'
      
        '   INS.FLGFORMAREC      , INS.PORTFORMAREC     , INS.FLGPENDENTE' +
        ' , INS.FLGSITUACAO ,'
      
        '   INS.DATAINSC         , INS.DATACANCINSC     , INS.FLGSUSPENSA' +
        'OAUTO,'
      
        '   INS.VLRSALBASE       , INS.VLRMARGEM        , INS.VLRMAXPERMI' +
        'T, INS.VLRPARCELAMES,'
      
        '   INS.VLRPARCATRASO    , INS.MOECODIGO        , INS.DATAVALIDAD' +
        'E,         '
      ''
      '   INS.FLGALTSALARIO, INS.FLGALTMARGEM, INS.FLGALTVALMAX'
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
      '   PLANPREV        PLV'
      'WHERE'
      '       INS.IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO'
      '   AND TEM.IDEMPRESAPROP     =:PIDEMPRESAPROP'
      '   AND PPP.FLGDESATIVADO     = 0'
      '   AND INS.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND PLV.IDPLANOPREV       = PPP.IDPLANOPREV'
      '   AND INS.IDPATRO           = JUR.IDPESSOA'
      '   AND INS.IDPESSOA          = ELP.IDPESSOA'
      '   AND INS.IDPATRO           = ELP.IDPESSJUR'
      '   AND INS.IDPESSOA          = TIT.IDPESSOA'
      '   AND INS.IDBENEF           = BEN.IDPESSOA'
      '   AND INS.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND INS.IDPESSOA          = DEP.IDTITULAR'
      ' ')
    Left = 632
    Top = 0
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
    object qryDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update INSCRICAOEMPTMO'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO,'
      '  VLRSOLIC = :VLRSOLIC,'
      '  IDBENEF = :IDBENEF,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  FLGFORMAPAG = :FLGFORMAPAG,'
      '  PORTFORMAPAG = :PORTFORMAPAG,'
      '  CODFORMAPAG = :CODFORMAPAG,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  FLGFORMAREC = :FLGFORMAREC,'
      '  PORTFORMAREC = :PORTFORMAREC,'
      '  FLGPENDENTE = :FLGPENDENTE,'
      '  FLGSITUACAO = :FLGSITUACAO,'
      '  DATAINSC = :DATAINSC,'
      '  DATACANCINSC = :DATACANCINSC,'
      '  FLGSUSPENSAOAUTO = :FLGSUSPENSAOAUTO,'
      '  VLRSALBASE = :VLRSALBASE,'
      '  VLRMARGEM = :VLRMARGEM,'
      '  VLRMAXPERMIT = :VLRMAXPERMIT,'
      '  VLRPARCELAMES = :VLRPARCELAMES,'
      '  VLRPARCATRASO = :VLRPARCATRASO,'
      '  MOECODIGO = :MOECODIGO,'
      '  FLGALTSALARIO = :FLGALTSALARIO,'
      '  FLGALTMARGEM = :FLGALTMARGEM,'
      '  FLGALTVALMAX = :FLGALTVALMAX'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO')
    InsertSQL.Strings = (
      'insert into INSCRICAOEMPTMO'
      
        '  (IDINSCRICAOEMPTMO, IDTIPOCONTREMPTMO, IDPESSOA, IDPLANOPREV, ' +
        'IDPATRO, '
      
        '   VLRSOLIC, IDBENEF, IDCBANCARIA, FLGFORMAPAG, PORTFORMAPAG, CO' +
        'DFORMAPAG, '
      
        '   NUMPARCELAS, FLGFORMAREC, PORTFORMAREC, FLGPENDENTE, FLGSITUA' +
        'CAO, DATAINSC, '
      
        '   DATACANCINSC, FLGSUSPENSAOAUTO, VLRSALBASE, VLRMARGEM, VLRMAX' +
        'PERMIT, '
      
        '   VLRPARCELAMES, VLRPARCATRASO, MOECODIGO, FLGALTSALARIO, FLGAL' +
        'TMARGEM, '
      '   FLGALTVALMAX)'
      'values'
      
        '  (:IDINSCRICAOEMPTMO, :IDTIPOCONTREMPTMO, :IDPESSOA, :IDPLANOPR' +
        'EV, :IDPATRO, '
      
        '   :VLRSOLIC, :IDBENEF, :IDCBANCARIA, :FLGFORMAPAG, :PORTFORMAPA' +
        'G, :CODFORMAPAG, '
      
        '   :NUMPARCELAS, :FLGFORMAREC, :PORTFORMAREC, :FLGPENDENTE, :FLG' +
        'SITUACAO, '
      
        '   :DATAINSC, :DATACANCINSC, :FLGSUSPENSAOAUTO, :VLRSALBASE, :VL' +
        'RMARGEM, '
      
        '   :VLRMAXPERMIT, :VLRPARCELAMES, :VLRPARCATRASO, :MOECODIGO, :F' +
        'LGALTSALARIO, '
      '   :FLGALTMARGEM, :FLGALTVALMAX)')
    DeleteSQL.Strings = (
      'delete from INSCRICAOEMPTMO'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO')
    Left = 600
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator [8]
    Left = 985
    Top = 5
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Items'
        0))
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
      'INS.DATAINSC          AS DATA_INSCRICAO')
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
      'Data Inscrição')
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
      'PPP.SEQPROPOSTA         = '#39'1'#39
      'PPP.FLGDESATIVADO       = 0'
      'INS.FLGSITUACAO         = '#39'A'#39
      'INS.IDPESSOA            = PP.IDPESSOA'
      'INS.IDBENEF             = PB.IDPESSOA(+)'
      'INS.IDPATRO             = PA.IDPESSOA'
      'INS.IDPATRO             = PPP.IDPESSJUR'
      'INS.IDPLANOPREV         = PPP.IDPLANOPREV'
      'INS.IDPLANOPREV         = PL.IDPLANOPREV'
      'PPP.IDPLANOPREV         = PL.IDPLANOPREV'
      'INS.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'
      'TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO'
      'EL.IDPESSJUR            = INS.IDPATRO'
      'EL.IDPESSOA             = INS.IDPESSOA'
      'INS.IDPATRO             = PPP.IDPESSJUR'
      'INS.IDPESSOA            = PPP.IDPESSOA'
      'PPP.IDSITPART           = ST.IDSITPART')
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
      'dd/mm/yyyy')
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
      '10')
    Left = 734
    Top = 172
  end
  inherited ImlPadrao: TImageList
    Left = 989
    Top = 53
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 720
    Top = 0
  end
  object dsBanco: TDataSource
    DataSet = dtmLookEmptmo.qryLookDadosBancarios
    Left = 126
    Top = 459
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TIP.IDTIPOCONTREMPTMO, TIP.TCEDESCRICAO  , TIP.IDTIPOEMPTMO  ' +
        ','
      
        '   TIP.IDREGRAJURCONC   , TIP.IDREGRAELEG   , TIP.IDREGRALIMITES' +
        ','
      
        '   TIP.IDREGRAPRAZOSCONC, TIP.IDREGRAMARGEM , TIP.IDREGRARESERVA' +
        ','
      
        '   TIP.FLGOBRIGBENEF,     TIP.IDREGRASALBAS , TIP.MOECODIGO, TIP' +
        '.FLGCONCESSAOZERO,'
      
        '   TEM.DESCTIPOEMPTMO   , TEM.TEPMAXCONTRATO, TIP.TCEMINRENOVA, ' +
        'TIP.IDREGRADATACRED,'
      '   TIP.TCEDIASTOLERAINSC'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO TEM'
      ''
      'WHERE'
      '       ( TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO )'
      '   AND ( TEM.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( TIP.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO )'
      '   AND ( TIP.FLGSITUACAO = '#39'A'#39' )'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 315
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoContratoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAJURCONC'
    end
    object qryTipoContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAELEG'
    end
    object qryTipoContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRALIMITES'
    end
    object qryTipoContratoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOSCONC'
    end
    object qryTipoContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAMARGEM'
    end
    object qryTipoContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRARESERVA'
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoTEPMAXCONTRATO: TFloatField
      FieldName = 'TEPMAXCONTRATO'
    end
    object qryTipoContratoFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.FLGOBRIGBENEF'
    end
    object qryTipoContratoIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
    end
    object qryTipoContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryTipoContratoFLGCONCESSAOZERO: TFloatField
      FieldName = 'FLGCONCESSAOZERO'
    end
    object qryTipoContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryTipoContratoIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
    end
    object qryTipoContratoTCEDIASTOLERAINSC: TFloatField
      FieldName = 'TCEDIASTOLERAINSC'
    end
  end
  object qryContratosAnteriores: TwwQuery
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
      '   CON.DATAPRIMPARC, TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      '   SLD.HMESALDODEV,'
      '   NVL(PAR.NUMPARCPAGAS, 0) AS NUMPARCPAGAS,'
      '   0 AS VLRATUAL,'
      '   NVL(VAL.VLRTOTAL, 0) AS VLREMABERTO,'
      '   ATU.ULT_PARC,'
      '   SIT.IDSITPART'
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   MOEDA           MOE,'
      '   TIPOCONTREMPTMO TIP,'
      '   SITPART         SIT,'
      '   PARTPREVPLAN    PPP,'
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
      #9#9#9'SUM(H.HMEVLRPREVISTO) - SUM(NVL(H.HMEVLREFETIVO, 0)) AS TOTAL'
      #9#9'FROM'
      #9#9#9'HISTMOVEMPTMO H,'
      '         CONTRATOEMPTMO C'
      '      WHERE'
      '             ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 )'
      '         AND ( C.IDPESSOA         =:PIDPESSOA )'
      '         AND ( C.IDBENEF          =:PIDBENEF )'
      '         AND ( C.FLGSITUACAO      IN ('#39'A'#39', '#39'E'#39', '#39'J'#39', '#39'K'#39') )'
      '         AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )'
      #9#9'GROUP BY'
      #9#9#9'H.IDCONTRATOEMPTMO, H.HMEPARCELA'
      #9#9'HAVING'
      
        '             ( SUM(H.HMEVLRPREVISTO) - SUM(NVL(H.HMEVLREFETIVO, ' +
        '0)) = 0 )'
      #9#9#9'AND ( HMEPARCELA <> 0 )'
      #9#9') PAG'
      '   WHERE'
      '          ( C.IDPESSOA           =:PIDPESSOA )'
      '      AND ( C.IDBENEF            =:PIDBENEF )'
      '      AND ( C.FLGSITUACAO        IN ('#39'A'#39', '#39'E'#39', '#39'J'#39', '#39'K'#39') )'
      '      AND ( C.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) )'
      '   GROUP BY'
      '      C.IDCONTRATOEMPTMO'
      '   ) PAR,'
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
      #9'('
      #9'SELECT'
      #9#9'SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO'
      #9'FROM'
      #9#9'HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      #9'WHERE'
      '          ( C.IDPESSOA           =:PIDPESSOA )'
      '      AND ( C.IDBENEF            =:PIDBENEF )'
      '      AND ( H.HMEDATAVENCTO     <=:PHMEDATA )'
      '      AND ( H.FLGBAIXADO         IS NOT NULL )'
      
        '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) ' +
        ')'
      
        '      AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) ' +
        ')'
      
        '      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0' +
        ') )'
      #9#9'AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      H.IDCONTRATOEMPTMO'
      #9') VAL'
      'WHERE'
      '       ( CON.IDPESSOA            =:PIDPESSOA )'
      '   AND ( CON.IDBENEF             =:PIDBENEF )'
      '   AND ( TIP.IDTIPOEMPTMO        =:PIDTIPOEMPTMO )'
      '   AND ( CON.FLGSITUACAO         IN ('#39'A'#39', '#39'E'#39', '#39'J'#39', '#39'K'#39') )'
      '   AND ( VAL.VLRTOTAL > 0        OR SLD.HMESALDODEV > 0 )'
      '   AND ( PPP.IDPESSOA            = CON.IDPESSOA )'
      '   AND ( PPP.IDPLANOPREV         = CON.IDPLANOPREV )'
      '   AND ( SIT.IDSITPART           = PPP.IDSITPART )'
      '   AND ( CON.IDCONTRATOEMPTMO    = PAR.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = SLD.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = ATU.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO )'
      '   AND ( CON.MOECODIGO           = MOE.MOECODIGO(+) )')
    UpdateObject = updContratosAnteriores
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 512
    Top = 448
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
      DisplayLabel = 'Vlr Quitação'
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
    object qryContratosAnterioresIDSITPART: TFloatField
      FieldName = 'IDSITPART'
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
  end
  object dtsContratoAnteriores: TDataSource
    DataSet = qryContratosAnteriores
    Left = 512
    Top = 460
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
    Left = 512
    Top = 472
  end
  object dtsItensConcessao: TDataSource
    DataSet = qryItensConcessao
    Left = 200
    Top = 459
  end
  object qryItensConcessao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   0 AS IDITEMEMPTMO,'#39'NOME'#39' AS ITEM, 0 AS VALOR'
      'FROM '
      'DUAL')
    ValidateWithMask = True
    Left = 200
    Top = 471
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
    Left = 605
    Top = 443
  end
  object qryAvalista: TwwQuery
    CachedUpdates = True
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
    Left = 605
    Top = 455
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
    Left = 605
    Top = 467
  end
  object qryBenefSeguro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDINSCRICAOEMPTMO,'
      '       BF.IDBENEFSEGURO,'
      '       BF.PERCINDENIZACAO,'
      '       P.NOME'
      'FROM   CONTRATOXBENEFSEG BF, PESSOA P, BENEFSEGURO B'
      'WHERE  B.IDBENEFSEGURO      = P.IDPESSOA'
      'AND    BF.IDBENEFSEGURO     = B.IDBENEFSEGURO'
      'AND    BF.IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updBenefSeguro
    ValidateWithMask = True
    Left = 298
    Top = 447
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
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBenefSeguroPERCINDENIZACAO: TFloatField
      DisplayLabel = '% Indenização'
      DisplayWidth = 11
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
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
  end
  object dsBenefSeguro: TDataSource
    DataSet = qryBenefSeguro
    Left = 298
    Top = 459
  end
  object updBenefSeguro: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXBENEFSEG'
      'set'
      '  IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO,'
      '  IDBENEFSEGURO = :IDBENEFSEGURO,'
      '  PERCINDENIZACAO = :PERCINDENIZACAO'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    InsertSQL.Strings = (
      'insert into CONTRATOXBENEFSEG'
      '  (IDINSCRICAOEMPTMO, IDBENEFSEGURO, PERCINDENIZACAO)'
      'values'
      '  (:IDINSCRICAOEMPTMO, :IDBENEFSEGURO, :PERCINDENIZACAO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXBENEFSEG'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    Left = 298
    Top = 471
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
    Left = 393
    Top = 459
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
      'SELECT'
      '    HME.IDHISTMOVEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '    ( HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      'AND ( HME.HMETIPOMOV       <> 5 )'
      'AND ( HME.FLGBAIXADO       IS NOT NULL )'
      'AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      'AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      'AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      'AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) )'
      'AND ( (HME.FLGSUSPENSAO    IS NULL) OR (HME.FLGSUSPENSAO = 0) )'
      
        'AND ( (RTRIM(LTRIM(HME.HMEANOCOBRANCA))) || (RTRIM(LTRIM(HME.HME' +
        'MESCOBRANCA))) ) <:PANOMESCOBRANCA')
    ValidateWithMask = True
    Left = 693
    Top = 451
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
    Left = 493
    Top = 419
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
  object qryArquivoLido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    0    AS IDINSCRICAOEMPTMO,'
      '    '#39'1234567890123456789012345678901234567890'#39' AS NOME,'
      '    0    AS OPCAO'
      'FROM'
      '    DUAL'
      'WHERE 1 = 2'
      ''
      ' '
      ' ')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 257
    Top = 114
    object qryArquivoLidoIDINSCRICAOEMPTMO: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 13
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryArquivoLidoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 73
      FieldName = 'NOME'
      FixedChar = True
      Size = 40
    end
    object qryArquivoLidoOPCAO: TFloatField
      DisplayLabel = 'Opção'
      DisplayWidth = 10
      FieldName = 'OPCAO'
    end
  end
  object dsArquivoLido: TDataSource
    DataSet = qryArquivoLido
    Left = 193
    Top = 138
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquvos de texto|*.txt|Todos os arquivos|*.*'
    Title = 'Arquivo a ser lido'
    Left = 105
    Top = 234
  end
  object qryInscricaoLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    ILT.*,'
      '    PES.NOME'
      'FROM'
      '    INSCRICAOLOTE ILT,'
      '    INSCRICAOEMPTMO INS,'
      '    PESSOA PES'
      'WHERE'
      '    ILT.IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO'
      'AND INS.IDINSCRICAOEMPTMO = ILT.IDINSCRICAOEMPTMO'
      'AND PES.IDPESSOA          = INS.IDBENEF'
      ''
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryInscricaoLoteIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IDINSCRICAOEMPTMO'
    end
    object qryInscricaoLoteVALORLIQUIDO1: TFloatField
      FieldName = 'VALORLIQUIDO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO1'
    end
    object qryInscricaoLoteVALORLIQUIDO2: TFloatField
      FieldName = 'VALORLIQUIDO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO2'
    end
    object qryInscricaoLoteVALORLIQUIDO3: TFloatField
      FieldName = 'VALORLIQUIDO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORLIQUIDO3'
    end
    object qryInscricaoLotePRESTACAO1: TFloatField
      FieldName = 'PRESTACAO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO1'
    end
    object qryInscricaoLotePRESTACAO2: TFloatField
      FieldName = 'PRESTACAO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO2'
    end
    object qryInscricaoLotePRESTACAO3: TFloatField
      FieldName = 'PRESTACAO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.PRESTACAO3'
    end
    object qryInscricaoLoteCQM1: TFloatField
      FieldName = 'CQM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM1'
    end
    object qryInscricaoLoteCQM2: TFloatField
      FieldName = 'CQM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM2'
    end
    object qryInscricaoLoteCQM3: TFloatField
      FieldName = 'CQM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CQM3'
    end
    object qryInscricaoLoteIOF1: TFloatField
      FieldName = 'IOF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF1'
    end
    object qryInscricaoLoteIOF2: TFloatField
      FieldName = 'IOF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF2'
    end
    object qryInscricaoLoteIOF3: TFloatField
      FieldName = 'IOF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.IOF3'
    end
    object qryInscricaoLoteCPMF1: TFloatField
      FieldName = 'CPMF1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF1'
    end
    object qryInscricaoLoteCPMF2: TFloatField
      FieldName = 'CPMF2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF2'
    end
    object qryInscricaoLoteCPMF3: TFloatField
      FieldName = 'CPMF3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.CPMF3'
    end
    object qryInscricaoLoteTXADM1: TFloatField
      FieldName = 'TXADM1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM1'
    end
    object qryInscricaoLoteTXADM2: TFloatField
      FieldName = 'TXADM2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM2'
    end
    object qryInscricaoLoteTXADM3: TFloatField
      FieldName = 'TXADM3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TXADM3'
    end
    object qryInscricaoLoteVALORBRUTO1: TFloatField
      FieldName = 'VALORBRUTO1'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO1'
    end
    object qryInscricaoLoteVALORBRUTO2: TFloatField
      FieldName = 'VALORBRUTO2'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO2'
    end
    object qryInscricaoLoteVALORBRUTO3: TFloatField
      FieldName = 'VALORBRUTO3'
      Origin = 'BASEDADOS.INSCRICAOLOTE.VALORBRUTO3'
    end
    object qryInscricaoLoteOPCAO: TFloatField
      FieldName = 'OPCAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.OPCAO'
    end
    object qryInscricaoLoteTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TRGDTINCLUSAO'
    end
    object qryInscricaoLoteTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.INSCRICAOLOTE.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryInscricaoLoteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDINSCRICAOEMPTMO, NOME, OPCAO)'
      'values'
      '  (:IDINSCRICAOEMPTMO, :NOME, :OPCAO)')
    Left = 281
    Top = 177
  end
end
