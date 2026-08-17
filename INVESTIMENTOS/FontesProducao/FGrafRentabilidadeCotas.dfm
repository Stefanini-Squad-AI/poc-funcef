inherited frmGrafRentabilidadeCotas: TfrmGrafRentabilidadeCotas
  Left = 4
  Top = 33
  Caption = 'Rentabilidade de Cotas'
  ClientHeight = 551
  ClientWidth = 800
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 512
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 73
      Align = alTop
      TabOrder = 0
      object Label7: TLabel
        Left = 338
        Top = 13
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 533
        Top = 13
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object GroupBox1: TGroupBox
        Left = 7
        Top = 4
        Width = 321
        Height = 59
        Caption = 'Período'
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 26
          Width = 34
          Height = 13
          Caption = 'Início'
        end
        object Label2: TLabel
          Left = 181
          Top = 26
          Width = 20
          Height = 13
          Caption = 'Fim'
        end
        object dDataInicio: TCMDateTimePicker
          Left = 54
          Top = 22
          Width = 107
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
          OnExit = dDataInicioExit
        end
        object dDataFim: TCMDateTimePicker
          Left = 207
          Top = 22
          Width = 107
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
          TabOrder = 1
          OnExit = dDataFimExit
        end
      end
      object DblTipoFundo: TwwDBLookupCombo
        Left = 338
        Top = 28
        Width = 184
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblGestorCarteira: TwwDBLookupCombo
        Left = 533
        Top = 28
        Width = 251
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = qryGestorCart
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 74
      Width = 798
      Height = 437
      Align = alClient
      TabOrder = 1
      object DecisionGraphRent: TDecisionGraph
        Left = 1
        Top = 1
        Width = 796
        Height = 435
        DecisionSource = DecisionSourceRent
        AnimatedZoom = True
        AnimatedZoomSteps = 9
        BottomWall.Color = 16773849
        BottomWall.Size = 4
        Gradient.EndColor = clWhite
        Gradient.StartColor = clSilver
        Gradient.Visible = True
        LeftWall.Brush.Color = clWhite
        LeftWall.Color = 16773589
        LeftWall.Size = 3
        MarginBottom = 5
        MarginLeft = 10
        MarginRight = 5
        MarginTop = 10
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clYellow
        Title.Font.Height = -9
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Title.Text.Strings = (
          ''
          '')
        Title.Visible = False
        BackColor = clBlue
        LeftAxis.AxisValuesFormat = '#,##0.###%'
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.LabelsSeparation = 40
        LeftAxis.LabelStyle = talValue
        LeftAxis.RoundFirstLabel = False
        LeftAxis.Title.Angle = 180
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laBottom
        Legend.ColorWidth = 5
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.ShadowColor = clGray
        Legend.ShadowSize = 14
        Legend.TextStyle = ltsPlain
        Legend.TopPos = 0
        Legend.VertMargin = 31
        RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
        RightAxis.LabelsFont.Color = clBlack
        RightAxis.LabelsFont.Height = -11
        RightAxis.LabelsFont.Name = 'Arial'
        RightAxis.LabelsFont.Style = [fsBold]
        RightAxis.LabelsSeparation = 30
        RightAxis.LabelStyle = talValue
        RightAxis.Title.Font.Charset = DEFAULT_CHARSET
        RightAxis.Title.Font.Color = clBlue
        RightAxis.Title.Font.Height = -11
        RightAxis.Title.Font.Name = 'Arial'
        RightAxis.Title.Font.Style = [fsBold]
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
        Align = alClient
        BevelOuter = bvNone
        BevelWidth = 3
        BorderWidth = 3
        TabOrder = 0
        object Series2: TBarSeries
          Active = False
          ColorEachPoint = True
          HorizAxis = aTopAxis
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          PercentFormat = '#,###0.####%'
          SeriesColor = clRed
          Title = '1D Template: FUNDOS'
          ValueFormat = '#,###0.####%'
          VertAxis = aRightAxis
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = '1D Template: FUNDOS'
          Style = 56
        end
        object Series3: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: FUNDOS'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: FUNDOS'
          Style = 61
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 512
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 242
      end
      inherited bbtnSair: TBitBtn
        Left = 161
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 244
      end
      object bt_Imprime: TBitBtn
        Left = 80
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
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
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 3
        OnClick = bbtnConfirmarClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 683
    Top = 267
  end
  object DecisionQueryRent: TDecisionQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.DESCFUNDOINVEST FUNDOS,'
      
        '       SUM((C.VLRCOTA/DECODE(CI.VLRCOTA,0,1,CI.VLRCOTA)-1)*100) ' +
        'PERCENTUAL'
      'FROM'
      
        '     (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_C' +
        'HAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      '           WHERE DTAVIGENCIA < TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')+1'
      '           GROUP BY IDFUNDOINVEST))) F,'
      ''
      '     COTAFUNDO C, TIPOFUNDOINVEST T,'
      ''
      '     (SELECT IDFUNDOINVEST,SUM(VLRCOTA) VLRCOTA'
      '      FROM   COTAFUNDO'
      '      WHERE  DATACOTA = TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')'
      '      GROUP BY IDFUNDOINVEST) CI,'
      ''
      '     (SELECT DISTINCT IDFUNDOINVEST'
      '      FROM HISTFUNDO H1'
      '      WHERE (H1.IDHISTFUNDO  IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM   HISTFUNDO'
      '                WHERE  (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      
        '                  AND  (DATAMOVFUNDO      = TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                  AND ((DATAMOVFUNDO      < TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39')) OR (IDHISTFUNDO < 999999999))'
      '                  AND  (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO )) AND'
      '            (H1.SALDOQTDCOTAS > 0) ) FS'
      'WHERE'
      
        '       (((:IDGESTORCARTEIRA IS NOT NULL)                        ' +
        ' AND'
      
        '        (F.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))              ' +
        ' OR'
      
        '         (:IDGESTORCARTEIRA IS NULL) )                          ' +
        ' AND'
      ''
      
        '       (((:IDTIPOFUNDOINVEST IS NOT NULL)                       ' +
        ' AND'
      
        '        (F.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             ' +
        ' OR'
      
        '         (:IDTIPOFUNDOINVEST IS NULL) )                         ' +
        ' AND'
      ''
      
        '        (T.IDTIPOINVEST       = :IDTIPOINVEST)                  ' +
        ' AND'
      ''
      '        (C.DATACOTA  IN'
      '            (SELECT MAX(DATACOTA)'
      '             FROM   COTAFUNDO'
      
        '             WHERE DATACOTA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) ' +
        ' AND'
      
        '        (F.IDFUNDOINVEST      = FS.IDFUNDOINVEST)               ' +
        ' AND'
      
        '        (F.IDTIPOFUNDOINVEST  = T.IDTIPOFUNDOINVEST)            ' +
        ' AND'
      
        '        (C.IDFUNDOINVEST      = F.IDFUNDOINVEST)                ' +
        ' AND'
      '      ( CI.IDFUNDOINVEST      = F.IDFUNDOINVEST)'
      'GROUP BY F.DESCFUNDOINVEST'
      'ORDER BY F.DESCFUNDOINVEST'
      ''
      ''
      ' ')
    Left = 317
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
        Value = '03/11/2003'
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
        Value = '03/10/2003'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = '5'
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
  end
  object DecisionCubeRent: TDecisionCube
    DataSet = DecisionQueryRent
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'FUNDOS'
        BaseName = 'FUNDOINVEST.DESCFUNDOINVEST'
        Name = 'FUNDOS'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 8
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'PERCENTUAL'
        BaseName = 'COTAFUNDO.VLRCOTA'
        Name = 'PERCENTUAL'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 55
    Left = 317
    Top = 277
  end
  object DecisionSourceRent: TDecisionSource
    DecisionCube = DecisionCubeRent
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 317
    Top = 333
    DimensionCount = 1
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1)
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOFUNDOINVEST'
      'ORDER BY DESCTIPOFUNDOINV')
    ValidateWithMask = True
    Left = 215
    Top = 89
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT G.IdGestorCarteira , P.IdPessoa, P.Nome'
      'FROM Pessoa P, GestorCarteira G, FUNDOINVEST F'
      'WHERE P.IdPessoa = G.IdGestorCarteira AND'
      '      G.IdGestorCarteira(+) = F.IdGestorCarteira'
      'ORDER BY P.Nome'
      ' ')
    ValidateWithMask = True
    Left = 308
    Top = 90
    object qryGestorCartNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryGestorCartIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'GESTORCARTEIRA.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object QryFundoInvestOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP'
      'FROM'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY' +
        #39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,'
      '  TIPOFUNDOINVEST TFI'
      
        'WHERE (((:IDGESTORCARTEIRA IS NOT NULL)                        A' +
        'ND'
      
        '        (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))           O' +
        'R'
      '        (:IDGESTORCARTEIRA IS NULL) )'
      
        '  AND (((:IDTIPOFUNDOINVEST IS NOT NULL)                       A' +
        'ND'
      
        '        (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))          O' +
        'R'
      '        (:IDTIPOFUNDOINVEST IS NULL))'
      
        '  AND (((:IDTIPOINVEST <> 0)                                   A' +
        'ND'
      
        '        (TFI.IDTIPOINVEST = :IDTIPOINVEST))                    O' +
        'R'
      '        (:IDTIPOINVEST = 0))'
      '  AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 63
    Top = 83
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestOperacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestOperacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestOperacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestOperacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestOperacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestOperacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestOperacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestOperacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
  end
end
