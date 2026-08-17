inherited frmConsDisponibilidade: TfrmConsDisponibilidade
  Left = 15
  Top = 23
  Caption = 'Consulta'
  ClientHeight = 527
  ClientWidth = 804
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 488
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 794
      Height = 478
      Align = alClient
      TabOrder = 0
      object bvlSepTit: TBevel
        Left = 1
        Top = 43
        Width = 792
        Height = 3
        Align = alTop
        Shape = bsBottomLine
      end
      object PgcSaldos: TPageControl
        Left = 1
        Top = 113
        Width = 792
        Height = 364
        ActivePage = tbsAnalitica
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        OnChange = PgcSaldosChange
        object tbsSintetica: TTabSheet
          Caption = 'Disponibilidade &Consolidada    '
          object dbgSintetico: TwwDBGrid
            Left = 0
            Top = 0
            Width = 784
            Height = 336
            Hint = 'Clique com o botão direito para Fixar Colunas'
            Selected.Strings = (
              'NOMEPLANOPATRO'#9'43'#9'Plano / Patrocinadora'#9'F'
              'SALDOANT'#9'18'#9'Saldo Anterior'#9'F'
              'RECEBIMENTOS'#9'18'#9'Recebimentos'#9'F'
              'DESEMBOLSOS'#9'16'#9'Desembolsos'#9'F'
              'SALDODIA'#9'17'#9'Saldo do Dia'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            Color = clWhite
            DataSource = dsSintetica
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgSinteticoCalcCellColors
            OnDrawDataCell = dbgSinteticoDrawDataCell
            IndicatorColor = icYellow
            OnTopRowChanged = dbgSinteticoTopRowChanged
          end
        end
        object tbsAnalitica: TTabSheet
          Caption = 'Disponibilidade &Analítica      '
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 336
            Align = alClient
            TabOrder = 0
            object dbgAnalitico: TwwDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 334
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'NOMEPLANOPATRO'#9'35'#9'Plano / Patrocinadora'
                'NOMEFORCLI'#9'35'#9'Cliente / Fornecedor'
                'NODOCUMENTO'#9'35'#9'Documento'
                'NOME'#9'30'#9'Centro de Responsabilidade'
                'RECEBIMENTOS'#9'20'#9'Recebimentos'
                'DESEMBOLSOS'#9'20'#9'Desembolsos'
                'SALDO'#9'20'#9'Saldo do Dia'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = dsAnalitica
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clMaroon
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnCalcCellColors = dbgAnaliticoCalcCellColors
              OnDrawDataCell = dbgAnaliticoDrawDataCell
              IndicatorColor = icYellow
              OnTopRowChanged = dbgAnaliticoTopRowChanged
            end
          end
        end
        object tbsGrafico: TTabSheet
          Caption = 'Gráfico'
          ImageIndex = 2
          object grfSintetica: TDBChart
            Left = 0
            Top = 0
            Width = 784
            Height = 336
            AnimatedZoom = True
            BackWall.Brush.Color = clWhite
            Gradient.EndColor = 8454143
            Gradient.Visible = True
            MarginBottom = 0
            MarginLeft = 1
            MarginRight = 1
            MarginTop = 2
            Title.Text.Strings = (
              '')
            Title.Visible = False
            BottomAxis.Visible = False
            Chart3DPercent = 25
            LeftAxis.Visible = False
            Legend.Alignment = laBottom
            Legend.TextStyle = ltsPlain
            RightAxis.AxisValuesFormat = 'R$ #,##0.00'
            RightAxis.ExactDateTime = False
            RightAxis.Increment = 1000
            RightAxis.LabelStyle = talValue
            TopAxis.Title.Caption = 'Disponibilidade'
            View3DOptions.Elevation = 339
            View3DOptions.Perspective = 0
            View3DOptions.Rotation = 360
            View3DOptions.VertOffset = 2
            View3DOptions.Zoom = 99
            View3DOptions.ZoomText = False
            Align = alClient
            BevelOuter = bvLowered
            BorderStyle = bsSingle
            TabOrder = 0
            object Series1: TBarSeries
              ColorEachPoint = True
              Marks.ArrowLength = 8
              Marks.Font.Charset = DEFAULT_CHARSET
              Marks.Font.Color = clBlack
              Marks.Font.Height = -9
              Marks.Font.Name = 'Arial'
              Marks.Font.Style = []
              Marks.Style = smsPercent
              Marks.Visible = True
              DataSource = qrySintetica
              SeriesColor = clRed
              Title = 'Disponibilidade'
              ValueFormat = ' R$ #,##0.00'
              VertAxis = aRightAxis
              XLabelsSource = 'NOMEPLANOPATRO'
              BarStyle = bsRectGradient
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SALDODIA'
            end
          end
        end
      end
      object pnlTitulo: TPanel
        Left = 1
        Top = 1
        Width = 792
        Height = 42
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblTitulo: TfcLabel
          Left = 1
          Top = 1
          Width = 790
          Height = 40
          Align = alClient
          Caption = '  Disponibilidade'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaVCenter
        end
      end
      object pnlDados: TPanel
        Left = 1
        Top = 46
        Width = 792
        Height = 67
        Align = alTop
        TabOrder = 2
        object Label1: TLabel
          Left = 15
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object Label2: TLabel
          Left = 145
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
        end
        object edtDataRef: TCMDateTimePicker
          Left = 15
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 0
          OnExit = edtDataRefExit
        end
        object bbtnIniciar: TBitBtn
          Left = 269
          Top = 16
          Width = 89
          Height = 36
          Caption = '&Atualizar'
          Default = True
          TabOrder = 1
          OnClick = bbtnIniciarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object edtIntervalo: TdxTimeEdit
          Left = 137
          Top = 24
          Width = 117
          Style.BorderStyle = xbs3D
          TabOrder = 2
          Alignment = taCenter
          StoredValues = 5
        end
        object Animate: TAnimate
          Left = 374
          Top = 4
          Width = 272
          Height = 60
          Active = False
          Color = clBtnFace
          CommonAVI = aviCopyFiles
          ParentColor = False
          StopFrame = 34
          Visible = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 488
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 555
      DockPos = 900
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnImprimir: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 419
    Top = 3
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 478
    Top = 3
  end
  object dsSintetica: TwwDataSource
    AutoEdit = False
    DataSet = qrySintetica
    Left = 599
    Top = 299
  end
  object dsAnalitica: TwwDataSource
    AutoEdit = False
    DataSet = qryAnalitica
    Left = 599
    Top = 347
  end
  object qryAnalitica: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   DECODE(U.NUMAPGR,0,U.NODOCUMENTO,U.NUMAPGR) AS NODOCUMENTO,'
      '   U.NOMEFORCLI,'
      '   U.VALOR,   '
      '   U.CODCENTRORESPON,'
      '   CN.NOME,'
      '   DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      '      DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39','
      
        '         DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||'#39' - '#39' ||P.NOME,'#39#39 +
        '))) AS NOMEPLANOPATRO,'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   U.TIPOREG,'
      '   DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.VALOR) AS SALDO,'
      
        '   DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.VALOR),1,U.VALOR' +
        ',0)) AS RECEBIMENTOS,'
      
        '   DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.VALOR),-1,U.VALO' +
        'R,0)) AS DESEMBOLSOS'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    SELECT'
      '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '       '#39' '#39' AS NODOCUMENTO,'
      '       0 AS NUMAPGR,'
      '       (DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) +'
      '        DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS VALOR,'
      '       IDPLANOPREV,'
      '       IDPATRO,'
      '       1 AS TIPOREG,'
      '       '#39#39' AS CODCENTRORESPON'
      '    FROM'
      '       ('
      '        SELECT'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, '
      '           '#39#39' AS NODOCUMENTO,'
      '           0 AS NUMAPGR,'
      
        '           SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO' +
        ','
      '           R.IDPLANOPREV, R.IDPATRO, 0 AS IDMODULO'
      '        FROM '
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      '           (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '       )'
      '    GROUP BY IDMODULO, IDPLANOPREV, IDPATRO'
      ''
      '    UNION'
      ''
      '    SELECT'
      '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '       '#39' '#39' AS NODOCUMENTO,'
      '       0 AS NUMAPGR,'
      '       (DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) +'
      '        DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS VALOR,'
      '       -1 IDPLANOPREV,'
      '       -1 IDPATRO,'
      '       1 AS TIPOREG,'
      '       '#39#39' AS CODCENTRORESPON'
      '    FROM'
      '       ('
      '        SELECT'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '           '#39#39' AS NODOCUMENTO,'
      '           0 AS NUMAPGR,'
      
        '           SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO' +
        ','
      '           R.IDPLANOPREV,R.IDPATRO,0 AS IDMODULO'
      '        FROM '
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      '           (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '       )'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       DECODE(U.IDFORCLI,-1,'#39'MOVIMENTO FINANCEIRO'#39',P.NOME) AS NO' +
        'MEFORCLI,'
      '       U.NODOCUMENTO,'
      '       U.NUMAPGR,'
      '       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) +'
      '        SUM(DECODE(SIGN(U.SALDO),1,U.SALDO,0)))  AS VALOR,'
      '       U.IDPLANOPREV,'
      '       U.IDPATRO,'
      '       DECODE(U.IDMODULO,79,2,3) AS TIPOREG,'
      '       U.CODCENTRORESPON'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      '         SELECT'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '            -1 AS IDFORCLI,'
      '            0 AS NUMAPGR,'
      '            0 AS CODDOCUMENTO,           '
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '            '#39#39' AS NODOCUMENTO,            '
      '            '#39#39' AS HISTORICOCOMPL,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '            '#39#39' AS CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            '#39'F'#39' AS RECPAG,'
      '            M.IDPESSOA,'
      '            0 AS CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,0 AS IDMODULO,'
      '            R.CODCENTRORESPON,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALD' +
        'O'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '         GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA,R.CODCENT' +
        'RORESPON'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.NUMAPGR,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      
        '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),' +
        '(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      '            R.CODCENTRORESPON,'
      '            SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      '            ('
      '             SELECT'
      
        '                D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.NUMAPGR,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      
        '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),' +
        '(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      '            R.CODCENTRORESPON,'
      '            SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      '            ('
      '             SELECT'
      
        '                D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'R'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      ''
      '                R.CODCENTRORESPON,D.NUMAPGR'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.NUMAPGR,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      
        '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),' +
        '(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      '            R.CODCENTRORESPON,'
      
        '            SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) AS S' +
        'ALDO'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L,'
      '            ('
      '             SELECT'
      
        '                D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.V' +
        'ALOR*-1)) AS SALDOTOT              FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA'
      '            ) SS,'
      '            ('
      '             SELECT'
      
        '                D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDODOC'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S,'
      '            ('
      '             SELECT'
      
        '                D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.ID' +
        'PATRO, R.IDPESSOA,'
      
        '                R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORE' +
        'SPON'
      '             FROM'
      '                DOCUMENTO D, RATEIODOCUM R'
      '             WHERE'
      '               (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      
        '             GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, ' +
        'R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON'
      '            ) R'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.NUMFATURA = R.NUMFATURA)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.NUMFATURA = SS.NUMFATURA)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '            AND (D.OPERACAO IN ('#39'3 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      '        )'
      '       ) U'
      '    WHERE'
      '       (U.IDFORCLI = P.IDPESSOA(+))'
      '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '       AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '       AND (U.IDPESSOA = T.IDPESSOA(+))'
      '       AND (U.RECPAG = T.RECPAG(+))'
      '       AND (U.IDMODULO = M.IDMODULO(+))'
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,'#39'MOVIMENTO FINAN' +
        'CEIRO'#39',P.NOME),'
      
        '       U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.' +
        'NUMAPGR'
      ''
      '    UNION'
      ''
      '    SELECT'
      '       '#39'SALDO FINAL'#39' AS NOMEFORCLI,'
      '       '#39' '#39' AS NODOCUMENTO,       '
      '       0 AS NUMAPGR,'
      
        '       (DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)),-1,(S' +
        'UM(VALORARECEBER) + SUM(VALORAPAGAR)),0) +'
      
        '        DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)), 1,(S' +
        'UM(VALORARECEBER) + SUM(VALORAPAGAR)),0)) AS VALOR,'
      '       IDPLANOPREV,'
      '       IDPATRO,'
      '       4 AS TIPOREG,'
      '       '#39#39' AS CODCENTRORESPON'
      '    FROM'
      '       (SELECT'
      '           U.NODOCUMENTO,'
      '           P.NOME AS NOMEFORCLI,'
      '           U.NUMAPGR,'
      '           DECODE(SIGN(U.SALDO),-1,U.SALDO,0) AS VALORAPAGAR,'
      '           DECODE(SIGN(U.SALDO),1,U.SALDO,0)  AS VALORARECEBER,'
      '           U.IDPLANOPREV,'
      '           U.IDPATRO,'
      '           '#39#39' AS CODCENTRORESPON'
      '        FROM'
      
        '           PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTA' +
        'BIL PP, TIPODOCRECPAG TD, MODULO M,'
      '           ('
      '            (SELECT'
      
        '                TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA' +
        ','
      '                0 AS IDFORCLI,'
      '                0 AS NUMAPGR,'
      '                0 AS CODDOCUMENTO,'
      '                TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '                '#39#39' AS NODOCUMENTO,'
      '                '#39#39' AS HISTORICOCOMPL,'
      '                TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '                '#39#39' AS CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                '#39'F'#39' AS RECPAG,'
      '                M.IDPESSOA,'
      '                0 AS CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                0 AS IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      
        '                SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS ' +
        'SALDO'
      '             FROM'
      '                MOVIMFINANC M, RATEIOFINANC R'
      '             WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '                AND (M.IDPESSOA = :IDPESSOA)'
      '                AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '                AND (M.DATALANCFINAN <= TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '             GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA,R.COD' +
        'CENTRORESPON )'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      '                SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDO'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR)'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      '                SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDO'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'R'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR)'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      
        '                SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) ' +
        'AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L,'
      
        '                (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.V' +
        'ALOR,L.VALOR*-1)) AS SALDOTOT'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                 GROUP BY D.NUMFATURA) SS,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S,'
      
        '                (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPR' +
        'EV, R.IDPATRO, R.IDPESSOA,'
      
        '                        R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.COD' +
        'CENTRORESPON'
      '                 FROM DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR)'
      '           ) U'
      '        WHERE'
      '           (U.IDFORCLI = P.IDPESSOA(+))'
      '           AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '           AND (U.IDPATRO = PT.IDPESSOA(+))'
      '           AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      
        '           AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '           AND (U.IDPESSOA = T.IDPESSOA(+))'
      '           AND (U.RECPAG = T.RECPAG(+))'
      '           AND (U.IDMODULO = M.IDMODULO(+)))'
      '        GROUP BY IDPLANOPREV, IDPATRO'
      ''
      '    UNION'
      ''
      '    SELECT'
      '      '#39'SALDO FINAL'#39' AS NOMEFORCLI,'
      '      '#39' '#39' AS NODOCUMENTO,'
      '      0 AS NUMAPGR,'
      
        '      (DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)),-1,(SU' +
        'M(VALORARECEBER) + SUM(VALORAPAGAR)),0) +'
      
        '       DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)), 1,(SU' +
        'M(VALORARECEBER) + SUM(VALORAPAGAR)),0)) AS VALOR,'
      '      9999999 AS IDPLANOPREV,'
      '      9999999 AS IDPATRO,'
      '      4 AS TIPOREG,'
      '      '#39#39' AS CODCENTRORESPON'
      '    FROM'
      '       (SELECT'
      '           U.NODOCUMENTO,'
      '           P.NOME AS NOMEFORCLI,'
      '           0 AS NUMAPGR,'
      '           DECODE(SIGN(U.SALDO),-1,U.SALDO,0) AS VALORAPAGAR,'
      '           DECODE(SIGN(U.SALDO),1,U.SALDO,0)  AS VALORARECEBER,'
      '           U.IDPLANOPREV,'
      '           U.IDPATRO,'
      '           '#39#39' AS CODCENTRORESPON'
      '        FROM'
      
        '           PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTA' +
        'BIL PP, TIPODOCRECPAG TD, MODULO M,'
      '           ('
      '            (SELECT'
      
        '                TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA' +
        ','
      '                 0 AS IDFORCLI,'
      '                 0 AS NUMAPGR,'
      '                 0 AS CODDOCUMENTO,'
      '                 TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '                 '#39#39' AS NODOCUMENTO,'
      '                 '#39#39' AS HISTORICOCOMPL,'
      '                 TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '                 '#39#39' AS CODTIPRECDES,'
      '                 R.IDPLANOPREV,'
      '                 R.IDPATRO,'
      '                 '#39'F'#39' AS RECPAG,'
      '                 M.IDPESSOA,'
      '                 0 AS CODTIPDOC,'
      '                 '#39'I'#39' AS INCLUDISP,'
      '                 0 AS IDMODULO,'
      '                 '#39#39' AS CODCENTRORESPON,'
      
        '                 SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS' +
        ' SALDO'
      '             FROM'
      '                MOVIMFINANC M, RATEIOFINANC R'
      '             WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '                AND (M.IDPESSOA = :IDPESSOA)'
      '                AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '                AND (M.DATALANCFINAN <= TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '             GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA,R.COD' +
        'CENTRORESPON )'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      '                SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDO'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                 GROUP BY D.CODDOCUMENTO) S'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                 L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES,' +
        ' R.IDPLANOPREV, R.IDPATRO,'
      
        '                 R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, ' +
        'D.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR )'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      '                SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDO'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'R'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                 GROUP BY D.CODDOCUMENTO) S'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                 L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES,' +
        ' R.IDPLANOPREV, R.IDPATRO,'
      
        '                 R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, ' +
        'D.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR )'
      '            UNION ALL'
      '            (SELECT'
      '                D.DATAPROGRAMADA,'
      '                D.IDFORCLI,'
      '                D.NUMAPGR,'
      '                D.CODDOCUMENTO,'
      '                D.DATAVENCTO,'
      
        '                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMEN' +
        'TO),'
      
        '                (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO))' +
        ' AS NODOCUMENTO,'
      '                L.HISTORICOCOMPL,'
      '                L.DATALANCTO,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.RECPAG,'
      '                D.IDPESSOA,'
      '                D.CODTIPDOC,'
      '                '#39'I'#39' AS INCLUDISP,'
      '                D.IDMODULO,'
      '                '#39#39' AS CODCENTRORESPON,'
      
        '                SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) ' +
        'AS SALDO '
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L,'
      
        '                (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.V' +
        'ALOR,L.VALOR*-1)) AS SALDOTOT'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                 GROUP BY D.NUMFATURA) SS,'
      
        '                (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',' +
        'L.VALOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      
        '                (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPR' +
        'EV, R.IDPATRO, R.IDPESSOA,'
      
        '                         R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CO' +
        'DCENTRORESPON '
      '                 FROM DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON ) R'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                  L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES' +
        ', R.IDPLANOPREV, R.IDPATRO,'
      
        '                  R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC,' +
        ' D.IDMODULO, D.CODDOCUMENTO,R.CODCENTRORESPON,D.NUMAPGR)'
      '           ) U'
      '        WHERE (U.IDFORCLI = P.IDPESSOA(+))'
      '           AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '           AND (U.IDPATRO = PT.IDPESSOA(+))'
      '           AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      
        '           AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '           AND (U.IDPESSOA = T.IDPESSOA(+))'
      '           AND (U.RECPAG = T.RECPAG(+))'
      '           AND (U.IDMODULO = M.IDMODULO(+)))'
      '        ORDER BY TIPOREG, NODOCUMENTO'
      '       ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+) '
      'ORDER BY U.IDPLANOPREV,U.IDPATRO,U.TIPOREG'
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 535
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
        Value = '12/11/2002'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end>
    object qryAnaliticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 35
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryAnaliticaNOMEFORCLI: TStringField
      DisplayLabel = 'Cliente / Fornecedor'
      DisplayWidth = 35
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object qryAnaliticaNODOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 35
      FieldName = 'NODOCUMENTO'
      Size = 44
    end
    object qryAnaliticaNOME: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 30
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object qryAnaliticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 20
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '#,##0.00'
    end
    object qryAnaliticaDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 20
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '#,##0.00'
    end
    object qryAnaliticaSALDO: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 20
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryAnaliticaCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro de '
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryAnaliticaVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryAnaliticaIDPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANO'
      Visible = False
    end
    object qryAnaliticaIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryAnaliticaTIPOREG: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOREG'
      Visible = False
    end
  end
  object CdsParamFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParamFinanc'
    Left = 104
    Top = 184
    object CdsParamFinancDATABLOQDISPFINAN: TDateTimeField
      FieldName = 'DATABLOQDISPFINAN'
    end
    object CdsParamFinancFLGDISPBLOQ: TStringField
      FieldName = 'FLGDISPBLOQ'
      FixedChar = True
      Size = 1
    end
  end
  object CdsDispFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 106
    Top = 232
  end
  object dspParamFinanc: TDataSetProvider
    DataSet = qryParamFinanc
    Constraints = True
    Left = 259
    Top = 181
  end
  object qryParamFinanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATABLOQDISPFINAN,FLGDISPBLOQ'
      'FROM PARAMFINANC')
    ValidateWithMask = True
    Left = 187
    Top = 181
  end
  object CMSqlParams1: TCMSqlParams
    Left = 362
    Top = 152
  end
  object CdsDispSintetica: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dspDispSintetica'
    Left = 104
    Top = 287
    object CdsDispSinteticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 43
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object CdsDispSinteticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANT'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 19
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaDESENBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 19
      FieldName = 'DESENBOLSOS'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaSALDODIA: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 19
      FieldName = 'SALDODIA'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
      Visible = False
    end
    object CdsDispSinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object CdsDispSinteticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object CdsDispAnalitica: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dspDispAnalitica'
    Left = 104
    Top = 341
    object CdsDispAnaliticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 47
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object CdsDispAnaliticaHISTORICO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 39
      FieldName = 'HISTORICO'
      Size = 100
    end
    object CdsDispAnaliticaNOMEFORCLI: TStringField
      DisplayLabel = 'Forncedor / Cliente'
      DisplayWidth = 60
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object CdsDispAnaliticaVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispAnaliticaIDPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANO'
      Visible = False
    end
    object CdsDispAnaliticaIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsDispAnaliticaDATADISPFINANC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATADISPFINANC'
      Visible = False
    end
  end
  object dsDispSintetica: TwwDataSource
    AutoEdit = False
    DataSet = CdsDispSintetica
    Left = 208
    Top = 280
  end
  object dsDispAnalitica: TwwDataSource
    DataSet = CdsDispAnalitica
    Left = 208
    Top = 336
  end
  object dspDispAnalitica: TDataSetProvider
    DataSet = qryDispAnalitica
    Constraints = True
    Left = 291
    Top = 337
  end
  object dspDispSintetica: TDataSetProvider
    DataSet = qryDispSintetica
    Constraints = True
    Left = 291
    Top = 281
  end
  object qryDispSintetica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'PP.NOME||'#39' - '#39' ||P.RAZAOSOCIAL AS NOMEPLANOPATRO,'
      'U2.DATADISPFINANC,'
      'U2.SALDOANT,'
      'U2.IDPLANO,'
      'U2.IDPATRO,'
      'U2.VALORPAG AS DESENBOLSOS,'
      'U2.VALORREC AS RECEBIMENTOS,'
      'U2.SALDOATUAL AS SALDODIA'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PP,'
      '('
      'SELECT'
      'U.IDPLANO,U.IDPATRO,U.IDPESSOA,'
      'U.DATADISPFINANC,'
      'SUM(U.SALDOANT) AS SALDOANT,'
      'SUM(U.VALORPAG) AS VALORPAG,'
      'SUM(U.VALORREC) AS VALORREC,'
      'SUM(U.SALDOANT + U.VALORREC - U.VALORPAG) AS SALDOATUAL'
      'FROM'
      '('
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      'SUM(DI.VLRDISPFINANC) AS SALDOANT,'
      '0 AS VALORPAG,'
      '0 AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'A'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      
        'DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,SUM(DI.VLRDISPFINANC),0) A' +
        'S VALORPAG,'
      
        'DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,0,SUM(DI.VLRDISPFINANC)) A' +
        'S VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'F'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      'SUM(DI.VLRDISPFINANC)*-1 AS VALORPAG,'
      '0 AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'P'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      '0 AS VALORPAG,'
      'SUM(DI.VLRDISPFINANC) AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      ''
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'R'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ') U'
      'GROUP BY                                                      '
      '    U.IDPLANO,U.IDPATRO,U.IDPESSOA,                           '
      '    U.DATADISPFINANC                                          '
      ') U2'
      'WHERE'
      '(U2.IDPATRO = P.IDPESSOA(+))'
      'AND (U2.IDPLANO = PP.IDPLANOPREV(+))'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 379
    Top = 289
  end
  object qryDispAnalitica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   U.IDPLANO,'
      '   U.IDPATRO,'
      '   U.DATADISPFINANC,'
      '   U.HISTORICO,'
      '   U.VLRDISPFINANC AS VALOR,'
      '   PT.NOME||'#39' - '#39' ||P.RAZAOSOCIAL AS NOMEPLANOPATRO,'
      '   U.NOMEFORCLI'
      'FROM'
      '   PESSOA P,'
      '   PLANPREVCONTABIL PT,'
      '       ('
      '        SELECT'
      '           R.IDPLANO,'
      '           R.IDPATRO,'
      '           D.DATADISPFINANC,'
      '           D.TIPOREG,'
      '           D.HISTORICO,'
      '           D.VLRDISPFINANC,'
      '           P.NOME AS NOMEFORCLI'
      '        FROM'
      '           DISPFINANC D,'
      '           RATEIODISPFINANC R,'
      '           PESSOA P'
      '        WHERE'
      '           D.IDDISPFINANC = R.IDDISPFINANC'
      '           AND R.IDFORCLI = P.IDPESSOA'
      '           AND R.IDPESSOA = 2'
      
        '           AND DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY' +
        #39')'
      ''
      '        UNION'
      ''
      '        SELECT'
      '           R.IDPLANO,'
      '           R.IDPATRO,'
      '           D.DATADISPFINANC,'
      '           '#39'S'#39' AS TIPOREG,'
      '           '#39'Saldo Final'#39' AS HISTORICO,'
      '           SUM(D.VLRDISPFINANC) AS VLRDISPFINANC,'
      '           '#39#39' AS NOMEFORCLI'
      '        FROM'
      '           DISPFINANC D,'
      '           RATEIODISPFINANC R'
      '        WHERE'
      '           D.IDDISPFINANC = R.IDDISPFINANC'
      '           AND R.IDPESSOA = 2'
      
        '           AND D.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '        GROUP BY'
      '           R.IDPLANO, R.IDPATRO,D.DATADISPFINANC'
      '       )U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA'
      '   AND U.IDPLANO = PT.IDPLANOPREV'
      'ORDER BY U.IDPLANO,U.IDPATRO,U.TIPOREG'
      ' ')
    ValidateWithMask = True
    Left = 379
    Top = 344
  end
  object qrySintetica: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   PP.NOME||'#39' - '#39'||PT.NOME AS NOMEPLANOPATRO,'
      '   NVL(PP.NOME,'#39'YYYYYY'#39') AS NOMEPLANO,'
      '   NVL(PT.NOME,'#39'YYYYYY'#39') AS NOMEPATRO,'
      '   SUM(U.SALDOANT) AS SALDOANT,'
      '   SUM(U.RECEBIMENTO) AS RECEBIMENTOS,'
      '   SUM(U.DESEMBOLSO) AS DESEMBOLSOS,'
      '   SUM(U.SALDO) AS SALDODIA,'
      
        '   (SUM(U.SALDOANT) + SUM(U.RECEBIMENTO) + SUM(U.DESEMBOLSO) - (' +
        'SUM(U.SALDO))) AS DIF'
      'FROM'
      '   PESSOA PT,PLANPREVCONTABIL PP,'
      '   ('
      '    ('
      '     SELECT'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '        0 AS IDFORCLI,'
      '        0 AS CODDOCUMENTO,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '        '#39#39' AS NODOCUMENTO,'
      '        '#39#39' AS HISTORICOCOMPL,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '        '#39#39' AS CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        '#39'F'#39' AS RECPAG,'
      '        M.IDPESSOA,'
      '        0 AS CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        0 AS IDMODULO,'
      '        0 AS RECEBIMENTO,'
      '        0 AS DESEMBOLSO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO,'
      '        0 AS SALDOANT'
      '     FROM'
      '        MOVIMFINANC M,RATEIOFINANC R'
      '     WHERE'
      '        (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        AND (M.IDPESSOA = :IDPESSOA)'
      '        AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '        AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '     GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA'
      '    )'
      '    UNION ALL'
      '    ('
      '     SELECT'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '        0 AS IDFORCLI,'
      '        0 AS CODDOCUMENTO,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '        '#39#39' AS NODOCUMENTO,'
      '        '#39#39' AS HISTORICOCOMPL,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '        '#39#39' AS CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        '#39'F'#39' AS RECPAG,'
      '        M.IDPESSOA,'
      '        0 AS CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        0 AS IDMODULO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0.00)) AS RECEBIMENTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',0.00,R.VALOR*-1)) AS PAGAMENTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO,'
      '        0 AS SALDOANT'
      '     FROM'
      '        MOVIMFINANC M,RATEIOFINANC R'
      '     WHERE'
      '        (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        AND (M.IDPESSOA = :IDPESSOA)'
      '        AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '        AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '     GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA'
      '    )'
      '    UNION ALL'
      '    ('
      '     SELECT'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '        0 AS IDFORCLI,'
      '        0 AS CODDOCUMENTO,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '        '#39#39' AS NODOCUMENTO,'
      '        '#39#39' AS HISTORICOCOMPL,'
      '        TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '        '#39#39' AS CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        '#39'F'#39' AS RECPAG,'
      '        M.IDPESSOA,'
      '        0 AS CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        0 AS IDMODULO,'
      '        0 AS RECEBIMENTO,'
      '        0 AS DESEMBOLSO,'
      '        0 AS SALDO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT'
      '     FROM'
      '        MOVIMFINANC M,RATEIOFINANC R'
      '     WHERE'
      '        (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        AND (M.IDPESSOA = :IDPESSOA)'
      '        AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '        AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '     GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA'
      '    )'
      '    UNION ALL'
      '    ('
      '     SELECT'
      '        D.DATAPROGRAMADA,'
      '        D.IDFORCLI,'
      '        D.CODDOCUMENTO,'
      '        D.DATAVENCTO,'
      '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '        (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODO' +
        'CUMENTO,'
      '        L.HISTORICOCOMPL,'
      '        L.DATALANCTO,'
      '        R.CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        R.RECPAG,'
      '        D.IDPESSOA,'
      '        D.CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        D.IDMODULO,'
      
        '        DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(SUM(((' +
        'R.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '        DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(SUM(((' +
        'R.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '        SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '        0 AS SALDOANT'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         SELECT'
      '            D.CODDOCUMENTO,'
      
        '            SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS SALD' +
        'O'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '         GROUP BY D.CODDOCUMENTO'
      '        ) S'
      '     WHERE'
      '        (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.OPERACAO = L.OPERACAO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '        AND (D.IDPESSOA = :IDPESSOA)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (NVL(L.VALOR,0) <> 0)'
      '        AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '        AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '     GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUM' +
        'ENTO,'
      
        '             D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CO' +
        'DTIPRECDES,'
      
        '             R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERA' +
        'CAO,'
      '             D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '    )'
      '    UNION ALL'
      '    ('
      '     SELECT'
      '        D.DATAPROGRAMADA,'
      '        D.IDFORCLI,'
      '        D.CODDOCUMENTO,'
      '        D.DATAVENCTO,'
      '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '        (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODO' +
        'CUMENTO,'
      '        L.HISTORICOCOMPL,'
      '        L.DATALANCTO,'
      '        R.CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        R.RECPAG,'
      '        D.IDPESSOA,'
      '        D.CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        D.IDMODULO,'
      
        '        DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(SUM(((' +
        'R.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '        DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(SUM(((' +
        'R.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '        SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '        0 AS SALDOANT'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         SELECT'
      '            D.CODDOCUMENTO,'
      
        '            SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS SALD' +
        'O'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND (D.RECPAG = '#39'R'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '         GROUP BY D.CODDOCUMENTO'
      '        ) S'
      '     WHERE'
      '        (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.OPERACAO = L.OPERACAO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '        AND (D.IDPESSOA = :IDPESSOA)'
      '        AND (D.RECPAG = '#39'R'#39')'
      '        AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (NVL(L.VALOR,0) <> 0)'
      '        AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '        AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '     GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUM' +
        'ENTO,'
      
        '             D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CO' +
        'DTIPRECDES,'
      
        '             R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERA' +
        'CAO,'
      '             D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '    )'
      '    UNION ALL'
      '    ('
      '     SELECT'
      '        D.DATAPROGRAMADA,'
      '        D.IDFORCLI,'
      '        D.CODDOCUMENTO,'
      '        D.DATAVENCTO,'
      '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '        (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODO' +
        'CUMENTO,'
      '        L.HISTORICOCOMPL,'
      '        L.DATALANCTO,'
      '        R.CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        R.RECPAG,'
      '        D.IDPESSOA,'
      '        D.CODTIPDOC,'
      '        '#39'I'#39' AS INCLUDISP,'
      '        D.IDMODULO,'
      
        '        DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT' +
        ')))), 1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS RE' +
        'CEBIMENTO,'
      
        '        DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT' +
        ')))),-1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS DE' +
        'SEMBOLSO,'
      
        '        SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) AS SALDO' +
        ','
      '        0 AS SALDOANT'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,'
      '        ('
      '         SELECT'
      
        '            D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR' +
        '*-1)) AS SALDOTOT'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.OPERACAO IN ('#39'1 '#39'))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.NUMFATURA IS NOT NULL)'
      '         GROUP BY D.NUMFATURA'
      '        )SS,'
      '        ('
      '         SELECT'
      
        '            D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VA' +
        'LOR*-1)) AS SALDODOC'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'3 '#39'))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '         GROUP BY D.CODDOCUMENTO'
      '        )S,'
      '        ('
      '         SELECT'
      '            D.NUMFATURA,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.IDPESSOA,'
      '            R.RECPAG,'
      '            SUM(R.VALOR) AS VALORRAT'
      '         FROM'
      '            DOCUMENTO D,RATEIODOCUM R'
      '         WHERE'
      '            (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'1 '#39'))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.NUMFATURA IS NOT NULL)'
      '         GROUP BY R.CODTIPRECDES,R.IDPLANOPREV,R.IDPATRO,'
      '                R.IDPESSOA,R.RECPAG,D.NUMFATURA'
      '        )R'
      '     WHERE'
      '        (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.OPERACAO = L.OPERACAO)'
      '        AND (D.NUMFATURA = R.NUMFATURA)'
      '        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '        AND (D.NUMFATURA = SS.NUMFATURA)'
      '        AND (D.IDPESSOA = :IDPESSOA)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '        AND (D.OPERACAO IN ('#39'3 '#39'))'
      '        AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '     GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUM' +
        'ENTO,'
      
        '             D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CO' +
        'DTIPRECDES,'
      '             R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,'
      '             D.OPERACAO,D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '    )'
      '   )U'
      'WHERE'
      '   (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '   AND (U.IDPATRO = PT.IDPESSOA(+))'
      '   AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      'GROUP BY U.IDPLANOPREV, U.IDPATRO, PP.NOME, PT.NOME'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '   -1 AS IDPLANOPREV,'
      '   -1 AS IDPATRO,'
      '   '#39'TOTAL GERAL'#39' AS NOMEPLANOPATRO,'
      '   '#39'ZZZZZZ'#39' AS NOMEPLANO,'
      '   '#39'ZZZZZZ'#39' AS NOMEPATRO,'
      '   SUM(SALDOANT) AS SALDOANT,'
      '   SUM(RECEBIMENTOS) AS RECEBIMENTOS,'
      '   SUM(DESEMBOLSOS) AS DESEMBOLSOS,'
      '   SUM(SALDODIA) AS SALDODIA,'
      
        '   (SUM(SALDOANT) + SUM(RECEBIMENTOS) + SUM(DESEMBOLSOS) - (SUM(' +
        'SALDODIA))) AS DIF'
      'FROM'
      '   ('
      '    SELECT'
      '       U.IDPLANOPREV,'
      '       U.IDPATRO,'
      '       PP.NOME||'#39' - '#39'||PT.NOME AS NOMEPLANOPATRO,'
      '       PP.NOME AS NOMEPLANO,'
      '       PT.NOME AS NOMEPATRO,'
      '       SUM(U.SALDOANT) AS SALDOANT,'
      '       SUM(U.RECEBIMENTO) AS RECEBIMENTOS,'
      '       SUM(U.DESEMBOLSO) AS DESEMBOLSOS,'
      '       SUM(U.SALDO) AS SALDODIA,'
      
        '       (SUM(U.SALDOANT) + SUM(U.RECEBIMENTO) + SUM(U.DESEMBOLSO)' +
        ' - (SUM(U.SALDO))) AS DIF'
      '    FROM'
      '       PESSOA PT, PLANPREVCONTABIL PP,'
      '       ('
      '        ('
      '         SELECT'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '            0 AS IDFORCLI,'
      '            0 AS CODDOCUMENTO,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '            '#39#39' AS NODOCUMENTO,'
      '            '#39#39' AS HISTORICOCOMPL,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '            '#39#39' AS CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            '#39'F'#39' AS RECPAG,'
      '            M.IDPESSOA,'
      '            0 AS CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            0 AS IDMODULO,'
      '            0 AS RECEBIMENTO,'
      '            0 AS DESEMBOLSO,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALD' +
        'O,'
      '            0 AS SALDOANT'
      '         FROM'
      '             MOVIMFINANC M,RATEIOFINANC R'
      '         WHERE'
      '            (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '         GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '            0 AS IDFORCLI,'
      '            0 AS CODDOCUMENTO,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '            '#39#39' AS NODOCUMENTO,'
      '            '#39#39' AS HISTORICOCOMPL,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '            '#39#39' AS CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            '#39'F'#39' AS RECPAG,'
      '            M.IDPESSOA,'
      '            0 AS CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            0 AS IDMODULO,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0.00)) AS RECEBIMENT' +
        'O,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',0.00,R.VALOR*-1)) AS DESEMBO' +
        'LSO,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALD' +
        'O,'
      '            0 AS SALDOANT'
      '         FROM'
      '            MOVIMFINANC M,RATEIOFINANC R'
      '         WHERE'
      '            (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '         GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '            0 AS IDFORCLI,'
      '            0 AS CODDOCUMENTO,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '            '#39#39' AS NODOCUMENTO,'
      '            '#39#39' AS HISTORICOCOMPL,'
      '            TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '            '#39#39' AS CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            '#39'F'#39' AS RECPAG,'
      '            M.IDPESSOA,'
      '            0 AS CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            0 AS IDMODULO,'
      '            0 AS RECEBIMENTO,'
      '            0 AS DESEMBOLSO,'
      '            0 AS SALDO,'
      
        '            SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALD' +
        'OANT'
      '         FROM'
      '            MOVIMFINANC M,RATEIOFINANC R'
      '         WHERE'
      '            (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '         GROUP BY R.IDPLANOPREV, R.IDPATRO,M.IDPESSOA'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '            (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      
        '            DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(SU' +
        'M(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '            DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(SU' +
        'M(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '            SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '            0 AS SALDOANT'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L, RATEIODOCUM R,'
      '            ('
      '             SELECT'
      '                D.CODDOCUMENTO,'
      
        '                SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS ' +
        'SALDO'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '         GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NOD' +
        'OCUMENTO,'
      
        '            D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.COD' +
        'TIPRECDES,'
      
        '            R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERAC' +
        'AO,'
      '            D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '        )'
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '            (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      
        '            DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(SU' +
        'M(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '            DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(SU' +
        'M(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '            SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '            0 AS SALDOANT'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L, RATEIODOCUM R,'
      '            ('
      '             SELECT'
      '                D.CODDOCUMENTO,'
      
        '                SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS ' +
        'SALDO'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'R'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '         GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NOD' +
        'OCUMENTO,'
      
        '            D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.COD' +
        'TIPRECDES,'
      
        '            R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERAC' +
        'AO,'
      '            D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '        )'
      ''
      '        UNION ALL'
      '        ('
      '         SELECT'
      '            D.DATAPROGRAMADA,'
      '            D.IDFORCLI,'
      '            D.CODDOCUMENTO,'
      '            D.DATAVENCTO,'
      '            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '            (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO,'
      '            L.HISTORICOCOMPL,'
      '            L.DATALANCTO,'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.RECPAG,'
      '            D.IDPESSOA,'
      '            D.CODTIPDOC,'
      '            '#39'I'#39' AS INCLUDISP,'
      '            D.IDMODULO,'
      
        '            DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALD' +
        'OTOT)))), 1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) A' +
        'S RECEBIMENTO,'
      
        '            DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALD' +
        'OTOT)))),-1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) A' +
        'S DESEMBOLSO,'
      
        '            SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) AS S' +
        'ALDO,'
      '            0 AS SALDOANT'
      '         FROM'
      '            DOCUMENTO D,LANCTODOCUM L,'
      '            ('
      '             SELECT'
      '                D.NUMFATURA,'
      
        '                SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS ' +
        'SALDOTOT'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA'
      '            ) SS,'
      '            ('
      '             SELECT'
      '                D.CODDOCUMENTO,'
      
        '                SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS ' +
        'SALDODOC'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO'
      '            ) S,'
      '            ('
      '             SELECT'
      '                D.NUMFATURA,'
      '                R.CODTIPRECDES,'
      '                R.IDPLANOPREV,'
      '                R.IDPATRO,'
      '                R.IDPESSOA,'
      '                R.RECPAG,'
      '                SUM(R.VALOR) AS VALORRAT'
      '             FROM'
      '                DOCUMENTO D, RATEIODOCUM R'
      '             WHERE'
      '                (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY R.CODTIPRECDES,R.IDPLANOPREV,R.IDPATRO,'
      '                R.IDPESSOA,R.RECPAG,D.NUMFATURA'
      '            ) R'
      '         WHERE'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.NUMFATURA = R.NUMFATURA)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.NUMFATURA = SS.NUMFATURA)'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      
        '            AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '            AND (D.OPERACAO IN ('#39'3 '#39'))'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '         GROUP BY D.IDFORCLI, D.DATAVENCTO,D.COMPLDOCUMENTO,'
      
        '            D.NODOCUMENTO,D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DA' +
        'TALANCTO,'
      
        '            R.CODTIPRECDES,R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.ID' +
        'PESSOA,'
      '            D.OPERACAO,D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      '        )'
      '       )U'
      '    WHERE'
      '       (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '    GROUP BY'
      '       U.IDPLANOPREV,U.IDPATRO,PP.NOME,PT.NOME'
      '   )'
      'ORDER BY NOMEPLANO, NOMEPATRO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 538
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object qrySinteticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 43
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qrySinteticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANT'
      DisplayFormat = '#,##0.00'
    end
    object qrySinteticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 18
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '#,##0.00'
    end
    object qrySinteticaDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 16
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '#,##0.00'
    end
    object qrySinteticaSALDODIA: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 17
      FieldName = 'SALDODIA'
      DisplayFormat = '#,##0.00'
    end
    object qrySinteticaIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qrySinteticaNOMEPLANO: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object qrySinteticaNOMEPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEPATRO'
      Visible = False
      Size = 60
    end
    object qrySinteticaDIF: TFloatField
      DisplayWidth = 10
      FieldName = 'DIF'
      Visible = False
    end
    object qrySinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
      Visible = False
    end
  end
  object pplSintetica: TppBDEPipeline
    DataSource = dsSintetica
    UserName = 'lSintetica'
    Left = 534
    Top = 150
    object pplSinteticappField1: TppField
      FieldAlias = 'NOMEPLANOPATRO'
      FieldName = 'NOMEPLANOPATRO'
      FieldLength = 113
      DisplayWidth = 43
      Position = 0
    end
    object pplSinteticappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 1
    end
    object pplSinteticappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBIMENTOS'
      FieldName = 'RECEBIMENTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 2
    end
    object pplSinteticappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESEMBOLSOS'
      FieldName = 'DESEMBOLSOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object pplSinteticappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDODIA'
      FieldName = 'SALDODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 4
    end
    object pplSinteticappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSinteticappField7: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pplSinteticappField8: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplSinteticappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplSinteticappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object pplAnalitica: TppBDEPipeline
    DataSource = dsAnalitica
    UserName = 'lAnalitica'
    Left = 534
    Top = 201
  end
  object rptDispAnalitica: TppReport
    AutoStop = False
    DataPipeline = pplAnalitica
    OnStartPage = rptDispAnaliticaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Analítica'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 610
    Top = 192
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Disponibilidade Analítica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 116946
        mmTop = 7144
        mmWidth = 50536
        BandType = 0
      end
      object lblEmpresaAnalitica: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128588
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object shpDispAnaCabecalho: TppShape
        UserName = 'shpDispAnaDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label1'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 24871
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cliente / Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 52123
        mmTop = 24871
        mmWidth = 31221
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Recebimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 24871
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Plano / Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 24871
        mmWidth = 33073
        BandType = 0
      end
      object lblDataAnalitica: TppLabel
        UserName = 'lblDataAnalitica'
        Caption = 'Data : 22/22/2222'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 127529
        mmTop = 12965
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Desembolsos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 212196
        mmTop = 24871
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Saldo do Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 249767
        mmTop = 24871
        mmWidth = 19579
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'dbiLogoEmpresa1'
        DirectDraw = True
        MaintainAspectRatio = True
        ShiftWithParent = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 23548
        mmLeft = 3704
        mmTop = 0
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDispAnaDetalhe: TppShape
        OnPrint = shpDispAnaDetalhePrint
        UserName = 'shpDispAnaDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102394
        mmTop = 0
        mmWidth = 57150
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NOMEFORCLI'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'RECEBIMENTOS'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 0
        mmWidth = 35453
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NOMEPLANOPATRO'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DESEMBOLSOS'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197644
        mmTop = 0
        mmWidth = 35453
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'SALDO'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 234157
        mmTop = 0
        mmWidth = 35453
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object lblDispAnaSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPLANOPATRO'
      DataPipeline = pplAnalitica
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1321
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object rptDispSintetica: TppReport
    AutoStop = False
    DataPipeline = pplSintetica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Consolidada'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 610
    Top = 144
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Disponibilidade Consolidada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 70379
        mmTop = 7408
        mmWidth = 58473
        BandType = 0
      end
      object lblEmpresaSintetica: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object shpDispConCabecalho: TppShape
        UserName = 'shpDispConCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 24871
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label1'
        Caption = 'Plano / Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 25135
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 79375
        mmTop = 25135
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label3'
        Caption = 'Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 25135
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label4'
        Caption = 'Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 145786
        mmTop = 25135
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label5'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178594
        mmTop = 25135
        mmWidth = 17727
        BandType = 0
      end
      object lblDataSintetica: TppLabel
        UserName = 'lblDataSintetica'
        Caption = 'Data : 22/22/2222'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 84931
        mmTop = 13229
        mmWidth = 28575
        BandType = 0
      end
      object dbiLogoEmpresa: TppDBImage
        UserName = 'dbiLogoEmpresa'
        DirectDraw = True
        MaintainAspectRatio = True
        ShiftWithParent = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 23548
        mmLeft = 2117
        mmTop = 529
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDispConDetalhe: TppShape
        UserName = 'shpDispConDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEPLANOPATRO'
        DataPipeline = pplSintetica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SALDOANT'
        DataPipeline = pplSintetica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'RECEBIMENTOS'
        DataPipeline = pplSintetica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESEMBOLSOS'
        DataPipeline = pplSintetica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDODIA'
        DataPipeline = pplSintetica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPLANOPATRO'
      DataPipeline = pplSintetica
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object rptDispGrafico: TppReport
    AutoStop = False
    DataPipeline = pplSintetica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Gráfico da Disponibilidade Financeira Consolidada'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 610
    Top = 248
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label11'
        Caption = 'Disponibilidade Consolidada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 70379
        mmTop = 7408
        mmWidth = 58473
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
      end
      object lblGrafico: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object lblDataGrafico: TppLabel
        UserName = 'lblDataGrafico'
        Caption = 'Data : 22/22/2222'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 84931
        mmTop = 13229
        mmWidth = 28575
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'dbiLogoEmpresa2'
        DirectDraw = True
        MaintainAspectRatio = True
        ShiftWithParent = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 23548
        mmLeft = 3175
        mmTop = 529
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 220398
      mmPrintPosition = 0
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 198438
        mmLeft = 1852
        mmTop = 21431
        mmWidth = 194469
        BandType = 7
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Gradient.EndColor = 8454143
          Gradient.Visible = True
          MarginBottom = 0
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 2
          Title.AdjustFrame = False
          Title.Text.Strings = (
            'TppDPTeeChartControl')
          Title.Visible = False
          BottomAxis.Visible = False
          LeftAxis.Visible = False
          Legend.Alignment = laBottom
          Legend.TextStyle = ltsPlain
          RightAxis.AxisValuesFormat = 'R$ #,##0.00'
          RightAxis.LabelStyle = talValue
          TopAxis.Visible = False
          BevelOuter = bvNone
          Color = clWhite
          object Series2: TBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = pplSintetica
            SeriesColor = clRed
            Title = 'Disponibilidade Financeira'
            VertAxis = aRightAxis
            XLabelsSource = 'NOMEPLANOPATRO'
            BarStyle = bsRectGradient
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'SALDODIA'
          end
        end
      end
    end
  end
  object dsEmpresa: TwwDataSource
    AutoEdit = False
    DataSet = qryEmpresa
    Left = 516
    Top = 63
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP '
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 556
    Top = 63
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object pplEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'pplEmpresa'
    Left = 596
    Top = 70
    object pplEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplEmpresappField2: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplEmpresappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplEmpresappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplEmpresappField6: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object pplEmpresappField7: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
end
