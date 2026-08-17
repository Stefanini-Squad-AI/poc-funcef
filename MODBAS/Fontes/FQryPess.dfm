inherited frmQryPess: TfrmQryPess
  Left = 112
  Top = 130
  Caption = 'Consultas Diversas ao Banco de Dados por SQL'
  ClientHeight = 383
  ClientWidth = 604
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    Height = 344
    BevelInner = bvRaised
    BevelOuter = bvLowered
    object Splitter1: TSplitter
      Left = 5
      Top = 136
      Width = 594
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Color = clGray
      ParentColor = False
    end
    object dbgrQuery: TwwDBGrid
      Left = 5
      Top = 144
      Width = 594
      Height = 195
      MemoAttributes = [mSizeable, mWordWrap, mViewOnly]
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icYellow
    end
    object memoQuery: TMemo
      Left = 5
      Top = 5
      Width = 594
      Height = 131
      Hint = 'Escreva o Comando SQL'
      Align = alTop
      Color = clSilver
      Lines.Strings = (
        'memoQuery')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 344
    Width = 604
    object lblNumReg: TLabel [0]
      Left = 7
      Top = 12
      Width = 76
      Height = 13
      Caption = 'Num. Reg.: 0'
    end
    inherited tb97Fundo: TToolbar97
      Left = 434
      DockPos = 434
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
      DockPos = 81
      inherited ToolbarSep971: TToolbarSep97
        Left = 157
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 77
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 160
        Width = 108
        Caption = '  &Executar'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000055555550005555555000000055800850B058005550000000553B
          03033000330550000000553B0333F0B3330550000000700BB0338303F8005000
          000003303FFBBFBB3033000000000333FB000008B033000000003F3FB77F7703
          FBFB000000003333F77F8707B800500000005503FF7F770FB30550000000553F
          BB7F8703FB05500000005553377877073755500000005555557FF80555555000
          0000555555577755555550000000555555555555555550000000}
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 268
        Enabled = False
        Visible = False
      end
      object rbtnSalvar: TBitBtn
        Left = 80
        Top = 0
        Width = 77
        Height = 33
        Caption = ' &Salvar'
        Default = True
        TabOrder = 2
        OnClick = rbtnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object rbtnAbrir: TBitBtn
        Left = 0
        Top = 0
        Width = 77
        Height = 33
        Caption = ' &Abrir'
        Default = True
        TabOrder = 3
        OnClick = rbtnAbrirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 515
    Top = 35
  end
  object ds: TwwDataSource
    DataSet = qryPessoal
    Left = 380
    Top = 85
  end
  object qryPessoal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from pessfis where sexo = '#39'F'#39)
    ValidateWithMask = True
    Left = 379
    Top = 32
  end
  object opdlgDialogo: TOpenDialog
    DefaultExt = '*.SQL'
    Filter = 'Arquivos Texto|*.TXT|Arquivos SQL|*.SQL|Todos|*.*'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha o arquivo a ser aberto'
    Left = 448
    Top = 82
  end
  object svdlgDialogo: TSaveDialog
    DefaultExt = '*.SQL'
    Filter = 'Arquivos Texto|*.TXT|Aqruivos SQL|*.SQL|Todos|*.*'
    InitialDir = 'C:\'
    Title = 'Escolha o arquivo a ser gravado'
    Left = 448
    Top = 32
  end
end
