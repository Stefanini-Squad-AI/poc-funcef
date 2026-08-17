inherited fConsEventass: TfConsEventass
  Left = 25
  Top = 119
  Caption = 'Consulta de Eventos Assistenciais'
  ClientHeight = 429
  ClientWidth = 713
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 195
    Width = 713
    Height = 7
    Cursor = crVSplit
    Align = alTop
  end
  object Label10: TLabel [1]
    Left = 6
    Top = 138
    Width = 104
    Height = 13
    Caption = 'Plano Assistencial'
  end
  inherited pnlFundo: TPanel
    Top = 323
    Width = 713
    Height = 93
    Align = alNone
    inherited Panel3: TPanel
      Left = 467
      Top = 40
    end
  end
  inherited Dock971: TDock97
    Top = 390
    Width = 713
    inherited tb97Fundo: TToolbar97
      Left = 543
      DockPos = 543
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      DockPos = 96
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited pnlPesquisa: TPanel
    Width = 713
    Height = 195
    object grpData: TGroupBox [0]
      Left = 506
      Top = 1
      Width = 205
      Height = 114
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object GroupBox3: TGroupBox
        Left = 8
        Top = 21
        Width = 166
        Height = 84
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 9
          Width = 27
          Height = 13
          Caption = 'Início'
        end
        object Label6: TLabel
          Left = 9
          Top = 42
          Width = 16
          Height = 13
          Caption = 'Fim'
        end
        object date1: TCMDateTimePicker
          Left = 8
          Top = 21
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
          TabOrder = 0
        end
        object date2: TCMDateTimePicker
          Left = 8
          Top = 54
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
      end
    end
    inherited Panel4: TPanel
      Left = 548
      Top = 134
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 225
      Height = 193
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object LABEL1: TLabel
        Left = 7
        Top = 7
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
      end
      object label4: TLabel
        Left = 7
        Top = 82
        Width = 97
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label3: TLabel
        Left = 7
        Top = 119
        Width = 85
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object Label11: TLabel
        Left = 7
        Top = 155
        Width = 36
        Height = 13
        Caption = 'Serviço'
      end
      object Label29: TLabel
        Left = 7
        Top = 44
        Width = 20
        Height = 13
        Caption = 'Filial'
      end
      object DBCMBPATRO: TwwDBLookupCombo
        Left = 6
        Top = 21
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
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = DBCMBPATROEnter
      end
      object DBCMBPLANO: TwwDBLookupCombo
        Left = 6
        Top = 96
        Width = 202
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = qryplano
        LookupField = 'IDPLANOPREV'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = DBCMBPLANOEnter
      end
      object DBLkpCmbplanass: TwwDBLookupCombo
        Left = 6
        Top = 133
        Width = 202
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'NOME')
        LookupTable = qryplanass
        LookupField = 'IDPLANASS'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = DBLkpCmbplanassEnter
      end
      object cmbfilial: TwwDBLookupCombo
        Left = 7
        Top = 58
        Width = 201
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryfilial
        LookupField = 'IDPESSOA'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = cmbfilialEnter
      end
    end
    object GroupBox4: TGroupBox
      Left = 226
      Top = 1
      Width = 280
      Height = 193
      Align = alLeft
      Caption = 'Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label15: TLabel
        Left = 8
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Matrícula'
      end
      object Label13: TLabel
        Left = 8
        Top = 51
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label7: TLabel
        Left = 147
        Top = 14
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 88
        Width = 264
        Height = 92
        TabOrder = 3
        object Label8: TLabel
          Left = 8
          Top = 10
          Width = 101
          Height = 13
          Caption = 'Inscrição Assistencial'
        end
        object Label9: TLabel
          Left = 151
          Top = 10
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label2: TLabel
          Left = 6
          Top = 50
          Width = 113
          Height = 13
          Caption = 'Inscrição Previdenciária'
        end
        object Label16: TLabel
          Left = 151
          Top = 50
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object ednumero: TEdit
          Left = 6
          Top = 23
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object date3: TCMDateTimePicker
          Left = 148
          Top = 23
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
          TabOrder = 1
        end
        object numinscprev: TEdit
          Left = 6
          Top = 64
          Width = 122
          Height = 21
          TabOrder = 2
        end
        object datainscprev: TCMDateTimePicker
          Left = 149
          Top = 64
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
          TabOrder = 3
        end
      end
      object edmatricula: TEdit
        Left = 8
        Top = 28
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edcpf: TEdit
        Left = 147
        Top = 28
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object ednome: TEdit
        Left = 8
        Top = 65
        Width = 262
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
    end
  end
  object wwDBLookupCombo1: TwwDBLookupCombo [5]
    Left = 7
    Top = 170
    Width = 202
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'NOME')
    LookupTable = qrytpservass
    LookupField = 'IDSERVASS'
    ParentFont = False
    TabOrder = 5
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
    OnEnter = wwDBLookupCombo1Enter
  end
  inherited tsetResult: TTabSet
    Top = 371
    Width = 713
  end
  inherited grpResultado: TGroupBox
    Top = 202
    Width = 713
    Height = 169
    Caption = 'Resultado '
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    inherited Panel1: TPanel
      Top = 18
      Width = 709
      Height = 149
      inherited dbgrdResultado: TwwDBGrid
        Width = 709
        Height = 149
        Selected.Strings = (
          'DATAEVENT'#9'10'#9'Data do Evento'
          'NOME_1'#9'25'#9'Nome do Beneficiário'
          'MATRICULA'#9'13'#9'Matrícula'
          'NOME_4'#9'25'#9'Serviço'
          'VALOREVENT'#9'10'#9'Valor do Evento'
          'VALORPAGO'#9'10'#9'Valor Pago'
          'DATAPAG'#9'10'#9'Data do Pagamento'
          'VALORPAGAMENTO'#9'10'#9'Valor do Pagamento ao Fornecedor'
          'VALORRECEBIMENTO'#9'10'#9'Valor da comissão do Fornecedor'
          'VALORREEMBOLSO'#9'10'#9'Valor do Reembolso'
          'NOME'#9'25'#9'Nome do Titular'
          'CPF'#9'13'#9'CPF'
          'NOME_2'#9'25'#9'Plano Previdenciário'
          'NOME_3'#9'25'#9'Plano Assistencial'
          'DATAADMISSAO'#9'10'#9'Data de Admissão')
        Font.Color = clBlack
        ParentFont = False
      end
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 228
    Top = 336
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT eventass.*,p.nome,pp.nome,el.matricula,p.numdocumento cp' +
        'f,'
      
        '               pv.nome ,pl.nome,tp.nome,pa.idpessoa,el.dataadmis' +
        'sao '
      '                FROM eventass,pessoa p ,pessoa pp,tpservass tp,'
      
        '                planass pl,planprev pv,pessoa pa, elegpatro el ,' +
        ' partass pat'
      'where'
      'eventass.idplanass = pl.idplanass AND '
      'eventass.idplanoprev = pv.idplanoprev AND '
      'eventass.idtitular = p.idpessoa AND '
      'eventass.iddependente = pp.idpessoa AND '
      'eventass.idservass = tp.idservass AND '
      ' eventass.idpessjur = pa.idpessoa AND '
      '                 el.idpessjur = eventass.idpessjur AND '
      '                 el.idpessoa = eventass.idtitular AND '
      '                 pat.idpessjur = eventass.idpessjur and '
      '                 pat.idpessoa = eventass.idtitular and '
      '                pat.idplanass = pl.idplanass and '
      '                 pat.idplanoprev = pv.idplanoprev '
      ''
      '               ORDER BY EVENTASS.DATAEVENT')
    ControlType.Strings = (
      'FLGREEMBOLSO;CheckBox;Yes;No')
    PictureMasks.Strings = (
      
        'VALOREVENT'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]' +
        ']]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]' +
        ']}'#9'T'#9'T'
      
        'VALORPAGO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]' +
        ']),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]]' +
        '}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 170
    Top = 306
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 285
    Top = 134
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nome, idpessoa  FROM PESSOA'
      'WHERE FLGPATROCINADORA = 1   '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 234
    Top = 238
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  nome, idplanoprev   from  planprev  '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 460
    Top = 244
  end
  object dsplano: TwwDataSource
    DataSet = qryplano
    Left = 529
    Top = 217
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME'
      'FROM PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 570
    Top = 70
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 584
    Top = 112
  end
  object qrytpservass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TPSERVASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 241
    Top = 294
  end
  object dstpservass: TwwDataSource
    DataSet = qrytpservass
    Left = 401
    Top = 275
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDPESSOA '
      'FROM PESSOA WHERE'
      'IDPESSOA IN( SELECT IDFILIALPESSOA FROM FILIALPESSOA)')
    ValidateWithMask = True
    Left = 368
    Top = 275
  end
end
