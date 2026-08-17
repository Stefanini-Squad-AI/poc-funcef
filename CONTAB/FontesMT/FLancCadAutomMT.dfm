inherited frmLancCadAutomMT: TfrmLancCadAutomMT
  Left = 140
  Top = 88
  Caption = 'Lançamento Automático'
  ClientHeight = 440
  ClientWidth = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 409
    Height = 401
    object Label14: TLabel
      Left = 24
      Top = 15
      Width = 101
      Height = 13
      Caption = 'Data Lançamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 141
      Top = 15
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
      Left = 245
      Top = 15
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
    object spdTodos: TSpeedButton
      Left = 24
      Top = 199
      Width = 80
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
      Left = 108
      Top = 199
      Width = 80
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
    object lblComecaCom: TLabel
      Left = 224
      Top = 198
      Width = 137
      Height = 13
      Caption = 'Marcar Começando com'
    end
    object Label1: TLabel
      Left = 24
      Top = 264
      Width = 98
      Height = 13
      Caption = 'Planilhas Criadas'
    end
    object btnMarcarFiltro: TSpeedButton
      Left = 368
      Top = 214
      Width = 20
      Height = 20
      Hint = 'Marcar com filtro'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMarcarFiltroClick
    end
    object edDataProc: TCMDateTimePicker
      Left = 24
      Top = 31
      Width = 103
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
      OnExit = edDataProcExit
    end
    object dblkExerc: TwwDBLookupCombo
      Left = 141
      Top = 31
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      DataField = 'PEREXERCI'
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkExercCloseUp
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 246
      Top = 31
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'PERNOME')
      DataField = 'PERNUMERO'
      LookupTable = CdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cbRateiaUnidx: TCheckBox
      Left = 304
      Top = -2
      Width = 338
      Height = 17
      Caption = 'Rateia Lançamentos por Atividade/Projeto'
      TabOrder = 3
      Visible = False
    end
    object clbModulo: TCheckListBox
      Left = 24
      Top = 64
      Width = 367
      Height = 128
      ItemHeight = 13
      TabOrder = 4
    end
    object edComecaCom: TEdit
      Left = 248
      Top = 213
      Width = 119
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object mmTxt: TRichEdit
      Left = 24
      Top = 280
      Width = 367
      Height = 113
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 1200
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object pgrAutomatico: TProgressBar
      Left = 24
      Top = 242
      Width = 367
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 8
    end
    object Anim: TAnimate
      Left = 25
      Top = 237
      Width = 27
      Height = 27
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 23
      Visible = False
    end
    object cbRateiaPlanoPatrox: TCheckBox
      Left = 304
      Top = 14
      Width = 338
      Height = 17
      Caption = 'Rateia Lançamentos por Plano/Patro'
      TabOrder = 10
      Visible = False
    end
    object edtFase: TEdit
      Left = 224
      Top = 213
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 409
    inherited tb97Fundo: TToolbar97
      Left = 237
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 68
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 387
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 96
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 96
  end
  object cdsPlaAutomaticas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 96
  end
  object ds: TwwDataSource
    DataSet = cdsPlaAutomaticas
    Left = 88
    Top = 144
  end
end
