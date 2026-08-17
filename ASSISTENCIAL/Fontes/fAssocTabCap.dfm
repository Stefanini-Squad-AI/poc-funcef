inherited frmAssocTabCap: TfrmAssocTabCap
  Left = 79
  Top = 44
  ActiveControl = pnlFundo
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Associação de Plano a Tabela de Capitais de Seguro'
  ClientHeight = 456
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 136
    Top = 146
    Width = 169
    Height = 13
    Caption = 'Tabela de Capitais de Seguro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Dock971: TDock97 [1]
    Top = 417
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 468
      DockPos = 599
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 634
    Height = 417
    object Label4: TLabel
      Left = 298
      Top = 200
      Width = 169
      Height = 13
      Caption = 'Tabela de Capitais de Seguro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 14
      Top = 7
      Width = 58
      Height = 13
      Caption = 'Resultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 202
      Width = 100
      Height = 13
      Caption = 'Tabela de Planos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgCpLayout: TwwDBGrid
      Left = 296
      Top = 215
      Width = 329
      Height = 146
      Hint = 'Selecione o campo da tabela e o plano '
      PictureMaskFromDataSet = False
      Selected.Strings = (
        'DESCPLANO'#9'27'#9'Descrição'
        'TIPOSEG'#9'7'#9'Segurado'
        'CAPITALMN'#9'10'#9'Capital MN'
        'CAPITALIP'#9'10'#9'Capital IP'
        'CAPITALMA'#9'10'#9'Capital MA')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTabCap
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowSelect, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object dbgLgLayout: TwwDBGrid
      Left = 10
      Top = 21
      Width = 615
      Height = 172
      Selected.Strings = (
        'NOME'#9'40'#9'Plano'
        'DESCPLANO'#9'40'#9'Descricão do Plano Tabela de Capitais'
        'TIPOSEG'#9'7'#9'Tipo Segurado'
        'CAPITALMN'#9'10'#9'Capital MN'
        'CAPITALIP'#9'10'#9'Capital IP'
        'CAPITALMA'#9'10'#9'Capital MA'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsAssoc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 361
      Width = 613
      Height = 47
      TabOrder = 2
      object Label3: TLabel
        Left = 12
        Top = 18
        Width = 140
        Height = 13
        Caption = 'Data Início da Vigência '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnAssocia: TButton
        Left = 340
        Top = 13
        Width = 129
        Height = 28
        Caption = '&Coloca Associação'
        TabOrder = 0
        OnClick = BtnAssociaClick
      end
      object DtVigencia: TDateTimePicker
        Left = 153
        Top = 16
        Width = 97
        Height = 21
        CalAlignment = dtaLeft
        Date = 37012.4725606482
        Time = 37012.4725606482
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
  end
  object wwDBGrid1: TwwDBGrid [3]
    Left = 11
    Top = 217
    Width = 278
    Height = 144
    Hint = 'Escolha o tipo de layout para exibir a definiçao do layout.'
    PictureMaskFromDataSet = False
    Selected.Strings = (
      'NOME'#9'40'#9'Plano')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsPlanass
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgRowSelect, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    IndicatorColor = icBlack
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 336
    Top = 91
  end
  object qryTabCap: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCAPSEGASS, DESCPLANO,TIPOSEG,CAPITALMN,CAPITALIP,CAPITA' +
        'LMA'
      'FROM CAPSEGASS '
      'WHERE ( FLGVIGENCIA  IS NULL)  OR (FLGVIGENCIA <>'#39'0'#39')'
      'ORDER BY  ORDEM')
    ValidateWithMask = True
    Left = 378
    Top = 91
    object qryTabCapDESCPLANO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 27
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
      Size = 40
    end
    object qryTabCapTIPOSEG: TStringField
      DisplayLabel = 'Segurado'
      DisplayWidth = 7
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qryTabCapCAPITALMN: TFloatField
      DisplayLabel = 'Capital MN'
      DisplayWidth = 10
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
    end
    object qryTabCapCAPITALIP: TFloatField
      DisplayLabel = 'Capital IP'
      DisplayWidth = 10
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
    end
    object qryTabCapCAPITALMA: TFloatField
      DisplayLabel = 'Capital MA'
      DisplayWidth = 10
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
    end
    object qryTabCapIDCAPSEGASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCAPSEGASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDCAPSEGASS'
      Visible = False
    end
  end
  object dsTabCap: TwwDataSource
    DataSet = qryTabCap
    Left = 409
    Top = 91
  end
  object qryPlanass: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, NOME'
      'FROM PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 460
    Top = 91
    object qryPlanassNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 40
    end
    object qryPlanassIDPLANASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.PLANASS.IDPLANASS'
      Visible = False
    end
  end
  object dsPlanass: TwwDataSource
    DataSet = qryPlanass
    Left = 490
    Top = 91
  end
  object qryAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PL.NOME, CP.DESCPLANO,CP.TIPOSEG,CP.CAPITALMN,CP.CAPITALI' +
        'P,CP.CAPITALMA'
      'FROM CAPSEGASS CP, PLANASS PL'
      'WHERE CP.IDPLANASS=PL.IDPLANASS AND'
      '               CP.FLGVIGENCIA='#39'1'#39
      'ORDER BY  ORDEM')
    ValidateWithMask = True
    Left = 544
    Top = 91
    object qryAssocNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 40
    end
    object qryAssocDESCPLANO: TStringField
      DisplayLabel = 'Descricão do Plano Tabela de Capitais'
      DisplayWidth = 40
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
      Size = 40
    end
    object qryAssocTIPOSEG: TStringField
      DisplayLabel = 'Tipo Segurado'
      DisplayWidth = 7
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qryAssocCAPITALMN: TFloatField
      DisplayLabel = 'Capital MN'
      DisplayWidth = 10
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
    end
    object qryAssocCAPITALIP: TFloatField
      DisplayLabel = 'Capital IP'
      DisplayWidth = 10
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
    end
    object qryAssocCAPITALMA: TFloatField
      DisplayLabel = 'Capital MA'
      DisplayWidth = 10
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
    end
  end
  object dsAssoc: TwwDataSource
    DataSet = qryAssoc
    Left = 576
    Top = 91
  end
  object qryUpd: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 464
    Top = 122
  end
end
