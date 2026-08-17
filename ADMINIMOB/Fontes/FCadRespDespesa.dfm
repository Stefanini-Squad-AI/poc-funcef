inherited frmCadRespDespesa: TfrmCadRespDespesa
  Left = 55
  Top = 102
  HelpContext = 640060
  Caption = 'Responsabilidade pelo Pagamento de Despesas'
  ClientHeight = 395
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 362
    object Label2: TLabel
      Left = 16
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Locatário:'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 80
      Width = 705
      Height = 5
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 21
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Contrato:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBgrdDespLocatario: TwwDBGrid
      Left = 16
      Top = 120
      Width = 321
      Height = 226
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'41'#9'Tipo de Despesa'#9'F')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsDespLocatario
      KeyOptions = []
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgPerfectRowFit]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBgrdDespLocatarioCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdDespLocatarioTopRowChanged
    end
    object DBgrdDespFundacao: TwwDBGrid
      Left = 400
      Top = 120
      Width = 321
      Height = 225
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'41'#9'Tipo de Despesa'#9'F')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsDespFundacao
      KeyOptions = []
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgPerfectRowFit]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DBgrdDespFundacaoCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdDespFundacaoTopRowChanged
    end
    object Panel3: TPanel
      Left = 16
      Top = 93
      Width = 321
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Locatário'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 400
      Top = 93
      Width = 321
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Fundação'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inline molContrato1: TmolContrato
      Left = 72
      Top = 8
      Width = 529
      Height = 33
      TabOrder = 4
      inherited Label2: TLabel
        Left = 24
        Top = 18
        Visible = False
      end
      inherited edtContrato: TEdit
        Top = 8
        Width = 473
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 480
        Top = 8
        OnClick = molContrato1btnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 504
        Top = 8
        Enabled = False
        Visible = False
      end
    end
    object edtNFLocatario: TEdit
      Left = 80
      Top = 48
      Width = 273
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 5
    end
    object edtRSLocatario: TEdit
      Left = 352
      Top = 48
      Width = 369
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 6
    end
    object btnFLUm: TfcShapeBtn
      Left = 348
      Top = 248
      Width = 41
      Height = 33
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
        66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
        66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
        660878F888877F88887887E66666F666608887F88888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      Orientation = soDown
      ParentClipping = True
      RoundRectBias = 25
      ShadeColors.Btn3DLight = 14671839
      ShadeColors.BtnHighlight = 15724527
      ShadeColors.BtnShadow = 6316128
      ShadeColors.BtnBlack = 3158064
      ShadeStyle = fbsFlat
      Shape = bsEllipse
      TabOrder = 7
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnFLUmClick
    end
    object btnFLTodos: TfcShapeBtn
      Left = 348
      Top = 288
      Width = 41
      Height = 33
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
        66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
        66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
        660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      Shape = bsEllipse
      TabOrder = 8
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnFLTodosClick
    end
    object btnLFUm: TfcShapeBtn
      Left = 348
      Top = 152
      Width = 41
      Height = 33
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
        66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
        66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
        660878F888778888887887E666F66666608887F88878888887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      Shape = bsEllipse
      TabOrder = 9
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnLFUmClick
    end
    object btnLFTodos: TfcShapeBtn
      Left = 348
      Top = 192
      Width = 41
      Height = 33
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
        66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
        66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
        660878F877887788887887E6F666F666608887F87888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      Shape = bsEllipse
      TabOrder = 10
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnLFTodosClick
    end
  end
  inherited Dock971: TDock97
    Top = 362
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 637
    end
  end
  object dsDespFundacao: TwwDataSource
    DataSet = qryDespFundacao
    Left = 624
    Top = 196
  end
  object qryDespFundacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDCONTRATOIMOVEL, R.IDTIPOCUSTORECIMO, R.FLGRESPONSAVEL,'
      ''
      '   T.DESCCUSTORECIMO'
      ''
      'FROM'
      '   RESPDESPIMOB R, TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '   ( R.IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL ) '
      '   AND ( T.IDTIPOCUSTORECIMO = R.IDTIPOCUSTORECIMO )'
      '   AND ( T.RECCUSTO = '#39'C'#39' )'
      '   AND ( T.IDMODULO = :PIDMODULO )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 624
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryDespFundacaoDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Despesa'
      DisplayWidth = 41
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryDespFundacaoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.RESPDESPIMOB.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryDespFundacaoIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.RESPDESPIMOB.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryDespFundacaoFLGRESPONSAVEL: TFloatField
      FieldName = 'FLGRESPONSAVEL'
      Origin = 'BASEDADOS.RESPDESPIMOB.FLGRESPONSAVEL'
      Visible = False
    end
  end
  object qryInsertRespFundacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RESPDESPIMOB'
      '( IDCONTRATOIMOVEL, IDTIPOCUSTORECIMO )'
      'VALUES'
      '( :PIDCONTRATOIMOVEL, :PIDTIPOCUSTORECIMO )')
    ValidateWithMask = True
    Left = 394
    Top = 158
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end>
  end
  object qryDespLocatario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.DESCCUSTORECIMO, T.IDTIPOCUSTORECIMO'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '   ( T.RECCUSTO = '#39'C'#39' )'
      '   AND ( T.IDMODULO = :PIDMODULO )'
      ''
      '   AND T.IDTIPOCUSTORECIMO NOT IN'
      '     ( SELECT IDTIPOCUSTORECIMO'
      '       FROM RESPDESPIMOB'
      '       WHERE IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryDespLocatarioDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryDespLocatarioIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
  end
  object qryDeleteRespFundacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM RESPDESPIMOB'
      'WHERE'
      '   ( IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      '   AND ( IDTIPOCUSTORECIMO =:PIDTIPOCUSTORECIMO )')
    ValidateWithMask = True
    Left = 402
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end>
  end
  object dsDespLocatario: TwwDataSource
    DataSet = qryDespLocatario
    Left = 160
    Top = 168
  end
end
