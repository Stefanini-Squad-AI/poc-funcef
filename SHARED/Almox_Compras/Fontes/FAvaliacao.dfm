inherited FrmAvaliacao: TFrmAvaliacao
  Left = 5
  Top = 155
  Caption = 'Avaliação de Fornecedor'
  ClientWidth = 772
  FormStyle = fsNormal
  KeyPreview = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 185
    Top = 0
    Width = 8
    Height = 234
    Cursor = crHSplit
  end
  inherited pnlFundo: TPanel
    Left = 193
    Width = 579
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 569
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 71
        Height = 15
        Caption = 'Fornecedor :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbForn: TLabel
        Left = 82
        Top = 6
        Width = 295
        Height = 16
        AutoSize = False
        Caption = 'Airto Senna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 383
        Top = 6
        Width = 47
        Height = 15
        Caption = 'Nota Nº :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbNota: TLabel
        Left = 434
        Top = 6
        Width = 129
        Height = 15
        Caption = '213123123112134/909'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GrdCrit: TwwDBGrid
      Left = 5
      Top = 33
      Width = 569
      Height = 196
      Selected.Strings = (
        'DESCCRITAVALIACAO'#9'46'#9'Critério'
        'PESO'#9'10'#9'Peso'
        'NOTA'#9'10'#9'Nota')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsCrit
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnColExit = GrdCritColExit
      OnDblClick = GrdCritDblClick
      OnKeyPress = GrdCritKeyPress
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 590
      DockPos = 590
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 422
      DockPos = 422
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  object plnGrd: TPanel [3]
    Left = 0
    Top = 0
    Width = 185
    Height = 234
    Align = alLeft
    BevelInner = bvLowered
    Caption = 'plnGrd'
    TabOrder = 2
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 181
      Height = 31
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Tipos de Avaliação'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Grd: TwwDBGrid
      Left = 2
      Top = 33
      Width = 181
      Height = 199
      Selected.Strings = (
        'DESCTIPOAVALIACAO'#9'50'#9'Avaliação')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTipo
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 539
  end
  object qryTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '      TA.IDTIPOAVALIACAO,     '
      '      TA.DESCTIPOAVALIACAO'
      'FROM '
      '  TIPOAVALIACAO TA'
      'ORDER BY TA.DESCTIPOAVALIACAO')
    ValidateWithMask = True
    Left = 311
    Top = 232
    object qryTipoDESCTIPOAVALIACAO: TStringField
      DisplayLabel = 'Avaliação'
      DisplayWidth = 50
      FieldName = 'DESCTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.DESCTIPOAVALIACAO'
      Size = 50
    end
    object qryTipoIDTIPOAVALIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.IDTIPOAVALIACAO'
      Visible = False
    end
  end
  object dsTipo: TwwDataSource
    AutoEdit = False
    DataSet = qryTipo
    OnDataChange = dsTipoDataChange
    Left = 349
    Top = 232
  end
  object qryCrit: TwwQuery
    CachedUpdates = True
    OnNewRecord = qryCritNewRecord
    OnPostError = qryCritPostError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '             IDTIPOAVALIACAO,'
      '             IDCRITAVALIACAO,'
      '             DESCCRITAVALIACAO,'
      '             PESO,'
      '             (10) AS NOTA'
      'FROM'
      '            CRITAVALIACAO'
      'ORDER BY DESCCRITAVALIACAO')
    UpdateObject = updCrit
    ValidateWithMask = True
    Left = 399
    Top = 232
    object qryCritDESCCRITAVALIACAO: TStringField
      DisplayLabel = 'Critério'
      DisplayWidth = 46
      FieldName = 'DESCCRITAVALIACAO'
      Size = 50
    end
    object qryCritPESO: TFloatField
      DisplayLabel = 'Peso'
      DisplayWidth = 10
      FieldName = 'PESO'
    end
    object qryCritNOTA: TFloatField
      DisplayLabel = 'Nota'
      DisplayWidth = 10
      FieldName = 'NOTA'
      DisplayFormat = '#,##0.00'
    end
    object qryCritIDCRITAVALIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCRITAVALIACAO'
      Visible = False
    end
    object qryCritIDTIPOAVALIACAO: TFloatField
      FieldName = 'IDTIPOAVALIACAO'
    end
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 261
    Top = 232
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '           IDAVALIACAO,'
      '           IDCRITAVALIACAO,'
      '           PESO,'
      '           NOTA'
      'FROM'
      '          ITEMAVALIACAO'
      'WHERE'
      '         (IDAVALIACAO =:pIDAVALI)'
      '           ')
    UpdateObject = upDet
    ValidateWithMask = True
    Left = 231
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDAVALI'
        ParamType = ptUnknown
      end>
    object qryDetIDAVALIACAO: TFloatField
      FieldName = 'IDAVALIACAO'
      Origin = 'ITEMAVALIACAO.IDAVALIACAO'
    end
    object qryDetIDCRITAVALIACAO: TFloatField
      FieldName = 'IDCRITAVALIACAO'
      Origin = 'ITEMAVALIACAO.IDCRITAVALIACAO'
    end
    object qryDetPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'ITEMAVALIACAO.PESO'
    end
    object qryDetNOTA: TFloatField
      FieldName = 'NOTA'
      Origin = 'ITEMAVALIACAO.NOTA'
    end
  end
  object upDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMAVALIACAO'
      'set'
      '  IDAVALIACAO = :IDAVALIACAO,'
      '  IDCRITAVALIACAO = :IDCRITAVALIACAO,'
      '  PESO = :PESO,'
      '  NOTA = :NOTA'
      'where'
      '  IDAVALIACAO = :OLD_IDAVALIACAO and'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    InsertSQL.Strings = (
      'insert into ITEMAVALIACAO'
      '  (IDAVALIACAO, IDCRITAVALIACAO, PESO, NOTA)'
      'values'
      '  (:IDAVALIACAO, :IDCRITAVALIACAO, :PESO, :NOTA)')
    DeleteSQL.Strings = (
      'delete from ITEMAVALIACAO'
      'where'
      '  IDAVALIACAO = :OLD_IDAVALIACAO and'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    Left = 201
    Top = 232
  end
  object dsCrit: TwwDataSource
    Tag = 96
    AutoEdit = False
    DataSet = qryCrit
    Left = 437
    Top = 232
  end
  object updCrit: TUpdateSQL
    ModifySQL.Strings = (
      'update CRITAVALIACAO'
      'set'
      '  IDCRITAVALIACAO = :IDCRITAVALIACAO,'
      '  DESCCRITAVALIACAO = :DESCCRITAVALIACAO,'
      '  PESO = :PESO,'
      '  NOTA = :NOTA'
      'where'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    InsertSQL.Strings = (
      'insert into CRITAVALIACAO'
      '  (IDCRITAVALIACAO, DESCCRITAVALIACAO, PESO, NOTA)'
      'values'
      '  (:IDCRITAVALIACAO, :DESCCRITAVALIACAO, :PESO, :NOTA)')
    DeleteSQL.Strings = (
      'delete from CRITAVALIACAO'
      'where'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    Left = 473
    Top = 232
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '           IDAVALIACAO,'
      '           IDNFRECEBDEVOL,'
      '           CODDOCUMENTO,'
      '           NOTA'
      'FROM'
      '          AVALIACAO'
      'WHERE'
      '         (IDAVALIACAO =:pIDAVALI)'
      '           ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 135
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDAVALI'
        ParamType = ptUnknown
      end>
    object qryIDAVALIACAO: TFloatField
      FieldName = 'IDAVALIACAO'
      Origin = 'AVALIACAO.IDAVALIACAO'
    end
    object qryIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Origin = 'AVALIACAO.IDNFRECEBDEVOL'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'AVALIACAO.CODDOCUMENTO'
    end
    object qryNOTA: TFloatField
      FieldName = 'NOTA'
      Origin = 'AVALIACAO.NOTA'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 165
    Top = 232
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update AVALIACAO'
      'set'
      '  IDAVALIACAO = :IDAVALIACAO,'
      '  IDNFRECEBDEVOL = :IDNFRECEBDEVOL,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  NOTA = :NOTA'
      'where'
      '  IDAVALIACAO = :OLD_IDAVALIACAO')
    InsertSQL.Strings = (
      'insert into AVALIACAO'
      '  (IDAVALIACAO, IDNFRECEBDEVOL, CODDOCUMENTO, NOTA)'
      'values'
      '  (:IDAVALIACAO, :IDNFRECEBDEVOL, :CODDOCUMENTO, :NOTA)')
    DeleteSQL.Strings = (
      'delete from AVALIACAO'
      'where'
      '  IDAVALIACAO = :OLD_IDAVALIACAO')
    Left = 105
    Top = 232
  end
end
