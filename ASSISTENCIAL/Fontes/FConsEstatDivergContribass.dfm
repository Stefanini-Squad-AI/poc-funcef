inherited frmConsEstatDivergContrib: TfrmConsEstatDivergContrib
  Left = 26
  Top = 52
  Caption = 'Estatística de Divergências'
  ClientHeight = 447
  ClientWidth = 758
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 80
    Top = 192
    Width = 54
    Height = 13
    Caption = 'Fornecedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 758
    Height = 408
    BevelInner = bvNone
    BevelOuter = bvNone
    object pnlForaComent: TPanel
      Left = 3
      Top = 3
      Width = 752
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object pnlcoment: TPanel
        Left = 2
        Top = 2
        Width = 748
        Height = 24
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object pgctrlEstat: TPageControl
      Left = 3
      Top = 31
      Width = 752
      Height = 374
      ActivePage = tbsSelecao
      Align = alClient
      TabOrder = 1
      OnChange = pgctrlEstatChange
      object tbsSelecao: TTabSheet
        Caption = 'Seleção '
        object Bevel1: TBevel
          Left = 0
          Top = 6
          Width = 742
          Height = 337
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 7
          Width = 248
          Height = 172
          Caption = 'Geral  '
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 11
            Top = 14
            Width = 69
            Height = 13
            Caption = 'Patrocinadora '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 10
            Top = 92
            Width = 100
            Height = 13
            Caption = 'Plano Previdenciário '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblplanass: TLabel
            Left = 10
            Top = 132
            Width = 85
            Height = 13
            Caption = 'Plano Assistencial'
          end
          object Label29: TLabel
            Left = 11
            Top = 53
            Width = 20
            Height = 13
            Caption = 'Filial'
          end
          object dblkpcmbPatro: TwwDBLookupCombo
            Left = 10
            Top = 29
            Width = 228
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora')
            LookupTable = qrypatro
            LookupField = 'IDPESSOA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = dblkpcmbPatroEnter
          end
          object dblkpcmbPlano: TwwDBLookupCombo
            Left = 10
            Top = 107
            Width = 227
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário')
            LookupTable = qryplano
            LookupField = 'IDPLANOPREV'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = dblkpcmbPlanoEnter
          end
          object cmbplanass: TwwDBLookupCombo
            Left = 9
            Top = 146
            Width = 228
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            LookupTable = qryplanass
            LookupField = 'IDPLANASS'
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnEnter = cmbplanassEnter
          end
          object cmbfilial: TwwDBLookupCombo
            Left = 10
            Top = 67
            Width = 229
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryfilial
            LookupField = 'IDPESSOA'
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = cmbfilialEnter
          end
        end
        object grpMeses: TGroupBox
          Left = 8
          Top = 179
          Width = 248
          Height = 115
          Caption = 'Meses'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object grpMesAnoRef: TGroupBox
            Left = 9
            Top = 13
            Width = 226
            Height = 46
            Caption = 'Mês e Ano de Referência'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object cmbMesRef: TComboBox
              Left = 6
              Top = 15
              Width = 112
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Items.Strings = (
                'Janeiro'
                'Fevereiro'
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro '
                'Outubro'
                'Novembro'
                'Dezembro')
            end
            object spedAnoRef: TSpinEdit
              Left = 135
              Top = 15
              Width = 70
              Height = 22
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 1998
            end
          end
          object GroupBox4: TGroupBox
            Left = 9
            Top = 64
            Width = 226
            Height = 46
            Caption = 'Mês e Ano de Cobrança'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object cmbMesCob: TComboBox
              Left = 6
              Top = 15
              Width = 109
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Items.Strings = (
                'Janeiro'
                'Fevereiro'
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro '
                'Outubro'
                'Novembro'
                'Dezembro')
            end
            object spedAnoCob: TSpinEdit
              Left = 135
              Top = 14
              Width = 70
              Height = 22
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 1998
            end
          end
        end
        object grpContrib: TGroupBox
          Left = 8
          Top = 294
          Width = 248
          Height = 44
          Caption = 'Contribuição'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          object dblkpcmbContribuicao: TwwDBLookupCombo
            Left = 9
            Top = 18
            Width = 228
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Contribuição')
            LookupTable = qryContribuicao
            LookupField = 'IDCONTRIBUICAO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object rgrpOpcoes: TRadioGroup
          Left = 267
          Top = 7
          Width = 237
          Height = 208
          Caption = 'Opções'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Contribuição x Nº de Divergências'
            'Mês x Nº de Divergências'
            'Plano x Nº de Divergências'
            'Patrocinadora x Nº de Divergências')
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          TabStop = True
          OnClick = rgrpOpcoesClick
        end
        object rdgrgraf: TRadioGroup
          Left = 267
          Top = 220
          Width = 238
          Height = 118
          Caption = 'Gráfico'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Pizza'
            'Barras'
            'Área')
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          TabStop = True
        end
        object rdgrpmodo: TRadioGroup
          Left = 513
          Top = 7
          Width = 223
          Height = 331
          Caption = 'Modo de  Apresentação'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Tópico e Valor'
            'Tópico e Porcentagem do total'
            'Tópico'
            'Tópico e Porcentagem'
            'Legenda'
            'Porcentagem'
            'Porcentagem do Total'
            'Valor'
            'Outro')
          ParentColor = False
          ParentFont = False
          TabOrder = 5
          TabStop = True
        end
      end
      object tbsGrafico: TTabSheet
        Caption = 'Gráfico  '
        object DBChart1: TDBChart
          Left = 0
          Top = 73
          Width = 744
          Height = 273
          AllowPanning = pmNone
          AllowZoom = False
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Color = clSilver
          BackWall.Pen.Visible = False
          BottomWall.Color = 4227327
          Gradient.Direction = gdRightLeft
          Gradient.EndColor = clGray
          MarginBottom = 15
          MarginLeft = 5
          MarginRight = 10
          MarginTop = 20
          Title.AdjustFrame = False
          Title.Brush.Style = bsHorizontal
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = 'Bookman Old Style'
          Title.Font.Style = [fsItalic]
          Title.Frame.Style = psDashDotDot
          Title.Frame.Visible = True
          Title.Text.Strings = (
            '')
          Title.Visible = False
          AxisVisible = False
          BackColor = clSilver
          Chart3DPercent = 10
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.DateTimeFormat = 'hh:mm'
          LeftAxis.ExactDateTime = False
          LeftAxis.Title.Angle = 270
          Legend.Alignment = laLeft
          Legend.ColorWidth = 25
          Legend.Inverted = True
          Legend.TextStyle = ltsPlain
          Legend.TopPos = 4
          Legend.Visible = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          object rot: TBitBtn
            Left = 654
            Top = 234
            Width = 82
            Height = 29
            Caption = 'Rotação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = RotClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
              3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
              700077337F3333373777887007333337007733F773F333337733700070333333
              077037773733333F7F37703707333300080737F373333377737F003333333307
              78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
              078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
              70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
              3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
              33337F73FF737773333307800077033333337337773373333333}
            NumGlyphs = 2
          end
          object Series1: TPieSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = True
            DataSource = qryGrafico
            SeriesColor = clRed
            XLabelsSource = 'COUNT(PA.IDPESSOA)'
            CustomXRadius = 125
            CustomYRadius = 95
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'TEMPO'
          end
          object Series2: TBarSeries
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Style = smsLabelValue
            Marks.Visible = True
            DataSource = qryGrafico
            SeriesColor = clNavy
            ShowInLegend = False
            XLabelsSource = 'NOME'
            BarStyle = bsRectGradient
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'COUNT(PA.IDPESSOA)'
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'COUNT(PA.IDPESSOA)'
          end
          object Series3: TAreaSeries
            ColorEachPoint = True
            Marks.ArrowLength = 8
            Marks.Visible = True
            DataSource = qryGrafico
            SeriesColor = clGreen
            ShowInLegend = False
            XLabelsSource = 'NOME'
            DrawArea = True
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'COUNT(PA.IDPESSOA)'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'COUNT(PA.IDPESSOA)'
          end
        end
        object TPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 73
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object lblPatro: TLabel
            Left = 111
            Top = 21
            Width = 44
            Height = 13
            Caption = 'lblPatro'
          end
          object lblPlano: TLabel
            Left = 111
            Top = 54
            Width = 46
            Height = 13
            Caption = 'lblPlano'
          end
          object lblMesReferencia: TLabel
            Left = 375
            Top = 21
            Width = 99
            Height = 13
            Caption = 'lblMesReferencia'
          end
          object lblMesCobranca: TLabel
            Left = 375
            Top = 54
            Width = 91
            Height = 13
            Caption = 'lblMesCobranca'
          end
          object lblContribuicao: TLabel
            Left = 534
            Top = 21
            Width = 85
            Height = 13
            Caption = 'lblContribuicao'
          end
          object Label3: TLabel
            Left = 111
            Top = 6
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label4: TLabel
            Left = 111
            Top = 39
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label6: TLabel
            Left = 375
            Top = 6
            Width = 108
            Height = 13
            Caption = 'Mês de Referência'
          end
          object Label7: TLabel
            Left = 375
            Top = 39
            Width = 100
            Height = 13
            Caption = 'Mês de Cobrança'
          end
          object Label8: TLabel
            Left = 534
            Top = 6
            Width = 72
            Height = 13
            Caption = 'Contribuição'
          end
          object StaticText2: TStaticText
            Left = 7
            Top = 3
            Width = 75
            Height = 27
            Caption = 'Opções '
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 758
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 588
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 420
      DockPos = 420
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Atualizar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Imprimir'
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA , NOME  '
      'FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 217
    Top = 20
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  nome, idplanoprev   from  planprev '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 293
    Top = 18
  end
  object qryGrafico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  COUNT(PA.IDPESSOA), TRUNC(MONTHS_BETWEEN(TO_DATE('#39'15/12/' +
        '2000'#39','#39'DD/MM/YYYY'#39'),PA.DATAENTRADA),0) TEMPO '
      ',PLANASS.NOME'
      'FROM PLANASS , PARTASS PA'
      'WHERE PLANASS.IDPLANASS = PA.IDPLANASS '
      
        'GROUP BY TRUNC(MONTHS_BETWEEN(TO_DATE('#39'15/12/2000'#39','#39'DD/MM/YYYY'#39')' +
        ',PA.DATAENTRADA),0) ,PLANASS.NOME')
    ValidateWithMask = True
    Left = 664
    Top = 22
  end
  object dsGrafico: TwwDataSource
    DataSet = qryGrafico
    Left = 617
    Top = 65532
  end
  object Timer1: TTimer
    Left = 491
    Top = 65532
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO,NOME '
      'FROM CONTRIBUICAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 439
    Top = 23
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME '
      'FROM PLANASS')
    ValidateWithMask = True
    Left = 472
    Top = 104
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM PESSOA '
      'WHERE IDPESSOA IN'
      '( SELECT IDFILIALPESSOA FROM FILIALPESSOA)')
    ValidateWithMask = True
    Left = 263
    Top = 94
  end
end
