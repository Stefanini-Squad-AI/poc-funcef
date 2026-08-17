inherited frmSelEstAval: TfrmSelEstAval
  Left = 255
  Top = 143
  Caption = 'Estatística de Avaliações'
  ClientHeight = 341
  ClientWidth = 334
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 26
    Top = 60
    Width = 104
    Height = 13
    Caption = 'Tipo de Avaliação'
  end
  inherited pnlFundo: TPanel
    Width = 334
    Height = 302
    BorderWidth = 2
  end
  inherited Dock971: TDock97
    Top = 302
    Width = 334
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  object gbxFaixaData: TGroupBox [3]
    Left = 37
    Top = 6
    Width = 256
    Height = 46
    Caption = 'Faixa de Datas'
    TabOrder = 1
    object Label1: TLabel
      Left = 124
      Top = 22
      Width = 8
      Height = 13
      Caption = 'a'
    end
    object EdData1: TCMDateTimePicker
      Left = 10
      Top = 16
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
      TabOrder = 0
      OnChange = EdData1Change
    end
    object EdData2: TCMDateTimePicker
      Left = 145
      Top = 16
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
      TabOrder = 1
      OnChange = EdData1Change
    end
  end
  object gbxValores: TGroupBox [4]
    Left = 22
    Top = 103
    Width = 289
    Height = 190
    Hint = 'Valores Mínimo e Máximo para a Classificação Estatística'
    Caption = 'Faixas de Pontuação'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object Label2: TLabel
      Left = 33
      Top = 18
      Width = 42
      Height = 13
      Caption = 'Faixa 1'
    end
    object Label3: TLabel
      Left = 33
      Top = 39
      Width = 42
      Height = 13
      Caption = 'Faixa 2'
    end
    object Label4: TLabel
      Left = 33
      Top = 60
      Width = 42
      Height = 13
      Caption = 'Faixa 3'
    end
    object Label5: TLabel
      Left = 33
      Top = 81
      Width = 42
      Height = 13
      Caption = 'Faixa 4'
    end
    object Label6: TLabel
      Left = 33
      Top = 102
      Width = 42
      Height = 13
      Caption = 'Faixa 5'
    end
    object Label7: TLabel
      Left = 33
      Top = 123
      Width = 42
      Height = 13
      Caption = 'Faixa 6'
    end
    object Label8: TLabel
      Left = 33
      Top = 144
      Width = 42
      Height = 13
      Caption = 'Faixa 7'
    end
    object Label9: TLabel
      Left = 33
      Top = 165
      Width = 42
      Height = 13
      Caption = 'Faixa 8'
    end
    object ednMin1: TEditNum
      Left = 114
      Top = 18
      Width = 64
      Height = 21
      TabOrder = 0
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax1: TEditNum
      Left = 195
      Top = 18
      Width = 64
      Height = 21
      TabOrder = 1
      OnChange = EdData1Change
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax2: TEditNum
      Left = 195
      Top = 39
      Width = 64
      Height = 21
      TabOrder = 3
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin2: TEditNum
      Left = 114
      Top = 39
      Width = 64
      Height = 21
      TabOrder = 2
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax3: TEditNum
      Left = 195
      Top = 60
      Width = 64
      Height = 21
      TabOrder = 5
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin3: TEditNum
      Left = 114
      Top = 60
      Width = 64
      Height = 21
      TabOrder = 4
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax4: TEditNum
      Left = 195
      Top = 81
      Width = 64
      Height = 21
      TabOrder = 7
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin4: TEditNum
      Left = 114
      Top = 81
      Width = 64
      Height = 21
      TabOrder = 6
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax5: TEditNum
      Left = 195
      Top = 102
      Width = 64
      Height = 21
      TabOrder = 9
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin5: TEditNum
      Left = 114
      Top = 102
      Width = 64
      Height = 21
      TabOrder = 8
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax6: TEditNum
      Left = 195
      Top = 123
      Width = 64
      Height = 21
      TabOrder = 11
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin6: TEditNum
      Left = 114
      Top = 123
      Width = 64
      Height = 21
      TabOrder = 10
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax7: TEditNum
      Left = 195
      Top = 144
      Width = 64
      Height = 21
      TabOrder = 13
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin7: TEditNum
      Left = 114
      Top = 144
      Width = 64
      Height = 21
      TabOrder = 12
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMax8: TEditNum
      Left = 195
      Top = 165
      Width = 64
      Height = 21
      TabOrder = 15
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
    object ednMin8: TEditNum
      Left = 114
      Top = 165
      Width = 64
      Height = 21
      TabOrder = 14
      IntDigits = 8
      Signal = False
      DecDigits = 0
      Numeric = True
    end
  end
  object dblcTipoAval: TwwDBLookupCombo [5]
    Left = 37
    Top = 75
    Width = 256
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
    DataField = 'CODTIPOAVAL'
    LookupTable = qryTipAval
    LookupField = 'CODTIPOAVAL'
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    AllowClearKey = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
    Top = 203
  end
  object qryTipAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODTIPOAVAL, DESCRTIPOAVAL from TIPOAVAL'
      'order by DESCRTIPOAVAL')
    ValidateWithMask = True
    Left = 88
    Top = 203
  end
end
