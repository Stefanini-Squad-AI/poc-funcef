inherited frmConsDisponibilidadeMT1: TfrmConsDisponibilidadeMT1
  Left = 169
  Top = 92
  Caption = 'Consulta - Disponibilidade'
  ClientHeight = 533
  ClientWidth = 804
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 494
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 492
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object PgcSaldos: TPageControl
        Left = 1
        Top = 49
        Width = 800
        Height = 442
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
            Width = 792
            Height = 414
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
            Width = 792
            Height = 414
            Align = alClient
            TabOrder = 0
            object dbgAnalitico: TwwDBGrid
              Left = 1
              Top = 1
              Width = 790
              Height = 287
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'NOMEFORCLI'#9'58'#9'Cliente / Fornecedor'
                'NUMDOC'#9'17'#9'AP'
                'NUMLOTE'#9'10'#9'Lote'
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
            object dbgGridLoteAnalitico: TwwDBGrid
              Left = 1
              Top = 288
              Width = 790
              Height = 125
              Hint = 'Clique com o botão direito para Fixar Colunas'
              PictureMasks.Strings = (
                'VALOR'#9'###,###,###,###,##0.00'#9'T'#9'T')
              Selected.Strings = (
                'RAZAOSOCIAL'#9'38'#9'Cliente / Fornecedor'
                'NODOCUMENTO'#9'17'#9'Documento'
                'NUMAPGR'#9'10'#9'AP'
                'CENTRORESPON'#9'23'#9'Centro de Responsabilidade'
                'VALOR'#9'15'#9'Valor Documento')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alBottom
              Color = clWhite
              DataSource = dsLoteAnalitica
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 1
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
            Width = 792
            Height = 357
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
                Width = 784
                Height = 329
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
            Width = 792
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
                'Saldo Anterior (1.9.2) - Reg. INSS que Estão em GPS'#9'SALDOANT_192'
                
                  'Saldo Anterior (1.10) - Reg. Pagamentos Englobados Não Baixados'#9 +
                  'SALDOANT_110'
                
                  'Saldo Anterior (1.11) - Reg. IRRF que Não Estão emDARG Gerado'#9'SA' +
                  'LDOANT_111'
                'Saldo Anterior (1.12) - Reg. Zerados Plano/Patro'#9'SALDOANT_112'
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
                
                  'Registro na Data (4.2) - Reg. Do Dia de INSS que Não Estão em GP' +
                  'S'#9'REGNADATA_42')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
              OnChange = cmbTiposChange
            end
          end
        end
      end
      object pnlDados: TPanel
        Left = 1
        Top = 1
        Width = 800
        Height = 48
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object Label2: TLabel
          Left = 137
          Top = 3
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
        end
        object bbtnIniciar: TBitBtn
          Left = 269
          Top = 136
          Width = 89
          Height = 36
          Caption = '&Atualizar'
          Default = True
          TabOrder = 2
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
          Top = 19
          Width = 117
          Style.BorderStyle = xbs3D
          TabOrder = 1
          OnExit = edtIntervaloExit
          Alignment = taCenter
          StoredValues = 5
        end
        object edtDataRef: TCMDateTimePicker
          Left = 7
          Top = 19
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
          Left = 269
          Top = 16
          Width = 89
          Height = 24
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
        object chkExpandido: TCheckBox
          Left = 367
          Top = 19
          Width = 83
          Height = 17
          Caption = 'Expandido'
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 494
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 553
      DockPos = 900
      inherited sep1: TToolbarSep97
        Left = 164
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
        Left = 166
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
    Left = 375
    Top = 291
  end
  object dsAnalitica: TwwDataSource
    AutoEdit = False
    DataSet = CdsDispAnalitica
    Left = 383
    Top = 355
  end
  object qryAnalitica: TwwQuery
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
      '   U.SALDO, U.CODCENTRORESPON,'
      '   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      '   CN.NOME, U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO, U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      
        '   0 AS SALDODIA, U.IDPESSOA, PT.NOME AS PLANO, P.NOME AS PATRO,' +
        ' U.NUMLOTE,'
      '   U.CODLANCFINANC'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA, 0 AS NUMLOTE, 0 AS' +
        ' CODLANCFINANC'
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '        '
      
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
      '           AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO' +
        ')/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANO' +
        'PREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTI' +
        'PDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCU' +
        'MENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||' +
        'D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '           AND (D.OPERACAO IN ('#39'2 '#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.IDMODULO  <> 79)'
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
        'OR T, RATEIODOCUM R'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
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
      '            -- TAG SALDOANT_191_F'
      ''
      '            UNION ALL'
      ''
      '            -- (1.9.2) REGISTROS QUE ESTAO EM GPS'
      '            -- TAG SALDOANT_192_I'
      '            SELECT DISTINCT'
      
        '               I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFOR' +
        'CLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, ' +
        'I.VLRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NO' +
        'DOCUMENTO'
      '            FROM'
      
        '               PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOS' +
        'TORETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      '            WHERE'
      '              (T.CODTRATFISCE = '#39'9'#39')'
      '              AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '              AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :I' +
        'DPLANOPREV))'
      
        '              AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (L.CODDOCINSS IS NULL)'
      '              AND (L.ESTORNO IS NULL)'
      '              AND (L.CODALTERADOR IS NULL)'
      '              AND (P.IDPESSOA = D.IDFORCLI)'
      '              AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '              AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '              AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              -- TAG SALDOANT_192_F'
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
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO,' +
        ' A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, A.I' +
        'DPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOR' +
        'EG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECD' +
        'ES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
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
      '                WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3 '#39'))'
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
      
        '--               AND (D.STATUS <> '#39'2'#39')            // Testar com ' +
        'a Karina '
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               AND (D.IDMODULO <> 79)'
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
      '               (D.OPERACAO IN ('#39'3 '#39'))'
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
      '--           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '--           AND (D.STATUS=2)'
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
      '        -- TAG SALDOANT_112_F'
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
        'FORCLI, (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SI' +
        'GN(U.SALDO),1,U.SALDO,0)))  AS SALDO, U.NODOCUMENTO, U.NUMAPGR, ' +
        'U.IDPLANOPREV, U.IDPATRO, DECODE(U.IDMODULO,79,2,3) AS TIPOREG, ' +
        'U.CODCENTRORESPON, U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS  BAIXADOS NA DATAREF <> DE INVESTIME' +
        'NTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, '#39#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE, RC.CODLA' +
        'NCFINANC'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      
        '            ,(SELECT DISTINCT CODLANCFINANC, NUMLOTE FROM RECBTO' +
        'PAGTO) RC'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
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
      '                                 AND (D1.IDMODULO = 79)'
      
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
      '            AND (M.CODLANCFINANC  = RC.CODLANCFINANC(+))'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS BAIXADOS NA DATAREF <> DE INVESTIMEN' +
        'TOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, 0 AS NUMLOTE, 0 AS CODL' +
        'ANCFINANC'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS ' +
        'NULL))'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      
        '                              WHERE ((M1.CODLANCTRANSF IS NULL) ' +
        'OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                 AND (M.DATADISPFINANC  = TO_DAT' +
        'E(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      '                                 AND (D1.IDMODULO = 79)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '            AND (M.CODLANCFINANC = R.CODLANCFINANC)        -- TA' +
        'G REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO BAIXADOS NA DATAREF <> DE INVESTIMENT' +
        'O  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, '#39#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE, RC.CODL' +
        'ANCFINANC'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79)))'
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
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NAO BAIXADOS NA DATAREF' +
        ' <> DE CPMF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(D' +
        'ECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPAT' +
        'RO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMOD' +
        'ULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_' +
        'CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMEN' +
        'TO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENT' +
        'RORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '            AND (D.OPERACAO IN ('#39'2 '#39'))'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            AND (D.IDMODULO  <> 79)'
      '            AND (D.STATUS <> 2)'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINA' +
        'NC'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINA' +
        'NC'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS NAO BAIXADOS ENGLOBADOS' +
        ' NA DATAREF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV,' +
        ' A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, A.CODTIPD' +
        'OC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICO' +
        'COMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE' +
        ', 0 AS CODLANCFINANC'
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
      '                 WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      '             WHERE'
      
        '                (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.IDMODULO <> 79)'
      '                AND (D.STATUS <> 2)  '
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
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
        'S, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE, 0 AS CODLANCFINANC'
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
      '--            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '--            AND (D.STATUS=2)'
      '            AND (4 = :BQUARTA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
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
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL), U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORES' +
        'PON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE, U.CODLANCFINANC'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA, 0 ' +
        'AS NUMLOTE, 0 AS CODLANCFINANC'
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
      '               AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '            '
      
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
      '     SELECT  DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI, X.SALDO * -1, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.N' +
        'ODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO, 0 AS NUMAPGR, R.IDPLANOPREV, R.IDPATRO, 3 AS TIPORE' +
        'G, R.CODCENTRORESPON, D.IDPESSOA, 0 AS NUMLOTE, 0 AS CODLANCFINA' +
        'NC'
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
      ''
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS   IS NULL)'
      '            AND (L.ESTORNO      IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_41_F'
      ''
      '         UNION ALL'
      ''
      '         -- (4.2) REGISTROS QUE ESTAO EM GPS'
      '         -- TAG REGNADATA_42_I'
      '         SELECT DISTINCT'
      
        '            I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFORCLI' +
        ', P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, I.V' +
        'LRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NODOC' +
        'UMENTO'
      '         FROM'
      
        '            PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOSTOR' +
        'ETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      ''
      '         WHERE'
      '            (T.CODTRATFISCE = '#39'9'#39')'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '            AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYYY'#39 +
        '))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (L.ESTORNO IS NULL)'
      '            AND (L.CODALTERADOR IS NULL)'
      '            AND (P.IDPESSOA = D.IDFORCLI)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '            AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '            AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_42_F'
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
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 295
    Top = 348
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
        Name = 'BQUARTA'
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
    object qryAnaliticaNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object qryAnaliticaCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
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
      'SELECT DATABLOQDISPFINAN,FLGDISPBLOQ,DATAINIDISPFINANC'
      'FROM PARAMFINANC')
    ValidateWithMask = True
    Left = 187
    Top = 181
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PARAMFINANC')
    ClientDataSet = CdsParamFinanc
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
      end
      item
        Name = 'NUMLOTE'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
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
    AfterScroll = CdsDispAnaliticaAfterScroll
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
    object CdsDispAnaliticaNUMLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
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
    object CdsDispAnaliticaSALDODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'SALDODIA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
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
    object CdsDispAnaliticaCODLANCFINANC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODLANCFINANC'
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
      '   UU.IDPATRO,'
      '   UU.IDPLANO,'
      '   UU. NOMEPLANOPATRO,'
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
      '   U.SALDO, U.CODCENTRORESPON,'
      '   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      '   CN.NOME, U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO, U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      
        '   0 AS SALDODIA, U.IDPESSOA, PT.NOME AS PLANO, P.NOME AS PATRO,' +
        ' U.NUMLOTE'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA, 0 AS NUMLOTE'
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '        '
      
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
      '           AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO' +
        ')/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANO' +
        'PREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTI' +
        'PDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCU' +
        'MENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||' +
        'D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '           AND (D.OPERACAO IN ('#39'2 '#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.IDMODULO  <> 79)'
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
        'OR T, RATEIODOCUM R'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
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
      '            -- TAG SALDOANT_191_F'
      ''
      '            UNION ALL'
      ''
      '            -- (1.9.2) REGISTROS QUE ESTAO EM GPS'
      '            -- TAG SALDOANT_192_I'
      '            SELECT DISTINCT'
      
        '               I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFOR' +
        'CLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, ' +
        'I.VLRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NO' +
        'DOCUMENTO'
      '            FROM'
      
        '               PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOS' +
        'TORETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      '            WHERE'
      '              (T.CODTRATFISCE = '#39'9'#39')'
      '              AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '              AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :I' +
        'DPLANOPREV))'
      
        '              AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (L.CODDOCINSS IS NULL)'
      '              AND (L.ESTORNO IS NULL)'
      '              AND (L.CODALTERADOR IS NULL)'
      '              AND (P.IDPESSOA = D.IDFORCLI)'
      '              AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '              AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '              AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              -- TAG SALDOANT_192_F'
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
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO,' +
        ' A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, A.I' +
        'DPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOR' +
        'EG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECD' +
        'ES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
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
      '                WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3 '#39'))'
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
      
        '--               AND (D.STATUS <> '#39'2'#39')                  // Testa' +
        'r com a Karina'
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               AND (D.IDMODULO <> 79)'
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
      '               (D.OPERACAO IN ('#39'3 '#39'))'
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
      '--           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '--           AND (D.STATUS=2)'
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
      '        -- TAG SALDOANT_112_F'
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
        'FORCLI, (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SI' +
        'GN(U.SALDO),1,U.SALDO,0)))  AS SALDO, U.NODOCUMENTO, U.NUMAPGR, ' +
        'U.IDPLANOPREV, U.IDPATRO, DECODE(U.IDMODULO,79,2,3) AS TIPOREG, ' +
        'U.CODCENTRORESPON, U.IDPESSOA, U.NUMLOTE'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      '-- (2.1) REGISTROS  BAIXADOS NA DATAREF <> DE INVESTIMENTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      
        '            ,(SELECT DISTINCT CODLANCFINANC, NUMLOTE FROM RECBTO' +
        'PAGTO) RC'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '--            AND (M.IDMODULO <> 3)'
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
      '                                 AND (D1.IDMODULO = 79)'
      '--                                 AND (M1.IDMODULO <> 3)'
      
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
      '            AND (M.CODLANCFINANC  = RC.CODLANCFINANC(+))'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS BAIXADOS NA DATAREF <> DE INVESTIMEN' +
        'TOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, 0 AS NUMLOTE'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS ' +
        'NULL))'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      
        '                              WHERE ((M1.CODLANCTRANSF IS NULL) ' +
        'OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                 AND (M.DATADISPFINANC  = TO_DAT' +
        'E(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      '                                 AND (D1.IDMODULO = 79)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO BAIXADOS NA DATAREF <> DE INVESTIMENT' +
        'O  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79)))'
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
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NAO BAIXADOS NA DATAREF' +
        ' <> DE CPMF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(D' +
        'ECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPAT' +
        'RO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMOD' +
        'ULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_' +
        'CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMEN' +
        'TO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENT' +
        'RORESPON, R.RECPAG, 0 AS NUMLOTE'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '            AND (D.OPERACAO IN ('#39'2 '#39'))'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            AND (D.IDMODULO  <> 79)'
      'AND (D.STATUS <> 2)'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS NAO BAIXADOS ENGLOBADOS' +
        ' NA DATAREF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV,' +
        ' A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, A.CODTIPD' +
        'OC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICO' +
        'COMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                 WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      '             WHERE'
      
        '                (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.IDMODULO <> 79)'
      '                AND (D.STATUS <> 2)'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
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
        'S, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE'
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
      '--            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '--            AND (D.STATUS=2)'
      '            AND (4 = :BQUARTA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
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
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL), U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORES' +
        'PON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA, 0 ' +
        'AS NUMLOTE'
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
      '               AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '            '
      
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
      '     SELECT  DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI, X.SALDO * -1, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.N' +
        'ODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO, 0 AS NUMAPGR, R.IDPLANOPREV, R.IDPATRO, 3 AS TIPORE' +
        'G, R.CODCENTRORESPON, D.IDPESSOA, 0 AS NUMLOTE'
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
      ''
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS   IS NULL)'
      '            AND (L.ESTORNO      IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_41_F'
      ''
      '         UNION ALL'
      ''
      '         -- (4.2) REGISTROS QUE ESTAO EM GPS'
      '         -- TAG REGNADATA_42_I'
      '         SELECT DISTINCT'
      
        '            I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFORCLI' +
        ', P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, I.V' +
        'LRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NODOC' +
        'UMENTO'
      '         FROM'
      
        '            PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOSTOR' +
        'ETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      ''
      '         WHERE'
      '            (T.CODTRATFISCE = '#39'9'#39')'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '            AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYYY'#39 +
        '))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (L.ESTORNO IS NULL)'
      '            AND (L.CODALTERADOR IS NULL)'
      '            AND (P.IDPESSOA = D.IDFORCLI)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '            AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '            AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_42_F'
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
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      '-- FIM DA QRYANALITICA'
      '-- TAG QRYANALIT_F'
      '   )UU'
      'GROUP BY UU.NOMEPLANOPATRO, UU.IDPATRO, UU.IDPLANo'
      'ORDER BY NOMEPLANOPATRO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 298
    Top = 280
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
        Name = 'BQUARTA'
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
    Left = 574
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
    SkipWhenNoRecords = False
    UserName = 'lAnalitica'
    Left = 510
    Top = 161
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 506
    Top = 216
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnalitica'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object shpDispAnaCabecalho: TppShape
        UserName = 'shpDispAnaDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 18785
        mmWidth = 284300
        BandType = 0
      end
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
      object ppLabel5: TppLabel
        UserName = 'Label1'
        Caption = 'AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 112448
        mmTop = 19579
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
        mmTop = 19579
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
        mmTop = 19579
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'C. Resp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 162984
        mmTop = 19579
        mmWidth = 11377
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
        mmTop = 19579
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
        mmTop = 19579
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
        mmLeft = 126736
        mmTop = 19579
        mmWidth = 15081
        BandType = 0
      end
      object lblLote: TppLabel
        UserName = 'lblLote'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 92340
        mmTop = 19579
        mmWidth = 6085
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppShape4: TppShape
        OnPrint = ppShape4Print
        UserName = 'Shape4'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
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
        mmLeft = 112448
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object pplNomeForcli: TppDBText
        UserName = 'lNomeForcli'
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
        mmLeft = 162984
        mmTop = 265
        mmWidth = 24871
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
        mmLeft = 126736
        mmTop = 265
        mmWidth = 34925
        BandType = 4
      end
      object ppdbLote: TppDBText
        UserName = 'dbLote'
        DataField = 'NUMLOTE'
        DataPipeline = pplAnalitica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        OnPrint = ppSubReport1Print
        UserName = 'SubReport1'
        DrillDownComponent = pplNomeForcli
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplLoteAnalitica'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4498
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplLoteAnalitica
          NoDataBehaviors = [ndBlankReport]
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
          Left = 400
          Top = 264
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplLoteAnalitica'
          object ppTitleBand1: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape2'
              Brush.Color = clSilver
              mmHeight = 4763
              mmLeft = 3969
              mmTop = 794
              mmWidth = 213519
              BandType = 1
            end
            object Documento: TppLabel
              UserName = 'Documento'
              Caption = 'Documento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 2910
              mmLeft = 84931
              mmTop = 1588
              mmWidth = 13494
              BandType = 1
            end
            object Valor: TppLabel
              UserName = 'Valor'
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsItalic]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 209550
              mmTop = 1588
              mmWidth = 6085
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'lblAP1'
              Caption = 'Cliente / Fornecedor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 2910
              mmLeft = 6350
              mmTop = 1323
              mmWidth = 23548
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Documento1'
              Caption = 'Centro de Responsabilidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 2910
              mmLeft = 136790
              mmTop = 1588
              mmWidth = 32808
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Documento2'
              Caption = 'AP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 2910
              mmLeft = 115359
              mmTop = 1588
              mmWidth = 3440
              BandType = 1
            end
          end
          object ppHeaderBand4: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'AP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 117211
              mmTop = 0
              mmWidth = 3704
              BandType = 0
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 131498
              mmTop = 0
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 217223
              mmTop = 0
              mmWidth = 7144
              BandType = 0
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppShape1: TppShape
              OnPrint = ppShape4Print
              UserName = 'Shape1'
              ParentHeight = True
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 3970
              mmTop = 0
              mmWidth = 213518
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'NODOCUMENTO'
              DataPipeline = pplLoteAnalitica
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplLoteAnalitica'
              mmHeight = 3175
              mmLeft = 85196
              mmTop = 265
              mmWidth = 29633
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              BlankWhenZero = True
              DataField = 'VALOR'
              DataPipeline = pplLoteAnalitica
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplLoteAnalitica'
              mmHeight = 3175
              mmLeft = 185473
              mmTop = 265
              mmWidth = 30427
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'RAZAOSOCIAL'
              DataPipeline = pplLoteAnalitica
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplLoteAnalitica'
              mmHeight = 3175
              mmLeft = 6615
              mmTop = 265
              mmWidth = 77788
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'CENTRORESPON'
              DataPipeline = pplLoteAnalitica
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplLoteAnalitica'
              mmHeight = 3175
              mmLeft = 137054
              mmTop = 265
              mmWidth = 47361
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'NUMAPGR'
              DataPipeline = pplLoteAnalitica
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplLoteAnalitica'
              mmHeight = 3175
              mmLeft = 115623
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
          end
          object ppFooterBand4: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 7
            end
          end
        end
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 586
    Top = 216
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
      mmHeight = 6085
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 554
    Top = 288
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
    Left = 366
    Top = 406
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
      '   U.SALDO, U.CODCENTRORESPON,'
      '   (PT.NOME||'#39' - '#39' ||P.NOME) AS NOMEPLANOPATRO,'
      '   CN.NOME, U.IDPLANOPREV AS IDPLANO,'
      '   U.IDPATRO, U.TIPOREG,'
      '   NVL(DECODE(INSTR('#39'14'#39',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.S' +
        'ALDO,0)),0) AS RECEBIMENTOS,'
      
        '   NVL(DECODE(INSTR('#39'23'#39',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.' +
        'SALDO,0)),0) AS DESEMBOLSOS,'
      
        '   0 AS SALDODIA, U.IDPESSOA, PT.NOME AS PLANO, P.NOME AS PATRO,' +
        ' U.NUMLOTE'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,'
      '   ('
      '    -- (1.0) SALDO ANTERIOR'
      '    -- TAG SALDOANT_10_I'
      '    SELECT'
      
        '       '#39'SALDO INICIAL'#39' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-' +
        '1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS S' +
        'ALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 ' +
        'AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, IDPESSOA, 0 AS NUMLOTE'
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '                                AND (D1.IDMODULO = 79)'
      
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
      '        '
      
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
      '           AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '        -- TAG SALDOANT_17_F'
      ''
      '        UNION ALL'
      ''
      
        '        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEB' +
        'IMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS'
      '        -- TAG SALDOANT_18_I'
      '        SELECT'
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO' +
        ')/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANO' +
        'PREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTI' +
        'PDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCU' +
        'MENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||' +
        'D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPREC' +
        'DES, '#39' '#39' AS CODCENTRORESPON, R.RECPAG'
      '        FROM'
      '           DOCUMENTO D,LANCTODOCUM L,RATEIODOCUM R,'
      
        '           (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPES' +
        'SOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '           (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '           AND (D.OPERACAO IN ('#39'2 '#39'))'
      '           AND (D.STATUS <> 2)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (L.OPERACAO <> 5)'
      '           AND (D.IDMODULO  <> 79)'
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
        'OR T, RATEIODOCUM R'
      '            WHERE'
      
        '               (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '               AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/M' +
        'M/YYYY'#39'))'
      '               AND (L.OPERACAO      = '#39'4'#39')'
      '               AND (D.IDPESSOA      = :IDPESSOA)'
      '               AND (D.RECPAG        = '#39'P'#39')'
      '               AND (L.CODDOCINSS   IS NULL)'
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
      '            -- TAG SALDOANT_191_F'
      ''
      '            UNION ALL'
      ''
      '            -- (1.9.2) REGISTROS QUE ESTAO EM GPS'
      '            -- TAG SALDOANT_192_I'
      '            SELECT DISTINCT'
      
        '               I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFOR' +
        'CLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, ' +
        'I.VLRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NO' +
        'DOCUMENTO'
      '            FROM'
      
        '               PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOS' +
        'TORETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      '            WHERE'
      '              (T.CODTRATFISCE = '#39'9'#39')'
      '              AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '              AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :I' +
        'DPLANOPREV))'
      
        '              AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      '              AND (L.CODDOCINSS IS NULL)'
      '              AND (L.ESTORNO IS NULL)'
      '              AND (L.CODALTERADOR IS NULL)'
      '              AND (P.IDPESSOA = D.IDFORCLI)'
      '              AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '              AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '              AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              -- TAG SALDOANT_192_F'
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
      
        '           '#39'SALDO INICIAL'#39' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO,' +
        ' A.IDPLANOPREV, A.IDPATRO, 0 AS IDFORCLI, 0 AS CODDOCUMENTO, A.I' +
        'DPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOR' +
        'EG, '#39' '#39' AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, '#39' '#39' AS CODTIPRECD' +
        'ES, '#39' '#39' AS CODCENTRORESPON, '#39'F'#39' AS RECPAG'
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
      '                WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                   (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '               (SELECT'
      
        '                   D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPL' +
        'DOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39 +
        '/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                FROM'
      '                   DOCUMENTO D'
      '                WHERE'
      '                   (D.OPERACAO IN ('#39'3 '#39'))'
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
      
        '--               AND (D.STATUS <> '#39'2'#39')            // Testar com ' +
        'a Karina'
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (L.OPERACAO <> 5)'
      '               AND (D.IDMODULO <> 79)'
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
      '               (D.OPERACAO IN ('#39'3 '#39'))'
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
      '--           AND (VLRIRRF <> 0)'
      '           AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (L.OPERACAO <> 5)'
      '--           AND (D.STATUS=2)'
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
      '        -- TAG SALDOANT_112_F'
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
        'FORCLI, (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SI' +
        'GN(U.SALDO),1,U.SALDO,0)))  AS SALDO, U.NODOCUMENTO, U.NUMAPGR, ' +
        'U.IDPLANOPREV, U.IDPATRO, DECODE(U.IDMODULO,79,2,3) AS TIPOREG, ' +
        'U.CODCENTRORESPON, U.IDPESSOA, U.NUMLOTE'
      '    FROM'
      
        '       PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL ' +
        'PP,'
      '       TIPODOCRECPAG TD, MODULO M,'
      '       ('
      '        ('
      
        '         -- (2.1) REGISTROS  BAIXADOS NA DATAREF <> DE INVESTIME' +
        'NTOS'
      '         -- TAG REGNADATA_21_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINANC' +
        ','#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPRE' +
        'CDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      ',(SELECT DISTINCT CODLANCFINANC, NUMLOTE FROM RECBTOPAGTO) RC'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '--            AND (M.IDMODULO <> 3)'
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
      '                                 AND (D1.IDMODULO = 79)'
      '--                                 AND (M1.IDMODULO <> 3)'
      
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
      'AND (M.CODLANCFINANC  = RC.CODLANCFINANC(+))'
      '        -- TAG REGNADATA_21_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.2) REGISTROS BAIXADOS NA DATAREF <> DE INVESTIMEN' +
        'TOS E GERADOS PELO BAIXA DE RECBTO / PAGTO'
      '         -- TAG REGNADATA_22_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, 0 AS NUMLOTE'
      '         FROM'
      '            MOVIMFINANC M, RATEIOFINANC R'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS ' +
        'NULL))'
      
        '            AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECB' +
        'TOPAGTO R1, DOCUMENTO D1'
      
        '                              WHERE ((M1.CODLANCTRANSF IS NULL) ' +
        'OR (M1.CODLANCTRANSF = 0))'
      '                                 AND (M1.IDPESSOA = :IDPESSOA)'
      '                                 AND (M1.STATUSCONCILIA <> '#39'C'#39')'
      
        '                                 AND (M.DATADISPFINANC  = TO_DAT' +
        'E(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                 AND (R1.CODLANCFINANC(+) = M1.C' +
        'ODLANCFINANC)'
      
        '                                 AND (D1.CODDOCUMENTO(+)   = R1.' +
        'CODDOCUMENTO)'
      '                                 AND (D1.IDMODULO = 79)'
      
        '                                 AND (M1.CODLANCFINANC = M.CODLA' +
        'NCFINANC)))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        -- TAG REGNADATA_22_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.3) REGISTRO BAIXADOS NA DATAREF <> DE INVESTIMENT' +
        'O  E GERADOS PELA TRANSF. ENTRE PLANOS'
      '         -- TAG REGNADATA_23_I'
      '         SELECT'
      '--         DISTINCT'
      
        '            '#39#39' AS NOMEFORCLI, DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALO' +
        'R*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI, 0 AS C' +
        'ODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUM' +
        'APGR, '#39' '#39' AS TIPOREG, M.HISTORICO||'#39' / '#39'||TO_CHAR(M.CODLANCFINAN' +
        'C,'#39'9999999999'#39') AS NODOCUMENTO, '#39' '#39' AS HISTORICOCOMPL, R.CODTIPR' +
        'ECDES, R.CODCENTRORESPON, '#39'F'#39' AS RECPAG, RC.NUMLOTE'
      '         FROM'
      
        '            MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCU' +
        'MENTO D'
      '         WHERE'
      '            (M.DATADISPFINANC = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '            AND (M.IDPESSOA   = :IDPESSOA)'
      
        '            AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRA' +
        'NSF = M.CODLANCFINANC))'
      
        '            AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT I' +
        'N (79)))'
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
      
        '         -- (2.4) REGISTRO DE PAGAMENTOS NAO BAIXADOS NA DATAREF' +
        ' <> DE CPMF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_24_I'
      '         SELECT'
      
        '            '#39#39' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(D' +
        'ECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPAT' +
        'RO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMOD' +
        'ULO, D.NUMAPGR, '#39' '#39' AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_' +
        'CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMEN' +
        'TO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENT' +
        'RORESPON, R.RECPAG, 0 AS NUMLOTE'
      '         FROM'
      '            DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPE' +
        'SSOA = :IDPESSOA AND P.RECPAG = '#39'P'#39') P,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.OPERACAO IN ('#39'2 '#39'))'
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
      '            AND (D.OPERACAO IN ('#39'2 '#39'))'
      '            AND (L.OPERACAO <> 5)'
      '            AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)'
      '            AND (D.IDMODULO  <> 79)'
      'AND (D.STATUS <> 2)'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'P'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
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
        'DES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                    AND (D1.OPERACAO IN ('#39'2 '#39'))'
      '                    AND (D1.RECPAG = '#39'R'#39')'
      '                    AND (D1.IDMODULO  = 79)'
      
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
      '                AND (D.OPERACAO IN ('#39'2 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.RECPAG = '#39'R'#39')'
      '                AND (D.IDMODULO  = 79)'
      
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
      '            AND L.OPERACAO NOT IN ('#39'4 '#39','#39'5 '#39')'
      '         -- TAG REGNADATA_26_F'
      '        )'
      '        UNION ALL'
      '        ('
      
        '         -- (2.7) REGISTRO DE PAGAMENTOS NAO BAIXADOS ENGLOBADOS' +
        ' NA DATAREF E MODULO <> INVESTIMENTOS'
      '         -- TAG REGNADATA_27_I'
      '         SELECT'
      
        '             A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV,' +
        ' A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, A.CODTIPD' +
        'OC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICO' +
        'COMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG, 0 AS NUMLOTE'
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
      '                 WHERE (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (L.OPERACAO <> 5)'
      '                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 GROUP BY D.CODDOCUMENTO) S,'
      '                (SELECT'
      
        '                    D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODC' +
        'ENTRORESPON'
      '                 FROM'
      '                    DOCUMENTO D, RATEIODOCUM R'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'1 '#39'))'
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
      '                AND (D.IDPESSOA = :IDPESSOA)'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (L.OPERACAO NOT IN ('#39'5 '#39','#39'3 '#39'))'
      '                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             GROUP BY D.NUMFATURA) C,'
      '                (SELECT'
      
        '                    D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMP' +
        'LDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||' +
        #39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMENTO'
      '                 FROM'
      '                    DOCUMENTO D'
      '                 WHERE'
      '                    (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)) X'
      '             WHERE'
      
        '                (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39'))'
      '                AND (D.RECPAG = '#39'P'#39')'
      '                AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '                AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                AND (L.OPERACAO <> 5)'
      '                AND (D.IDMODULO <> 79)'
      '                AND (D.STATUS <> 2)                     '
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
      '                (D.OPERACAO IN ('#39'3 '#39'))'
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
        'S, R.CODCENTRORESPON, R.RECPAG, 0 AS NUMLOTE'
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
      '--            AND (VLRIRRF <> 0)'
      '            AND (L.CODALTERADOR IN X.CODALTERADOR)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (L.OPERACAO <> 5)'
      '--            AND (D.STATUS=2)'
      '            AND (4 = :BQUARTA)'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))'
      '         -- TAG REGNADATA_28_F'
      '        )'
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
      
        '    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.' +
        'RAZAOSOCIAL), U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORES' +
        'PON, U.NUMAPGR,U.IDPESSOA, U.NUMLOTE'
      '    -- TAG REGNADATA_20_F'
      ''
      '    UNION ALL'
      ''
      '    -- (3.0) REGISTROS NA DATAREF DE CPMF'
      '    -- TAG REGNADATA_30_I'
      '    SELECT'
      
        '       DECODE(XX.IDFORCLI,-1,'#39' '#39','#39'CPMF - '#39'||P.NOME) AS NOMEFORCL' +
        'I, XX.SALDO, '#39' '#39' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV, X' +
        'X.IDPATRO, 3 AS TIPOREG, '#39' '#39' AS CODCENTRORESPON, XX.IDPESSOA, 0 ' +
        'AS NUMLOTE'
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
      '               AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
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
      '            '
      
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
      '     SELECT  DISTINCT'
      
        '        DECODE(D.IDFORCLI,-1,'#39' '#39',X.RAZAOSOCIAL||'#39' - INSS'#39') AS NO' +
        'MEFORCLI, X.SALDO * -1, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.N' +
        'ODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS ' +
        'NODOCUMENTO, 0 AS NUMAPGR, R.IDPLANOPREV, R.IDPATRO, 3 AS TIPORE' +
        'G, R.CODCENTRORESPON, D.IDPESSOA, 0 AS NUMLOTE'
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
      ''
      
        '            PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR ' +
        'T, RATEIODOCUM R'
      '         WHERE'
      
        '            (L.DATALANCTO >= TO_DATE(:DATAINIMESANT,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '            AND (L.DATALANCTO <= TO_DATE(:DATAFIMMESANT,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '            AND (L.OPERACAO      = '#39'4'#39')'
      '            AND (D.IDPESSOA      = :IDPESSOA)'
      '            AND (D.RECPAG        = '#39'P'#39')'
      '            AND (L.CODDOCINSS   IS NULL)'
      '            AND (L.ESTORNO      IS NULL)'
      
        '            AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALT' +
        'XIMPOSTO WHERE CODIMPOSTO = 2))'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      '            AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (P.IDPESSOA      = D.IDFORCLI)'
      '            AND (L.CODALTERADOR  = T.CODALTERADOR)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_41_F'
      ''
      '         UNION ALL'
      ''
      '         -- (4.2) REGISTROS QUE ESTAO EM GPS'
      '         -- TAG REGNADATA_42_I'
      '         SELECT DISTINCT'
      
        '            I.DATARETENCAO AS DATALANCTO, D.IDFORCLI AS IDFORCLI' +
        ', P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, I.V' +
        'LRRETIDO AS SALDO, D.OPERACAO, D.NUMFATURA, TC.PLACONTA, D.NODOC' +
        'UMENTO'
      '         FROM'
      
        '            PESSOA P, TIPOAGRE T, TIPCUSTAGREGCONTA TC, IMPOSTOR' +
        'ETIDO I, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      ''
      '         WHERE'
      '            (T.CODTRATFISCE = '#39'9'#39')'
      '            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))'
      
        '            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDP' +
        'LANOPREV))'
      
        '            AND (L.DATALANCTO < TO_DATE(:DATAINIMES,'#39'DD/MM/YYYY'#39 +
        '))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (L.CODDOCINSS IS NULL)'
      '            AND (L.ESTORNO IS NULL)'
      '            AND (L.CODALTERADOR IS NULL)'
      '            AND (P.IDPESSOA = D.IDFORCLI)'
      '            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (T.CODTIPOCUSTAGREG = TC.CODTIPOCUSTAGREG(+))'
      '            AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)'
      '            AND (I.CODDOCUMENTO = D.CODDOCUMENTO)'
      '            AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         -- TAG REGNADATA_42_F'
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
      '   ) U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA(+)'
      '   AND ((:IDPATRO IS NULL) OR (U.IDPATRO = :IDPATRO))'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (U.IDPLANOPREV = :IDPLANOPREV)' +
        ')'
      '   AND U.IDPLANOPREV = PT.IDPLANOPREV(+)'
      '   AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)'
      '   AND U.IDPESSOA  = CN.IDPESSOA(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 302
    Top = 406
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
        Name = 'BQUARTA'
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
        Name = 'DATAINIMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 682
    Top = 6
  end
  object pplLoteAnalitica: TppBDEPipeline
    DataSource = dsLoteAnalitica
    UserName = 'lAnalitica1'
    Left = 646
    Top = 161
    object pplLoteAnaliticappField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField2: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField3: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField4: TppField
      FieldAlias = 'CENTRORESPON'
      FieldName = 'CENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField5: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField6: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField7: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplLoteAnaliticappField8: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object dsLoteAnalitica: TwwDataSource
    AutoEdit = False
    DataSet = CdsLoteAnalitica
    Left = 215
    Top = 443
  end
  object CdsLoteAnalitica: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'NUMAPGR'
        DataType = ftFloat
      end
      item
        Name = 'NUMLOTE'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'CENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CdsDispAnaliticaIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 445
    object CdsLoteAnaliticaRAZAOSOCIAL: TStringField
      DisplayLabel = 'Cliente / Fornecedor'
      DisplayWidth = 38
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsLoteAnaliticaNODOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 17
      FieldName = 'NODOCUMENTO'
    end
    object CdsLoteAnaliticaNUMAPGR: TFloatField
      DisplayLabel = 'AP'
      DisplayWidth = 10
      FieldName = 'NUMAPGR'
    end
    object CdsLoteAnaliticaCENTRORESPON: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 23
      FieldName = 'CENTRORESPON'
      FixedChar = True
      Size = 30
    end
    object CdsLoteAnaliticaVALOR: TFloatField
      DisplayLabel = 'Valor Documento'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object CdsLoteAnaliticaCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsLoteAnaliticaNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Visible = False
    end
    object CdsLoteAnaliticaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object sqlLoteAnalitica: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    SUM(A.VLRRATEIOEALT) AS VALOR, A.CODCENTRORESPON, A.RAZAOSOC' +
        'IAL, A.NODOCUMENTO, A.NUMAPGR, A.NUMLOTE, A.CODDOCUMENTO,'
      '    A.CENTRORESPON'
      'FROM'
      '('
      'SELECT'
      '   SUM(TOT.VALOR) AS TOTALRATEIO,'
      '   SUM(NVL(ALT.VALOR,0)) AS TOTALTERADOR,'
      '   SUM(RT.VALOR) AS VLRRATEIOPLANO,'
      
        '   ROUND(SUM(NVL(RT.VALOR,0)) + ((SUM(NVL(RT.VALOR,0)) * SUM(NVL' +
        '(ALT.VALOR,0))) / SUM(NVL(TOT.VALOR,0))),2) AS VLRRATEIOEALT,'
      
        '   RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUMAPGR, ' +
        'RC.NUMLOTE, D.CODDOCUMENTO,'
      
        '   RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, (CT.NOME) AS CENTROR' +
        'ESPON'
      ' FROM'
      '    RATEIODOCUM RT, PESSOA P, DOCUMENTO D, CENTRESPON CT,'
      '    (SELECT'
      '        D.NODOCUMENTO, D.NUMAPGR, R.NUMLOTE, D.CODDOCUMENTO'
      '     FROM'
      '        RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'
      '     WHERE'
      '        (R.CODLANCFINANC  IN (47606))'
      '        AND (D.NUMFATURA IS NULL)'
      '        AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '        AND (R.NUMLANCTO = L.NUMLANCTO)'
      '        AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '     UNION'
      '     SELECT'
      '        D.NODOCUMENTO, D.NUMAPGR, 0 AS NUMLOTE, D.CODDOCUMENTO'
      '     FROM DOCUMENTO D'
      '     WHERE'
      '        D.NUMFATURA IN (SELECT  D1.NUMFATURA'
      '                        FROM'
      
        '                           RECBTOPAGTO R, DOCUMENTO D1, LANCTODO' +
        'CUM L'
      '                        WHERE'
      '                           (R.CODLANCFINANC  IN (47606))'
      '                           AND (D1.NUMFATURA IS NOT NULL'
      
        '                           AND (R.CODDOCUMENTO  = L.CODDOCUMENTO' +
        ')'
      '                           AND (R.NUMLANCTO = L.NUMLANCTO)'
      
        '                           AND (L.CODDOCUMENTO = D1.CODDOCUMENTO' +
        ')))'
      '                           AND (D.OPERACAO <> 3)) RC,'
      '    (SELECT'
      
        '        SUM(NVL(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR *-1),0)) AS ' +
        'VALOR, D.CODDOCUMENTO'
      '     FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'
      '     WHERE'
      '        (R.CODLANCFINANC  IN (47606))'
      '        AND (L.OPERACAO = 4)'
      '        AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '        AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '     GROUP BY D.CODDOCUMENTO) ALT,'
      '    (SELECT'
      '        SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO'
      '     FROM'
      '        RATEIODOCUM RT,'
      '        (SELECT D.CODDOCUMENTO'
      '         FROM RECBTOPAGTO R, DOCUMENTO D, LANCTODOCUM L'
      '         WHERE'
      '            (R.CODLANCFINANC IN (47606))'
      '            AND (D.NUMFATURA IS NULL)'
      '            AND (R.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '            AND (R.NUMLANCTO = L.NUMLANCTO)'
      '            AND (L.CODDOCUMENTO = D.CODDOCUMENTO)) RC'
      '     WHERE'
      '       (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'
      '     GROUP BY  RC.CODDOCUMENTO'
      '     UNION'
      '     SELECT'
      '        SUM(NVL(RT.VALOR,0)) AS VALOR, RC.CODDOCUMENTO'
      '     FROM'
      
        '        RATEIODOCUM RT,                                         ' +
        '                                                               '
      
        '        (SELECT D.NODOCUMENTO, D.NUMAPGR, 0 AS NUMLOTE, D.CODDOC' +
        'UMENTO'
      '         FROM DOCUMENTO D'
      '         WHERE D.NUMFATURA IN (SELECT  D1.NUMFATURA'
      
        '                               FROM RECBTOPAGTO R, DOCUMENTO D1,' +
        ' LANCTODOCUM L'
      '                               WHERE'
      '                                  (R.CODLANCFINANC  IN (47606))'
      '                                  AND (D1.NUMFATURA IS NOT NULL'
      
        '                                  AND (R.CODDOCUMENTO  = L.CODDO' +
        'CUMENTO)'
      
        '                                  AND (R.NUMLANCTO = L.NUMLANCTO' +
        ')'
      
        '                                  AND (L.CODDOCUMENTO = D1.CODDO' +
        'CUMENTO)))'
      '                                  AND (D.OPERACAO <> 3)) RC'
      '     WHERE'
      '        (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'
      '     GROUP BY  RC.CODDOCUMENTO) TOT'
      ' WHERE'
      '       (RT.IDPESSOA = 1)'
      '       AND (RT.IDPATRO = 91008)'
      '       AND (RT.IDPLANOPREV = 2)'
      '    AND (D.IDFORCLI = P.IDPESSOA)'
      '    AND (RT.CODDOCUMENTO = D.CODDOCUMENTO)'
      '    AND (RT.CODDOCUMENTO = RC.CODDOCUMENTO)'
      '    AND (RT.CODDOCUMENTO = ALT.CODDOCUMENTO(+))'
      '    AND (RT.CODDOCUMENTO = TOT.CODDOCUMENTO(+))'
      '    AND (RT.CODCENTRORESPON = CT.CODCENTRORESPON)'
      
        'GROUP BY RT.CODCENTRORESPON, P.RAZAOSOCIAL, D.NODOCUMENTO, D.NUM' +
        'APGR, RC.NUMLOTE, D.CODDOCUMENTO,'
      '          RT.IDPATRO, RT.IDPLANOPREV, RT.IDPESSOA, CT.NOME) A'
      
        'GROUP BY  A.CODCENTRORESPON, A.RAZAOSOCIAL, A.NODOCUMENTO, A.NUM' +
        'APGR, A.NUMLOTE, A.CODDOCUMENTO, A.CENTRORESPON'
      'ORDER BY A.RAZAOSOCIAL'
      ' ')
    ClientDataSet = CdsLoteAnalitica
    Left = 490
    Top = 440
  end
end
