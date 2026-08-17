inherited frmRelIndicadores: TfrmRelIndicadores
  Left = 53
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Indicadores por Imóvel'
  ClientHeight = 374
  ClientWidth = 696
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 696
    Height = 341
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 38
      Height = 13
      Caption = 'Imóvel'
    end
    object Label2: TLabel
      Left = 16
      Top = 50
      Width = 107
      Height = 13
      Caption = 'Tipos de Indicador'
    end
    object Bevel2: TBevel
      Left = 504
      Top = 72
      Width = 177
      Height = 3
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 512
      Top = 10
      Width = 83
      Height = 13
      Caption = 'Tipos de Valor'
    end
    object Label4: TLabel
      Left = 320
      Top = 50
      Width = 72
      Height = 13
      Caption = 'Ordenar por:'
    end
    object DBgrdPrincipal: TwwDBGrid2
      Left = 16
      Top = 104
      Width = 666
      Height = 217
      TabStop = False
      Selected.Strings = (
        'INMDESCRICAO'#9'30'#9'Indicador'
        'Tipo'#9'15'#9'Tipo'
        'IXIVALOR'#9'18'#9'Valor'
        'Simbolo'#9'1'#9'  '
        'IXIDATAMEDICAO'#9'12'#9'Data Apuração'
        'IXIVALOROM'#9'20'#9'Valor OM'
        'MOESIGLA'#9'10'#9'Moeda')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsExibe
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DBgrdPrincipalCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdPrincipalTopRowChanged
    end
    object DBcboIndicador: TwwDBLookupCombo
      Left = 16
      Top = 64
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'INMDESCRICAO'#9'60'#9'INMDESCRICAO')
      LookupTable = qryLookIndicador
      LookupField = 'IDINDICADORIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DBcboIndicadorChange
    end
    object DBcboImovel: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 457
      Height = 21
      TabStop = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'IMONOME'#9'60'#9'IMONOME')
      LookupField = 'IDIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      AutoDropDown = False
      ShowButton = False
      AllowClearKey = False
      OnChange = DBcboImovelChange
    end
    object btnBuscaImovel: TBitBtn
      Left = 473
      Top = 23
      Width = 23
      Height = 22
      TabOrder = 3
      OnClick = btnBuscaImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      Spacing = 1
    end
    object cboTipoIndicador: TComboBox
      Left = 512
      Top = 24
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = DBcboImovelChange
      OnKeyPress = cboTipoIndicadorKeyPress
      Items.Strings = (
        '< Todos >'
        'Monetários'
        'Percentuais'
        'Quantitativos')
    end
    object cboOrdenacao: TComboBox
      Left = 320
      Top = 64
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = DBcboImovelChange
      OnKeyPress = cboTipoIndicadorKeyPress
      Items.Strings = (
        'Data de Apuração'
        'Nome do Indicador')
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 696
    inherited tb97Fundo: TToolbar97
      Left = 417
      DockPos = 417
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLookImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDIMOVEL, IMONOME'
      'FROM'
      '  IMOVEL'
      'WHERE'
      '  IDIMOVEL =:IMOVEL')
    ValidateWithMask = True
    Left = 192
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookImovelIMONOME: TStringField
      DisplayLabel = 'Nome do Imóvel'
      DisplayWidth = 60
      FieldName = 'IMONOME'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryLookImovelIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVEL.IDIMOVEL'
      Visible = False
    end
  end
  object qryLookIndicador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDINDICADORIMOVEL, INMDESCRICAO'
      'FROM'
      '  INDICADORIMOVEL'
      'ORDER BY'
      '  INMDESCRICAO')
    ValidateWithMask = True
    Left = 192
    Top = 216
    object qryLookIndicadorIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Origin = 'INDICADORIMOVEL.IDINDICADORIMOVEL'
      Visible = False
    end
    object qryLookIndicadorINMDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Origin = 'INDICADORIMOVEL.INMDESCRICAO'
      Size = 60
    end
  end
  object dsExibe: TwwDataSource
    AutoEdit = False
    Left = 296
    Top = 240
  end
  object qryExibePorData: TwwQuery
    OnCalcFields = qryExibePorDataCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDIMOVEL, X.IDINDICADORIMOVEL, X.IXIDATAMEDICAO,'
      '   X.MOECODIGO, X.IXIVALOR, X.IXIVALOROM,'
      '   I.INMDESCRICAO, I.FLGTIPOVALOR,'
      '   M.MOESIGLA'
      'FROM'
      '   INDICADORXIMOVEL X, INDICADORIMOVEL I, MOEDA M'
      'WHERE'
      '   ('
      '   ( X.IDIMOVEL BETWEEN :IMOINI AND :IMOFIM ) AND'
      '   ( X.IDINDICADORIMOVEL BETWEEN :INDINI AND :INDFIM ) AND'
      '   ( I.FLGTIPOVALOR BETWEEN :TIPINI AND :TIPFIM )'
      '   )'
      '   AND'
      '   ('
      '   ( X.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL ) AND'
      '   ( X.MOECODIGO = M.MOECODIGO (+) )'
      '   )'
      'ORDER BY'
      '   X.IXIDATAMEDICAO DESC, I.INMDESCRICAO ASC')
    ValidateWithMask = True
    Left = 296
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INDINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INDFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPFIM'
        ParamType = ptUnknown
      end>
    object qryExibePorDataINMDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Indicador'
      DisplayWidth = 30
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object qryExibePorDataTipo: TStringField
      DisplayLabel = 'Tipo de Valor'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Tipo'
      Size = 15
      Calculated = True
    end
    object qryExibePorDataIXIVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'IXIVALOR'
      DisplayFormat = '###,###,###,###,##0.000000'
      EditFormat = '###,###,###,###,##0.000000'
    end
    object qryExibePorDataSimbolo: TStringField
      Alignment = taCenter
      DisplayLabel = '  '
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Simbolo'
      Size = 1
      Calculated = True
    end
    object qryExibePorDataIXIDATAMEDICAO: TDateTimeField
      DisplayLabel = 'Data Apuração'
      DisplayWidth = 12
      FieldName = 'IXIDATAMEDICAO'
    end
    object qryExibePorDataIXIVALOROM: TFloatField
      DisplayLabel = 'Valor OM'
      DisplayWidth = 20
      FieldName = 'IXIVALOROM'
      DisplayFormat = '###,###,###,###,##0.000000'
      EditFormat = '###,###,###,###,##0.000000'
    end
    object qryExibePorDataMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryExibePorDataMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryExibePorDataFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      Size = 1
    end
    object qryExibePorDataIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryExibePorDataIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
  object qryExibePorIndicador: TwwQuery
    OnCalcFields = qryExibePorIndicadorCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDIMOVEL, X.IDINDICADORIMOVEL, X.IXIDATAMEDICAO,'
      '   X.MOECODIGO, X.IXIVALOR, X.IXIVALOROM,'
      '   I.INMDESCRICAO, I.FLGTIPOVALOR,'
      '   M.MOESIGLA'
      'FROM'
      '   INDICADORXIMOVEL X, INDICADORIMOVEL I, MOEDA M'
      'WHERE'
      '   ('
      '   ( X.IDIMOVEL BETWEEN :IMOINI AND :IMOFIM ) AND'
      '   ( X.IDINDICADORIMOVEL BETWEEN :INDINI AND :INDFIM ) AND'
      '   ( I.FLGTIPOVALOR BETWEEN :TIPINI AND :TIPFIM )'
      '   )'
      '   AND'
      '   ('
      '   ( X.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL ) AND'
      '   ( X.MOECODIGO = M.MOECODIGO (+) )'
      '   )'
      'ORDER BY'
      '   I.INMDESCRICAO ASC, X.IXIDATAMEDICAO DESC')
    ValidateWithMask = True
    Left = 296
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INDINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INDFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPFIM'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Tipo de Indicador'
      DisplayWidth = 30
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo de Valor'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Tipo'
      Size = 15
      Calculated = True
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'IXIVALOR'
      DisplayFormat = '###,###,###,###,##0.000000'
      EditFormat = '###,###,###,###,##0.000000'
    end
    object StringField3: TStringField
      Alignment = taCenter
      DisplayLabel = '  '
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Simbolo'
      Size = 1
      Calculated = True
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Apuração'
      DisplayWidth = 12
      FieldName = 'IXIDATAMEDICAO'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor OM'
      DisplayWidth = 20
      FieldName = 'IXIVALOROM'
      DisplayFormat = '###,###,###,###,##0.000000'
      EditFormat = '###,###,###,###,##0.000000'
    end
    object StringField4: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object FloatField3: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      Size = 1
    end
    object FloatField4: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
end
