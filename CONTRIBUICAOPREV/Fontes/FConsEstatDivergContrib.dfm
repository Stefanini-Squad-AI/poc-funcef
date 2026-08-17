inherited frmConsEstatDivergContrib: TfrmConsEstatDivergContrib
  Left = 11
  Top = 49
  HelpContext = 160051
  Caption = 'Consulta de Estatística de Massa'
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
    object pnlForaComent: TPanel
      Left = 1
      Top = 1
      Width = 756
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object pnlcoment: TPanel
        Left = 2
        Top = 2
        Width = 752
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
      Left = 1
      Top = 29
      Width = 756
      Height = 378
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
          Top = 23
          Width = 248
          Height = 101
          Caption = 'Geral  '
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = 18
            Width = 84
            Height = 13
            Caption = 'Patrocinadora '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 9
            Top = 57
            Width = 122
            Height = 13
            Caption = 'Plano Previdenciário '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkpcmbPatro: TwwDBLookupCombo
            Left = 10
            Top = 33
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
            Top = 72
            Width = 228
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
        end
        object grpMeses: TGroupBox
          Left = 8
          Top = 137
          Width = 248
          Height = 125
          Caption = 'Meses'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object grpMesAnoRef: TGroupBox
            Left = 9
            Top = 15
            Width = 226
            Height = 46
            Caption = 'Mês e Ano de Referência'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
              Text = 'cmbMesRef'
              Items.Strings = (
                'janeiro'
                'fevereiro'
                'março'
                'abril'
                'maio'
                'junho'
                'julho'
                'agosto'
                'setembro '
                'outubro'
                'novembro'
                'dezembro')
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
            Top = 66
            Width = 226
            Height = 46
            Caption = 'Mês e Ano de Cobrança'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
              Text = 'cmbMesCob'
              Items.Strings = (
                'janeiro'
                'fevereiro'
                'março'
                'abril'
                'maio'
                'junho'
                'julho'
                'agosto'
                'setembro '
                'outubro'
                'novembro'
                'dezembro')
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
          Top = 272
          Width = 248
          Height = 50
          Caption = 'Contribuição'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          Top = 23
          Width = 235
          Height = 182
          Caption = 'Opções'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Contribuição x Nº de Divergências'
            'Mês x Nº de Divergências'
            'Plano x Nº de Divergências'
            'Patrocinadora x Nº de Divergências'
            'Contribuição x Faixa de Valores')
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          TabStop = True
          OnClick = rgrpOpcoesClick
        end
        object rdgrgraf: TRadioGroup
          Left = 267
          Top = 227
          Width = 238
          Height = 95
          Caption = 'Gráfico'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          Top = 23
          Width = 223
          Height = 299
          Caption = 'Modo de  Apresentação'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
            Width = 77
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
      Left = 586
      DockPos = 589
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 417
      DockPos = 420
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Atualizar'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
          000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
          033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
          B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
          C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
          033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
          3000773373FFFF73377733333700073333333333377777333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Imprimir'
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 427
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY P.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 241
    Top = 65524
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  NOME, IDPLANOPREV'
      'FROM  PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO P'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA )'
      ''
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 301
    Top = 65522
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
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
      'SELECT IDCONTRIBUICAO,NOME'
      'FROM CONTRIBUICAO'
      
        'WHERE IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM PLANPREVP' +
        'ATRO PLP, PATRO P, CONTPREV CP'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA'
      '                      AND     CP.IDPLANOPREV = PLP.IDPLANOPREV )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 447
    Top = 65527
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
