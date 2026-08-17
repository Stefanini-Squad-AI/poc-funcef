inherited frmRegHoras: TfrmRegHoras
  Left = 24
  Top = 91
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Registro de Horas Extras e Atrasos'
  ClientHeight = 450
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 42
    Width = 760
    Height = 369
    BorderWidth = 2
    object Label3: TLabel
      Left = 176
      Top = 17
      Width = 68
      Height = 13
      Caption = 'Período de:'
    end
    object Label4: TLabel
      Left = 203
      Top = 56
      Width = 13
      Height = 13
      Caption = 'A:'
    end
    object stgrHoras: TStringGrid
      Left = 275
      Top = 4
      Width = 481
      Height = 361
      Align = alRight
      DefaultColWidth = 91
      DefaultRowHeight = 20
      RowCount = 32
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = stgrHorasSelectCell
      OnSetEditText = stgrHorasSetEditText
    end
    object Data1: TCMDateTimePicker
      Left = 162
      Top = 32
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
    end
    object Data2: TCMDateTimePicker
      Left = 162
      Top = 71
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
      TabOrder = 2
    end
    object gbxApuracao: TGroupBox
      Left = 162
      Top = 98
      Width = 100
      Height = 255
      TabOrder = 3
      object Label5: TLabel
        Left = 9
        Top = 9
        Width = 43
        Height = 13
        Caption = 'Atrasos'
      end
      object Label6: TLabel
        Left = 9
        Top = 54
        Width = 73
        Height = 13
        Caption = 'Horas Extras'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 45
        Width = 100
        Height = 4
      end
      object Label7: TLabel
        Left = 9
        Top = 69
        Width = 24
        Height = 13
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 9
        Top = 102
        Width = 36
        Height = 13
        Caption = 'Diurnas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 9
        Top = 135
        Width = 43
        Height = 13
        Caption = 'Noturnas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 9
        Top = 168
        Width = 69
        Height = 13
        Caption = 'Extraordinárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 9
        Top = 213
        Width = 79
        Height = 13
        Caption = 'Adic. Noturno'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 207
        Width = 100
        Height = 4
      end
      object edAtraso: TEdit
        Left = 9
        Top = 21
        Width = 80
        Height = 21
        TabOrder = 0
      end
      object edHoraExtra: TEdit
        Left = 9
        Top = 81
        Width = 80
        Height = 21
        TabOrder = 1
      end
      object edDiurna: TEdit
        Left = 9
        Top = 114
        Width = 80
        Height = 21
        TabOrder = 2
      end
      object edNoturna: TEdit
        Left = 9
        Top = 147
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object edFolga: TEdit
        Left = 9
        Top = 180
        Width = 80
        Height = 21
        TabOrder = 4
      end
      object edAdicNot: TEdit
        Left = 9
        Top = 225
        Width = 80
        Height = 21
        TabOrder = 5
      end
    end
    object gbxOpcEscala: TGroupBox
      Left = 12
      Top = 190
      Width = 141
      Height = 160
      Caption = 'Considera Descanso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
      object cbxSabado: TCheckBox
        Left = 8
        Top = 30
        Width = 97
        Height = 17
        Caption = 'Sábado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbxDomingo: TCheckBox
        Left = 8
        Top = 60
        Width = 97
        Height = 17
        Caption = 'Domingo'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object cbxFeriadoOrd: TCheckBox
        Left = 8
        Top = 90
        Width = 125
        Height = 17
        Caption = 'Feriado Ordinário'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
      object cbxFeriadoExtra: TCheckBox
        Left = 8
        Top = 120
        Width = 125
        Height = 17
        Caption = 'Feriado Extraordinário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object rgLimiteDiurnas: TRadioGroup
      Left = 12
      Top = 16
      Width = 141
      Height = 160
      Caption = 'Limite H.E. Diurna'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Apenas Antes Exped.'
        'Apenas Após Exped.'
        'Ambos os Limites')
      ParentFont = False
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 590
      DockPos = 598
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 423
      DockPos = 431
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object bbtnLancar: TBitBtn
      Left = 30
      Top = 3
      Width = 80
      Height = 33
      Hint = 'Efetiva os Lançamentos'
      Cancel = True
      Caption = '&Lançar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnLancarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      Spacing = 2
    end
    object bbtnSalvar: TBitBtn
      Left = 110
      Top = 3
      Width = 80
      Height = 33
      Hint = 'Salva a Tela em Arquivo'
      Cancel = True
      Caption = 'Sal&var'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnSalvarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 2
    end
    object bbtnCarregar: TBitBtn
      Left = 190
      Top = 3
      Width = 80
      Height = 33
      Hint = 'Carrega a Tela Salva Anteriormente'
      Cancel = True
      Caption = 'Ca&rregar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnCarregarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      Spacing = 2
    end
    object bbtnImprimir: TBitBtn
      Left = 270
      Top = 3
      Width = 80
      Height = 33
      Hint = 'Imprimir a Tela'
      Cancel = True
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 760
    Height = 42
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 174
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object lblSituacao: TLabel
      Left = 571
      Top = 13
      Width = 72
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = '(Efetivo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbtnProcurar: TSpeedButton
      Left = 649
      Top = 7
      Width = 103
      Height = 28
      AllowAllUp = True
      GroupIndex = 1
      Caption = '   &Procurar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object dbedMatric: TDBEdit
      Left = 67
      Top = 11
      Width = 97
      Height = 21
      Color = clGray
      DataField = 'MATRICULA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedNome: TDBEdit
      Left = 211
      Top = 11
      Width = 355
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 515
    Top = 307
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ds: TwwDataSource
    DataSet = qryFuncio
    Left = 495
    Top = 210
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 402
    Top = 192
  end
  object tblHorario: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDHORARIO'
    MasterFields = 'IDHORARIO'
    MasterSource = ds
    TableName = 'CM.HORATRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 405
    Top = 140
  end
  object tblTurnoSem: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDDIASEMANA;IDHORARIO'
    TableName = 'CM.TURNOSEM'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 399
    Top = 94
  end
  object tblTurnoDia: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDTURNODIARIO'
    MasterFields = 'IDTURNODIARIO'
    MasterSource = dsTur
    TableName = 'CM.TURNODIA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 500
    Top = 92
  end
  object dsTur: TwwDataSource
    DataSet = tblTurnoSem
    Left = 399
    Top = 82
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 500
    Top = 141
  end
  object qryFuncio: TwwQuery
    AfterScroll = qryFuncioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      
        '  F.IdPessoa, F.Matricula, F.IdEstab, F.IdHorario, F.DataRefHora' +
        'rio,'
      '  F.IdEmpresa,'
      '  PEFIS.Sexo, PF.Nome, ST.TipoSit, E.IdCidades,'
      '  DECODE(C.IdPais,NULL,E.IDPAIS,C.IdPais) AS IdPais,'
      '  RTRIM(ES.CodEstado) AS UF'
      'from'
      
        '  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONAR' +
        'IO F,'
      '  SITFUNC ST, CIDADES C, ESTADO ES'
      'where'
      '  (F.IdPessoa        = :IdPessoa)      AND'
      '  (F.IdSitFunc       = ST.IdSitFunc)   AND'
      '  (F.IdPessoa        = PF.IdPessoa)    AND'
      '  (F.IdPessoa        = PEFIS.IdPessoa) AND'
      '  (F.IdEstab         = PJ.IdPessoa)    AND'
      '  (PJ.IdEndComercial = E.IdEndereco)   AND'
      '  (PJ.IdPessoa       = E.IdPessoa)     AND'
      '  (E.IdCidades       = C.IdCidades)    AND'
      '  (C.IdEstado        = ES.IdEstado)')
    ValidateWithMask = True
    Left = 495
    Top = 198
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryFeriado: TwwQuery
    AfterScroll = qryFuncioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 559
    Top = 142
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar a Grade de Horas da Tela'
    Left = 585
    Top = 362
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Carregar Grade de Horas Salva Anteriormente'
    Left = 528
    Top = 366
  end
  object qryFerias: TwwQuery
    AfterScroll = qryFuncioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT INIGOZOFERIAS, FIMGOZOFERIAS '
      'FROM FERIAS '
      'WHERE INIGOZOFERIAS <= :data2'
      'AND      FIMGOZOFERIAS >= :data1'
      'AND      IDPESSOA              = :IdPessoa')
    ValidateWithMask = True
    Left = 559
    Top = 86
    ParamData = <
      item
        DataType = ftDate
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object GImp: TGImp
    DataBaseName = 'BASEDADOS'
    TipoFonte = TfNormal
    MostraPrinterSetup = False
    EjetarPagina = False
    Condensado = True
    Sublinhado = False
    SaltodeLinhaCondensado = True
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 448
    Top = 308
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 445
    Top = 368
  end
end
