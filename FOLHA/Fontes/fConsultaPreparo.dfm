inherited frmConsultaPreparo: TfrmConsultaPreparo
  Left = 7
  Top = 68
  HelpContext = 180051
  BorderStyle = bsNone
  Caption = 'Consulta Benefícios Preparados'
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
      Top = 122
      Width = 770
      Height = 288
      ActivePage = tbsBeneficios
      Align = alClient
      TabOrder = 1
      object tbsBeneficios: TTabSheet
        Caption = 'Benefícios'
        object dpValores: TDecisionPivot
          Left = 0
          Top = 0
          Width = 762
          Height = 28
          ButtonAutoSize = True
          DecisionSource = dsValores
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
        object DecisionGrid1: TDecisionGrid
          Left = 0
          Top = 28
          Width = 762
          Height = 232
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
          DecisionSource = dsValores
          Dimensions = <
            item
              FieldName = 'Patrocinadora'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Plano'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Benefício'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Usuário'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Dt Preparo'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Valor Pago'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'Valor Previsto'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'Quantidade'
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
      object tbsContribuicoes: TTabSheet
        Caption = 'Contribuições'
        ImageIndex = 1
        object dpContrib: TDecisionPivot
          Left = 0
          Top = 0
          Width = 762
          Height = 28
          ButtonAutoSize = True
          DecisionSource = dsContrib
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
          Height = 232
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
          DecisionSource = dsContrib
          Dimensions = <
            item
              FieldName = 'Patrocinadora'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Plano'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Benefício'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Usuário'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Dt Preparo'
              Color = clNone
              Alignment = taCenter
              Subtotals = False
            end
            item
              FieldName = 'Valor Pago'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'Valor Previsto'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = False
            end
            item
              FieldName = 'Quantidade'
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
      Height = 117
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
          NumGlyphs = 0
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
        object rdgEscolhaTipo: TRadioGroup
          Left = 17
          Top = 42
          Width = 568
          Height = 35
          Caption = 'Desejo ver os dados de ...'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Titulares'
            'Pensionistas')
          TabOrder = 2
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
  object dqryValores: TDecisionQuery
    AfterOpen = dqryValoresAfterOpen
    AfterClose = dqryValoresAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.NOME AS PATROCINADORA, PLA.NOME AS PLANO,'
      '       BB.NOME AS BENEFICIO,'
      '       BEN.NOME AS BENEFICIARIO, TIT.NOME AS TITULAR,'
      '       USU.NOME AS USUARIO,'
      '       TO_CHAR(HST.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39') AS DATAPROCESSO,'
      '       SUM(HST.VLBENEFPGTO) AS VALORPAGO,'
      '       SUM(HST.VALORPREV) AS VALORPREVISTO,'
      '       COUNT(*) AS QUANT'
      
        'FROM HSTBENEFBFCIARIO HST, BENEFICIO BB, PLANPREV PLA, PESSOA PA' +
        'T, PESSOA USU,'
      '     PESSOA TIT, PESSOA BEN'
      'WHERE (HST.IDLOTE = 780892)'
      'AND (BB.IDBENEFICIO = HST.IDBENEFICIO)'
      'AND (PLA.IDPLANOPREV = HST.IDPLANOPREV)'
      'AND (PAT.IDPESSOA = HST.IDPESSJUR)'
      'AND (USU.IDPESSOA = SUBSTR(HST.TRGUSERINCLUSAO,3,28))'
      'AND (TIT.IDPESSOA = HST.IDTITULAR)'
      'AND (BEN.IDPESSOA = HST.IDPESSOA)'
      
        'GROUP BY PAT.NOME, PLA.NOME, BB.NOME, BEN.NOME, TIT.NOME, USU.NO' +
        'ME,'
      '         TO_CHAR(HST.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39')'
      ''
      ' ')
    Left = 696
    Top = 149
  end
  object dsValores: TDecisionSource
    DecisionCube = dcValores
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 696
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
  object dcValores: TDecisionCube
    DataSet = dqryValores
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PATROCINADORA'
        BaseName = 'PAT.NOME'
        Name = 'Patrocinadora'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PLANO'
        BaseName = 'PLA.NOME'
        Name = 'Plano'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'BENEFICIO'
        BaseName = 'BB.NOME'
        Name = 'Benefício'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 8
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftString
        Fieldname = 'BENEFICIARIO'
        BaseName = 'BEN.NOME'
        Name = 'Beneficiário'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = False
      end
      item
        ActiveFlag = diInactive
        FieldType = ftString
        Fieldname = 'TITULAR'
        BaseName = 'TIT.NOME'
        Name = 'Titular'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 29
        Active = False
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'USUARIO'
        BaseName = 'USU.NOME'
        Name = 'Usuário'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'DATAPROCESSO'
        Name = 'Dt Preparo'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALORPAGO'
        Name = 'Valor Pago'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALORPREVISTO'
        Name = 'Valor Previsto'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'QUANT'
        BaseName = '1'
        Name = 'Quantidade'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 20
    MaxCells = 0
    Left = 696
    Top = 277
  end
  object dqryContrib: TDecisionQuery
    AfterOpen = dqryContribAfterOpen
    AfterClose = dqryContribAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PAT.NOME AS PATROCINADORA,'
      '  PLA.NOME AS PLANO,'
      '  CON.NOME AS CONTRIBUICAO,'
      '  BEN.NOME AS BENEFICIARIO,'
      '  TIT.NOME AS TITULAR,'
      '  USU.NOME AS USUARIO,'
      '  TO_CHAR(HCP.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39') AS DATAPROCESSO,'
      '  SUM(HCP.VALORRECEBIDO) AS VALORPAGO,'
      '  SUM(HCP.VALORESPERADO) AS VALORPREVISTO,'
      '  COUNT(*) AS QUANT'
      ''
      'FROM'
      '  HSTCONTRIBPREV HCP,'
      '  CONTRIBUICAO CON,'
      '  PLANPREV PLA,'
      '  PESSOA PAT,'
      '  PESSOA USU,'
      '  PESSOA TIT,'
      '  PESSOA BEN'
      ''
      'WHERE'
      '  HCP.IDLOTE         = 2262                               AND'
      '  CON.IDCONTRIBUICAO = HCP.IDCONTRIBUICAO                 AND'
      '  PLA.IDPLANOPREV    = HCP.IDPLANOPREV                    AND'
      '  PAT.IDPESSOA       = HCP.IDPESSJUR                      AND'
      '  (USU.IDPESSOA      = SUBSTR(HCP.TRGUSERINCLUSAO, 3, 28))AND'
      '  TIT.IDPESSOA       = HCP.IDPESSOA                       AND'
      '  BEN.IDPESSOA       = HCP.IDPESSOA'
      ''
      'GROUP BY'
      '  PAT.NOME,'
      '  PLA.NOME,'
      '  CON.NOME,'
      '  BEN.NOME,'
      '  TIT.NOME,'
      '  USU.NOME,'
      '  TO_CHAR(HCP.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39')'
      ''
      ' ')
    Left = 613
    Top = 149
  end
  object dsContrib: TDecisionSource
    DecisionCube = dcContrib
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
  object dcContrib: TDecisionCube
    DataSet = dqryContrib
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PATROCINADORA'
        BaseName = 'PAT.NOME'
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
        Fieldname = 'PLANO'
        BaseName = 'PLA.NOME'
        Name = 'Plano'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'CONTRIBUICAO'
        BaseName = 'CON.NOME'
        Name = 'Contribuição'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftString
        Fieldname = 'BENEFICIARIO'
        BaseName = 'BEN.NOME'
        Name = 'Beneficiário'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = False
      end
      item
        ActiveFlag = diInactive
        FieldType = ftString
        Fieldname = 'TITULAR'
        BaseName = 'TIT.NOME'
        Name = 'Titular'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 29
        Active = False
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'USUARIO'
        BaseName = 'USU.NOME'
        Name = 'Usuário'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'DATAPROCESSO'
        Name = 'Dt Preparo'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 2
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALORPAGO'
        Name = 'Valor Pago'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'VALORPREVISTO'
        Name = 'Valor Previsto'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'QUANT'
        BaseName = '1'
        Name = 'Quantidade'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 20
    MaxCells = 0
    Left = 613
    Top = 277
  end
end
