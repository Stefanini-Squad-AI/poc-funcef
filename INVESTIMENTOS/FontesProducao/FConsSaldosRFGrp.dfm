inherited frmConsSaldosRFGrp: TfrmConsSaldosRFGrp
  Left = -2
  Top = 44
  HelpContext = 790529
  Caption = 'Consulta'
  ClientHeight = 497
  ClientWidth = 790
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 458
    inherited bvlSepTit: TBevel
      Width = 788
    end
    inherited pnlTitulo: TPanel
      Width = 788
      inherited lbNomDescricao: TfcLabel
        Width = 190
        Caption = 'Saldos por Grupos'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 788
      Height = 50
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 21
        Top = 5
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object lblOpcao: TLabel
        Left = 363
        Top = 5
        Width = 38
        Height = 13
        Caption = 'Opção'
      end
      object Label5: TLabel
        Left = 476
        Top = 5
        Width = 63
        Height = 13
        Caption = 'Aplicações'
      end
      object dtDataRef: TCMDateTimePicker
        Left = 21
        Top = 20
        Width = 121
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
      object rdgPosicao: TRadioGroup
        Left = 157
        Top = 5
        Width = 196
        Height = 36
        Caption = ' Posição de '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Abertura'
          'Fechamento')
        TabOrder = 1
      end
      object CbxAplic: TComboBox
        Left = 363
        Top = 20
        Width = 102
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'CbxAplic'
        OnExit = CbxAplicExit
        Items.Strings = (
          'Todas'
          'Menor'
          'Maior =')
      end
      object DbDtRefAplc: TCMDateTimePicker
        Left = 474
        Top = 20
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
        TabOrder = 3
      end
    end
    object pgcGeral: TPageControl
      Left = 1
      Top = 95
      Width = 788
      Height = 362
      ActivePage = tbsGrid
      Align = alClient
      TabOrder = 2
      object tbsGrid: TTabSheet
        Caption = 'Grupos'
        object pgcGruposGrid: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 334
          ActivePage = tbsPlanoGrid
          Align = alClient
          MultiLine = True
          Style = tsButtons
          TabOrder = 0
          object tbsPlanoGrid: TTabSheet
            Caption = 'Plano / Patrocinadora'
            object dbgPlano: TwwDBGrid
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              Selected.Strings = (
                'GRUPO'#9'75'#9'Plano / Patrocinadora'
                'SALDOVLR'#9'28'#9'Saldo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DmRelSaldosRFGrp.dsPlano
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
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
          object tbsClasseGrid: TTabSheet
            Caption = 'Classe de Título'
            ImageIndex = 1
            object dbgClasse: TwwDBGrid
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              Selected.Strings = (
                'GRUPO'#9'71'#9'Classe de Título'
                'SALDOVLR'#9'32'#9'Saldo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DmRelSaldosRFGrp.dsClasse
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
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
          object tbsRiscoGrig: TTabSheet
            Caption = 'Classe de Risco'
            ImageIndex = 2
            object dbgRisco: TwwDBGrid
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              Selected.Strings = (
                'GRUPO'#9'71'#9'Classe de Risco'
                'SALDOVLR'#9'32'#9'Saldo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DmRelSaldosRFGrp.dsRisco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
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
          object tbsEmissorGrid: TTabSheet
            Caption = 'Emissor'
            ImageIndex = 3
            object dbgEmissor: TwwDBGrid
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              Selected.Strings = (
                'GRUPO'#9'71'#9'Emissor'
                'SALDO'#9'32'#9'Saldo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DmRelSaldosRFGrp.dsEmissor
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
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
        end
      end
      object tbsPlano: TTabSheet
        Caption = 'Plano / Patrocinadora'
        ImageIndex = 4
        object pgcPlanoGraficos: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 334
          ActivePage = tbsPlanoBarras
          Align = alClient
          Style = tsButtons
          TabOrder = 0
          object tbsPlanoBarras: TTabSheet
            Caption = 'Barra               '
            object degPlanoBarra: TDecisionGraph
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              DecisionSource = DmRelSaldosRFGrp.desPlano
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 2
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              Chart3DPercent = 20
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object BarSeries2: TBarSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object BarSeries3: TBarSeries
                Active = False
                ColorEachPoint = True
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                BarStyle = bsRectGradient
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = '1D Template: GRUPO'
                Style = 40
              end
            end
          end
          object tbsPlanoPizza: TTabSheet
            Caption = 'Pizza               '
            ImageIndex = 1
            object degPlanoPizza: TDecisionGraph
              Left = 0
              Top = 0
              Width = 764
              Height = 295
              DecisionSource = DmRelSaldosRFGrp.desPlano
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 1
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              LeftAxis.AxisValuesFormat = '#,##0.00'
              LeftAxis.Labels = False
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
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
              RightAxis.Visible = False
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object PieSeries1: TPieSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loAscending
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object PieSeries2: TPieSeries
                Active = False
                Marks.Arrow.Color = clBlack
                Marks.ArrowLength = 5
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Style = poBelowPercent
                OtherSlice.Text = 'Outros Planos'
                OtherSlice.Value = 1
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loDescending
                Identifier = '1D Template: GRUPO'
                Style = 56
              end
            end
          end
        end
      end
      object tbsClasse: TTabSheet
        Caption = 'Classes de Títulos'
        ImageIndex = 2
        object pgcClasseGraficos: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 334
          ActivePage = tbsClasseBarra
          Align = alClient
          Style = tsButtons
          TabOrder = 0
          object tbsClasseBarra: TTabSheet
            Caption = 'Barra               '
            object degClasseBarra: TDecisionGraph
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              DecisionSource = DmRelSaldosRFGrp.desClasse
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 2
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              Chart3DPercent = 20
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object Series1: TBarSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object Series2: TBarSeries
                Active = False
                ColorEachPoint = True
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                BarStyle = bsRectGradient
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = '1D Template: GRUPO'
                Style = 40
              end
            end
          end
          object tbsClassePizza: TTabSheet
            Caption = 'Pizza               '
            ImageIndex = 1
            object degClassePizza: TDecisionGraph
              Left = 0
              Top = 0
              Width = 764
              Height = 295
              DecisionSource = DmRelSaldosRFGrp.desClasse
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 1
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.AxisValuesFormat = 'R$ #,##0.###'
              BottomAxis.Visible = False
              LeftAxis.AxisValuesFormat = 'R$ #,##0.00'
              LeftAxis.Labels = False
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
              RightAxis.AxisValuesFormat = 'R$ ###,###,###.00##'
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
              RightAxis.Visible = False
              TopAxis.AxisValuesFormat = 'R$ #,##0.###'
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object BarSeries1: TPieSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loAscending
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object PieSeries3: TPieSeries
                Active = False
                Marks.Arrow.Color = clBlack
                Marks.ArrowLength = 5
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Style = poBelowPercent
                OtherSlice.Text = 'Outras Classes'
                OtherSlice.Value = 1
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loDescending
                Identifier = '1D Template: GRUPO'
                Style = 56
              end
            end
          end
        end
      end
      object tbsRisco: TTabSheet
        Caption = 'Classe de Risco'
        ImageIndex = 5
        object pgcRiscoGraficos: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 334
          ActivePage = tbsRiscoBarra
          Align = alClient
          Style = tsButtons
          TabOrder = 0
          object tbsRiscoBarra: TTabSheet
            Caption = 'Barra               '
            object degRiscoBarra: TDecisionGraph
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              DecisionSource = DmRelSaldosRFGrp.desRisco
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 2
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              Chart3DPercent = 20
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object BarSeries4: TBarSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object BarSeries5: TBarSeries
                Active = False
                ColorEachPoint = True
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                BarStyle = bsRectGradient
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = '1D Template: GRUPO'
                Style = 40
              end
            end
          end
          object tbsRiscoPizza: TTabSheet
            Caption = 'Pizza               '
            ImageIndex = 1
            object degRiscoPizza: TDecisionGraph
              Left = 0
              Top = 0
              Width = 764
              Height = 295
              DecisionSource = DmRelSaldosRFGrp.desRisco
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 1
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.AxisValuesFormat = 'R$ #,##0.###'
              BottomAxis.Visible = False
              LeftAxis.AxisValuesFormat = 'R$ #,##0.00'
              LeftAxis.Labels = False
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
              RightAxis.AxisValuesFormat = 'R$ ###,###,###.00##'
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
              RightAxis.Visible = False
              TopAxis.AxisValuesFormat = 'R$ #,##0.###'
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object PieSeries4: TPieSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loAscending
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object PieSeries5: TPieSeries
                Active = False
                Marks.Arrow.Color = clBlack
                Marks.ArrowLength = 5
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Style = poBelowPercent
                OtherSlice.Text = 'Outras Classes'
                OtherSlice.Value = 1
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loDescending
                Identifier = '1D Template: GRUPO'
                Style = 56
              end
            end
          end
        end
      end
      object tbsEmissor: TTabSheet
        Caption = 'Emissor'
        ImageIndex = 4
        object pgcEmissorGraficos: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 334
          ActivePage = tbsEmissorBarra
          Align = alClient
          Style = tsButtons
          TabOrder = 0
          object tbsEmissorBarra: TTabSheet
            Caption = 'Barra               '
            object degEmissorBarra: TDecisionGraph
              Left = 0
              Top = 0
              Width = 772
              Height = 303
              DecisionSource = DmRelSaldosRFGrp.desEmissor
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 2
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              Chart3DPercent = 20
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object BarSeries6: TBarSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object BarSeries7: TBarSeries
                Active = False
                ColorEachPoint = True
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                BarStyle = bsRectGradient
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                Identifier = '1D Template: GRUPO'
                Style = 40
              end
            end
          end
          object tbsEmissorPizza: TTabSheet
            Caption = 'Pizza               '
            ImageIndex = 1
            object degEmissorPizza: TDecisionGraph
              Left = 0
              Top = 0
              Width = 764
              Height = 295
              DecisionSource = DmRelSaldosRFGrp.desEmissor
              AnimatedZoom = True
              AnimatedZoomSteps = 9
              BottomWall.Brush.Color = clWhite
              BottomWall.Size = 2
              Gradient.EndColor = clWhite
              Gradient.StartColor = clSilver
              Gradient.Visible = True
              LeftWall.Brush.Color = clWhite
              LeftWall.Color = 16316664
              LeftWall.Size = 1
              MarginBottom = 1
              MarginTop = 2
              Title.Brush.Color = clWhite
              Title.Color = clWhite
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.AxisValuesFormat = 'R$ #,##0.###'
              BottomAxis.Visible = False
              LeftAxis.AxisValuesFormat = 'R$ #,##0.00'
              LeftAxis.Labels = False
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
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.ColorWidth = 15
              Legend.Font.Charset = DEFAULT_CHARSET
              Legend.Font.Color = clBlack
              Legend.Font.Height = -9
              Legend.Font.Name = 'Arial'
              Legend.Font.Style = []
              Legend.ShadowColor = clGray
              Legend.TextStyle = ltsRightValue
              Legend.TopPos = 0
              Legend.VertMargin = 10
              RightAxis.AxisValuesFormat = 'R$ ###,###,###.00##'
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
              RightAxis.Visible = False
              TopAxis.AxisValuesFormat = 'R$ #,##0.###'
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
              TopAxis.Visible = False
              Align = alClient
              BorderStyle = bsSingle
              TabOrder = 0
              object PieSeries6: TPieSeries
                Active = False
                Marks.ArrowLength = 20
                Marks.Style = smsPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = 'Template: GRUPO'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loAscending
                Identifier = 'Template: GRUPO'
                Style = 61
              end
              object PieSeries7: TPieSeries
                Active = False
                Marks.Arrow.Color = clBlack
                Marks.ArrowLength = 5
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                SeriesColor = clRed
                Title = '1D Template: GRUPO'
                ValueFormat = 'R$ #,##0.00'
                CustomXRadius = 170
                CustomYRadius = 75
                OtherSlice.Style = poBelowPercent
                OtherSlice.Text = 'Outros Emissores'
                OtherSlice.Value = 1
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loDescending
                Identifier = '1D Template: GRUPO'
                Style = 56
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 458
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 443
      DockPos = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 168
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 3
  end
end
