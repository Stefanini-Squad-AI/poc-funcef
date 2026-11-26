object frmPrincipalRubricaIndiv: TfrmPrincipalRubricaIndiv
  Left = 340
  Top = 223
  BorderStyle = bsSingle
  Caption = 'Insere Rubrica'
  ClientHeight = 454
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 384
    Top = 219
    Width = 112
    Height = 39
    Shape = bsFrame
  end
  object Bevel5: TBevel
    Left = 384
    Top = 132
    Width = 112
    Height = 37
    Shape = bsFrame
  end
  object Bevel3: TBevel
    Left = 384
    Top = 175
    Width = 112
    Height = 39
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 4
    Top = 132
    Width = 375
    Height = 45
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 12
    Top = 126
    Width = 114
    Height = 13
    Caption = 'Arquivo de Entrada '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnAbreArqEnt: TSpeedButton
    Tag = 1
    Left = 350
    Top = 145
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
    OnClick = btnAbreArqEntClick
  end
  object lblStatus: TLabel
    Left = 8
    Top = 281
    Width = 488
    Height = 13
    AutoSize = False
  end
  object Bevel2: TBevel
    Left = 4
    Top = 186
    Width = 374
    Height = 45
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 13
    Top = 182
    Width = 49
    Height = 13
    Caption = 'Rubrica '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 393
    Top = 171
    Width = 63
    Height = 13
    Caption = 'Referência'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = 4
    Top = 239
    Width = 374
    Height = 45
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 14
    Top = 231
    Width = 68
    Height = 13
    Caption = 'Favorecido '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 394
    Top = 128
    Width = 69
    Height = 13
    Caption = 'Data Início '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 397
    Top = 215
    Width = 30
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 208
    Top = 56
    Width = 3
    Height = 13
  end
  object txArqEnt: TEdit
    Left = 12
    Top = 145
    Width = 333
    Height = 21
    TabOrder = 0
  end
  object pbBarraProg: TProgressBar
    Left = 8
    Top = 300
    Width = 490
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 8
  end
  object mmObs: TMemo
    Left = 8
    Top = 330
    Width = 489
    Height = 96
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 7
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 49
    Align = alTop
    TabOrder = 9
    object btnExecuta: TSpeedButton
      Left = 0
      Top = 0
      Width = 57
      Height = 49
      Caption = '&Executa'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = btnExecutaClick
    end
    object btnFecha: TSpeedButton
      Left = 58
      Top = 0
      Width = 57
      Height = 49
      Caption = '&Fecha'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = btnFechaClick
    end
  end
  object DbcRubrica: TDBLookupComboBox
    Left = 10
    Top = 200
    Width = 361
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'IDPROVENTO'
    ListField = 'CODPROVDESC||'#39'-'#39'||DESCRICAO'
    ListSource = DtsRubrica
    ParentFont = False
    TabOrder = 2
  end
  object ChkUsaValorArquivo: TCheckBox
    Left = 388
    Top = 268
    Width = 107
    Height = 15
    Caption = 'Usa valor arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = ChkUsaValorArquivoClick
  end
  object DbcFavorecido: TDBLookupComboBox
    Left = 10
    Top = 252
    Width = 360
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'IDFAVORECIDO'
    ListField = 'NOME'
    ListSource = DtsFavorecido
    ParentFont = False
    TabOrder = 3
  end
  object SbrMsg: TStatusBar
    Left = 0
    Top = 432
    Width = 500
    Height = 22
    Panels = <
      item
        Width = 270
      end
      item
        Width = 110
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object DtpDataInicio: TDateTimePicker
    Left = 392
    Top = 142
    Width = 98
    Height = 21
    CalAlignment = dtaLeft
    Date = 38050.5017679167
    Time = 38050.5017679167
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object EdtValor: TEdit
    Left = 397
    Top = 230
    Width = 92
    Height = 21
    TabOrder = 5
    OnChange = EdtValorChange
  end
  object MskReferencia: TMaskEdit
    Left = 397
    Top = 186
    Width = 92
    Height = 21
    EditMask = '!99/9999;0;_'
    MaxLength = 7
    TabOrder = 4
  end
  object EdtUsuario: TEdit
    Left = 184
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'dml_hebio'
    Visible = False
  end
  object EdtSenha: TEdit
    Left = 184
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 12
    Visible = False
  end
  object EdtSOL: TEdit
    Left = 184
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 13
    Text = '135378'
    Visible = False
  end
  object dlgAbreArq: TOpenDialog
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivos DAT (*.dat)|*.dat|Todos Arq' +
      'uivos (*.*)|*.*'
    Title = 'Arquivo de Entrada'
    Left = 132
    Top = 5
  end
  object dlgSalvaArq: TSaveDialog
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivo Dat (*.dat)|*.dat|Todos arqu' +
      'ivos (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Arquivo de Saída'
    Left = 168
    Top = 5
  end
  object DtsRubrica: TDataSource
    DataSet = QryRubrica
    Left = 236
    Top = 2
  end
  object DtsFavorecido: TDataSource
    DataSet = QryFavorecido
    Left = 364
    Top = 50
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 386
    Top = 7
  end
  object QryFavorecido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFAVORECIDO, NOME'
      'FROM   LAYOUTXCOLUNAS, PESSOA'
      'WHERE  LAYOUTXCOLUNAS.IDFAVORECIDO = PESSOA.IDPESSOA'
      'AND    LAYOUTXCOLUNAS.IDFAVORECIDO <> 1'
      'ORDER BY NOME')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 441
    Top = 14
  end
  object QryRubrica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, CODPROVDESC || '#39' - '#39' || '
      'DESCRICAO'
      'FROM PROVDESC'
      ' WHERE  FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND         FLGDESCONTO <> 2'
      'AND        FLGESPECIAL <> 1'
      'AND       CODPROVDESC IS NOT NULL'
      'ORDER BY CODPROVDESC')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 361
    Top = 94
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFAVORECIDO, NOME'
      'FROM   LAYOUTXCOLUNAS, PESSOA'
      'WHERE  LAYOUTXCOLUNAS.IDFAVORECIDO = PESSOA.IDPESSOA'
      'AND    LAYOUTXCOLUNAS.IDFAVORECIDO <> 1'
      'ORDER BY NOME')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 441
    Top = 70
  end
end
