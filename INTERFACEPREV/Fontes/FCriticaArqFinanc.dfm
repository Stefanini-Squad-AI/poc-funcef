inherited frmCriticaArqFinanc: TfrmCriticaArqFinanc
  Left = 389
  Top = 228
  HelpContext = 320030
  Caption = 'Visualizador de arquivos'
  ClientHeight = 430
  ClientWidth = 782
  PixelsPerInch = 96
  TextHeight = 13
  object ToolbarButton972: TToolbarButton97 [0]
    Left = 144
    Top = 0
    Width = 128
    Height = 17
    Caption = 'Tela de Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888888888888888888888888800000000088088880FFFFFFF088008880F00F
      00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
      C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
      888888888888888888888888888888888888}
    Opaque = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  inherited pnlFundo: TPanel
    Width = 782
    Height = 391
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    object Splitter1: TSplitter
      Left = 1
      Top = 46
      Width = 780
      Height = 4
      Cursor = crVSplit
      Align = alTop
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 780
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label24: TLabel
        Left = 20
        Top = 14
        Width = 66
        Height = 13
        Caption = 'Arquivo Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbAbrirTxt: TSpeedButton
        Left = 422
        Top = 9
        Width = 27
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbAbrirTxtClick
      end
      object lbldesc: TLabel
        Left = 588
        Top = 14
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtArquivoTexto: TEdit
        Left = 107
        Top = 11
        Width = 310
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object BitBtn12: TBitBtn
        Left = 461
        Top = 10
        Width = 116
        Height = 24
        Caption = '&Lê Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn12Click
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
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 50
      Width = 780
      Height = 340
      Align = alClient
      BevelOuter = bvSpace
      TabOrder = 1
      object Dock97Top: TDock97
        Left = 1
        Top = 1
        Width = 778
        Height = 23
        BackgroundTransparent = True
        BoundLines = [blTop, blBottom]
        LimitToOneRow = True
        object lblreg: TLabel
          Left = 3
          Top = 3
          Width = 330
          Height = 16
          Align = alClient
          AutoSize = False
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object ToolbarButton973: TToolbarButton97
          Left = 667
          Top = 2
          Width = 81
          Height = 17
          Caption = 'Ir para'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            42010000424D4201000000000000760000002800000011000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000070000000000777777000000070FFFFFFFF0777777000000070FF
            FFFFFF0777777000000070F000000F0777777000000070F0FBFB000777777000
            000070F0BFBF0F0007777000000070F000000F0770077000000070FF0FF44444
            44444000000070FF0FF4FBFBFBFB4000000070FFF0F4BFBFBFBF4000000070FF
            F0F4FBFBFBFB4000000070000004BFBFBFBF4000000077777704444444444000
            000077777774F444444440000000777777744444444440000000777777777777
            777770000000}
          Opaque = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolbarButton973Click
        end
        object tb97Atalho: TToolbar97
          Left = 338
          Top = 0
          Caption = 'Atalhos'
          CloseButton = False
          DefaultDock = Dock97Top
          DockableTo = [dpTop, dpBottom]
          DockPos = 338
          TabOrder = 0
          object ToolbarSep974: TToolbarSep97
            Left = 203
            Top = 0
            Blank = True
            SizeHorz = 8
          end
          object ToolbarSep977: TToolbarSep97
            Left = 0
            Top = 0
            Blank = True
            SizeHorz = 8
          end
          object btnProx: TToolbarButton97
            Left = 8
            Top = 0
            Width = 94
            Height = 17
            Caption = 'Próximos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777777777700077777707777770007777706077777000777706660777
              7000777066666077700077066666660770007000066600007000777706660777
              7000777706660777700077770666077770007777000007777000777777777777
              7000}
            Opaque = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnProxClick
          end
          object ToolbarSep979: TToolbarSep97
            Left = 102
            Top = 0
            Blank = True
            SizeHorz = 8
          end
          object btnant: TToolbarButton97
            Left = 110
            Top = 0
            Width = 93
            Height = 17
            Caption = 'Anteriores'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777777777700077770000077770007777066607777000777706660777
              7000777706660777700070000666000070007706666666077000777066666077
              7000777706660777700077777060777770007777770777777000777777777777
              7000}
            Opaque = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnantClick
          end
        end
        object edlinha: TEditNum
          Left = 569
          Top = 1
          Width = 95
          Height = 21
          TabOrder = 1
          IntDigits = 11
          Signal = False
          DecDigits = 0
          Numeric = True
        end
      end
      object strlinhas: TStringGrid
        Left = 1
        Top = 24
        Width = 778
        Height = 315
        Align = alClient
        ColCount = 2
        FixedCols = 0
        RowCount = 1000
        FixedRows = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [goVertLine, goHorzLine, goRangeSelect, goColMoving, goEditing]
        ParentFont = False
        TabOrder = 1
        ColWidths = (
          64
          682)
      end
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 782
    inherited tb97Fundo: TToolbar97
      Left = 527
      DockPos = 527
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 358
      DockPos = 358
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 67
    Top = 275
    TargetsData = (
      1
      6
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TwwDBRichEditMSWord'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryPatroCombo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  (PT.IDPESSOA = P.IDPESSOA) '
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 139
    Top = 188
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatroCombo
    Left = 87
    Top = 185
  end
  object tbltxt: TTable
    DatabaseName = 'D:\PROJETOSCM5\MIGRACAO'
    FieldDefs = <
      item
        Name = 'LINHA'
        DataType = ftString
        Size = 100
      end>
    StoreDefs = True
    TableName = 'HSTCONTRIBPREV'
    TableType = ttASCII
    Left = 659
    Top = 166
  end
  object bmPatro: TBatchMove
    Destination = tblDbf
    Mode = batCopy
    Source = tbltxt
    Left = 652
    Top = 209
  end
  object tblDbf: TwwTable
    DatabaseName = 'c:\projetoscm5'
    TableName = 'tmptxt.dbf'
    TableType = ttDBase
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 664
    Top = 250
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arqiuvos texto|*.txt|Todos os arquivos|*.*'
    Title = 'Seleciona Arquivo texto para testar...'
    Left = 602
    Top = 277
  end
  object dstxt: TwwDataSource
    AutoEdit = False
    DataSet = qryTxt
    Left = 598
    Top = 200
  end
  object qryTxt: TwwQuery
    DatabaseName = 'D:\PROJETOSCM5\MIGRACAO\HSTCONTRIBPREV.TXT'
    RequestLive = True
    SQL.Strings = (
      'SELECT DBF.VALORCHAVE, DBF.VALORPROVE , DBF.PROVENTO '
      ' FROM  TMPTXT DBF '
      '              WHERE DBF.PROVENTO LIKE '#39'%D89%'#39'  '
      'ORDER BY DBF.VALORCHAVE')
    ValidateWithMask = True
    Left = 663
    Top = 123
  end
end
