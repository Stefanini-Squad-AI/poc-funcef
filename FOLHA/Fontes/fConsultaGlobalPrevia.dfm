inherited frmConsultaGlobalPrevia: TfrmConsultaGlobalPrevia
  Left = 7
  Top = 68
  HelpContext = 180053
  BorderStyle = bsNone
  Caption = 'Consulta Global da Prévia'
  ClientHeight = 454
  ClientWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    Height = 415
    object Panel7: TPanel
      Left = 5
      Top = 5
      Width = 770
      Height = 405
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
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 770
      Height = 405
      ActivePage = tbsLotes
      Align = alClient
      TabOrder = 1
      object tbsLotes: TTabSheet
        Caption = 'Lotes de Prévia'
        object dbgLotes: TwwDBGrid
          Left = 0
          Top = 47
          Width = 762
          Height = 330
          Selected.Strings = (
            'IDLOTE'#9'10'#9'Lote'
            'MESREFERENCIA'#9'7'#9'Mês'
            'DESCRTIPOFOLHA'#9'14'#9'Tipo Folha'
            'PROC'#9'15'#9'Estado'
            'IDHSTFOLHABENEF'#9'9'#9'Versão'
            'DESCRICAO'#9'63'#9'Descrição')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnRowChanged = dbgLotesRowChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 47
          Align = alTop
          TabOrder = 1
          object fcsbtnHistorico: TfcShapeBtn
            Left = 664
            Top = 8
            Width = 91
            Height = 33
            Anchors = [akTop, akRight]
            Caption = 'Obtém dados'
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
            TabOrder = 0
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcsbtnHistoricoClick
          end
        end
      end
      object tbsInformacoes: TTabSheet
        Caption = 'Informações'
        ImageIndex = 1
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
          Height = 349
          DefaultColWidth = 124
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
              Subtotals = True
            end
            item
              FieldName = 'Plano'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'RUBRICA'
              Color = clNone
              Alignment = taCenter
              Subtotals = True
            end
            item
              FieldName = 'Valor'
              Color = clNone
              Format = '#,##0.00'
              Alignment = taRightJustify
              Subtotals = True
            end
            item
              FieldName = 'Quantidade'
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
          OnDecisionExamineCell = DecisionGrid1DecisionExamineCell
        end
      end
      object tbsAnalise: TTabSheet
        Caption = 'Análise Comparativa'
        ImageIndex = 2
        object spAnalise: TSplitter
          Left = 0
          Top = 140
          Width = 762
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object pnlAnaliseSelecao: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 140
          Align = alTop
          TabOrder = 0
          object lblVersao: TLabel
            Left = 8
            Top = 5
            Width = 224
            Height = 13
            Caption = 'Selecione as versões para comparação'
          end
          object Label5: TLabel
            Left = 360
            Top = 6
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label6: TLabel
            Left = 360
            Top = 44
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object lblFator: TLabel
            Left = 359
            Top = 111
            Width = 182
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fator para ajuste s/ Valor Base:'
          end
          object lblPercentual: TLabel
            Left = 383
            Top = 89
            Width = 143
            Height = 13
            Alignment = taRightJustify
            Caption = 'Percentual de Diferença:'
          end
          object lblCaracterPercent: TLabel
            Left = 608
            Top = 89
            Width = 10
            Height = 13
            Caption = '%'
          end
          object chklstVersao: TCheckListBox
            Left = 5
            Top = 22
            Width = 349
            Height = 108
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object cmbPatro: TwwDBLookupCombo
            Left = 360
            Top = 20
            Width = 255
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'Patrocinadora'#9'F')
            LookupTable = qryPatro
            LookupField = 'NOME'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object cmbPlano: TwwDBLookupCombo
            Left = 360
            Top = 58
            Width = 255
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'Plano'#9'F')
            LookupTable = qryPlano
            LookupField = 'NOME'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object rgValor: TRadioGroup
            Left = 622
            Top = 45
            Width = 136
            Height = 84
            Caption = ' Compara por ... '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Items.Strings = (
              'Valor Bruto'
              'Valor Bruto do Mês'
              'Benefício Continuado'
              'Valor Líquido')
            ParentFont = False
            TabOrder = 3
          end
          object fcbtnProcessar: TfcShapeBtn
            Left = 664
            Top = 8
            Width = 91
            Height = 33
            Anchors = [akTop, akRight]
            Caption = 'Processar'
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
            TabOrder = 4
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcbtnProcessarClick
          end
          object redDif: TRealEdit
            Left = 531
            Top = 85
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '0,00')
            ParentFont = False
            TabOrder = 5
            WordWrap = False
            IntDigits = 17
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object redFator: TRealEdit
            Left = 546
            Top = 107
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '1')
            ParentFont = False
            TabOrder = 6
            WordWrap = False
            IntDigits = 17
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
        end
        object dbgCompara: TwwDBGrid
          Left = 0
          Top = 143
          Width = 762
          Height = 234
          Selected.Strings = (
            'MATRICULA'#9'8'#9'Matrícula'
            'INSCRICAONUMERO'#9'8'#9'Inscrição'
            'TITULAR'#9'16'#9'Titular'
            'BENEFICIARIO'#9'18'#9'Recebedor'
            'VALBASE'#9'10'#9'Valor Anterior'
            'VALCORRENTE'#9'10'#9'Valor Atual'
            'DIFERENCA'#9'10'#9'Diferença'
            'VARIACAO'#9'7'#9'Variação'
            'PATROCINADORA'#9'14'#9'Patro'
            'PLANO'#9'13'#9'Plano')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCompara
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection]
          ParentFont = False
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
    AfterScroll = qryLoteAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDLOTE, C.MESREFERENCIA,'
        '       DECODE(C.FLGTIPOFOLHA,1,'#39'Pagto Pendente'#39',2,'#39'Extra'#39',3,'#39'Abo' +
        'no'#39','
      '              4,'#39'Adiant. Abono'#39', 5,'#39'Exclusões Efetivação'#39','
        '              DECODE(C.FLGCONCESSAO,1,'#39'Concessão'#39','#39'Normal'#39')) DES' +
        'CRTIPOFOLHA,'
      '       C.FLGIDATMP, C.FLGVOLTATMP,'
      '       DECODE(C.FLGVOLTATMP, 1, '#39'Efetivado'#39','
        '              0, DECODE(C.FLGIDATMP, 1, '#39'Prévia executada'#39', '#39'Pré' +
        'via a executar'#39')) as Proc,'
      '       L.IDHSTFOLHABENEF,'
      '       C.DESCRICAO'
      'FROM CTRLINTERFACE C, LOTEXHSTFOLHABENEF L'
      'WHERE C.TIPO = '#39'B'#39
      'AND C.IDREFERENCIA IS NULL'
      'AND C.FLGTIPOFOLHA IN (0,1,2,3,4,5,6,7)'
      'AND L.IDLOTE(+) = C.IDLOTE'
      'AND L.FLGTIPOLOTE(+) = '#39'B'#39
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC')
    ValidateWithMask = True
    Left = 412
    Top = 407
    object qryLoteIDLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
    end
    object qryLoteMESREFERENCIA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryLoteDESCRTIPOFOLHA: TStringField
      DisplayLabel = 'Tipo Folha'
      DisplayWidth = 14
      FieldName = 'DESCRTIPOFOLHA'
    end
    object qryLotePROC: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 15
      FieldName = 'PROC'
      Size = 17
    end
    object qryLoteIDHSTFOLHABENEF: TFloatField
      DisplayLabel = 'Versão'
      DisplayWidth = 9
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qryLoteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 63
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryLoteFLGIDATMP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGIDATMP'
      Visible = False
    end
    object qryLoteFLGVOLTATMP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGVOLTATMP'
      Visible = False
    end
  end
  object dqryValores: TDecisionQuery
    AfterOpen = dqryValoresAfterOpen
    AfterClose = dqryValoresAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HST.IDPATRO||'#39'-'#39'||PAT.NOME AS PATROCINADORA,'
      '       HST.IDPATRO,'
      '       HST.IDPLANOPREV||'#39'-'#39'||PLA.NOME AS PLANO,'
      '       HST.IDPLANOPREV,'
      '       PRD.IDPROVENTO||'#39'-'#39'||PRD.DESCRICAO AS RUBRICA,'
      '       PRD.IDPROVENTO,'
      '       DECODE(PRD.FLGESPECIAL, 0, SUM(VALORPROVENTO), 0) AS Valor,'
      '       COUNT(*) AS Quantidade'
      'FROM PREVIA HST, PROVDESC PRD, PLANPREV PLA, PESSOA PAT'
      'WHERE (HST.IDLOTE = :IDLOTE)'
      'AND (PRD.IDPROVENTO = HST.IDRUBRICA)'
      'AND (PLA.IDPLANOPREV = HST.IDPLANOPREV)'
      'AND (PAT.IDPESSOA = HST.IDPATRO)'
      'GROUP BY PAT.NOME, HST.IDPATRO, PLA.NOME, HST.IDPLANOPREV,'
      '         PRD.IDPROVENTO, PRD.DESCRICAO,'
      '         PRD.FLGESPECIAL, PRD.FLGDESCONTO')
    Left = 446
    Top = 407
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
        Value = '2263'
      end>
  end
  object dsValores: TDecisionSource
    DecisionCube = dcValores
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 479
    Top = 407
    DimensionCount = 3
    SummaryCount = 3
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1
      1
      -1
      2
      0
      0
      1
      0
      1
      1
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
        ValueCount = 3
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftFloat
        Fieldname = 'IDPATRO'
        BaseName = 'HST.IDPATRO'
        Name = 'IDPATRO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 3
        Active = False
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
        ValueCount = 3
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftFloat
        Fieldname = 'IDPLANOPREV'
        BaseName = 'HST.IDPLANOPREV'
        Name = 'IDPLANOPREV'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = False
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'RUBRICA'
        BaseName = 'PRD.DESCRICAO'
        Name = 'RUBRICA'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 93
        Active = True
      end
      item
        ActiveFlag = diInactive
        FieldType = ftFloat
        Fieldname = 'IDPROVENTO'
        BaseName = 'PRD.IDPROVENTO'
        Name = 'IDPROVENTO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = False
      end
      item
        ActiveFlag = diAsNeeded
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
        ActiveFlag = diAsNeeded
        FieldType = ftUnknown
        Fieldname = 'Average of '
        Name = 'Average of '
        DerivedFrom = 6
        DimensionType = dimAverage
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 20
    MaxCells = 0
    Left = 513
    Top = 407
  end
  object dsLote: TwwDataSource
    DataSet = qryLote
    Left = 378
    Top = 407
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHSTFOLHABENEF, IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HIS' +
        'TORICO'
      'FROM HSTFOLHABENEF'
      'WHERE FLGESTADO <> 2'
      'ORDER BY IDHSTFOLHABENEF DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 407
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PA'
      'WHERE P.IDPESSOA = PA.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 277
    Top = 407
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 311
    Top = 407
  end
  object qryCompara: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
        'SELECT E.MATRICULA, PP.INSCRICAONUMERO, TIT.NOME AS TITULAR, BEN' +
        '.NOME AS BENEFICIARIO, '
        '       PT.NOME AS PATROCINADORA, PL.NOME AS PLANO, VH1.VALBASE, ' +
        'VH2.VALCORRENTE, '
      '       ABS(VH2.VALCORRENTE - VH1.VALBASE) AS DIFERENCA, '
      '       TO_NUMBER(DECODE(VH1.VALBASE, 0, '#39#39', '
        '       ROUND((VH2.VALCORRENTE - VH1.VALBASE)/VH1.VALBASE * 100, ' +
        '2))) AS VARIACAO '
        'FROM (SELECT H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOP' +
        'REV, '
        '             SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, ' +
        '0, H.VALORPROVENTO, 0), '
        '             DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) V' +
        'ALBASE '
      '      FROM HISTRUBSAL H, PROVDESC P '
      '      WHERE H.IDHSTFOLHABENEF IN (481,477) '
      '      AND P.FLGDESCONTO IN (0, 1) '
      '      AND P.FLGESPECIAL = 0 '
      '      AND H.IDMODULO = 18 '
      '      AND H.IDRUBRICA = P.IDPROVENTO '
        '      GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLAN' +
        'OPREV) VH1, '
        '     (SELECT H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOP' +
        'REV, '
        '             SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, ' +
        '0, H.VALORPROVENTO, 0), '
        '             DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) V' +
        'ALCORRENTE '
      '      FROM PREVIA H, PROVDESC P '
      '      WHERE H.IDLOTE = 2832 '
      '      AND H.IDRUBRICA = P.IDPROVENTO '
      '      AND P.FLGESPECIAL = 0 '
      '      AND P.FLGDESCONTO IN (0, 1) '
        '      GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLAN' +
        'OPREV) VH2, '
        '      PESSOA PT, PESSOA TIT, PESSOA BEN, PLANPREV PL, ELEGPATRO ' +
        'E, PARTPREVPLAN PP '
      'WHERE VH1.IDTITULAR = VH2.IDTITULAR '
      'AND VH1.IDRESPONSAVEL = VH2.IDRESPONSAVEL '
      'AND VH1.IDTITULAR = PP.IDPESSOA '
      'AND VH1.IDPATRO = PP.IDPESSJUR '
      'AND VH1.IDPLANOPREV = PP.IDPLANOPREV '
      'AND PP.SEQPROPOSTA = 1 '
      'AND PP.FLGDESATIVADO = 0 '
      'AND VH1.IDTITULAR = E.IDPESSOA '
      'AND VH1.IDPATRO = E.IDPESSJUR '
      'AND VH1.IDTITULAR = TIT.IDPESSOA '
      'AND VH1.IDRESPONSAVEL = BEN.IDPESSOA '
      'AND VH1.IDPATRO = PT.IDPESSOA '
      'AND VH1.IDPLANOPREV = PL.IDPLANOPREV '
      'AND ABS(VH2.VALCORRENTE - VH1.VALBASE*1) >= (0.5*VH1.VALBASE) '
      'ORDER BY PT.IDPESSOA, PL.IDPLANOPREV, PP.INSCRICAONUMERO '
      '')
    ValidateWithMask = True
    Left = 241
    Top = 407
    object qryComparaMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 8
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryComparaINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 8
      FieldName = 'INSCRICAONUMERO'
    end
    object qryComparaTITULAR: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 16
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryComparaBENEFICIARIO: TStringField
      DisplayLabel = 'Recebedor'
      DisplayWidth = 18
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryComparaVALBASE: TFloatField
      DisplayLabel = 'Valor Anterior'
      DisplayWidth = 10
      FieldName = 'VALBASE'
    end
    object qryComparaVALCORRENTE: TFloatField
      DisplayLabel = 'Valor Atual'
      DisplayWidth = 10
      FieldName = 'VALCORRENTE'
    end
    object qryComparaDIFERENCA: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 10
      FieldName = 'DIFERENCA'
    end
    object qryComparaVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 7
      FieldName = 'VARIACAO'
    end
    object qryComparaPATROCINADORA: TStringField
      DisplayLabel = 'Patro'
      DisplayWidth = 14
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryComparaPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 13
      FieldName = 'PLANO'
      Size = 50
    end
  end
  object dsCompara: TwwDataSource
    DataSet = qryCompara
    Left = 207
    Top = 407
  end
end
