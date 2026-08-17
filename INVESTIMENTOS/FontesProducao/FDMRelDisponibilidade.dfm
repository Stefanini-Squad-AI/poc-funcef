inherited DmRelDisponibilidade: TDmRelDisponibilidade
  Left = 325
  Top = 155
  Width = 309
  Height = 284
  Caption = 'DmRelDisponibilidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited rpExemplo: TppReport
    Left = 234
    DataPipelineName = 'pplExemplo'
  end
  object pplSintetica: TppBDEPipeline
    DataSource = dsSintetica
    UserName = 'lSintetica'
    Left = 158
    Top = 86
  end
  object pplAnalitica: TppBDEPipeline
    DataSource = dsAnalitica
    UserName = 'lAnalitica'
    Left = 158
    Top = 137
  end
  object rptDispSintetica: TppReport
    AutoStop = False
    DataPipeline = pplSintetica
    OnStartPage = rptDispSinteticaStartPage
    PassSetting = psTwoPass
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
    Left = 234
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSintetica'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
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
        mmTop = 8731
        mmWidth = 58473
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
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
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object shpDispConCabecalho: TppShape
        UserName = 'shpDispConCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 16404
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
        mmLeft = 2381
        mmTop = 16669
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
        mmLeft = 74613
        mmTop = 16669
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
        mmLeft = 112184
        mmTop = 16669
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
        mmLeft = 146579
        mmTop = 16669
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
        mmTop = 16669
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDispConDetalhe: TppShape
        OnPrint = shpDispConDetalhePrint
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
        DataPipelineName = 'pplSintetica'
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 0
        mmWidth = 66675
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
        DataPipelineName = 'pplSintetica'
        mmHeight = 3704
        mmLeft = 69321
        mmTop = 0
        mmWidth = 27252
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
        DataPipelineName = 'pplSintetica'
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 0
        mmWidth = 32015
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
        DataPipelineName = 'pplSintetica'
        mmHeight = 3704
        mmLeft = 135202
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
        DataPipelineName = 'pplSintetica'
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 0
        mmWidth = 28310
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
  end
  object rptDispAnalitica: TppReport
    AutoStop = False
    DataPipeline = pplAnalitica
    OnStartPage = rptDispAnaliticaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Disponibilidade Financeira Analítica'
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
    Left = 234
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnalitica'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Disponibilidade Financeira Analítica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 64558
        mmTop = 8731
        mmWidth = 73025
        BandType = 0
      end
      object lblDispAnaEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
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
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object shpDispAnaCabecalho: TppShape
        UserName = 'shpDispAnaDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 17198
        mmWidth = 197380
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
        mmLeft = 2910
        mmTop = 17463
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
        mmLeft = 28840
        mmTop = 17463
        mmWidth = 31221
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 17463
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Valor a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 176213
        mmTop = 17463
        mmWidth = 20638
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
        mmWidth = 197300
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
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 0
        mmWidth = 23548
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
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3704
        mmLeft = 28840
        mmTop = 0
        mmWidth = 87842
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VALORARECEBER'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 0
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALORAPAGAR'
        DataPipeline = pplAnalitica
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitica'
        mmHeight = 3704
        mmLeft = 160867
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
        mmWidth = 197300
        BandType = 8
      end
      object lblDispAnaSistema: TppLabel
        OnPrint = LblSistemaPrint
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
    Left = 234
    Top = 184
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSintetica'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label11'
        Caption = 'Gráfico da Disponibilidade Financeira Consolidada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 49742
        mmTop = 8731
        mmWidth = 103188
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
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
        mmTop = 1588
        mmWidth = 28046
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
        OnPrint = LblSistemaPrint
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
  object qrySintetica: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   U.IDPLANOPREV,'
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
      '   PESSOA PT,'
      '   PLANPREVCONTABIL PP,'
      '   ((SELECT'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '       0 AS IDFORCLI,'
      '       0 AS CODDOCUMENTO,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '       '#39#39' AS NODOCUMENTO,'
      '       '#39#39' AS HISTORICOCOMPL,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '       '#39#39' AS CODTIPRECDES,'
      '       R.IDPLANOPREV,'
      '       R.IDPATRO,'
      '       '#39'F'#39' AS RECPAG,'
      '       M.IDPESSOA,'
      '       0 AS CODTIPDOC,'
      '       '#39'I'#39' AS INCLUDISP,'
      '       0 AS IDMODULO,'
      '       0 AS RECEBIMENTO,'
      '       0 AS DESEMBOLSO,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO,'
      '       0 AS SALDOANT'
      '    FROM'
      '       MOVIMFINANC M,'
      '       RATEIOFINANC R'
      '    WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '      AND (M.IDPESSOA = :IDPESSOA)'
      '      AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '      AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '    GROUP BY R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             M.IDPESSOA)'
      ''
      '   UNION ALL'
      ''
      '   (SELECT'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '       0 AS IDFORCLI,'
      '       0 AS CODDOCUMENTO,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '       '#39#39' AS NODOCUMENTO,'
      '       '#39#39' AS HISTORICOCOMPL,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '       '#39#39' AS CODTIPRECDES,'
      '       R.IDPLANOPREV,'
      '       R.IDPATRO,'
      '       '#39'F'#39' AS RECPAG,'
      '       M.IDPESSOA,'
      '       0 AS CODTIPDOC,'
      '       '#39'I'#39' AS INCLUDISP,'
      '       0 AS IDMODULO,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0.00)) AS RECEBIMENTO,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',0.00,R.VALOR*-1)) AS PAGAMENTO,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDO,'
      '       0 AS SALDOANT'
      '    FROM'
      '       MOVIMFINANC M,'
      '       RATEIOFINANC R'
      '    WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '      AND (M.IDPESSOA = :IDPESSOA)'
      '      AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '      AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '    GROUP BY R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             M.IDPESSOA'
      '    )'
      ''
      '   UNION ALL'
      ''
      '   (SELECT'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '       0 AS IDFORCLI,'
      '       0 AS CODDOCUMENTO,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '       '#39#39' AS NODOCUMENTO,'
      '       '#39#39' AS HISTORICOCOMPL,'
      '       TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '       '#39#39' AS CODTIPRECDES,'
      '       R.IDPLANOPREV,'
      '       R.IDPATRO,'
      '       '#39'F'#39' AS RECPAG,'
      '       M.IDPESSOA,'
      '       0 AS CODTIPDOC,'
      '       '#39'I'#39' AS INCLUDISP,'
      '       0 AS IDMODULO,'
      '       0 AS RECEBIMENTO,'
      '       0 AS DESEMBOLSO,'
      '       0 AS SALDO,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT'
      '    FROM'
      '       MOVIMFINANC M,'
      '       RATEIOFINANC R'
      '    WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '      AND (M.IDPESSOA = :IDPESSOA)'
      '      AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '      AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '    GROUP BY R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             M.IDPESSOA'
      '   )'
      ''
      '   UNION ALL'
      ''
      '   (SELECT'
      '       D.DATAPROGRAMADA,'
      '       D.IDFORCLI,'
      '       D.CODDOCUMENTO,'
      '       D.DATAVENCTO,'
      '       DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '       (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOC' +
        'UMENTO,'
      '       L.HISTORICOCOMPL,'
      '       L.DATALANCTO,'
      '       R.CODTIPRECDES,'
      '       R.IDPLANOPREV,'
      '       R.IDPATRO,'
      '       R.RECPAG,'
      '       D.IDPESSOA,'
      '       D.CODTIPDOC,'
      '       '#39'I'#39' AS INCLUDISP,'
      '       D.IDMODULO,'
      
        '       DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(SUM(((R' +
        '.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '       DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(SUM(((R' +
        '.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '       SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '       0 AS SALDOANT'
      '    FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       RATEIODOCUM R,'
      '       (SELECT'
      '           D.CODDOCUMENTO,'
      '           SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS SALDO'
      '        FROM'
      '           DOCUMENTO D,'
      '           LANCTODOCUM L'
      '        WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '        GROUP BY D.CODDOCUMENTO) S'
      '    WHERE'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.OPERACAO = L.OPERACAO)'
      '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '        AND (D.IDPESSOA = :IDPESSOA)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (NVL(L.VALOR,0) <> 0)'
      '        AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '        AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '    GROUP BY'
      '        D.IDFORCLI,'
      '        D.DATAVENCTO,'
      '        D.COMPLDOCUMENTO,'
      '        D.NODOCUMENTO,'
      '        D.DATAPROGRAMADA,'
      '        L.HISTORICOCOMPL,'
      '        L.DATALANCTO,'
      '        R.CODTIPRECDES,'
      '        R.IDPLANOPREV,'
      '        R.IDPATRO,'
      '        R.RECPAG,'
      '        D.IDPESSOA,'
      '        D.OPERACAO,'
      '        D.CODTIPDOC,'
      '        D.IDMODULO,'
      '        D.CODDOCUMENTO)'
      ''
      '   UNION ALL'
      ''
      '   (SELECT'
      '      D.DATAPROGRAMADA,'
      '      D.IDFORCLI,'
      '      D.CODDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '      (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCU' +
        'MENTO,'
      '      L.HISTORICOCOMPL,'
      '      L.DATALANCTO,'
      '      R.CODTIPRECDES,'
      '      R.IDPLANOPREV,'
      '      R.IDPATRO,'
      '      R.RECPAG,'
      '      D.IDPESSOA,'
      '      D.CODTIPDOC,'
      '      '#39'I'#39' AS INCLUDISP,'
      '      D.IDMODULO,'
      
        '      DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))), 1' +
        ',(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS RECEBIMEN' +
        'TO,'
      
        '      DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),-1' +
        ',(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS DESEMBOLS' +
        'O,'
      '      SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO,'
      '      0 AS SALDOANT'
      '    FROM'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      (SELECT'
      '          D.NUMFATURA,'
      
        '          SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS SALDOT' +
        'OT'
      '       FROM'
      '          DOCUMENTO D,'
      '          LANCTODOCUM L'
      '       WHERE'
      '          (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (D.OPERACAO IN ('#39'1 '#39'))'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.RECPAG = '#39'P'#39')'
      '           AND (D.NUMFATURA IS NOT NULL)'
      '       GROUP BY D.NUMFATURA) SS,'
      '       (SELECT'
      '           D.CODDOCUMENTO,'
      
        '           SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS SALDO' +
        'DOC'
      '        FROM'
      '           DOCUMENTO D,'
      '           LANCTODOCUM L'
      '        WHERE'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'3 '#39'))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '        GROUP BY D.CODDOCUMENTO) S,'
      '       (SELECT'
      '           D.NUMFATURA,'
      '           R.CODTIPRECDES,'
      '           R.IDPLANOPREV,'
      '           R.IDPATRO,'
      '           R.IDPESSOA,'
      '           R.RECPAG,'
      '           SUM(R.VALOR) AS VALORRAT'
      '        FROM'
      '           DOCUMENTO D,'
      '           RATEIODOCUM R'
      '        WHERE'
      '           (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '            AND (D.OPERACAO IN ('#39'1 '#39'))'
      '            AND (D.IDPESSOA = :IDPESSOA)'
      '            AND (D.RECPAG = '#39'P'#39')'
      '            AND (D.NUMFATURA IS NOT NULL)'
      '        GROUP BY'
      '            R.CODTIPRECDES,'
      '            R.IDPLANOPREV,'
      '            R.IDPATRO,'
      '            R.IDPESSOA,'
      '            R.RECPAG,'
      '            D.NUMFATURA) R'
      '    WHERE'
      '          (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '      AND (D.OPERACAO = L.OPERACAO)'
      '      AND (D.NUMFATURA = R.NUMFATURA)'
      '      AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '      AND (D.NUMFATURA = SS.NUMFATURA)'
      '      AND (D.IDPESSOA = :IDPESSOA)'
      '      AND (D.RECPAG = '#39'P'#39')'
      '      AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '      AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '      AND (D.OPERACAO IN ('#39'3 '#39'))'
      '      AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '    GROUP BY'
      '      D.IDFORCLI,'
      '      D.DATAVENCTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.NODOCUMENTO,'
      '      D.DATAPROGRAMADA,'
      '      L.HISTORICOCOMPL,'
      '      L.DATALANCTO,'
      '      R.CODTIPRECDES,'
      '      R.IDPLANOPREV,'
      '      R.IDPATRO,'
      '      R.RECPAG,'
      '      D.IDPESSOA,'
      '      D.OPERACAO,'
      '      D.CODTIPDOC,'
      '      D.IDMODULO,'
      '      D.CODDOCUMENTO )) U'
      'WHERE (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '  AND (U.IDPATRO = PT.IDPESSOA(+))'
      '  AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      'GROUP BY'
      '   U.IDPLANOPREV,'
      '   U.IDPATRO,'
      '   PP.NOME,'
      '   PT.NOME'
      ''
      'UNION ALL'
      ''
      'SELECT -1 AS IDPLANOPREV,'
      '       -1 AS IDPATRO,'
      '       '#39'TOTAIS'#39' AS NOMEPLANOPATRO,'
      '       '#39'ZZZZZZ'#39' AS NOMEPLANO,'
      '       '#39'ZZZZZZ'#39' AS NOMEPATRO,'
      '       SUM(SALDOANT) AS SALDOANT,'
      '       SUM(RECEBIMENTOS) AS RECEBIMENTOS,'
      '       SUM(DESEMBOLSOS) AS DESEMBOLSOS,'
      '       SUM(SALDODIA) AS SALDODIA,'
      
        '       (SUM(SALDOANT) + SUM(RECEBIMENTOS) + SUM(DESEMBOLSOS) - (' +
        'SUM(SALDODIA))) AS DIF'
      'FROM (SELECT'
      '         U.IDPLANOPREV,'
      '         U.IDPATRO,'
      '         PP.NOME||'#39' - '#39'||PT.NOME AS NOMEPLANOPATRO,'
      '         PP.NOME AS NOMEPLANO,'
      '         PT.NOME AS NOMEPATRO,'
      '         SUM(U.SALDOANT) AS SALDOANT,'
      '         SUM(U.RECEBIMENTO) AS RECEBIMENTOS,'
      '         SUM(U.DESEMBOLSO) AS DESEMBOLSOS,'
      '         SUM(U.SALDO) AS SALDODIA,'
      
        '         (SUM(U.SALDOANT) + SUM(U.RECEBIMENTO) + SUM(U.DESEMBOLS' +
        'O) - (SUM(U.SALDO))) AS DIF'
      '      FROM'
      '         PESSOA PT,'
      '         PLANPREVCONTABIL PP,'
      '         ('
      ''
      '         (SELECT'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '             0 AS IDFORCLI,'
      '             0 AS CODDOCUMENTO,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '             '#39#39' AS NODOCUMENTO,'
      '             '#39#39' AS HISTORICOCOMPL,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '             '#39#39' AS CODTIPRECDES,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             '#39'F'#39' AS RECPAG,'
      '             M.IDPESSOA,'
      '             0 AS CODTIPDOC,'
      '             '#39'I'#39' AS INCLUDISP,'
      '             0 AS IDMODULO,'
      '             0 AS RECEBIMENTO,'
      '             0 AS DESEMBOLSO,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SAL' +
        'DO,'
      '             0 AS SALDOANT'
      '          FROM'
      '             MOVIMFINANC M,'
      '             RATEIOFINANC R'
      '          WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '          GROUP BY R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   M.IDPESSOA'
      '          )'
      '         UNION ALL'
      '         (SELECT'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '             0 AS IDFORCLI,'
      '             0 AS CODDOCUMENTO,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '             '#39#39' AS NODOCUMENTO,'
      '             '#39#39' AS HISTORICOCOMPL,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '             '#39#39' AS CODTIPRECDES,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             '#39'F'#39' AS RECPAG,'
      '             M.IDPESSOA,'
      '             0 AS CODTIPDOC,'
      '             '#39'I'#39' AS INCLUDISP,'
      '             0 AS IDMODULO,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0.00)) AS RECEBIMEN' +
        'TO,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',0.00,R.VALOR*-1)) AS DESEMB' +
        'OLSO,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SAL' +
        'DO,'
      '             0 AS SALDOANT'
      '          FROM'
      '             MOVIMFINANC M,'
      '             RATEIOFINANC R'
      '          WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '          GROUP BY R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   M.IDPESSOA'
      '          )'
      '         UNION ALL'
      '         (SELECT'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '             0 AS IDFORCLI,'
      '             0 AS CODDOCUMENTO,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '             '#39#39' AS NODOCUMENTO,'
      '             '#39#39' AS HISTORICOCOMPL,'
      '             TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '             '#39#39' AS CODTIPRECDES,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             '#39'F'#39' AS RECPAG,'
      '             M.IDPESSOA,'
      '             0 AS CODTIPDOC,'
      '             '#39'I'#39' AS INCLUDISP,'
      '             0 AS IDMODULO,'
      '             0 AS RECEBIMENTO,'
      '             0 AS DESEMBOLSO,'
      '             0 AS SALDO,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SAL' +
        'DOANT'
      '          FROM'
      '             MOVIMFINANC M,'
      '             RATEIOFINANC R'
      '          WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '            AND (M.IDPESSOA = :IDPESSOA)'
      '            AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '            AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39 +
        '))'
      '          GROUP BY R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   M.IDPESSOA'
      '          )'
      '         UNION ALL'
      '         (SELECT'
      '             D.DATAPROGRAMADA,'
      '             D.IDFORCLI,'
      '             D.CODDOCUMENTO,'
      '             D.DATAVENCTO,'
      
        '             DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO)' +
        ','
      
        '             (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS' +
        ' NODOCUMENTO,'
      '             L.HISTORICOCOMPL,'
      '             L.DATALANCTO,'
      '             R.CODTIPRECDES,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             R.RECPAG,'
      '             D.IDPESSOA,'
      '             D.CODTIPDOC,'
      '             '#39'I'#39' AS INCLUDISP,'
      '             D.IDMODULO,'
      
        '             DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))), 1,(S' +
        'UM(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS RECEBIMENTO,'
      
        '             DECODE(SIGN(SUM(((R.VALOR*S.SALDO)/L.VALOR))),-1,(S' +
        'UM(((R.VALOR*S.SALDO)/L.VALOR))),0.00) AS DESEMBOLSO,'
      '             SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,'
      '             0 AS SALDOANT'
      '          FROM'
      '             DOCUMENTO D,'
      '             LANCTODOCUM L,'
      '             RATEIODOCUM R,'
      '             (SELECT'
      '                 D.CODDOCUMENTO,'
      
        '                 SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS' +
        ' SALDO'
      '              FROM'
      '                 DOCUMENTO D,'
      '                 LANCTODOCUM L'
      '              WHERE'
      '                      (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                  AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                  AND (D.RECPAG = '#39'P'#39')'
      '                  AND (D.IDPESSOA = :IDPESSOA)'
      '                  AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '              GROUP BY D.CODDOCUMENTO) S'
      '          WHERE'
      '             (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      
        '              AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (NVL(L.VALOR,0) <> 0)'
      '              AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '              AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '          GROUP BY'
      '              D.IDFORCLI,'
      '              D.DATAVENCTO,'
      '              D.COMPLDOCUMENTO,'
      '              D.NODOCUMENTO,'
      '              D.DATAPROGRAMADA,'
      '              L.HISTORICOCOMPL,'
      '              L.DATALANCTO,'
      '              R.CODTIPRECDES,'
      '              R.IDPLANOPREV,'
      '              R.IDPATRO,'
      '              R.RECPAG,'
      '              D.IDPESSOA,'
      '              D.OPERACAO,'
      '              D.CODTIPDOC,'
      '              D.IDMODULO,'
      '              D.CODDOCUMENTO)'
      '         UNION ALL'
      '         (SELECT'
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
      
        '            DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT' +
        '))), 1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS REC' +
        'EBIMENTO,'
      
        '            DECODE(SIGN(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT' +
        '))),-1,(SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT))),0.00) AS DES' +
        'EMBOLSO,'
      '            SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO,'
      '            0 AS SALDOANT'
      '         FROM'
      '            DOCUMENTO D,'
      '            LANCTODOCUM L,'
      '            (SELECT'
      '                D.NUMFATURA,'
      
        '                SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS ' +
        'SALDOTOT'
      '             FROM'
      '                DOCUMENTO D,'
      '                LANCTODOCUM L'
      '             WHERE'
      '                (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                 AND (D.OPERACAO = L.OPERACAO)'
      '                 AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                 AND (D.IDPESSOA = :IDPESSOA)'
      '                 AND (D.RECPAG = '#39'P'#39')'
      '                 AND (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA) SS,'
      '             (SELECT'
      '                 D.CODDOCUMENTO,'
      
        '                 SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) AS' +
        ' SALDODOC'
      '              FROM'
      '                 DOCUMENTO D,'
      '                 LANCTODOCUM L'
      '              WHERE'
      '                 (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                  AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                  AND (D.IDPESSOA = :IDPESSOA)'
      '                  AND (D.RECPAG = '#39'P'#39')'
      '                  AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '              GROUP BY D.CODDOCUMENTO) S,'
      '             (SELECT'
      '                 D.NUMFATURA,'
      '                 R.CODTIPRECDES,'
      '                 R.IDPLANOPREV,'
      '                 R.IDPATRO,'
      '                 R.IDPESSOA,'
      '                 R.RECPAG,'
      '                 SUM(R.VALOR) AS VALORRAT'
      '              FROM'
      '                 DOCUMENTO D,'
      '                 RATEIODOCUM R'
      '              WHERE'
      '                 (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                  AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                  AND (D.IDPESSOA = :IDPESSOA)'
      '                  AND (D.RECPAG = '#39'P'#39')'
      '                  AND (D.NUMFATURA IS NOT NULL)'
      '              GROUP BY'
      '                  R.CODTIPRECDES,'
      '                  R.IDPLANOPREV,'
      '                  R.IDPATRO,'
      '                  R.IDPESSOA,'
      '                  R.RECPAG,'
      '                  D.NUMFATURA) R'
      '         WHERE'
      '                 (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '             AND (D.OPERACAO = L.OPERACAO)'
      '             AND (D.NUMFATURA = R.NUMFATURA)'
      '             AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '             AND (D.NUMFATURA = SS.NUMFATURA)'
      '             AND (D.IDPESSOA = :IDPESSOA)'
      '             AND (D.RECPAG = '#39'P'#39')'
      
        '             AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '             AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '             AND (D.OPERACAO IN ('#39'3 '#39'))'
      '             AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '         GROUP BY'
      '             D.IDFORCLI,'
      '             D.DATAVENCTO,'
      '             D.COMPLDOCUMENTO,'
      '             D.NODOCUMENTO,'
      '             D.DATAPROGRAMADA,'
      '             L.HISTORICOCOMPL,'
      '             L.DATALANCTO,'
      '             R.CODTIPRECDES,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             R.RECPAG,'
      '             D.IDPESSOA,'
      '             D.OPERACAO,'
      '             D.CODTIPDOC,'
      '             D.IDMODULO,'
      '             D.CODDOCUMENTO )) U'
      '      WHERE (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '        AND (U.IDPATRO = PT.IDPESSOA(+))'
      '        AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '      GROUP BY'
      '         U.IDPLANOPREV,'
      '         U.IDPATRO,'
      '         PP.NOME,'
      '         PT.NOME)'
      ''
      'ORDER BY NOMEPLANO, NOMEPATRO'
      '')
    ValidateWithMask = True
    Left = 31
    Top = 84
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
        Value = '12/11/2002'
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
        Value = 1
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
      DisplayWidth = 39
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qrySinteticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 19
      FieldName = 'SALDOANT'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySinteticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 13
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySinteticaDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 12
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySinteticaSALDODIA: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 19
      FieldName = 'SALDODIA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qrySinteticaNOMEPLANO: TStringField
      DisplayWidth = 29
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object qrySinteticaNOMEPATRO: TStringField
      DisplayWidth = 11
      FieldName = 'NOMEPATRO'
      Visible = False
      Size = 60
    end
    object qrySinteticaIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qrySinteticaIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object qryAnalitica: TwwQuery
    DatabaseName = 'BaseDados'
    Filter = 
      'IDPLANOPREV = 2 AND IDPATRO = 91008 AND IDPLANOPREV IS NOT NULL ' +
      'AND IDPATRO IS NOT NULL'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  '#39' '#39' AS NODOCUMENTO,'
      '  '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      '  DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) AS VALORAPAGAR,'
      '  DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0)  AS VALORARECEBER,'
      '  IDPLANOPREV,'
      '  IDPATRO,'
      '  1 AS TIPOREG'
      ''
      'FROM (SELECT '#39#39' AS NODOCUMENTO,'
      '             '#39'SALDO INICIAL'#39' AS NOMEFORCLI,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SAL' +
        'DO,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             0 AS IDMODULO'
      '      FROM MOVIMFINANC M, RATEIOFINANC R'
      '      WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        AND (M.IDPESSOA = :IDPESSOA)'
      '        AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '        AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '      GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA )'
      'GROUP BY IDMODULO, IDPLANOPREV, IDPATRO'
      ''
      'UNION'
      ''
      'SELECT'
      '  '#39' '#39' AS NODOCUMENTO,'
      '  '#39'SALDO INICIAL TOTAL'#39' AS NOMEFORCLI,'
      '  DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) AS VALORAPAGAR,'
      '  DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0)  AS VALORARECEBER,'
      '  -1 IDPLANOPREV,'
      '  -1 IDPATRO,'
      '  1 AS TIPOREG'
      ''
      'FROM (SELECT '#39#39' AS NODOCUMENTO,'
      '             '#39'SALDO INICIAL TOTAL'#39' AS NOMEFORCLI,'
      
        '             SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SAL' +
        'DO,'
      '             R.IDPLANOPREV,'
      '             R.IDPATRO,'
      '             0 AS IDMODULO'
      '      FROM MOVIMFINANC M, RATEIOFINANC R'
      '      WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '        AND (M.IDPESSOA = :IDPESSOA)'
      '        AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '        AND (M.DATALANCFINAN < TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '      GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA )'
      ''
      ''
      'UNION'
      ''
      'SELECT'
      '       U.NODOCUMENTO,'
      
        '       DECODE(U.IDFORCLI,-1,'#39'MOVIMENTO FINANCEIRO'#39',P.NOME) AS NO' +
        'MEFORCLI,'
      '       SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) AS VALORAPAGAR,'
      '       SUM(DECODE(SIGN(U.SALDO),1,U.SALDO,0))  AS VALORARECEBER,'
      '       U.IDPLANOPREV,'
      '       U.IDPATRO,'
      '       DECODE(U.IDMODULO,79,2,3) AS TIPOREG'
      
        'FROM PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL PP' +
        ', TIPODOCRECPAG TD, MODULO M,'
      '     ('
      '      (SELECT TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRAMADA,'
      '              -1 AS IDFORCLI,'
      '              0 AS CODDOCUMENTO,'
      '              TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO,'
      '              '#39#39' AS NODOCUMENTO,'
      '              '#39#39' AS HISTORICOCOMPL,'
      '              TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO,'
      '              '#39#39' AS CODTIPRECDES,'
      '              R.IDPLANOPREV,'
      '              R.IDPATRO,'
      '              '#39'F'#39' AS RECPAG,'
      '              M.IDPESSOA,'
      '              0 AS CODTIPDOC,'
      '              '#39'I'#39' AS INCLUDISP,'
      '              0 AS IDMODULO,'
      
        '              SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SA' +
        'LDO'
      '       FROM MOVIMFINANC M, RATEIOFINANC R'
      '       WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '         AND (M.IDPESSOA = :IDPESSOA)'
      '         AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '         AND (M.DATALANCFINAN = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '       GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA )'
      '    UNION ALL'
      '      (SELECT D.DATAPROGRAMADA,'
      '              D.IDFORCLI,'
      '              D.CODDOCUMENTO,'
      '              D.DATAVENCTO,'
      
        '              DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO' +
        '),'
      
        '              (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) A' +
        'S NODOCUMENTO,'
      '              L.HISTORICOCOMPL,'
      '              L.DATALANCTO,'
      '              R.CODTIPRECDES,'
      '              R.IDPLANOPREV,'
      '              R.IDPATRO,'
      '              R.RECPAG,'
      '              D.IDPESSOA,'
      '              D.CODTIPDOC,'
      '              '#39'I'#39' AS INCLUDISP,'
      '              D.IDMODULO,'
      '              SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '       FROM DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDO'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO) S'
      '       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         AND (D.OPERACAO = L.OPERACAO)'
      '         AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '         AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '         AND (D.IDPESSOA = :IDPESSOA)'
      '         AND (D.RECPAG = '#39'P'#39')'
      '         AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '         AND (NVL(L.VALOR,0) <> 0)'
      '         AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '         AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '       GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NO' +
        'DOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO)'
      '    UNION ALL'
      '      (SELECT D.DATAPROGRAMADA,'
      '              D.IDFORCLI,'
      '              D.CODDOCUMENTO,'
      '              D.DATAVENCTO,'
      
        '              DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO' +
        '),'
      
        '              (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) A' +
        'S NODOCUMENTO,'
      '              L.HISTORICOCOMPL,'
      '              L.DATALANCTO,'
      '              R.CODTIPRECDES,'
      '              R.IDPLANOPREV,'
      '              R.IDPATRO,'
      '              R.RECPAG,'
      '              D.IDPESSOA,'
      '              D.CODTIPDOC,'
      '              '#39'I'#39' AS INCLUDISP,'
      '              D.IDMODULO,'
      
        '              SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS SALD' +
        'O'
      '       FROM DOCUMENTO D, LANCTODOCUM L,'
      
        '            (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR' +
        ',L.VALOR*-1)) AS SALDOTOT'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA) SS,'
      
        '            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1)) AS SALDODOC'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO IN ('#39'3 '#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '             GROUP BY D.CODDOCUMENTO) S,'
      
        '            (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, ' +
        'R.IDPATRO, R.IDPESSOA,'
      '                    R.RECPAG, SUM(R.VALOR) AS VALORRAT'
      '             FROM DOCUMENTO D, RATEIODOCUM R'
      '             WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '               AND (D.OPERACAO IN ('#39'1 '#39'))'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = '#39'P'#39')'
      '               AND (D.NUMFATURA IS NOT NULL)'
      
        '             GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, ' +
        'R.IDPESSOA, R.RECPAG, D.NUMFATURA) R'
      '       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         AND (D.OPERACAO = L.OPERACAO)'
      '         AND (D.NUMFATURA = R.NUMFATURA)'
      '         AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '         AND (D.NUMFATURA = SS.NUMFATURA)'
      '         AND (D.IDPESSOA = :IDPESSOA)'
      '         AND (D.RECPAG = '#39'P'#39')'
      '         AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '         AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '         AND (D.OPERACAO IN ('#39'3 '#39'))'
      '         AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '       GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NO' +
        'DOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO )) U'
      'WHERE (U.IDFORCLI = P.IDPESSOA(+))'
      '  AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '  AND (U.IDPATRO = PT.IDPESSOA(+))'
      '  AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '  AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '  AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '  AND (U.IDPESSOA = T.IDPESSOA(+))'
      '  AND (U.RECPAG = T.RECPAG(+))'
      '  AND (U.IDMODULO = M.IDMODULO(+))'
      ''
      'GROUP BY U.NODOCUMENTO,'
      '         DECODE(U.IDFORCLI,-1,'#39'MOVIMENTO FINANCEIRO'#39',P.NOME),'
      '         U.IDPLANOPREV,'
      '         U.IDPATRO,'
      '         U.IDMODULO'
      'UNION'
      ''
      'SELECT'
      '  '#39' '#39' AS NODOCUMENTO,'
      '  '#39'SALDO FINAL'#39' AS NOMEFORCLI,'
      
        '  DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)),-1,(SUM(VAL' +
        'ORARECEBER) + SUM(VALORAPAGAR)),0) AS VALORAPAGAR,'
      
        '  DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)), 1,(SUM(VAL' +
        'ORARECEBER) + SUM(VALORAPAGAR)),0) AS VALORARECEBER,'
      '  IDPLANOPREV,'
      '  IDPATRO,'
      '  4 AS TIPOREG'
      'FROM (SELECT'
      '        U.NODOCUMENTO,'
      '        P.NOME AS NOMEFORCLI,'
      '        DECODE(SIGN(U.SALDO),-1,U.SALDO,0) AS VALORAPAGAR,'
      '        DECODE(SIGN(U.SALDO),1,U.SALDO,0)  AS VALORARECEBER,'
      '        U.IDPLANOPREV,'
      '        U.IDPATRO'
      
        '      FROM PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTA' +
        'BIL PP, TIPODOCRECPAG TD, MODULO M,'
      
        '           ((SELECT TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRA' +
        'MADA,'
      '                    0 AS IDFORCLI,'
      '                    0 AS CODDOCUMENTO,'
      
        '                    TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO' +
        ','
      '                    '#39#39' AS NODOCUMENTO,'
      '                    '#39#39' AS HISTORICOCOMPL,'
      
        '                    TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO' +
        ','
      '                    '#39#39' AS CODTIPRECDES,'
      '                    R.IDPLANOPREV,'
      '                    R.IDPATRO,'
      '                    '#39'F'#39' AS RECPAG,'
      '                    M.IDPESSOA,'
      '                    0 AS CODTIPDOC,'
      '                    '#39'I'#39' AS INCLUDISP,'
      '                    0 AS IDMODULO,'
      
        '                    SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))' +
        ' AS SALDO'
      '             FROM MOVIMFINANC M, RATEIOFINANC R'
      '             WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.IDPESSOA = :IDPESSOA)'
      '               AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '               AND (M.DATALANCFINAN <= TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '             GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA )'
      '           UNION ALL'
      '           (SELECT D.DATAPROGRAMADA,'
      '                   D.IDFORCLI,'
      '                   D.CODDOCUMENTO,'
      '                   D.DATAVENCTO,'
      
        '                   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCU' +
        'MENTO),'
      
        '                   (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENT' +
        'O)) AS NODOCUMENTO,'
      '                   L.HISTORICOCOMPL,'
      '                   L.DATALANCTO,'
      '                   R.CODTIPRECDES,'
      '                   R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   R.RECPAG,'
      '                   D.IDPESSOA,'
      '                   D.CODTIPDOC,'
      '                   '#39'I'#39' AS INCLUDISP,'
      '                   D.IDMODULO,'
      '                   SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                 (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1)) AS SALDO'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      
        '              AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (NVL(L.VALOR,0) <> 0)'
      '              AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '              AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO)'
      '           UNION ALL'
      '           (SELECT D.DATAPROGRAMADA,'
      '                   D.IDFORCLI,'
      '                   D.CODDOCUMENTO,'
      '                   D.DATAVENCTO,'
      
        '                   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCU' +
        'MENTO),'
      
        '                   (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENT' +
        'O)) AS NODOCUMENTO,'
      '                   L.HISTORICOCOMPL,'
      '                   L.DATALANCTO,'
      '                   R.CODTIPRECDES,'
      '                   R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   R.RECPAG,'
      '                   D.IDPESSOA,'
      '                   D.CODTIPDOC,'
      '                   '#39'I'#39' AS INCLUDISP,'
      '                   D.IDMODULO,'
      
        '                   SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS' +
        ' SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L,'
      
        '                 (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.' +
        'VALOR,L.VALOR*-1)) AS SALDOTOT'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                  GROUP BY D.NUMFATURA) SS,'
      
        '                 (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1)) AS SALDODOC'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S,'
      
        '                 (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOP' +
        'REV, R.IDPATRO, R.IDPESSOA,'
      '                         R.RECPAG, SUM(R.VALOR) AS VALORRAT'
      '                  FROM DOCUMENTO D, RATEIODOCUM R'
      '                  WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      
        '                  GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPA' +
        'TRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA) R'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.NUMFATURA = R.NUMFATURA)'
      '              AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '              AND (D.NUMFATURA = SS.NUMFATURA)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      
        '              AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '              AND (D.OPERACAO IN ('#39'3 '#39'))'
      '              AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                  L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES' +
        ', R.IDPLANOPREV, R.IDPATRO,'
      
        '                  R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC,' +
        ' D.IDMODULO, D.CODDOCUMENTO )) U'
      '      WHERE (U.IDFORCLI = P.IDPESSOA(+))'
      '        AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '        AND (U.IDPATRO = PT.IDPESSOA(+))'
      '        AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '        AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '        AND (U.IDPESSOA = T.IDPESSOA(+))'
      '        AND (U.RECPAG = T.RECPAG(+))'
      '        AND (U.IDMODULO = M.IDMODULO(+)))'
      'GROUP BY IDPLANOPREV, IDPATRO'
      ''
      'UNION'
      ''
      'SELECT'
      '  '#39' '#39' AS NODOCUMENTO,'
      '  '#39'SALDO FINAL TOTAL'#39' AS NOMEFORCLI,'
      
        '  DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)),-1,(SUM(VAL' +
        'ORARECEBER) + SUM(VALORAPAGAR)),0) AS VALORAPAGAR,'
      
        '  DECODE(SIGN(SUM(VALORARECEBER) + SUM(VALORAPAGAR)), 1,(SUM(VAL' +
        'ORARECEBER) + SUM(VALORAPAGAR)),0) AS VALORARECEBER,'
      '  -1 AS IDPLANOPREV,'
      '  -1 AS IDPATRO,'
      '  4 AS TIPOREG'
      'FROM (SELECT'
      '        U.NODOCUMENTO,'
      '        P.NOME AS NOMEFORCLI,'
      '        DECODE(SIGN(U.SALDO),-1,U.SALDO,0) AS VALORAPAGAR,'
      '        DECODE(SIGN(U.SALDO),1,U.SALDO,0)  AS VALORARECEBER,'
      '        U.IDPLANOPREV,'
      '        U.IDPATRO'
      
        '      FROM PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTA' +
        'BIL PP, TIPODOCRECPAG TD, MODULO M,'
      
        '           ((SELECT TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAPROGRA' +
        'MADA,'
      '                    0 AS IDFORCLI,'
      '                    0 AS CODDOCUMENTO,'
      
        '                    TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATAVENCTO' +
        ','
      '                    '#39#39' AS NODOCUMENTO,'
      '                    '#39#39' AS HISTORICOCOMPL,'
      
        '                    TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') AS DATALANCTO' +
        ','
      '                    '#39#39' AS CODTIPRECDES,'
      '                    R.IDPLANOPREV,'
      '                    R.IDPATRO,'
      '                    '#39'F'#39' AS RECPAG,'
      '                    M.IDPESSOA,'
      '                    0 AS CODTIPDOC,'
      '                    '#39'I'#39' AS INCLUDISP,'
      '                    0 AS IDMODULO,'
      
        '                    SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))' +
        ' AS SALDO'
      '             FROM MOVIMFINANC M, RATEIOFINANC R'
      '             WHERE (M.CODLANCFINANC = R.CODLANCFINANC)'
      '               AND (M.IDPESSOA = :IDPESSOA)'
      '               AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '               AND (M.DATALANCFINAN <= TO_DATE(:DATAREF,'#39'DD/MM/Y' +
        'YYY'#39'))'
      '             GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA )'
      '           UNION ALL'
      '           (SELECT D.DATAPROGRAMADA,'
      '                   D.IDFORCLI,'
      '                   D.CODDOCUMENTO,'
      '                   D.DATAVENCTO,'
      
        '                   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCU' +
        'MENTO),'
      
        '                   (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENT' +
        'O)) AS NODOCUMENTO,'
      '                   L.HISTORICOCOMPL,'
      '                   L.DATALANCTO,'
      '                   R.CODTIPRECDES,'
      '                   R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   R.RECPAG,'
      '                   D.IDPESSOA,'
      '                   D.CODTIPDOC,'
      '                   '#39'I'#39' AS INCLUDISP,'
      '                   D.IDMODULO,'
      '                   SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,'
      
        '                 (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1)) AS SALDO'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '              AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      
        '              AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (NVL(L.VALOR,0) <> 0)'
      '              AND (D.OPERACAO IN ('#39'2 '#39','#39'1 '#39'))'
      '              AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, ' +
        'R.IDPLANOPREV, R.IDPATRO,'
      
        '                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D' +
        '.IDMODULO, D.CODDOCUMENTO)'
      '           UNION ALL'
      '           (SELECT D.DATAPROGRAMADA,'
      '                   D.IDFORCLI,'
      '                   D.CODDOCUMENTO,'
      '                   D.DATAVENCTO,'
      
        '                   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCU' +
        'MENTO),'
      
        '                   (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENT' +
        'O)) AS NODOCUMENTO,'
      '                   L.HISTORICOCOMPL,'
      '                   L.DATALANCTO,'
      '                   R.CODTIPRECDES,'
      '                   R.IDPLANOPREV,'
      '                   R.IDPATRO,'
      '                   R.RECPAG,'
      '                   D.IDPESSOA,'
      '                   D.CODTIPDOC,'
      '                   '#39'I'#39' AS INCLUDISP,'
      '                   D.IDMODULO,'
      
        '                   SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS' +
        ' SALDO'
      '            FROM DOCUMENTO D, LANCTODOCUM L,'
      
        '                 (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,'#39'D'#39',L.' +
        'VALOR,L.VALOR*-1)) AS SALDOTOT'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO = L.OPERACAO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      '                  GROUP BY D.NUMFATURA) SS,'
      
        '                 (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'D'#39 +
        ',L.VALOR,L.VALOR*-1)) AS SALDODOC'
      '                  FROM DOCUMENTO D, LANCTODOCUM L'
      '                  WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'3 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      
        '                    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)' +
        ')'
      '                  GROUP BY D.CODDOCUMENTO) S,'
      
        '                 (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOP' +
        'REV, R.IDPATRO, R.IDPESSOA,'
      '                         R.RECPAG, SUM(R.VALOR) AS VALORRAT'
      '                  FROM DOCUMENTO D, RATEIODOCUM R'
      '                  WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '                    AND (D.OPERACAO IN ('#39'1 '#39'))'
      '                    AND (D.IDPESSOA = :IDPESSOA)'
      '                    AND (D.RECPAG = '#39'P'#39')'
      '                    AND (D.NUMFATURA IS NOT NULL)'
      
        '                  GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPA' +
        'TRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA) R'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.NUMFATURA = R.NUMFATURA)'
      '              AND (D.CODDOCUMENTO = S.CODDOCUMENTO)'
      '              AND (D.NUMFATURA = SS.NUMFATURA)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = '#39'P'#39')'
      
        '              AND (D.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (NVL(SS.SALDOTOT,0) <> 0 )'
      '              AND (D.OPERACAO IN ('#39'3 '#39'))'
      '              AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      
        '            GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO,' +
        ' D.NODOCUMENTO, D.DATAPROGRAMADA,'
      
        '                  L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES' +
        ', R.IDPLANOPREV, R.IDPATRO,'
      
        '                  R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC,' +
        ' D.IDMODULO, D.CODDOCUMENTO )) U'
      '      WHERE (U.IDFORCLI = P.IDPESSOA(+))'
      '        AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '        AND (U.IDPATRO = PT.IDPESSOA(+))'
      '        AND (U.CODTIPDOC = TD.CODTIPDOC(+))'
      '        AND (U.DATAPROGRAMADA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '        AND (U.CODTIPRECDES = T.CODTIPRECDES(+))'
      '        AND (U.IDPESSOA = T.IDPESSOA(+))'
      '        AND (U.RECPAG = T.RECPAG(+))'
      '        AND (U.IDMODULO = M.IDMODULO(+)))'
      ''
      'ORDER BY TIPOREG, NODOCUMENTO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 31
    Top = 140
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
    object qryAnaliticaNODOCUMENTO: TStringField
      DisplayLabel = 'Nº do~Documento'
      DisplayWidth = 11
      FieldName = 'NODOCUMENTO'
      Size = 44
    end
    object qryAnaliticaNOMEFORCLI: TStringField
      DisplayLabel = 'Cliente / Fornecedor'
      DisplayWidth = 52
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object qryAnaliticaVALORARECEBER: TFloatField
      DisplayLabel = 'Recebimento'
      DisplayWidth = 19
      FieldName = 'VALORARECEBER'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryAnaliticaVALORAPAGAR: TFloatField
      DisplayLabel = 'Pagamento'
      DisplayWidth = 19
      FieldName = 'VALORAPAGAR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryAnaliticaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryAnaliticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryAnaliticaTIPOREG: TFloatField
      FieldName = 'TIPOREG'
      Visible = False
    end
  end
  object dsSintetica: TwwDataSource
    AutoEdit = False
    DataSet = qrySintetica
    Left = 95
    Top = 83
  end
  object dsAnalitica: TwwDataSource
    AutoEdit = False
    DataSet = qryAnalitica
    Left = 95
    Top = 139
  end
end
