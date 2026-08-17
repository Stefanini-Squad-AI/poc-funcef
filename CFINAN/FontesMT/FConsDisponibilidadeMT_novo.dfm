inherited frmConsDisponibilidadeMT_Novo: TfrmConsDisponibilidadeMT_Novo
  Left = 400
  Top = 164
  Caption = 'Consulta - Nova'
  ClientHeight = 556
  ClientWidth = 834
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 834
    Height = 517
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 832
      Height = 515
      Align = alClient
      TabOrder = 0
      object bvlSepTit: TBevel
        Left = 1
        Top = 43
        Width = 830
        Height = 3
        Align = alTop
        Shape = bsBottomLine
      end
      object PgcSaldos: TPageControl
        Left = 1
        Top = 113
        Width = 830
        Height = 401
        ActivePage = tbsAnalitica
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        OnChange = PgcSaldosChange
        object tbsSintetica: TTabSheet
          Caption = 'Disponibilidade &Consolidada    '
          object dbgSintetico: TwwDBGrid
            Left = 0
            Top = 0
            Width = 822
            Height = 373
            Hint = 'Clique com o botão direito para Fixar Colunas'
            Selected.Strings = (
              'NOMEPLANOPATRO'#9'38'#9'Plano / Patrocinadora'
              'SALDOANT'#9'17'#9'Saldo Anterior'
              'RECEBIMENTOS'#9'16'#9'Recebimentos'
              'DESEMBOLSOS'#9'15'#9'Desembolsos'
              'SALDODIA'#9'14'#9'Saldo Atual')
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
            IndicatorColor = icYellow
            OnTopRowChanged = dbgSinteticoTopRowChanged
          end
        end
        object tbsAnalitica: TTabSheet
          Caption = 'Disponibilidade &Analítica      '
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 822
            Height = 373
            Align = alClient
            TabOrder = 0
            object dbgAnalitico: TwwDBGrid
              Left = 1
              Top = 1
              Width = 820
              Height = 371
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'NOMEFORCLI'#9'58'#9'Cliente / Fornecedor'
                'NUMDOC'#9'17'#9'AP'#9'F'
                'NODOCUMENTO'#9'33'#9'Documento'
                'NOME'#9'24'#9'Centro de Responsabilidade'
                'RECEBIMENTOS'#9'16'#9'Recebimentos'
                'DESEMBOLSOS'#9'15'#9'Desembolsos'
                'SALDOANT'#9'16'#9'Saldo do Dia')
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
            Height = 338
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
              DataSource = CdsDispSintetica
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
        object tbsDepuracao: TTabSheet
          Caption = '&Depuração'
          ImageIndex = 3
          object pgcDebug: TPageControl
            Left = 0
            Top = 57
            Width = 822
            Height = 316
            ActivePage = tbsQryDebug
            Align = alClient
            TabOrder = 1
            object tbsResulDebug: TTabSheet
              Caption = 'Resultados'
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 784
                Height = 265
                Align = alClient
                DataSource = dsDebug
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
              end
            end
            object tbsQryDebug: TTabSheet
              Caption = 'Query Debug'
              ImageIndex = 1
              object memoDebug: TMemo
                Left = 0
                Top = 0
                Width = 814
                Height = 288
                Align = alClient
                Lines.Strings = (
                  'memoDebug')
                TabOrder = 0
              end
            end
          end
          object pnlDepuracao: TPanel
            Left = 0
            Top = 0
            Width = 822
            Height = 57
            Align = alTop
            TabOrder = 0
            object btnDebug: TToolbarButton97
              Left = 491
              Top = 16
              Width = 86
              Height = 24
              Caption = 'E&xecutar'
              Flat = False
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C006000000000000000000000000000000000000E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                000000000000000000000000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0000000000000008000008000008000008000008000000000000000E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE080808000800000800000800000800000800000800000800000
                8000008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE080808000FF00008000008000E3DFE0E3DFE00080
                00008000008000008000008000008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE080808000FF00008000FFFFFF
                FFFFFFFFFFFFE3DFE0008000008000008000008000008000000000E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE080808000FF0000
                8000008000FFFFFFFFFFFFFFFFFFFFFFFFE3DFE0008000008000008000008000
                008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E080808000FF00008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFE000
                8000008000008000008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE080808000FF00008000008000FFFFFFFFFFFFE3DFE0FFFF
                FFFFFFFFFFFFFFE3DFE0008000008000008000000000E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE080808000FF00008000008000FFFFFF
                FFFFFFE3DFE0008000FFFFFFFFFFFFFFFFFFE3DFE0008000008000000000E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE080808000FF0000
                8000008000FFFFFFFFFFFF008000008000008000FFFFFFFFFFFFE3DFE0008000
                008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE080808000FF00008000008000008000008000008000008000008000FF
                FFFFFFFFFF008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE080808000FF000080000080000080000080000080
                00008000008000008000008000008000000000E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE080808000FF0000FF00
                008000008000008000008000008000008000008000000000E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE080808080808000FF0000FF0000FF0000FF0000FF00808080808080E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0808080808080808080808080808080E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0}
              OnClick = btnDebugClick
            end
            object cmbTipos: TwwDBComboBox
              Left = 11
              Top = 18
              Width = 470
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              AutoDropDown = True
              ShowMatchText = True
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Qry Analítica'#9'QRYANALIT'
                'Saldo Anterior (1.0) - Saldo Geral'#9'SALDOANT_10'
                'Saldo Anterior (1.1) - Reg. Baixados <> Investimento'#9'SALDOANT_11'
                
                  'Saldo Anterior (1.2) - Reg. Baixados pelo RecbtoXPagto  < > Inve' +
                  'stimento'#9'SALDOANT_12'
                
                  'Saldo Anterior (1.3) - Reg. Baixados TRC entre Planos'#9'SALDOANT_1' +
                  '3'
                'Saldo Anterior (1.4) - Reg. Baixados de CPMF'#9'SALDOANT_14'
                
                  'Saldo Anterior (1.4.1) - Reg. CPMF não Baixados de TRC Entre Con' +
                  'tas'#9'SALDOANT_141'
                'Saldo Anterior (1.5) - Reg. Não Baixados de CPMF'#9'SALDOANT_15'
                
                  'Saldo Anterior (1.6) - Reg. Recebimentos = Investimento'#9'SALDOANT' +
                  '_16'
                
                  'Saldo Anterior (1.7) - Reg. Pagamentos = Investimento'#9'SALDOANT_1' +
                  '7'
                
                  'Saldo Anterior (1.8) - Reg. Receb/Pagto Não Baixados <> Investim' +
                  'ento'#9'SALDOANT_18'
                'Saldo Anterior (1.9) - Reg. INSS'#9'SALDOANT_19'
                
                  'Saldo Anterior (1.9.1) - Reg. INSS que Não estão em GPS'#9'SALDOANT' +
                  '_191'
                
                  'Saldo Anterior (1.10) - Reg. Pagamentos Englobados Não Baixados'#9 +
                  'SALDOANT_110'
                
                  'Saldo Anterior (1.11) - Reg. IRRF que Não Estão emDARG Gerado'#9'SA' +
                  'LDOANT_111'
                'Saldo Anterior (1.12) - Reg. Zerados Plano/Patro'#9'SALDOANT_112'
                
                  'Saldo Anterior (1.13) - Reg. Recebimentos da DocumxDocum'#9'SALDOAN' +
                  'T_113'
                
                  'Saldo Anterior (1.14) - Reg. Pagamentos da DocumxDocum'#9'SALDOANT_' +
                  '114'
                'Registro na Data (2.0) - Reg. Do Dia'#9'REGNADATA_20'
                
                  'Registro na Data (2.1) - Reg. Do Dia Baixados <> Investimento'#9'RE' +
                  'GNADATA_21'
                
                  'Registro na Data (2.2) - Reg. Do Dia Baixados Recbto/Pagto <> In' +
                  'vestimento'#9'REGNADATA_22'
                
                  'Registro na Data (2.3) - Reg. Do Dia Baixados TRC Entre Planos <' +
                  '> Investimento'#9'REGNADATA_23'
                
                  'Registro na Data (2.4) - Reg. Do Dia de Pagamentos <> CPMF e <> ' +
                  'Investimento'#9'REGNADATA_24'
                
                  'Registro na Data (2.5) - Reg. Do Dia de Pagamentos <> CPMF e = I' +
                  'nvestimento'#9'REGNADATA_25'
                
                  'Registro na Data (2.6) - Reg. Do Dia de Recebimentos e = Investi' +
                  'mento'#9'REGNADATA_26'
                
                  'Registro na Data (2.7) - Reg. Do Dia de Pagamentos Englobados e ' +
                  '<> Investimento'#9'REGNADATA_27'
                
                  'Registro na Data (2.8) - Reg. Do Dia de IRRF que Não Estão em DA' +
                  'RF'#9'REGNADATA_28'
                
                  'Registro na Data (2.9) - Reg. Do Dia de Pagamento DocumxDocum'#9'RE' +
                  'GNADATA_29'
                
                  'Registro na Data (2.10) - Reg. Do Dia de Recebimento DocumxDocum' +
                  #9'REGNADATA_210'
                'Registro na Data (3.0) - Reg. Do Dia de CPMF'#9'REGNADATA_30'
                
                  'Registro na Data (3.1) - Reg. Do Dia de CPMF Baixados'#9'REGNADATA_' +
                  '31'
                
                  'Registro na Data (3.2) - Reg. Do Dia de CPMF Não Baixados'#9'REGNAD' +
                  'ATA_32'
                
                  'Registro na Data (3.3) - Reg. CPMF não Baixados de TRC Entre Con' +
                  'tas'#9'REGNADATA_33'
                'Registro na Data (4.0) - Reg. Do Dia de INSS'#9'REGNADATA_40'
                
                  'Registro na Data (4.1) - Reg. Do Dia de INSS que Não Estão em GP' +
                  'S'#9'REGNADATA_41'
                'Registro da Data (5.0) - Bloqueios Judiciais'#9'REGNADATA_50')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
              OnChange = cmbTiposChange
            end
          end
        end
      end
      object pnlTitulo: TPanel
        Left = 1
        Top = 1
        Width = 830
        Height = 42
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lblTitulo: TfcLabel
          Left = 1
          Top = 1
          Width = 828
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
        Width = 830
        Height = 67
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object Label2: TLabel
          Left = 137
          Top = 10
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
        end
        object Label3: TLabel
          Left = 267
          Top = 10
          Width = 105
          Height = 13
          Caption = 'Situação do Plano'
        end
        object bbtnIniciar: TBitBtn
          Left = 269
          Top = 136
          Width = 89
          Height = 36
          Caption = '&Atualizar'
          Default = True
          TabOrder = 4
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
          Top = 26
          Width = 117
          Style.BorderStyle = xbs3D
          TabOrder = 1
          OnExit = edtIntervaloExit
          Alignment = taCenter
          StoredValues = 5
        end
        object Animate: TAnimate
          Left = 525
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
        object edtDataRef: TCMDateTimePicker
          Left = 7
          Top = 26
          Width = 114
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
        end
        object btnAtualiza: TBitBtn
          Left = 423
          Top = 16
          Width = 89
          Height = 36
          Caption = '&Atualizar'
          Default = True
          TabOrder = 3
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
        object cmbSitPlano: TComboBox
          Left = 267
          Top = 26
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'Ativo'
            'Inativo'
            'Ambos')
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 517
    Width = 834
    inherited tb97Fundo: TToolbar97
      Left = 502
      DockPos = 900
      inherited sep1: TToolbarSep97
        Left = 245
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 164
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 247
      end
      object bbtnImprimir: TBitBtn
        Left = 83
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
      object btnRelatorio: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Relatório'
        TabOrder = 3
        OnClick = btnRelatorioClick
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
    Left = 403
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
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
    DataSet = CdsDispSintetica
    Left = 384
    Top = 288
  end
  object dsAnalitica: TwwDataSource
    AutoEdit = False
    DataSet = CdsDispAnalitica
    Left = 384
    Top = 344
  end
  object qryAnalitica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CAST(DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NU' +
        'LL,U.NODOCUMENTO,U.NUMAPGR) AS VARCHAR2(74)) AS NUMDOC,'
      '   U.NUMAPGR,'
      '   CAST(U.NODOCUMENTO AS VARCHAR2(74)) AS NODOCUMENTO,'
      '   CAST(U.NOMEFORCLI || DECODE('
      '                          DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      
        '                          DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39 +
        ','
      
        '                          DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||' +
        #39' - '#39' ||P.NOME,'#39#39'))),'#39#39','#39#39','
      
        '                          '#39' - '#39' || DECODE(U.IDPATRO,-1,'#39'TOTAL GE' +
        'RAL'#39','
      
        '                                   DECODE(U.IDPATRO,9999999,'#39'TOT' +
        'AL GERAL'#39','
      
        '                                   DECODE(INSTR('#39'23'#39',TIPOREG),0,' +
        'PT.NOME||'#39' - '#39' ||P.NOME,'#39#39')))) AS VARCHAR2(190)) AS NOMEFORCLI,'
      '   U.SALDO,'
      '   U.CODCENTRORESPON,'
      
        '   CAST((PT.NOME||'#39' - '#39' ||P.NOME) AS VARCHAR2(113)) AS NOMEPLANO' +
        'PATRO,'
      '   CN.NOME,'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      '   0 AS SALDODIA,'
      '   U.IDPESSOA,'
      '   PT.NOME AS PLANO,'
      '   P.NOME AS PATRO'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA'
      '    FROM'
      '       ('
      
        '        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <>' +
        ' INVESTIMENTOS'
      '        -- TAG SALDOANT_11_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN <> 0)'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO  = 79)  SOL 1' +
        '79184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_11_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO ' +
        'X PAGTO E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_12_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS N' +
        'ULL))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_12_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E M' +
        'ODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_13_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC IS NULL)) OR'
      
        '            ((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DA' +
        'TAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '            ((M.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))))'
      
        '           AND (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN = 0)'
      
        '           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRAN' +
        'SF = M.CODLANCFINANC))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.IDMODULO <> 3)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                     ((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                                     ((M1.DATADISPFINANC BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))))'
      
        '                                AND (M1.DATADISPFINANC > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_13_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS'
      '        -- TAG SALDOANT_14_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS S' +
        'ALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO' +
        ', M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '        WHERE'
      
        '           (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVI' +
        'MFINANC M'
      '                                WHERE (M.IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN > TO_DA' +
        'TE(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (DATALANCFINAN < TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPES' +
        'SOA = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADO' +
        'R'
      '        -- TAG SALDOANT_14_F'
      ''
      '        UNION ALL'
      
        '        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ' +
        'ENTRE CONTAS'
      '        -- TAG SALDOANT_141_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS' +
        ' SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMEN' +
        'TO, I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 A' +
        'S TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODT' +
        'IPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '            IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '        WHERE'
      '            I.DATARETENCAO > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39')'
      '            AND I.DATARETENCAO < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FR' +
        'OM PARAMFINANC)'
      '            AND I.CODDOCUMENTO IS NULL'
      '            AND I.NUMLOTEMANUAL = 0'
      '            AND I.CODLANCFINANC IS NOT NULL'
      '            AND I.IDPESSOA = :IDPESSOA'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTA' +
        'DOR, I.IDFORCLI'
      '        -- TAG SALDOANT_141_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS'
      '        -- TAG SALDOANT_15_I'
      '        SELECT'
      
        '          '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SA' +
        'LDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,' +
        ' D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS T' +
        'IPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      '        WHERE'
      
        '           (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '           AND (D.STATUS <> '#39'2'#39')'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODO' +
        'CUMENTO,'
      
        '                 R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENT' +
        'RORESPON'
      '        -- TAG SALDOANT_15_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MOD' +
        'ULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_16_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_16_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODUL' +
        'O DE INVESTIMENTOS'
      '        -- TAG SALDOANT_17_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '--           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SAL' +
        'DO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLA' +
        'NOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.COD' +
        'TIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDO' +
        'CUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39 +
        '||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG' +
        ', DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D' +
        '.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORI' +
        'COCOMPL, R.CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE  (D.OPERACAO IN ('#39'2'#39'))'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (L.OPERACAO <> 5)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            GROUP BY D.CODDOCUMENTO) S,'
      
        '           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VALO' +
        'R * -1,LA.VALOR) AS VALOR'
      '            FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '            WHERE'
      
        '               RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORT' +
        'ADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '               AND LA.DEBCRE = '#39'D'#39
      '               AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '        WHERE  (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (NVL(L.VALOR,0) <> 0)'
      '           AND (D.OPERACAO IN ('#39'2'#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '           AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                           where dxd.iddocumento = d.coddocument' +
        'o'
      '                             and dxd.flgdispfinanc = '#39'S'#39')'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '           --AND (D.IDMODULO  <> 79) SOL 179184'
      '           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODO' +
        'CUMENTO,'
      
        '           D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODT' +
        'IPRECDES,'
      
        '           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACA' +
        'O,'
      '           D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,N' +
        'ULL,0,P.VALOR))) <> 0'
      '        -- TAG SALDOANT_18_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS'
      '        -- TAG SALDOANT_19_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (X.SALDO * -1) AS SALD' +
        'O, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, D' +
        '.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIP' +
        'OREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRE' +
        'CDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '           ('
      '            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS'
      '            -- TAG SALDOANT_191_I'
      '            SELECT DISTINCT'
      
        '               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCL' +
        'I, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DE' +
        'CODE(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D' +
        '.NUMFATURA, T.PLACONTA, D.NODOCUMENTO'
      '            FROM'
      
        '               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERAD' +
        'OR T, RATEIODOCUM R, LANCIRRF N'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
      '               AND (N.IDDOCINSS IS NULL)'
      '               AND (NVL(N.VLRINSS,0) <> 0)'
      '               AND (L.ESTORNO      IS NULL)'
      
        '               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ' +
        'ALTXIMPOSTO WHERE CODIMPOSTO = 2))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '               AND (P.IDPESSOA      = D.IDFORCLI)'
      '               AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '            -- TAG SALDOANT_191_F'
      '            ) X'
      '        WHERE'
      '           1 = :BSALDOANTINSS'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (L.NUMLANCTO = X.NUMLANCTO)'
      '        -- TAG SALDOANT_19_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS' +
        ' E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_110_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, Round(SUM(A.SALDO),2) ' +
        'AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUM' +
        'ENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1' +
        ' AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS C' +
        'ODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           (SELECT'
      '               '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)' +
        '/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39#39' AS TIPOR' +
        'EG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR' +
        '(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTO' +
        'RICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, ' +
        'D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,'
      '               SS.SALDOTOT, C.SALDOALT'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L,'
      '               (SELECT'
      
        '                   D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDOTOT'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.OPERACAO = L.OPERACAO)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.NUMFATURA) SS,'
      '               (SELECT'
      
        '                   D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDODOC'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (L.OPERACAO <> 5)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.CODDOCUMENTO) S,'
      '               (SELECT'
      
        '                   D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R' +
        '.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCE' +
        'NTRORESPON'
      '                FROM'
      '                   DOCUMENTO D, RATEIODOCUM R'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATR' +
        'O, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)) X'
      '            WHERE'
      
        '               (X.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '               AND (X.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '               AND (D.STATUS <> '#39'2'#39')'
      '               AND (D.OPERACAO IN ('#39'1'#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '               AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                               where dxd.iddocumento = d.coddocu' +
        'mento'
      '                                 and dxd.flgdispfinanc = '#39'S'#39')'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '               --AND (D.IDMODULO <> 79) SOL 179184'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.NUMFATURA = R.NUMFATURA)'
      '               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '               AND (D.NUMFATURA = SS.NUMFATURA)'
      '               AND (D.NUMFATURA = C.NUMFATURA)'
      '               AND (D.NUMFATURA = X.NUMFATURA)'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECD' +
        'ES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDO' +
        'C, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, S' +
        'S.SALDOTOT, C.SALDOALT) A,'
      '           (SELECT'
      
        '               D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L'
      '            WHERE'
      '               (D.OPERACAO IN ('#39'3'#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (L.OPERACAO=3)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '        WHERE'
      '            A.NUMFATURA=B.NUMFATURA(+)'
      '        GROUP BY'
      
        '            A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, ' +
        'A.IDPESSOA, A.CODTIPDOC,'
      
        '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.H' +
        'ISTORICOCOMPL, A.CODTIPRECDES,'
      '            A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG SALDOANT_110_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO' +
        ' DA SEMANA ANTERIOR'
      '        -- TAG SALDOANT_111_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO,' +
        ' R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSO' +
        'A, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS N' +
        'ODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS C' +
        'ODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R' +
        ','
      
        '           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOST' +
        'O=1) X,'
      '           (SELECT'
      '               L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO'
      '            FROM'
      '               LANCTODOCUM L, DOCUMENTO D'
      '            WHERE'
      
        '               (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM AL' +
        'TXIMPOSTO WHERE CODIMPOSTO=1))'
      '               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '        WHERE'
      '           (I.IDDARF IS NULL)'
      '           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.STATUS=2)'
      '           AND (1 = :BSALDOANTIRRF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '        -- TAG SALDOANT_111_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS ' +
        'SEM MOVIMENTO QUANDO HOUVER'
      '        -- TAG SALDOANT_112_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANO' +
        'PREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, (:IDPESSOA) ' +
        'AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTI' +
        'PRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '        WHERE'
      '           ((:IDPATRO IS NULL) OR (PA.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (PA.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '           AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '           AND (PA.IDPLANOPREV NOT IN (23))'
      '           AND ((:PSATIVO IS NULL) OR (PL.ATIVO = :PSATIVO))'
      ''
      '        -- TAG SALDOANT_112_F'
      ''
      '        --Bruno Bastos - 26/11/2009 - Início'
      '        UNION ALL'
      
        '        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MO' +
        'DULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_113_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM'
      '                                WHERE OPERACAO = '#39'5'#39
      
        '                                  AND CODDOCUMENTO = D.CODDOCUME' +
        'NTO)'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_113_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODU' +
        'LO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_114_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,' +
        #39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_114_F'
      '        --Bruno Bastos - 26/11/2009 - Fim'
      ''
      'UNION ALL      '
      ''
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '              SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', M' +
        'R.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '                 '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAIS'
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '             AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/Y' +
        'YYY'#39')'
      
        '             AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39 +
        ')'
      
        '             AND M.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bl' +
        'oqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      '        '
      '        UNION ALL'
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '               SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', ' +
        'MR.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '               '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAISPAI                      '
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '           AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYY' +
        'Y'#39')'
      '           AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39')'
      
        '           AND M.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desb' +
        'loqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      ''
      ''
      '       )'
      '    GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA'
      '    -- TAG SALDOANT_10_F'
      ''
      '    UNION ALL'
      ''
      '    -- (2.0) REGISTRO NA DATAREF'
      '    -- TAG REGNADATA_20_I'
      '    SELECT'
      
        '       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOME' +
        'FORCLI,'
      
        '       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIG' +
        'N(U.SALDO),1,U.SALDO,0)))  AS SALDO,'
      '       U.NODOCUMENTO, U.NUMAPGR, U.IDPLANOPREV, U.IDPATRO,'
      
        '       --DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON' +
        ', U.IDPESSOA --SOL 179184'
      
        '       DECODE(U.IDMODULO,79,2,740,2,3) AS TIPOREG, U.CODCENTRORE' +
        'SPON, U.IDPESSOA'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDMODULO <> 3)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN <> 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      '                              WHERE'
      
        '                                 (((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                  ((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC = TO_DATE(:DATAREF' +
        ','#39'DD/MM/YYYY'#39'))) OR'
      
        '                                  ((M1.DATADISPFINANC = TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39'))))'
      
        '                                 --AND (D1.IDMODULO = 79) SOL 17' +
        '9184'
      '                                 AND (D1.IDMODULO in (79,740))'
      '                                 AND (M1.IDMODULO <> 3)'
      
        '                                 AND ((M1.CODLANCTRANSF IS NULL)' +
        ' OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      ''
      '         -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      ''
      
        '            R.IDRATEIOFINANC -- thiago melo SOL 227356 PPM 34063' +
        '6'
      '            '
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (R.RECPAG = '#39'R'#39')'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '            '
      '            -- thiago melo SOL 227356 PPM 340636'
      '            )'
      '            -- thiago melo SOL 227356 PPM 340636'
      ''
      '        -- TAG REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO DE RECEBIMENTO BAIXADOS NA DATAREF <>' +
        ' DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      ''
      '        -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      ''
      
        '            R.IDRATEIOFINANC -- thiago melo SOL 227356 PPM 34063' +
        '6'
      '            '
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      ''
      '            -- thiago melo SOL 227356 PPM 340636'
      '            )'
      '            -- thiago melo SOL 227356 PPM 340636'
      ''
      '        -- TAG REGNADATA_23_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NA DATAREF <> DE CPMF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '--           '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(' +
        'DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPA' +
        'TRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMO' +
        'DULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO' +
        '_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUME' +
        'NTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCEN' +
        'TRORESPON, R.RECPAG'
      '           '#39#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39' '#39' AS TIPOREG,' +
        ' DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.' +
        'NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORIC' +
        'OCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.CODDOCUMENTO) S,'
      
        '            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VAL' +
        'OR * -1,LA.VALOR) AS VALOR'
      '             FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '             WHERE'
      
        '                RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM POR' +
        'TADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                AND LA.DEBCRE = '#39'D'#39
      '                AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '         WHERE  (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2'#39'))'
      '            AND (L.OPERACAO <> 5)'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '            AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                            where dxd.iddocumento = d.coddocumen' +
        'to'
      '                              and dxd.flgdispfinanc = '#39'S'#39')'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            --AND (D.IDMODULO  <> 79) SOL 179184'
      '            AND (D.IDMODULO NOT IN (79,740))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      
        '         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,' +
        'NULL,0,P.VALOR))) <> 0'
      '         -- TAG REGNADATA_24_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = I' +
        'NVESTIMENTOS E <> DE CPMF'
      '         -- TAG REGNADATA_25_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_25_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO =' +
        ' INVESTIMENTOS'
      '         -- TAG REGNADATA_26_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS ENGLOBADOS NA DATAREF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, Round(SUM(A.SALDO),2) AS SALDO, A.IDP' +
        'LANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, ' +
        'A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      '                '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SA' +
        'LDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '#39' '#39' AS TIP' +
        'OREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CH' +
        'AR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,  L.HI' +
        'STORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUM' +
        'FATURA,'
      '                SS.SALDOTOT, C.SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L,'
      '                (SELECT'
      
        '                    D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1)) AS SALDOTOT'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.NUMFATURA) SS,'
      '                (SELECT'
      
        '                    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      
        '                    AND NOT Exists (Select 1 From DocumxDocum dx' +
        'd'
      
        '                                    where dxd.iddocumento = d.co' +
        'ddocumento'
      
        '                                      and dxd.flgdispfinanc = '#39'S' +
        #39')'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE  (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      
        '             WHERE  (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                --AND (D.IDMODULO <> 79) SOL 179184'
      '                AND (D.IDMODULO NOT in (79,740))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.NUMFATURA = C.NUMFATURA(+))'
      '                AND (D.NUMFATURA = X.NUMFATURA)'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPREC' +
        'DES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPD' +
        'OC, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, ' +
        'SS.SALDOTOT, C.SALDOALT) A,'
      '            (SELECT'
      
        '                D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '                AND (L.OPERACAO=3)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '         WHERE'
      '             A.NUMFATURA=B.NUMFATURA(+)'
      '         GROUP BY'
      
        '             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI,' +
        ' A.IDPESSOA, A.CODTIPDOC,'
      
        '             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES,'
      '             A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG REGNADATA_27_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM D' +
        'ARF GERADO'
      '         -- TAG REGNADATA_28_I'
      '         SELECT'
      '            DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV' +
        ', R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC' +
        ', D.IDMODULO, 0 AS NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUME' +
        'NTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.' +
        'COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDE' +
        'S, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      
        '            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM ' +
        'R,'
      
        '            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOS' +
        'TO=1) X,'
      '            (SELECT'
      
        '                L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCT' +
        'O'
      '             FROM'
      '                LANCTODOCUM L, DOCUMENTO D'
      '             WHERE'
      
        '                (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/M' +
        'M/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM A' +
        'LTXIMPOSTO WHERE CODIMPOSTO=1))'
      '                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '         WHERE'
      '            (I.IDDARF IS NULL)'
      '            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.STATUS=2)'
      ''
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
      ''
      '        --bruno bastos - 26/11/2009 - início'
      '        UNION ALL'
      '        ('
      
        '         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PAR' +
        'A DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_29_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                documxdocum dxd,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                --bruno bastos - 26/11/2009'
      '                and (dxd.iddocumento   = d.coddocumento)'
      '                and (dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Exists (Select 1 From lanctoDocum lctdoc'
      
        '                            where lctdoc.coddocumento = dxd.iddo' +
        'cumentopai'
      '                              and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO = 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO IN ('#39'5'#39')'
      '         -- TAG REGNADATA_29_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCU' +
        'MENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_210_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                 --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Not Exists (Select 1 From lanctoDocum lctdoc'
      
        '                                where lctdoc.coddocumento = dxd.' +
        'iddocumentopai'
      '                                  and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_210_F'
      '        )'
      '        --bruno bastos - 26/11/2009 - fim'
      ''
      '       ) U'
      '    WHERE'
      '       ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '       AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOP' +
        'REV))'
      '       AND (U.IDFORCLI = P.IDPESSOA(+))'
      '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '       AND (U.IDPESSOA = T.IDPESSOA(+))'
      '       AND (U.RECPAG = T.RECPAG(+))'
      '       AND (U.IDMODULO = M.IDMODULO(+))'
      '       AND ((:PSATIVO IS NULL) OR (PP.ATIVO = :PSATIVO)) '
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL),'
      
        '       U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.' +
        'NUMAPGR,U.IDPESSOA'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA'
      '    FROM'
      '       PESSOA P,'
      '       (SELECT'
      
        '           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, X.IDPLANOPREV' +
        ', X.IDPATRO, X.IDPESSOA'
      '        FROM'
      '           ('
      '            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF'
      '            -- TAG REGNADATA_31_I'
      '            SELECT'
      
        '               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODO' +
        'CUMENTO, R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA, '#39' '#39' AS CODCENTROR' +
        'ESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '            WHERE'
      
        '               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM M' +
        'OVIMFINANC M'
      '                                   WHERE (IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN = TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC=(SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSO' +
        'A = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPOR' +
        'TADOR,PO.IDBANCO'
      '            -- TAG REGNADATA_31_F'
      ''
      '            UNION ALL'
      ''
      '            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS'
      '            -- TAG REGNADATA_32_I'
      '            SELECT'
      
        '               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NU' +
        'LL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLD' +
        'OCUMENTO)) AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA,' +
        ' R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.I' +
        'DPESSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      ''
      '            WHERE'
      
        '               (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '               AND (D.STATUS <> '#39'2'#39')'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO,'
      
        '                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.COD' +
        'CENTRORESPON'
      '            -- TAG REGNADATA_32_F'
      ''
      '            UNION ALL'
      
        '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS D' +
        'E TRANSF ENTRE CONTAS'
      '            -- TAG REGNADATA_33_I'
      '            SELECT'
      
        '               I.IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODOCUMENTO, R.I' +
        'DPLANOPREV, R.IDPATRO, I.IDPESSOA, '#39' '#39' AS CODCENTRORESPON, SUM(R' +
        '.VLRCPMF) AS SALDO'
      '            FROM'
      '                IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '            WHERE'
      '                I.DATARETENCAO=TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGRE' +
        'G FROM PARAMFINANC)'
      '                AND I.CODDOCUMENTO IS NULL'
      '                AND I.NUMLOTEMANUAL = 0'
      '                AND I.CODLANCFINANC IS NOT NULL'
      '                AND I.IDPESSOA = :IDPESSOA'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODP' +
        'ORTADOR, I.IDFORCLI'
      '            -- TAG REGNADATA_33_F'
      '       ) X'
      '    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA )XX'
      '    WHERE'
      '       (XX.IDFORCLI = P.IDPESSOA(+))'
      '    -- TAG REGNADATA_30_F'
      ''
      '    UNION ALL'
      ''
      '     -- (4.0) REGISTROS DE INSS'
      '     -- TAG REGNADATA_40_I'
      '     SELECT'
      '        DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI,'
      '        X.SALDO * -1,'
      
        '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_' +
        'CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '        0 AS NUMAPGR,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        3 AS TIPOREG,'
      '        R.CODCENTRORESPON,'
      '        D.IDPESSOA'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS'
      '         -- TAG REGNADATA_41_I'
      '         SELECT DISTINCT'
      
        '            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, ' +
        'P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECOD' +
        'E(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NU' +
        'MFATURA, T.PLACONTA, D.NODOCUMENTO'
      '         FROM'
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R, LANCIRRF N'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (N.IDDOCINSS IS NULL)'
      '            AND (NVL(N.VLRINSS,0) <> 0)'
      '            AND (L.ESTORNO IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO  = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_41_F'
      '         ) X'
      '     WHERE'
      
        '        (TO_DATE(:DATAINSS,'#39'DD/MM/YYYY'#39') = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '        AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '        AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPLANO' +
        'PREV))'
      '        AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (L.NUMLANCTO = X.NUMLANCTO)'
      '     -- TAG REGNADATA_40_F'
      '    UNION ALL'
      ''
      '    -- (5.0) BLOQUEIOS JUDICIAS_I'
      '      -- TAG REGNADATA_50_I'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          1 IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'S)'
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bloque' +
        'io'
      '        UNION ALL        -- Paulo Nobre - SOL 207968'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          1 IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'SPAI)     '
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desblo' +
        'queio'
      '      -- TAG REGNADATA_50_F'
      ''
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      '   AND ((:PSATIVO IS NULL) OR (PT.ATIVO = :PSATIVO))'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end>
    object qryAnaliticaNODOCUMENTO: TStringField
      FieldName = 'NODOCUMENTO'
      Size = 74
    end
    object qryAnaliticaNOMEFORCLI: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 190
    end
    object qryAnaliticaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryAnaliticaCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryAnaliticaNOMEPLANOPATRO: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryAnaliticaNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object qryAnaliticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object qryAnaliticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryAnaliticaTIPOREG: TFloatField
      FieldName = 'TIPOREG'
    end
    object qryAnaliticaSALDOANT: TFloatField
      FieldName = 'SALDOANT'
    end
    object qryAnaliticaRECEBIMENTOS: TFloatField
      FieldName = 'RECEBIMENTOS'
    end
    object qryAnaliticaDESEMBOLSOS: TFloatField
      FieldName = 'DESEMBOLSOS'
    end
    object qryAnaliticaSALDODIA: TFloatField
      FieldName = 'SALDODIA'
    end
    object qryAnaliticaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryAnaliticaPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryAnaliticaPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryAnaliticaNUMDOC: TStringField
      FieldName = 'NUMDOC'
      Size = 74
    end
    object qryAnaliticaNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
  end
  object CdsParamFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParamFinanc'
    Left = 104
    Top = 184
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
      'SELECT *'
      'FROM PARAMFINANC')
    ValidateWithMask = True
    Left = 187
    Top = 181
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PARAMFINANC')
    Left = 362
    Top = 184
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
      DisplayWidth = 38
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object CdsDispSinteticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 17
      FieldName = 'SALDOANT'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsDispSinteticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 16
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsDispSinteticaDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 15
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsDispSinteticaSALDODIA: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 14
      FieldName = 'SALDODIA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsDispSinteticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object CdsDispSinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
  end
  object CdsDispAnalitica: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'NODOCUMENTO'
        DataType = ftString
        Size = 74
      end
      item
        Name = 'NOMEFORCLI'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTRORESPON'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEPLANOPATRO'
        DataType = ftString
        Size = 113
      end
      item
        Name = 'NOME'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDPLANO'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOREG'
        DataType = ftFloat
      end
      item
        Name = 'SALDOANT'
        DataType = ftFloat
      end
      item
        Name = 'RECEBIMENTOS'
        DataType = ftFloat
      end
      item
        Name = 'DESEMBOLSOS'
        DataType = ftFloat
      end
      item
        Name = 'SALDODIA'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'PLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMDOC'
        DataType = ftString
        Size = 74
      end
      item
        Name = 'NUMAPGR'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsDispAnaliticaIndex1'
      end>
    IndexFieldNames = 'IDPLANO;IDPATRO;TIPOREG'
    Params = <>
    ProviderName = 'dspDispAnalitica'
    StoreDefs = True
    Left = 104
    Top = 341
    object CdsDispAnaliticaNOMEFORCLI: TStringField
      DisplayLabel = 'Cliente / Fornecedor'
      DisplayWidth = 58
      FieldName = 'NOMEFORCLI'
      Size = 190
    end
    object CdsDispAnaliticaNUMDOC: TStringField
      DisplayLabel = 'AP'
      DisplayWidth = 17
      FieldName = 'NUMDOC'
      Size = 74
    end
    object CdsDispAnaliticaNODOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 33
      FieldName = 'NODOCUMENTO'
      Size = 74
    end
    object CdsDispAnaliticaNOME: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 24
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object CdsDispAnaliticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 16
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object CdsDispAnaliticaDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 15
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object CdsDispAnaliticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 16
      FieldName = 'SALDOANT'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object CdsDispAnaliticaCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 22
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object CdsDispAnaliticaNOMEPLANOPATRO: TStringField
      DisplayWidth = 113
      FieldName = 'NOMEPLANOPATRO'
      Visible = False
      Size = 113
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
    object CdsDispAnaliticaTIPOREG: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOREG'
      Visible = False
    end
    object CdsDispAnaliticaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsDispAnaliticaPLANO: TStringField
      DisplayWidth = 50
      FieldName = 'PLANO'
      Visible = False
      Size = 50
    end
    object CdsDispAnaliticaPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
    object CdsDispAnaliticaSALDO: TFloatField
      FieldName = 'SALDO'
      Visible = False
    end
    object CdsDispAnaliticaNUMAPGR: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMAPGR'
      Visible = False
    end
  end
  object dspDispAnalitica: TDataSetProvider
    DataSet = qryAnalitica
    Constraints = True
    Left = 219
    Top = 345
  end
  object dspDispSintetica: TDataSetProvider
    DataSet = qrySintetica
    Constraints = True
    Left = 219
    Top = 289
  end
  object qrySintetica: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '--'
      '   UU.IDPATRO,'
      '   UU.IDPLANO,'
      '   UU.NOMEPLANOPATRO,'
      '   NVL(SUM(UU.SALDOANT),0) AS SALDOANT,'
      '   NVL(SUM(UU.RECEBIMENTOS),0) AS RECEBIMENTOS,'
      '   NVL(SUM(UU.DESEMBOLSOS),0) AS DESEMBOLSOS,'
      
        '   NVL((SUM(UU.SALDOANT) + SUM(UU.RECEBIMENTOS) + SUM(UU.DESEMBO' +
        'LSOS)),0) AS SALDODIA'
      'FROM'
      '   ('
      '-- (1) INICIO DA QRYANALITICA'
      '-- TAG QRYANALIT_I'
      'SELECT'
      
        '   DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.' +
        'NODOCUMENTO,U.NUMAPGR) AS NUMDOC,'
      '   U.NUMAPGR,'
      '   U.NODOCUMENTO AS NODOCUMENTO,'
      '   U.NOMEFORCLI || DECODE('
      '                          DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      
        '                          DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39 +
        ','
      
        '                          DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||' +
        #39' - '#39' ||P.NOME,'#39#39'))),'#39#39','#39#39','
      
        '                          '#39' - '#39' || DECODE(U.IDPATRO,-1,'#39'TOTAL GE' +
        'RAL'#39','
      
        '                                   DECODE(U.IDPATRO,9999999,'#39'TOT' +
        'AL GERAL'#39','
      
        '                                   DECODE(INSTR('#39'23'#39',TIPOREG),0,' +
        'PT.NOME||'#39' - '#39' ||P.NOME,'#39#39')))) AS NOMEFORCLI,'
      '   U.SALDO,'
      '   U.CODCENTRORESPON,'
      '   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      '   CN.NOME,'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      '   0 AS SALDODIA,'
      '   U.IDPESSOA,'
      '   PT.NOME AS PLANO,'
      '   P.NOME AS PATRO'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA'
      '    FROM'
      '       ('
      
        '        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <>' +
        ' INVESTIMENTOS'
      '        -- TAG SALDOANT_11_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN <> 0)'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_11_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO ' +
        'X PAGTO E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_12_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS N' +
        'ULL))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_12_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E M' +
        'ODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_13_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC IS NULL)) OR'
      
        '            ((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DA' +
        'TAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '            ((M.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))))'
      
        '           AND (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN = 0)'
      
        '           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRAN' +
        'SF = M.CODLANCFINANC))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.IDMODULO <> 3)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                     ((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                                     ((M1.DATADISPFINANC BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))))'
      
        '                                AND (M1.DATADISPFINANC > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_13_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS'
      '        -- TAG SALDOANT_14_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS S' +
        'ALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO' +
        ', M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '        WHERE'
      
        '           (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVI' +
        'MFINANC M'
      '                                WHERE (M.IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN > TO_DA' +
        'TE(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (DATALANCFINAN < TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPES' +
        'SOA = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADO' +
        'R'
      '        -- TAG SALDOANT_14_F'
      ''
      '        UNION ALL'
      
        '        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ' +
        'ENTRE CONTAS'
      '        -- TAG SALDOANT_141_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS' +
        ' SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMEN' +
        'TO, I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 A' +
        'S TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODT' +
        'IPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '            IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '        WHERE'
      '            I.DATARETENCAO > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39')'
      '            AND I.DATARETENCAO < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FR' +
        'OM PARAMFINANC)'
      '            AND I.CODDOCUMENTO IS NULL'
      '            AND I.NUMLOTEMANUAL = 0'
      '            AND I.CODLANCFINANC IS NOT NULL'
      '            AND I.IDPESSOA = :IDPESSOA'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTA' +
        'DOR, I.IDFORCLI'
      '        -- TAG SALDOANT_141_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS'
      '        -- TAG SALDOANT_15_I'
      '        SELECT'
      
        '          '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SA' +
        'LDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,' +
        ' D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS T' +
        'IPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      '        WHERE'
      
        '           (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '           AND (D.STATUS <> '#39'2'#39')'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODO' +
        'CUMENTO,'
      
        '                 R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENT' +
        'RORESPON'
      '        -- TAG SALDOANT_15_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MOD' +
        'ULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_16_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_16_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODUL' +
        'O DE INVESTIMENTOS'
      '        -- TAG SALDOANT_17_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '--           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SAL' +
        'DO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLA' +
        'NOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.COD' +
        'TIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDO' +
        'CUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39 +
        '||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG' +
        ', DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D' +
        '.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORI' +
        'COCOMPL, R.CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.OPERACAO IN ('#39'2'#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (L.OPERACAO <> 5)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            GROUP BY D.CODDOCUMENTO) S,'
      
        '           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VALO' +
        'R * -1,LA.VALOR) AS VALOR'
      '            FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '            WHERE'
      
        '               RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORT' +
        'ADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '               AND LA.DEBCRE = '#39'D'#39
      '               AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '        WHERE'
      ''
      
        '           (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (NVL(L.VALOR,0) <> 0)'
      '           AND (D.OPERACAO IN ('#39'2'#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '           AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                           where dxd.iddocumento = d.coddocument' +
        'o'
      '                             and dxd.flgdispfinanc = '#39'S'#39')'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '           --AND (D.IDMODULO  <> 79) SOL 179184'
      '           AND (D.IDMODULO NOT in (79,740))'
      '           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODO' +
        'CUMENTO,'
      
        '           D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODT' +
        'IPRECDES,'
      
        '           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACA' +
        'O,'
      '           D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,N' +
        'ULL,0,P.VALOR))) <> 0'
      '        -- TAG SALDOANT_18_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS'
      '        -- TAG SALDOANT_19_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (X.SALDO * -1) AS SALD' +
        'O, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, D' +
        '.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIP' +
        'OREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRE' +
        'CDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '           ('
      '            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS'
      '            -- TAG SALDOANT_191_I'
      '            SELECT DISTINCT'
      
        '               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCL' +
        'I, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DE' +
        'CODE(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D' +
        '.NUMFATURA, T.PLACONTA, D.NODOCUMENTO'
      '            FROM'
      
        '               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERAD' +
        'OR T, RATEIODOCUM R, LANCIRRF N'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
      '               AND (N.IDDOCINSS IS NULL)'
      '               AND (NVL(N.VLRINSS,0) <> 0)'
      '               AND (L.ESTORNO      IS NULL)'
      
        '               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ' +
        'ALTXIMPOSTO WHERE CODIMPOSTO = 2))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '               AND (P.IDPESSOA      = D.IDFORCLI)'
      '               AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '            -- TAG SALDOANT_191_F'
      '            ) X'
      '        WHERE'
      '           1 = :BSALDOANTINSS'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (L.NUMLANCTO = X.NUMLANCTO)'
      '        -- TAG SALDOANT_19_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS' +
        ' E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_110_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, Round(SUM(A.SALDO),2) ' +
        'AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUM' +
        'ENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1' +
        ' AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS C' +
        'ODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           (SELECT'
      '               '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)' +
        '/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39#39' AS TIPOR' +
        'EG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR' +
        '(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTO' +
        'RICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, ' +
        'D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,'
      '               SS.SALDOTOT, C.SALDOALT'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L,'
      '               (SELECT'
      
        '                   D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDOTOT'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.OPERACAO = L.OPERACAO)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.NUMFATURA) SS,'
      '               (SELECT'
      
        '                   D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDODOC'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (L.OPERACAO <> 5)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.CODDOCUMENTO) S,'
      '               (SELECT'
      
        '                   D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R' +
        '.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCE' +
        'NTRORESPON'
      '                FROM'
      '                   DOCUMENTO D, RATEIODOCUM R'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATR' +
        'O, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)) X'
      '            WHERE'
      
        '               (X.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '               AND (X.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '               AND (D.STATUS <> '#39'2'#39')'
      '               AND (D.OPERACAO IN ('#39'1'#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '               AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                               where dxd.iddocumento = d.coddocu' +
        'mento'
      '                                 and dxd.flgdispfinanc = '#39'S'#39')'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '               --AND (D.IDMODULO <> 79) SOL 179184'
      '               AND (D.IDMODULO NOT in (79,740))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.NUMFATURA = R.NUMFATURA)'
      '               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '               AND (D.NUMFATURA = SS.NUMFATURA)'
      '               AND (D.NUMFATURA = C.NUMFATURA)'
      '               AND (D.NUMFATURA = X.NUMFATURA)'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECD' +
        'ES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDO' +
        'C, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, S' +
        'S.SALDOTOT, C.SALDOALT) A,'
      '           (SELECT'
      
        '               D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L'
      '            WHERE'
      '               (D.OPERACAO IN ('#39'3'#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (L.OPERACAO=3)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '        WHERE'
      '            A.NUMFATURA=B.NUMFATURA(+)'
      '        GROUP BY'
      
        '            A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, ' +
        'A.IDPESSOA, A.CODTIPDOC,'
      
        '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.H' +
        'ISTORICOCOMPL, A.CODTIPRECDES,'
      '            A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG SALDOANT_110_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO' +
        ' DA SEMANA ANTERIOR'
      '        -- TAG SALDOANT_111_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO,' +
        ' R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSO' +
        'A, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS N' +
        'ODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS C' +
        'ODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R' +
        ','
      
        '           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOST' +
        'O=1) X,'
      '           (SELECT'
      '               L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO'
      '            FROM'
      '               LANCTODOCUM L, DOCUMENTO D'
      '            WHERE'
      
        '               (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM AL' +
        'TXIMPOSTO WHERE CODIMPOSTO=1))'
      '               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '        WHERE'
      '           (I.IDDARF IS NULL)'
      '           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.STATUS=2)'
      '           AND (1 = :BSALDOANTIRRF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '        -- TAG SALDOANT_111_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS ' +
        'SEM MOVIMENTO QUANDO HOUVER'
      '        -- TAG SALDOANT_112_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANO' +
        'PREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, (:IDPESSOA) ' +
        'AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTI' +
        'PRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '        WHERE'
      '           ((:IDPATRO IS NULL) OR (PA.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (PA.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '           AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '           AND (PA.IDPLANOPREV NOT IN (23))'
      '           AND ((:PSATIVO IS NULL) OR (PL.ATIVO = :PSATIVO))'
      ''
      '        -- TAG SALDOANT_112_F'
      ''
      ''
      '        --Bruno Bastos - 26/11/2009 - Início'
      '        UNION ALL'
      
        '        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MO' +
        'DULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_113_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                 --bruno bastos - 26/11/2009'
      '                 DOCUMXDOCUM DXD'
      
        '             WHERE (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM'
      '                                WHERE OPERACAO = '#39'5'#39
      
        '                                  AND CODDOCUMENTO = D.CODDOCUME' +
        'NTO)'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_113_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODU' +
        'LO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_114_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,' +
        #39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                 --bruno bastos - 26/11/2009'
      '                 DOCUMXDOCUM DXD'
      
        '             WHERE (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                -- bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_114_F'
      '        --Bruno Bastos - 26/11/2009 - Fim'
      ''
      'UNION ALL'
      ''
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '              SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', M' +
        'R.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '                 '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAIS'
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '             AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/Y' +
        'YYY'#39')'
      
        '             AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39 +
        ')'
      
        '             AND M.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bl' +
        'oqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      '        '
      '        UNION ALL'
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '               SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', ' +
        'MR.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '               '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAISPAI                      '
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '           AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYY' +
        'Y'#39')'
      '           AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39')'
      
        '           AND M.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desb' +
        'loqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      ''
      '       )'
      '    GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA'
      '    -- TAG SALDOANT_10_F'
      ''
      '    UNION ALL'
      ''
      '    -- (2.0) REGISTRO NA DATAREF'
      '    -- TAG REGNADATA_20_I'
      '    SELECT'
      
        '       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOME' +
        'FORCLI,'
      
        '       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIG' +
        'N(U.SALDO),1,U.SALDO,0)))  AS SALDO,'
      '       U.NODOCUMENTO, U.NUMAPGR, U.IDPLANOPREV, U.IDPATRO,'
      
        '       --DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON' +
        ', U.IDPESSOA --SOL 179184'
      
        '       DECODE(U.IDMODULO,79,2,740,2,3) AS TIPOREG, U.CODCENTRORE' +
        'SPON, U.IDPESSOA'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS'
      '         -- TAG REGNADATA_21_I'
      ''
      '        -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      '            R.IDRATEIOFINANC-- thiago melo SOL 227356 PPM 340636'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDMODULO <> 3)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN <> 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      '                              WHERE'
      
        '                                 (((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                  ((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC = TO_DATE(:DATAREF' +
        ','#39'DD/MM/YYYY'#39'))) OR'
      
        '                                  ((M1.DATADISPFINANC = TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39'))))'
      
        '                                 --AND (D1.IDMODULO = 79) SOL 17' +
        '9184'
      '                                 AND (D1.IDMODULO in (79,740))'
      '                                 AND (M1.IDMODULO <> 3)'
      
        '                                 AND ((M1.CODLANCTRANSF IS NULL)' +
        ' OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_21_F'
      ''
      '        -- thiago melo SOL 227356 PPM 340636'
      '        )'
      '        -- thiago melo SOL 227356 PPM 340636'
      ''
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      ''
      '        -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      ''
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      '            R.IDRATEIOFINANC-- thiago melo SOL 227356 PPM 340636'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (R.RECPAG = '#39'R'#39')'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '        -- TAG REGNADATA_22_F'
      ''
      '          -- thiago melo SOL 227356 PPM 340636'
      '          )'
      '          -- thiago melo SOL 227356 PPM 340636'
      ''
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO DE RECEBIMENTO BAIXADOS NA DATAREF <>' +
        ' DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '        -- TAG REGNADATA_23_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NA DATAREF <> DE CPMF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '--            '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-' +
        '(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDP' +
        'ATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDM' +
        'ODULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,T' +
        'O_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUM' +
        'ENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCE' +
        'NTRORESPON, R.RECPAG'
      '           '#39#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39' '#39' AS TIPOREG,' +
        ' DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.' +
        'NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORIC' +
        'OCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.CODDOCUMENTO) S,'
      
        '            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VAL' +
        'OR * -1,LA.VALOR) AS VALOR'
      '             FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '             WHERE'
      
        '                RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM POR' +
        'TADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                AND LA.DEBCRE = '#39'D'#39
      '                AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '         WHERE'
      '            (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2'#39'))'
      '            AND (L.OPERACAO <> 5)'
      
        '            AND (D.STATUS <> 2)                 -- SOL 124845-15' +
        '184'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '            AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                            where dxd.iddocumento = d.coddocumen' +
        'to'
      '                              and dxd.flgdispfinanc = '#39'S'#39')'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            --AND (D.IDMODULO  <> 79) SOL 179184'
      '            AND (D.IDMODULO NOT IN (79,740))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      
        '         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,' +
        'NULL,0,P.VALOR))) <> 0'
      ''
      ' -- SOL 124845-15184 {inicio}'
      '         UNION ALL        '
      '              '
      '         SELECT '
      '           '#39#39' AS NOMEFORCLI,'
      '           -SUM(F.VALOR) AS SALDO,'
      '           F.IDPLANOPREV, '
      '           F.IDPATRO, '
      '           0 as IDFORCLI , '
      '           0 as CODDOCUMENTO, '
      '           M.IDPESSOA, '
      '           0 AS CODTIPDOC, '
      '           M.IDMODULO, '
      '           0 AS NUMAPGR, '
      '           '#39' '#39' AS TIPOREG, '
      '           '#39' '#39' AS NODOCUMENTO, '
      '           '#39' '#39' AS HISTORICOCOMPL, '
      '           '#39' '#39' as CODTIPRECDES,'
      '           '#39' '#39' AS CODCENTRORESPON, '
      '           '#39'P'#39' RECPAG'
      '         FROM '
      '           MOVIMFINANC M,'
      
        '           (SELECT RA.VALOR, RA.IDPLANOPREV, RA.IDPATRO, CODLANC' +
        'FINANC'
      '              FROM RATEIOFINANC RA'
      '             WHERE RA.CODLANCFINANC in '
      '                       (SELECT DISTINCT RE.CODLANCFINANC '
      '                          FROM RECBTOPAGTO RE '
      '                         WHERE re.coddocumento in (    '
      
        '                                                 SELECT DISTINCT' +
        ' D.CODDOCUMENTO'
      
        '                                                   FROM DOCUMENT' +
        'O D, LANCTODOCUM L, RATEIODOCUM R'
      
        '                                                  WHERE R.CODDOC' +
        'UMENTO = L.CODDOCUMENTO'
      
        '                                                    AND ((:IDPAT' +
        'RO IS NULL) OR (R.IDPATRO =:IDPATRO))'
      
        '                                                    AND ((:IDPLA' +
        'NOPREV IS NULL) OR (R.IDPLANOPREV =:IDPLANOPREV))'
      
        '                                                    AND L.OPERAC' +
        'AO = D.OPERACAO'
      
        '                                                    AND L.CODDOC' +
        'UMENTO = D.CODDOCUMENTO'
      
        '                                                    AND (D.OPERA' +
        'CAO IN ('#39'2'#39'))'
      
        '                                                    AND (D.RECPA' +
        'G = '#39'P'#39')'
      
        '                                                    AND (NVL(L.V' +
        'ALOR, 0) <> 0)'
      
        '                                                    AND (L.OPERA' +
        'CAO <> 5)'
      
        '                                                    AND NOT Exis' +
        'ts (Select 1'
      
        '                                                                ' +
        '      From DocumxDocum dxd'
      
        '                                                                ' +
        '     where dxd.iddocumento = d.coddocumento'
      
        '                                                                ' +
        '      and dxd.flgdispfinanc = '#39'S'#39')'
      
        '                                                    AND (D.IDMOD' +
        'ULO NOT IN (79, 740))'
      
        '                                                    AND (D.IDPES' +
        'SOA = :IDPESSOA)'
      
        '                                                    AND D.CODTIP' +
        'DOC <> (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P'
      
        '                                                                ' +
        '         WHERE P.IDPESSOA =:IDPESSOA'
      
        '                                                                ' +
        '           AND P.RECPAG = '#39'P'#39')'
      
        '                                                    AND (D.DATAP' +
        'ROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '                      '
      '                                                  )'
      '                       ) AND RA.RECPAG = '#39'P'#39
      '           ) F'
      '         WHERE M.CODLANCFINANC = F.CODLANCFINANC'
      
        '         GROUP BY F.IDPLANOPREV, F.IDPATRO, M.IDPESSOA, M.IDMODU' +
        'LO        '
      '         -- SOL 124845-15184 {fim}'
      '         -- TAG REGNADATA_24_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = I' +
        'NVESTIMENTOS E <> DE CPMF'
      '         -- TAG REGNADATA_25_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_25_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO =' +
        ' INVESTIMENTOS'
      '         -- TAG REGNADATA_26_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO, '
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS ENGLOBADOS NA DATAREF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, Round(SUM(A.SALDO),2) AS SALDO, A.IDP' +
        'LANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, ' +
        'A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      '                '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SA' +
        'LDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '#39' '#39' AS TIP' +
        'OREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CH' +
        'AR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,  L.HI' +
        'STORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUM' +
        'FATURA,'
      '                SS.SALDOTOT, C.SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L,'
      '                (SELECT'
      
        '                    D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1)) AS SALDOTOT'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.NUMFATURA) SS,'
      '                (SELECT'
      
        '                    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      
        '                    AND NOT Exists (Select 1 From DocumxDocum dx' +
        'd'
      
        '                                    where dxd.iddocumento = d.co' +
        'ddocumento'
      
        '                                      and dxd.flgdispfinanc = '#39'S' +
        #39')'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      '             WHERE'
      
        '                (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                --AND (D.IDMODULO <> 79) SOL 179184'
      '                AND (D.IDMODULO NOT in (79,740))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.NUMFATURA = C.NUMFATURA(+))'
      '                AND (D.NUMFATURA = X.NUMFATURA)'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPREC' +
        'DES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPD' +
        'OC, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, ' +
        'SS.SALDOTOT, C.SALDOALT) A,'
      '            (SELECT'
      
        '                D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '                AND (L.OPERACAO=3)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '         WHERE'
      '             A.NUMFATURA=B.NUMFATURA(+)'
      '         GROUP BY'
      
        '             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI,' +
        ' A.IDPESSOA, A.CODTIPDOC,'
      
        '             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES,'
      '             A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG REGNADATA_27_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM D' +
        'ARF GERADO'
      '         -- TAG REGNADATA_28_I'
      '         SELECT'
      '            DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV' +
        ', R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC' +
        ', D.IDMODULO, 0 AS NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUME' +
        'NTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.' +
        'COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDE' +
        'S, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      
        '            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM ' +
        'R,'
      
        '            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOS' +
        'TO=1) X,'
      '            (SELECT'
      
        '                L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCT' +
        'O'
      '             FROM'
      '                LANCTODOCUM L, DOCUMENTO D'
      '             WHERE'
      
        '                (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/M' +
        'M/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM A' +
        'LTXIMPOSTO WHERE CODIMPOSTO=1))'
      '                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '         WHERE'
      '            (I.IDDARF IS NULL)'
      '            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.STATUS=2)'
      ''
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
      ''
      '        --bruno bastos - 26/11/2009 - início'
      '        UNION ALL'
      '        ('
      
        '         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PAR' +
        'A DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_29_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                documxdocum dxd,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                -- bruno bastos - 26/11/2009'
      '                and (dxd.iddocumento   = d.coddocumento)'
      '                and (dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Exists (Select 1 From lanctoDocum lctdoc'
      
        '                            where lctdoc.coddocumento = dxd.iddo' +
        'cumentopai'
      '                              and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO = 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO IN ('#39'5'#39')'
      '         -- TAG REGNADATA_29_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCU' +
        'MENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_210_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = 1)'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Not Exists (Select 1 From lanctoDocum lctdoc'
      
        '                                where lctdoc.coddocumento = dxd.' +
        'iddocumentopai'
      '                                  and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_210_F'
      '        )'
      '        --bruno bastos - 26/11/2009 - fim'
      ''
      ''
      '       ) U'
      '    WHERE'
      '       ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '       AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOP' +
        'REV))'
      '       AND (U.IDFORCLI = P.IDPESSOA(+))'
      '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '       AND (U.IDPESSOA = T.IDPESSOA(+))'
      '       AND (U.RECPAG = T.RECPAG(+))'
      '       AND (U.IDMODULO = M.IDMODULO(+))'
      '       AND ((:PSATIVO IS NULL) OR (PP.ATIVO = :PSATIVO))'
      ''
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL),'
      
        '       U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.' +
        'NUMAPGR,U.IDPESSOA'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA'
      '    FROM'
      '       PESSOA P,'
      '       (SELECT'
      
        '           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, X.IDPLANOPREV' +
        ', X.IDPATRO, X.IDPESSOA'
      '        FROM'
      '           ('
      '            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF'
      '            -- TAG REGNADATA_31_I'
      '            SELECT'
      
        '               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODO' +
        'CUMENTO, R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA, '#39' '#39' AS CODCENTROR' +
        'ESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '            WHERE'
      
        '               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM M' +
        'OVIMFINANC M'
      '                                   WHERE (IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN = TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC=(SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSO' +
        'A = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPOR' +
        'TADOR,PO.IDBANCO'
      '            -- TAG REGNADATA_31_F'
      ''
      '            UNION ALL'
      ''
      '            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS'
      '            -- TAG REGNADATA_32_I'
      '            SELECT'
      
        '               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NU' +
        'LL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLD' +
        'OCUMENTO)) AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA,' +
        ' R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.I' +
        'DPESSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      ''
      '            WHERE'
      
        '               (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '               AND (D.STATUS <> '#39'2'#39')'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO,'
      
        '                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.COD' +
        'CENTRORESPON'
      '            -- TAG REGNADATA_32_F'
      ''
      '            UNION ALL'
      
        '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS D' +
        'E TRANSF ENTRE CONTAS'
      '            -- TAG REGNADATA_33_I'
      '            SELECT'
      
        '               I.IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODOCUMENTO, R.I' +
        'DPLANOPREV, R.IDPATRO, I.IDPESSOA, '#39' '#39' AS CODCENTRORESPON, SUM(R' +
        '.VLRCPMF) AS SALDO'
      '            FROM'
      '                IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '            WHERE'
      '                I.DATARETENCAO=TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGRE' +
        'G FROM PARAMFINANC)'
      '                AND I.CODDOCUMENTO IS NULL'
      '                AND I.NUMLOTEMANUAL = 0'
      '                AND I.CODLANCFINANC IS NOT NULL'
      '                AND I.IDPESSOA = :IDPESSOA'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODP' +
        'ORTADOR, I.IDFORCLI'
      '            -- TAG REGNADATA_33_F'
      '       ) X'
      '    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA )XX'
      '    WHERE'
      '       (XX.IDFORCLI = P.IDPESSOA(+))'
      '    -- TAG REGNADATA_30_F'
      ''
      '    UNION ALL'
      ''
      '     -- (4.0) REGISTROS DE INSS'
      '     -- TAG REGNADATA_40_I'
      '     SELECT'
      '        DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI,'
      '        X.SALDO * -1,'
      
        '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_' +
        'CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '        0 AS NUMAPGR,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        3 AS TIPOREG,'
      '        R.CODCENTRORESPON,'
      '        D.IDPESSOA'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS'
      '         -- TAG REGNADATA_41_I'
      '         SELECT DISTINCT'
      
        '            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, ' +
        'P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECOD' +
        'E(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NU' +
        'MFATURA, T.PLACONTA, D.NODOCUMENTO'
      '         FROM'
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R, LANCIRRF N'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (N.IDDOCINSS IS NULL)'
      '            AND (NVL(N.VLRINSS,0) <> 0)'
      '            AND (L.ESTORNO IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO  = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_41_F'
      '         ) X'
      '     WHERE'
      
        '        (TO_DATE(:DATAINSS,'#39'DD/MM/YYYY'#39') = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '        AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '        AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPLANO' +
        'PREV))'
      '        AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (L.NUMLANCTO = X.NUMLANCTO)'
      '     -- TAG REGNADATA_40_F'
      '    UNION ALL'
      ''
      ' -- (5.0) BLOQUEIOS JUDICIAS_I'
      '      -- TAG REGNADATA_50_I'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          NULL IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'S)'
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bloque' +
        'io'
      '        UNION ALL        -- Paulo Nobre - SOL 207968'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          NULL IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'SPAI)     '
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desblo' +
        'queio'
      '      -- TAG REGNADATA_50_F'
      ''
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      '   AND ((:PSATIVO IS NULL) OR (PT.ATIVO = :PSATIVO))'
      ''
      '-- FIM DA QRYANALITICA'
      '-- TAG QRYANALIT_F'
      '   )UU'
      'GROUP BY UU.NOMEPLANOPATRO, UU.IDPATRO, UU.IDPLANO'
      'ORDER BY NOMEPLANOPATRO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end>
    object qrySinteticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qrySinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object qrySinteticaNOMEPLANOPATRO: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qrySinteticaSALDOANT: TFloatField
      FieldName = 'SALDOANT'
    end
    object qrySinteticaRECEBIMENTOS: TFloatField
      FieldName = 'RECEBIMENTOS'
    end
    object qrySinteticaDESEMBOLSOS: TFloatField
      FieldName = 'DESEMBOLSOS'
    end
    object qrySinteticaSALDODIA: TFloatField
      FieldName = 'SALDODIA'
    end
  end
  object pplSintetica: TppBDEPipeline
    DataSource = dsSintetica
    UserName = 'lSintetica'
    Left = 550
    Top = 158
    object pplSinteticappField1: TppField
      FieldAlias = 'NOMEPLANOPATRO'
      FieldName = 'NOMEPLANOPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField2: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField3: TppField
      FieldAlias = 'RECEBIMENTOS'
      FieldName = 'RECEBIMENTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField4: TppField
      FieldAlias = 'DESEMBOLSOS'
      FieldName = 'DESEMBOLSOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField5: TppField
      FieldAlias = 'SALDODIA'
      FieldName = 'SALDODIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField6: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplSinteticappField7: TppField
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object pplAnalitica: TppBDEPipeline
    DataSource = dsAnalitica
    UserName = 'lAnalitica'
    Left = 471
    Top = 155
    object pplAnaliticappField1: TppField
      FieldAlias = 'NOMEFORCLI'
      FieldName = 'NOMEFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField2: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField3: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField5: TppField
      FieldAlias = 'RECEBIMENTOS'
      FieldName = 'RECEBIMENTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField6: TppField
      FieldAlias = 'DESEMBOLSOS'
      FieldName = 'DESEMBOLSOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField7: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField8: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField9: TppField
      FieldAlias = 'NOMEPLANOPATRO'
      FieldName = 'NOMEPLANOPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField10: TppField
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField11: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField12: TppField
      FieldAlias = 'TIPOREG'
      FieldName = 'TIPOREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField13: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField14: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField15: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField16: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplAnaliticappField17: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object rptDispAnalitica: TppReport
    AutoStop = False
    DataPipeline = pplAnalitica
    OnStartPage = rptDispAnaliticaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Analítica'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 546
    Top = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnalitica'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object pplCaptionDispAnalitica: TppLabel
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
        Caption = 'AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 25135
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cliente / Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 25135
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Recebimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 200555
        mmTop = 25135
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 25135
        mmWidth = 37306
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
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233098
        mmTop = 25135
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Saldo do Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 265378
        mmTop = 25135
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label3'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 110861
        mmTop = 25135
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape4: TppShape
        OnPrint = ppShape4Print
        UserName = 'Shape4'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMAPGR'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NOMEFORCLI'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 265
        mmWidth = 90223
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'RECEBIMENTOS'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 265
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 265
        mmWidth = 45508
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'DESEMBOLSOS'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 265
        mmWidth = 30480
        BandType = 4
      end
      object dbtSaldoDoDia: TppDBText
        UserName = 'dbtSaldoDoDia'
        BlankWhenZero = True
        DataField = 'SALDOANT'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 251884
        mmTop = 265
        mmWidth = 30480
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 110861
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object lblDispAnaSistema: TppLabel
        OnPrint = lblDispAnaSistemaPrint
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
        mmTop = 1852
        mmWidth = 283634
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
        mmLeft = 257440
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object rptDispSintetica: TppReport
    AutoStop = False
    DataPipeline = pplSintetica
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Consolidada'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 658
    Top = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSintetica'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
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
        ParentWidth = True
        Pen.Width = 2
        mmHeight = 5588
        mmLeft = 0
        mmTop = 18256
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label1'
        Caption = 'Plano / Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 19315
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 82550
        mmTop = 19315
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label3'
        Caption = 'Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 19315
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label4'
        Caption = 'Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 19315
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label5'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 19315
        mmWidth = 15081
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
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
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSintetica'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 794
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetica'
        mmHeight = 3175
        mmLeft = 71173
        mmTop = 794
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetica'
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 794
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetica'
        mmHeight = 3175
        mmLeft = 134409
        mmTop = 794
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetica'
        mmHeight = 3175
        mmLeft = 165894
        mmTop = 794
        mmWidth = 30427
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = ppLabel3Print
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
        mmTop = 1588
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
        mmTop = 1588
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPLANOPATRO'
      DataPipeline = pplSintetica
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSintetica'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object rptDispGrafico: TppReport
    AutoStop = False
    DataPipeline = pplSintetica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Gráfico da Disponibilidade Financeira Consolidada'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 626
    Top = 296
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSintetica'
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
        OnPrint = ppLabel9Print
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
  object dsDebug: TwwDataSource
    AutoEdit = False
    DataSet = qryDebug
    Left = 384
    Top = 400
  end
  object qryDebug: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.' +
        'NODOCUMENTO,U.NUMAPGR) AS NUMDOC,'
      '   U.NUMAPGR,'
      '   U.NODOCUMENTO AS NODOCUMENTO,'
      '   U.NOMEFORCLI || DECODE('
      '                          DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      
        '                          DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39 +
        ','
      
        '                          DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||' +
        #39' - '#39' ||P.NOME,'#39#39'))),'#39#39','#39#39','
      
        '                          '#39' - '#39' || DECODE(U.IDPATRO,-1,'#39'TOTAL GE' +
        'RAL'#39','
      
        '                                   DECODE(U.IDPATRO,9999999,'#39'TOT' +
        'AL GERAL'#39','
      
        '                                   DECODE(INSTR('#39'23'#39',TIPOREG),0,' +
        'PT.NOME||'#39' - '#39' ||P.NOME,'#39#39')))) AS NOMEFORCLI,'
      '   U.SALDO,'
      '   U.CODCENTRORESPON,'
      '   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      '   CN.NOME,'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      '   0 AS SALDODIA,'
      '   U.IDPESSOA,'
      '   PT.NOME AS PLANO,'
      '   P.NOME AS PATRO'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA'
      '    FROM'
      '       ('
      
        '        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <>' +
        ' INVESTIMENTOS'
      '        -- TAG SALDOANT_11_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN <> 0)'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO  = 79)  SOL 1' +
        '79184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_11_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO ' +
        'X PAGTO E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_12_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS N' +
        'ULL))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_12_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E M' +
        'ODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_13_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC IS NULL)) OR'
      
        '            ((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DA' +
        'TAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '            ((M.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))))'
      
        '           AND (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN = 0)'
      
        '           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRAN' +
        'SF = M.CODLANCFINANC))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.IDMODULO <> 3)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                     ((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                                     ((M1.DATADISPFINANC BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))))'
      
        '                                AND (M1.DATADISPFINANC > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_13_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS'
      '        -- TAG SALDOANT_14_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS S' +
        'ALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO' +
        ', M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '        WHERE'
      
        '           (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVI' +
        'MFINANC M'
      '                                WHERE (M.IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN > TO_DA' +
        'TE(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (DATALANCFINAN < TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPES' +
        'SOA = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADO' +
        'R'
      '        -- TAG SALDOANT_14_F'
      ''
      '        UNION ALL'
      
        '        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ' +
        'ENTRE CONTAS'
      '        -- TAG SALDOANT_141_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS' +
        ' SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMEN' +
        'TO, I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 A' +
        'S TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODT' +
        'IPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '            IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '        WHERE'
      '            I.DATARETENCAO > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39')'
      '            AND I.DATARETENCAO < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FR' +
        'OM PARAMFINANC)'
      '            AND I.CODDOCUMENTO IS NULL'
      '            AND I.NUMLOTEMANUAL = 0'
      '            AND I.CODLANCFINANC IS NOT NULL'
      '            AND I.IDPESSOA = :IDPESSOA'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTA' +
        'DOR, I.IDFORCLI'
      '        -- TAG SALDOANT_141_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS'
      '        -- TAG SALDOANT_15_I'
      '        SELECT'
      
        '          '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SA' +
        'LDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,' +
        ' D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS T' +
        'IPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      '        WHERE'
      
        '           (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '           AND (D.STATUS <> '#39'2'#39')'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODO' +
        'CUMENTO,'
      
        '                 R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENT' +
        'RORESPON'
      '        -- TAG SALDOANT_15_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MOD' +
        'ULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_16_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_16_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODUL' +
        'O DE INVESTIMENTOS'
      '        -- TAG SALDOANT_17_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '--           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SAL' +
        'DO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLA' +
        'NOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.COD' +
        'TIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDO' +
        'CUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39 +
        '||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG' +
        ', DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D' +
        '.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORI' +
        'COCOMPL, R.CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE  (D.OPERACAO IN ('#39'2'#39'))'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (L.OPERACAO <> 5)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            GROUP BY D.CODDOCUMENTO) S,'
      
        '           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VALO' +
        'R * -1,LA.VALOR) AS VALOR'
      '            FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '            WHERE'
      
        '               RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORT' +
        'ADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '               AND LA.DEBCRE = '#39'D'#39
      '               AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '        WHERE  (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (NVL(L.VALOR,0) <> 0)'
      '           AND (D.OPERACAO IN ('#39'2'#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '           AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                           where dxd.iddocumento = d.coddocument' +
        'o'
      '                             and dxd.flgdispfinanc = '#39'S'#39')'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '           --AND (D.IDMODULO  <> 79) SOL 179184'
      '           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODO' +
        'CUMENTO,'
      
        '           D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODT' +
        'IPRECDES,'
      
        '           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACA' +
        'O,'
      '           D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,N' +
        'ULL,0,P.VALOR))) <> 0'
      '        -- TAG SALDOANT_18_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS'
      '        -- TAG SALDOANT_19_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (X.SALDO * -1) AS SALD' +
        'O, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, D' +
        '.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIP' +
        'OREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRE' +
        'CDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '           ('
      '            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS'
      '            -- TAG SALDOANT_191_I'
      '            SELECT DISTINCT'
      
        '               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCL' +
        'I, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DE' +
        'CODE(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D' +
        '.NUMFATURA, T.PLACONTA, D.NODOCUMENTO'
      '            FROM'
      
        '               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERAD' +
        'OR T, RATEIODOCUM R, LANCIRRF N'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
      '               AND (N.IDDOCINSS IS NULL)'
      '               AND (NVL(N.VLRINSS,0) <> 0)'
      '               AND (L.ESTORNO      IS NULL)'
      
        '               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ' +
        'ALTXIMPOSTO WHERE CODIMPOSTO = 2))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '               AND (P.IDPESSOA      = D.IDFORCLI)'
      '               AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '            -- TAG SALDOANT_191_F'
      '            ) X'
      '        WHERE'
      '           1 = :BSALDOANTINSS'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (L.NUMLANCTO = X.NUMLANCTO)'
      '        -- TAG SALDOANT_19_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS' +
        ' E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_110_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, Round(SUM(A.SALDO),2) ' +
        'AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUM' +
        'ENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1' +
        ' AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS C' +
        'ODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           (SELECT'
      '               '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)' +
        '/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39#39' AS TIPOR' +
        'EG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR' +
        '(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTO' +
        'RICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, ' +
        'D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,'
      '               SS.SALDOTOT, C.SALDOALT'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L,'
      '               (SELECT'
      
        '                   D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDOTOT'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.OPERACAO = L.OPERACAO)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.NUMFATURA) SS,'
      '               (SELECT'
      
        '                   D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDODOC'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (L.OPERACAO <> 5)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.CODDOCUMENTO) S,'
      '               (SELECT'
      
        '                   D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R' +
        '.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCE' +
        'NTRORESPON'
      '                FROM'
      '                   DOCUMENTO D, RATEIODOCUM R'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATR' +
        'O, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)) X'
      '            WHERE'
      
        '               (X.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '               AND (X.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '               AND (D.STATUS <> '#39'2'#39')'
      '               AND (D.OPERACAO IN ('#39'1'#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '               AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                               where dxd.iddocumento = d.coddocu' +
        'mento'
      '                                 and dxd.flgdispfinanc = '#39'S'#39')'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '               --AND (D.IDMODULO <> 79) SOL 179184'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.NUMFATURA = R.NUMFATURA)'
      '               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '               AND (D.NUMFATURA = SS.NUMFATURA)'
      '               AND (D.NUMFATURA = C.NUMFATURA)'
      '               AND (D.NUMFATURA = X.NUMFATURA)'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECD' +
        'ES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDO' +
        'C, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, S' +
        'S.SALDOTOT, C.SALDOALT) A,'
      '           (SELECT'
      
        '               D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L'
      '            WHERE'
      '               (D.OPERACAO IN ('#39'3'#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (L.OPERACAO=3)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '        WHERE'
      '            A.NUMFATURA=B.NUMFATURA(+)'
      '        GROUP BY'
      
        '            A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, ' +
        'A.IDPESSOA, A.CODTIPDOC,'
      
        '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.H' +
        'ISTORICOCOMPL, A.CODTIPRECDES,'
      '            A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG SALDOANT_110_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO' +
        ' DA SEMANA ANTERIOR'
      '        -- TAG SALDOANT_111_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO,' +
        ' R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSO' +
        'A, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS N' +
        'ODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS C' +
        'ODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R' +
        ','
      
        '           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOST' +
        'O=1) X,'
      '           (SELECT'
      '               L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO'
      '            FROM'
      '               LANCTODOCUM L, DOCUMENTO D'
      '            WHERE'
      
        '               (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM AL' +
        'TXIMPOSTO WHERE CODIMPOSTO=1))'
      '               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '        WHERE'
      '           (I.IDDARF IS NULL)'
      '           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.STATUS=2)'
      '           AND (1 = :BSALDOANTIRRF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '        -- TAG SALDOANT_111_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS ' +
        'SEM MOVIMENTO QUANDO HOUVER'
      '        -- TAG SALDOANT_112_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANO' +
        'PREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, (:IDPESSOA) ' +
        'AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTI' +
        'PRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '        WHERE'
      '           ((:IDPATRO IS NULL) OR (PA.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (PA.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '           AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '           AND (PA.IDPLANOPREV NOT IN (23))'
      '           AND ((:PSATIVO IS NULL) OR (PL.ATIVO = :PSATIVO))'
      ''
      '        -- TAG SALDOANT_112_F'
      ''
      '        --Bruno Bastos - 26/11/2009 - Início'
      '        UNION ALL'
      
        '        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MO' +
        'DULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_113_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM'
      '                                WHERE OPERACAO = '#39'5'#39
      
        '                                  AND CODDOCUMENTO = D.CODDOCUME' +
        'NTO)'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_113_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODU' +
        'LO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_114_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,' +
        #39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_114_F'
      '        --Bruno Bastos - 26/11/2009 - Fim'
      ''
      ''
      'UNION ALL      '
      ''
      '      -- Everson'
      '      SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '             SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', M.VALORLANCTO, '#39'S'#39', M' +
        '.VALORLANCTO*-1)) SALDO,'
      '             PA.IDPLANOPREV,'
      '             PA.IDPATRO,'
      '             0 AS IDFORCLI,'
      '             0 AS CODDOCUMENTO,'
      '             1 AS IDPESSOA,'
      '             0 AS CODTIPDOC,'
      '             0 AS IDMODULO,'
      '             0 AS NUMAPGR,'
      '             1 AS TIPOREG,'
      '             '#39' '#39' AS NODOCUMENTO,'
      '             '#39' '#39' AS HISTORICOCOMPL,'
      '             '#39' '#39' AS CODTIPRECDES,'
      '             '#39' '#39' AS CODCENTRORESPON,'
      '             '#39'F'#39' AS RECPAG'
      '        FROM MOVFINBLOQJUDICIAIS M'
      
        '        JOIN PLANPREVCONTABPATRO PA ON M.IDPLANPREVCTBPATR = PA.' +
        'IDPLANPREVCTBPATR'
      '        LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '        JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLANOP' +
        'REV'
      '      WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY'#39')'
      
        '         AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39 +
        ')'
      '         AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39')'
      '      GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      ''
      '                '
      '       )'
      '    GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA'
      '    -- TAG SALDOANT_10_F'
      ''
      '    UNION ALL'
      ''
      '    -- (2.0) REGISTRO NA DATAREF'
      '    -- TAG REGNADATA_20_I'
      '    SELECT'
      
        '       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOME' +
        'FORCLI,'
      
        '       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIG' +
        'N(U.SALDO),1,U.SALDO,0)))  AS SALDO,'
      '       U.NODOCUMENTO, U.NUMAPGR, U.IDPLANOPREV, U.IDPATRO,'
      
        '       --DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON' +
        ', U.IDPESSOA --SOL 179184'
      
        '       DECODE(U.IDMODULO,79,2,740,2,3) AS TIPOREG, U.CODCENTRORE' +
        'SPON, U.IDPESSOA'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDMODULO <> 3)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN <> 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      '                              WHERE'
      
        '                                 (((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                  ((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC = TO_DATE(:DATAREF' +
        ','#39'DD/MM/YYYY'#39'))) OR'
      
        '                                  ((M1.DATADISPFINANC = TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39'))))'
      
        '                                 --AND (D1.IDMODULO = 79) SOL 17' +
        '9184'
      '                                 AND (D1.IDMODULO in (79,740))'
      '                                 AND (M1.IDMODULO <> 3)'
      
        '                                 AND ((M1.CODLANCTRANSF IS NULL)' +
        ' OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (R.RECPAG = '#39'R'#39')'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '        -- TAG REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO DE RECEBIMENTO BAIXADOS NA DATAREF <>' +
        ' DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '        -- TAG REGNADATA_23_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NA DATAREF <> DE CPMF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '--           '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(' +
        'DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPA' +
        'TRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMO' +
        'DULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO' +
        '_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUME' +
        'NTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCEN' +
        'TRORESPON, R.RECPAG'
      '           '#39#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39' '#39' AS TIPOREG,' +
        ' DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.' +
        'NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORIC' +
        'OCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.CODDOCUMENTO) S,'
      
        '            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VAL' +
        'OR * -1,LA.VALOR) AS VALOR'
      '             FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '             WHERE'
      
        '                RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM POR' +
        'TADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                AND LA.DEBCRE = '#39'D'#39
      '                AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '         WHERE  (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2'#39'))'
      '            AND (L.OPERACAO <> 5)'
      
        '            AND (D.STATUS <> 2)                 -- SOL 124845-15' +
        '184'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '            AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                            where dxd.iddocumento = d.coddocumen' +
        'to'
      '                              and dxd.flgdispfinanc = '#39'S'#39')'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            --AND (D.IDMODULO  <> 79) SOL 179184'
      '            AND (D.IDMODULO NOT IN (79,740))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      
        '         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,' +
        'NULL,0,P.VALOR))) <> 0'
      ''
      ' -- SOL 124845-15184 {inicio}'
      '         UNION ALL        '
      '              '
      '         SELECT '
      '           '#39#39' AS NOMEFORCLI,'
      '           -SUM(F.VALOR) AS SALDO,'
      '           F.IDPLANOPREV, '
      '           F.IDPATRO, '
      '           0 as IDFORCLI , '
      '           0 as CODDOCUMENTO, '
      '           M.IDPESSOA, '
      '           0 AS CODTIPDOC, '
      '           M.IDMODULO, '
      '           0 AS NUMAPGR, '
      '           '#39' '#39' AS TIPOREG, '
      '           '#39' '#39' AS NODOCUMENTO, '
      '           '#39' '#39' AS HISTORICOCOMPL, '
      '           '#39' '#39' as CODTIPRECDES,'
      '           '#39' '#39' AS CODCENTRORESPON, '
      '           '#39'P'#39' RECPAG'
      '         FROM '
      '           MOVIMFINANC M,'
      
        '           (SELECT RA.VALOR, RA.IDPLANOPREV, RA.IDPATRO, CODLANC' +
        'FINANC'
      '              FROM RATEIOFINANC RA'
      '             WHERE RA.CODLANCFINANC in '
      '                       (SELECT DISTINCT RE.CODLANCFINANC '
      '                          FROM RECBTOPAGTO RE '
      '                         WHERE re.coddocumento in (    '
      
        '                                                 SELECT DISTINCT' +
        ' D.CODDOCUMENTO'
      
        '                                                   FROM DOCUMENT' +
        'O D, LANCTODOCUM L, RATEIODOCUM R'
      
        '                                                  WHERE R.CODDOC' +
        'UMENTO = L.CODDOCUMENTO'
      
        '                                                    AND ((:IDPAT' +
        'RO IS NULL) OR (R.IDPATRO =:IDPATRO))'
      
        '                                                    AND ((:IDPLA' +
        'NOPREV IS NULL) OR (R.IDPLANOPREV =:IDPLANOPREV))'
      
        '                                                    AND L.OPERAC' +
        'AO = D.OPERACAO'
      
        '                                                    AND L.CODDOC' +
        'UMENTO = D.CODDOCUMENTO'
      
        '                                                    AND (D.OPERA' +
        'CAO IN ('#39'2'#39'))'
      
        '                                                    AND (D.RECPA' +
        'G = '#39'P'#39')'
      
        '                                                    AND (NVL(L.V' +
        'ALOR, 0) <> 0)'
      
        '                                                    AND (L.OPERA' +
        'CAO <> 5)'
      
        '                                                    AND NOT Exis' +
        'ts (Select 1'
      
        '                                                                ' +
        '      From DocumxDocum dxd'
      
        '                                                                ' +
        '     where dxd.iddocumento = d.coddocumento'
      
        '                                                                ' +
        '      and dxd.flgdispfinanc = '#39'S'#39')'
      
        '                                                    AND (D.IDMOD' +
        'ULO NOT IN (79, 740))'
      
        '                                                    AND (D.IDPES' +
        'SOA = :IDPESSOA)'
      
        '                                                    AND D.CODTIP' +
        'DOC <> (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P'
      
        '                                                                ' +
        '         WHERE P.IDPESSOA =:IDPESSOA'
      
        '                                                                ' +
        '           AND P.RECPAG = '#39'P'#39')'
      
        '                                                    AND (D.DATAP' +
        'ROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '                      '
      '                                                  )'
      '                       ) AND RA.RECPAG = '#39'P'#39
      '           ) F'
      '         WHERE M.CODLANCFINANC = F.CODLANCFINANC'
      
        '         GROUP BY F.IDPLANOPREV, F.IDPATRO, M.IDPESSOA, M.IDMODU' +
        'LO        '
      '         -- SOL 124845-15184 {fim}'
      '         -- TAG REGNADATA_24_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = I' +
        'NVESTIMENTOS E <> DE CPMF'
      '         -- TAG REGNADATA_25_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_25_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO =' +
        ' INVESTIMENTOS'
      '         -- TAG REGNADATA_26_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS ENGLOBADOS NA DATAREF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, Round(SUM(A.SALDO),2) AS SALDO, A.IDP' +
        'LANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, ' +
        'A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      '                '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SA' +
        'LDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '#39' '#39' AS TIP' +
        'OREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CH' +
        'AR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,  L.HI' +
        'STORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUM' +
        'FATURA,'
      '                SS.SALDOTOT, C.SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L,'
      '                (SELECT'
      
        '                    D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1)) AS SALDOTOT'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.NUMFATURA) SS,'
      '                (SELECT'
      
        '                    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      
        '                    AND NOT Exists (Select 1 From DocumxDocum dx' +
        'd'
      
        '                                    where dxd.iddocumento = d.co' +
        'ddocumento'
      
        '                                      and dxd.flgdispfinanc = '#39'S' +
        #39')'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE  (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      
        '             WHERE  (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                --AND (D.IDMODULO <> 79) SOL 179184'
      '                AND (D.IDMODULO NOT in (79,740))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.NUMFATURA = C.NUMFATURA(+))'
      '                AND (D.NUMFATURA = X.NUMFATURA)'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPREC' +
        'DES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPD' +
        'OC, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, ' +
        'SS.SALDOTOT, C.SALDOALT) A,'
      '            (SELECT'
      
        '                D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '                AND (L.OPERACAO=3)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '         WHERE'
      '             A.NUMFATURA=B.NUMFATURA(+)'
      '         GROUP BY'
      
        '             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI,' +
        ' A.IDPESSOA, A.CODTIPDOC,'
      
        '             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES,'
      '             A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG REGNADATA_27_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM D' +
        'ARF GERADO'
      '         -- TAG REGNADATA_28_I'
      '         SELECT'
      '            DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV' +
        ', R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC' +
        ', D.IDMODULO, 0 AS NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUME' +
        'NTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.' +
        'COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDE' +
        'S, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      
        '            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM ' +
        'R,'
      
        '            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOS' +
        'TO=1) X,'
      '            (SELECT'
      
        '                L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCT' +
        'O'
      '             FROM'
      '                LANCTODOCUM L, DOCUMENTO D'
      '             WHERE'
      
        '                (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/M' +
        'M/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM A' +
        'LTXIMPOSTO WHERE CODIMPOSTO=1))'
      '                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '         WHERE'
      '            (I.IDDARF IS NULL)'
      '            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.STATUS=2)'
      ''
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
      ''
      '        --bruno bastos - 26/11/2009 - início'
      '        UNION ALL'
      '        ('
      
        '         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PAR' +
        'A DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_29_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                documxdocum dxd,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                --bruno bastos - 26/11/2009'
      '                and (dxd.iddocumento   = d.coddocumento)'
      '                and (dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Exists (Select 1 From lanctoDocum lctdoc'
      
        '                            where lctdoc.coddocumento = dxd.iddo' +
        'cumentopai'
      '                              and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO = 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO IN ('#39'5'#39')'
      '         -- TAG REGNADATA_29_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCU' +
        'MENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_210_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                 --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Not Exists (Select 1 From lanctoDocum lctdoc'
      
        '                                where lctdoc.coddocumento = dxd.' +
        'iddocumentopai'
      '                                  and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_210_F'
      '        )'
      '        --bruno bastos - 26/11/2009 - fim'
      ''
      '       ) U'
      '    WHERE'
      '       ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '       AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOP' +
        'REV))'
      '       AND (U.IDFORCLI = P.IDPESSOA(+))'
      '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '       AND (U.IDPESSOA = T.IDPESSOA(+))'
      '       AND (U.RECPAG = T.RECPAG(+))'
      '       AND (U.IDMODULO = M.IDMODULO(+))'
      '       AND ((:PSATIVO IS NULL) OR (PP.ATIVO = :PSATIVO)) '
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL),'
      
        '       U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.' +
        'NUMAPGR,U.IDPESSOA'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA'
      '    FROM'
      '       PESSOA P,'
      '       (SELECT'
      
        '           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, X.IDPLANOPREV' +
        ', X.IDPATRO, X.IDPESSOA'
      '        FROM'
      '           ('
      '            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF'
      '            -- TAG REGNADATA_31_I'
      '            SELECT'
      
        '               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODO' +
        'CUMENTO, R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA, '#39' '#39' AS CODCENTROR' +
        'ESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '            WHERE'
      
        '               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM M' +
        'OVIMFINANC M'
      '                                   WHERE (IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN = TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC=(SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSO' +
        'A = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPOR' +
        'TADOR,PO.IDBANCO'
      '            -- TAG REGNADATA_31_F'
      ''
      '            UNION ALL'
      ''
      '            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS'
      '            -- TAG REGNADATA_32_I'
      '            SELECT'
      
        '               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NU' +
        'LL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLD' +
        'OCUMENTO)) AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA,' +
        ' R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.I' +
        'DPESSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      ''
      '            WHERE'
      
        '               (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '               AND (D.STATUS <> '#39'2'#39')'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO,'
      
        '                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.COD' +
        'CENTRORESPON'
      '            -- TAG REGNADATA_32_F'
      ''
      '            UNION ALL'
      
        '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS D' +
        'E TRANSF ENTRE CONTAS'
      '            -- TAG REGNADATA_33_I'
      '            SELECT'
      
        '               I.IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODOCUMENTO, R.I' +
        'DPLANOPREV, R.IDPATRO, I.IDPESSOA, '#39' '#39' AS CODCENTRORESPON, SUM(R' +
        '.VLRCPMF) AS SALDO'
      '            FROM'
      '                IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '            WHERE'
      '                I.DATARETENCAO=TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGRE' +
        'G FROM PARAMFINANC)'
      '                AND I.CODDOCUMENTO IS NULL'
      '                AND I.NUMLOTEMANUAL = 0'
      '                AND I.CODLANCFINANC IS NOT NULL'
      '                AND I.IDPESSOA = :IDPESSOA'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODP' +
        'ORTADOR, I.IDFORCLI'
      '            -- TAG REGNADATA_33_F'
      '       ) X'
      '    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA )XX'
      '    WHERE'
      '       (XX.IDFORCLI = P.IDPESSOA(+))'
      '    -- TAG REGNADATA_30_F'
      ''
      '    UNION ALL'
      ''
      '     -- (4.0) REGISTROS DE INSS'
      '     -- TAG REGNADATA_40_I'
      '     SELECT'
      '        DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI,'
      '        X.SALDO * -1,'
      
        '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_' +
        'CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '        0 AS NUMAPGR,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        3 AS TIPOREG,'
      '        R.CODCENTRORESPON,'
      '        D.IDPESSOA'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS'
      '         -- TAG REGNADATA_41_I'
      '         SELECT DISTINCT'
      
        '            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, ' +
        'P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECOD' +
        'E(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NU' +
        'MFATURA, T.PLACONTA, D.NODOCUMENTO'
      '         FROM'
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R, LANCIRRF N'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (N.IDDOCINSS IS NULL)'
      '            AND (NVL(N.VLRINSS,0) <> 0)'
      '            AND (L.ESTORNO IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO  = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_41_F'
      '         ) X'
      '     WHERE'
      
        '        (TO_DATE(:DATAINSS,'#39'DD/MM/YYYY'#39') = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '        AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '        AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPLANO' +
        'PREV))'
      '        AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (L.NUMLANCTO = X.NUMLANCTO)'
      '     -- TAG REGNADATA_40_F'
      '    UNION ALL'
      '    -- (5.0) BLOQUEIOS JUDICIAS_I'
      '    -- TAG REGNADATA_50_I'
      '    SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '        DECODE(MB.TIPOLANCTO, '#39'E'#39', MB.VALORLANCTO, MB.VALORLANCT' +
        'O * -1) AS SALDO,'
      '        MB.NUMDOCUMENTO,'
      '        0 AS NUMAPGR,'
      '        PA.IDPLANOPREV,'
      '        PA.IDPATRO,'
      '        3 AS TIPOREG,     -- SOL 31714-12665'
      '        MB.CODCENTRORESPON,'
      '        NULL IDPESSOA'
      '     FROM MOVFINBLOQJUDICIAIS MB,'
      '       PESSOA              PE,'
      '       PLANPREVCONTABPATRO PA,'
      '       PLANPREVCONTABIL    PL'
      '     WHERE (MB.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '      AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '      AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      '    -- TAG REGNADATA_50_F'
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      '   AND ((:PSATIVO IS NULL) OR (PT.ATIVO = :PSATIVO))'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 666
    Top = 174
  end
  object dspDispAnaliticaRel: TDataSetProvider
    DataSet = qryAnaliticaRel
    Constraints = True
    Left = 219
    Top = 445
  end
  object CdsDispAnaliticaRel: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'NODOCUMENTO'
        DataType = ftString
        Size = 74
      end
      item
        Name = 'NOMEFORCLI'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTRORESPON'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEPLANOPATRO'
        DataType = ftString
        Size = 113
      end
      item
        Name = 'NOME'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDPLANO'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOREG'
        DataType = ftFloat
      end
      item
        Name = 'SALDOANT'
        DataType = ftFloat
      end
      item
        Name = 'RECEBIMENTOS'
        DataType = ftFloat
      end
      item
        Name = 'DESEMBOLSOS'
        DataType = ftFloat
      end
      item
        Name = 'SALDODIA'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'PLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMDOC'
        DataType = ftString
        Size = 74
      end
      item
        Name = 'NUMAPGR'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsDispAnaliticaRelIndex1'
      end>
    IndexFieldNames = 'NOMEPLANOPATRO;TIPOREG'
    Params = <>
    ProviderName = 'dspDispAnaliticaRel'
    StoreDefs = True
    Left = 104
    Top = 445
    object StringField9: TStringField
      DisplayLabel = 'Cliente / Fornecedor'
      DisplayWidth = 58
      FieldName = 'NOMEFORCLI'
      Size = 190
    end
    object StringField10: TStringField
      DisplayLabel = 'AP'
      DisplayWidth = 17
      FieldName = 'NUMDOC'
      Size = 74
    end
    object StringField11: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 33
      FieldName = 'NODOCUMENTO'
      Size = 74
    end
    object StringField12: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 24
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 16
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 15
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 16
      FieldName = 'SALDOANT'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object StringField13: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 22
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object StringField14: TStringField
      DisplayWidth = 113
      FieldName = 'NOMEPLANOPATRO'
      Visible = False
      Size = 113
    end
    object FloatField14: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANO'
      Visible = False
    end
    object FloatField15: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOREG'
      Visible = False
    end
    object FloatField17: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object StringField15: TStringField
      DisplayWidth = 50
      FieldName = 'PLANO'
      Visible = False
      Size = 50
    end
    object StringField16: TStringField
      DisplayWidth = 60
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
    object FloatField18: TFloatField
      FieldName = 'SALDO'
      Visible = False
    end
    object FloatField19: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMAPGR'
      Visible = False
    end
    object FloatField25: TFloatField
      DisplayLabel = 'Recebimento Total Grupo'
      DisplayWidth = 16
      FieldName = 'RECEBIMENTO_TOTAL_GRUPO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object FloatField26: TFloatField
      DisplayLabel = 'Desembolso Total Grupo'
      DisplayWidth = 16
      FieldName = 'DESEMBOLSO_TOTAL_GRUPO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object FloatField27: TFloatField
      DisplayLabel = 'Saldo Inicial Grupo'
      DisplayWidth = 16
      FieldName = 'SALDO_INICIAL_GRUPO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Saldo Final Grupo'
      DisplayWidth = 16
      FieldName = 'SALDO_FINAL_GRUPO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object StringField17: TStringField
      DisplayWidth = 100
      FieldName = 'TEXTO_SALDO_FINAL'
      Visible = False
      Size = 100
    end
  end
  object dsAnaliticaRel: TwwDataSource
    AutoEdit = False
    DataSet = CdsDispAnaliticaRel
    Left = 383
    Top = 447
  end
  object pplAnaliticaRel: TppBDEPipeline
    DataSource = dsAnaliticaRel
    UserName = 'lAnaliticaRel'
    Left = 466
    Top = 441
    object pplAnaliticaRelppField1: TppField
      FieldAlias = 'NOMEFORCLI'
      FieldName = 'NOMEFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField2: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField3: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField5: TppField
      FieldAlias = 'RECEBIMENTOS'
      FieldName = 'RECEBIMENTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField6: TppField
      FieldAlias = 'DESEMBOLSOS'
      FieldName = 'DESEMBOLSOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField7: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField8: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField9: TppField
      FieldAlias = 'NOMEPLANOPATRO'
      FieldName = 'NOMEPLANOPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField10: TppField
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField11: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField12: TppField
      FieldAlias = 'TIPOREG'
      FieldName = 'TIPOREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField13: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField14: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField15: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField16: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplAnaliticaRelppField17: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object GRUPO1: TppField
      FieldAlias = 'GRUPO1'
      FieldName = 'GRUPO1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object SALDO_INICIAL_GRUPO: TppField
      FieldAlias = 'SALDO_INICIAL_GRUPO'
      FieldName = 'SALDO_INICIAL_GRUPO'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 18
    end
    object RECEBIMENTO_TOTAL_GRUPO: TppField
      FieldAlias = 'RECEBIMENTO_TOTAL_GRUPO'
      FieldName = 'RECEBIMENTO_TOTAL_GRUPO'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 19
    end
    object DESEMBOLSO_TOTAL_GRUPO: TppField
      FieldAlias = 'DESEMBOLSO_TOTAL_GRUPO'
      FieldName = 'DESEMBOLSO_TOTAL_GRUPO'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 20
    end
    object pplAnaliticaRelppField18: TppField
      FieldAlias = 'SALDO_FINAL_GRUPO'
      FieldName = 'SALDO_FINAL_GRUPO'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 21
    end
    object pplAnaliticaRelppField19: TppField
      FieldAlias = 'TEXTO_SALDO_FINAL'
      FieldName = 'TEXTO_SALDO_FINAL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 22
    end
  end
  object rptDispAnaliticaRel: TppReport
    AutoStop = False
    DataPipeline = pplAnaliticaRel
    OnStartPage = rptDispAnaliticaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Analítica'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 538
    Top = 444
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnaliticaRel'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Disponibilidade Analítica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 104292
        mmTop = 7144
        mmWidth = 75861
        BandType = 0
      end
      object LblEmpresaAnaliticaRel: TppLabel
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
      object lblDataAnaliticaRel: TppLabel
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
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = ppShape2Print
        UserName = 'Shape4'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMAPGR'
        DataPipeline = pplAnaliticaRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText7'
        DataField = 'NOMEFORCLI'
        DataPipeline = pplAnaliticaRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 265
        mmWidth = 90223
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'RECEBIMENTOS'
        DataPipeline = pplAnaliticaRel
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 265
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = pplAnaliticaRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 265
        mmWidth = 45508
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'DESEMBOLSOS'
        DataPipeline = pplAnaliticaRel
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 265
        mmWidth = 30480
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'SALDOANT'
        DataPipeline = pplAnaliticaRel
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 251884
        mmTop = 265
        mmWidth = 30480
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText12'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplAnaliticaRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliticaRel'
        mmHeight = 3175
        mmLeft = 110861
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel27: TppLabel
        OnPrint = lblDispAnaSistemaPrint
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
        mmTop = 1852
        mmWidth = 283634
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
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
        mmLeft = 257440
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOMEPLANOPATRO'
      DataPipeline = pplAnaliticaRel
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnaliticaRel'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'shpDispAnaDetalhe1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label1'
          Caption = 'AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 91811
          mmTop = 6615
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label6'
          Caption = 'Cliente / Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 529
          mmTop = 6615
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label16'
          Caption = 'Recebimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 197115
          mmTop = 6615
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label2'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 142346
          mmTop = 6615
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label8'
          Caption = 'Desembolsos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 224896
          mmTop = 6615
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label15'
          Caption = 'Saldo do Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 260880
          mmTop = 6615
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label3'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 110861
          mmTop = 6615
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'NOMEPLANOPATRO'
          DataPipeline = pplAnaliticaRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnaliticaRel'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1058
          mmWidth = 136261
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText21: TppDBText
          UserName = 'DBText201'
          BlankWhenZero = True
          DataField = 'RECEBIMENTO_TOTAL_GRUPO'
          DataPipeline = pplAnaliticaRel
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnaliticaRel'
          mmHeight = 3175
          mmLeft = 188913
          mmTop = 529
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          BlankWhenZero = True
          DataField = 'DESEMBOLSO_TOTAL_GRUPO'
          DataPipeline = pplAnaliticaRel
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnaliticaRel'
          mmHeight = 3175
          mmLeft = 220399
          mmTop = 529
          mmWidth = 30480
          BandType = 5
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'TEXTO_SALDO_FINAL'
          DataPipeline = pplAnaliticaRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnaliticaRel'
          mmHeight = 3175
          mmLeft = 528
          mmTop = 794
          mmWidth = 90223
          BandType = 5
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          BlankWhenZero = True
          DataField = 'SALDO_FINAL_GRUPO'
          DataPipeline = pplAnaliticaRel
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnaliticaRel'
          mmHeight = 3175
          mmLeft = 251884
          mmTop = 529
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryAnaliticaRel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '-- DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.' +
        'NODOCUMENTO,U.NUMAPGR) AS NUMDOC,'
      
        '   CAST(DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NU' +
        'LL,U.NODOCUMENTO,U.NUMAPGR) AS VARCHAR2(74)) AS NUMDOC,'
      '   '
      '   U.NUMAPGR,'
      '   CAST(U.NODOCUMENTO AS VARCHAR2(74)) AS NODOCUMENTO,'
      '   CAST(U.NOMEFORCLI || DECODE('
      '                          DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      
        '                          DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39 +
        ','
      
        '                          DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||' +
        #39' - '#39' ||P.NOME,'#39#39'))),'#39#39','#39#39','
      
        '                          '#39' - '#39' || DECODE(U.IDPATRO,-1,'#39'TOTAL GE' +
        'RAL'#39','
      
        '                                   DECODE(U.IDPATRO,9999999,'#39'TOT' +
        'AL GERAL'#39','
      
        '                                   DECODE(INSTR('#39'23'#39',TIPOREG),0,' +
        'PT.NOME||'#39' - '#39' ||P.NOME,'#39#39')))) AS VARCHAR2(190)) AS NOMEFORCLI,'
      ''
      ' /*  U.NODOCUMENTO AS NODOCUMENTO,'
      '   U.NOMEFORCLI || DECODE('
      '                          DECODE(U.IDPATRO,-1,'#39'TOTAL GERAL'#39','
      
        '                          DECODE(U.IDPATRO,9999999,'#39'TOTAL GERAL'#39 +
        ','
      
        '                          DECODE(INSTR('#39'23'#39',TIPOREG),0,PT.NOME||' +
        #39' - '#39' ||P.NOME,'#39#39'))),'#39#39','#39#39','
      
        '                          '#39' - '#39' || DECODE(U.IDPATRO,-1,'#39'TOTAL GE' +
        'RAL'#39','
      
        '                                   DECODE(U.IDPATRO,9999999,'#39'TOT' +
        'AL GERAL'#39','
      
        '                                   DECODE(INSTR('#39'23'#39',TIPOREG),0,' +
        'PT.NOME||'#39' - '#39' ||P.NOME,'#39#39')))) AS NOMEFORCLI,    */'
      '   U.SALDO,'
      '   U.CODCENTRORESPON,'
      ''
      '--   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      
        '   CAST((PT.NOME||'#39' - '#39' ||P.NOME) AS VARCHAR2(113)) AS NOMEPLANO' +
        'PATRO,'
      ''
      '   CN.NOME,'
      '   U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO,'
      '   U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      '   0 AS SALDODIA,'
      '   U.IDPESSOA,'
      '   PT.NOME AS PLANO,'
      '   P.NOME AS PATRO,'
      ''
      '--   (U.IDPLANOPREV || U.IDPATRO) AS GRUPO1,'
      '   CAST((U.IDPLANOPREV || U.IDPATRO) AS VARCHAR2(10)) AS GRUPO1,'
      ''
      '   DECODE(U.TIPOREG,1,1,2) AS TIPO_GRUPO,'
      
        '   ROUND(SUM(  NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0)) O' +
        'VER ( PARTITION BY U.IDPATRO, U.IDPLANOPREV  ),2) AS SALDO_INICI' +
        'AL_GRUPO,'
      
        '   ROUND(SUM(  NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.' +
        'SALDO),1,U.SALDO,0)),0)) OVER ( PARTITION BY U.IDPATRO, U.IDPLAN' +
        'OPREV  ),2) AS RECEBIMENTO_TOTAL_GRUPO,'
      
        '   ROUND(SUM(  NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.' +
        'SALDO),-1,U.SALDO,0)),0) ) OVER ( PARTITION BY U.IDPATRO, U.IDPL' +
        'ANOPREV  ),2) AS DESEMBOLSO_TOTAL_GRUPO,'
      
        '   ROUND(SUM(  U.SALDO) OVER ( PARTITION BY U.IDPATRO, U.IDPLANO' +
        'PREV  ),2) AS SALDO_FINAL_GRUPO,'
      ''
      
        '--   ('#39'SALDO FINAL   - '#39' || PT.NOME||'#39' - '#39' ||P.NOME) AS TEXTO_SA' +
        'LDO_FINAL'
      
        '   CAST(('#39'SALDO FINAL   - '#39' || PT.NOME||'#39' - '#39' ||P.NOME) AS VARCH' +
        'AR2(100)) AS TEXTO_SALDO_FINAL'
      ''
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA'
      '    FROM'
      '       ('
      
        '        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <>' +
        ' INVESTIMENTOS'
      '        -- TAG SALDOANT_11_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN <> 0)'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO  = 79)  SOL 1' +
        '79184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_11_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO ' +
        'X PAGTO E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_12_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (M.DATADISPFINANC < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '           AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS N' +
        'ULL))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (M.DATADISPFINANC  > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (M.DATADISPFINANC  < TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_12_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E M' +
        'ODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_13_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,'#39'R' +
        #39',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS ' +
        'IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS ID' +
        'MODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS H' +
        'ISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' ' +
        'AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R'
      '        WHERE'
      
        '           (((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC IS NULL)) OR'
      
        '            ((M.DATALANCFINAN  BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39')) AND (M.DATADISPFI' +
        'NANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DA' +
        'TAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '            ((M.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))))'
      
        '           AND (M.DATADISPFINANC > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      '           AND (M.IDPESSOA = :IDPESSOA)'
      '           AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '           AND (M.VALORLANCFINAN = 0)'
      
        '           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRAN' +
        'SF = M.CODLANCFINANC))'
      
        '           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBT' +
        'OPAGTO R1, DOCUMENTO D1'
      
        '                             WHERE ((M1.CODLANCTRANSF IS NULL) O' +
        'R (M1.CODLANCTRANSF = 0))'
      '                                AND (M1.IDPESSOA = :IDPESSOA)'
      '                                AND (M1.IDMODULO <> 3)'
      '                                AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                AND (((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                     ((M1.DATALANCFINAN  BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39')) AND (M1.DATADISPFINANC BETWEEN TO_DATE(:DATASALDOANT,'#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))) OR'
      
        '                                     ((M1.DATADISPFINANC BETWEEN' +
        ' TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAANT,'#39'DD/MM' +
        '/YYYY'#39'))))'
      
        '                                AND (M1.DATADISPFINANC > TO_DATE' +
        '(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                AND (R1.CODLANCFINANC(+) = M1.CO' +
        'DLANCFINANC)'
      
        '                                AND (D1.CODDOCUMENTO(+)   = R1.C' +
        'ODDOCUMENTO)'
      
        '                                --AND (D1.IDMODULO = 79) SOL 179' +
        '184'
      '                                AND (D1.IDMODULO in (79,740))'
      
        '                                AND (M1.CODLANCFINANC = M.CODLAN' +
        'CFINANC)))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA'
      '        -- TAG SALDOANT_13_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS'
      '        -- TAG SALDOANT_14_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS S' +
        'ALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO' +
        ', M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '        WHERE'
      
        '           (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVI' +
        'MFINANC M'
      '                                WHERE (M.IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN > TO_DA' +
        'TE(:DATASALDOANT,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (DATALANCFINAN < TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPES' +
        'SOA = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '           AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADO' +
        'R'
      '        -- TAG SALDOANT_14_F'
      ''
      '        UNION ALL'
      
        '        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ' +
        'ENTRE CONTAS'
      '        -- TAG SALDOANT_141_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS' +
        ' SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMEN' +
        'TO, I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 A' +
        'S TIPOREG, '#39#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODT' +
        'IPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '            IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '        WHERE'
      '            I.DATARETENCAO > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY'#39')'
      '            AND I.DATARETENCAO < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '            AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FR' +
        'OM PARAMFINANC)'
      '            AND I.CODDOCUMENTO IS NULL'
      '            AND I.NUMLOTEMANUAL = 0'
      '            AND I.CODLANCFINANC IS NOT NULL'
      '            AND I.IDPESSOA = :IDPESSOA'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTA' +
        'DOR, I.IDFORCLI'
      '        -- TAG SALDOANT_141_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS'
      '        -- TAG SALDOANT_15_I'
      '        SELECT'
      
        '          '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SA' +
        'LDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO,' +
        ' D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS T' +
        'IPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIP' +
        'RECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      '        WHERE'
      
        '           (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '           AND (D.STATUS <> '#39'2'#39')'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODO' +
        'CUMENTO,'
      
        '                 R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENT' +
        'RORESPON'
      '        -- TAG SALDOANT_15_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MOD' +
        'ULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_16_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_16_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODUL' +
        'O DE INVESTIMENTOS'
      '        -- TAG SALDOANT_17_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '--           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SAL' +
        'DO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLA' +
        'NOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.COD' +
        'TIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDO' +
        'CUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39 +
        '||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG' +
        ', DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D' +
        '.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORI' +
        'COCOMPL, R.CODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE  (D.OPERACAO IN ('#39'2'#39'))'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (L.OPERACAO <> 5)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            GROUP BY D.CODDOCUMENTO) S,'
      
        '           (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VALO' +
        'R * -1,LA.VALOR) AS VALOR'
      '            FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '            WHERE'
      
        '               RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORT' +
        'ADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '               AND LA.DEBCRE = '#39'D'#39
      '               AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '        WHERE  (D.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '           AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (NVL(L.VALOR,0) <> 0)'
      '           AND (D.OPERACAO IN ('#39'2'#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '           AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                           where dxd.iddocumento = d.coddocument' +
        'o'
      '                             and dxd.flgdispfinanc = '#39'S'#39')'
      '           -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '           --AND (D.IDMODULO  <> 79) SOL 179184'
      '           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODO' +
        'CUMENTO,'
      
        '           D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODT' +
        'IPRECDES,'
      
        '           R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACA' +
        'O,'
      '           D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,N' +
        'ULL,0,P.VALOR))) <> 0'
      '        -- TAG SALDOANT_18_F'
      ''
      '        UNION ALL'
      ''
      '        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS'
      '        -- TAG SALDOANT_19_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (X.SALDO * -1) AS SALD' +
        'O, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, D' +
        '.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIP' +
        'OREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRE' +
        'CDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '           ('
      '            -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS'
      '            -- TAG SALDOANT_191_I'
      '            SELECT DISTINCT'
      
        '               L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCL' +
        'I, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DE' +
        'CODE(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D' +
        '.NUMFATURA, T.PLACONTA, D.NODOCUMENTO'
      '            FROM'
      
        '               PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERAD' +
        'OR T, RATEIODOCUM R, LANCIRRF N'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
      '               AND (N.IDDOCINSS IS NULL)'
      '               AND (NVL(N.VLRINSS,0) <> 0)'
      '               AND (L.ESTORNO      IS NULL)'
      
        '               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ' +
        'ALTXIMPOSTO WHERE CODIMPOSTO = 2))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '               AND (P.IDPESSOA      = D.IDFORCLI)'
      '               AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '            -- TAG SALDOANT_191_F'
      '            ) X'
      '        WHERE'
      '           1 = :BSALDOANTINSS'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (L.NUMLANCTO = X.NUMLANCTO)'
      '        -- TAG SALDOANT_19_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS' +
        ' E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_110_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, Round(SUM(A.SALDO),2) ' +
        'AS SALDO, A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUM' +
        'ENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1' +
        ' AS TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS C' +
        'ODTIPRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      '           (SELECT'
      '               '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)' +
        '/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39#39' AS TIPOR' +
        'EG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR' +
        '(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTO' +
        'RICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, ' +
        'D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,'
      '               SS.SALDOTOT, C.SALDOALT'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L,'
      '               (SELECT'
      
        '                   D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,' +
        'L.VALOR*-1)) AS SALDOTOT'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.OPERACAO = L.OPERACAO)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.NUMFATURA) SS,'
      '               (SELECT'
      
        '                   D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDODOC'
      '                FROM'
      '                   DOCUMENTO D, LANCTODOCUM L'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (L.OPERACAO <> 5)'
      '                   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                GROUP BY D.CODDOCUMENTO) S,'
      '               (SELECT'
      
        '                   D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R' +
        '.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCE' +
        'NTRORESPON'
      '                FROM'
      '                   DOCUMENTO D, RATEIODOCUM R'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'1'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)'
      '                   AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATR' +
        'O, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3'#39'))'
      '                   AND (D.IDPESSOA = :IDPESSOA)'
      '                   AND (D.RECPAG = '#39'P'#39')'
      '                   AND (D.NUMFATURA IS NOT NULL)) X'
      '            WHERE'
      
        '               (X.DATAPROGRAMADA > TO_DATE(:DATASALDOANT,'#39'DD/MM/' +
        'YYYY'#39'))'
      
        '               AND (X.DATAPROGRAMADA < TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '               AND (D.STATUS <> '#39'2'#39')'
      '               AND (D.OPERACAO IN ('#39'1'#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '               AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                               where dxd.iddocumento = d.coddocu' +
        'mento'
      '                                 and dxd.flgdispfinanc = '#39'S'#39')'
      '               -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '               --AND (D.IDMODULO <> 79) SOL 179184'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.NUMFATURA = R.NUMFATURA)'
      '               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '               AND (D.NUMFATURA = SS.NUMFATURA)'
      '               AND (D.NUMFATURA = C.NUMFATURA)'
      '               AND (D.NUMFATURA = X.NUMFATURA)'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                    L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECD' +
        'ES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                    R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDO' +
        'C, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                    R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, S' +
        'S.SALDOTOT, C.SALDOALT) A,'
      '           (SELECT'
      
        '               D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L'
      '            WHERE'
      '               (D.OPERACAO IN ('#39'3'#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (L.OPERACAO=3)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '        WHERE'
      '            A.NUMFATURA=B.NUMFATURA(+)'
      '        GROUP BY'
      
        '            A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, ' +
        'A.IDPESSOA, A.CODTIPDOC,'
      
        '            A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.H' +
        'ISTORICOCOMPL, A.CODTIPRECDES,'
      '            A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG SALDOANT_110_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO' +
        ' DA SEMANA ANTERIOR'
      '        -- TAG SALDOANT_111_I'
      '        SELECT'
      '           DISTINCT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO,' +
        ' R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSO' +
        'A, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '#39' '#39' AS N' +
        'ODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECDES, '#39' '#39' AS C' +
        'ODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM R' +
        ','
      
        '           (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOST' +
        'O=1) X,'
      '           (SELECT'
      '               L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO'
      '            FROM'
      '               LANCTODOCUM L, DOCUMENTO D'
      '            WHERE'
      
        '               (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM AL' +
        'TXIMPOSTO WHERE CODIMPOSTO=1))'
      '               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '        WHERE'
      '           (I.IDDARF IS NULL)'
      '           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.STATUS=2)'
      '           AND (1 = :BSALDOANTIRRF)'
      '           AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPL' +
        'ANOPREV))'
      '           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '        -- TAG SALDOANT_111_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS ' +
        'SEM MOVIMENTO QUANDO HOUVER'
      '        -- TAG SALDOANT_112_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANO' +
        'PREV, PA.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, (:IDPESSOA) ' +
        'AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS ' +
        'TIPOREG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTI' +
        'PRECDES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '        FROM'
      
        '           PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '        WHERE'
      '           ((:IDPATRO IS NULL) OR (PA.IDPATRO = :IDPATRO))'
      
        '           AND ((:IDPLANOPREV IS NULL) OR (PA.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '           AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '           AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '           AND (PA.IDPLANOPREV NOT IN (23))'
      '           AND ((:PSATIVO IS NULL) OR (PL.ATIVO = :PSATIVO))'
      ''
      '        -- TAG SALDOANT_112_F'
      ''
      '        --Bruno Bastos - 26/11/2009 - Início'
      '        UNION ALL'
      
        '        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MO' +
        'DULO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_113_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB > TO_DATE(:DATASALDOANT' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA F' +
        'ROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM'
      '                                WHERE OPERACAO = '#39'5'#39
      
        '                                  AND CODDOCUMENTO = D.CODDOCUME' +
        'NTO)'
      '                -- Arnaldo V. Scarin - 09/02/2010'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_113_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODU' +
        'LO DE INVESTIMENTOS'
      '        -- TAG SALDOANT_114_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(DECODE(L.DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) A' +
        'S SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D' +
        '.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, ' +
        'DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.N' +
        'ODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE (D1.DATADISPONIB > TO_DATE(:DATASALDOANT,' +
        #39'DD/MM/YYYY'#39'))'
      
        '                    AND (D1.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD'
      
        '             WHERE  (D.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/' +
        'MM/YYYY'#39'))'
      
        '                AND (D.DATADISPONIB < TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D' +
        '.NODOCUMENTO,'
      '                D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,'
      
        '                R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OP' +
        'ERACAO,'
      '                D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '        -- TAG SALDOANT_114_F'
      '        --Bruno Bastos - 26/11/2009 - Fim'
      ''
      'UNION ALL      '
      ''
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '              SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', M' +
        'R.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '                 '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAIS'
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '             AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/Y' +
        'YYY'#39')'
      
        '             AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39 +
        ')'
      
        '             AND M.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bl' +
        'oqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      '        '
      '        UNION ALL'
      '        -- Paulo Nobre - SOL 207968'
      '        SELECT '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '               SUM(DECODE(M.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', ' +
        'MR.VLRRATEIO*-1)) SALDO,'
      '               PA.IDPLANOPREV,'
      '               PA.IDPATRO,'
      '               0 AS IDFORCLI,'
      '               0 AS CODDOCUMENTO,'
      '               1 AS IDPESSOA,'
      '               0 AS CODTIPDOC,'
      '               0 AS IDMODULO,'
      '               0 AS NUMAPGR,'
      '               1 AS TIPOREG,'
      '               '#39' '#39' AS NODOCUMENTO,'
      '               '#39' '#39' AS HISTORICOCOMPL,'
      '               '#39' '#39' AS CODTIPRECDES,'
      '               '#39' '#39' AS CODCENTRORESPON,'
      '               '#39'F'#39' AS RECPAG'
      '          FROM MOVFINBLOQJUDICIAIS M'
      
        '          JOIN MOVBLOQJUDXPLANOPATRO MR ON MR.IDMOVFINBLOQJUDICI' +
        'AIS = M.IDMOVFINBLOQJUDICIAISPAI                      '
      
        '          JOIN PLANPREVCONTABPATRO PA ON MR.IDPLANPREVCTBPATR = ' +
        'PA.IDPLANPREVCTBPATR'
      '          LEFT JOIN PESSOA PE ON PA.IDPATRO = PE.IDPESSOA'
      
        '          JOIN PLANPREVCONTABIL PL ON PA.IDPLANOPREV = PL.IDPLAN' +
        'OPREV'
      
        '        WHERE M.DATADISPONIB > TO_DATE('#39'01/10/2012'#39', '#39'DD/MM/YYYY' +
        #39')'
      
        '           AND M.DATADISPONIB > TO_DATE(:DATASALDOANT,'#39'DD/MM/YYY' +
        'Y'#39')'
      '           AND M.DATADISPONIB < TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39')'
      
        '           AND M.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desb' +
        'loqueio'
      '        GROUP BY PA.IDPLANOPREV, PA.IDPATRO'
      ''
      ''
      '       )'
      '    GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA'
      '    -- TAG SALDOANT_10_F'
      ''
      '    UNION ALL'
      ''
      '    -- (2.0) REGISTRO NA DATAREF'
      '    -- TAG REGNADATA_20_I'
      '    SELECT'
      
        '       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOME' +
        'FORCLI,'
      
        '       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIG' +
        'N(U.SALDO),1,U.SALDO,0)))  AS SALDO,'
      '       U.NODOCUMENTO, U.NUMAPGR, U.IDPLANOPREV, U.IDPATRO,'
      
        '       --DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON' +
        ', U.IDPESSOA --SOL 179184'
      
        '       DECODE(U.IDMODULO,79,2,740,2,3) AS TIPOREG, U.CODCENTRORE' +
        'SPON, U.IDPESSOA'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDMODULO <> 3)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN <> 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      '                              WHERE'
      
        '                                 (((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC IS NULL)) OR'
      
        '                                  ((M1.DATALANCFINAN = TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39')) AND (M1.DATADISPFINANC = TO_DATE(:DATAREF' +
        ','#39'DD/MM/YYYY'#39'))) OR'
      
        '                                  ((M1.DATADISPFINANC = TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39'))))'
      
        '                                 --AND (D1.IDMODULO = 79) SOL 17' +
        '9184'
      '                                 AND (D1.IDMODULO in (79,740))'
      '                                 AND (M1.IDMODULO <> 3)'
      
        '                                 AND ((M1.CODLANCTRANSF IS NULL)' +
        ' OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <' +
        '> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      ''
      '         -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      ''
      
        '            R.IDRATEIOFINANC -- thiago melo SOL 227356 PPM 34063' +
        '6'
      '            '
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF =' +
        ' 0))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (R.RECPAG = '#39'R'#39')'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      '            '
      '            -- thiago melo SOL 227356 PPM 340636'
      '            )'
      '            -- thiago melo SOL 227356 PPM 340636'
      ''
      '        -- TAG REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO DE RECEBIMENTO BAIXADOS NA DATAREF <>' +
        ' DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      ''
      '        -- thiago melo SOL 227356 PPM 340636'
      '        SELECT NOMEFORCLI,'
      '               SALDO,'
      '               IDPLANOPREV,'
      '               IDPATRO,'
      '               IDFORCLI,'
      '               CODDOCUMENTO,'
      '               IDPESSOA,'
      '               CODTIPDOC,'
      '               IDMODULO,'
      '               NUMAPGR,'
      '               TIPOREG,'
      '               NODOCUMENTO,'
      '               HISTORICOCOMPL,'
      '               CODTIPRECDES,'
      '               CODCENTRORESPON,'
      '               RECPAG FROM ('
      '         -- thiago melo SOL 227356 PPM 340636'
      ''
      '         SELECT DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG,'
      ''
      
        '            R.IDRATEIOFINANC -- thiago melo SOL 227356 PPM 34063' +
        '6'
      '            '
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            --AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT' +
        ' IN (79))) SOL 179184'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79,740)))'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '            AND (M.VALORLANCFINAN = 0)'
      '            AND (DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))<>0'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM MOVIMFINANC WHERE FLGESTORNADO = '#39'S'#39'))'
      
        '--            AND (M.CODLANCFINANC NOT IN (SELECT CODLANCFINANC ' +
        'FROM RELACIONANI WHERE FLGNI = '#39'I'#39'))'
      '            AND (M.CODLANCFINANC  = R.CODLANCFINANC)'
      '            AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)'
      '            AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)'
      ''
      '            -- thiago melo SOL 227356 PPM 340636'
      '            )'
      '            -- thiago melo SOL 227356 PPM 340636'
      ''
      '        -- TAG REGNADATA_23_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NA DATAREF <> DE CPMF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '--           '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(' +
        'DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPA' +
        'TRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMO' +
        'DULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO' +
        '_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUME' +
        'NTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCEN' +
        'TRORESPON, R.RECPAG'
      '           '#39#39' AS NOMEFORCLI,'
      '           -- Alterado Por Arnaldo V. Scarin - 29/04/2010'
      
        '           SUM(PCK_FIN_DISP_FINAN.FN_RateiaAlterador(r.CodDocume' +
        'nto,'
      
        '                                                     r.Idrateiod' +
        'ocum,'
      '                                                     s.Saldo,'
      '                                                     r.Valor,'
      '                                                     l.Valor,'
      
        '                                                     Nvl(P.VALOR' +
        ',0),'
      
        '                                                     TO_DATE(:DA' +
        'TAREF,'#39'DD/MM/YYYY'#39'))) AS SALDO,'
      
        '           R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO,' +
        ' D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '#39' '#39' AS TIPOREG,' +
        ' DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.' +
        'NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORIC' +
        'OCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.CODDOCUMENTO) S,'
      
        '            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA.VAL' +
        'OR * -1,LA.VALOR) AS VALOR'
      '             FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '             WHERE'
      
        '                RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM POR' +
        'TADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                AND LA.DEBCRE = '#39'D'#39
      '                AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '         WHERE  (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (NVL(L.VALOR,0) <> 0)'
      '            AND (D.OPERACAO IN ('#39'2'#39'))'
      '            AND (L.OPERACAO <> 5)'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '            AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                            where dxd.iddocumento = d.coddocumen' +
        'to'
      '                              and dxd.flgdispfinanc = '#39'S'#39')'
      '            -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            --AND (D.IDMODULO  <> 79) SOL 179184'
      '            AND (D.IDMODULO NOT IN (79,740))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO = L.OPERACAO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO,'
      '                R.CODCENTRORESPON, D.NUMAPGR'
      
        '         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,' +
        'NULL,0,P.VALOR))) <> 0'
      '         -- TAG REGNADATA_24_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = I' +
        'NVESTIMENTOS E <> DE CPMF'
      '         -- TAG REGNADATA_25_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      '             WHERE'
      
        '                (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')' +
        ')'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                AND NOT Exists (Select 1 From DocumxDocum dxd'
      
        '                                where dxd.iddocumento = d.coddoc' +
        'umento'
      '                                  and dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_25_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO =' +
        ' INVESTIMENTOS'
      '         -- TAG REGNADATA_26_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      '                 WHERE'
      
        '                    (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '                    AND (D1.IDPESSOA = :IDPESSOA)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    --AND (D1.IDMODULO  = 79) SOL 179184'
      '                    AND (D1.IDMODULO in (79,740))'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                --AND (D.IDMODULO  = 79) SOL 179184'
      '                AND (D.IDMODULO in (79,740))'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS ENGLOBADOS NA DATAREF E' +
        ' MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, Round(SUM(A.SALDO),2) AS SALDO, A.IDP' +
        'LANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, ' +
        'A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      '                '#39#39' AS NOMEFORCLI,'
      
        '               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))' +
        '-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SA' +
        'LDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,'
      
        '               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUME' +
        'NTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '#39' '#39' AS TIP' +
        'OREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CH' +
        'AR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,  L.HI' +
        'STORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUM' +
        'FATURA,'
      '                SS.SALDOTOT, C.SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L,'
      '                (SELECT'
      
        '                    D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1)) AS SALDOTOT'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.NUMFATURA) SS,'
      '                (SELECT'
      
        '                    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDODOC'
      '                 FROM'
      '                    DOCUMENTO D, LANCTODOCUM L'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      
        '                    AND NOT Exists (Select 1 From DocumxDocum dx' +
        'd'
      
        '                                    where dxd.iddocumento = d.co' +
        'ddocumento'
      
        '                                      and dxd.flgdispfinanc = '#39'S' +
        #39')'
      '                    -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE  (D.OPERACAO IN ('#39'1'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '                 GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPAT' +
        'RO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,'
      '            (SELECT'
      
        '                D.NUMFATURA, (SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1))* -1) AS SALDOALT'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5'#39','#39'3'#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3'#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      
        '             WHERE  (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                --AND (D.IDMODULO <> 79) SOL 179184'
      '                AND (D.IDMODULO NOT in (79,740))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.OPERACAO = L.OPERACAO)'
      '                AND (D.NUMFATURA = R.NUMFATURA)'
      '                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '                AND (D.NUMFATURA = SS.NUMFATURA)'
      '                AND (D.NUMFATURA = C.NUMFATURA(+))'
      '                AND (D.NUMFATURA = X.NUMFATURA)'
      
        '             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO' +
        ', D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                     L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPREC' +
        'DES, R.IDPLANOPREV, R.IDPATRO,'
      
        '                     R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPD' +
        'OC, D.IDMODULO, D.CODDOCUMENTO,'
      
        '                     R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, ' +
        'SS.SALDOTOT, C.SALDOALT) A,'
      '            (SELECT'
      
        '                D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOC' +
        'UMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'|' +
        '|D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL'
      '             FROM'
      '                DOCUMENTO D, LANCTODOCUM L'
      '             WHERE'
      '                (D.OPERACAO IN ('#39'3'#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.NUMFATURA IS NOT NULL)'
      '                AND (L.OPERACAO=3)'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B'
      '         WHERE'
      '             A.NUMFATURA=B.NUMFATURA(+)'
      '         GROUP BY'
      
        '             A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI,' +
        ' A.IDPESSOA, A.CODTIPDOC,'
      
        '             A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.' +
        'HISTORICOCOMPL, A.CODTIPRECDES,'
      '             A.CODCENTRORESPON, A.RECPAG'
      '        -- TAG REGNADATA_27_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM D' +
        'ARF GERADO'
      '         -- TAG REGNADATA_28_I'
      '         SELECT'
      '            DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV' +
        ', R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC' +
        ', D.IDMODULO, 0 AS NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUME' +
        'NTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.' +
        'COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDE' +
        'S, R.CODCENTRORESPON, R.RECPAG'
      '         FROM'
      
        '            DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, RATEIODOCUM ' +
        'R,'
      
        '            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOS' +
        'TO=1) X,'
      '            (SELECT'
      
        '                L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCT' +
        'O'
      '             FROM'
      '                LANCTODOCUM L, DOCUMENTO D'
      '             WHERE'
      
        '                (D.DATAVENCTO BETWEEN TO_DATE(:DATAINIIRRF,'#39'DD/M' +
        'M/YYYY'#39') AND TO_DATE(:DATAFIMIRRF,'#39'DD/MM/YYYY'#39'))'
      
        '                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM A' +
        'LTXIMPOSTO WHERE CODIMPOSTO=1))'
      '                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S'
      '         WHERE'
      '            (I.IDDARF IS NULL)'
      '            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.STATUS=2)'
      ''
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
      ''
      '        --bruno bastos - 26/11/2009 - início'
      '        UNION ALL'
      '        ('
      
        '         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PAR' +
        'A DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_29_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                documxdocum dxd,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'D'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      '                 WHERE'
      
        '                    RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM' +
        ' PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                    AND LA.DEBCRE = '#39'D'#39
      '                 AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                --bruno bastos - 26/11/2009'
      '                and (dxd.iddocumento   = d.coddocumento)'
      '                and (dxd.flgdispfinanc = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Exists (Select 1 From lanctoDocum lctdoc'
      
        '                            where lctdoc.coddocumento = dxd.iddo' +
        'cumentopai'
      '                              and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (D.IDPESSOA = 1)'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO = 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO IN ('#39'5'#39')'
      '         -- TAG REGNADATA_29_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCU' +
        'MENTOS DA DOCUMXDOCUM <> DE CPMF'
      '         -- TAG REGNADATA_210_I'
      '         SELECT'
      
        '            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.I' +
        'DFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.' +
        'NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPREC' +
        'DES, A.CODCENTRORESPON, A.RECPAG'
      '         FROM'
      '            (SELECT'
      
        '                 '#39#39' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.I' +
        'DPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D' +
        '.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'#39' '#39' AS TIPOREG,DECODE(D.COMPLD' +
        'OCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/' +
        #39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTR' +
        'ORESPON, D.RECPAG'
      '             FROM'
      '                DOCUMENTO D,LANCTODOCUM L,'
      '                --bruno bastos - 26/11/2009'
      '                DOCUMXDOCUM DXD,'
      
        '                (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CO' +
        'DTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON'
      '                 FROM RATEIODOCUM R1, DOCUMENTO D1'
      
        '                 WHERE  (D1.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                    AND (D1.IDPESSOA = 1)'
      '                    AND (D1.OPERACAO IN ('#39'2'#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      
        '                    AND ((:IDPATRO IS NULL) OR (R1.IDPATRO = :ID' +
        'PATRO))'
      
        '                    AND ((:IDPLANOPREV IS NULL) OR (R1.IDPLANOPR' +
        'EV = :IDPLANOPREV))'
      '                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,'
      
        '                (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,'#39'C'#39',LA' +
        '.VALOR,LA.VALOR * -1) AS VALOR'
      '                 FROM RECBTOPAGTO RE, LANCTODOCUM LA'
      
        '                 WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA ' +
        'FROM PORTADORFORMA WHERE LANCAFINANC = '#39'N'#39')'
      '                   AND LA.DEBCRE = '#39'D'#39
      '                   AND LA.NUMLANCTO = RE.NUMLANCTO) P'
      
        '             WHERE  (D.DATADISPONIB = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '                AND (D.IDPESSOA = 1)'
      '                 --bruno bastos - 26/11/2009'
      '                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)'
      '                AND (DXD.FLGDISPFINANC = '#39'S'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Inicio'
      '                and Not Exists (Select 1 From lanctoDocum lctdoc'
      
        '                                where lctdoc.coddocumento = dxd.' +
        'iddocumentopai'
      '                                  and lctdoc.operacao = '#39'5'#39')'
      '                -- Arnaldo V. Scarin - 19/01/2010 - Fim'
      '                AND (NVL(L.VALOR,0) <> 0)'
      '                AND (D.OPERACAO IN ('#39'2'#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))'
      
        '             GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.ID' +
        'PESSOA, D.CODDOCUMENTO, D.CODTIPDOC,'
      
        '                      D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.CO' +
        'MPLDOCUMENTO,'
      
        '                      R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPO' +
        'N'
      
        '             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.' +
        'VALOR))) <> 0) A,'
      '             LANCTODOCUM L'
      '         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO'
      '            AND L.OPERACAO NOT IN ('#39'4'#39','#39'5'#39')'
      '         -- TAG REGNADATA_210_F'
      '        )'
      '        --bruno bastos - 26/11/2009 - fim'
      ''
      '       ) U'
      '    WHERE'
      '       ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '       AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOP' +
        'REV))'
      '       AND (U.IDFORCLI = P.IDPESSOA(+))'
      '       AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '       AND (U.IDPATRO = PT.IDPESSOA(+))'
      '       AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '       AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '       AND (U.IDPESSOA = T.IDPESSOA(+))'
      '       AND (U.RECPAG = T.RECPAG(+))'
      '       AND (U.IDMODULO = M.IDMODULO(+))'
      '       AND ((:PSATIVO IS NULL) OR (PP.ATIVO = :PSATIVO)) '
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL),'
      
        '       U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.' +
        'NUMAPGR,U.IDPESSOA'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA'
      '    FROM'
      '       PESSOA P,'
      '       (SELECT'
      
        '           X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, X.IDPLANOPREV' +
        ', X.IDPATRO, X.IDPESSOA'
      '        FROM'
      '           ('
      '            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF'
      '            -- TAG REGNADATA_31_I'
      '            SELECT'
      
        '               PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODO' +
        'CUMENTO, R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA, '#39' '#39' AS CODCENTROR' +
        'ESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO'
      '            WHERE'
      
        '               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC FROM M' +
        'OVIMFINANC M'
      '                                   WHERE (IDMODULO = 3)'
      '                                      AND (IDPESSOA = :IDPESSOA)'
      
        '                                      AND (DATALANCFINAN = TO_DA' +
        'TE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND (M.CODLANCFINANC IN (S' +
        'ELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC'
      
        '                                                               W' +
        'HERE CODTIPDOC=(SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSO' +
        'A = :IDPESSOA AND RECPAG = '#39'P'#39')))))'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.CODPORTADOR = PO.CODPORTADOR)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPOR' +
        'TADOR,PO.IDBANCO'
      '            -- TAG REGNADATA_31_F'
      ''
      '            UNION ALL'
      ''
      '            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS'
      '            -- TAG REGNADATA_32_I'
      '            SELECT'
      
        '               D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NU' +
        'LL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLD' +
        'OCUMENTO)) AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA,' +
        ' R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO'
      '            FROM'
      '               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.I' +
        'DPESSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P'
      ''
      '            WHERE'
      
        '               (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.OPERACAO IN ('#39'2'#39','#39'1'#39'))'
      '               AND (D.STATUS <> '#39'2'#39')'
      
        '               AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO)' +
        ')'
      
        '               AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :' +
        'IDPLANOPREV))'
      '               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)'
      '               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.' +
        'NODOCUMENTO,'
      
        '                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.COD' +
        'CENTRORESPON'
      '            -- TAG REGNADATA_32_F'
      ''
      '            UNION ALL'
      
        '            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS D' +
        'E TRANSF ENTRE CONTAS'
      '            -- TAG REGNADATA_33_I'
      '            SELECT'
      
        '               I.IDFORCLI, 0 AS NUMAPGR, '#39' '#39' AS NODOCUMENTO, R.I' +
        'DPLANOPREV, R.IDPATRO, I.IDPESSOA, '#39' '#39' AS CODCENTRORESPON, SUM(R' +
        '.VLRCPMF) AS SALDO'
      '            FROM'
      '                IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R'
      '            WHERE'
      '                I.DATARETENCAO=TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')'
      
        '                AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGRE' +
        'G FROM PARAMFINANC)'
      '                AND I.CODDOCUMENTO IS NULL'
      '                AND I.NUMLOTEMANUAL = 0'
      '                AND I.CODLANCFINANC IS NOT NULL'
      '                AND I.IDPESSOA = :IDPESSOA'
      
        '                AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO' +
        '))'
      
        '                AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = ' +
        ':IDPLANOPREV))'
      '                AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)'
      
        '            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODP' +
        'ORTADOR, I.IDFORCLI'
      '            -- TAG REGNADATA_33_F'
      '       ) X'
      '    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA )XX'
      '    WHERE'
      '       (XX.IDFORCLI = P.IDPESSOA(+))'
      '    -- TAG REGNADATA_30_F'
      ''
      '    UNION ALL'
      ''
      '     -- (4.0) REGISTROS DE INSS'
      '     -- TAG REGNADATA_40_I'
      '     SELECT'
      '        DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI,'
      '        X.SALDO * -1,'
      
        '        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_' +
        'CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,'
      '        0 AS NUMAPGR,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        3 AS TIPOREG,'
      '        R.CODCENTRORESPON,'
      '        D.IDPESSOA'
      '     FROM'
      '        DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      '        ('
      '         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS'
      '         -- TAG REGNADATA_41_I'
      '         SELECT DISTINCT'
      
        '            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, ' +
        'P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECOD' +
        'E(L.DEBCRE, '#39'D'#39', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NU' +
        'MFATURA, T.PLACONTA, D.NODOCUMENTO'
      '         FROM'
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R, LANCIRRF N'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (N.IDDOCINSS IS NULL)'
      '            AND (NVL(N.VLRINSS,0) <> 0)'
      '            AND (L.ESTORNO IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO  = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_41_F'
      '         ) X'
      '     WHERE'
      
        '        (TO_DATE(:DATAINSS,'#39'DD/MM/YYYY'#39') = TO_DATE(:DATAREF,'#39'DD/' +
        'MM/YYYY'#39'))'
      '        AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '        AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPLANO' +
        'PREV))'
      '        AND (D.CODDOCUMENTO = X.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (L.NUMLANCTO = X.NUMLANCTO)'
      '     -- TAG REGNADATA_40_F'
      '    UNION ALL'
      ''
      '    -- (5.0) BLOQUEIOS JUDICIAS_I'
      '      -- TAG REGNADATA_50_I'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          1 IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'S)'
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 1   -- Lançamento do tipo Bloque' +
        'io'
      '        UNION ALL        -- Paulo Nobre - SOL 207968'
      '      SELECT MB.HISTORICO AS NOMEFORCLI,'
      
        '          DECODE(MB.TIPOLANCTO, '#39'E'#39', MR.VLRRATEIO, '#39'S'#39', MR.VLRRA' +
        'TEIO*-1) SALDO,'
      '          MB.NUMDOCUMENTO,'
      '          0 AS NUMAPGR,'
      '          PA.IDPLANOPREV,'
      '          PA.IDPATRO,'
      '          3 AS TIPOREG,     -- SOL 31714-12665'
      '          MB.CODCENTRORESPON,'
      '          1 IDPESSOA'
      '       FROM MOVFINBLOQJUDICIAIS MB,'
      '         MOVBLOQJUDXPLANOPATRO MR,'
      '         PESSOA              PE,'
      '         PLANPREVCONTABPATRO PA,'
      '         PLANPREVCONTABIL    PL'
      
        '       WHERE (MR.IDMOVFINBLOQJUDICIAIS = MB.IDMOVFINBLOQJUDICIAI' +
        'SPAI)     '
      '        AND (MR.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)'
      '        AND (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '        AND (MB.DATADISPONIB = TO_DATE(:DATAREF, '#39'DD/MM/YYYY'#39'))'
      
        '        AND MB.SITBLOQDESBLOQ = 0   -- Lançamento do tipo Desblo' +
        'queio'
      '      -- TAG REGNADATA_50_F'
      ''
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      '   AND ((:PSATIVO IS NULL) OR (PT.ATIVO = :PSATIVO)) '
      '   AND (PT.IDPLANOPREV NOT IN(186, 187, 29))'
      ' '
      ' '
      ' '
      ' ORDER BY PT.NOME, P.NOME, U.TIPOREG'
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 303
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BSALDOANTIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATASALDOANT'
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
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMIRRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINIMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIMMESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
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
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PSATIVO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NODOCUMENTO'
      Size = 74
    end
    object StringField2: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 190
    end
    object FloatField1: TFloatField
      FieldName = 'SALDO'
    end
    object StringField3: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object StringField5: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object FloatField2: TFloatField
      FieldName = 'IDPLANO'
    end
    object FloatField3: TFloatField
      FieldName = 'IDPATRO'
    end
    object FloatField4: TFloatField
      FieldName = 'TIPOREG'
    end
    object FloatField5: TFloatField
      FieldName = 'SALDOANT'
    end
    object FloatField6: TFloatField
      FieldName = 'RECEBIMENTOS'
    end
    object FloatField7: TFloatField
      FieldName = 'DESEMBOLSOS'
    end
    object FloatField8: TFloatField
      FieldName = 'SALDODIA'
    end
    object FloatField9: TFloatField
      FieldName = 'IDPESSOA'
    end
    object StringField6: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'NUMDOC'
      Size = 74
    end
    object FloatField10: TFloatField
      FieldName = 'NUMAPGR'
    end
    object FloatField20: TFloatField
      FieldName = 'SALDO_INICIAL_GRUPO'
    end
    object FloatField21: TFloatField
      FieldName = 'RECEBIMENTO_TOTAL_GRUPO'
    end
    object FloatField22: TFloatField
      FieldName = 'DESEMBOLSO_TOTAL_GRUPO'
    end
    object FloatField23: TFloatField
      FieldName = 'SALDO_FINAL_GRUPO'
    end
    object FloatField24: TFloatField
      FieldName = 'TIPO_GRUPO'
    end
    object qryAnaliticaRelTEXTO_SALDO_FINAL: TStringField
      FieldName = 'TEXTO_SALDO_FINAL'
      Size = 100
    end
  end
end
