inherited frmConsEstatMassa: TfrmConsEstatMassa
  Left = 14
  Top = 101
  Caption = 'Consulta de Estatística de Massa'
  ClientHeight = 430
  ClientWidth = 749
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
    Width = 749
    Height = 31
    BevelInner = bvNone
    BevelOuter = bvNone
    object Panel1: TPanel
      Left = 3
      Top = 3
      Width = 743
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      TabOrder = 0
      object pnlcoment: TPanel
        Left = 2
        Top = 2
        Width = 739
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
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 31
    Width = 749
    Height = 360
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Seleção '
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 741
        Height = 332
        Align = alClient
        Caption = 'Seleção '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 11
          Top = 21
          Width = 319
          Height = 173
          Caption = 'Geral '
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = 16
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
            Top = 94
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
          object Label3: TLabel
            Left = 10
            Top = 133
            Width = 88
            Height = 13
            Caption = 'Plano Assistencial '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label29: TLabel
            Left = 10
            Top = 55
            Width = 20
            Height = 13
            Caption = 'Filial'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 10
            Top = 31
            Width = 284
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qrypatro
            LookupField = 'IDPESSOA'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = wwDBLookupCombo1Enter
          end
          object wwDBLookupCombo2: TwwDBLookupCombo
            Left = 10
            Top = 108
            Width = 284
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'NOME')
            LookupTable = qryplano
            LookupField = 'IDPLANOPREV'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = wwDBLookupCombo2Enter
          end
          object wwDBLookupCombo3: TwwDBLookupCombo
            Left = 10
            Top = 147
            Width = 284
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            LookupTable = qryplanass
            LookupField = 'IDPLANASS'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = wwDBLookupCombo3Enter
          end
          object cmbfilial: TwwDBLookupCombo
            Left = 10
            Top = 70
            Width = 284
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryfilial
            LookupField = 'IDPESSOA'
            ParentFont = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnEnter = cmbfilialEnter
          end
        end
        object GroupBox4: TGroupBox
          Left = 11
          Top = 195
          Width = 181
          Height = 129
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label10: TLabel
            Left = 11
            Top = 88
            Width = 68
            Height = 13
            Caption = 'Faixa Salarial  '
          end
          object Label9: TLabel
            Left = 9
            Top = 47
            Width = 90
            Height = 13
            Caption = 'Tempo de Adesão '
          end
          object Label4: TLabel
            Left = 10
            Top = 7
            Width = 58
            Height = 13
            Caption = 'Faixa Etária '
          end
          object EditNum1: TEditNum
            Left = 9
            Top = 103
            Width = 83
            Height = 21
            TabOrder = 4
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object EditNum2: TEditNum
            Left = 89
            Top = 103
            Width = 83
            Height = 21
            TabOrder = 5
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object EditNum3: TEditNum
            Left = 10
            Top = 63
            Width = 73
            Height = 21
            TabOrder = 2
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object EditNum4: TEditNum
            Left = 10
            Top = 23
            Width = 73
            Height = 21
            TabOrder = 0
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object EditNum5: TEditNum
            Left = 82
            Top = 23
            Width = 73
            Height = 21
            TabOrder = 1
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object EditNum6: TEditNum
            Left = 82
            Top = 63
            Width = 73
            Height = 21
            TabOrder = 3
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
        end
        object RadioGroup2: TRadioGroup
          Left = 352
          Top = 24
          Width = 136
          Height = 300
          Caption = 'Opções'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Faixa Etária'
            'Tempo de Adesão'
            'Faixa Salarial'
            'Sexo'
            'Localidade'
            'Plano '
            'Patrocinadora')
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          TabStop = True
        end
        object rdgrpmodo: TRadioGroup
          Left = 509
          Top = 24
          Width = 207
          Height = 300
          Caption = 'Modo de  Apresentação'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          TabOrder = 4
          TabStop = True
        end
        object rdgrgraf: TRadioGroup
          Left = 195
          Top = 195
          Width = 135
          Height = 129
          Caption = 'Gráfico'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          TabOrder = 2
          TabStop = True
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gráfico  '
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 741
        Height = 332
        AllowPanning = pmNone
        AllowZoom = False
        AnimatedZoom = True
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        BottomWall.Color = 4227327
        Gradient.Direction = gdRightLeft
        Gradient.EndColor = clGray
        Gradient.Visible = True
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
        Color = 16384
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object rot: TBitBtn
          Left = 657
          Top = 293
          Width = 75
          Height = 25
          Caption = 'Rotação'
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
          Marks.Style = smsLabelValue
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
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 579
      DockPos = 579
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 411
      DockPos = 411
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
      'SELECT PJ.IDPESSOA, PJ.NOME'
      'FROM PESSOA PJ, PATRO PT'
      'WHERE PJ.IDPESSOA=PT.IDPESSOA'
      'ORDER BY PJ.NOME'
      '')
    ValidateWithMask = True
    Left = 224
    Top = 74
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 176
    Top = 66
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME'
      'FROM PLANASS '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 298
    Top = 70
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 272
    Top = 80
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  nome, idplanoprev   from  planprev '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 300
    Top = 108
  end
  object dsplano: TwwDataSource
    DataSet = qryplano
    Left = 329
    Top = 81
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
    Top = 65534
  end
  object dsGrafico: TwwDataSource
    DataSet = qryGrafico
    Left = 656
    Top = 38
  end
  object Timer1: TTimer
    Left = 283
    Top = 154
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME '
      'FROM PESSOA WHERE '
      'IDPESSOA IN'
      '(SELECT IDFILIALPESSOA  FROM '
      'FILIALPESSOA)')
    ValidateWithMask = True
    Left = 255
    Top = 113
  end
end
