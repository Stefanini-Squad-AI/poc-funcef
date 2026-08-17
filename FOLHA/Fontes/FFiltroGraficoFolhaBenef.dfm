inherited FrmFiltroGraficoFolhaBenef: TFrmFiltroGraficoFolhaBenef
  Left = 198
  Top = 166
  HelpContext = 180048
  Caption = 'Filtro do Gráfico de % por tipo de Benefício por Folha'
  ClientHeight = 274
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 235
    inherited RdoTipoFolha: TRadioGroup
      Top = 198
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Top = 6
      Width = 393
    end
    inherited PnlPreviaouEfetivada: TPanel
      Top = 42
      inherited PnlLoteouVersao: TPanel
        inherited dblkLoteouVersao: TwwDBLookupCombo
          ControlInfoInDataset = False
        end
      end
    end
    object Panel1: TPanel
      Left = 8
      Top = 136
      Width = 395
      Height = 89
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label2: TLabel
        Left = 8
        Top = 59
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object dblkPlano: TwwDBLookupCombo
        Left = 96
        Top = 51
        Width = 284
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = qryPLano
        LookupField = 'IDPLANOPREV'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblkPatro: TwwDBLookupCombo
        Left = 96
        Top = 15
        Width = 284
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 235
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 264
    Top = 13
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 152
    Top = 5
  end
  object qryPLano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDPLANOPREV,'
      ' NOME '
      'FROM PLANPREV '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 240
    Top = 184
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PT.IDPESSOA,'
      '  P.NOME'
      'FROM PATRO PT, PESSOA P'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 248
    Top = 120
  end
  object QrGraficoBenefFolha: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 168
    Top = 80
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand31: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = 'Gráfico de % por tipo de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 61383
        mmTop = 35719
        mmWidth = 69321
        BandType = 0
      end
      object ppLine80: TppLine
        UserName = 'Line80'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 795
        mmTop = 41010
        mmWidth = 196058
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'DBImage7'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmRelFolha.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'NOME'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText101'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'CEP'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 20638
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 264
        mmTop = 30427
        mmWidth = 196058
        BandType = 0
      end
    end
    object ppDetailBand32: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 170657
      mmPrintPosition = 0
      object ppDPTeeChart2: TppDPTeeChart
        UserName = 'DPTeeChart2'
        mmHeight = 127265
        mmLeft = 9790
        mmTop = 32808
        mmWidth = 177271
        BandType = 4
        object ppDPTeeChartControl2: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Text.Strings = (
            '   ')
          Legend.Alignment = laBottom
          BevelOuter = bvNone
          Color = clWhite
          object Series2: TBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = ppGraficoBenefFolha
            SeriesColor = clRed
            XLabelsSource = 'BENEFICIO'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VALOR'
          end
        end
      end
      object ppLabel117: TppLabel
        UserName = 'Label117'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 2381
        mmWidth = 26194
        BandType = 4
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        Caption = 'Plano: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 7144
        mmWidth = 11906
        BandType = 4
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = 'Benefício X Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 35719
        mmWidth = 43392
        BandType = 4
      end
      object ppLine81: TppLine
        UserName = 'Line81'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 795
        mmTop = 17992
        mmWidth = 196058
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        OnGetText = ppLabel1GetText
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 11906
        mmWidth = 11377
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        OnGetText = ppLabel2GetText
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 38894
        mmTop = 2381
        mmWidth = 11377
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        OnGetText = ppLabel3GetText
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 7144
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand31: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel100: TppLabel
        UserName = 'Label100'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmTop = 1058
        mmWidth = 197381
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
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
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 529
        mmTop = 265
        mmWidth = 197381
        BandType = 8
      end
    end
  end
  object DsGraficoBenefFolha: TwwDataSource
    DataSet = qryGraficoBenefFolha
    Left = 72
    Top = 176
  end
  object qryGraficoBenefFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PATRO.NOME           AS PATRO,'
      '  PP.NOME              AS PLANO,'
      '  BN.NOME              AS BENEFICIO,'
      '  COUNT(HST.IDRUBRICA) AS QTDE,'
      '  SUM(VLBENEFPGTO)     AS VALOR'
      
        'FROM HISTRUBSAL HST, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV P' +
        'P, PESSOA PATRO, HSTBENEFBFCIARIO HBF '
      'WHERE'
      ' hst.idhstfolhabenef = 2019                AND'
      ' hst.idmodulo        = 18                  AND'
      ' BPP.IDRUBRICA       = HST.IDRUBRICA       AND'
      ' BPP.IDBENEFICIO     = BN.IDBENEFICIO      AND'
      ' PP.IDPLANOPREV      = BPP.IDPLANOPREV     AND'
      ' HBF.idhstfolhabenef = HST.idhstfolhabenef AND'
      ' HBF.IDTITULAR       = HST.IDTITULAR       AND'
      ' HBF.IDPESSOA        = HST.IDPESSOA        AND'
      ' HBF.IDPLANOPREV     = BPP.IDPLANOPREV     AND'
      ' HBF.IDBENEFICIO     = BPP.IDBENEFICIO     AND'
      ' PATRO.IDPESSOA      = HBF.IDPESSJUR '
      ''
      'GROUP BY BN.NOME, PP.NOME, PATRO.NOME'
      'ORDER BY BN.NOME  ')
    ValidateWithMask = True
    Left = 48
    Top = 80
  end
  object ppGraficoBenefFolha: TppBDEPipeline
    DataSource = DsGraficoBenefFolha
    UserName = 'GraficoBenefFolha'
    Left = 88
    Top = 160
    object ppGraficoBenefFolhappField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppGraficoBenefFolhappField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppGraficoBenefFolhappField3: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppGraficoBenefFolhappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppGraficoBenefFolhappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
end
