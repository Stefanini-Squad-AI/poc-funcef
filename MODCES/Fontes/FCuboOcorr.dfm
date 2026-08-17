inherited frmCuboOcorr: TfrmCuboOcorr
  Left = 110
  Top = 142
  HelpContext = 740030
  Caption = 'An·lise MultiDimensional dos Eventos (AlteraÁıes Salariais)'
  ClientHeight = 357
  ClientWidth = 578
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
      TabOrder = 1
      object Series1: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'ACORDO COLETIVO'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'ACORDO COLETIVO'
        Style = 40
      end
      object Series2: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clGreen
        Title = 'ANTECIPAÄ«O ESPONT∂NEA DE ACORDO'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'ANTECIPAÄ«O ESPONT∂NEA DE ACORDO'
        Style = 40
      end
      object Series7: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clYellow
        Title = 'AUMENTO DE MêRITO'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'AUMENTO DE MêRITO'
        Style = 40
      end
      object Series11: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'ENQUADRAMENTO DE FAIXA'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'ENQUADRAMENTO DE FAIXA'
        Style = 40
      end
      object Series4: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: Data'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: Data'
        Style = 61
      end
      object Series5: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: Tipo de Evento'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: Tipo de Evento'
        Style = 61
      end
      object Series6: TBarSeries
        Active = False
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Template: Estabelecimento'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        Identifier = 'Template: Estabelecimento'
        Style = 61
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
          FieldName = 'Data'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Tipo de Evento'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Estabelecimento'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Soma dos %'
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
          FieldName = '% MÈdio'
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
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 578
    inherited tb97Fundo: TToolbar97
      Left = 412
      DockPos = 412
    end
  end
  object dcubOcorr: TDecisionCube
    DataSet = dqryOcorr
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'DATAALTERFUNC'
        BaseName = 'EVOLFUNC.DATAALTERFUNC'
        Name = 'Data'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binMonth
        ValueCount = 3
        Active = True
        StartValue = 32874
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'DESCRICAO'
        BaseName = 'MOTIVO.DESCRICAO'
        Name = 'Tipo de Evento'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 4
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'NOME'
        BaseName = 'ENDPESS.NOME'
        Name = 'Estabelecimento'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 4
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM(EVOLFUNC.PERC_REAJ)'
        BaseName = 'EVOLFUNC.PERC_REAJ'
        Name = 'Soma dos %'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'COUNT(EVOLFUNC.PERC_REAJ)'
        BaseName = 'EVOLFUNC.PERC_REAJ'
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
        Fieldname = 'Average of EVOLFUNC.PERC_REAJ'
        BaseName = 'EVOLFUNC.PERC_REAJ'
        Name = '% MÈdio'
        DerivedFrom = 3
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 24
    Top = 51
  end
  object dqryOcorr: TDecisionQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EVOLFUNC.DATAALTERFUNC, MOTIVO.DESCRICAO, PESSOA.NOME, SU' +
        'M( EVOLFUNC.PERC_REAJ ), COUNT( EVOLFUNC.PERC_REAJ )'
      'FROM EVOLFUNC EVOLFUNC, MOTIVO MOTIVO, PESSOA PESSOA'
      'WHERE  (EVOLFUNC.IDMOTIVO = MOTIVO.IDMOTIVO)  '
      '   AND  (EVOLFUNC.IDESTAB = PESSOA.IDPESSOA)  '
      'GROUP BY EVOLFUNC.DATAALTERFUNC, MOTIVO.DESCRICAO, PESSOA.NOME')
    Left = 108
    Top = 63
  end
  object dsCubo: TDecisionSource
    DecisionCube = dcubOcorr
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 42
    Top = 126
    DimensionCount = 3
    SummaryCount = 3
    CurrentSummary = 2
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1
      1
      0
      1
      0
      -1
      1
      -1
      2
      1
      -1)
  end
end
