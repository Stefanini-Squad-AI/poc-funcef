inherited frmIntegraDiasMT: TfrmIntegraDiasMT
  Left = 137
  Top = 129
  Caption = 'Integração por Data'
  ClientHeight = 313
  ClientWidth = 415
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 274
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 114
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 292
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Integrar até'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 24
      Top = 101
      Width = 361
      Height = 9
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 24
      Top = 238
      Width = 37
      Height = 13
      Caption = 'Conta : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object spdTodos: TSpeedButton
      Left = 304
      Top = 120
      Width = 81
      Height = 33
      Caption = '&Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
        000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
        770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
        990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
        0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
        99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
        FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
        FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spdTodosClick
    end
    object spdInverter: TSpeedButton
      Left = 304
      Top = 160
      Width = 81
      Height = 33
      Caption = '&Inverter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
        7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
        7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
        7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
        FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
        00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
        0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
        FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spdInverterClick
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkExercicioCloseUp
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 114
      Top = 40
      Width = 170
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PEREXERCI'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkPeriodoCloseUp
    end
    object pgrIntegracao: TProgressBar
      Left = 213
      Top = 234
      Width = 169
      Height = 17
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
    object edDataProc: TCMDateTimePicker
      Left = 292
      Top = 40
      Width = 102
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
      ShowButton = True
      TabOrder = 3
    end
    object dbchkbloqint: TCheckBox
      Left = 24
      Top = 72
      Width = 177
      Height = 17
      Caption = 'Bloquear para integração'
      TabOrder = 4
    end
    object mskConta: TMaskEdit
      Left = 64
      Top = 236
      Width = 105
      Height = 15
      TabStop = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object clbModulo: TCheckListBox
      Left = 24
      Top = 120
      Width = 257
      Height = 105
      ItemHeight = 13
      TabOrder = 6
    end
    object Anim: TAnimate
      Left = 64
      Top = 237
      Width = 16
      Height = 16
      Active = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 274
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 165
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object btnIntegrar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Integrar'
        TabOrder = 2
        OnClick = btnIntegrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F88887555555555088888788888888878F887D558855555
          508887F88FFF888887F887D5FFF8555550888788777FF888878F7D55FFFF8555
          55087F887777FF88887F7D55FFFFF85555087F8877777FF8887F7D55FF8FFF85
          55087F8877F777FF887F7D55FF85FFF855087F8877F8777F887F7D55FF555FF8
          550878F87788877FF87887D5555555FF508887F88888887787F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 266
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 93
    Top = 93
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 227
    Top = 93
  end
  object cdsModulo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 93
  end
end
