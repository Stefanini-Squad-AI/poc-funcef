inherited FrmBolqueiaHist: TFrmBolqueiaHist
  Left = 341
  Top = 152
  Caption = 'Bloquei Históricos Para Importação'
  ClientHeight = 486
  ClientWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 447
    object PnlDesemb: TPanel
      Left = 334
      Top = 5
      Width = 306
      Height = 437
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 0
      object PnlTitDesemb: TPanel
        Left = 1
        Top = 1
        Width = 304
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Históricos Liberados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdHistLib: TwwDBGrid
        Left = 1
        Top = 27
        Width = 304
        Height = 409
        Selected.Strings = (
          'RECPAG'#9'1'#9'R/P'
          'DESCHISTORICOSAF'#9'60'#9'Histórico')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsHistLIb
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object PnlCtrls: TPanel
      Left = 302
      Top = 5
      Width = 32
      Height = 437
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnIncluiHist: TSpeedButton
        Left = 4
        Top = 124
        Width = 25
        Height = 25
        Hint = 'Selciona'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiHistClick
      end
      object BtnIncluiTodosHist: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiTodosHistClick
      end
      object BtnExcluiHistAssoc: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiHistAssocClick
      end
      object BtnExcluiAllHistAssoc: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Exclui'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiAllHistAssocClick
      end
    end
    object PnlCadastro: TPanel
      Left = 5
      Top = 5
      Width = 297
      Height = 437
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 2
      object GrdHistBloq: TwwDBGrid
        Left = 0
        Top = 26
        Width = 297
        Height = 411
        Selected.Strings = (
          'RECPAG'#9'1'#9'R/P'
          'DESCHISTORICOSAF'#9'60'#9'Histórico'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsHistBloq
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Históricos Bloqueados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 447
    Width = 645
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 75
    Top = 123
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object CdsHistBloq: TClientDataSet
    Aggregates = <>
    Filter = 'FLGBLOQUEADO = '#39'S'#39
    Filtered = True
    Params = <>
    ProviderName = 'DspHistoricos'
    Left = 189
    Top = 93
    object CdsHistBloqRECPAG: TStringField
      DisplayLabel = 'R/P'
      DisplayWidth = 1
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsHistBloqDESCHISTORICOSAF: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'DESCHISTORICOSAF'
      Size = 60
    end
    object CdsHistBloqIDHISTORICOSAF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTORICOSAF'
      Visible = False
    end
    object CdsHistBloqFLGBLOQUEADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGBLOQUEADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DspHistoricos: TDataSetProvider
    DataSet = QryHistoricos
    Constraints = True
    Left = 189
    Top = 173
  end
  object CdsHistLib: TClientDataSet
    Aggregates = <>
    Filter = 'FLGBLOQUEADO <> '#39'S'#39
    Filtered = True
    Params = <>
    ProviderName = 'DspHistoricos'
    Left = 461
    Top = 93
    object CdsHistLibRECPAG: TStringField
      DisplayLabel = 'R/P'
      DisplayWidth = 1
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsHistLibDESCHISTORICOSAF: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'DESCHISTORICOSAF'
      Size = 60
    end
    object CdsHistLibIDHISTORICOSAF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTORICOSAF'
      Visible = False
    end
    object CdsHistLibFLGBLOQUEADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGBLOQUEADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryHistoricos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HISTORICOSAF')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 189
    Top = 253
    object QryHistoricosIDHISTORICOSAF: TFloatField
      FieldName = 'IDHISTORICOSAF'
      Origin = 'BASEDADOS.HISTORICOSAF.IDHISTORICOSAF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryHistoricosDESCHISTORICOSAF: TStringField
      FieldName = 'DESCHISTORICOSAF'
      Origin = 'BASEDADOS.HISTORICOSAF.DESCHISTORICOSAF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object QryHistoricosRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.HISTORICOSAF.RECPAG'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object QryHistoricosFLGBLOQUEADO: TStringField
      FieldName = 'FLGBLOQUEADO'
      Origin = 'BASEDADOS.HISTORICOSAF.FLGBLOQUEADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object DsHistBloq: TwwDataSource
    DataSet = CdsHistBloq
    Left = 189
    Top = 133
  end
  object DsHistLIb: TwwDataSource
    DataSet = CdsHistLib
    Left = 462
    Top = 141
  end
end
