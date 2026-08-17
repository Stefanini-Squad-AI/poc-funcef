inherited DmRelCarteiraFundos: TDmRelCarteiraFundos
  Left = 293
  Top = 213
  Width = 333
  Height = 243
  Caption = 'DmRelCarteiraFundos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 253
    Top = 61
  end
  inherited dsExemplo: TwwDataSource
    Left = 253
    Top = 109
  end
  inherited qryExemplo: TwwQuery
    Left = 253
    Top = 157
  end
  inherited rpExemplo: TppReport
    Left = 253
    Top = 5
    DataPipelineName = 'pplExemplo'
  end
  object rptCarteiraFundos: TppReport
    AutoStop = False
    DataPipeline = pplCarteiraFundo
    OnStartPage = rptCarteiraFundosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Carterira de Fundos'
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
    Left = 151
    Top = 5
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCarteiraFundo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284300
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplCarteiraFundoDet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 19844
        mmWidth = 142082
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Carteira de Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel37: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object pplData: TppLabel
        UserName = 'LPeriodo1'
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
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
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
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplCarteiraFundoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 3969
        mmLeft = 169863
        mmTop = 14023
        mmWidth = 112713
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object srptTitulosPrivados: TppSubReport
        UserName = 'srptTitulosPrivados'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabTitulosPrivados: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel12: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Contraparte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 42069
              BandType = 0
            end
            object ppLabel13: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 46038
              mmTop = 1323
              mmWidth = 16669
              BandType = 0
            end
            object ppLabel14: TppLabel
              UserName = 'Label5'
              AutoSize = False
              Caption = 'Data Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 66146
              mmTop = 1323
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel15: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'Data Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 83608
              mmTop = 1323
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel16: TppLabel
              UserName = 'Label7'
              Caption = 'A / P'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 103981
              mmTop = 1323
              mmWidth = 4763
              BandType = 0
            end
            object ppLabel17: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Principal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 112184
              mmTop = 1323
              mmWidth = 20638
              BandType = 0
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              AutoSize = False
              Caption = 'Indexador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 135996
              mmTop = 1323
              mmWidth = 11642
              BandType = 0
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Taxa (a.a.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 150813
              mmTop = 1323
              mmWidth = 17727
              BandType = 0
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Financeiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 171715
              mmTop = 1323
              mmWidth = 20108
              BandType = 0
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'Cupon / Taxa (a.a.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 194998
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              AutoSize = False
              Caption = 'Código SND'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 218811
              mmTop = 1323
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'Quantidade Debenture'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 236009
              mmTop = 1323
              mmWidth = 22754
              BandType = 0
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'Depósito em Garantia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 262203
              mmTop = 1323
              mmWidth = 21960
              BandType = 0
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpTitulosPrivadosDet: TppShape
              OnPrint = shpTitulosPrivadosDetPrint
              UserName = 'shpTitulosPrivadosDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCONTRAPARTE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText2'
              DataField = 'CODIGO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 45773
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText4'
              DataField = 'DATACOMPRA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 66146
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText5'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 83608
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText6'
              DataField = 'STAATIVPASS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 103981
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText7'
              DataField = 'VLRPRINCIPAL'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 112184
              mmTop = 0
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'INDEXADOR'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 135732
              mmTop = 0
              mmWidth = 11906
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'TAXA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,##0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 150813
              mmTop = 0
              mmWidth = 17727
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRFINANCEIRO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 171715
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'TAXACTRPAROPER'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 194998
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'CODSNDDEBENTURE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 218811
              mmTop = 0
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'QUANTIDADE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 236009
              mmTop = 0
              mmWidth = 22754
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'STAGARANTIA'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 262203
              mmTop = 0
              mmWidth = 21960
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptTitulosPublicos: TppSubReport
        UserName = 'srptTitulosPublicos'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabTitulosPublicos: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel38: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Contraparte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 42069
              BandType = 0
            end
            object ppLabel39: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 46038
              mmTop = 1323
              mmWidth = 16669
              BandType = 0
            end
            object ppLabel40: TppLabel
              UserName = 'Label5'
              AutoSize = False
              Caption = 'Data Emissão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 66146
              mmTop = 1323
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel41: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'Data Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 83608
              mmTop = 1323
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel42: TppLabel
              UserName = 'Label7'
              Caption = 'A / P'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 103981
              mmTop = 1323
              mmWidth = 4763
              BandType = 0
            end
            object ppLabel43: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 112184
              mmTop = 1323
              mmWidth = 20638
              BandType = 0
            end
            object ppLabel44: TppLabel
              UserName = 'Label29'
              AutoSize = False
              Caption = 'Indexador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 135996
              mmTop = 1323
              mmWidth = 11642
              BandType = 0
            end
            object ppLabel45: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Taxa %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 150813
              mmTop = 1323
              mmWidth = 17727
              BandType = 0
            end
            object ppLabel46: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Financeiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 171715
              mmTop = 1323
              mmWidth = 20108
              BandType = 0
            end
            object ppLabel47: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'P.U. de Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 194998
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              AutoSize = False
              Caption = 'P.U. de Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 218017
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
            object ppLabel49: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'Data da Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 241300
              mmTop = 1323
              mmWidth = 18256
              BandType = 0
            end
            object ppLabel50: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'Depósito em Garantia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 262203
              mmTop = 1323
              mmWidth = 21960
              BandType = 0
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpTitulosPublicosDet: TppShape
              OnPrint = shpTitulosPublicosDetPrint
              UserName = 'shpTitulosPublicosDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCONTRAPARTE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText2'
              DataField = 'CODIGO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 45773
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText4'
              DataField = 'DATAEMISSAO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 66146
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText5'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 83608
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText6'
              DataField = 'STAATIVPASS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 103981
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText7'
              DataField = 'QUANTIDADE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 112184
              mmTop = 0
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText28'
              DataField = 'INDEXADOR'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 135732
              mmTop = 0
              mmWidth = 11906
              BandType = 4
            end
            object ppDBText42: TppDBText
              UserName = 'DBText29'
              DataField = 'TAXA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,##0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 150813
              mmTop = 0
              mmWidth = 17727
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRFINANCEIRO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 171715
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText31'
              DataField = 'PUCOMPRA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 194998
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText33'
              DataField = 'DATACOMPRA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 241300
              mmTop = 0
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText34'
              DataField = 'STAGARANTIA'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 262203
              mmTop = 0
              mmWidth = 21960
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'DBText45'
              DataField = 'PUVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 218017
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptDespesaCorretagem: TppSubReport
        UserName = 'srptDespesaCorretagem'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabDespesaCorretagem: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine8: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel75: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Corretora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 42069
              BandType = 0
            end
            object ppLabel76: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Tipo Corretora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 43392
              mmTop = 1323
              mmWidth = 15346
              BandType = 0
            end
            object ppLabel77: TppLabel
              UserName = 'Label5'
              AutoSize = False
              Caption = 'CNPJ Corretora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 59267
              mmTop = 1323
              mmWidth = 21167
              BandType = 0
            end
            object ppLabel78: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'Nº Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 80698
              mmTop = 1323
              mmWidth = 13494
              BandType = 0
            end
            object ppLabel83: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Bovespa Val. Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 96309
              mmTop = 1323
              mmWidth = 19844
              BandType = 0
            end
            object ppLabel79: TppLabel
              UserName = 'Label79'
              AutoSize = False
              Caption = 'Bovespa Devol.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 116946
              mmTop = 1323
              mmWidth = 19844
              BandType = 0
            end
            object ppLabel80: TppLabel
              UserName = 'Label80'
              AutoSize = False
              Caption = 'Bovespa Val. Pagos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 137584
              mmTop = 1323
              mmWidth = 19844
              BandType = 0
            end
            object ppLabel81: TppLabel
              UserName = 'Label81'
              AutoSize = False
              Caption = 'BM&F Val. Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 159544
              mmTop = 1323
              mmWidth = 18785
              BandType = 0
            end
            object ppLabel82: TppLabel
              UserName = 'Label82'
              AutoSize = False
              Caption = 'BM&F Devoluções'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 179123
              mmTop = 1323
              mmWidth = 19579
              BandType = 0
            end
            object ppLabel84: TppLabel
              UserName = 'Label801'
              AutoSize = False
              Caption = 'BM&F Val. Pagos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 199496
              mmTop = 1323
              mmWidth = 19050
              BandType = 0
            end
            object ppLabel85: TppLabel
              UserName = 'Label85'
              AutoSize = False
              Caption = 'Bolsa Val. Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 220663
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
            object ppLabel86: TppLabel
              UserName = 'Label86'
              AutoSize = False
              Caption = 'Bolsa Devoluções'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 242094
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
            object ppLabel87: TppLabel
              UserName = 'Label87'
              AutoSize = False
              Caption = 'Bolsa Val. Pagos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 263526
              mmTop = 1323
              mmWidth = 20373
              BandType = 0
            end
          end
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpDespesaCorretagemDet: TppShape
              OnPrint = shpDespesaCorretagemDetPrint
              UserName = 'shpTitulosPublicosDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText72: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCORRETORA'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 42333
              BandType = 4
            end
            object ppDBText73: TppDBText
              UserName = 'DBText2'
              DataField = 'CODIGO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 43127
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText74: TppDBText
              UserName = 'DBText4'
              DataField = 'CNPJCORRETORA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '##.###.###/####-##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 59267
              mmTop = 0
              mmWidth = 20902
              BandType = 4
            end
            object ppDBText75: TppDBText
              UserName = 'DBText5'
              DataField = 'NUMOPERACAO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 80698
              mmTop = 0
              mmWidth = 13494
              BandType = 4
            end
            object ppDBText80: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRTABBOVESPA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 96309
              mmTop = 0
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText76: TppDBText
              UserName = 'DBText302'
              DataField = 'VLRDEVBOVESPA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 116946
              mmTop = 0
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText77: TppDBText
              UserName = 'DBText303'
              DataField = 'VLREFEPGBOVESPA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 137584
              mmTop = 0
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText78: TppDBText
              UserName = 'DBText304'
              DataField = 'VLRTABBMF'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 159544
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText79: TppDBText
              UserName = 'DBText79'
              DataField = 'VLRDEVBMF'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 179123
              mmTop = 0
              mmWidth = 19579
              BandType = 4
            end
            object ppDBText81: TppDBText
              UserName = 'DBText81'
              DataField = 'VLREFEPGBMF'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 199496
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText82: TppDBText
              UserName = 'DBText82'
              DataField = 'VLREFEPGBOLSA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 263526
              mmTop = 0
              mmWidth = 20373
              BandType = 4
            end
            object ppDBText83: TppDBText
              UserName = 'DBText83'
              DataField = 'VLRDEVBOLSA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 242094
              mmTop = 0
              mmWidth = 20373
              BandType = 4
            end
            object ppDBText84: TppDBText
              UserName = 'DBText84'
              DataField = 'VLRTABBOLSA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 220663
              mmTop = 0
              mmWidth = 20373
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptSwap: TppSubReport
        UserName = 'srptSwap'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabSwap: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine7: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel55: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Contraparte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 28310
              BandType = 0
            end
            object ppLabel58: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 29898
              mmTop = 1323
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel61: TppLabel
              UserName = 'Label5'
              AutoSize = False
              Caption = 'Data Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 45508
              mmTop = 1323
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel62: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'Data Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 60061
              mmTop = 1323
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel64: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Principal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 77788
              mmTop = 1323
              mmWidth = 20638
              BandType = 0
            end
            object ppLabel65: TppLabel
              UserName = 'Label29'
              AutoSize = False
              Caption = 'Ind. Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 101336
              mmTop = 1323
              mmWidth = 13494
              BandType = 0
            end
            object ppLabel66: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Taxa Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 115359
              mmTop = 1323
              mmWidth = 13758
              BandType = 0
            end
            object ppLabel67: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Financeiro Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 129911
              mmTop = 1323
              mmWidth = 19315
              BandType = 0
            end
            object ppLabel68: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'Taxa Ativo Pré'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 150019
              mmTop = 1323
              mmWidth = 17727
              BandType = 0
            end
            object ppLabel63: TppLabel
              UserName = 'Label63'
              AutoSize = False
              Caption = 'Ind. Passivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 170392
              mmTop = 1323
              mmWidth = 13494
              BandType = 0
            end
            object ppLabel71: TppLabel
              UserName = 'Label301'
              AutoSize = False
              Caption = 'Taxa Passivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 184415
              mmTop = 1323
              mmWidth = 13758
              BandType = 0
            end
            object ppLabel72: TppLabel
              UserName = 'Label72'
              AutoSize = False
              Caption = 'Financeiro Passivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 198967
              mmTop = 1323
              mmWidth = 19315
              BandType = 0
            end
            object ppLabel73: TppLabel
              UserName = 'Label73'
              AutoSize = False
              Caption = 'Taxa Passivo Pré'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 219075
              mmTop = 1323
              mmWidth = 17727
              BandType = 0
            end
            object ppLabel69: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'Emissor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 239184
              mmTop = 1323
              mmWidth = 29104
              BandType = 0
            end
            object ppLabel70: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'Dep. Garantia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 268817
              mmTop = 1323
              mmWidth = 15346
              BandType = 0
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpSwapDet: TppShape
              OnPrint = shpSwapDetPrint
              UserName = 'shpSwapDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCONTRAPARTE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 28575
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText2'
              DataField = 'CODIGO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 29633
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'DBText4'
              DataField = 'DATACOMPRA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 45508
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText58: TppDBText
              UserName = 'DBText5'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 60061
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText60: TppDBText
              UserName = 'DBText7'
              DataField = 'VLRPRINCIPAL'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 77788
              mmTop = 0
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText61: TppDBText
              UserName = 'DBText28'
              DataField = 'INDEXADORATIVO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 101071
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText63: TppDBText
              UserName = 'DBText29'
              DataField = 'TAXAATIVO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,##0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 115359
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText64: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRFINANCATIVO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 129911
              mmTop = 0
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText65: TppDBText
              UserName = 'DBText31'
              DataField = 'TAXAATIVOPRE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 150019
              mmTop = 0
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText66: TppDBText
              UserName = 'DBText33'
              DataField = 'EMISSOR'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 239184
              mmTop = 0
              mmWidth = 29104
              BandType = 4
            end
            object ppDBText67: TppDBText
              UserName = 'DBText34'
              DataField = 'STAGARANTIA'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 268817
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText59: TppDBText
              UserName = 'DBText59'
              DataField = 'INDEXADORPASS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 170127
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText68: TppDBText
              UserName = 'DBText68'
              DataField = 'TAXAPASSIVO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,##0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 184415
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText70: TppDBText
              UserName = 'DBText301'
              DataField = 'VLRFINANCPASS'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 198967
              mmTop = 0
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText71: TppDBText
              UserName = 'DBText71'
              DataField = 'TAXAPASSIVOPRE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 219075
              mmTop = 0
              mmWidth = 17463
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptBolsas: TppSubReport
        UserName = 'srptBolsas'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabBolsas: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine6: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel52: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Contraparte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 58738
              BandType = 0
            end
            object ppLabel53: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 64823
              mmTop = 1323
              mmWidth = 60325
              BandType = 0
            end
            object ppLabel56: TppLabel
              UserName = 'Label7'
              Caption = 'Ativo / Passivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 131498
              mmTop = 1323
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel57: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 154252
              mmTop = 1323
              mmWidth = 33338
              BandType = 0
            end
            object ppLabel59: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Ajuste'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 205582
              mmTop = 1323
              mmWidth = 26723
              BandType = 0
            end
            object ppLabel60: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Financeiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 252413
              mmTop = 1323
              mmWidth = 32015
              BandType = 0
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpBolsasDet: TppShape
              OnPrint = shpBolsasDetPrint
              UserName = 'shpBolsasDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText49: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCONTRAPARTE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 59002
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText2'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 64558
              mmTop = 0
              mmWidth = 60590
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText6'
              DataField = 'STAATIVPASS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 135996
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText7'
              DataField = 'QUANTIDADE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 154252
              mmTop = 0
              mmWidth = 33338
              BandType = 4
            end
            object ppDBText56: TppDBText
              UserName = 'DBText29'
              DataField = 'VLRAJUSTE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 205582
              mmTop = 0
              mmWidth = 26723
              BandType = 4
            end
            object ppDBText57: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRFINANCEIRO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 252413
              mmTop = 0
              mmWidth = 32015
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptOutrasContas: TppSubReport
        UserName = 'srptOutrasContas'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabOutrasContas: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine9: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel89: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 90488
              BandType = 0
            end
            object ppLabel94: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 248444
              mmTop = 1323
              mmWidth = 35983
              BandType = 0
            end
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpOutrasContasDet: TppShape
              OnPrint = shpOutrasContasDetPrint
              UserName = 'shpOutrasContasDet'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText86: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCOUTRASCONTAS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 265
              mmTop = 0
              mmWidth = 90752
              BandType = 4
            end
            object ppDBText91: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRCONTAS'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 248444
              mmTop = 0
              mmWidth = 35983
              BandType = 4
            end
          end
          object ppSummaryBand7: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object srptOperCompr: TppSubReport
        UserName = 'srptOperCompr'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplCarteiraFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplCarteiraFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Carterira de Fundos'
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
          Left = 256
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplCarteiraFundoDet'
          object cabOperCompr: TppHeaderBand
            Visible = False
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 2910
              mmWidth = 284300
              BandType = 0
            end
            object ppLabel4: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Contraparte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 529
              mmTop = 1323
              mmWidth = 34396
              BandType = 0
            end
            object ppLabel6: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Lastro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 36248
              mmTop = 1323
              mmWidth = 16669
              BandType = 0
            end
            object ppLabel7: TppLabel
              UserName = 'Label5'
              Caption = 'Data Emissão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 53975
              mmTop = 1323
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel8: TppLabel
              UserName = 'Label6'
              Caption = 'Data Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 68527
              mmTop = 1323
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel9: TppLabel
              UserName = 'Label7'
              Caption = 'A / P'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 86519
              mmTop = 1323
              mmWidth = 4763
              BandType = 0
            end
            object ppLabel10: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 92075
              mmTop = 1323
              mmWidth = 17198
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              AutoSize = False
              Caption = 'Taxa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 110067
              mmTop = 1323
              mmWidth = 10054
              BandType = 0
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              AutoSize = False
              Caption = 'Indexador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 120915
              mmTop = 1323
              mmWidth = 10054
              BandType = 0
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              AutoSize = False
              Caption = 'P.U. de Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 131763
              mmTop = 1323
              mmWidth = 18785
              BandType = 0
            end
            object ppLabel21: TppLabel
              UserName = 'Label201'
              AutoSize = False
              Caption = 'P.U. de Venc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 151342
              mmTop = 1323
              mmWidth = 17992
              BandType = 0
            end
            object ppLabel22: TppLabel
              UserName = 'Label202'
              AutoSize = False
              Caption = 'Financeiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 169863
              mmTop = 1323
              mmWidth = 18785
              BandType = 0
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              AutoSize = False
              Caption = 'Contraparte da Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 189442
              mmTop = 1323
              mmWidth = 43127
              BandType = 0
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              AutoSize = False
              Caption = 'Indexador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 2381
              mmLeft = 233363
              mmTop = 1323
              mmWidth = 10319
              BandType = 0
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              AutoSize = False
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 244475
              mmTop = 1323
              mmWidth = 6615
              BandType = 0
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              AutoSize = False
              Caption = 'Cupon'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2381
              mmLeft = 251884
              mmTop = 1323
              mmWidth = 8202
              BandType = 0
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              AutoSize = False
              Caption = 'Realização'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 260880
              mmTop = 1323
              mmWidth = 11113
              BandType = 0
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              AutoSize = False
              Caption = 'Reversão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 272786
              mmTop = 1323
              mmWidth = 11113
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object shpOperComprDet: TppShape
              OnPrint = shpOperComprDetPrint
              UserName = 'Shape1'
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DESCCONTRAPARTE'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 529
              mmTop = 0
              mmWidth = 34131
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'LASTRO'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 35983
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DATAEMISSAO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 53975
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 68527
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'STAATIVPASS'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 86519
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'QUANTIDADE'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 92075
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'TAXA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 110331
              mmTop = 0
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'INDEXADOR'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 120915
              mmTop = 0
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'PUCOMPRA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 131763
              mmTop = 0
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'PUVENCIMENTO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 151342
              mmTop = 0
              mmWidth = 17727
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'VLRFINANCEIRO'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 169863
              mmTop = 0
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'DESCCTRPAROPER'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 189707
              mmTop = 0
              mmWidth = 43127
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'INDEXADOR'
              DataPipeline = pplCarteiraFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 233363
              mmTop = 0
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'TAXA'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 244475
              mmTop = 0
              mmWidth = 6615
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'TAXACTRPAROPER'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 251884
              mmTop = 0
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'DATARELOPER'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 260880
              mmTop = 0
              mmWidth = 10848
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'DATAREVEROPER'
              DataPipeline = pplCarteiraFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplCarteiraFundoDet'
              mmHeight = 2381
              mmLeft = 272786
              mmTop = 0
              mmWidth = 10848
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmWidth = 283634
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmLeft = 257440
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplCarteiraFundo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCarteiraFundo'
      object grpTipoRel: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RodapePrincipal: TppGroupFooterBand
        AfterPrint = RodapePrincipalAfterPrint
        BeforePrint = RodapePrincipalBeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object srptGrafico: TppSubReport
          UserName = 'srptGrafico'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplCarteiraFundo'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport8: TppChildReport
            AutoStop = False
            DataPipeline = pplCarteiraFundo
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Carterira de Fundos'
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
            Left = 280
            Top = 168
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplCarteiraFundo'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'shpCarteiraFundoTit1'
                Brush.Color = clSilver
                ParentWidth = True
                Pen.Style = psClear
                mmHeight = 4763
                mmLeft = 0
                mmTop = 264
                mmWidth = 284300
                BandType = 1
              end
              object ppLabel36: TppLabel
                UserName = 'Label36'
                Caption = 'Gráfico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 1852
                mmTop = 529
                mmWidth = 12435
                BandType = 1
              end
            end
            object ppDetailBand9: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand8: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 102923
              mmPrintPosition = 0
              object ppDPTeeChart1: TppDPTeeChart
                UserName = 'DPTeeChart1'
                mmHeight = 101336
                mmLeft = 265
                mmTop = 265
                mmWidth = 284428
                BandType = 7
                object ppDPTeeChartControl1: TppDPTeeChartControl
                  Left = 0
                  Top = 0
                  Width = 400
                  Height = 250
                  Title.Text.Strings = (
                    '')
                  Title.Visible = False
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  Legend.TextStyle = ltsPlain
                  View3DWalls = False
                  BevelOuter = bvNone
                  Color = clWhite
                  object Series1: TPieSeries
                    Tag = 3
                    Marks.ArrowLength = 8
                    Marks.Style = smsLabelPercent
                    Marks.Visible = True
                    DataSource = pplCarteiraFundo
                    SeriesColor = clRed
                    Title = 'Percentuais'
                    XLabelsSource = 'TIPOREL'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'TOTAL'
                    Top = 5
                  end
                end
              end
            end
          end
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'CODTIPREL'
      DataPipeline = pplCarteiraFundo
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCarteiraFundo'
      object cabGrpTipoRel: TppGroupHeaderBand
        AfterPrint = cabGrpTipoRelAfterPrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCarteiraFundoTit: TppShape
          UserName = 'shpCarteiraFundoTit'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'TIPOREL'
          DataPipeline = pplCarteiraFundo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCarteiraFundo'
          mmHeight = 3969
          mmLeft = 794
          mmTop = 265
          mmWidth = 67469
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label1'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 220663
          mmTop = 529
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'TOTAL'
          DataPipeline = pplCarteiraFundo
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCarteiraFundo'
          mmHeight = 3969
          mmLeft = 229659
          mmTop = 529
          mmWidth = 53711
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryCarteiraFundoDet: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      
        #9' FUN.DESCFUNDOINVEST, FUN.IDFUNDOINVEST, MOV.CODTIPREL, MOV.TIP' +
        'OREL, MOV.DESCCONTRAPARTE, MOV.CODIGO, MOV.LASTRO,'
      
        '         MOV.DATAOPER, MOV.DATACOMPRA, MOV.DATAEMISSAO, MOV.DATA' +
        'VENCIMENTO, MOV.STAATIVPASS, MOV.VLRPRINCIPAL, MOV.QUANTIDADE,'
      
        '         MOV.TAXA, MOV.INDEXADOR, MOV.PUCOMPRA, MOV.PUVENCIMENTO' +
        ', MOV.VLRFINANCEIRO, MOV.CUPOMTAXA, MOV.CODSNDDEBENTURE,'
      
        '         MOV.QTDDEBENTURES, MOV.STAGARANTIA, MOV.DESCCTRPAROPER,' +
        ' MOV.INDEXADORCTRPAR, MOV.PERCTRPAROPER, MOV.TAXACTRPAROPER,'
      
        '         MOV.DATARELOPER, MOV.DATAREVEROPER, MOV.DESCINVESTIMENT' +
        'O, MOV.DATAMOV, MOV.VLRAJUSTE, MOV.INDEXADORPASS, MOV.TAXAPASSIV' +
        'O,'
      
        #9' MOV.VLRFINANCPASS, MOV.INDEXADORATIVO, MOV.TAXAATIVO, MOV.VLRF' +
        'INANCATIVO, MOV.TAXAPASSIVOPRE, MOV.TAXAATIVOPRE,'
      
        #9' MOV.EMISSOR, MOV.DESCCORRETORA, MOV.TIPOCORRETORA, MOV.CNPJCOR' +
        'RETORA, MOV.NUMOPERACAO, MOV.VLRTABBOVESPA,'
      
        #9' MOV.VLRDEVBOVESPA, MOV.VLREFEPGBOVESPA, MOV.VLRTABBMF, MOV.VLR' +
        'DEVBMF, MOV.VLREFEPGBMF, MOV.VLRTABBOLSA,'
      
        #9' MOV.VLRDEVBOLSA, MOV.VLREFEPGBOLSA, MOV.DESCOUTRASCONTAS, MOV.' +
        'VLRCONTAS, PLA.PLANPRVCONTABPATRO'
      'FROM'
      '('
      
        'SELECT OC.IDFUNDOINVEST, 1 AS CODTIPREL, '#39'Operações Compromissad' +
        'as'#39' AS TIPOREL,'
      '       OC.DESCCONTRAPARTE, '#39#39' AS CODIGO, OC.LASTRO,'
      
        '       OC.DATAOPER,  OC.DATAEMISSAO AS DATACOMPRA, OC.DATAEMISSA' +
        'O, OC.DATAVENCIMENTO, OC.STAATIVPASS,'
      
        '       (0) AS VLRPRINCIPAL, OC.QUANTIDADE, OC.TAXA, OC.INDEXADOR' +
        ', OC.PUCOMPRA, OC.PUVENCIMENTO,'
      
        '       OC.VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBENTURE' +
        ', (0) AS QTDDEBENTURES, '#39#39' AS STAGARANTIA,'
      
        '       OC.DESCCTRPAROPER, OC.INDEXADORCTRPAR, OC.PERCTRPAROPER, ' +
        'OC.TAXACTRPAROPER,'
      '       OC.DATARELOPER, OC.DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, OC.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDOOPERCOMPR OC'
      'WHERE  OC.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '       OC.DATAOPER  '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)            AND'
      '      (OC.IDFUNDOINVEST     = :IDFUNDOINVEST))  OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ''
      'UNION'
      
        'SELECT TP.IDFUNDOINVEST, 2 AS CODTIPREL, '#39'Títulos Privados'#39' AS T' +
        'IPOREL,'
      '       TP.DESCCONTRAPARTE, TP.CODIGO, '#39#39' AS LASTRO,'
      
        '       TP.DATAOPER, TP.DATACOMPRA, TP.DATACOMPRA AS DATAEMISSAO,' +
        ' TP.DATAVENCIMENTO, TP.STAATIVPASS,'
      
        '       TP.VLRPRINCIPAL, (0) AS QUANTIDADE, TP.TAXA, TP.INDEXADOR' +
        ', (0) AS PUCOMPRA, (0) AS PUVENCIMENTO,'
      
        '       TP.VLRFINANCEIRO, TP.CUPOMTAXA, TP.CODSNDDEBENTURE, TP.QT' +
        'DDEBENTURES, TP.STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, TP.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDOTITPRIVADOS TP'
      'WHERE  TP.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '       TP.DATAOPER '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)            AND'
      '      (TP.IDFUNDOINVEST     = :IDFUNDOINVEST))  OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ''
      'UNION'
      
        'SELECT TP.IDFUNDOINVEST, 3 AS CODTIPREL, '#39'Títulos Públicos'#39' AS T' +
        'IPOREL,'
      '       TP.DESCCONTRAPARTE, TP.CODIGO, '#39#39' AS LASTRO,'
      
        '       TP.DATAOPER, TP.DATACOMPRA, TP.DATAEMISSAO, TP.DATAVENCIM' +
        'ENTO, TP.STAATIVPASS,'
      
        '       (0) AS VLRPRINCIPAL, TP.QUANTIDADE, TP.TAXA, TP.INDEXADOR' +
        ', TP.PUCOMPRA, TP.PUVENCIMENTO,'
      
        '       TP.VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBENTURE' +
        ', (0) AS QTDDEBENTURES, TP.STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, TP.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDOTITPUBLICOS TP'
      'WHERE  TP.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '       TP.DATAOPER '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)            AND'
      '      (TP.IDFUNDOINVEST     = :IDFUNDOINVEST))  OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ''
      'UNION'
      
        'SELECT FC.IDFUNDOINVEST, 4 AS CODTIPREL, '#39'Bolsas (BM&F e BOVESPA' +
        ')'#39' AS TIPOREL,'
      '       '#39#39' AS DESCCONTRAPARTE, '#39#39' AS CODIGO, '#39#39' AS LASTRO,'
      
        '       SYSDATE AS DATAOPER, SYSDATE AS DATACOMPRA, SYSDATE AS DA' +
        'TAEMISSAO, SYSDATE AS DATAVENCIMENTO, FC.STAATIVPASS,'
      
        '       (0) AS VLRPRINCIPAL, QUANTIDADE, (0) AS TAXA, '#39#39' AS INDEX' +
        'ADOR, (0) AS PUCOMPRA, (0) AS PUVENCIMENTO,'
      
        '       FC.VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBENTURE' +
        ', (0) AS QTDDEBENTURES, '#39#39' AS STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       IV.DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJUSTE' +
        ','
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, FC.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDOCARTACOES FC, INVESTIMENTO IV'
      'WHERE  FC.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR AND'
      '       FC.DATAMOV '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)            AND'
      '      (FC.IDFUNDOINVEST     = :IDFUNDOINVEST))  OR'
      '        (:IDFUNDOINVEST IS NULL) )              AND'
      '       IV.IDINVESTIMENTO(+) = FC.IDINVESTIMENTO'
      ''
      'UNION'
      'SELECT FS.IDFUNDOINVEST, 5 AS CODTIPREL, '#39'SWAP'#39' AS TIPOREL,'
      '       FS.DESCCONTRAPARTE, FS.CODIGO, '#39#39' AS LASTRO,'
      
        '       FS.DATAOPER, FS.DATACOMPRA, SYSDATE AS DATAEMISSAO, FS.DA' +
        'TAVENCIMENTO, '#39#39' AS STAATIVPASS,'
      
        '       FS.VLRPRINCIPAL, (0) AS QUANTIDADE, (0) AS TAXA, '#39#39' AS IN' +
        'DEXADOR, (0) AS PUCOMPRA, (0) AS PUVENCIMENTO,'
      
        '       (0) AS VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBEN' +
        'TURE, (0) AS QTDDEBENTURES, FS.STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      '       FS.INDEXADORPASS, FS.TAXAPASSIVO, FS.VLRFINANCPASS,'
      '       FS.INDEXADORATIVO, FS.TAXAATIVO, FS.VLRFINANCATIVO,'
      '       FS.TAXAPASSIVOPRE, FS.TAXAATIVOPRE, FS.EMISSOR,'
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, FS.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDOSWAP FS'
      'WHERE  FS.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '       FS.DATAOPER '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '      (FS.IDFUNDOINVEST     = :IDFUNDOINVEST))   OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ''
      'UNION'
      
        'SELECT FD.IDFUNDOINVEST, 6 AS CODTIPREL, '#39'Despesas com Corretage' +
        'm'#39' AS TIPOREL,'
      '       '#39#39' AS DESCCONTRAPARTE, '#39#39' AS CODIGO, '#39#39' AS LASTRO,'
      
        '       SYSDATE AS DATAOPER, SYSDATE AS DATACOMPRA, SYSDATE AS DA' +
        'TAEMISSAO, SYSDATE AS DATAVENCIMENTO, '#39#39' AS STAATIVPASS,'
      
        '       (0) AS VLRPRINCIPAL, (0) AS QUANTIDADE, (0) AS TAXA, '#39#39' A' +
        'S INDEXADOR, (0) AS PUCOMPRA, (0) AS PUVENCIMENTO,'
      
        '       (0) AS VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBEN' +
        'TURE, (0) AS QTDDEBENTURES, '#39#39' AS STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       FD.DESCCORRETORA, FD.TIPOCORRETORA, FD.CNPJCORRETORA, FD.' +
        'NUMOPERACAO,'
      
        '       FD.VLRTABBOVESPA, FD.VLRDEVBOVESPA, FD.VLREFEPGBOVESPA, F' +
        'D.VLRTABBMF, FD.VLRDEVBMF,'
      
        '       FD.VLREFEPGBMF, FD.VLRTABBOLSA, FD.VLRDEVBOLSA, FD.VLREFE' +
        'PGBOLSA,'
      
        '       '#39#39' AS DESCOUTRASCONTAS, (0) AS VLRCONTAS, FD.IDPLANPREVCT' +
        'BPATR'
      'FROM   FDODESPCORRET FD'
      'WHERE  FD.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '       FD.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '      (FD.IDFUNDOINVEST     = :IDFUNDOINVEST))   OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ''
      'UNION'
      
        'SELECT FC.IDFUNDOINVEST, 7 AS CODTIPREL, '#39'Outras Contas'#39' AS TIPO' +
        'REL,'
      '       '#39#39' AS DESCCONTRAPARTE, '#39#39' AS CODIGO, '#39#39' AS LASTRO,'
      
        '       SYSDATE AS DATAOPER, SYSDATE AS DATACOMPRA, SYSDATE AS DA' +
        'TAEMISSAO, SYSDATE AS DATAVENCIMENTO, '#39#39' AS STAATIVPASS,'
      
        '       (0) AS VLRPRINCIPAL, (0) AS QUANTIDADE, (0) AS TAXA, '#39#39' A' +
        'S INDEXADOR, (0) AS PUCOMPRA, (0) AS PUVENCIMENTO,'
      
        '       (0) AS VLRFINANCEIRO, (0) AS CUPOMTAXA, '#39#39' AS CODSNDDEBEN' +
        'TURE, (0) AS QTDDEBENTURES, '#39#39' AS STAGARANTIA,'
      
        '       '#39#39' AS DESCCTRPAROPER, '#39#39' AS INDEXADORCTRPAR, (0) AS PERCT' +
        'RPAROPER, (0) AS TAXACTRPAROPER,'
      '       SYSDATE AS DATARELOPER, SYSDATE AS DATAREVEROPER,'
      
        '       '#39#39' AS DESCINVESTIMENTO, SYSDATE AS DATAMOV, (0) AS VLRAJU' +
        'STE,'
      
        '       '#39#39' AS INDEXADORPASS, (0) AS TAXAPASSIVO, (0) AS VLRFINANC' +
        'PASS,'
      
        '       '#39#39' AS INDEXADORATIVO, (0) AS TAXAATIVO, (0) AS VLRFINANCA' +
        'TIVO,'
      
        '       (0) AS TAXAPASSIVOPRE, (0) AS TAXAATIVOPRE, '#39#39' AS EMISSOR' +
        ','
      
        '       '#39#39' AS DESCCORRETORA, '#39#39' AS TIPOCORRETORA, '#39#39' AS CNPJCORRE' +
        'TORA, (0) AS NUMOPERACAO,'
      
        '       (0) AS VLRTABBOVESPA, (0) AS VLRDEVBOVESPA, (0) AS VLREFE' +
        'PGBOVESPA, (0) AS VLRTABBMF, (0) AS VLRDEVBMF,'
      
        '       (0) AS VLREFEPGBMF, (0) AS VLRTABBOLSA, (0) AS VLRDEVBOLS' +
        'A, (0) AS VLREFEPGBOLSA,'
      '       FC.DESCOUTRASCONTAS, FC.VLRCONTAS, FC.IDPLANPREVCTBPATR'
      'FROM   FDOOUTRASCONTAS FC'
      'WHERE  FC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '       FC.DATAOPER '#9'    = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      '      (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '      (FC.IDFUNDOINVEST     = :IDFUNDOINVEST))   OR'
      '        (:IDFUNDOINVEST IS NULL) )'
      ') MOV,'
      
        '      (SELECT HISTFUNDOINVEST.IDFUNDOINVEST, HISTFUNDOINVEST.DES' +
        'CFUNDOINVEST'
      
        '       FROM HISTFUNDOINVEST WHERE (HISTFUNDOINVEST.IDFUNDOINVEST' +
        ' || TO_CHAR(HISTFUNDOINVEST.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39 +
        ') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      '           WHERE (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '             AND (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FUN,'
      '       VWPLANPREVCTBPATR PLA'
      'WHERE'
      '    FUN.IDFUNDOINVEST     = MOV.IDFUNDOINVEST'
      'AND PLA.IDPLANPREVCTBPATR = MOV.IDPLANPREVCTBPATR'
      ''
      
        'ORDER BY FUN.DESCFUNDOINVEST, MOV.CODTIPREL, MOV.DESCCONTRAPARTE' +
        ', MOV.DATACOMPRA, MOV.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 159
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryCarteiraFundoDetCODTIPREL: TFloatField
      FieldName = 'CODTIPREL'
    end
    object qryCarteiraFundoDetTIPOREL: TStringField
      FieldName = 'TIPOREL'
      Size = 24
    end
    object qryCarteiraFundoDetDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryCarteiraFundoDetDESCCONTRAPARTE: TStringField
      FieldName = 'DESCCONTRAPARTE'
      Size = 60
    end
    object qryCarteiraFundoDetCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object qryCarteiraFundoDetLASTRO: TStringField
      FieldName = 'LASTRO'
    end
    object qryCarteiraFundoDetDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
    end
    object qryCarteiraFundoDetDATACOMPRA: TDateTimeField
      FieldName = 'DATACOMPRA'
    end
    object qryCarteiraFundoDetDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryCarteiraFundoDetDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCarteiraFundoDetSTAATIVPASS: TStringField
      FieldName = 'STAATIVPASS'
      Size = 1
    end
    object qryCarteiraFundoDetVLRPRINCIPAL: TFloatField
      FieldName = 'VLRPRINCIPAL'
    end
    object qryCarteiraFundoDetQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryCarteiraFundoDetTAXA: TFloatField
      FieldName = 'TAXA'
    end
    object qryCarteiraFundoDetINDEXADOR: TStringField
      FieldName = 'INDEXADOR'
    end
    object qryCarteiraFundoDetPUCOMPRA: TFloatField
      FieldName = 'PUCOMPRA'
    end
    object qryCarteiraFundoDetPUVENCIMENTO: TFloatField
      FieldName = 'PUVENCIMENTO'
    end
    object qryCarteiraFundoDetVLRFINANCEIRO: TFloatField
      FieldName = 'VLRFINANCEIRO'
    end
    object qryCarteiraFundoDetCUPOMTAXA: TFloatField
      FieldName = 'CUPOMTAXA'
    end
    object qryCarteiraFundoDetCODSNDDEBENTURE: TStringField
      FieldName = 'CODSNDDEBENTURE'
      Size = 30
    end
    object qryCarteiraFundoDetQTDDEBENTURES: TFloatField
      FieldName = 'QTDDEBENTURES'
    end
    object qryCarteiraFundoDetSTAGARANTIA: TStringField
      FieldName = 'STAGARANTIA'
      Size = 1
    end
    object qryCarteiraFundoDetDESCCTRPAROPER: TStringField
      FieldName = 'DESCCTRPAROPER'
      Size = 60
    end
    object qryCarteiraFundoDetINDEXADORCTRPAR: TStringField
      FieldName = 'INDEXADORCTRPAR'
    end
    object qryCarteiraFundoDetPERCTRPAROPER: TFloatField
      FieldName = 'PERCTRPAROPER'
    end
    object qryCarteiraFundoDetTAXACTRPAROPER: TFloatField
      FieldName = 'TAXACTRPAROPER'
    end
    object qryCarteiraFundoDetDATARELOPER: TDateTimeField
      FieldName = 'DATARELOPER'
    end
    object qryCarteiraFundoDetDATAREVEROPER: TDateTimeField
      FieldName = 'DATAREVEROPER'
    end
    object qryCarteiraFundoDetDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryCarteiraFundoDetVLRAJUSTE: TFloatField
      FieldName = 'VLRAJUSTE'
    end
    object qryCarteiraFundoDetINDEXADORPASS: TStringField
      FieldName = 'INDEXADORPASS'
    end
    object qryCarteiraFundoDetTAXAPASSIVO: TFloatField
      FieldName = 'TAXAPASSIVO'
    end
    object qryCarteiraFundoDetVLRFINANCPASS: TFloatField
      FieldName = 'VLRFINANCPASS'
    end
    object qryCarteiraFundoDetINDEXADORATIVO: TStringField
      FieldName = 'INDEXADORATIVO'
    end
    object qryCarteiraFundoDetTAXAATIVO: TFloatField
      FieldName = 'TAXAATIVO'
    end
    object qryCarteiraFundoDetVLRFINANCATIVO: TFloatField
      FieldName = 'VLRFINANCATIVO'
    end
    object qryCarteiraFundoDetTAXAPASSIVOPRE: TFloatField
      FieldName = 'TAXAPASSIVOPRE'
    end
    object qryCarteiraFundoDetTAXAATIVOPRE: TFloatField
      FieldName = 'TAXAATIVOPRE'
    end
    object qryCarteiraFundoDetEMISSOR: TStringField
      FieldName = 'EMISSOR'
      Size = 30
    end
    object qryCarteiraFundoDetDESCCORRETORA: TStringField
      FieldName = 'DESCCORRETORA'
      Size = 60
    end
    object qryCarteiraFundoDetTIPOCORRETORA: TStringField
      FieldName = 'TIPOCORRETORA'
    end
    object qryCarteiraFundoDetCNPJCORRETORA: TStringField
      FieldName = 'CNPJCORRETORA'
      Size = 18
    end
    object qryCarteiraFundoDetNUMOPERACAO: TFloatField
      FieldName = 'NUMOPERACAO'
    end
    object qryCarteiraFundoDetVLRTABBOVESPA: TFloatField
      FieldName = 'VLRTABBOVESPA'
    end
    object qryCarteiraFundoDetVLRDEVBOVESPA: TFloatField
      FieldName = 'VLRDEVBOVESPA'
    end
    object qryCarteiraFundoDetVLREFEPGBOVESPA: TFloatField
      FieldName = 'VLREFEPGBOVESPA'
    end
    object qryCarteiraFundoDetVLRTABBMF: TFloatField
      FieldName = 'VLRTABBMF'
    end
    object qryCarteiraFundoDetVLRDEVBMF: TFloatField
      FieldName = 'VLRDEVBMF'
    end
    object qryCarteiraFundoDetVLREFEPGBMF: TFloatField
      FieldName = 'VLREFEPGBMF'
    end
    object qryCarteiraFundoDetVLRTABBOLSA: TFloatField
      FieldName = 'VLRTABBOLSA'
    end
    object qryCarteiraFundoDetVLRDEVBOLSA: TFloatField
      FieldName = 'VLRDEVBOLSA'
    end
    object qryCarteiraFundoDetVLREFEPGBOLSA: TFloatField
      FieldName = 'VLREFEPGBOLSA'
    end
    object qryCarteiraFundoDetDESCOUTRASCONTAS: TStringField
      FieldName = 'DESCOUTRASCONTAS'
      Size = 60
    end
    object qryCarteiraFundoDetVLRCONTAS: TFloatField
      FieldName = 'VLRCONTAS'
    end
    object qryCarteiraFundoDetDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 1
    end
    object qryCarteiraFundoDetIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryCarteiraFundoDetPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryCarteiraFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FUN.DESCFUNDOINVEST, MOV.IDFUNDOINVEST, MOV.CODTIPREL, MO' +
        'V.TIPOREL, MOV.TOTAL'
      'FROM '
      '('
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RFINANCEIRO) AS TOTAL'
      
        'FROM (SELECT OC.IDFUNDOINVEST, 1 AS CODTIPREL, '#39'Operações Compro' +
        'missadas'#39' AS TIPOREL,'
      '             OC.VLRFINANCEIRO'
      '      FROM   FDOOPERCOMPR OC'
      
        '      WHERE  OC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             OC.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '            (OC.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL) )) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RFINANCEIRO) AS TOTAL'
      
        'FROM (SELECT TP.IDFUNDOINVEST, 2 AS CODTIPREL, '#39'Títulos Privados' +
        #39' AS TIPOREL,'
      '             TP.VLRFINANCEIRO'
      '      FROM   FDOTITPRIVADOS TP'
      
        '      WHERE  TP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             TP.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '            (TP.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL))) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RFINANCEIRO) AS TOTAL'
      
        'FROM (SELECT TP.IDFUNDOINVEST, 3 AS CODTIPREL, '#39'Títulos Públicos' +
        #39' AS TIPOREL,'
      '             TP.VLRFINANCEIRO'
      '      FROM   FDOTITPUBLICOS TP'
      
        '      WHERE  TP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             TP.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '            (TP.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL))) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RFINANCEIRO) AS TOTAL'
      
        'FROM (SELECT FC.IDFUNDOINVEST, 4 AS CODTIPREL, '#39'Bolsas (BM&F e B' +
        'OVESPA)'#39' AS TIPOREL,'
      '             FC.VLRFINANCEIRO'
      '      FROM   FDOCARTACOES FC, INVESTIMENTO IV'
      
        '      WHERE  FC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             FC.DATAMOV           = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '            (FC.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL) )             AND'
      '             IV.IDINVESTIMENTO(+) = FC.IDINVESTIMENTO) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RPRINCIPAL) AS TOTAL'
      
        'FROM (SELECT FS.IDFUNDOINVEST, 5 AS CODTIPREL, '#39'SWAP'#39' AS TIPOREL' +
        ','
      '             FS.VLRPRINCIPAL'
      '      FROM   FDOSWAP FS'
      
        '      WHERE  FS.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             FS.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)        AND'
      '            (FS.IDFUNDOINVEST =:IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL))) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.ST' +
        'OTAL) AS TOTAL'
      
        'FROM (SELECT FD.IDFUNDOINVEST, 6 AS CODTIPREL, '#39'Despesas com Cor' +
        'retagem'#39' AS TIPOREL,'
      
        '             (FD.VLREFEPGBOVESPA + FD.VLREFEPGBMF + FD.VLREFEPGB' +
        'OLSA) AS STOTAL'
      '      FROM   FDODESPCORRET FD'
      
        '      WHERE  FD.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR          ' +
        'AND'
      
        '             FD.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)           AND'
      '            (FD.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      '              (:IDFUNDOINVEST IS NULL))) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ''
      'UNION'
      
        'SELECT TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL, SUM(TAB.VL' +
        'RCONTAS) AS TOTAL'
      
        'FROM (SELECT FC.IDFUNDOINVEST, 7 AS CODTIPREL, '#39'Outras Contas'#39' A' +
        'S TIPOREL,'
      '             FC.VLRCONTAS'
      '      FROM   FDOOUTRASCONTAS FC'
      '      WHERE  FC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      
        '             FC.DATAOPER          = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '            (((:IDFUNDOINVEST IS NOT NULL)             AND'
      '            (FC.IDFUNDOINVEST     = :IDFUNDOINVEST))   OR'
      '              (:IDFUNDOINVEST IS NULL))) TAB'
      'GROUP BY TAB.IDFUNDOINVEST, TAB.CODTIPREL, TAB.TIPOREL'
      ') MOV,'
      
        '      (SELECT HISTFUNDOINVEST.DESCFUNDOINVEST, HISTFUNDOINVEST.I' +
        'DFUNDOINVEST'
      '       FROM HISTFUNDOINVEST'
      
        '       WHERE (HISTFUNDOINVEST.IDFUNDOINVEST || TO_CHAR(HISTFUNDO' +
        'INVEST.DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT HI.IDFUNDOINVEST || TO_CHAR(MAX(HI.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HI, TIPOFUNDOINVEST TI'
      '           WHERE (TI.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '             AND (HI.DTAVIGENCIA       < TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '             AND (HI.IDTIPOFUNDOINVEST = TI.IDTIPOFUNDOINVEST)'
      '           GROUP BY HI.IDFUNDOINVEST))) FUN'
      'WHERE'
      '   FUN.IDFUNDOINVEST  = MOV.IDFUNDOINVEST'
      ''
      'ORDER BY FUN.DESCFUNDOINVEST, MOV.CODTIPREL')
    ValidateWithMask = True
    Left = 54
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryCarteiraFundoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryCarteiraFundoCODTIPREL: TFloatField
      FieldName = 'CODTIPREL'
    end
    object qryCarteiraFundoTIPOREL: TStringField
      FieldName = 'TIPOREL'
      Size = 24
    end
    object qryCarteiraFundoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object pplCarteiraFundo: TppBDEPipeline
    DataSource = dsCarteiraFundo
    UserName = 'lCarteiraFundo'
    Left = 56
    Top = 61
  end
  object pplCarteiraFundoDet: TppBDEPipeline
    DataSource = dsCarteiraFundoDet
    UserName = 'lCarteiraFundoDet'
    Left = 159
    Top = 61
  end
  object dsCarteiraFundo: TwwDataSource
    AutoEdit = False
    DataSet = qryCarteiraFundo
    Left = 55
    Top = 109
  end
  object dsCarteiraFundoDet: TwwDataSource
    AutoEdit = False
    DataSet = qryCarteiraFundoDet
    Left = 159
    Top = 109
  end
end
