inherited frmRegAcesso: TfrmRegAcesso
  Left = -5
  Top = 26
  BorderStyle = bsSingle
  Caption = 'Registro de Acesso'
  ClientHeight = 507
  ClientWidth = 790
  Constraints.MinHeight = 532
  Constraints.MinWidth = 798
  FormStyle = fsMDIChild
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 256
    Top = 5
    Width = 533
    Height = 210
  end
  object lblMatricula: TLabel [1]
    Left = 274
    Top = 41
    Width = 506
    Height = 24
    AutoSize = False
    Caption = 'lblMatricula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNome: TLabel [2]
    Left = 274
    Top = 79
    Width = 506
    Height = 24
    AutoSize = False
    Caption = 'lblNome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCCusto: TLabel [3]
    Left = 274
    Top = 126
    Width = 506
    Height = 24
    AutoSize = False
    Caption = 'lblCCusto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCargo: TLabel [4]
    Left = 274
    Top = 169
    Width = 506
    Height = 24
    AutoSize = False
    Caption = 'lblCargo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel [5]
    Left = 256
    Top = 220
    Width = 533
    Height = 62
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel3: TBevel [6]
    Left = 11
    Top = 288
    Width = 778
    Height = 185
    Shape = bsFrame
    Style = bsRaised
  end
  object lblHorarioTrab: TLabel [7]
    Left = 32
    Top = 293
    Width = 738
    Height = 16
    AutoSize = False
    Caption = 'lblHorarioTrab'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel [8]
    Left = 11
    Top = 5
    Width = 236
    Height = 278
  end
  object Label1: TLabel [9]
    Left = 63
    Top = 105
    Width = 129
    Height = 63
    Alignment = taCenter
    AutoSize = False
    Caption = 'Espa'#231'o reservado para Foto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lblMensagem2: TfcLabel [10]
    Left = 330
    Top = 89
    Width = 385
    Height = 33
    AutoSize = False
    Caption = 'Passe o Cart'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TextOptions.Alignment = taCenter
    TextOptions.Shadow.Color = clWhite
    TextOptions.Shadow.Enabled = True
    TextOptions.Shadow.XOffset = 1
    TextOptions.Shadow.YOffset = 1
    TextOptions.VAlignment = vaTop
  end
  object memDocumento: TMemo [11]
    Left = 280
    Top = 476
    Width = 185
    Height = 23
    TabOrder = 6
    OnChange = memDocumentoChange
  end
  object bbtnOk: TBitBtn [12]
    Left = 268
    Top = 228
    Width = 163
    Height = 46
    Caption = ' &Ok'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = bbtnOkClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888002222200
      88888887788888778F88887222222222088888788888888878F887A228822222
      208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
      22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
      22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
      220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
      2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
  object bbtnRejeitar: TBitBtn [13]
    Left = 442
    Top = 228
    Width = 163
    Height = 46
    Caption = ' &Rejeitar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = bbtnRejeitarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888009191900
      88888887788888778F88887991919191088888788888888878F8879919191919
      108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
      19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
      19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
      190878F877787778887887917F919F71908887F88788878887F8879919191919
      1088878F88888888878888799191919108888878FF88888F7888888779999977
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
  object bbtnSair: TBitBtn [14]
    Left = 616
    Top = 228
    Width = 163
    Height = 46
    Cancel = True
    Caption = ' &Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = bbtnSairClick
    Glyph.Data = {
      F6010000424DF601000000000000760000002800000030000000100000000100
      0400000000008001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7F7FF7F00F
      7F88FF7F7FF7F77F7F887FF7F7FF7F7FF7F8F7FF7F7FF0E0FF78F7FF7F7FF7F7
      FF787F7FF7F7FF7F7FF8F7F7FF7F70E607F8F7F7FF7F77F877F8FF7F7FF7F7FF
      7F78000000FF70E66008777777FF77F88778F7FF7F7FF7F7FF78888880F7F0E6
      6078888887F7F7F887F888888066666667888888008880E660788888778887F8
      87F888888066666667888888008880E660788888778887F887F8888880666666
      67888877060880E8607888FF787887F887F8888880666666678880000E6080E0
      607887777F8787F787F888888066666667880EEEEEE600E660787FFFFFF877F8
      87F888888068666667880EEEEEE600E660787FFFFFF877F887F8888880606666
      678880000E6080E6607887777F8787F887F888888066666667888888060880E6
      60788888787887F887F8888880666666678888880088880E607888887788887F
      87F88888806666666788888880888880E078888887888887F7F8888880666666
      678888888000000000888888877777777788888880EEEEEEE788}
    NumGlyphs = 3
  end
  object wwDBGrid1: TwwDBGrid [15]
    Left = 32
    Top = 310
    Width = 738
    Height = 155
    TabStop = False
    DisableThemes = False
    Selected.Strings = (
      'DIASEMANA'#9'12'#9'Dia da Semana'
      'INICIOEXPEDIENTE'#9'15'#9'In'#237'cio do Expediente'
      'INICIOALMOCO'#9'13'#9'In'#237'cio do Intervalo'
      'FINALALMOCO'#9'13'#9'Final do Intervalo'
      'FINALEXPEDIENTE'#9'15'#9'Final do Expediente'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clTeal
    DataSource = dsHorario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
  end
  object pnlDocumento: TPanel [16]
    Left = 11
    Top = 473
    Width = 778
    Height = 30
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lblMensagem: TLabel
      Left = 6
      Top = 2
      Width = 635
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblMensagem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblHora: TLabel
      Left = 656
      Top = 2
      Width = 117
      Height = 23
      AutoSize = False
      Caption = 'lblHora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object imgPessoa: TDBImage [17]
    Left = 15
    Top = 8
    Width = 227
    Height = 271
    BorderStyle = bsNone
    Center = False
    DataField = 'IMAGEM'
    DataSource = dsImg
    ParentShowHint = False
    ShowHint = False
    Stretch = True
    TabOrder = 5
    TabStop = False
    Visible = False
  end
  object pnlTeclado: TPanel [18]
    Left = 330
    Top = 6
    Width = 385
    Height = 33
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
    object Label2: TLabel
      Left = 6
      Top = 3
      Width = 194
      Height = 24
      Caption = 'Tecle a Identifica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDocumento: TEdit
      Left = 203
      Top = 5
      Width = 94
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object bbtnOKteclado: TBitBtn
      Left = 305
      Top = 4
      Width = 30
      Height = 25
      Hint = 'Confirmar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnOKtecladoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
    end
    object bbtnCancTeclado: TBitBtn
      Left = 345
      Top = 4
      Width = 30
      Height = 25
      Hint = 'Limpar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCancTecladoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  object townTelaConfig: TToolWindow97 [19]
    Left = 92
    Top = 164
    Caption = 'Confirme ou Altere a Forma de Opera'#231#227'o desta Esta'#231#227'o'
    CloseButton = False
    ClientAreaHeight = 295
    ClientAreaWidth = 589
    Resizable = False
    TabOrder = 8
    Visible = False
    object btnFecharTelaConfig: TBitBtn
      Left = 482
      Top = 257
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnFecharTelaConfigClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object gbxTurnos: TGroupBox
      Left = 7
      Top = 62
      Width = 574
      Height = 63
      Caption = 'Turnos de Opera'#231#227'o'
      TabOrder = 0
      object Bevel5: TBevel
        Left = 190
        Top = 7
        Width = 3
        Height = 53
      end
      object Bevel6: TBevel
        Left = 381
        Top = 7
        Width = 3
        Height = 53
      end
      object Label10: TLabel
        Left = 8
        Top = 16
        Width = 19
        Height = 13
        Caption = 'Das'
      end
      object Label11: TLabel
        Left = 57
        Top = 16
        Width = 12
        Height = 13
        Caption = #192's'
      end
      object Label12: TLabel
        Left = 104
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label13: TLabel
        Left = 198
        Top = 15
        Width = 19
        Height = 13
        Caption = 'Das'
      end
      object Label14: TLabel
        Left = 247
        Top = 15
        Width = 12
        Height = 13
        Caption = #192's'
      end
      object Label15: TLabel
        Left = 294
        Top = 15
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label16: TLabel
        Left = 391
        Top = 16
        Width = 19
        Height = 13
        Caption = 'Das'
      end
      object Label17: TLabel
        Left = 438
        Top = 16
        Width = 12
        Height = 13
        Caption = #192's'
      end
      object Label18: TLabel
        Left = 485
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object mkedInicio1: TMaskEdit
        Left = 8
        Top = 30
        Width = 40
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object mkedFinal1: TMaskEdit
        Left = 57
        Top = 30
        Width = 40
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edNome1: TEdit
        Left = 104
        Top = 30
        Width = 80
        Height = 21
        TabOrder = 2
      end
      object mkedInicio2: TMaskEdit
        Left = 198
        Top = 30
        Width = 39
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object mkedFinal2: TMaskEdit
        Left = 247
        Top = 30
        Width = 40
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object edNome2: TEdit
        Left = 294
        Top = 30
        Width = 80
        Height = 21
        TabOrder = 5
      end
      object mkedInicio3: TMaskEdit
        Left = 391
        Top = 30
        Width = 38
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 6
        Text = '  :  '
      end
      object mkedFinal3: TMaskEdit
        Left = 438
        Top = 30
        Width = 40
        Height = 21
        EditMask = '99:99;1;_'
        MaxLength = 5
        TabOrder = 7
        Text = '  :  '
      end
      object edNome3: TEdit
        Left = 485
        Top = 30
        Width = 80
        Height = 21
        TabOrder = 8
      end
    end
    object rgHorario: TRadioGroup
      Left = 7
      Top = 3
      Width = 195
      Height = 55
      Caption = 'Verifica Hor'#225'rio de Opera'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Nao')
      TabOrder = 1
      OnClick = rgHorarioClick
    end
    object gbxSerial: TGroupBox
      Left = 69
      Top = 129
      Width = 448
      Height = 103
      Caption = 'Conex'#227'o via Porta Serial'
      TabOrder = 6
      object Label3: TLabel
        Left = 16
        Top = 21
        Width = 53
        Height = 13
        Caption = 'Velocidade'
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 66
        Height = 13
        Caption = 'Bits de Dados'
      end
      object Label5: TLabel
        Left = 16
        Top = 76
        Width = 82
        Height = 13
        Caption = 'Controle de Fluxo'
      end
      object Label6: TLabel
        Left = 241
        Top = 21
        Width = 42
        Height = 13
        Caption = 'Paridade'
      end
      object Label7: TLabel
        Left = 241
        Top = 48
        Width = 69
        Height = 13
        Caption = 'Bits de Parada'
      end
      object Label8: TLabel
        Left = 241
        Top = 76
        Width = 86
        Height = 13
        Caption = 'Tipo Acionamento'
      end
      object cmbVeloc: TComboBox
        Left = 109
        Top = 19
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '110'
          '300'
          '600'
          '1200'
          '2400'
          '4800'
          '9600'
          '10400'
          '14400'
          '19200'
          '28800'
          '38400'
          '56000'
          '57600'
          '115200'
          '128000'
          '256000')
      end
      object cmbBitDado: TComboBox
        Left = 109
        Top = 46
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object cmbFluxo: TComboBox
        Left = 109
        Top = 73
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Desativado'
          'Entrada'
          'Sa'#237'da'
          'Entrada e Sa'#237'da')
      end
      object cmbParidade: TComboBox
        Left = 334
        Top = 19
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'Nenhuma'
          #205'mpar'
          'Par'
          'Marca'
          'Espa'#231'o')
      end
      object cmbBitParada: TComboBox
        Left = 334
        Top = 46
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          '1'
          '1 e 5'
          '2')
      end
      object cmbAcionamento: TwwDBComboBox
        Left = 334
        Top = 73
        Width = 100
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        DropDownWidth = 300
        ItemHeight = 0
        Items.Strings = (
          '00 - sem acionamento'
          '01 - catraca gen'#233'rica c/ sensor'
          '02 - acionamento simples s/ sensor'
          '03 - catraca RODBEL entrada'
          '04 - catraca RODBEL sa'#237'da'
          '05 - catraca RODBEL bidirecional'
          '06 - catraca RODBEL sa'#237'da livre'
          '07 - acionamento simples c/ sensor'
          '08 - catraca '#243'ptica entrada'
          '09 - catraca '#243'ptica sa'#237'da'
          '10 - catraca '#243'ptica bidirecional'
          '11 - catraca '#243'ptica sa'#237'da livre'
          '12 - catraca bidirecional independente do leitor'
          '13 - catraca '#243'ptica bidirecional independente do leitor'
          '14 - catraca bidirecional com um leitor (barras)')
        Sorted = False
        TabOrder = 5
        UnboundDataType = wwDefault
      end
    end
    object gbxMensagem: TGroupBox
      Left = 69
      Top = 236
      Width = 160
      Height = 55
      Caption = 'Mensagem Padr'#227'o no Visor'
      TabOrder = 7
      object edMensagemPadrao: TEdit
        Left = 29
        Top = 22
        Width = 102
        Height = 21
        TabOrder = 0
      end
    end
    object gbxTempoEspera: TGroupBox
      Left = 249
      Top = 236
      Width = 216
      Height = 55
      Hint = 'Tempo em milisegundos em que a Tela Exibe Dados da Pessoa'
      Caption = 'Tempo de Espera Exibindo Tela (mseg)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      object spedTempo: TSpinEdit
        Left = 57
        Top = 22
        Width = 102
        Height = 22
        Increment = 500
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 2000
      end
    end
    object rgPontoAcesso: TRadioGroup
      Left = 388
      Top = 3
      Width = 193
      Height = 55
      Caption = 'Operar Como'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ponto'
        'Acesso')
      TabOrder = 5
      OnClick = rgHorarioClick
    end
    object chkLOG: TCheckBox
      Left = 207
      Top = 8
      Width = 78
      Height = 17
      Caption = 'Gerar Log'
      TabOrder = 2
    end
    object cbxTolerancia: TCheckBox
      Left = 207
      Top = 33
      Width = 89
      Height = 17
      Hint = 
        'Verifica Toler'#226'ncia na Entrada (Hor'#225'rio da Pessoa) para Avisar o' +
        'u Bloquear Acesso ?'
      Caption = 'Toler. Entrada'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = cbxToleranciaClick
    end
    object gbxMin: TGroupBox
      Left = 297
      Top = 17
      Width = 86
      Height = 41
      TabOrder = 4
      Visible = False
      object Label9: TLabel
        Left = 58
        Top = 16
        Width = 19
        Height = 13
        Caption = 'min.'
      end
      object spedMin: TSpinEdit
        Left = 9
        Top = 12
        Width = 46
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 0
        Value = 0
      end
    end
  end
  inherited ivTradutor: TIvTranslator
    Left = 744
    Top = 329
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        '*'
        'Filter'
        0))
  end
  inherited ivTradutorPadrao: TIvTranslator
    Left = 746
    Top = 383
    TargetsData = (
      1
      1
      (
        '*'
        'Filter'
        0))
  end
  object dsImg: TwwDataSource
    DataSet = CdsImg
    Left = 194
    Top = 230
  end
  object CdsImg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 150
    Top = 230
  end
  object dsHorario: TwwDataSource
    DataSet = CdsHorario
    Left = 98
    Top = 230
  end
  object CdsHorario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 46
    Top = 230
  end
  object tmHoraAtual: TTimer
    Enabled = False
    Left = 176
    Top = 65
  end
  object CdsAcessoFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 50
    Top = 64
  end
  object tmInterrogacao: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmInterrogacaoTimer
    Left = 176
    Top = 17
  end
  object CdsHorarioVariavel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 50
    Top = 17
  end
  object CdsFuncionario: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 50
    Top = 111
  end
  object CdsFunc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 50
    Top = 159
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 175
    Top = 118
  end
end
