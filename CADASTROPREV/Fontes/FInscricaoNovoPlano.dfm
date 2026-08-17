inherited frmInscricaoNovoPlano: TfrmInscricaoNovoPlano
  Left = 295
  Top = 167
  HelpContext = 3360017
  Caption = 'Saldamento e Inscrição Novo Plano - Funcef'
  ClientHeight = 544
  ClientWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 505
    object GroupBox1: TGroupBox
      Left = 1
      Top = 90
      Width = 764
      Height = 90
      Align = alTop
      Caption = ' Arquivo de Entrada '
      TabOrder = 0
      object lblPathArqProc: TLabel
        Left = 14
        Top = 18
        Width = 165
        Height = 13
        Caption = 'Indique o arquivo de entrada'
      end
      object Label1: TLabel
        Left = 14
        Top = 63
        Width = 317
        Height = 13
        Caption = 'ATENÇÃO : OS ARQUIVOS DEVEM CONTER O FORMATO .TXT'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lblArqGravar: TLabel
        Left = 391
        Top = 63
        Width = 97
        Height = 13
        Caption = 'Nome do arquivo'
      end
      object spedArqGravar: TSpeedButton
        Left = 717
        Top = 33
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = spedArqGravarClick
      end
      object sbtnTabCargos: TSpeedButton
        Left = 340
        Top = 33
        Width = 22
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = sbtnTabCargosClick
      end
      object Label2: TLabel
        Left = 392
        Top = 18
        Width = 261
        Height = 13
        Caption = 'Indique o Caminho para os Arquivos de Saída'
      end
      object Label3: TLabel
        Left = 687
        Top = 63
        Width = 26
        Height = 13
        Caption = '.bad'
      end
      object edCaminhoEntrada: TEdit
        Left = 14
        Top = 34
        Width = 324
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edArqGravar: TEdit
        Left = 390
        Top = 34
        Width = 327
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object ednomearq: TEdit
        Left = 496
        Top = 60
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 326
      Width = 764
      Height = 178
      Align = alBottom
      Caption = ' Log de Erro  '
      TabOrder = 1
      object lblBarraProgresso: TLabel
        Left = 2
        Top = 147
        Width = 760
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Caption = 'Aguarde, Processando ....'
        Visible = False
      end
      object pBar: TProgressBar
        Left = 2
        Top = 160
        Width = 760
        Height = 16
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 720
        Top = 15
        Width = 42
        Height = 132
        Align = alRight
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 10
          Top = 8
          Width = 27
          Height = 26
          Glyph.Data = {
            66030000424D6603000000000000360000002800000010000000110000000100
            18000000000030030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000007F7F7F0000007F7F
            7F7F7F7F000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF000000000000BFBFBF000000BFBFBFBFBFBF000000000000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBF
            BFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000000000FFFFFF000000000000FFFFFF000000000000BF
            BFBF000000FF0000FF0000FF00000000FFFF0000FF0000000000000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBF0000FF0000
            FF0000FFBFBFBFBFBFBF000000FFFFFF000000000000000000000000FFFFFF00
            0000FFFFFF0000000000FF0000FF0000FF0000FF0000FFBFBFBF000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF000000FFFFFF000000000000FFFFFF00000000000000
            0000000000000000BFBFBF0000FF0000FF0000FFBFBFBFBFBFBF000000FFFFFF
            FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000BFBFBFBFBFBF0000FF0000
            FF0000FFBFBFBFBFBFBF000000FFFFFF000000BFBFBFFFFFFF000000FFFFFF00
            0000BFBFBFBFBFBF7F7F7F0000FF0000FF0000FFBFBFBFBFBFBF000000FFFFFF
            FFFFFFFFFFFFFFFFFF000000000000BFBFBF0000FF0000FF0000FF0000FF0000
            FFBFBFBFBFBFBFBFBFBF000000000000000000000000000000000000BFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF}
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 10
          Top = 40
          Width = 27
          Height = 26
          Glyph.Data = {
            76050000424D7605000000000000360000002800000015000000150000000100
            18000000000040050000FE100000FE1000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            5151515151515151515151515151515151515151515151515151515151515151
            5100000000000000000000000000000000000000000000000000000000000000
            515151C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C05151
            5151515100000000000000000000000000000000000000000000000000515151
            515151515151515151515151515151515151515151515151515151515151C0C0
            C051515151515100000000000000000000000000000000000000000000515151
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C051515100000000000000000000000000000000000000000000515151
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF00FF00C0C0
            C0C0C0C051515100000000000000000000000000000000000000000000515151
            5151515151515151515151515151515151515151515151515151515151515151
            51515151C0C0C051515100000000000000000000000000000000000000000000
            515151C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0515151C0C0C05151
            51C0C0C051515151515100000000000000000000000000000000000000000000
            000000515151515151515151515151515151515151515151515151515151C0C0
            C0515151C0C0C051515100000000000000000000000000000000000000000000
            000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00C0C0C0515151C0C0C000000000000000000000000000000000000000000000
            000000000000000000FFFFFF515151515151515151515151515151FFFFFF0000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000FFFFFF515151515151515151515151515151FFFF
            FF00000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          OnClick = SpeedButton2Click
        end
      end
      object memresult: TRichEdit
        Left = 2
        Top = 15
        Width = 718
        Height = 132
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
        WordWrap = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 259
      Width = 764
      Height = 67
      Align = alTop
      Caption = ' Dados de Saída '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lblregprocesso: TLabel
        Left = 13
        Top = 21
        Width = 110
        Height = 13
        Caption = 'Registros processados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblrejeitadosproc: TLabel
        Left = 13
        Top = 43
        Width = 156
        Height = 13
        Caption = 'Registros rejeitados no processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblregerro: TLabel
        Left = 357
        Top = 21
        Width = 91
        Height = 13
        Caption = 'Registros com erro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object memdesc: TMemo
      Left = 1
      Top = 1
      Width = 764
      Height = 89
      Align = alTop
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        
          'Esta tela de importação tem como objetivo tratar arquivo de entr' +
          'ada de participantes no processo de inscrições '
        'no Novo Plano da Funcef.'
        ''
        
          'APENAS os participantes ATIVOS REPLAN e NÃO PARTICIPANTES são tr' +
          'atados nesta função.'
        'Ativos Replan: '
        
          '(1)Colocar situação no Replan como CANCELADO PELO INSTITUTO DE P' +
          'ORTABILIDADE; '
        '(2)Inserir evento de saldamento, PORTABILIDADE;'
        
          '(3)Inscrever o participante no Novo Plano, associando reservas e' +
          ' contribuições.'
        ''
        'Não inscritos:'
        
          'Inscrever o participante no Novo Plano, associando reservas e co' +
          'ntribuições.'
        ''
        'A função não efetua cálculos de nenhuma espécie.'
        
          'Os dados de reserva e benefício de saldamento devem ser carregad' +
          'os fora'
        'sistema para os participantes Replan.'
        ' ')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
      WordWrap = False
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 180
      Width = 764
      Height = 79
      Align = alTop
      Caption = 'Dados de entrada  (Check básico do arquivo)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object lblregcheck: TLabel
        Left = 13
        Top = 21
        Width = 154
        Height = 13
        Caption = 'Registros no arquivo de entrada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblrejeitadoscheck: TLabel
        Left = 13
        Top = 43
        Width = 150
        Height = 13
        Caption = 'Registros rejeitados na seleção:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton3: TSpeedButton
        Left = 392
        Top = 21
        Width = 113
        Height = 41
        Caption = 'Check prévio'
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
        OnClick = SpeedButton3Click
      end
      object Memo1: TMemo
        Left = 552
        Top = 15
        Width = 210
        Height = 62
        Align = alRight
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'LAYOUT'
          '                         INICIO    TAMANHO'
          ' MATRICULA         1    ,        7'
          ' NOME                   8    ,      40'
          ' CPF                     48    ,      11'
          ' SEXO                  59    ,        1'
          ' DTNASC             60    ,      10'
          ' PERCENTUAL    70    ,        4')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 505
    Width = 766
    object Label4: TLabel [0]
      Left = 10
      Top = 11
      Width = 88
      Height = 13
      Caption = 'Commit a cada '
    end
    object Label5: TLabel [1]
      Left = 174
      Top = 11
      Width = 53
      Height = 13
      Caption = 'registros.'
    end
    inherited tb97Fundo: TToolbar97
      Left = 576
      DockPos = 761
      inherited sep1: TToolbarSep97
        Left = 183
      end
      inherited sep3: TToolbarSep97
        Left = 90
      end
      inherited bbtnSair: TBitBtn
        Width = 90
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 90
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 296
      DockPos = 478
      inherited ToolbarSep971: TToolbarSep97
        Left = 183
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 90
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 186
        Width = 90
        OnClick = bbtnCancelarClick
      end
      object BitBtn1: TBitBtn
        Left = 93
        Top = 0
        Width = 90
        Height = 33
        Caption = '&Desfazer'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = BitBtn1Click
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
    object Spin: TSpinEdit
      Left = 99
      Top = 8
      Width = 71
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = SpinChange
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 235
    Top = 380
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object ProcuraDirDlg1: TProcuraDirDlg
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    ShowPath = False
    Left = 663
    Top = 111
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 554
    Top = 385
  end
  object sqlParam: TCMSqlParams
    Left = 327
    Top = 380
  end
  object cdsBuscaPessoa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 384
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 384
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 740
    Top = 417
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 341
    Top = 137
  end
  object qryupdate: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 610
    Top = 385
  end
end
