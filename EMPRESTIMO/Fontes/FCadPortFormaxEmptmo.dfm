inherited frmCadPortFormaxEmptmo: TfrmCadPortFormaxEmptmo
  Left = 110
  Top = 150
  HelpContext = 150130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conta-Caixa x Forma Recebimento do Módulo de Empréstimos'
  ClientHeight = 411
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 378
    object Panel3: TPanel
      Left = 386
      Top = 14
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Conta-Caixa x Forma Receb. de Empréstimo'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 15
      Top = 14
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Conta-Caixa x Forma Receb. não Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btnIncluir: TfcShapeBtn
      Left = 346
      Top = 171
      Width = 28
      Height = 28
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
        66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
        66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
        660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 0
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnIncluirClick
    end
    object btnExcluir: TfcShapeBtn
      Left = 346
      Top = 216
      Width = 28
      Height = 26
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
        66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
        66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
        660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 1
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnExcluirClick
    end
    object LstItensNAOAss: TDBLookupListBox
      Left = 16
      Top = 40
      Width = 319
      Height = 277
      KeyField = 'CODPORTFORMA'
      ListField = 'DESCRICAO'
      ListSource = dsPortForma
      TabOrder = 4
    end
    object LstItensAss: TDBLookupListBox
      Left = 386
      Top = 40
      Width = 319
      Height = 277
      KeyField = 'CODPORTFORMA'
      ListField = 'DESCRICAO'
      ListSource = dsPortFormaxModulo
      TabOrder = 5
    end
    object rdgFiltro: TRadioGroup
      Left = 16
      Top = 328
      Width = 321
      Height = 41
      Caption = 'Filtro'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Pagamento'
        'Recebimento     '
        'Todos')
      TabOrder = 6
      OnClick = rdgFiltroClick
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 720
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 472
      DockPos = 472
      inherited sep1: TToolbarSep97
        Left = 122
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 41
      end
      inherited bbtnSair: TBitBtn
        Left = 41
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 124
        Height = 27
        ClickHelpContext = 150056
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 347
    Top = 3
  end
  object dsPortFormaxModulo: TwwDataSource
    DataSet = qryPortFormaxModulo
    Left = 427
    Top = 104
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.CODPORTFORMA, PF.DESCRICAO, PF.RECPAG'
      ''
      'FROM'
      '   PORTADORFORMA PF'
      ''
      'WHERE'
      '   ( PF.IDPESSOA = :PIDEMPRESAPROP )'
      '   AND NVL(PF.FLGATIVO,'#39'S'#39') = '#39'S'#39
      '   AND NOT EXISTS( '
      '       SELECT *'
      '       FROM   PORTFORMAXMODULO'
      '       WHERE  IDEMPRESAPROP = PF.IDPESSOA'
      '       AND    CODPORTFORMA = PF.CODPORTFORMA'
      '       AND    IDMODULO = :PIDMODULO)'
      '  '
      'ORDER BY'
      '   PF.DESCRICAO')
    ValidateWithMask = True
    Left = 40
    Top = 60
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDMODULO'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 56
  end
  object qryPortFormaxModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PF.CODPORTFORMA, PF.DESCRICAO, PF.RECPAG'
      ''
      'FROM'
      '   PORTADORFORMA PF'
      ''
      'WHERE'
      '   ( PF.IDPESSOA = :PIDEMPRESAPROP )'
      '   AND NVL(PF.FLGATIVO,'#39'S'#39') = '#39'S'#39
      '   AND EXISTS( '
      '       SELECT *'
      '       FROM   PORTFORMAXMODULO'
      '       WHERE  IDEMPRESAPROP = PF.IDPESSOA'
      '       AND    CODPORTFORMA = PF.CODPORTFORMA'
      '       AND    IDMODULO = :PIDMODULO)'
      '  '
      'ORDER BY'
      '   PF.DESCRICAO')
    ValidateWithMask = True
    Left = 424
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDMODULO'
        ParamType = ptInput
      end>
  end
  object dsPortForma: TwwDataSource
    DataSet = qryPortForma
    Left = 40
    Top = 112
  end
end
