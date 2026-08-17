object FrmPrincipal: TFrmPrincipal
  Left = 230
  Top = 190
  Width = 667
  Height = 457
  Caption = 'Marca Strings Para Tradução'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000080000000000000000000000000000000800000000000000000000
    0000000000080000000000000000000000000000000800000000000000000000
    0000000000080000000000000000000000000000000800000000000000000000
    0000000000080000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000444C4C4C4C4C4CF8F400000000000
    00044C4C4C4C4C4CF8F8400BB00000000004C4C4C4C4C4FF8F8F44BB3B000000
    0004444C4C4C48F8F8FF44B3BB0000000004C4C4C4CF8F8F8FFC44B33B000000
    00044C4C4CF8F7F8FC4C4CB3BB0004444444C4CC8F8F8F8FC4C44C0B0000444C
    4C444CC8F8F8F84C4C4C4CC4000044C4C4C448FF8FF3BCC4C4C44C4000004C4C
    4CC4FFF8FB3B3B3C4C4C4C40000044CCC4C48F8FBBB3B3B3C4CC440000004C4C
    44444444BBB0003B44440000000044C44000000BBBBB03B3B000000000004C4C
    4000000BBBBBBB3B30000000000044C44000000BBB00B003B000000000004C4C
    40000000BBBBBBBB000000000000444440000004444444444000000000000BBB
    0000000C44444444CC00000000000BB3B000000CCCC4444CCC00000000000BB3
    B00000CCCCCCBCCCCCC0000000000B3BB000000CCCCBBBCCCC00000000000B3B
    000000000CCCCCCC0000000000000BBB00000000000CCC00000000000000FC00
    007FFE0000FFFF8003FFFF8003FFFF8003FFFF8003FFFF8003FFFF8003FFFF00
    00FFFE00007FFE000067FE000003FE000003FE000003FE000003800000270000
    0007000000170000001700000023000000E307E007E307E007E307E007E307F0
    0FE307E007E38FE003E387E003F787C001FF87E003FF8FF80FFF8FFE3FFF}
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 94
    Width = 659
    Height = 336
    Align = alClient
    BorderWidth = 6
    Caption = 'Panel1'
    TabOrder = 0
    object LblArquivo: TLabel
      Left = 7
      Top = 7
      Width = 645
      Height = 16
      Align = alTop
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object rEdtParser: TRichEdit
      Left = 7
      Top = 24
      Width = 645
      Height = 307
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Pitch = fpFixed
      Font.Style = []
      HideSelection = False
      HideScrollBars = False
      ParentFont = False
      PlainText = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object panButtons: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 94
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 9
      Width = 307
      Height = 13
      Caption = 'Paths (com máscara de arquivo) ou arquivos pesquisa'
    end
    object SpeedButton2: TSpeedButton
      Left = 434
      Top = 25
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object BtnIniciar: TBitBtn
      Left = 380
      Top = 52
      Width = 79
      Height = 29
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = BtnIniciarClick
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777770777777777777777777777770077777777777
        777777777770B077777777777777777777770B077777777777777777700000B0
        7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
        7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
        F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
        077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
        887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
        FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
        7777777777888777777777777777777777777777777777777777}
    end
    object EdtArquivos: TEditReg
      Left = 14
      Top = 25
      Width = 415
      Height = 21
      RegKey = 'HKEY_CURRENT_USER'
      RegPath = 'Software\CM\TraduzStrings'
      RegValueName = 'Arquivos'
      TabOrder = 1
    end
    object CkbBkp: TCheckBox
      Left = 15
      Top = 60
      Width = 358
      Height = 17
      Caption = 'Fazer cópia dos arquivos alterados ( nomedoarquivo.cmt )'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 2
    end
  end
  object QueryParser: TQueryParserComp
    IsEOFStmtDelimiter = False
    StringDelimiters = #39
    RemoveStrDelimiter = False
    CountFromStatement = True
    TextToParse = 'X'
    StatementDelimiters.Strings = (
      '=')
    Left = 392
    Top = 248
  end
  object LstArquivos: TCMListDialog
    ListDialogType = ldtFileList
    Caption = 'Selecionar'
    Text = 'Arquivos ou Máscara para Pesquisa'
    ItemSeparator = ';'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    AllowEmptyList = False
    MessageForEmptyList = 'Não foi indicado nenhum item'
    FileFilter = 'Units Delphi|*.pas;Todos os Arquivos|*.inc;Todos os Arquivos|*.*'
    Left = 392
    Top = 201
  end
end
