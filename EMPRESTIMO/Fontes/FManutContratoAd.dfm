inherited FrmManutContratoAd: TFrmManutContratoAd
  Left = 319
  Top = 175
  Caption = 'Manutenção do Arquivo Contratoad'
  ClientHeight = 340
  ClientWidth = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    Height = 301
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object edtArquivo: TEdit
      Left = 16
      Top = 35
      Width = 465
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnAbreArquivo: TBitBtn
      Left = 480
      Top = 33
      Width = 24
      Height = 22
      Hint = 'Seleciona o arquivo para gravação do log de exceções.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAbreArquivoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000008888888888888888880000008888888888888888880000008800
        00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
        000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
        8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
        BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
        0000880000088888888888000000888888888888888888000000888888888888
        888888000000888888888888888888000000}
    end
    object btnLimpaArquivo: TBitBtn
      Left = 504
      Top = 33
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnLimpaArquivoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object btnLimpar: TfcShapeBtn
      Left = 55
      Top = 251
      Width = 130
      Height = 29
      Caption = 'Limpar ContratoAD'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      Options = [boFocusable, boFocusRect]
      Offsets.GlyphY = 1
      Offsets.TextDownX = 2
      Offsets.TextDownY = 2
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 3
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.ExtrudeEffects.Depth = 4
      TextOptions.ExtrudeEffects.Orientation = fcTopRight
      TextOptions.VAlignment = vaVCenter
      OnClick = btnLimparClick
    end
    object DBgrdHistMov: TwwDBGrid
      Left = 16
      Top = 64
      Width = 233
      Height = 181
      Selected.Strings = (
        'IDCONTRATOEMPTMO'#9'13'#9'Contrato'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      TabOrder = 4
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object memArquivo: TMemo
      Left = 296
      Top = 64
      Width = 233
      Height = 181
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object btnCarregar: TfcShapeBtn
      Left = 343
      Top = 251
      Width = 130
      Height = 29
      Caption = 'Carregar Arquivo'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      Options = [boFocusable, boFocusRect]
      Offsets.GlyphY = 1
      Offsets.TextDownX = 2
      Offsets.TextDownY = 2
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 6
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.ExtrudeEffects.Depth = 4
      TextOptions.ExtrudeEffects.Orientation = fcTopRight
      TextOptions.VAlignment = vaVCenter
      OnClick = btnCarregarClick
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = btnLimpaArquivoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 27
    TargetsData = (
      1
      3
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRATOEMPTMO'
      'FROM CM.CONTRATOAD')
    ValidateWithMask = True
    Left = 400
    Top = 91
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 432
    Top = 91
  end
  object OpenDialog: TOpenDialog
    Left = 520
    Top = 64
  end
  object qryDel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from CM.CONTRATOAD')
    ValidateWithMask = True
    Left = 408
    Top = 163
  end
  object qryInsert: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CM.CONTRATOAD (IDCONTRATOEMPTMO)'
      'VALUES (:PIDCONTRATOEMPTMO)')
    ValidateWithMask = True
    Left = 360
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
