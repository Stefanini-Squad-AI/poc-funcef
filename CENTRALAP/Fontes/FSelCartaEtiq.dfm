inherited FrmSelCartaEtiq: TFrmSelCartaEtiq
  Left = 218
  Top = 212
  HelpContext = 190029
  Caption = 'Complementos Para Emissão da RUBS'
  ClientHeight = 167
  ClientWidth = 372
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 372
    Height = 128
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 94
      Height = 13
      Caption = 'Modelo de Carta'
    end
    object Label2: TLabel
      Left = 17
      Top = 65
      Width = 111
      Height = 13
      Caption = 'Modelo de Etiqueta'
    end
    object CmbModeloCarta: TCMDBLookupCombo
      Left = 17
      Top = 32
      Width = 341
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRUB'#9'60'#9'Descrição')
      DataField = 'IDCARTAPADRAO'
      DataSource = DsParam
      LookupTable = QryModeloCarta
      LookupField = 'IDCONFIGRUBS'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object CmbModeloEtiqueta: TCMDBLookupCombo
      Left = 17
      Top = 85
      Width = 341
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRUB'#9'60'#9'Descrição')
      DataField = 'IDETIQPADRAO'
      DataSource = DsParam
      LookupTable = QryModeloEtiqueta
      LookupField = 'IDCONFIGRUBS'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 128
    Width = 372
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 133
    Top = 238
  end
  object QryModeloCarta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCONFIGRUBS, DESCRUB  FROM CONFIGRUBS WHERE FLGTIPOARQUI' +
        'VO = '#39'C'#39)
    ValidateWithMask = True
    Left = 250
    Top = 15
    object QryModeloCartaDESCRUB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = '"CM.CONFIGRUBS".DESCRUB'
      Size = 60
    end
    object QryModeloCartaIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = '"CM.CONFIGRUBS".IDCONFIGRUBS'
      Visible = False
    end
  end
  object QryModeloEtiqueta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCONFIGRUBS, DESCRUB  FROM CONFIGRUBS WHERE FLGTIPOARQUI' +
        'VO = '#39'E'#39)
    ValidateWithMask = True
    Left = 250
    Top = 60
    object QryModeloEtiquetaDESCRUB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = '"CM.CONFIGRUBS".DESCRUB'
      Size = 60
    end
    object QryModeloEtiquetaIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = '"CM.CONFIGRUBS".IDCONFIGRUBS'
      Visible = False
    end
  end
  object QryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCARTAPADRAO, IDETIQPADRAO, IDPESSOA'
      'FROM '
      '  PARAMCENTRALAP '
      'WHERE '
      '  IDPESSOA = :IDPESSOA')
    UpdateObject = UpdParam
    ValidateWithMask = True
    Left = 150
    Top = 10
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryParamIDCARTAPADRAO: TFloatField
      FieldName = 'IDCARTAPADRAO'
      Origin = 'PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object QryParamIDETIQPADRAO: TFloatField
      FieldName = 'IDETIQPADRAO'
      Origin = 'PARAMCENTRALAP.IDETIQPADRAO'
    end
    object QryParamIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMCENTRALAP.IDPESSOA'
    end
  end
  object UpdParam: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCENTRALAP'
      'set'
      '  IDCARTAPADRAO = :IDCARTAPADRAO,'
      '  IDETIQPADRAO = :IDETIQPADRAO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMCENTRALAP'
      '  (IDCARTAPADRAO, IDETIQPADRAO, IDPESSOA)'
      'values'
      '  (:IDCARTAPADRAO, :IDETIQPADRAO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PARAMCENTRALAP'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 150
    Top = 55
  end
  object DsParam: TDataSource
    DataSet = QryParam
    Left = 152
    Top = 102
  end
end
