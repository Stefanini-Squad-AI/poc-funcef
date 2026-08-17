inherited frmGrafOpcInd: TfrmGrafOpcInd
  Left = 145
  Top = 194
  HelpContext = 790557
  Caption = 'Consulta'
  ClientHeight = 464
  ClientWidth = 776
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 776
    Height = 425
    inherited bvlSepTit: TBevel
      Width = 774
    end
    inherited pnlTitulo: TPanel
      Width = 774
      TabOrder = 1
      inherited lbNomDescricao: TfcLabel
        Width = 405
        Caption = 'Gráfico de Evolução da Opção de Índice'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 774
      Height = 60
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 37
        Height = 13
        Caption = 'Boleta'
      end
      object dbgOpcoes: TwwDBGrid
        Left = 319
        Top = 1
        Width = 454
        Height = 58
        Selected.Strings = (
          'IDBOLETA'#9'12'#9'Boleta'
          'IDLOTE'#9'5'#9'Lote'
          'DESCINVESTIMENTO'#9'43'#9'Investimento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        Align = alRight
        DataSource = dsOpcao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dblBoleta: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 291
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDBOLETA'#9'10'#9'Boleta'#9'F'
          'IDLOTE'#9'5'#9'Lote'#9'F'
          'DESCINVESTIMENTO'#9'35'#9'Investimento'#9'F')
        LookupTable = qryBoletas
        LookupField = 'DESCINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblBoletaCloseUp
      end
    end
    object pgcDados: TPageControl
      Left = 1
      Top = 105
      Width = 774
      Height = 319
      ActivePage = tbsInvestimentos
      Align = alClient
      TabOrder = 2
      OnChange = pgcDadosChange
      object tbsInvestimentos: TTabSheet
        Caption = 'Investimento'
        object dbgHistRenFix: TwwDBGrid
          Left = 0
          Top = 0
          Width = 766
          Height = 291
          Selected.Strings = (
            'DATA'#9'10'#9'Data'
            'INVESTIMENTO'#9'60'#9'Investimento'
            'SALDO'#9'36'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DmRelGrafOpcInd.dsHistOpcInd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsGrafico: TTabSheet
        Caption = 'Gráfico'
        ImageIndex = 1
        object dbcGrafico: TDBChart
          Left = 0
          Top = 0
          Width = 766
          Height = 291
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clSilver
          Gradient.Visible = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Evolução da Opção de Índice')
          BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
          BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
          BottomAxis.LabelsFont.Color = clNavy
          BottomAxis.LabelsFont.Height = -11
          BottomAxis.LabelsFont.Name = 'Arial'
          BottomAxis.LabelsFont.Style = []
          BottomAxis.LabelsSeparation = 7
          Chart3DPercent = 7
          LeftAxis.AxisValuesFormat = '#,##0.00'
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 100
          LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
          LeftAxis.LabelsFont.Color = clNavy
          LeftAxis.LabelsFont.Height = -11
          LeftAxis.LabelsFont.Name = 'Arial'
          LeftAxis.LabelsFont.Style = []
          LeftAxis.LabelStyle = talValue
          View3D = False
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Series1: TLineSeries
            Marks.ArrowLength = 8
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -8
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = []
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DmRelGrafOpcInd.qryTravaAlta
            SeriesColor = clBlue
            Title = 'Trava de Alta'
            ValueFormat = '#,##0.00'
            XLabelsSource = 'DATA'
            LinePen.Width = 2
            Pointer.HorizSize = 3
            Pointer.InflateMargins = False
            Pointer.Style = psSmallDot
            Pointer.VertSize = 3
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'SALDO'
          end
          object Series2: TLineSeries
            Marks.ArrowLength = 8
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -8
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = []
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DmRelGrafOpcInd.qryTravaBaixa
            SeriesColor = clGreen
            Title = 'Trava de Baixa'
            ValueFormat = '#,##0.00'
            XLabelsSource = 'DATA'
            LinePen.Width = 2
            Pointer.Draw3D = False
            Pointer.HorizSize = 2
            Pointer.InflateMargins = False
            Pointer.Style = psSmallDot
            Pointer.VertSize = 2
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'SALDO'
          end
          object Series3: TLineSeries
            Marks.ArrowLength = 8
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -8
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = []
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DmRelGrafOpcInd.qryCesta
            SeriesColor = clRed
            Title = 'Cesta'
            LinePen.Width = 2
            Pointer.Draw3D = False
            Pointer.HorizSize = 2
            Pointer.InflateMargins = False
            Pointer.Style = psSmallDot
            Pointer.VertSize = 2
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'SALDO'
          end
          object Series4: TBarSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            DataSource = DmRelGrafOpcInd.qryAjuste
            SeriesColor = 38293
            Title = 'Ajuste'
            XLabelsSource = 'DATA'
            BarBrush.Color = clYellow
            BarPen.SmallDots = True
            BarPen.Visible = False
            BarWidthPercent = 30
            MultiBar = mbNone
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATA'
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'SALDO'
            object TeeFunction1: TAddTeeFunction
            end
          end
        end
      end
    end
    object chkMostraValores: TCheckBox
      Left = 655
      Top = 107
      Width = 105
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Mostra Valores'
      TabOrder = 3
      Visible = False
      OnClick = chkMostraValoresClick
    end
    object chkMostraAjuste: TCheckBox
      Left = 535
      Top = 107
      Width = 105
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Mostra Ajuste'
      Checked = True
      State = cbChecked
      TabOrder = 4
      Visible = False
      OnClick = chkMostraAjusteClick
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 520
      DockPos = 700
      inherited sep1: TToolbarSep97
        Left = 249
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
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
    inherited TB97oKCancelar: TToolbar97
      Left = 351
      DockPos = 446
      Visible = False
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 3
  end
  object qryOpcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.IDBOLETA, O.IDLOTE, I.DESCINVESTIMENTO'
      'FROM OPERACAOOPCIND O, INVESTIMENTO I'
      'WHERE O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND O.IDBOLETA = :IDBOLETA'
      '  AND O.IDLOTE = :IDLOTE'
      'ORDER BY IDBOLETA, IDLOTE, DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 461
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
        Value = 'OI-03/0392'
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryOpcoesIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERACAOOPCIND.IDBOLETA'
      Size = 30
    end
    object qryOpcoesIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 5
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.OPERACAOOPCIND.IDLOTE'
      Size = 10
    end
    object qryOpcoesDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 43
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
  end
  object dsOpcao: TwwDataSource
    DataSet = qryOpcoes
    Left = 489
    Top = 5
  end
  object qryBoletas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT O.IDBOLETA, O.IDLOTE, I.DESCINVESTIMENTO'
      'FROM OPERACAOOPCIND O, INVESTIMENTO I'
      'WHERE O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      'ORDER BY IDBOLETA, IDLOTE, DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 433
    Top = 5
    object qryBoletasIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS."CM.OPERACAOOPCIND".IDBOLETA'
      Size = 30
    end
    object qryBoletasIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 5
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS."CM.OPERACAOOPCIND".IDLOTE'
      Size = 10
    end
    object qryBoletasDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS."CM.INVESTIMENTO".DESCINVESTIMENTO'
      Size = 60
    end
  end
end
