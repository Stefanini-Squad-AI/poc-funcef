inherited frmSeparadorArqFuncef: TfrmSeparadorArqFuncef
  Left = 161
  Top = 126
  HelpContext = 3360022
  Caption = 
    'Conversão de LayOut de Arquivos Cadastrais da CAIXA para Interfa' +
    'cePREV'
  ClientHeight = 458
  ClientWidth = 686
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 686
    Height = 419
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 684
      Height = 77
      Align = alTop
      Caption = ' Arquivos de Entrada '
      TabOrder = 0
      object lblPathArqProc: TLabel
        Left = 14
        Top = 18
        Width = 249
        Height = 13
        Caption = 'Indique o Caminho dos Arquivos de Entrada'
      end
      object btnArqProcessar: TSpeedButton
        Left = 380
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
        OnClick = btnArqProcessarClick
      end
      object Label1: TLabel
        Left = 14
        Top = 60
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
      object Label2: TLabel
        Left = 417
        Top = 18
        Width = 246
        Height = 13
        Caption = 'Arquivo de Seleção de Matrículas (SRH16)'
      end
      object SpeedButton4: TSpeedButton
        Left = 628
        Top = 33
        Width = 22
        Height = 23
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
        OnClick = SpeedButton4Click
      end
      object edCaminhoEntrada: TEdit
        Left = 14
        Top = 34
        Width = 362
        Height = 21
        TabOrder = 0
      end
      object edarqmat: TEdit
        Left = 417
        Top = 34
        Width = 206
        Height = 21
        TabOrder = 1
      end
    end
    object grpArquivos: TGroupBox
      Left = 1
      Top = 78
      Width = 684
      Height = 62
      Align = alTop
      Caption = ' Arquivos de Saída '
      TabOrder = 1
      object lblArqGravar: TLabel
        Left = 11
        Top = 18
        Width = 261
        Height = 13
        Caption = 'Indique o Caminho para os Arquivos de Saída'
      end
      object spedArqGravar: TSpeedButton
        Left = 380
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
      object edArqGravar: TEdit
        Left = 11
        Top = 34
        Width = 365
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 140
      Width = 533
      Height = 116
      Align = alLeft
      Caption = 'Arquivos a Processar  '
      TabOrder = 2
      object ScrollBox1: TScrollBox
        Left = 2
        Top = 15
        Width = 529
        Height = 99
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 3
          Width = 109
          Height = 13
          Caption = 'Arq. do Empregado'
        end
        object Label4: TLabel
          Left = 271
          Top = 3
          Width = 82
          Height = 13
          Caption = 'Arq. Auxiliares'
        end
        object chkEmpregados: TCheckBox
          Left = 7
          Top = 119
          Width = 170
          Height = 17
          Caption = 'Empregados - SRH16'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkConsigEsp: TCheckBox
          Left = 7
          Top = 20
          Width = 213
          Height = 17
          Caption = 'Consignatário Especial - SRH2'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkHistOcorFunc: TCheckBox
          Left = 7
          Top = 45
          Width = 330
          Height = 17
          Caption = 'Hist. de Ocorrências Funcionais - SRH5 e SRH19'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chkRubricas: TCheckBox
          Left = 7
          Top = 70
          Width = 250
          Height = 17
          Caption = 'Rubricas - SRH8 e SRH9'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object chkUnidOper: TCheckBox
          Left = 271
          Top = 18
          Width = 202
          Height = 17
          Caption = 'Unidades Operacionais - SRH11'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object chkDependentes: TCheckBox
          Left = 7
          Top = 94
          Width = 160
          Height = 17
          Caption = 'Dependentes - SRH13'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 256
      Width = 684
      Height = 162
      Align = alBottom
      TabOrder = 3
      object lblBarraProgresso: TLabel
        Left = 2
        Top = 131
        Width = 680
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Caption = 'Aguarde Processando ....'
        Visible = False
      end
      object pBar: TProgressBar
        Left = 2
        Top = 144
        Width = 680
        Height = 16
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 640
        Top = 15
        Width = 42
        Height = 116
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
        Width = 638
        Height = 116
        Align = alClient
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 534
      Top = 140
      Width = 151
      Height = 116
      Align = alClient
      Caption = 'Ignorar'
      TabOrder = 4
      object chkAssistidos: TCheckBox
        Left = 20
        Top = 16
        Width = 108
        Height = 17
        Caption = 'Assistidos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkCancelados: TCheckBox
        Left = 20
        Top = 37
        Width = 102
        Height = 17
        Caption = 'Cancelados'
        TabOrder = 1
      end
      object chkMantidos: TCheckBox
        Left = 20
        Top = 58
        Width = 102
        Height = 17
        Caption = 'Mantidos'
        TabOrder = 2
      end
      object chkAtivos: TCheckBox
        Left = 20
        Top = 78
        Width = 102
        Height = 17
        Caption = 'Ativos'
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 419
    Width = 686
    inherited tb97Fundo: TToolbar97
      Left = 496
      DockPos = 576
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
      Left = 309
      DockPos = 350
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 332
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
      'Color'#0#0#0'ld$'#6'ld$'#6#20#0#0#0'Capt('#0#0#0#23#0#0#0#0#0#0#0#5#0#0#0'Colo<'#0#0#0#31#0#0#0#0#0#0#0#12#0#0#0'Font' +
      '.Charset'#0'u'#0'A°d$'#6'°d$'#6#20#0#0#0'Fontl'#0#0#0#23#0#0#0#0#0#0#0#7#0#0#0'Char€'#0#0#0#27#0#0#0#0#0#0#0#10#0#0#0 +
      'Font.Color'#0'Rðd$'#6'ðd$'#6#20#0#0#0'clRe¬'#0#0#0#23#0#0#0#0#0#0#0#5#0#0#0'ColoÀ'#0#0#0#27#0#0#0#0#0#0#0#11#0#0#0 +
      'Font.Height'#0'0e$'#6'0e$'#6#20#0#0#0'Fontì'#0#0#0#23#0#0#0#0#0#0#0#6#0#0#0'Heig'#0#1#0#0#27#0#0#0#0#0#0#0#9#0#0#0 +
      'Font'
    Folder = foCustom
    ShowPath = False
    Left = 31
    Top = 279
  end
  object qryFilial: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 378
    Top = 321
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 322
    Top = 305
  end
  object tblDepen: TwwTable
    TableType = ttParadox
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 432
    Top = 336
  end
  object qryDBFDepen: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 378
    Top = 57
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 426
    Top = 313
  end
  object tblOcorr: TwwTable
    TableType = ttParadox
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 384
    Top = 256
  end
  object sqlParam: TCMSqlParams
    Left = 191
    Top = 268
  end
  object cdsBuscaPessoa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 272
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 336
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 564
    Top = 313
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 549
    Top = 89
  end
end
