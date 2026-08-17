inherited dmRelAGE: TdmRelAGE
  Left = 934
  Top = 226
  Width = 219
  Height = 247
  Caption = 'dmRelAGE'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 93
    Top = 208
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
  inherited dsExemplo: TwwDataSource
    Top = 208
  end
  inherited qryExemplo: TwwQuery
    Left = 90
    Top = 208
  end
  inherited rpExemplo: TppReport
    Left = 90
    Top = 208
    DataPipelineName = 'pplExemplo'
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppl
    OnStartPage = ppReport2StartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncio de Proventos em Aberto'
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
    Left = 31
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLTitulo: TppLabel
        UserName = 'Label11'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel7: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLData: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        mmHeight = 8996
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 1323
        mmTop = 20108
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Data Prev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 60590
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 118004
        mmTop = 24342
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187590
        mmTop = 24342
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 226748
        mmTop = 24342
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 262467
        mmTop = 20108
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data EX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Data AGE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 98690
        mmTop = 24342
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = ppShape2Print
        UserName = 'ppShape2'
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 794
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAPREV'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 60590
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 118004
        mmTop = 794
        mmWidth = 59796
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'QTD'
        DataPipeline = ppl
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PU'
        DataPipeline = ppl
        DisplayFormat = '#,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 259821
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAEX'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DTBASE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText11'
        DataField = 'DATAAGE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 96838
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel10: TppLabel
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
        mmTop = 1058
        mmWidth = 197909
        BandType = 8
      end
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
        mmTop = 1058
        mmWidth = 284163
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
        mmLeft = 257705
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9261
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape3'
        Brush.Color = clSilver
        mmHeight = 5291
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284163
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 255323
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 129117
        mmTop = 2117
        mmWidth = 17653
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object shpGrpPlano: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 529
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 794
          mmTop = 1058
          mmWidth = 72496
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'Shape12'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALOR'
          DataPipeline = ppl
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 258234
          mmTop = 794
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Total Plano/Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 794
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape7'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 794
          mmTop = 794
          mmWidth = 72497
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape11'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR'
          DataPipeline = ppl
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 258235
          mmTop = 794
          mmWidth = 25664
          BandType = 5
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Total Segmentação de Mercado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 794
          mmWidth = 43392
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape15: TppShape
          UserName = 'Shape15'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 794
          mmWidth = 284163
          BandType = 3
          GroupNo = 2
        end
        object ppDBText24: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCCARTINVEST'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 794
          mmTop = 1323
          mmWidth = 72497
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape16: TppShape
          UserName = 'Shape16'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 5
          GroupNo = 2
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Total Carteira de Investimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 794
          mmTop = 529
          mmWidth = 50800
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALOR'
          DataPipeline = ppl
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3387
          mmLeft = 258235
          mmTop = 529
          mmWidth = 25664
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ds: TwwDataSource
    DataSet = qryAnuncioProv
    Left = 31
    Top = 112
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'l'
    Left = 31
    Top = 64
  end
  object qryAnuncioProv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANPRVCONTABPATRO,'
      '       DESCTIPOOPERACAO,'
      '       TRUNC(DATAEX) AS DATAEX,'
      '       TRUNC(DATAPREV) AS DATAPREV,'
      '       TRUNC(DTBASE) AS DTBASE,'
      '       TRUNC(DATAAGE) AS DATAAGE,'
      
        '       DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, IDTI' +
        'POOPERACAO,'
      '       SUM(QTDPREVISTA) AS QTD,'
      '      (SUM(VLROPERACAO) / SUM(QTDPREVISTA)) AS PU,'
      '       SUM(VLROPERACAO) + SUM(VLRREMUNERACAO) AS VALOR,'
      '       DESCCARTINVEST,'
      '       DESCSEGMENTACAO,'
      '       IDSEGMENTACAO'
      ''
      'FROM (SELECT PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO,'
      
        '             OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREV, OD.D' +
        'ATAEX AS DTBASE, OD.DATAAGE,'
      
        '             IV.DESCINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDOPERAC' +
        'AODIREITO, IV.IDINVESTIMENTO,'
      '             NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,'
      '             NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,'
      '             NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,'
      '             NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,'
      '             OI.PRECOUNITOPERACAO,'
      
        '            (NVL(OI.VLROPERACAO,0)) - NVL(REC.QTDEOPERACAO,0) - ' +
        'NVL(CAN.QTDEOPERACAO,0) AS VLROPERACAO,'
      '             NVL(VLRREMUNERACAO,0) AS VLRREMUNERACAO,'
      '             SM.DESCSEGMENTACAO,'
      '             SM.IDSEGMENTACAO,'
      '             CI.DESCCARTINVEST'
      ''
      
        '      FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI' +
        ', TIPOOPERACAO TP, INVESTIMENTO IV,'
      
        '           VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAOMERCADO ' +
        'SM, CARTEIRAINVEST CI,'
      
        '           (SELECT OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM, ' +
        'SUM(OIR.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIR, PARAMINVEST PIR'
      '            WHERE OIR.IDOPERACAOORIGEM IS NOT NULL'
      
        '              AND OIR.IDTIPOOPERACAO IN (PIR.IDTIPOOPERDIRDIV, P' +
        'IR.IDTIPOOPERDIRDIV + 10000,'
      
        '                                         PIR.IDTIPOOPERDIRJUR, P' +
        'IR.IDTIPOOPERDIRJUR + 10000,'
      
        '                                         PIR.IDTIPOOPERDIRMUL, P' +
        'IR.IDTIPOOPERDIRMUL + 10000)'
      
        '              AND ((:DT_REF IS NULL) OR (DECODE(:TIPODATA, 0, OI' +
        'R.DATAOPERACAO, OIR.DATAVENCOPER) <= TO_DATE(:DT_REF,'#39'DD/MM/YYYY' +
        #39')))'
      
        '            GROUP BY OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM' +
        ') REC,'
      ''
      
        '           (SELECT OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM, ' +
        'SUM(OIC.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIC'
      '            WHERE OIC.IDOPERACAOORIGEM IS NOT NULL'
      '              AND OIC.IDTIPOOPERACAO IN (-170, -10170)'
      
        '              AND ((:DT_REF IS NULL) OR (OIC.DATAOPERACAO <= TO_' +
        'DATE(:DT_REF,'#39'DD/MM/YYYY'#39')))'
      
        '            GROUP BY OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM' +
        ') CAN,'
      '      ('
      '      SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST'
      '       FROM OPERACAOINVEST OI1, OPERACAODIREITO D'
      '      WHERE'
      
        '             ((:DATAOPERACAO IS NULL) OR (DECODE(:TIPODATA, 0, O' +
        'I1.DATAOPERACAO, D.DATAAGE) <= TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYY' +
        'Y'#39')))'
      
        '        AND  ((:IDINVESTIMENTO IS NULL) OR (OI1.IDINVESTIMENTO =' +
        ' :IDINVESTIMENTO))'
      
        '        AND  ((:IDPLANPREVCTBPATR IS NULL) OR (OI1.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR))'
      
        '        AND  ((:IDCARTEIRAINVEST IS NULL) OR (OI1.IDCARTEIRAINVE' +
        'ST = :IDCARTEIRAINVEST))'
      '        AND OI1.IDTIPOOPERACAO in (-70, -10070)'
      '        AND OI1.IDOPERACAODIREITO = D.IDOPERACAODIREITO'
      
        '      GROUP BY OI1.IDOPERACAODIREITO, OI1.IDPLANPREVCTBPATR, OI1' +
        '.IDCARTEIRAINVEST, OI1.IDCUSTODIANTE) OIMAX'
      ''
      '      WHERE OI.IDCARTEIRAGERENC IS NULL'
      '        AND OI.IDTIPOOPERACAO IN (-70, -10070)'
      '        AND OI.ORIGDEST IS NOT NULL'
      
        '        AND ((:DATAOPERACAO IS NULL) OR (DECODE(:TIPODATA, 0, OI' +
        '.DATAOPERACAO, OD.DATAAGE) <= TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYYY' +
        #39')))'
      
        '        AND ((:DATAEX IS NULL) OR (OD.DATAOPER = TO_DATE(:DATAEX' +
        ', '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:DATAAGE IS NULL) OR (OD.DATAAGE = TO_DATE(:DATAAG' +
        'E, '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR))'
      
        '        AND ((:IDTIPOOPERACAO IS NULL) OR (TP.IDTIPOOPERACAO = :' +
        'IDTIPOOPERACAO))'
      
        '        AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '        AND ((:IDCARTEIRAINVEST IS NULL) OR (OI.IDCARTEIRAINVEST' +
        ' = :IDCARTEIRAINVEST))'
      
        '        AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO = :ID' +
        'SEGMENTACAO))'
      
        '        AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPO' +
        'OPERDIRJUR, PI.IDTIPOOPERDIRMUL)'
      '        AND OI.IDOPERACAOINVEST  = OIMAX.IDOPERACAOINVEST'
      '        AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '        AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '        AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '        AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '        AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '        AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = REC.IDOPERACAODIREITO(+)'
      '        AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = CAN.IDOPERACAODIREITO(+)'
      '        AND IV.IDEMISSOR = EM.IDEMISSOR(+)'
      '        AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO(+)'
      
        '        AND NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + N' +
        'VL(CAN.QTDEOPERACAO,0))'
      '        AND ((NVL(OD.STATUS,'#39'P'#39') <> '#39'T'#39') OR'
      '             (EXISTS(SELECT OI2.DATAOPERACAO'
      '                     FROM OPERACAOINVEST OI2'
      
        '                     WHERE OI2.IDOPERACAODIREITO = OI.IDOPERACAO' +
        'DIREITO'
      
        '                       AND OI2.IDTIPOOPERACAO NOT IN (-70, -1007' +
        '0)'
      
        '                       AND DECODE(:TIPODATA, 0, OI2.DATAOPERACAO' +
        ', OI2.DATAVENCOPER) > TO_DATE(:DT_REF, '#39'DD/MM/YYYY'#39') ))) )'
      ''
      
        'GROUP BY PLANPRVCONTABPATRO, DESCTIPOOPERACAO, DATAEX, DATAPREV,' +
        ' DTBASE, DATAAGE,'
      
        '         DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, ID' +
        'TIPOOPERACAO, IDSEGMENTACAO, DESCSEGMENTACAO, DESCCARTINVEST'
      ''
      'HAVING SUM(VLROPERACAO) > 0'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO, IDSEGMENTACAO, DESCINVESTIMENTO, DA' +
        'TAEX, DATAAGE, DESCTIPOOPERACAO, DESCCARTINVEST'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 33
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end>
    object qryAnuncioProvPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 31
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryAnuncioProvDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimentos'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryAnuncioProvDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAnuncioProvDATAPREV: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREV'
    end
    object qryAnuncioProvDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimentos'
      DisplayWidth = 29
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnuncioProvQTD: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTD'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryAnuncioProvPU: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 15
      FieldName = 'PU'
      DisplayFormat = '###,###,##0.000000000000'
    end
    object qryAnuncioProvVALOR: TFloatField
      DisplayLabel = 'Valor à Receber'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryAnuncioProvDESCSEGMENTACAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCSEGMENTACAO'
      Visible = False
      Size = 100
    end
    object qryAnuncioProvDATAEX: TDateTimeField
      FieldName = 'DATAEX'
      Visible = False
    end
    object qryAnuncioProvDTBASE: TDateTimeField
      FieldName = 'DTBASE'
      Visible = False
    end
    object qryAnuncioProvDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
      Visible = False
    end
    object qryAnuncioProvIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAnuncioProvIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryAnuncioProvIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryAnuncioProvIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
  end
  object QryAnuncioProvCon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '-- Query criada em tempo de execucao a partir da QryAnuncioProvC' +
        'on'
      'SELECT PLANPRVCONTABPATRO,'
      '       DESCTIPOOPERACAO,'
      '       TRUNC(DATAEX) AS DATAEX,'
      '       TRUNC(DATAPREV) AS DATAPREV,'
      '       TRUNC(DTBASE) AS DTBASE,'
      '       TRUNC(DATAAGE) AS DATAAGE,'
      
        '       DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, IDTI' +
        'POOPERACAO,'
      '       SUM(QTDPREVISTA) AS QTD,'
      '      (SUM(VLROPERACAO) / SUM(QTDPREVISTA)) AS PU,'
      '       SUM(VLROPERACAO) + SUM(VLRREMUNERACAO) AS VALOR,'
      '       DESCCARTINVEST,'
      '       DESCSEGMENTACAO,'
      '       IDSEGMENTACAO'
      ''
      'FROM (SELECT PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO,'
      
        '             OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREV, OD.D' +
        'ATAEX AS DTBASE, OD.DATAAGE,'
      
        '             IV.DESCINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDOPERAC' +
        'AODIREITO, IV.IDINVESTIMENTO,'
      '             NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,'
      '             NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,'
      '             NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,'
      '             NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,'
      '             OI.PRECOUNITOPERACAO,'
      
        '            (NVL(OI.VLROPERACAO,0)) - NVL(REC.QTDEOPERACAO,0) - ' +
        'NVL(CAN.QTDEOPERACAO,0) AS VLROPERACAO,'
      '             NVL(VLRREMUNERACAO,0) AS VLRREMUNERACAO,'
      '             SM.DESCSEGMENTACAO,'
      '             SM.IDSEGMENTACAO,'
      '             CI.DESCCARTINVEST'
      ''
      
        '      FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI' +
        ', TIPOOPERACAO TP, INVESTIMENTO IV,'
      
        '           VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAOMERCADO ' +
        'SM, CARTEIRAINVEST CI,'
      
        '           (SELECT OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM, ' +
        'SUM(OIR.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIR, PARAMINVEST PIR'
      '            WHERE OIR.IDOPERACAOORIGEM IS NOT NULL'
      
        '              AND OIR.IDTIPOOPERACAO IN (PIR.IDTIPOOPERDIRDIV, P' +
        'IR.IDTIPOOPERDIRDIV + 10000,'
      
        '                                         PIR.IDTIPOOPERDIRJUR, P' +
        'IR.IDTIPOOPERDIRJUR + 10000,'
      
        '                                         PIR.IDTIPOOPERDIRMUL, P' +
        'IR.IDTIPOOPERDIRMUL + 10000)'
      
        '              AND ((:DT_REF IS NULL) OR (DECODE(:TIPODATA, 0, OI' +
        'R.DATAOPERACAO, OIR.DATAVENCOPER) <= TO_DATE(:DT_REF,'#39'DD/MM/YYYY' +
        #39')))'
      
        '            GROUP BY OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM' +
        ') REC,'
      ''
      
        '           (SELECT OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM, ' +
        'SUM(OIC.VLROPERACAO) AS QTDEOPERACAO'
      '            FROM OPERACAOINVEST OIC'
      '            WHERE OIC.IDOPERACAOORIGEM IS NOT NULL'
      '              AND OIC.IDTIPOOPERACAO IN (-170, -10170)'
      
        '              AND ((:DT_REF IS NULL) OR (OIC.DATAOPERACAO <= TO_' +
        'DATE(:DT_REF,'#39'DD/MM/YYYY'#39')))'
      
        '            GROUP BY OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM' +
        ') CAN,'
      ''
      '      ('
      '      SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST'
      '       FROM OPERACAOINVEST OI1'
      '      WHERE'
      
        '             ((:DATAOPERACAO IS NULL) OR (DECODE(:TIPODATA, 0, O' +
        'I1.DATAOPERACAO, D.DATAAGE) <= TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYY' +
        'Y'#39')))'
      
        '        AND  ((:IDINVESTIMENTO IS NULL) OR (OI1.IDINVESTIMENTO =' +
        ' :IDINVESTIMENTO))'
      
        '        AND  ((:IDPLANPREVCTBPATR IS NULL) OR (OI1.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR))'
      
        '        AND  ((:IDCARTEIRAINVEST IS NULL) OR (OI1.IDCARTEIRAINVE' +
        'ST = :IDCARTEIRAINVEST))'
      '        AND OI1.IDTIPOOPERACAO in (-70, -10070)'
      
        '      GROUP BY OI1.IDOPERACAODIREITO, OI1.IDPLANPREVCTBPATR, OI1' +
        '.IDCARTEIRAINVEST) OIMAX'
      ''
      '      WHERE OI.IDCARTEIRAGERENC IS NULL'
      '        AND OI.IDTIPOOPERACAO IN (-70, -10070)'
      '        AND OI.ORIGDEST IS NOT NULL'
      
        '        AND ((:DATAOPERACAO IS NULL) OR (DECODE(:TIPODATA, 0, OI' +
        '.DATAOPERACAO, OD.DATAAGE) <= TO_DATE(:DATAOPERACAO, '#39'DD/MM/YYYY' +
        #39')))'
      
        '        AND ((:DATAEX IS NULL) OR (OD.DATAOPER = TO_DATE(:DATAEX' +
        ', '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:DATAAGE IS NULL) OR (OD.DATAAGE = TO_DATE(:DATAAG' +
        'E, '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR))'
      
        '        AND ((:IDTIPOOPERACAO IS NULL) OR (TP.IDTIPOOPERACAO = :' +
        'IDTIPOOPERACAO))'
      
        '        AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '        AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO = :ID' +
        'SEGMENTACAO))'
      
        '        AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPO' +
        'OPERDIRJUR, PI.IDTIPOOPERDIRMUL)'
      '        AND OI.IDOPERACAOINVEST  = OIMAX.IDOPERACAOINVEST'
      '        AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '        AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '        AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '        AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '        AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '        AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = REC.IDOPERACAODIREITO(+)'
      '        AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAODIREITO = CAN.IDOPERACAODIREITO(+)'
      '        AND IV.IDEMISSOR = EM.IDEMISSOR(+)'
      '        AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO(+)'
      
        '        AND NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + N' +
        'VL(CAN.QTDEOPERACAO,0))'
      '        AND ((NVL(OD.STATUS,'#39'P'#39') <> '#39'T'#39') OR'
      '             (EXISTS(SELECT OI2.DATAOPERACAO'
      '                     FROM OPERACAOINVEST OI2'
      
        '                     WHERE OI2.IDOPERACAODIREITO = OI.IDOPERACAO' +
        'DIREITO'
      
        '                       AND OI2.IDTIPOOPERACAO NOT IN (-70, -1007' +
        '0)'
      
        '                       AND DECODE(:TIPODATA, 0, OI2.DATAOPERACAO' +
        ', OI2.DATAVENCOPER) > TO_DATE(:DT_REF, '#39'DD/MM/YYYY'#39') )))  )'
      ''
      
        'GROUP BY PLANPRVCONTABPATRO, DESCTIPOOPERACAO, DATAEX, DATAPREV,' +
        ' DTBASE, DATAAGE,'
      
        '         DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, ID' +
        'TIPOOPERACAO, IDSEGMENTACAO, DESCSEGMENTACAO, DESCCARTINVEST'
      ''
      'HAVING SUM(VLROPERACAO) > 0'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO, IDSEGMENTACAO, DESCINVESTIMENTO, DA' +
        'TAEX, DATAAGE, DESCTIPOOPERACAO, DESCCARTINVEST'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 121
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end>
    object QryAnuncioProvConPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryAnuncioProvConDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryAnuncioProvConDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object QryAnuncioProvConDATAPREV: TDateTimeField
      FieldName = 'DATAPREV'
    end
    object QryAnuncioProvConDTBASE: TDateTimeField
      FieldName = 'DTBASE'
    end
    object QryAnuncioProvConDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object QryAnuncioProvConDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryAnuncioProvConIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryAnuncioProvConIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object QryAnuncioProvConIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryAnuncioProvConQTD: TFloatField
      FieldName = 'QTD'
    end
    object QryAnuncioProvConPU: TFloatField
      FieldName = 'PU'
    end
    object QryAnuncioProvConVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryAnuncioProvConDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object QryAnuncioProvConIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
    object QryAnuncioProvConDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object DsAnuncioProvCon: TwwDataSource
    DataSet = QryAnuncioProvCon
    Left = 119
    Top = 112
  end
  object pplAnuncioProvCon: TppBDEPipeline
    DataSource = DsAnuncioProvCon
    UserName = 'IAnuncioProvCon'
    Left = 119
    Top = 64
  end
  object rptAnuncioProvCon: TppReport
    AutoStop = False
    DataPipeline = pplAnuncioProvCon
    OnStartPage = ppReport2StartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncio de Proventos em Aberto - Consolidado por Investimento'
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
    Left = 119
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnuncioProvCon'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object lblTitCon: TppLabel
        UserName = 'Label11'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel4: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPerCon: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Data Prev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 20373
        mmTop = 24077
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Plano/Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 73819
        mmTop = 24077
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 205582
        mmTop = 24077
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 234950
        mmTop = 24077
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 262467
        mmTop = 23813
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data EX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 3704
        mmTop = 24077
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 38365
        mmTop = 24077
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Data AGE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 57415
        mmTop = 24077
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 137054
        mmTop = 24077
        mmWidth = 29803
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape4: TppShape
        OnPrint = ppShape2Print
        UserName = 'ppShape2'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAPREV'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 20373
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 73819
        mmTop = 529
        mmWidth = 51858
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText4'
        DataField = 'QTD'
        DataPipeline = pplAnuncioProvCon
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 205582
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText5'
        DataField = 'PU'
        DataPipeline = pplAnuncioProvCon
        DisplayFormat = '#,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 234950
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = pplAnuncioProvCon
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 259292
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAEX'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 3704
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText8'
        DataField = 'DTBASE'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 38365
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'DATAAGE'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 56621
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplAnuncioProvCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 2910
        mmLeft = 136790
        mmTop = 529
        mmWidth = 56092
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel22: TppLabel
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
        mmTop = 1058
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
        mmTop = 1058
        mmWidth = 284163
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
        mmLeft = 257705
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = pplAnuncioProvCon
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncioProvCon'
        mmHeight = 3440
        mmLeft = 254794
        mmTop = 2646
        mmWidth = 28575
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 181505
        mmTop = 2646
        mmWidth = 15875
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = pplAnuncioProvCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncioProvCon'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape13: TppShape
          UserName = 'Shape13'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = pplAnuncioProvCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 529
          mmTop = 1588
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape14: TppShape
          UserName = 'Shape101'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Total da Segmentação de Mercado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 156369
          mmTop = 1058
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALOR'
          DataPipeline = pplAnuncioProvCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 257705
          mmTop = 1058
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplAnuncioProvCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncioProvCon'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplAnuncioProvCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 529
          mmTop = 529
          mmWidth = 105834
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape10: TppShape
          UserName = 'Shape10'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR'
          DataPipeline = pplAnuncioProvCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 257705
          mmTop = 794
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Total do Investimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 171450
          mmTop = 794
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplAnuncioProvCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncioProvCon'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape6'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplAnuncioProvCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 16404
          mmTop = 1588
          mmWidth = 110067
          BandType = 3
          GroupNo = 1
        end
        object ppLabel26: TppLabel
          UserName = 'Label6'
          Caption = 'Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3704
          mmTop = 1588
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = pplAnuncioProvCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncioProvCon'
          mmHeight = 2910
          mmLeft = 257705
          mmTop = 1852
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object ppLabel23: TppLabel
          UserName = 'Label4'
          Caption = 'Total da Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 175155
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppLine49: TppLine
          UserName = 'Line49'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 201877
          mmTop = 529
          mmWidth = 81492
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
