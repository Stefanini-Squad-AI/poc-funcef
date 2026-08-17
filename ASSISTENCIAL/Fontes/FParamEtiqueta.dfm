inherited frmParamEtiqueta: TfrmParamEtiqueta
  Left = 54
  Top = 93
  Caption = 'Parâmetros Para Emissão de Etiquetas'
  ClientHeight = 426
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 513
    Align = alNone
    object Label6: TLabel
      Left = 402
      Top = 168
      Width = 139
      Height = 13
      Caption = 'Tipo Padrão de Etiqueta'
    end
    object ListBox1: TListBox
      Left = 408
      Top = 187
      Width = 137
      Height = 147
      ItemHeight = 13
      Items.Strings = (
        'A4 21 X 29 mm'
        'A4 23 X 30 mm'
        'A4 25 X 33 mm'
        'A4 25 X 25 mm'
        'Personalizada')
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object GroupBox2: TGroupBox
      Left = 264
      Top = 16
      Width = 281
      Height = 145
      Caption = 'Configurações'
      TabOrder = 1
      object Label7: TLabel
        Left = 24
        Top = 27
        Width = 52
        Height = 13
        Caption = 'Largura :'
      end
      object Label10: TLabel
        Left = 26
        Top = 53
        Width = 42
        Height = 13
        Caption = 'Altura :'
      end
      object Label11: TLabel
        Left = 26
        Top = 80
        Width = 128
        Height = 13
        Caption = 'Etiquetas Por Página :'
      end
      object bitbtn: TSpeedButton
        Left = 192
        Top = 112
        Width = 73
        Height = 25
        Caption = 'Novo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = BitBtn1Click
      end
      object edLargura: TEdit
        Left = 166
        Top = 21
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edAltura: TEdit
        Left = 166
        Top = 49
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edpag: TEdit
        Left = 166
        Top = 77
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object CheckBox1: TCheckBox
        Left = 26
        Top = 105
        Width = 153
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Imprimir com Linhas ?'
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 379
      DockPos = 379
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 211
      DockPos = 211
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    object rbtnimprimir: TBitBtn
      Left = 216
      Top = 2
      Width = 75
      Height = 33
      Caption = 'Imprimir'
      TabOrder = 2
      OnClick = rbtnimprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object rbtnvisualizar: TBitBtn
      Left = 296
      Top = 2
      Width = 81
      Height = 33
      Caption = 'Visualizar'
      TabOrder = 3
      OnClick = rbtnvisualizarClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 11
    Top = 10
    Width = 246
    Height = 151
    TabOrder = 2
    object LABEL1: TLabel
      Left = 6
      Top = 15
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object label4: TLabel
      Left = 7
      Top = 58
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label13: TLabel
      Left = 7
      Top = 100
      Width = 104
      Height = 13
      Caption = 'Plano Assistencial'
    end
    object dblkpcmbPatro: TwwDBLookupCombo
      Left = 6
      Top = 30
      Width = 229
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryPatro
      LookupField = 'NOME'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblkpcmbPlano: TwwDBLookupCombo
      Left = 6
      Top = 72
      Width = 229
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      LookupTable = qryPlano
      LookupField = 'NOME'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblkpcmbPlanass: TwwDBLookupCombo
      Left = 7
      Top = 114
      Width = 229
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
    end
  end
  object GroupBox5: TGroupBox [3]
    Left = 9
    Top = 162
    Width = 292
    Height = 220
    TabOrder = 3
    object Label3: TLabel
      Left = 7
      Top = 179
      Width = 141
      Height = 13
      Caption = 'Situação do Participante'
    end
    object Label15: TLabel
      Left = 8
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label12: TLabel
      Left = 147
      Top = 9
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 84
      Width = 274
      Height = 92
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 10
        Width = 124
        Height = 13
        Caption = 'Inscrição Assistencial'
      end
      object Label9: TLabel
        Left = 151
        Top = 10
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label5: TLabel
        Left = 6
        Top = 50
        Width = 138
        Height = 13
        Caption = 'Inscrição Previdenciária'
      end
      object Label16: TLabel
        Left = 151
        Top = 50
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object edNumInsc: TEdit
        Left = 6
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object mskdlgDataInsc: TCMDateTimePicker
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
    object dblkpcmbSituacao: TwwDBLookupCombo
      Left = 7
      Top = 194
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      LookupTable = qrySitPart
      LookupField = 'DESCRICAO'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object edmatricula: TEdit
      Left = 8
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edcpf: TEdit
      Left = 147
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object ednome: TEdit
      Left = 8
      Top = 59
      Width = 262
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 507
    Top = 347
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from planass'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 314
    Top = 227
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 362
    Top = 243
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 365
    Top = 200
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 346
    Top = 275
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS IDSITPART,DESCRICAO'
      'FROM SITPLANOASS'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 332
    Top = 336
  end
end
