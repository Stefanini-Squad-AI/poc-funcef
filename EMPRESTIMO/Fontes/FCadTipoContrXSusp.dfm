inherited frmCadTipoContrXSusp: TfrmCadTipoContrXSusp
  Left = 59
  Top = 78
  HelpContext = 150074
  Caption = 'Tipo de Suspensão Por Tipo de Contrato'
  ClientHeight = 417
  ClientWidth = 722
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 722
    Height = 384
    object Label4: TLabel
      Left = 16
      Top = 6
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 15
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Tipos não Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dbcoTipoContrato: TwwDBLookupCombo
      Left = 16
      Top = 20
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TceDescricao'#9'40'#9'Tipo de Contrato'#9'F'
        'DESCTIPOEMPTMO'#9'32'#9'Tipo de Empréstimo'#9'F')
      LookupTable = qryTipoContrato
      LookupField = 'IDTIPOCONTREMPTMO'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = dbcoTipoContratoCloseUp
    end
    object Panel3: TPanel
      Left = 387
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Tipos Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
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
      TabOrder = 3
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
      TabOrder = 4
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnExcluirClick
    end
    object wwDBGrid1: TwwDBGrid
      Left = 15
      Top = 80
      Width = 320
      Height = 289
      Selected.Strings = (
        'TSEDESCRICAO'#9'60'#9'Tipo de Suspensão')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTipoSuspensao
      TabOrder = 5
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
    object wwDBGrid2: TwwDBGrid
      Left = 387
      Top = 80
      Width = 320
      Height = 289
      Selected.Strings = (
        'TSEDESCRICAO'#9'60'#9'Tipo de Suspensão')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsItens
      TabOrder = 6
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
  inherited Dock971: TDock97
    Top = 384
    Width = 722
    inherited tb97Fundo: TToolbar97
      Left = 550
      DockPos = 555
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIP.IDTIPOCONTREMPTMO, TIP.IDTIPOEMPTMO, TIP.TCEDESCRICAO,'
      '   TEM.DESCTIPOEMPTMO'
      'FROM'
      '   TIPOCONTREMPTMO  TIP,'
      '   TIPOEMPTMO TEM'
      'WHERE'
      '   ( TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO )'
      '   AND ( TEM.IDEMPRESAPROP =:PIDEMPRESAPROP )')
    ValidateWithMask = True
    Left = 56
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEDESCRICAO'
      Size = 60
    end
  end
  object dsDadosTpContrato: TwwDataSource
    DataSet = qryTipoContrato
    Left = 56
    Top = 144
  end
  object qryTipoSuspensao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDadosTpContrato
    SQL.Strings = (
      'SELECT'
      '   IDTIPOSUSPEMPTMO, TSEDESCRICAO'
      ''
      'FROM'
      '   TIPOSUSPEMPTMO'
      ''
      'WHERE'
      '   IDTIPOSUSPEMPTMO NOT IN'
      '   ('
      '   SELECT'
      '      IDTIPOSUSPEMPTMO'
      '   FROM'
      '      TIPOCONTRXSUSP'
      '   WHERE'
      '      ( IDTIPOCONTREMPTMO =:IDTIPOCONTREMPTMO )'
      '   )'
      'ORDER BY'
      '   TSEDESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTipoSuspensaoTSEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Suspensão'
      DisplayWidth = 60
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryTipoSuspensaoIDTIPOSUSPEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSUSPEMPTMO'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 56
    Top = 200
  end
  object dsItens: TwwDataSource
    DataSet = qryItens
    Left = 659
    Top = 144
  end
  object qryItens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCS.IDTIPOCONTREMPTMO, TCS.IDTIPOSUSPEMPTMO,'
      '   TCE.IDTIPOCONTREMPTMO, TSE.IDTIPOSUSPEMPTMO,'
      '   TCE.TCEDESCRICAO     , TSE.TSEDESCRICAO'
      ''
      'FROM'
      '   TIPOCONTRXSUSP  TCS,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOSUSPEMPTMO  TSE'
      ''
      'WHERE'
      '       ( TCE.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO )'
      '   AND ( TCS.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO )'
      '   AND ( TSE.IDTIPOSUSPEMPTMO  = TCS.IDTIPOSUSPEMPTMO )'
      ''
      'ORDER BY'
      ''
      '   TSE.TSEDESCRICAO'
      ' '
      ' ')
    UpdateObject = updItens
    ValidateWithMask = True
    Left = 656
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end>
    object qryItensTSEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Suspensão'
      DisplayWidth = 60
      FieldName = 'TSEDESCRICAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEDESCRICAO'
      Size = 60
    end
    object qryItensIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXSUSP.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryItensIDTIPOSUSPEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXSUSP.IDTIPOSUSPEMPTMO'
      Visible = False
    end
    object qryItensIDTIPOCONTREMPTMO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO_1'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryItensIDTIPOSUSPEMPTMO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSUSPEMPTMO_1'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDTIPOSUSPEMPTMO'
      Visible = False
    end
    object qryItensTCEDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Visible = False
      Size = 60
    end
  end
  object dsTipoSuspensao: TDataSource
    DataSet = qryTipoSuspensao
    Left = 256
    Top = 152
  end
  object updTipoSuspensao: TUpdateSQL
    Left = 256
    Top = 208
  end
  object updItens: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCONTRXSUSP'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO')
    InsertSQL.Strings = (
      'insert into TIPOCONTRXSUSP'
      '  (IDTIPOCONTREMPTMO, IDTIPOSUSPEMPTMO)'
      'values'
      '  (:IDTIPOCONTREMPTMO, :IDTIPOSUSPEMPTMO)')
    DeleteSQL.Strings = (
      'delete from TIPOCONTRXSUSP'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDTIPOSUSPEMPTMO = :OLD_IDTIPOSUSPEMPTMO')
    Left = 664
    Top = 200
  end
end
