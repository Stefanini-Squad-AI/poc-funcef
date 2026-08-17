inherited frmCadParam: TfrmCadParam
  Left = 159
  Top = 105
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 425
  ClientWidth = 491
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 491
    Height = 339
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 4
      Top = 4
      Width = 483
      Height = 331
      ActivePage = tbshDataProc
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbshDataProc: TTabSheet
        Caption = 'Datas de Processamento'
        object gbxNormal: TGroupBox
          Left = 21
          Top = 43
          Width = 185
          Height = 75
          Caption = 'Normal'
          TabOrder = 0
          object Label10: TLabel
            Left = 9
            Top = 21
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label11: TLabel
            Left = 9
            Top = 45
            Width = 28
            Height = 13
            Caption = 'Final'
          end
          object dbedNorIni: TCMDateTimePicker
            Left = 72
            Top = 18
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'NORMALINI'
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
          end
          object dbedNorFim: TCMDateTimePicker
            Left = 72
            Top = 45
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'NORMALFIM'
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
            TabOrder = 1
          end
        end
        object gbxFerias: TGroupBox
          Left = 267
          Top = 43
          Width = 185
          Height = 75
          Caption = 'Férias'
          TabOrder = 1
          object Label12: TLabel
            Left = 9
            Top = 21
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label13: TLabel
            Left = 9
            Top = 45
            Width = 28
            Height = 13
            Caption = 'Final'
          end
          object dbedFerIni: TCMDateTimePicker
            Left = 72
            Top = 18
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FERIASINI'
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
          end
          object dbedFerFim: TCMDateTimePicker
            Left = 72
            Top = 45
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'FERIASFIM'
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
            TabOrder = 1
          end
        end
        object gbx13Sal: TGroupBox
          Left = 138
          Top = 173
          Width = 185
          Height = 75
          Caption = 'Décimo Terceiro'
          TabOrder = 2
          object Label14: TLabel
            Left = 9
            Top = 21
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label15: TLabel
            Left = 9
            Top = 45
            Width = 28
            Height = 13
            Caption = 'Final'
          end
          object dbed13Ini: TCMDateTimePicker
            Left = 72
            Top = 18
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PGTO13INI'
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
          end
          object dbed13Fim: TCMDateTimePicker
            Left = 72
            Top = 45
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PGTO13FIM'
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
            TabOrder = 1
          end
        end
      end
      object tbshMotivoRubricas: TTabSheet
        Caption = 'Motivo e Rubricas'
        object Label16: TLabel
          Left = 16
          Top = 64
          Width = 107
          Height = 13
          Caption = 'Faltas ao Trabalho'
        end
        object LabelFolhaNormal: TLabel
          Left = 16
          Top = 26
          Width = 117
          Height = 13
          Caption = 'Motivo Folha Normal'
        end
        object dblcMotivo: TwwDBLookupCombo
          Left = 157
          Top = 23
          Width = 300
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          DataField = 'IDMOTIVO'
          DataSource = ds
          LookupTable = qryMotivo
          LookupField = 'IDMOTIVO'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 157
          Top = 61
          Width = 300
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'130'#9'DESCRICAO')
          DataField = 'IDRUBFALTA'
          DataSource = ds
          LookupTable = qryRubrica
          LookupField = 'IDPROVENTO'
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 16
          Top = 99
          Width = 442
          Height = 169
          Hint = 'Dois Cargos Para a Mesma Pessoa, Tipo Cargo e Função ?'
          Caption = 
            'Opção Padrão para as Prévias de Folha (o que vem na abertura da ' +
            'tela)'
          DataField = 'LIMADM'
          DataSource = ds
          Items.Strings = (
            'Apaga Tudo (todas as prévias de todas as pessoas)'
            'Apaga Tipo de Folha (todas as prévias do tipo selecionado)'
            'Apaga Pessoas (todas as prévias das pessoas selecionadas)'
            'Apaga Tipos/Pessoas (prévias do tipo e pessoas selecionados)'
            'Deixa Tudo (não apaga prévia nenhuma)')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
      end
      object tbshPolitSal: TTabSheet
        Caption = 'Política Salarial'
        object Label17: TLabel
          Left = 27
          Top = 23
          Width = 149
          Height = 13
          Caption = 'Quant. de Steps por Faixa'
        end
        object Label1: TLabel
          Left = 27
          Top = 47
          Width = 94
          Height = 13
          Caption = 'Título do Step 1'
        end
        object Label2: TLabel
          Left = 27
          Top = 74
          Width = 94
          Height = 13
          Caption = 'Título do Step 2'
        end
        object Label3: TLabel
          Left = 27
          Top = 98
          Width = 94
          Height = 13
          Caption = 'Título do Step 3'
        end
        object Label4: TLabel
          Left = 27
          Top = 122
          Width = 94
          Height = 13
          Caption = 'Título do Step 4'
        end
        object Label5: TLabel
          Left = 27
          Top = 149
          Width = 94
          Height = 13
          Caption = 'Título do Step 5'
        end
        object Label6: TLabel
          Left = 27
          Top = 173
          Width = 94
          Height = 13
          Caption = 'Título do Step 6'
        end
        object Label7: TLabel
          Left = 27
          Top = 197
          Width = 94
          Height = 13
          Caption = 'Título do Step 7'
        end
        object Label8: TLabel
          Left = 27
          Top = 224
          Width = 94
          Height = 13
          Caption = 'Título do Step 8'
        end
        object Label9: TLabel
          Left = 27
          Top = 248
          Width = 94
          Height = 13
          Caption = 'Título do Step 9'
        end
        object dbspeQtdSt: TwwDBSpinEdit
          Left = 185
          Top = 18
          Width = 43
          Height = 21
          Increment = 1
          MaxValue = 9
          MinValue = 1
          DataField = 'NUMSTEPS'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          OnChange = dbspeQtdStChange
        end
        object dbedSt1: TDBEdit
          Left = 129
          Top = 44
          Width = 100
          Height = 21
          DataField = 'TITSTEP1'
          DataSource = ds
          TabOrder = 1
        end
        object dbedSt2: TDBEdit
          Left = 129
          Top = 71
          Width = 100
          Height = 21
          DataField = 'TITSTEP2'
          DataSource = ds
          TabOrder = 2
        end
        object dbedSt3: TDBEdit
          Left = 129
          Top = 95
          Width = 100
          Height = 21
          DataField = 'TITSTEP3'
          DataSource = ds
          TabOrder = 3
        end
        object dbedSt4: TDBEdit
          Left = 129
          Top = 119
          Width = 100
          Height = 21
          DataField = 'TITSTEP4'
          DataSource = ds
          TabOrder = 4
        end
        object dbedSt5: TDBEdit
          Left = 129
          Top = 146
          Width = 100
          Height = 21
          DataField = 'TITSTEP5'
          DataSource = ds
          TabOrder = 5
        end
        object dbedSt6: TDBEdit
          Left = 127
          Top = 170
          Width = 100
          Height = 21
          DataField = 'TITSTEP6'
          DataSource = ds
          TabOrder = 6
        end
        object dbedSt7: TDBEdit
          Left = 129
          Top = 194
          Width = 100
          Height = 21
          DataField = 'TITSTEP7'
          DataSource = ds
          TabOrder = 7
        end
        object dbedSt8: TDBEdit
          Left = 129
          Top = 221
          Width = 100
          Height = 21
          DataField = 'TITSTEP8'
          DataSource = ds
          TabOrder = 8
        end
        object dbedSt9: TDBEdit
          Left = 129
          Top = 245
          Width = 100
          Height = 21
          DataField = 'TITSTEP9'
          DataSource = ds
          TabOrder = 9
        end
        object gbxDoisCargos: TDBRadioGroup
          Left = 285
          Top = 64
          Width = 163
          Height = 67
          Hint = 'Dois Cargos Para a Mesma Pessoa, Tipo Cargo e Função ?'
          Caption = 'Dois Cargos Atuais?'
          DataField = 'FLGDOISCARGOS'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Values.Strings = (
            '1'
            '0')
        end
        object dbrgNivelIndiv: TDBRadioGroup
          Left = 285
          Top = 154
          Width = 163
          Height = 67
          Hint = 'Define o Nível por Pessoa Alternativamente ao Cargo ?'
          Caption = 'Nível Salarial Individual?'
          DataField = 'FLGNIVELINDIV'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Values.Strings = (
            '1'
            '0')
        end
      end
      object tbshUsoPessoal: TTabSheet
        Caption = 'UsoPessoal'
        ImageIndex = 3
        object dbrgUsoPessoal: TDBRadioGroup
          Left = 8
          Top = 7
          Width = 457
          Height = 88
          Caption = 'A Tela de Uso Pessoal Será Chamada'
          DataField = 'FLGSENHAUSOPES'
          DataSource = ds
          Items.Strings = (
            'Apenas Pela Senha do Usuário (Que é Empregado)'
            'Apenas Pela Informação de Alguns Dados Pessoais'
            
              'Pela Senha do Usuário Em 1ª Instância, Senão Pelos Dados Pessoai' +
              's'
            'Não Exibe a Tela')
          TabOrder = 0
          Values.Strings = (
            '1'
            '0'
            '3'
            '2')
        end
        object gbxAutor: TGroupBox
          Left = 8
          Top = 99
          Width = 457
          Height = 177
          Caption = 'Na Tela de Uso Pessoal, além de consultar, a pessoa poderá'
          TabOrder = 1
          object Label18: TLabel
            Left = 24
            Top = 17
            Width = 36
            Height = 13
            Caption = 'Inserir'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label19: TLabel
            Left = 72
            Top = 17
            Width = 38
            Height = 13
            Caption = 'Alterar'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 125
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Excluir'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label21: TLabel
            Left = 184
            Top = 33
            Width = 109
            Height = 13
            Caption = 'Seu(s) Endereço(s)'
          end
          object Label22: TLabel
            Left = 184
            Top = 53
            Width = 105
            Height = 13
            Caption = 'Seu(s) Telefone(s)'
          end
          object Label23: TLabel
            Left = 184
            Top = 73
            Width = 122
            Height = 13
            Caption = 'Pessoa(s) de Contato'
          end
          object Label24: TLabel
            Left = 184
            Top = 93
            Width = 190
            Height = 13
            Caption = 'Cursos Realizados por Sua Conta'
          end
          object Label25: TLabel
            Left = 184
            Top = 113
            Width = 163
            Height = 13
            Caption = 'Programação de Suas Férias'
          end
          object Label26: TLabel
            Left = 184
            Top = 153
            Width = 248
            Height = 13
            Caption = 'Sua Conta Bancária para Crédito do Salário'
          end
          object Label27: TLabel
            Left = 184
            Top = 133
            Width = 149
            Height = 13
            Caption = 'Seus Empregos Anteriores'
          end
          object dbcbxInsEnder: TDBCheckBox
            Left = 37
            Top = 33
            Width = 13
            Height = 17
            DataField = 'FLGENDERINS'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltEnder: TDBCheckBox
            Left = 84
            Top = 33
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGENDERALT'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcEnder: TDBCheckBox
            Left = 135
            Top = 33
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGENDEREXC'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsTelef: TDBCheckBox
            Left = 37
            Top = 53
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGTELEFINS'
            DataSource = ds
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltTelef: TDBCheckBox
            Left = 84
            Top = 53
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGTELEFALT'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcTelef: TDBCheckBox
            Left = 135
            Top = 53
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGTELEFEXC'
            DataSource = ds
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsContt: TDBCheckBox
            Left = 37
            Top = 73
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGCONTTINS'
            DataSource = ds
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltContt: TDBCheckBox
            Left = 84
            Top = 73
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCONTTALT'
            DataSource = ds
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcContt: TDBCheckBox
            Left = 135
            Top = 73
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGCONTTEXC'
            DataSource = ds
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsCurso: TDBCheckBox
            Left = 37
            Top = 93
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGCURSOINS'
            DataSource = ds
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltCurso: TDBCheckBox
            Left = 84
            Top = 93
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCURSOALT'
            DataSource = ds
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcCurso: TDBCheckBox
            Left = 135
            Top = 93
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGCURSOEXC'
            DataSource = ds
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsFeria: TDBCheckBox
            Left = 37
            Top = 113
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGFERIAINS'
            DataSource = ds
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltFeria: TDBCheckBox
            Left = 84
            Top = 113
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGFERIAALT'
            DataSource = ds
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcFeria: TDBCheckBox
            Left = 135
            Top = 113
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGFERIAEXC'
            DataSource = ds
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgIns: TDBCheckBox
            Left = 37
            Top = 133
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGEMPRGINS'
            DataSource = ds
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgAlt: TDBCheckBox
            Left = 84
            Top = 133
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGEMPRGALT'
            DataSource = ds
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgExc: TDBCheckBox
            Left = 135
            Top = 133
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGEMPRGEXC'
            DataSource = ds
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltCtSal: TDBCheckBox
            Left = 84
            Top = 153
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCTSALALT'
            DataSource = ds
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Matrícula e Contratos'
        ImageIndex = 4
        object rgTipDurContr: TDBRadioGroup
          Left = 58
          Top = 214
          Width = 355
          Height = 40
          Caption = 'Tipo de Duração do Contrato de Trabalho'
          Columns = 4
          DataField = 'INDDURACAOCONTR'
          DataSource = ds
          Items.Strings = (
            'Dias'
            'Semanas'
            'Meses'
            'Anos')
          TabOrder = 0
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
        end
        object gbxTamMatric: TGroupBox
          Left = 143
          Top = 111
          Width = 185
          Height = 57
          Caption = 'Tamanho da Matrícula'
          TabOrder = 1
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 71
            Top = 22
            Width = 43
            Height = 21
            Increment = 1
            MaxValue = 9
            MinValue = 1
            DataField = 'TAMANHOMATRIC'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            OnChange = dbspeQtdStChange
          end
        end
        object dbrgNumeraMatric: TDBRadioGroup
          Left = 58
          Top = 27
          Width = 355
          Height = 40
          Caption = 'Deseja Numerar Matrícula Sequencial e Automaticamente?'
          Columns = 2
          DataField = 'FLGNUMERAMATRIC'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          Values.Strings = (
            '1'
            '0')
          OnChange = dbrgNumeraMatricChange
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 491
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 491
    inherited tb97Fundo: TToolbar97
      Left = 321
      DockPos = 435
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 154
      DockPos = 268
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * '
      'FROM  PARAMRH')
    Left = 290
    Top = 6
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 208
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMRH'
      'set'
      '  MOEDAPROCTRAB = :MOEDAPROCTRAB,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDRUBIRRF = :IDRUBIRRF,'
      '  MATRDIS = :MATRDIS,'
      '  LIMADM = :LIMADM,'
      '  LIMDEM = :LIMDEM,'
      '  LIMAFAST = :LIMAFAST,'
      '  LIMRETOR = :LIMRETOR,'
      '  NUMSTEPS = :NUMSTEPS,'
      '  TITSTEP1 = :TITSTEP1,'
      '  TITSTEP2 = :TITSTEP2,'
      '  TITSTEP3 = :TITSTEP3,'
      '  TITSTEP4 = :TITSTEP4,'
      '  TITSTEP5 = :TITSTEP5,'
      '  TITSTEP6 = :TITSTEP6,'
      '  TITSTEP7 = :TITSTEP7,'
      '  TITSTEP8 = :TITSTEP8,'
      '  TITSTEP9 = :TITSTEP9,'
      '  IDRUBFGTS = :IDRUBFGTS,'
      '  IDRUBINSS = :IDRUBINSS,'
      '  IDRUB13 = :IDRUB13,'
      '  IDRUBANTEC13 = :IDRUBANTEC13,'
      '  NORMALINI = :NORMALINI,'
      '  NORMALFIM = :NORMALFIM,'
      '  FERIASINI = :FERIASINI,'
      '  FERIASFIM = :FERIASFIM,'
      '  PGTO13INI = :PGTO13INI,'
      '  PGTO13FIM = :PGTO13FIM,'
      '  FLGDOISCARGOS = :FLGDOISCARGOS,'
      '  FLGNIVELINDIV = :FLGNIVELINDIV,'
      '  IDRUBFALTA = :IDRUBFALTA,'
      '  FLGINTEGRACONT = :FLGINTEGRACONT,'
      '  FLGINTEGRACAP = :FLGINTEGRACAP,'
      '  FLGCRIASUBCONTA = :FLGCRIASUBCONTA,'
      '  FLGSENHAUSOPES = :FLGSENHAUSOPES,'
      '  FLGENDERINS = :FLGENDERINS,'
      '  FLGENDERALT = :FLGENDERALT,'
      '  FLGENDEREXC = :FLGENDEREXC,'
      '  FLGTELEFINS = :FLGTELEFINS,'
      '  FLGTELEFALT = :FLGTELEFALT,'
      '  FLGTELEFEXC = :FLGTELEFEXC,'
      '  FLGCONTTINS = :FLGCONTTINS,'
      '  FLGCONTTALT = :FLGCONTTALT,'
      '  FLGCONTTEXC = :FLGCONTTEXC,'
      '  FLGCURSOINS = :FLGCURSOINS,'
      '  FLGCURSOALT = :FLGCURSOALT,'
      '  FLGCURSOEXC = :FLGCURSOEXC,'
      '  FLGFERIAINS = :FLGFERIAINS,'
      '  FLGFERIAALT = :FLGFERIAALT,'
      '  FLGFERIAEXC = :FLGFERIAEXC,'
      '  FLGEMPRGINS = :FLGEMPRGINS,'
      '  FLGEMPRGALT = :FLGEMPRGALT,'
      '  FLGEMPRGEXC = :FLGEMPRGEXC,'
      '  FLGCTSALALT = :FLGCTSALALT,'
      '  FLGLINHAINS = :FLGLINHAINS,'
      '  FLGLINHAALT = :FLGLINHAALT,'
      '  FLGLINHAEXC = :FLGLINHAEXC,'
      '  INDDURACAOCONTR = :INDDURACAOCONTR,'
      '  FLGNUMERAMATRIC = :FLGNUMERAMATRIC,'
      '  TAMANHOMATRIC = :TAMANHOMATRIC')
    InsertSQL.Strings = (
      'insert into PARAMRH'
      '  (MOEDAPROCTRAB, IDMOTIVO, IDRUBIRRF, MATRDIS, LIMADM, LIMDEM, '
      'LIMAFAST, '
      '   LIMRETOR, NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, '
      'TITSTEP5, '
      
        '   TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, IDRUBFGTS, IDRUBINSS,' +
        ' '
      'IDRUB13, '
      '   IDRUBANTEC13, NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, '
      'PGTO13INI, '
      '   PGTO13FIM, FLGDOISCARGOS, FLGNIVELINDIV, IDRUBFALTA, '
      'FLGINTEGRACONT, '
      '   FLGINTEGRACAP, FLGCRIASUBCONTA, FLGSENHAUSOPES, FLGENDERINS, '
      'FLGENDERALT, '
      
        '   FLGENDEREXC, FLGTELEFINS, FLGTELEFALT, FLGTELEFEXC, FLGCONTTI' +
        'NS, '
      'FLGCONTTALT, '
      '   FLGCONTTEXC, FLGCURSOINS, FLGCURSOALT, FLGCURSOEXC, '
      'FLGFERIAINS, FLGFERIAALT, '
      '   FLGFERIAEXC, FLGEMPRGINS, FLGEMPRGALT, FLGEMPRGEXC, '
      'FLGCTSALALT, FLGLINHAINS, '
      '   FLGLINHAALT, FLGLINHAEXC, INDDURACAOCONTR, FLGNUMERAMATRIC, '
      'TAMANHOMATRIC)'
      'values'
      
        '  (:MOEDAPROCTRAB, :IDMOTIVO, :IDRUBIRRF, :MATRDIS, :LIMADM, :LI' +
        'MDEM, '
      ':LIMAFAST, '
      
        '   :LIMRETOR, :NUMSTEPS, :TITSTEP1, :TITSTEP2, :TITSTEP3, :TITST' +
        'EP4, '
      ':TITSTEP5, '
      
        '   :TITSTEP6, :TITSTEP7, :TITSTEP8, :TITSTEP9, :IDRUBFGTS, :IDRU' +
        'BINSS, '
      '   :IDRUB13, :IDRUBANTEC13, :NORMALINI, :NORMALFIM, :FERIASINI, '
      ':FERIASFIM, '
      
        '   :PGTO13INI, :PGTO13FIM, :FLGDOISCARGOS, :FLGNIVELINDIV, :IDRU' +
        'BFALTA, '
      '   :FLGINTEGRACONT, :FLGINTEGRACAP, :FLGCRIASUBCONTA, '
      ':FLGSENHAUSOPES, '
      '   :FLGENDERINS, :FLGENDERALT, :FLGENDEREXC, :FLGTELEFINS, '
      ':FLGTELEFALT, '
      '   :FLGTELEFEXC, :FLGCONTTINS, :FLGCONTTALT, :FLGCONTTEXC, '
      ':FLGCURSOINS, '
      '   :FLGCURSOALT, :FLGCURSOEXC, :FLGFERIAINS, :FLGFERIAALT, '
      ':FLGFERIAEXC, '
      '   :FLGEMPRGINS, :FLGEMPRGALT, :FLGEMPRGEXC, :FLGCTSALALT, '
      ':FLGLINHAINS, '
      
        '   :FLGLINHAALT, :FLGLINHAEXC, :INDDURACAOCONTR, :FLGNUMERAMATRI' +
        'C, '
      ':TAMANHOMATRIC)')
    DeleteSQL.Strings = (
      'delete from PARAMRH')
    Left = 355
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 389
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 323
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 249
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 430
    Top = 2
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO = '#39'F'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 76
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PD.IDPROVENTO, RP.DESCRPROVDESC AS DESCRICAO'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA   = :IDPESSOA) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA)'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 133
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
