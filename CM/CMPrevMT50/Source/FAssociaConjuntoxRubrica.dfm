inherited FrmAssociaConjuntoxRubrica: TFrmAssociaConjuntoxRubrica
  Left = 563
  Top = 438
  HelpContext = 180066
  BorderStyle = bsSingle
  Caption = 'Associação de rubricas'
  ClientHeight = 387
  ClientWidth = 861
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 861
    Height = 348
    object Panel5: TPanel
      Left = 1
      Top = 75
      Width = 859
      Height = 272
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbPlanoNao: TLabel
        Left = 451
        Top = 5
        Width = 223
        Height = 23
        Caption = 'Rubricas não Associadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object sbtnAssocia: TSpeedButton
        Left = 416
        Top = 84
        Width = 25
        Height = 27
        Hint = 'Associar rubrica selecionada'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 416
        Top = 114
        Width = 25
        Height = 27
        Hint = 'Associar todas as rubricas'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 416
        Top = 144
        Width = 25
        Height = 27
        Hint = 'Desassociar rubrica selecionada'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 416
        Top = 174
        Width = 25
        Height = 26
        Hint = 'Desassociar todas as rubrica'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object lblPlanPatro: TLabel
        Left = 7
        Top = 6
        Width = 78
        Height = 23
        Anchors = [akTop]
        Caption = 'Rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dbgrdPlanPatro: TwwDBGrid
        Left = 6
        Top = 35
        Width = 400
        Height = 230
        Selected.Strings = (
          'CODPROVDESC'#9'10'#9'Código'
          'DESCRICAO'#9'130'#9'Descrição'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DsProvDescAssoc
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object wwDBGrid1: TwwDBGrid
        Left = 451
        Top = 35
        Width = 400
        Height = 230
        Selected.Strings = (
          'CODPROVDESC'#9'10'#9'Código'
          'DESCRICAO'#9'130'#9'Descrição'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DsProvDesc
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object btnProcRXP: TBitBtn
        Left = 322
        Top = 9
        Width = 84
        Height = 22
        Hint = 'Procurar Rubrica'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProcRXPClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object btnProcProv: TBitBtn
        Left = 767
        Top = 9
        Width = 84
        Height = 22
        Hint = 'Procurar Rubrica'
        Anchors = [akTop, akRight]
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnProcProvClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
    object PnlFiltros: TPanel
      Left = 1
      Top = 1
      Width = 859
      Height = 74
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 22
        Top = 13
        Width = 180
        Height = 23
        Caption = 'Conjunto de rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 622
        Top = 13
        Width = 150
        Height = 23
        Caption = 'Código resumido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object DbLknConjuntoRubrica: TwwDBLookupCombo
        Left = 22
        Top = 39
        Width = 571
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F'
          'CODIGO'#9'10'#9'Código'#9'F')
        LookupTable = CdsConjuntoRubrica
        LookupField = 'IDCONJUNTORUBRICA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = DbLknConjuntoRubricaCloseUp
      end
      object dbeCodigoConjunto: TDBEdit
        Left = 622
        Top = 39
        Width = 121
        Height = 21
        Color = clScrollBar
        DataField = 'CODIGO'
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 861
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 387
    Top = 8
  end
  object CdsProvDesc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 259
    Top = 8
    object CdsProvDescCODPROVDESC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object CdsProvDescDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 130
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object CdsProvDescIDPROVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object DsProvDesc: TDataSource
    DataSet = CdsProvDesc
    Left = 288
    Top = 8
  end
  object CdsProvDescAssoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 323
    Top = 8
    object CdsProvDescAssocCODPROVDESC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object CdsProvDescAssocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 130
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object CdsProvDescAssocIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object DsProvDescAssoc: TDataSource
    DataSet = CdsProvDescAssoc
    Left = 352
    Top = 8
  end
  object CdsConjuntoRubrica: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 427
    Top = 8
    Data = {
      B00000009619E0BD0100000018000000030001000000030000007A0011494443
      4F4E4A554E544F5255425249434108000400000000000944455343524943414F
      010049000000010005574944544802000200320006434F4449474F0100490000
      000100055749445448020002000A000100044C43494404000100090800000000
      000000000000F03F20477275706F2064652073616CE172696F20646520706172
      746963697061E7E36F0A4752505F53414C504152}
  end
  object DsConjuntoRubrica: TDataSource
    DataSet = CdsConjuntoRubrica
    Left = 456
    Top = 8
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   PRV.CODPROVDESC, PRV.IDPROVENTO, PRV.DESCRICAO FROM   P' +
        'ROVDESC PRV WHERE   PRV.IDPROVENTO NOT IN ( SELECT CXR.IDRUBRICA' +
        ' FROM                           CONJUNTORUBXRUB CXR             ' +
        '                    WHERE IDCONJUNTORUBRICA = 1) ORDER BY PRV.DE' +
        'SCRICAO ')
    Left = 504
    Top = 7
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 533
    Top = 7
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 563
    Top = 7
  end
  object MontaBuscaRubrica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.DESCRICAO'
      'P.DESCRPROVDESC'
      'P.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição Interna'
      'Descrição Externa'
      'Código Externo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC'
      'P.FLGDESCONTO'
      'P.FLGOBRIGAFAVOREC')
    Filtro.Strings = (
      'FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '7')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 193
    Top = 8
  end
end
