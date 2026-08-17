inherited frmGraficoPatrimonial: TfrmGraficoPatrimonial
  Left = 2
  Top = 22
  Caption = 'Relação do total de ativos dos Fundos'
  ClientHeight = 553
  ClientWidth = 800
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 514
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 512
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 0
      object DecisionGraph2: TDecisionGraph
        Left = 1
        Top = 1
        Width = 796
        Height = 510
        DecisionSource = DecisionSourcePatr
        AllowPanning = pmVertical
        AnimatedZoom = True
        AnimatedZoomSteps = 9
        BottomWall.Brush.Color = clWhite
        BottomWall.Size = 2
        Gradient.EndColor = clSilver
        Gradient.Visible = True
        LeftWall.Brush.Color = clWhite
        LeftWall.Color = 16316664
        LeftWall.Size = 2
        MarginBottom = 15
        MarginLeft = 5
        MarginRight = 5
        MarginTop = 5
        Title.Brush.Color = clWhite
        Title.Color = clWhite
        Title.Text.Strings = (
          '')
        Title.Visible = False
        LeftAxis.AxisValuesFormat = '#,##0.00'
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clNavy
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelStyle = talValue
        LeftAxis.MinorTickCount = 4
        LeftAxis.PositionPercent = 4
        LeftAxis.TickLength = 5
        LeftAxis.Title.Angle = 360
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -12
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Alignment = laBottom
        Legend.ColorWidth = 5
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.ShadowColor = clGray
        Legend.ShadowSize = 10
        Legend.TextStyle = ltsPlain
        Legend.TopPos = 3
        Legend.VertMargin = 23
        RightAxis.AxisValuesFormat = '###,###,###.00##'
        RightAxis.ExactDateTime = False
        RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
        RightAxis.LabelsFont.Color = clBlack
        RightAxis.LabelsFont.Height = -11
        RightAxis.LabelsFont.Name = 'Arial'
        RightAxis.LabelsFont.Style = [fsBold]
        RightAxis.LabelStyle = talValue
        RightAxis.Title.Angle = 360
        RightAxis.Title.Font.Charset = DEFAULT_CHARSET
        RightAxis.Title.Font.Color = clBlue
        RightAxis.Title.Font.Height = -11
        RightAxis.Title.Font.Name = 'Arial'
        RightAxis.Title.Font.Style = [fsBold]
        RightAxis.TitleSize = 21
        TopAxis.LabelsFont.Charset = DEFAULT_CHARSET
        TopAxis.LabelsFont.Color = clBlack
        TopAxis.LabelsFont.Height = -11
        TopAxis.LabelsFont.Name = 'Arial'
        TopAxis.LabelsFont.Style = [fsBold]
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlue
        TopAxis.Title.Font.Height = -11
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = [fsBold]
        Align = alClient
        BevelOuter = bvNone
        BevelWidth = 2
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 469
          Width = 796
          Height = 41
          Align = alBottom
          BevelInner = bvLowered
          Color = clWhite
          TabOrder = 0
          object lbTotalPatrimonial: TLabel
            Left = 475
            Top = 12
            Width = 128
            Height = 16
            Caption = 'lbTotalPatrimonial'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lbData: TLabel
            Left = 324
            Top = 12
            Width = 128
            Height = 16
            Caption = 'lbTotalPatrimonial'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lbTipoFundo: TLabel
            Left = 4
            Top = 12
            Width = 89
            Height = 16
            Caption = 'lbTipoFundo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object Series4: TBarSeries
          Active = False
          ColorEachPoint = True
          HorizAxis = aTopAxis
          Marks.ArrowLength = 40
          Marks.Clip = True
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = [fsBold]
          Marks.Style = smsPercent
          Marks.Visible = True
          SeriesColor = clRed
          Title = '1D Template: FUNDOS'
          ValueFormat = '#,##0.00##'
          VertAxis = aRightAxis
          AutoMarkPosition = False
          BarStyle = bsRectGradient
          Dark3D = False
          OffsetPercent = 15
          UseYOrigin = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = '1D Template: FUNDOS'
          Style = 56
        end
        object Series1: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: FUNDOS'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: FUNDOS'
          Style = 61
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 162
      end
      inherited bbtnSair: TBitBtn
        Left = 81
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bt_Imprime: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 627
    Top = 259
  end
  object DecisionSourcePatr: TDecisionSource
    DecisionCube = DecisionCubePatr
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 627
    Top = 424
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      0)
  end
  object DecisionQueryPatr: TDecisionQuery
    DatabaseName = 'BaseDados'
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      'SELECT F.DESCFUNDOINVEST FUNDOS, SUM(H.SALDOVLRFUNDO) SALDO'
      'FROM   HISTFUNDO H, HISTFUNDOINVEST F'
      'WHERE  (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)    AND'
      ''
      '      (((:IDGESTORCARTEIRA IS NOT NULL)              AND'
      '       (F.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))    OR'
      '        (:IDGESTORCARTEIRA IS NULL) )                AND'
      ''
      '      (((:IDTIPOFUNDOINVEST IS NOT NULL)             AND'
      '       (F.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))   OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )               AND'
      ''
      '       (H.IDHISTFUNDO  IN'
      '               (SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      
        '                WHERE  (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) ' +
        'AND'
      
        '                       (DATAMOVFUNDO      = :DATAMOVFUNDO)      ' +
        'AND'
      
        '                      ((DATAMOVFUNDO      < :DATAMOVFUNDO) OR ID' +
        'HISTFUNDO < 999999999) AND'
      
        '                       (IDTIPOINVEST      = :IDTIPOINVEST)      ' +
        'AND'
      '                       (TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO )) AND'
      ''
      '       (H.SALDOVLRFUNDO > 0 )                        AND'
      '       (F.IDFUNDOINVEST     = H.IDFUNDOINVEST)       AND'
      
        '       (F.IDFUNDOINVEST || TO_CHAR(F.DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') ='
      
        '                  (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                   FROM HISTFUNDOINVEST'
      '                   WHERE IDFUNDOINVEST = H.IDFUNDOINVEST'
      '                     AND DTAVIGENCIA < H.DATAMOVFUNDO+1'
      '                   GROUP BY IDFUNDOINVEST))'
      'GROUP BY F.DESCFUNDOINVEST')
    Left = 627
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object DecisionCubePatr: TDecisionCube
    DataSet = DecisionQueryPatr
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'FUNDOS'
        BaseName = 'FUNDOINVEST.DESCFUNDOINVEST '
        Name = 'FUNDOS'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 8
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SALDO'
        BaseName = 'HISTFUNDO.SALDOVLRFUNDO'
        Name = 'SALDO'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 16
    MaxSummaries = 50
    MaxCells = 50
    Left = 627
    Top = 370
  end
  object QryTotalPatr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(H.SALDOVLRFUNDO) SALDO'
      'FROM HISTFUNDO H, HISTFUNDOINVEST F'
      'WHERE'
      '         (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)  AND'
      ''
      '      (((:IDGESTORCARTEIRA IS NOT NULL)            AND'
      '       (F.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))   OR'
      '        (:IDGESTORCARTEIRA IS NULL) )              AND'
      ''
      '      (((:IDTIPOFUNDOINVEST IS NOT NULL)           AND'
      '       (F.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )             AND'
      ''
      '       (H.IDHISTFUNDO  IN'
      '               (SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      
        '                WHERE (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                      (DATAMOVFUNDO      = :DATAMOVFUNDO)      A' +
        'ND'
      
        '                      ((DATAMOVFUNDO      < :DATAMOVFUNDO) OR ID' +
        'HISTFUNDO < 999999999) AND'
      '                       (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO)) AND'
      '       (H.SALDOVLRFUNDO > 0 )               AND'
      '       (F.IDFUNDOINVEST = H.IDFUNDOINVEST)  AND'
      
        '       (F.IDFUNDOINVEST || TO_CHAR(F.DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') ='
      
        '                  (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                   FROM HISTFUNDOINVEST'
      '                   WHERE IDFUNDOINVEST = H.IDFUNDOINVEST'
      '                     AND DTAVIGENCIA < H.DATAMOVFUNDO+1'
      '                   GROUP BY IDFUNDOINVEST))'
      '')
    ValidateWithMask = True
    Left = 140
    Top = 426
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
end
