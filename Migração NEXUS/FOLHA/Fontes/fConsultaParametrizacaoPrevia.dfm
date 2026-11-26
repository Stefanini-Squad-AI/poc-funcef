inherited frmConsultaParametrizacaoPrevia: TfrmConsultaParametrizacaoPrevia
  Left = 447
  Top = 377
  HelpContext = 180067
  BorderStyle = bsNone
  Caption = 'Consulta Parametrização Contábil/Financeira da Prévia'
  ClientHeight = 454
  ClientWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    Height = 415
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 778
      Height = 413
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel7'
      TabOrder = 0
    end
  end
  object Panel14: TPanel [1]
    Left = 0
    Top = 0
    Width = 780
    Height = 415
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'Panel14'
    TabOrder = 2
    object pnlProgbar: TPanel
      Left = 5
      Top = 386
      Width = 769
      Height = 22
      Caption = 'pnlProgbar'
      TabOrder = 0
      object prgBar: TProgressBar
        Left = 1
        Top = 1
        Width = 767
        Height = 20
        Align = alClient
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object pctlBenefContrib: TPageControl
      Left = 5
      Top = 78
      Width = 770
      Height = 332
      ActivePage = tbsParamFinanceira
      Align = alClient
      TabOrder = 1
      object tbsParamFinanceira: TTabSheet
        Caption = 'Parametrização Financeira'
        object dpFinanceiro: TDecisionPivot
          Left = 0
          Top = 0
          Width = 762
          Height = 28
          ButtonAutoSize = True
          DecisionSource = dsFinanceiro
          GroupLayout = xtHorizontal
          Groups = [xtRows, xtColumns, xtSummaries]
          ButtonSpacing = 0
          ButtonWidth = 64
          ButtonHeight = 24
          GroupSpacing = 10
          BorderWidth = 0
          BorderStyle = bsNone
          Align = alTop
          TabOrder = 0
          Visible = False
        end
        object dgrdFinanceiro: TDecisionGrid
          Left = 0
          Top = 28
          Width = 762
          Height = 276
          DefaultColWidth = 200
          DefaultRowHeight = 20
          CaptionColor = clActiveCaption
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clCaptionText
          CaptionFont.Height = -11
          CaptionFont.Name = 'MS Sans Serif'
          CaptionFont.Style = []
          DataColor = clInfoBk
          DataSumColor = clNone
          DataFont.Charset = DEFAULT_CHARSET
          DataFont.Color = clWindowText
          DataFont.Height = -11
          DataFont.Name = 'MS Sans Serif'
          DataFont.Style = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          LabelColor = clBtnFace
          LabelSumColor = clInactiveCaption
          DecisionSource = dsFinanceiro
          Dimensions = <
            item
              FieldName = 'Patrocinadora'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Plano'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Desembolso'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Rubrica'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Quantidade'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Valor'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Average of '
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end>
          Totals = True
          ShowCubeEditor = False
          Align = alClient
          Color = clBtnFace
          GridLineWidth = 1
          GridLineColor = clWindowText
          TabOrder = 1
        end
      end
      object tbsParamContabil: TTabSheet
        Caption = 'Parametrização Contábil'
        ImageIndex = 1
        object dpContabil: TDecisionPivot
          Left = 0
          Top = 0
          Width = 762
          Height = 28
          ButtonAutoSize = True
          DecisionSource = dsContabil
          GroupLayout = xtHorizontal
          Groups = [xtRows, xtColumns, xtSummaries]
          ButtonSpacing = 0
          ButtonWidth = 64
          ButtonHeight = 24
          GroupSpacing = 10
          BorderWidth = 0
          BorderStyle = bsNone
          Align = alTop
          TabOrder = 0
          Visible = False
        end
        object dgrdContrib: TDecisionGrid
          Left = 0
          Top = 28
          Width = 762
          Height = 276
          DefaultColWidth = 102
          DefaultRowHeight = 20
          CaptionColor = clActiveCaption
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clCaptionText
          CaptionFont.Height = -11
          CaptionFont.Name = 'MS Sans Serif'
          CaptionFont.Style = []
          DataColor = clInfoBk
          DataSumColor = clNone
          DataFont.Charset = DEFAULT_CHARSET
          DataFont.Color = clWindowText
          DataFont.Height = -11
          DataFont.Name = 'MS Sans Serif'
          DataFont.Style = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          LabelColor = clBtnFace
          LabelSumColor = clInactiveCaption
          DecisionSource = dsContabil
          Dimensions = <
            item
              FieldName = 'Plano'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'PATRO'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'CODRUB'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'RUBRICA'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'CONTACREDITO'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'QUANTIDADE'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'VALOR'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'Average of '
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end>
          Totals = False
          ShowCubeEditor = False
          Align = alClient
          Color = clBtnFace
          GridLineWidth = 1
          GridLineColor = clWindowText
          TabOrder = 1
        end
      end
    end
    object pctlSelecao: TPageControl
      Left = 5
      Top = 5
      Width = 770
      Height = 73
      ActivePage = tbsHistorico
      Align = alTop
      TabOrder = 2
      object tbsHistorico: TTabSheet
        Caption = 'Lote de Manutenção'
        object dblkFolha: TwwDBLookupCombo
          Left = 17
          Top = 10
          Width = 568
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'80'#9'Descrição'#9'F'
            'MESREFERENCIA'#9'7'#9'Mês'#9'F')
          LookupTable = qryLote
          LookupField = 'IDLOTE'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblkFolhaChange
        end
        object fcsbtnHistorico: TfcShapeBtn
          Left = 608
          Top = 5
          Width = 145
          Height = 33
          Caption = 'Processa'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Enabled = False
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          Shape = bsRoundRect
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = fcsbtnHistoricoClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 780
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 584
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 65527
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, MESREFERENCIA, IDLOTE||'#39' - '#39'||DESCRICAO AS DESCRI' +
        'CAO'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND IDREFERENCIA IS NULL'
      'AND FLGTIPOFOLHA IN (0,3,4,6)'
      'AND NVL(FLGCONCESSAO, 0) = 0'
      'ORDER BY MESREFERENCIA DESC, IDLOTE DESC'
      ' ')
    ValidateWithMask = True
    Left = 492
    Top = 13
    object qryLoteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object qryLoteMESREFERENCIA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryLoteIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Visible = False
    end
  end
  object dqryFinanceiro: TDecisionQuery
    AfterOpen = dqryFinanceiroAfterOpen
    AfterClose = dqryFinanceiroAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT QUANTIDADE, VALOR, PATRO, PLANO, CODDESEMB, RUBRICA'
      'FROM ('
      'SELECT COUNT(*) AS QUANTIDADE,'
      
        'SUM(DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO,0)' +
        ') AS VALOR,'
      'PT.NOME AS PATRO,'
      'PP.NOME AS PLANO,'
      'H.CODTIPRECDES AS CODDESEMB,'
      'P.CODPROVDESC||'#39'-'#39'||P.DESCRICAO AS RUBRICA'
      
        'FROM PREVIA H, PROVDESC P, PESSOA PT, PLANPREVCONTABIL PP, TIPOR' +
        'ECEBDESEMB T'
      'WHERE H.IDLOTE = 786999'
      'AND H.IDRUBRICA = P.IDPROVENTO'
      'AND P.FLGDESCONTO IN (0,1)'
      'AND P.FLGESPECIAL = 0'
      'AND H.IDPLANOCONTABIL = PP.IDPLANOPREV'
      'AND H.IDPATRO = PT.IDPESSOA'
      'AND H.FLGTIPODESC <> '#39'K'#39
      'AND H.CODTIPRECDES = T.CODTIPRECDES(+)'
      'AND '#39'P'#39' = T.RECPAG(+)'
      
        'GROUP BY PT.NOME, PP.NOME, H.CODTIPRECDES, P.CODPROVDESC||'#39'-'#39'||P' +
        '.DESCRICAO'
      ') ')
    Left = 528
    Top = 149
  end
  object dsFinanceiro: TDecisionSource
    DecisionCube = dcFinanceiro
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 528
    Top = 213
    DimensionCount = 4
    SummaryCount = 3
    CurrentSummary = 1
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      0
      1
      0
      1
      0
      0
      1
      1
      1
      1
      0
      1
      2
      1
      2
      0)
  end
  object dcFinanceiro: TDecisionCube
    DataSet = dqryFinanceiro
    DimensionMap = <
      item
        ActiveFlag = diActive
        FieldType = ftFloat
        Fieldname = 'QUANTIDADE'
        Name = 'Quantidade'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diActive
        FieldType = ftFloat
        Fieldname = 'VALOR'
        Name = 'Valor'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PATRO'
        BaseName = 'PATRO'
        Name = 'Patrocinadora'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 14
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PLANO'
        BaseName = 'PLANO'
        Name = 'Plano'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 7
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CODDESEMB'
        BaseName = 'CODDESEMB'
        Name = 'Desembolso'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 18
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'RUBRICA'
        BaseName = 'RUBRICA'
        Name = 'Rubrica'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 64
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftUnknown
        Fieldname = 'Average of '
        Name = 'Average of '
        DerivedFrom = 1
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 20
    MaxCells = 0
    Left = 528
    Top = 277
  end
  object dqryContabil: TDecisionQuery
    AfterOpen = dqryContabilAfterOpen
    AfterClose = dqryContabilAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANTIDADE,'
      '       SUM(VALORPROVENTO) AS VALOR,'
      '       PT.NOME AS PATRO,'
      '       PP.NOME AS PLANO,'
      '       P.CODPROVDESC||'#39'-'#39'||P.DESCRICAO AS RUBRICA,'
      '       TRIM(H.PLACONTAC)||'#39'-'#39'||PC.PLANOME AS CONTACREDITO,'
      '       TRIM(H.PLACONTAD)||'#39'-'#39'||PD.PLANOME AS CONTADEBITO'
      
        'FROM PREVIA H, PROVDESC P, PESSOA PT, PLANPREVCONTABIL PP, PLANO' +
        'CONTA PC, PLANOCONTA PD'
      'WHERE H.IDLOTE = 786999'
      'AND H.IDRUBRICA = P.IDPROVENTO'
      'AND P.FLGESPECIAL = 0'
      'AND P.FLGDESCONTO IN (0,1)'
      'AND H.IDPLANOCONTABIL = PP.IDPLANOPREV'
      'AND H.IDPATRO = PT.IDPESSOA'
      'AND H.FLGTIPODESC <> '#39'K'#39
      'AND TRIM(PC.PLACONTA(+)) = H.PLACONTAC'
      'AND PC.PLANO(+) = H.PLANO'
      'AND TRIM(PD.PLACONTA(+)) = H.PLACONTAD'
      'AND PD.PLANO(+) = H.PLANO'
      'GROUP BY PT.NOME, PP.NOME, P.CODPROVDESC, P.DESCRICAO,'
      
        '         TRIM(H.PLACONTAC), TRIM(H.PLACONTAD), PC.PLANOME, PD.PL' +
        'ANOME'
      ''
      ''
      ''
      ' ')
    Left = 613
    Top = 149
  end
  object dsContabil: TDecisionSource
    DecisionCube = dcContabil
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 613
    Top = 213
    DimensionCount = 5
    SummaryCount = 3
    CurrentSummary = 1
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      0
      1
      0
      1
      0
      0
      1
      1
      1
      1
      0
      1
      2
      1
      2
      0
      1
      3
      1
      3
      0)
  end
  object dcContabil: TDecisionCube
    DataSet = dqryContabil
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'QUANTIDADE'
        Name = 'QUANTIDADE'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALOR'
        Name = 'VALOR'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PLANO'
        BaseName = 'PP.NOME'
        Name = 'Plano'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 7
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PATRO'
        BaseName = 'PT.NOME'
        Name = 'PATRO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 14
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CODRUB'
        BaseName = 'P.CODPROVDESC'
        Name = 'CODRUB'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 52
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'RUBRICA'
        BaseName = 'P.DESCRICAO'
        Name = 'RUBRICA'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 64
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CONTACREDITO'
        BaseName = 'H.PLACONTAC'
        Name = 'CONTACREDITO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 47
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CONTADEBITO'
        BaseName = 'H.PLACONTAD'
        Name = 'CONTADEBITO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = False
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftUnknown
        Fieldname = 'Average of '
        Name = 'Average of '
        DerivedFrom = 1
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 6
    MaxSummaries = 20
    MaxCells = 0
    Left = 613
    Top = 277
  end
end
