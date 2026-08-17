inherited FrmHistSalPartic: TFrmHistSalPartic
  Left = 338
  Top = 197
  HelpContext = 320029
  Caption = 'Visão dos Históricos de Salários Participação por Patrocinadora'
  ClientHeight = 341
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 549
    Height = 302
    object grid: TDecisionGrid
      Left = 1
      Top = 42
      Width = 547
      Height = 259
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
      DecisionSource = DecisionSource1
      Dimensions = <
        item
          FieldName = 'Patrocinadora'
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
          FieldName = 'Mês de Referencia'
          Color = clNone
          Alignment = taCenter
          Subtotals = True
        end
        item
          FieldName = 'Valor'
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
      TabOrder = 0
    end
    object DecisionPivot1: TDecisionPivot
      Left = 1
      Top = 1
      Width = 547
      Height = 41
      ButtonAutoSize = True
      DecisionSource = DecisionSource1
      GroupLayout = xtHorizontal
      Groups = [xtRows, xtColumns, xtSummaries]
      ButtonSpacing = 3
      ButtonWidth = 64
      ButtonHeight = 24
      GroupSpacing = 10
      BorderWidth = 3
      BorderStyle = bsNone
      Align = alTop
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 302
    Width = 549
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 296
    Top = 184
    DimensionCount = 3
    SummaryCount = 1
    CurrentSummary = 0
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
      -1
      2
      1
      0)
  end
  object DecisionQuery1: TDecisionQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PES.NOME, RXP.CODPROVDESC, HRP.MESREFERENCIA, '
      '       SUM(HRP.VALORACUMULADO) AS VALOR'
      'FROM HSTRUBRICAXPESS HRP, '
      '     PATRO PTR, '
      '     PESSOA PES, '
      '     RUBRICAXPESS RXP'
      'WHERE PTR.IDRUBSALPARTICIP = HRP.IDRUBRICA'
      'AND PTR.IDPESSOA = HRP.IDPESSOA'
      'AND PTR.IDPESSOA = PES.IDPESSOA'
      'AND RXP.IDPESSOA = HRP.IDPESSOA'
      'AND RXP.IDRUBRICA = HRP.IDRUBRICA'
      'GROUP BY  PES.NOME, RXP.CODPROVDESC, HRP.MESREFERENCIA'
      ''
      '')
    Left = 128
    Top = 184
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'NOME'
        BaseName = 'PES.NOME'
        Name = 'Patrocinadora'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 3
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CODPROVDESC'
        BaseName = 'RXP.CODPROVDESC'
        Name = 'Rubrica'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'MESREFERENCIA'
        BaseName = 'HRP.MESREFERENCIA'
        Name = 'Mês de Referencia'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 20
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALOR'
        BaseName = 'HRP.VALORACUMULADO'
        Name = 'Valor'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 212
    Top = 184
  end
end
