inherited frmGrafRenFix: TfrmGrafRenFix
  Left = 2
  Top = 33
  HelpContext = 790525
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta'
  ClientHeight = 498
  ClientWidth = 791
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 791
    Height = 459
    inherited bvlSepTit: TBevel
      Width = 789
    end
    inherited pnlTitulo: TPanel
      Width = 789
      inherited lbNomDescricao: TfcLabel
        Width = 336
        Caption = 'Gráficos de Evolução Patrimonial'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 789
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 365
        Top = 2
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label4: TLabel
        Left = 21
        Top = 2
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 365
        Top = 18
        Width = 316
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINV'#9'71'#9'Investimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'CHAVE'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 21
        Top = 18
        Width = 316
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblEmissorExit
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 101
      Width = 789
      Height = 357
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Investimento'
        object dbgHistRenFix: TwwDBGrid
          Left = 0
          Top = 0
          Width = 781
          Height = 329
          Selected.Strings = (
            'DATACURVA'#9'11'#9'Data'
            'DESCCURVA1'#9'34'#9'Perfil'
            'VLRCURVA1'#9'15'#9'Valor'
            'DESCCURVA2'#9'36'#9'Perfil'
            'VLRCURVA2'#9'17'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistRenFix
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Gráfico'
        ImageIndex = 1
        object dbChartRenFix: TDBChart
          Left = 0
          Top = 0
          Width = 773
          Height = 320
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clSilver
          Gradient.Visible = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            'Evolução Patrimonial')
          BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
          BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
          BottomAxis.LabelsFont.Color = clNavy
          BottomAxis.LabelsFont.Height = -11
          BottomAxis.LabelsFont.Name = 'Arial'
          BottomAxis.LabelsFont.Style = []
          BottomAxis.LabelsSeparation = 7
          Chart3DPercent = 5
          LeftAxis.AxisValuesFormat = '#,##0.00'
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 100
          LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
          LeftAxis.LabelsFont.Color = clNavy
          LeftAxis.LabelsFont.Height = -11
          LeftAxis.LabelsFont.Name = 'Arial'
          LeftAxis.LabelsFont.Style = []
          LeftAxis.LabelStyle = talValue
          Align = alClient
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
            DataSource = qryHistRenFix
            SeriesColor = clRed
            Title = 'Curva Contábil'
            ValueFormat = '#,##0.00'
            XLabelsSource = 'DATACURVA'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATACURVA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VLRCURVA1'
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
            DataSource = qryHistRenFix
            SeriesColor = clGreen
            Title = 'Curva Mercado'
            ValueFormat = '#,##0.00'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'DATACURVA'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VLRCURVA2'
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 459
    Width = 791
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 3
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE EM.IDEMISSOR = IV.IDEMISSOR AND'
      '      IV.IDTIPOINVEST = 1'
      'ORDER BY SIGLAEMISSOR'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 59
    object qryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
    end
    object qryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT HI.IDINVESTIMENTO,HI.DATAHISTRENFIX,IV.DESCINVES' +
        'TIMENTO,HI.IDHISTRENFIX,'
      
        '   CONCAT(CONCAT(HI.DATAHISTRENFIX,'#39' - '#39'),IV.DESCINVESTIMENTO) A' +
        'S DESCINV,'
      '   HI.IDOPERRENFIXAPLIC,'
      '   (IV.IDINVESTIMENTO || HI.DATAHISTRENFIX) AS CHAVE'
      'FROM'
      '   INVESTIMENTO IV,HISTRENFIX HI'
      'WHERE'
      '   (IV.IDINVESTIMENTO = HI.IDINVESTIMENTO) AND'
      '   (HI.IDTIPOOPERACAO NOT IN (-17,-18,-19)) AND'
      '   (HI.TIPMOVHISRENFIX='#39'OPE'#39') AND'
      '   (HI.NATURMOVHISTRENFI='#39'A'#39') AND'
      
        '   (((:IDEMISSOR IS NOT NULL) AND (IV.IDEMISSOR = :IDEMISSOR)) O' +
        'R (:IDEMISSOR IS NULL))'
      'ORDER BY IV.DESCINVESTIMENTO, HI.DATAHISTRENFIX'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 641
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINV: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 71
      FieldName = 'DESCINV'
      Size = 71
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTRENFIX.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoDATAHISTRENFIX: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAHISTRENFIX'
      Origin = 'HISTRENFIX.DATAHISTRENFIX'
      Visible = False
    end
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryInvestimentoIDHISTRENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTRENFIX'
      Origin = 'HISTRENFIX.IDHISTRENFIX'
      Visible = False
    end
    object qryInvestimentoIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
    end
    object qryInvestimentoCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 48
    end
  end
  object qryHistRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   A.DATACURVA,A.DESCCURVA1,A.VLRCURVA1,B.DESCCURVA2,B.VLRCURVA2'
      'FROM'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA1,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA1'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'Y'#39')'
      '   ORDER BY HI.IDHISTRENFIX) A,'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA2,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA2'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'N'#39')'
      '   ORDER BY HI.IDHISTRENFIX) B'
      'WHERE'
      '   A.IDHISTRENFIX = B.IDHISTRENFIX(+)'
      'ORDER BY A.DATACURVA'
      '')
    ValidateWithMask = True
    Left = 512
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
        Value = 102
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end>
    object qryHistRenFixDATACURVA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATACURVA'
    end
    object qryHistRenFixDESCCURVA1: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 34
      FieldName = 'DESCCURVA1'
      Size = 60
    end
    object qryHistRenFixVLRCURVA1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLRCURVA1'
      DisplayFormat = '###,###,###,###.00'
    end
    object qryHistRenFixDESCCURVA2: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 36
      FieldName = 'DESCCURVA2'
      Size = 60
    end
    object qryHistRenFixVLRCURVA2: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VLRCURVA2'
      DisplayFormat = '###,###,###,###.00'
    end
  end
  object dsHistRenFix: TwwDataSource
    DataSet = qryHistRenFix
    Left = 540
    Top = 5
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HI.IDHISTRENFIX,HI.IDCURVARENFIX,HI.PUACUITEM,HS.DATAHISTRENF' +
        'IX,CV.DESCCURVARENFIX'
      'FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       HT.IDOPERRENFIXAPLIC = 4) HS'
      'WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX)'
      'ORDER BY IDCURVARENFIX'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 633
    Top = 5
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'DATAHISTRENFIX'
    end
    object StringField1: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 45
      FieldName = 'DESCCURVARENFIX'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 17
      FieldName = 'PUACUITEM'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object qryAuxIDHISTRENFIX: TFloatField
      FieldName = 'IDHISTRENFIX'
    end
    object qryAuxIDCURVARENFIX: TFloatField
      FieldName = 'IDCURVARENFIX'
    end
  end
  object qryMax: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(A.VLRCURVA1) AS MAX1, MAX(B.VLRCURVA2) AS MAX2'
      'FROM'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA1,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA1'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'Y'#39')) A,'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA2,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA2'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'N'#39')) B'
      'WHERE'
      '   A.IDHISTRENFIX = B.IDHISTRENFIX(+)'
      'ORDER BY A.DATACURVA')
    ValidateWithMask = True
    Left = 429
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInput
      end>
    object qryMaxMAX1: TFloatField
      FieldName = 'MAX1'
    end
    object qryMaxMAX2: TFloatField
      FieldName = 'MAX2'
    end
  end
  object qryMin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MIN(A.VLRCURVA1) AS MIN1, MIN(B.VLRCURVA2) AS MIN2'
      'FROM'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA1,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA1'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       (HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) AND'
      '       (HT.NATURMOVHISTRENFI = '#39'A'#39')) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'Y'#39')) A,'
      '(SELECT'
      '   (HS.IDHISTRENFIX),'
      '   (HS.DATAHISTRENFIX)  AS DATACURVA,'
      '   (HI.PUACUITEM)       AS VLRCURVA2,'
      '   (CV.DESCCURVARENFIX) AS DESCCURVA2'
      ' FROM'
      '   HISTRENFIXXITENS HI,'
      '   CURVASRENFIX CV,'
      '   INVESTXCURVARENFIX IV,'
      '   (SELECT'
      '       HT.IDHISTRENFIX,HT.DATAHISTRENFIX,HT.IDINVESTIMENTO'
      '    FROM'
      '       HISTRENFIX HT'
      '    WHERE'
      '       (HT.IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) AND'
      '       (HT.NATURMOVHISTRENFI = '#39'A'#39')) HS'
      ' WHERE'
      '   (HI.IDHISTRENFIX = HS.IDHISTRENFIX) AND'
      '   (HI.IDITEMRENFIX = -6) AND'
      '   (HI.IDCURVARENFIX = CV.IDCURVARENFIX) AND'
      '   (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDCURVARENFIX = IV.IDCURVARENFIX) AND'
      '   (IV.FLGCURVACONTABIL = '#39'N'#39')) B'
      'WHERE'
      '   A.IDHISTRENFIX = B.IDHISTRENFIX(+)'
      'ORDER BY A.DATACURVA'
      '')
    ValidateWithMask = True
    Left = 373
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptInput
      end>
    object qryMinMIN1: TFloatField
      FieldName = 'MIN1'
    end
    object qryMinMIN2: TFloatField
      FieldName = 'MIN2'
    end
  end
end
