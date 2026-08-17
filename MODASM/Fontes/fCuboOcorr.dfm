inherited frmCuboOcorr: TfrmCuboOcorr
  Left = 108
  Top = 146
  HelpContext = 750009
  Caption = 'An·lise MultiDimensional das OcorrÍncias'
  ClientHeight = 357
  ClientWidth = 578
  Constraints.MinHeight = 384
  Constraints.MinWidth = 586
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 578
    Height = 318
    BorderWidth = 2
    object dpivOcorr: TDecisionPivot
      Left = 4
      Top = 4
      Width = 570
      Height = 41
      ButtonAutoSize = True
      DecisionSource = dsCubo
      GroupLayout = xtHorizontal
      Groups = [xtRows, xtColumns, xtSummaries]
      ButtonSpacing = 3
      ButtonWidth = 64
      ButtonHeight = 24
      GroupSpacing = 10
      BorderWidth = 3
      BorderStyle = bsNone
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
    end
    object dgrafOcorr: TDecisionGraph
      Left = 4
      Top = 45
      Width = 570
      Height = 196
      DecisionSource = dsCubo
      AnimatedZoom = True
      LeftWall.Color = clWhite
      Title.Text.Strings = (
        '')
      Chart3DPercent = 30
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 1
      object Series1: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: DATAREAL'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: DATAREAL'
        Style = 61
      end
      object Series2: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: DESCRTIPOOCMED'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: DESCRTIPOOCMED'
        Style = 61
      end
      object Series7: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: CODCID'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: CODCID'
        Style = 61
      end
      object Series4: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'ATENDIMENTO EMERGENCIAL'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'ATENDIMENTO EMERGENCIAL'
        Style = 40
      end
      object Series5: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clGreen
        Title = 'CONSULTA SOLICITADA'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'CONSULTA SOLICITADA'
        Style = 40
      end
      object Series6: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clYellow
        Title = 'EXAME CL÷NICO PERI‡DICO'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'EXAME CL÷NICO PERI‡DICO'
        Style = 40
      end
      object Series8: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'PRê-ADMISSIONAL'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'PRê-ADMISSIONAL'
        Style = 40
      end
    end
    object dgrdOcorr: TDecisionGrid
      Left = 4
      Top = 241
      Width = 570
      Height = 73
      DefaultColWidth = 100
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
      DecisionSource = dsCubo
      Dimensions = <
        item
          FieldName = 'DATAREAL'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'DESCRTIPOOCMED'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'CODCID'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'SUM(HSTASMED.AVALIACAO)'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'COUNT(HSTASMED.AVALIACAO)'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'SUM(HSTASMED.LICENCA)'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'COUNT(HSTASMED.LICENCA)'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'COUNTALL'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Average of HSTASMED.AVALIACAO'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Average of HSTASMED.LICENCA'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end>
      Totals = True
      ShowCubeEditor = False
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      GridLineWidth = 1
      GridLineColor = clWindowText
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 578
    inherited tb97Fundo: TToolbar97
      Left = 412
      DockPos = 416
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 523
    Top = 254
  end
  object dcubOcorr: TDecisionCube
    DataSet = dqryOcorr
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'DATAREAL'
        BaseName = 'HSTASMED.DATAREAL'
        Name = 'Data'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binYear
        ValueCount = 0
        Active = True
        StartValue = 32874
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'DESCRTIPOOCMED'
        BaseName = 'TIPOCMED.DESCRTIPOOCMED'
        Name = 'Tipo de OcorrÍncia'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 0
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'CODCID'
        BaseName = 'HSTASMED.CODCID'
        Name = 'CID'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 0
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM(HSTASMED.AVALIACAO)'
        BaseName = 'HSTASMED.AVALIACAO'
        Name = 'Soma das AvaliaÁıes'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'COUNT(HSTASMED.AVALIACAO)'
        BaseName = 'HSTASMED.AVALIACAO'
        Name = 'Quantidade'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM(HSTASMED.LICENCA)'
        BaseName = 'HSTASMED.LICENCA'
        Name = 'Soma dos Dias de LicenÁa'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'COUNT(HSTASMED.LICENCA)'
        BaseName = 'HSTASMED.LICENCA'
        Name = 'Quantidade'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftUnknown
        Fieldname = 'Average of HSTASMED.AVALIACAO'
        BaseName = 'HSTASMED.AVALIACAO'
        Name = 'MÈdia das AvaliaÁıes'
        DerivedFrom = 3
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftUnknown
        Fieldname = 'Average of HSTASMED.LICENCA'
        BaseName = 'HSTASMED.LICENCA'
        Name = 'MÈdia dos Dias de LicenÁa'
        DerivedFrom = 5
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 413
    Top = 254
  end
  object dqryOcorr: TDecisionQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  HSTASMED.DATAREAL, TIPOCMED.DESCRTIPOOCMED, HSTASMED.CODCID, S' +
        'UM(HSTASMED.AVALIACAO),'
      
        '  COUNT(HSTASMED.AVALIACAO), SUM(HSTASMED.LICENCA), COUNT(HSTASM' +
        'ED.LICENCA)'
      'FROM'
      '  HSTASMED HSTASMED, TIPOCMED TIPOCMED'
      'WHERE'
      '  (HSTASMED.CODTIPOOCMED = TIPOCMED.CODTIPOOCMED)'
      'GROUP BY'
      '  HSTASMED.DATAREAL, TIPOCMED.DESCRTIPOOCMED, HSTASMED.CODCID')
    Left = 467
    Top = 254
  end
  object dsCubo: TDecisionSource
    DecisionCube = dcubOcorr
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 362
    Top = 254
    DimensionCount = 3
    SummaryCount = 7
    CurrentSummary = 5
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
      0)
  end
end
