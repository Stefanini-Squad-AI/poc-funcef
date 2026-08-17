inherited frmMTUtilAjustaLancImplantacao: TfrmMTUtilAjustaLancImplantacao
  Left = 121
  Top = 96
  Caption = 'Lançamentos de Ajuste de Implantação'
  ClientHeight = 372
  ClientWidth = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 333
    object Label26: TLabel
      Left = 16
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Bem'
    end
    object lblPlaca: TLabel
      Left = 16
      Top = 72
      Width = 33
      Height = 13
      Caption = 'Placa'
    end
    object Label2: TLabel
      Left = 160
      Top = 72
      Width = 60
      Height = 13
      Caption = 'Data Base'
    end
    object Label271: TLabel
      Left = 304
      Top = 72
      Width = 83
      Height = 13
      Caption = 'Valor Residual'
    end
    object dbeDesBem: TwwDBRichEdit
      Left = 16
      Top = 24
      Width = 498
      Height = 41
      AutoURLDetect = False
      DataField = 'DESBEM'
      DataSource = dsSelBem
      PrintJobName = 'Delphi 5'
      TabOrder = 0
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
    object bbtnSelBem: TBitBtn
      Left = 515
      Top = 24
      Width = 21
      Height = 41
      TabOrder = 1
      OnClick = bbtnSelBemClick
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
    object dbePlaca: TwwDBEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      DataField = 'PLACA'
      DataSource = dsSelBem
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edDataBase: TCMDateTimePicker
      Left = 160
      Top = 88
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
      TabOrder = 3
      OnChange = edDataBaseChange
    end
    object pgctlValores: TPageControl
      Left = 1
      Top = 121
      Width = 556
      Height = 211
      ActivePage = TabBem
      Align = alBottom
      TabOrder = 4
      object TabBem: TTabSheet
        Caption = 'Aquisição'
        object gbxBem: TGroupBox
          Left = 8
          Top = 72
          Width = 521
          Height = 73
          Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
          Caption = ' Valores Ajustados '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object Label7: TLabel
            Left = 8
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Custo'
          end
          object Label9: TLabel
            Left = 264
            Top = 16
            Width = 112
            Height = 13
            Caption = 'Depreciação Acum.'
          end
          object Label8: TLabel
            Left = 136
            Top = 16
            Width = 63
            Height = 13
            Caption = 'C.M. Custo'
          end
          object Label10: TLabel
            Left = 392
            Top = 16
            Width = 103
            Height = 13
            Caption = 'C.M. Depreciação'
          end
          object edValOrg: TRealEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edCmDep: TRealEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edCmBem: TRealEdit
            Left = 136
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edDepLanc: TRealEdit
            Left = 264
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 4
          Width = 521
          Height = 65
          Caption = ' Valores Atuais '
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Custo'
          end
          object Label3: TLabel
            Left = 136
            Top = 16
            Width = 63
            Height = 13
            Caption = 'C.M. Custo'
          end
          object Label4: TLabel
            Left = 264
            Top = 16
            Width = 112
            Height = 13
            Caption = 'Depreciação Acum.'
          end
          object Label5: TLabel
            Left = 392
            Top = 16
            Width = 103
            Height = 13
            Caption = 'C.M. Depreciação'
          end
          object DBRealEdit1: TDBRealEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORG'
            DataSource = dsSelBem
          end
          object DBRealEdit2: TDBRealEdit
            Left = 136
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMBEM'
            DataSource = dsSelBem
          end
          object DBRealEdit3: TDBRealEdit
            Left = 264
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'DEPLANC'
            DataSource = dsSelBem
          end
          object DBRealEdit4: TDBRealEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMDEP'
            DataSource = dsSelBem
          end
        end
      end
      object TabReavaliacao: TTabSheet
        Caption = 'Reavaliações'
        Enabled = False
        ImageIndex = 1
        object pnlDetReaval: TPanel
          Left = 0
          Top = 0
          Width = 548
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 8
            Top = 72
            Width = 521
            Height = 73
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Caption = ' Valores Ajustados '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label14: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label15: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label16: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label17: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object edReavValOrg: TRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edReavCmBem: TRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edReavDepLanc: TRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edReavCmDep: TRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
          end
          object bbtnOkReavaliacao: TBitBtn
            Left = 328
            Top = 144
            Width = 90
            Height = 33
            TabOrder = 1
            OnClick = bbtnOkReavaliacaoClick
            Kind = bkOK
            Spacing = 2
          end
          object bbtnCancReavaliacao: TBitBtn
            Left = 424
            Top = 144
            Width = 90
            Height = 33
            Caption = 'Cancelar'
            TabOrder = 2
            OnClick = bbtnCancReavaliacaoClick
            Kind = bkCancel
            Spacing = 2
          end
          object GroupBox4: TGroupBox
            Left = 8
            Top = 4
            Width = 537
            Height = 65
            Caption = ' Valores Atuais '
            TabOrder = 3
            object Label6: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label11: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label12: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label13: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object DBRealEdit5: TDBRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORG'
              DataSource = dsReavaliacao
            end
            object DBRealEdit6: TDBRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CMBEM'
              DataSource = dsReavaliacao
            end
            object DBRealEdit7: TDBRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'DEPLANC'
              DataSource = dsReavaliacao
            end
            object DBRealEdit8: TDBRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CMDEP'
              DataSource = dsReavaliacao
            end
          end
        end
        object pnlGrdReaval: TPanel
          Left = 0
          Top = 0
          Width = 548
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Dock973: TDock97
            Left = 1
            Top = 1
            Width = 546
            Height = 31
            AllowDrag = False
            Background.Data = {
              760F0000424D760F0000000000007600000028000000800000003C0000000100
              040000000000000F000000000000000000001000000000000000000000008080
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777777171717777777777777177771777777777777777077F7FF7FFFF7
              77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
              777777777771717717777777777777777717777777777777777777777FFFFF7F
              7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
              77777777777777171777777777777777717777777777777777777777777FF7FF
              7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
              7777777777771771777777777777777771777777777777777777777777777FFF
              FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
              777777777777771777777777777777777777777777777777777777777777777F
              F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
              7777777777777777777777777777777777777777777777777777777777777771
              77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
              7777777777777177777777777777777777777777777777777777777777777777
              777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
              7777777777777777771777777777777777777777777777777777777777777777
              7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
              7777777777777717771777777777777777777777777777777777777777777777
              77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
              7777777777777771777777777777777777777777777777777777777777777777
              777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
              7777777777777777777777777777777777777777777777777777777777777777
              777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
              7777777777777777177777777777777777777777777777777777777777777777
              7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
              7777777777777777717777777777777777777777777777777777777777777777
              7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
              7777777777777777777771777777777777777777777777777777777777777777
              7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
              F7F7777777777777771777777777177777777777777777777777777777777777
              77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
              777F7F7777777777777177177771717777777777777777777777777777777777
              77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
              77777F7F77777777777717771777777777777777777777777777777777777777
              777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
              1777777777777777777771717717777177777777777777777777777777777777
              777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
              7777777777771777777777177771777777777777777777777777777777777777
              77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
              7777777777777777777771777777777777777777777777777777777777777777
              777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
              7777777777171777777717777777777777777777777777777777777777777777
              77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
              7777777777777177777771777777777777777777777777777777777777777777
              777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
              7777777777777777777771177777777777777777777777777777777777777777
              7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
              7777777777777777777771717777777777777777777777777777777777777777
              777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
              7777777777777777777777171777777777777777777777777777777777777777
              71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
              7777777777777777777777177777777777777777777777777777777777777717
              77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
              77777777777777777777777777777777777F7777777777777777777777777171
              7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
              771777777777777777777777777777777177F777777777777777777777777717
              171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
              7777777777777777777777777777777777777F77777777777777777777777777
              77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
              7177777177777777777777777777777777777FF7F77771777777777777777777
              1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
              7777777717777777777777777777777777777777777777777777777777777777
              717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
              7177777777777777777777777777777777771777777777777777777777777777
              77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
              777777F777777777777777777777777777777777717177717777777777777777
              77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
              171777F7F7777777777777177777777777777777777777777777777777777777
              777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
              7777777F77777777777777777777777777777777777777777777777777777777
              77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
              7717777F77777777777777717177777777777777777777777777777777777777
              7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
              777777777F777777777777777717777777777777777777777777777777777777
              777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
              7777777777777777777777771777777777777777777777777777777777777777
              77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
              7777777777777777777777777717177777777771777777777777777777777777
              7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
              7777777777777177777777777777777777777717177777777777777777777777
              77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
              7777777777717777777777777717177777777777777777777777777777777777
              777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
              777777777717171717777777777777777777777771777777777F777777777777
              777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
              77777777171777777777777777777777777777777777777777F7F77777777777
              77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
              7777777777171777777777777777777777777777777777777777777777777777
              777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
              7777777717177777777777777777777777777777777777777777777777777777
              77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
              7777777777171777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
              77777777777777777F7F77777717777777777777777777777777777771777777
              7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
              77777777777777777F7F7F777777777777777777777777777777771777777777
              77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
              777777777777777777FFF77F7777717777777777777777777777777777177777
              77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
              77F7777777777777777777F77777777777777777777777777777777777777777
              77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
              F77777777777777777777777F7F7777777777777777777777777777777777777
              777777777717777777777777777777777777717777777777777F7F7F7F77F77F
              77F77777777F77777717777777F7777777777777777777777777777777777777
              77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
              7F77F77777777F77777717777777777777777777777777777777777777777777
              7777777777771777777777777777777777777777777777777F77F7F7F777F777
              F77F777777777777771771777777771777777777777777777777777777777777
              777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
              F7F7777777777777777717171777777777777777777777777777777777777777
              77777777777771777777777777777177777777777771777777777777F777F777
              7777777777777777777171717177771777777777777777777777777777777777
              77777777777777777777777777777777777777777777777777777F7F7F7F7777
              F77F77F777777777777771771717177777777777777777777777777777777777
              7777777777777777777777777777777777777777777177777777}
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnAltReaval: TToolbarButton97
                Left = 0
                Top = 0
                Width = 79
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Caption = 'Alterar'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
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
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = bbtnAltReavalClick
              end
            end
          end
          object dbgReavaliacao: TwwDBGrid
            Left = 1
            Top = 32
            Width = 538
            Height = 150
            Selected.Strings = (
              'DATAREAVALIACAO'#9'11'#9'Data Laudo'
              'VALORG'#9'15'#9'Valor Saldo'
              'CMBEM'#9'14'#9'Correção Monet.'
              'DEPLANC'#9'15'#9'Depreciação'
              'CMDEP'#9'13'#9'Correção Monet.'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsReavaliacao
            TabOrder = 0
            TitleAlignment = taCenter
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
      end
      object TabAcrescimo: TTabSheet
        Caption = 'Acréscimos de Valor'
        ImageIndex = 2
        object pnlDetAcresc: TPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 183
          BevelOuter = bvLowered
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 8
            Top = 72
            Width = 521
            Height = 73
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Caption = ' Valores Ajustados '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label22: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label23: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label24: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label25: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object edAcresValOrg: TRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresCmBem: TRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresDepLanc: TRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresCmDep: TRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
          end
          object bbtnOkAcrescimo: TBitBtn
            Left = 328
            Top = 144
            Width = 90
            Height = 33
            TabOrder = 1
            OnClick = bbtnOkAcrescimoClick
            Kind = bkOK
            Spacing = 2
          end
          object bbtnCancAcrescimo: TBitBtn
            Left = 424
            Top = 144
            Width = 90
            Height = 33
            Caption = 'Cancelar'
            TabOrder = 2
            OnClick = bbtnCancAcrescimoClick
            Kind = bkCancel
            Spacing = 2
          end
          object GroupBox5: TGroupBox
            Left = 8
            Top = 4
            Width = 521
            Height = 65
            Caption = ' Valores Atuais '
            TabOrder = 3
            object Label18: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label19: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label20: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label21: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object DBRealEdit9: TDBRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORG'
              DataSource = dsAcrescimo
            end
            object DBRealEdit10: TDBRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CMBEM'
              DataSource = dsAcrescimo
            end
            object DBRealEdit11: TDBRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'DEPLANC'
              DataSource = dsAcrescimo
            end
            object DBRealEdit12: TDBRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CMDEP'
              DataSource = dsAcrescimo
            end
          end
        end
        object pnlGrdAcresc: TPanel
          Left = 0
          Top = 0
          Width = 548
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object dbgAcrescimo: TwwDBGrid
            Left = 1
            Top = 32
            Width = 546
            Height = 150
            Selected.Strings = (
              'DATAACRESCIMO'#9'10'#9'Data Evento'
              'VALORG'#9'15'#9'Valor'
              'CMBEM'#9'15'#9'Correção'
              'DEPLANC'#9'15'#9'Depreciação'
              'CMDEP'#9'15'#9'Correção')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAcrescimo
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Dock972: TDock97
            Left = 1
            Top = 1
            Width = 546
            Height = 31
            AllowDrag = False
            Background.Data = {
              760F0000424D760F0000000000007600000028000000800000003C0000000100
              040000000000000F000000000000000000001000000000000000000000008080
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777777171717777777777777177771777777777777777077F7FF7FFFF7
              77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
              777777777771717717777777777777777717777777777777777777777FFFFF7F
              7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
              77777777777777171777777777777777717777777777777777777777777FF7FF
              7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
              7777777777771771777777777777777771777777777777777777777777777FFF
              FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
              777777777777771777777777777777777777777777777777777777777777777F
              F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
              7777777777777777777777777777777777777777777777777777777777777771
              77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
              7777777777777177777777777777777777777777777777777777777777777777
              777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
              7777777777777777771777777777777777777777777777777777777777777777
              7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
              7777777777777717771777777777777777777777777777777777777777777777
              77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
              7777777777777771777777777777777777777777777777777777777777777777
              777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
              7777777777777777777777777777777777777777777777777777777777777777
              777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
              7777777777777777177777777777777777777777777777777777777777777777
              7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
              7777777777777777717777777777777777777777777777777777777777777777
              7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
              7777777777777777777771777777777777777777777777777777777777777777
              7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
              F7F7777777777777771777777777177777777777777777777777777777777777
              77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
              777F7F7777777777777177177771717777777777777777777777777777777777
              77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
              77777F7F77777777777717771777777777777777777777777777777777777777
              777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
              1777777777777777777771717717777177777777777777777777777777777777
              777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
              7777777777771777777777177771777777777777777777777777777777777777
              77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
              7777777777777777777771777777777777777777777777777777777777777777
              777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
              7777777777171777777717777777777777777777777777777777777777777777
              77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
              7777777777777177777771777777777777777777777777777777777777777777
              777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
              7777777777777777777771177777777777777777777777777777777777777777
              7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
              7777777777777777777771717777777777777777777777777777777777777777
              777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
              7777777777777777777777171777777777777777777777777777777777777777
              71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
              7777777777777777777777177777777777777777777777777777777777777717
              77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
              77777777777777777777777777777777777F7777777777777777777777777171
              7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
              771777777777777777777777777777777177F777777777777777777777777717
              171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
              7777777777777777777777777777777777777F77777777777777777777777777
              77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
              7177777177777777777777777777777777777FF7F77771777777777777777777
              1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
              7777777717777777777777777777777777777777777777777777777777777777
              717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
              7177777777777777777777777777777777771777777777777777777777777777
              77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
              777777F777777777777777777777777777777777717177717777777777777777
              77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
              171777F7F7777777777777177777777777777777777777777777777777777777
              777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
              7777777F77777777777777777777777777777777777777777777777777777777
              77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
              7717777F77777777777777717177777777777777777777777777777777777777
              7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
              777777777F777777777777777717777777777777777777777777777777777777
              777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
              7777777777777777777777771777777777777777777777777777777777777777
              77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
              7777777777777777777777777717177777777771777777777777777777777777
              7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
              7777777777777177777777777777777777777717177777777777777777777777
              77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
              7777777777717777777777777717177777777777777777777777777777777777
              777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
              777777777717171717777777777777777777777771777777777F777777777777
              777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
              77777777171777777777777777777777777777777777777777F7F77777777777
              77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
              7777777777171777777777777777777777777777777777777777777777777777
              777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
              7777777717177777777777777777777777777777777777777777777777777777
              77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
              7777777777171777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
              77777777777777777F7F77777717777777777777777777777777777771777777
              7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
              77777777777777777F7F7F777777777777777777777777777777771777777777
              77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
              777777777777777777FFF77F7777717777777777777777777777777777177777
              77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
              77F7777777777777777777F77777777777777777777777777777777777777777
              77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
              F77777777777777777777777F7F7777777777777777777777777777777777777
              777777777717777777777777777777777777717777777777777F7F7F7F77F77F
              77F77777777F77777717777777F7777777777777777777777777777777777777
              77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
              7F77F77777777F77777717777777777777777777777777777777777777777777
              7777777777771777777777777777777777777777777777777F77F7F7F777F777
              F77F777777777777771771777777771777777777777777777777777777777777
              777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
              F7F7777777777777777717171777777777777777777777777777777777777777
              77777777777771777777777777777177777777777771777777777777F777F777
              7777777777777777777171717177771777777777777777777777777777777777
              77777777777777777777777777777777777777777777777777777F7F7F7F7777
              F77F77F777777777777771771717177777777777777777777777777777777777
              7777777777777777777777777777777777777777777177777777}
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar971: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnAltAcresc: TToolbarButton97
                Left = 0
                Top = 0
                Width = 79
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Caption = 'Alterar'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
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
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = bbtnAltAcrescClick
              end
            end
          end
        end
      end
    end
    object edValResidual: TRealEdit
      Left = 304
      Top = 88
      Width = 147
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 333
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 383
      DockPos = 383
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Caption = '&Estornar'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 586
    Top = 463
    TargetsData = (
      1
      3
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 400
    Top = 35
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 21
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle'
      'Valor Residual')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'GRUPO.FLGIMOVEL')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 520
    Top = 88
  end
  object dsReavaliacao: TwwDataSource
    AutoEdit = False
    DataSet = cdsReavaliacao
    Left = 320
    Top = 35
  end
  object dsAcrescimo: TwwDataSource
    AutoEdit = False
    DataSet = cdsAcrescimo
    Left = 240
    Top = 36
  end
  object cdsReavaliacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 21
  end
  object cdsAcrescimo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 22
  end
  object sqlAcrescimo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDBEM, A.IDPESSOA, A.IDACRESCIMO, A.IDMOVIM' +
        'ENTACAO, A.DATAACRESCIMO,'
      '       AM.VALORG, AM.CMBEM, AD.DEPLANC, AD.CMDEP,'
      '       AD.TAXADEP, AD.DATAULTDEP, AD.FLGDEPREC'
      'FROM ACRESCIMOVALOR A,'
      '     ACRESCVALORXMOEDA AM,'
      '     ACRESCVALORXDEP AD'
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (AM.MOECODIGO = :MOECODIGO)'
      '  AND (AD.MOECODIGO = :MOECODIGO)'
      '  AND (AD.IDACRESCIMOXDEP = :IDTAXADEP)'
      '  AND (A.IDACRESCIMO = AM.IDACRESCIMO(+))'
      '  AND (A.IDACRESCIMO = AD.IDACRESCIMO(+))'
      'ORDER BY A.IDACRESCIMO DESC')
    ClientDataSet = cdsAcrescimo
    Left = 240
    Top = 8
  end
  object sqlReavaliacao: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDBEM, R.IDPESSOA, R.IDREAVALIACAO, R.IDMOV' +
        'IMENTACAO, R.DATAREAVALIACAO,'
      
        '       R.FLGULTREAVAL, RM.VALORG, RM.CMBEM, RD.DEPLANC, RD.CMDEP' +
        ','
      '       RD.TAXADEP, RD.DATAULTDEP, RD.FLGDEPREC'
      'FROM REAVALIACAO R,'
      '     REAVALXMOEDA RM,'
      '     REAVALXDEP RD'
      'WHERE R.IDBEM = :IDBEM'
      '  AND R.IDPESSOA = :IDPESSOA'
      '  AND RM.MOECODIGO = :MOECODIGO'
      '  AND RD.MOECODIGO = :MOECODIGO'
      '  AND RD.IDREAVALXDEP = :IDTAXADEP'
      '  AND R.IDREAVALIACAO = RM.IDREAVALIACAO(+)'
      '  AND R.IDREAVALIACAO = RD.IDREAVALIACAO(+)'
      'ORDER BY R.IDREAVALIACAO DESC'
      '')
    ClientDataSet = cdsReavaliacao
    Left = 320
    Top = 8
  end
  object sqlSelBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DTA' +
        'INCLUSAO,'
      '       B.DATAINICIODEP, B.BAIXATOTAL, B.CONTROLE, G.FLGIMOVEL,'
      '       BM.VALORG, BM.CMBEM, BD.DEPLANC, BD.CMDEP,'
      '       BD.TAXADEP, BD.DATAULTDEP, BD.FLGDEPREC'
      'FROM BEM B,'
      '     GRUPO G,'
      '     BEMXMOEDA BM,'
      '     BEMXDEP BD'
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (BM.MOECODIGO = :MOECODIGO)'
      '  AND (BD.MOECODIGO = :MOECODIGO)'
      '  AND (BD.IDBEMXDEP = :IDTAXADEP)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDBEM = BM.IDBEM(+))'
      '  AND (B.IDPESSOA = BM.IDPESSOA(+))'
      '  AND (B.IDBEM = BD.IDBEM(+))'
      '  AND (B.IDPESSOA = BD.IDPESSOA(+))'
      ''
      ' ')
    ClientDataSet = cdsSelBem
    Left = 400
    Top = 8
  end
  object cdsUltMovBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 22
  end
  object sqlUltMovBem: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)')
    ClientDataSet = cdsUltMovBem
    Left = 160
    Top = 8
  end
  object cdsAjustes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 61
  end
  object cdsSaldoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 70
    Top = 22
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.IDBEM, SB.IDPESSOA, SB.DATASLDBEM, SB.MOECODIGO, SB.ID' +
        'SLDCTBBEMXDEP,'
      '       SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVEL,'
      '       SB.VALORG, SB.CMBEM, SB.DEPLANC, SB.CMDEP,'
      
        '       SB.REAVVALORG, SB.REAVCMBEM, SB.REAVDEPLANC, SB.REAVCMDEP' +
        ','
      
        '       SB.ULTREAVVALORG,  SB.ULTREAVCMBEM, SB.ULTREAVDEPLANC, SB' +
        '.ULTREAVCMDEP'
      ''
      
        'FROM (SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLD' +
        'BEM, SCB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = MOECODIGO'
      '              AND :IDPESSOA = IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE :IDBEM = SCB1.IDBEM'
      '        AND :IDPESSOA = SCB1.IDPESSOA'
      '        AND :MOECODIGO = SCB1.MOECODIGO'
      '        AND :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = :IDBEM'
      '        AND SCD1.IDBEM = :IDBEM'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCD1.IDBEM = DTAMAX.IDBEM) SB'
      ''
      'WHERE :IDBEM = SB.IDBEM'
      '  AND :IDPESSOA = SB.IDPESSOA'
      '  AND :MOECODIGO = SB.MOECODIGO'
      '  AND :IDTAXADEP = SB.IDSLDCTBBEMXDEP'
      ''
      '')
    ClientDataSet = cdsSaldoContabil
    Left = 70
    Top = 8
  end
end
