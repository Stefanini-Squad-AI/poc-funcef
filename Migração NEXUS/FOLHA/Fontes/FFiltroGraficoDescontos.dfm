inherited FrmFiltroGraficoDescontos: TFrmFiltroGraficoDescontos
  Left = 233
  Top = 172
  HelpContext = 180049
  Caption = 
    'Filtro do Gráfico de Descontos da Folha de Benefícios por Rubric' +
    'a'
  ClientHeight = 222
  ClientWidth = 453
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 453
    Height = 183
    inherited RdoTipoFolha: TRadioGroup
      Top = 229
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Left = 30
      Top = 11
    end
    inherited PnlPreviaouEfetivada: TPanel
      Left = 30
      Top = 54
    end
  end
  inherited Dock971: TDock97
    Top = 183
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 283
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 116
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 320
    Top = 141
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 248
    Top = 141
  end
  object qryDescontosFolha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' HST.MESCOBRANCA,'
      ' NVL(BN.NOME, PVD.DESCRICAO) AS DESCONTO,'
      ' COUNT(*) AS QTDE,'
      
        ' SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS VAL' +
        'OR,'
      ' 0 AS PERCENTO'
      
        'FROM HISTRUBSAL HST, PROVDESC PVD, BENEFPLANPREV BPP, BENEFICIO ' +
        'BN'
      'WHERE'
      '      HST.MESCOBRANCA = '#39'2002/05'#39'  AND '
      '      HST.VALORPROVENTO > 0                AND'
      '      PVD.IDPROVENTO   = HST.IDRUBRICA     AND'
      '      BPP.IDRUBRICA(+) = HST.IDRUBRICA     AND'
      '      BPP.IDBENEFICIO  = BN.IDBENEFICIO(+) AND'
      '      HST.IDMODULO IN (16, 18)             AND '
      '      PVD.FLGDESCONTO  = 1'
      'GROUP BY HST.MESCOBRANCA, BN.NOME, PVD.DESCRICAO'
      'ORDER BY VALOR DESC')
    UpdateObject = UpdDescontosFolha
    ValidateWithMask = True
    Left = 264
    Top = 16
    object qryDescontosFolhaMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryDescontosFolhaDESCONTO: TStringField
      FieldName = 'DESCONTO'
      Size = 130
    end
    object qryDescontosFolhaQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryDescontosFolhaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDescontosFolhaPERCENTO: TFloatField
      FieldName = 'PERCENTO'
    end
  end
  object DsDescontosFolha: TwwDataSource
    DataSet = qryDescontosFolha
    Left = 336
    Top = 16
  end
  object ppDescontosFolha: TppBDEPipeline
    DataSource = DsDescontosFolha
    UserName = 'DescontosFolha'
    Left = 144
    Top = 136
    object ppDescontosFolhappField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDescontosFolhappField2: TppField
      FieldAlias = 'DESCONTO'
      FieldName = 'DESCONTO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 1
    end
    object ppDescontosFolhappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDescontosFolhappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDescontosFolhappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTO'
      FieldName = 'PERCENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object UpdDescontosFolha: TUpdateSQL
    Left = 160
    Top = 16
  end
  object RpDescontosFolha: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    Left = 56
    Top = 128
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 529
        mmTop = 33073
        mmWidth = 283369
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo de Descontos da Folha de Benefícios por Rubrica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 88636
        mmTop = 36777
        mmWidth = 131234
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
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
      object ppDBText52: TppDBText
        UserName = 'DBText52'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
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
      object ppDBText50: TppDBText
        UserName = 'DBText50'
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
      object ppDBText49: TppDBText
        UserName = 'DBText49'
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
      object ppDBText48: TppDBText
        UserName = 'DBText48'
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 130440
      mmPrintPosition = 0
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 117740
        mmLeft = 13494
        mmTop = 5556
        mmWidth = 258763
        BandType = 4
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Gráfico Percentual do Total X Rubrica'
            '')
          LeftAxis.AxisValuesFormat = '##0.## %'
          Legend.Alignment = laBottom
          BevelOuter = bvNone
          Color = clWhite
          object Series1: TBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = ppDescontosFolha
            SeriesColor = clRed
            ValueFormat = '##0.## %'
            XLabelsSource = 'DESCONTO'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'PERCENTO'
          end
        end
      end
      object LbRef: TppLabel
        UserName = 'LbRef'
        OnGetText = LbRefGetText
        Caption = 'Mês de Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
        mmWidth = 283635
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
        mmWidth = 283635
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
        mmLeft = 257705
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 265
        mmTop = 529
        mmWidth = 283635
        BandType = 8
      end
    end
  end
end
