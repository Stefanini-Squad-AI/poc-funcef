inherited frmConsHistMovReserva: TfrmConsHistMovReserva
  Left = 29
  Top = 71
  HelpContext = 160183
  Caption = 'Consulta do Histórico de Movimentação de Reservas'
  ClientHeight = 469
  ClientWidth = 749
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 247
    Width = 749
    Height = 6
    Cursor = crVSplit
    Align = alTop
  end
  inherited pnlFundo: TPanel
    Left = 56
    Top = 273
    Width = 661
    Height = 53
    Align = alNone
    Visible = False
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 577
      DockPos = 579
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited pnlPesquisa: TPanel
    Width = 749
    Height = 247
    Font.Style = []
    ParentFont = False
    inherited Panel4: TPanel
      Left = 593
      Top = 169
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 548
      Height = 245
      ActivePage = TabSheet1
      Align = alLeft
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros do Participante'
        object GroupBox4: TGroupBox
          Left = 257
          Top = 52
          Width = 283
          Height = 164
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label15: TLabel
            Left = 8
            Top = 49
            Width = 45
            Height = 13
            Caption = 'Matrícula'
          end
          object Label13: TLabel
            Left = 8
            Top = 87
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object Label7: TLabel
            Left = 147
            Top = 49
            Width = 20
            Height = 13
            Caption = 'CPF'
          end
          object Label19: TLabel
            Left = 8
            Top = 125
            Width = 113
            Height = 13
            Caption = 'Inscrição Previdenciária'
          end
          object Label20: TLabel
            Left = 153
            Top = 126
            Width = 84
            Height = 13
            Caption = 'Data de Inscrição'
          end
          object Label29: TLabel
            Left = 9
            Top = 12
            Width = 20
            Height = 13
            Caption = 'Filial'
          end
          object edmatricula: TEdit
            Left = 8
            Top = 63
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edcpf: TEdit
            Left = 147
            Top = 63
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object ednome: TEdit
            Left = 8
            Top = 101
            Width = 262
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object numinscprev: TEdit
            Left = 8
            Top = 139
            Width = 122
            Height = 21
            TabOrder = 3
          end
          object datainscprev: TCMDateTimePicker
            Left = 151
            Top = 139
            Width = 111
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
          object cmbfilial: TwwDBLookupCombo
            Left = 8
            Top = 26
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryfilial
            LookupField = 'IDPESSOA'
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 257
          Height = 217
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object LABEL1: TLabel
            Left = 10
            Top = 10
            Width = 66
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label35: TLabel
            Left = 10
            Top = 50
            Width = 97
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label36: TLabel
            Left = 10
            Top = 90
            Width = 75
            Height = 13
            Caption = 'Evento Gerador'
          end
          object Label37: TLabel
            Left = 10
            Top = 130
            Width = 46
            Height = 13
            Caption = 'Benefício'
          end
          object Label38: TLabel
            Left = 10
            Top = 170
            Width = 59
            Height = 13
            Caption = 'Contribuição'
          end
          object DBCMBPATRO: TwwDBLookupCombo
            Left = 8
            Top = 25
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qrypatro
            LookupField = 'IDPESSOA'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cmbevento: TwwDBLookupCombo
            Left = 8
            Top = 105
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryevento
            LookupField = 'IDEVENTOGERADOR'
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbcmbplano: TwwDBLookupCombo
            Left = 8
            Top = 65
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'NOME')
            LookupTable = qryplano
            LookupField = 'NOME'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dbcmbplanoCloseUp
          end
          object cmbbeneficio: TwwDBLookupCombo
            Left = 8
            Top = 144
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qrybeneficio
            LookupField = 'IDBENEFICIO'
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cmbcontribuicao: TwwDBLookupCombo
            Left = 8
            Top = 184
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qrycont
            LookupField = 'NOME'
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox1: TGroupBox
          Left = 257
          Top = 0
          Width = 283
          Height = 53
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblreserva: TLabel
            Left = 10
            Top = 10
            Width = 40
            Height = 13
            Caption = 'Reserva'
          end
          object DBCMBRESERVA: TwwDBLookupCombo
            Left = 8
            Top = 25
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'NOME')
            LookupTable = qryreservacmb
            LookupField = 'IDTIPORESERVA'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object tbhst: TTabSheet
        Caption = 'Parâmetros do Histórico'
        object rdggerador: TRadioGroup
          Left = 364
          Top = 0
          Width = 176
          Height = 217
          Align = alRight
          Caption = 'Gerado por '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 5
          Items.Strings = (
            'Pagamento de Benefícios'
            'Recebimento de Contribuições'
            'Transferência de Reservas'
            'Atualização Monetária'
            'Excedente Financeiro'
            'Todos')
          ParentFont = False
          TabOrder = 0
        end
        object grpData: TGroupBox
          Left = 0
          Top = 0
          Width = 106
          Height = 121
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label5: TLabel
            Left = 7
            Top = 21
            Width = 27
            Height = 13
            Caption = 'Inicial'
          end
          object Label6: TLabel
            Left = 7
            Top = 68
            Width = 22
            Height = 13
            Caption = 'Final'
          end
          object datamovini: TCMDateTimePicker
            Left = 6
            Top = 36
            Width = 95
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
          object datamovfim: TCMDateTimePicker
            Left = 6
            Top = 84
            Width = 95
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
          Left = 106
          Top = 0
          Width = 258
          Height = 217
          Align = alRight
          Caption = 'Valores '
          TabOrder = 2
          object Label9: TLabel
            Left = 7
            Top = 31
            Width = 112
            Height = 13
            Caption = 'Valor da Movimentação'
          end
          object Label16: TLabel
            Left = 7
            Top = 115
            Width = 126
            Height = 13
            Caption = 'Valor Posterior da Reserva'
          end
          object Label17: TLabel
            Left = 28
            Top = 49
            Width = 33
            Height = 13
            Caption = 'Moeda'
          end
          object Label21: TLabel
            Left = 28
            Top = 134
            Width = 33
            Height = 13
            Caption = 'Moeda'
          end
          object Label22: TLabel
            Left = 34
            Top = 73
            Width = 27
            Height = 13
            Caption = 'Cotas'
          end
          object Label24: TLabel
            Left = 34
            Top = 157
            Width = 27
            Height = 13
            Caption = 'Cotas'
          end
          object Label25: TLabel
            Left = 154
            Top = 50
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object Label26: TLabel
            Left = 154
            Top = 73
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object Label30: TLabel
            Left = 155
            Top = 135
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object Label31: TLabel
            Left = 155
            Top = 157
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object Label12: TLabel
            Left = 15
            Top = 181
            Width = 121
            Height = 13
            Caption = 'Valor Anterior da Reserva'
            Visible = False
          end
          object Label18: TLabel
            Left = 36
            Top = 200
            Width = 33
            Height = 13
            Caption = 'Moeda'
            Visible = False
          end
          object Label23: TLabel
            Left = 42
            Top = 223
            Width = 27
            Height = 13
            Caption = 'Cotas'
            Visible = False
          end
          object Label27: TLabel
            Left = 163
            Top = 199
            Width = 6
            Height = 13
            Caption = 'a'
            Visible = False
          end
          object Label28: TLabel
            Left = 163
            Top = 223
            Width = 6
            Height = 13
            Caption = 'a'
            Visible = False
          end
          object rvlmovmoeda: TRealEdit
            Left = 65
            Top = 46
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object rvlmovcotas: TRealEdit
            Left = 65
            Top = 70
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
          end
          object rvlmovmoedafim: TRealEdit
            Left = 166
            Top = 46
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object rvlmovcotasfim: TRealEdit
            Left = 166
            Top = 70
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
          end
          object rvlposmoeda: TRealEdit
            Left = 65
            Top = 130
            Width = 85
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
          object rvlposcotas: TRealEdit
            Left = 65
            Top = 154
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
          end
          object rvlposmoedafim: TRealEdit
            Left = 166
            Top = 130
            Width = 85
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
          object rvlposcotasfim: TRealEdit
            Left = 166
            Top = 154
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 12
            NumberFormat = fNumber
            Signal = False
          end
          object chkmovmoeda: TCheckBox
            Left = 7
            Top = 48
            Width = 15
            Height = 17
            TabOrder = 8
          end
          object chkmovcotas: TCheckBox
            Left = 7
            Top = 70
            Width = 15
            Height = 17
            Caption = 'chkmovcotas'
            TabOrder = 9
          end
          object chkposmoeda: TCheckBox
            Left = 7
            Top = 132
            Width = 15
            Height = 17
            Caption = 'CheckBox2'
            TabOrder = 10
          end
          object chkposcotas: TCheckBox
            Left = 7
            Top = 154
            Width = 15
            Height = 17
            Caption = 'CheckBox2'
            TabOrder = 11
          end
          object rvlantmoeda: TRealEdit
            Left = 73
            Top = 196
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 12
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object rvlantcotas: TRealEdit
            Left = 73
            Top = 220
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 13
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object rvlantmoedafim: TRealEdit
            Left = 165
            Top = 196
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 14
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object rvlantcotasfim: TRealEdit
            Left = 165
            Top = 220
            Width = 85
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 15
            Visible = False
            WordWrap = False
            IntDigits = 10
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object chkantmoeda: TCheckBox
            Left = 15
            Top = 199
            Width = 15
            Height = 17
            Caption = 'CheckBox2'
            TabOrder = 16
            Visible = False
          end
          object chkantcotas: TCheckBox
            Left = 15
            Top = 221
            Width = 15
            Height = 17
            Caption = 'CheckBox2'
            TabOrder = 17
            Visible = False
          end
        end
        object rdgrpreserv: TRadioGroup
          Left = 0
          Top = 120
          Width = 105
          Height = 96
          Caption = 'Reservas'
          ItemIndex = 2
          Items.Strings = (
            'Individuais'
            'Coletivas'
            'Todas')
          TabOrder = 3
        end
      end
    end
    object grplegenda: TGroupBox
      Left = 554
      Top = 3
      Width = 189
      Height = 136
      Caption = 'Gerado por '
      TabOrder = 2
      object Shape3: TShape
        Left = 8
        Top = 24
        Width = 16
        Height = 12
        Brush.Color = clWindow
      end
      object Label10: TLabel
        Left = 35
        Top = 23
        Width = 123
        Height = 13
        Caption = 'Pagamento de Benefícios'
        WordWrap = True
      end
      object Shape4: TShape
        Left = 8
        Top = 45
        Width = 16
        Height = 12
        Brush.Color = clTeal
      end
      object Label11: TLabel
        Left = 35
        Top = 44
        Width = 150
        Height = 12
        AutoSize = False
        Caption = 'Recebimento de Contribuições'
        WordWrap = True
      end
      object Shape5: TShape
        Left = 8
        Top = 66
        Width = 16
        Height = 12
        Brush.Color = clGray
      end
      object Label14: TLabel
        Left = 36
        Top = 66
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Transferência de Reservas'
        WordWrap = True
      end
      object Shape1: TShape
        Left = 8
        Top = 88
        Width = 16
        Height = 12
        Brush.Color = clInfoBk
      end
      object Label32: TLabel
        Left = 36
        Top = 87
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Atualização Monetária'
        WordWrap = True
      end
      object Shape2: TShape
        Left = 8
        Top = 110
        Width = 16
        Height = 12
        Brush.Color = clYellow
      end
      object Label33: TLabel
        Left = 36
        Top = 109
        Width = 142
        Height = 12
        AutoSize = False
        Caption = 'Excedente Financeiro'
        WordWrap = True
      end
    end
  end
  inherited tsetResult: TTabSet
    Top = 450
    Width = 749
  end
  inherited grpResultado: TGroupBox
    Top = 253
    Width = 749
    Height = 158
    inherited Panel1: TPanel
      Width = 745
      Height = 131
      inherited dbgrdResultado: TwwDBGrid
        Width = 745
        Height = 131
        Selected.Strings = (
          'DATAMOV'#9'10'#9'Data da ~Movimentação'
          'PESSOA'#9'25'#9'Participante / Patrocinadora'
          'MATRICULA'#9'13'#9'Matrícula'
          'PESSJUR'#9'25'#9'Patrocinadora'
          'PART'#9'25'#9'Participante Referência'
          'RESERVA'#9'25'#9'Reserva'
          'VALORINDICE'#9'10'#9'Valor do ~índice'
          'VLRREAL'#9'10'#9'Valor da ~Movimentação (Moeda)'
          'VLRCOTAS'#9'10'#9'Valor da ~Movimentação (Cotas)'
          'SaldoAntReal'#9'10'#9'Saldo ~Anterior (Moeda)'
          'SaldoAntCotas'#9'10'#9'Saldo ~Anterior (Cotas)'
          'SALDOREAL'#9'10'#9'Saldo ~Posterior (Moeda)'
          'SALDOCOTAS'#9'10'#9'Saldo ~Posterior (Cotas)'
          'BENEFICIO'#9'25'#9'Benefício'
          'EVENTO'#9'25'#9'Evento Gerador'
          'CONTRIBUICAO'#9'25'#9'Contribuição'
          'PLANPREV'#9'25'#9'Plano Previdenciário'
          'FLGENTRADA'#9'10'#9'Entrada/Saída'
          'NOMEREGRA'#9'25'#9'Regra de Cálculo')
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TitleLines = 2
        TitleButtons = True
        OnCalcCellColors = dbgrdResultadoCalcCellColors
        OnTitleButtonClick = dbgrdResultadoTitleButtonClick
      end
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryreserva
  end
  object qryreserva: TwwQuery
    OnCalcFields = qryreservaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        'H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICAO' +
        ',H.IDBENEFICIO,H.IDTIPORESERVA,'
      
        'H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL ,H.VLRCOTAS   ' +
        ',H.SALDOREAL  ,H.SALDOCOTAS     ,'
      
        'BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLANPREV.N' +
        'OME PLANPREV,'
      
        'PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.NOME CO' +
        'NTRIBUICAO , EVENTOGERADOR.NOME EVENTO,'
      
        ' DECODE(FLGENTRADA,1,'#39'Entrada'#39',0,'#39'Saída'#39') FLGENTRADA, FLGENTRADA' +
        ' ENTRADA ,'
      'REGRA.NOMEREGRA, PART.NOME PART, VALORINDICE, EL.MATRICULA'
      ''
      
        'FROM HISTMOVRESERVA H, EVENTOGERADOR, PLANPREV, PESSOA , PESSOA ' +
        'PESSJUR , '
      
        'RESERVAXPLANO, CONTRIBUICAO, BENEFICIO, REGRA, PESSOA PART, ELEG' +
        'PATRO EL'
      'WHERE '
      'PESSOA.IDPESSOA =  H.IDPESSOA AND'
      'PESSJUR.IDPESSOA = H.IDPESSJUR AND'
      'EL.IDPESSOA = H.IDPESSOA AND'
      'EL.IDPESSJUR = H.IDPESSJUR AND'
      'PLANPREV.IDPLANOPREV = H.IDPLANOPREV AND'
      'H.IDPARTICIPANTE = PART.IDPESSOA and'
      'RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV AND'
      'RESERVAXPLANO.IDTIPORESERVA = H.IDTIPORESERVA AND'
      'EVENTOGERADOR.IDEVENTOGERADOR(+) = H.IDEVENTOGERADOR AND'
      'CONTRIBUICAO.IDCONTRIBUICAO(+) = H.IDCONTRIBUICAO AND'
      'REGRA.IDREGRA(+) = H.IDREGRACALCULO  AND'
      'BENEFICIO.IDBENEFICIO(+) = H.IDBENEFICIO'
      '')
    ValidateWithMask = True
    Left = 106
    Top = 289
    object qryreservaDATAMOV: TDateTimeField
      DisplayLabel = 'Data da ~Movimentação'
      DisplayWidth = 10
      FieldName = 'DATAMOV'
    end
    object qryreservaPESSOA: TStringField
      DisplayLabel = 'Participante / Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PESSOA'
      Size = 60
    end
    object qryreservaMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryreservaPESSJUR: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PESSJUR'
      Size = 60
    end
    object qryreservaPART: TStringField
      DisplayLabel = 'Participante Referência'
      DisplayWidth = 25
      FieldName = 'PART'
      Size = 60
    end
    object qryreservaRESERVA: TStringField
      DisplayLabel = 'Reserva'
      DisplayWidth = 25
      FieldName = 'RESERVA'
      Size = 50
    end
    object qryreservaVALORINDICE: TFloatField
      DisplayLabel = 'Valor do ~índice'
      DisplayWidth = 10
      FieldName = 'VALORINDICE'
    end
    object qryreservaVLRREAL: TFloatField
      DisplayLabel = 'Valor da ~Movimentação (Moeda)'
      DisplayWidth = 10
      FieldName = 'VLRREAL'
      DisplayFormat = '#0.00'
    end
    object qryreservaVLRCOTAS: TFloatField
      DisplayLabel = 'Valor da ~Movimentação (Cotas)'
      DisplayWidth = 10
      FieldName = 'VLRCOTAS'
      DisplayFormat = '#0.000000'
    end
    object qryreservaSaldoAntReal: TFloatField
      DisplayLabel = 'Saldo ~Anterior (Moeda)'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'SaldoAntReal'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object qryreservaSaldoAntCotas: TFloatField
      DisplayLabel = 'Saldo ~Anterior (Cotas)'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'SaldoAntCotas'
      DisplayFormat = '#0.000000'
      Calculated = True
    end
    object qryreservaSALDOREAL: TFloatField
      DisplayLabel = 'Saldo ~Posterior (Moeda)'
      DisplayWidth = 10
      FieldName = 'SALDOREAL'
      DisplayFormat = '#0.00'
    end
    object qryreservaSALDOCOTAS: TFloatField
      DisplayLabel = 'Saldo ~Posterior (Cotas)'
      DisplayWidth = 10
      FieldName = 'SALDOCOTAS'
      DisplayFormat = '#0.000000'
    end
    object qryreservaBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 25
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryreservaEVENTO: TStringField
      DisplayLabel = 'Evento Gerador'
      DisplayWidth = 25
      FieldName = 'EVENTO'
      Size = 60
    end
    object qryreservaCONTRIBUICAO: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 25
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryreservaPLANPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryreservaFLGENTRADA: TStringField
      DisplayLabel = 'Entrada/Saída'
      DisplayWidth = 10
      FieldName = 'FLGENTRADA'
      Size = 7
    end
    object qryreservaNOMEREGRA: TStringField
      DisplayLabel = 'Regra de Cálculo'
      DisplayWidth = 25
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryreservaENTRADA: TFloatField
      FieldName = 'ENTRADA'
      Visible = False
    end
    object qryreservaIDHISTRESERVA: TFloatField
      FieldName = 'IDHISTRESERVA'
      Visible = False
    end
    object qryreservaIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
      Visible = False
    end
    object qryreservaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryreservaIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryreservaIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryreservaIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Visible = False
    end
    object qryreservaIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryreservaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  NOME, IDPLANOPREV'
      'FROM    PLANPREV'
      
        'WHERE   IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATR' +
        'O PLP, PATRO P'
      '                        WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                        AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 276
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.IDPESSOA'
      'FROM   PESSOA P, FILIALPESSOA F'
      'WHERE  P.IDPESSOA = F.IDFILIALPESSOA'
      
        'AND    P.IDGRUPO IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO' +
        ' = :IDFUNDACAO )'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 319
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryevento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDEVENTOGERADOR FROM EVENTOGERADOR'
      'WHERE  IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 378
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qrybeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDBENEFICIO FROM BENEFICIO'
      'WHERE  IDBENEFICIO IN (SELECT  BP.IDBENEFICIO'
      
        '                          FROM    BENEFPLANPREV BP, PLANPREVPATR' +
        'O PLP, PATRO P'
      '                          WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                          AND     PLP.IDPESSJUR = P.IDPESSOA'
      
        '                          AND     BP.IDPLANOPREV = PLP.IDPLANOPR' +
        'EV'
      '                          )'
      ''
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 434
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qrycont: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, NOME FROM CONTRIBUICAO'
      'WHERE  IDCONTRIBUICAO IN (SELECT  CP.IDCONTRIBUICAO'
      
        '                          FROM    CONTPREV CP, PLANPREVPATRO PLP' +
        ', PATRO P'
      '                          WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                          AND     PLP.IDPESSJUR = P.IDPESSOA'
      
        '                          AND     CP.IDPLANOPREV = PLP.IDPLANOPR' +
        'EV'
      '                          )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 506
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryreservacmb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT  NOME, IDTIPORESERVA'
      'FROM   RESERVAXPLANO'
      'WHERE  ANALITICOSINTETI = '#39'A'#39
      
        'AND    IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO' +
        ' PLP, PATRO PT'
      '                       WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      '                       AND    PLP.IDPESSJUR = PT.IDPESSOA )'
      ''
      '')
    ValidateWithMask = True
    Left = 336
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
