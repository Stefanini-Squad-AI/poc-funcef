inherited frmTipoAltxImpostos: TfrmTipoAltxImpostos
  Left = 105
  Top = 125
  Caption = 'Impostos x Tipo de Alterador'
  ClientHeight = 414
  ClientWidth = 628
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 628
    Height = 375
    object lblImposto: TLabel
      Left = 32
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Imposto'
    end
    object dbgrTipoAltPos: TwwDBGrid
      Left = 8
      Top = 88
      Width = 289
      Height = 277
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Alteradores Possíveis')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTipoPos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 3
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
    object btnVaiUm2: TBitBtn
      Left = 303
      Top = 200
      Width = 25
      Height = 25
      TabOrder = 1
      OnClick = btnVaiUm2Click
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
    end
    object btnVoltaUm2: TBitBtn
      Left = 303
      Top = 240
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = btnVoltaUm2Click
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
    end
    object dbgrAltSel: TwwDBGrid
      Left = 331
      Top = 88
      Width = 289
      Height = 277
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Alteradores Selecionados')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 4
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
    object dblcImposto: TComboBox
      Left = 32
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = dblcImpostoChange
      Items.Strings = (
        'I.R.R.F.'
        'I.N.S.S.'
        'I.S.S.')
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 628
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
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTXIMPOSTO'
      'set'
      '  IDALTXIMPOSTO = :IDALTXIMPOSTO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  CODIMPOSTO = :CODIMPOSTO'
      'where'
      '  IDALTXIMPOSTO = :OLD_IDALTXIMPOSTO')
    InsertSQL.Strings = (
      'insert into ALTXIMPOSTO'
      '  (IDALTXIMPOSTO, CODALTERADOR, CODIMPOSTO)'
      'values'
      '  (:IDALTXIMPOSTO, :CODALTERADOR, :CODIMPOSTO)')
    DeleteSQL.Strings = (
      'delete from ALTXIMPOSTO'
      'where'
      '  IDALTXIMPOSTO = :OLD_IDALTXIMPOSTO')
    Left = 361
    Top = 16
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDALTXIMPOSTO,'
      '   I.CODALTERADOR,'
      '   I.CODIMPOSTO,'
      '   T.DESCRICAO'
      'FROM'
      '   ALTXIMPOSTO I,'
      '   TIPOALTERADOR T'
      'WHERE'
      '     (I.CODIMPOSTO    = :CODIMPOSTO)'
      ' AND (T.IDPESSOA      = :IDPESSOA)'
      ' AND (T.RECPAG        = '#39'P'#39')'
      ' AND (T.CODALTERADOR  = I.CODALTERADOR)')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 391
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIMPOSTO'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Alteradores Selecionados'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryIDALTXIMPOSTO: TFloatField
      FieldName = 'IDALTXIMPOSTO'
      Origin = 'ALTXIMPOSTO.IDALTXIMPOSTO'
      Visible = False
    end
    object qryCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'ALTXIMPOSTO.CODALTERADOR'
      Visible = False
    end
    object qryCODIMPOSTO: TFloatField
      FieldName = 'CODIMPOSTO'
      Origin = 'ALTXIMPOSTO.CODIMPOSTO'
      Visible = False
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 421
    Top = 16
  end
  object updTipoPos: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTXIMPOSTO'
      'set'
      '  IDALTXIMPOSTO = :IDALTXIMPOSTO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  CODIMPOSTO = :CODIMPOSTO'
      'where'
      '  IDALTXIMPOSTO = :OLD_IDALTXIMPOSTO')
    InsertSQL.Strings = (
      'insert into ALTXIMPOSTO'
      '  (IDALTXIMPOSTO, CODALTERADOR, CODIMPOSTO)'
      'values'
      '  (:IDALTXIMPOSTO, :CODALTERADOR, :CODIMPOSTO)')
    DeleteSQL.Strings = (
      'delete from ALTXIMPOSTO'
      'where'
      '  IDALTXIMPOSTO = :OLD_IDALTXIMPOSTO')
    Left = 233
    Top = 16
  end
  object qryTipoPos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODALTERADOR,'
      '   DESCRICAO'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '      (IDPESSOA      = :IDPESSOA)'
      '  AND (RECPAG        = '#39'P'#39')'
      '  AND (CODALTERADOR NOT IN (SELECT CODALTERADOR'
      '                              FROM ALTXIMPOSTO'
      
        '                             WHERE LTRIM(RTRIM(CODALTERADOR)) = ' +
        #39#39'))')
    UpdateObject = updTipoPos
    ValidateWithMask = True
    Left = 263
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryTipoPosDESCRICAO: TStringField
      DisplayLabel = 'Alteradores Possíveis'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryTipoPosCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
  end
  object dsTipoPos: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoPos
    Left = 293
    Top = 16
  end
end
