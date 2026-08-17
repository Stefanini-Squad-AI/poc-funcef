inherited frmImportCotMoeda: TfrmImportCotMoeda
  Left = 113
  Top = 110
  HelpContext = 3360007
  Caption = 'Importação de Alterações em Cotações de Moeda'
  ClientHeight = 404
  ClientWidth = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 631
    Height = 365
    object lblPathArqProc: TLabel
      Left = 14
      Top = 91
      Width = 242
      Height = 13
      Caption = 'Indique o Caminho do Arquivo de BACKUP'
    end
    object btnArqProcessar: TSpeedButton
      Left = 379
      Top = 103
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
      Top = 50
      Width = 167
      Height = 13
      Caption = 'Indique o Arquivo de Entrada'
    end
    object SpeedButton1: TSpeedButton
      Left = 380
      Top = 63
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
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 14
      Top = 10
      Width = 167
      Height = 13
      Caption = 'Indique o Arquivo de Entrada'
    end
    object edArqGravar: TEdit
      Left = 14
      Top = 105
      Width = 362
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edTxt: TEdit
      Left = 14
      Top = 64
      Width = 363
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pcctropcoes: TPageControl
      Left = 1
      Top = 140
      Width = 629
      Height = 224
      ActivePage = tbFormato
      Align = alBottom
      TabOrder = 2
      object tbFormato: TTabSheet
        Caption = 'Modelo Arquivo'
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 621
          Height = 196
          Align = alClient
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'Formato do arquivo de entrada:'
            'COLUNA     '#9'TIPO           '#9'INICIO        '
            'VALOR          '#9'N(20)'#9#9'1'
            'NULO        '#9'ESPAÇO(1)          '#9'21'
            'MESANO       '#9'A(6)                    '#9'22'
            'NULO          '#9'ESPAÇO(1)            '#9'28'
            'DATA         '#9'D(DD/MM/AAAA) '#9'29'
            'NULO         '#9'ESPAÇO(1)           '#9'39'
            'DATAFIM      '#9'D(DD/MM/AAAA) '#9'40'
            ''
            'Exemplo:'
            '            100,6273 012003 01/01/2003 01/01/2003')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object tbDemons: TTabSheet
        Caption = 'Demonstrativo'
        ImageIndex = 2
        object memdesc: TMemo
          Left = 0
          Top = 0
          Width = 613
          Height = 196
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object tbErros: TTabSheet
        Caption = 'Erros'
        ImageIndex = 1
        object memerros: TMemo
          Left = 0
          Top = 0
          Width = 613
          Height = 196
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object cmbMoeda: TwwDBLookupCombo
      Left = 14
      Top = 24
      Width = 363
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'MOEDESC'#9'F')
      LookupTable = qrymoeda
      LookupField = 'MOEDESC'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 631
    inherited tb97Fundo: TToolbar97
      Left = 459
      DockPos = 503
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 290
      DockPos = 334
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Importar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 491
    Top = 65531
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 475
    Top = 69
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
    Left = 431
    Top = 71
  end
  object qrymoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM MOEDA'
      'WHERE MOECODIGO IN (127,218)')
    ValidateWithMask = True
    Left = 392
    Top = 192
  end
  object dsmoeda: TwwDataSource
    DataSet = qrymoeda
    Left = 408
    Top = 176
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 426
    Top = 313
  end
end
