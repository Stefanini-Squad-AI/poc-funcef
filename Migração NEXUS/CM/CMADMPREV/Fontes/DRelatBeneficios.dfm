inherited dtmRelatBeneficios: TdtmRelatBeneficios
  Left = 186
  Top = 109
  Width = 800
  Height = 558
  Caption = 'Relatórios de Benefícios'
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 296
    Top = 104
    Width = 153
    Height = 89
  end
  object Bevel2: TBevel [1]
    Left = 584
    Top = 104
    Width = 161
    Height = 89
  end
  object Bevel3: TBevel [2]
    Left = 464
    Top = 104
    Width = 105
    Height = 89
  end
  object Bevel4: TBevel [3]
    Left = 296
    Top = 200
    Width = 177
    Height = 89
  end
  object Bevel5: TBevel [4]
    Left = 624
    Top = 200
    Width = 121
    Height = 89
  end
  object Bevel6: TBevel [5]
    Left = 480
    Top = 200
    Width = 137
    Height = 89
  end
  object Bevel7: TBevel [6]
    Left = 336
    Top = 408
    Width = 377
    Height = 89
  end
  inherited pplExemplo: TppBDEPipeline
    Left = 101
    Top = 0
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
    Left = 55
    Top = 0
  end
  inherited qryExemplo: TwwQuery
    Left = 10
    Top = 0
  end
  inherited rpExemplo: TppReport
    Left = 138
    Top = 0
    DataPipelineName = 'pplExemplo'
  end
  object rpBenefConcAdiant: TppReport
    AutoStop = False
    DataPipeline = pplBenefConcAdiant
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 153
    Top = 50
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBenefConcAdiant'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Benefícios Concedidos em Adiantamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 86254
        mmTop = 26194
        mmWidth = 109538
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
        BandType = 0
      end
      object rpBoletasDBImage1: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpBoletasDBText1: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object rpBoletasDBText2: TppDBText
        UserName = 'rpBoletasDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpBoletasDBText31: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object rpBoletasDBText32: TppDBText
        UserName = 'rpBoletasDBText32'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 95250
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object rpBoletasDBText33: TppDBText
        UserName = 'rpBoletasDBText33'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object rpBoletasDBText34: TppDBText
        UserName = 'rpBoletasDBText34'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object rpBoletasDBText35: TppDBText
        UserName = 'rpBoletasDBText35'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object rpBoletasLabel24: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object rpBoletasDBText36: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabelMesRef: TppLabel
        UserName = 'LabelMesRef'
        Caption = 'Mês de Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 225425
        mmTop = 27252
        mmWidth = 33338
        BandType = 0
      end
      object ppLabelmesreferencia: TppLabel
        UserName = 'Label13'
        Caption = 'Label13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 262203
        mmTop = 27252
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'BENEFICIARIO'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAINICIOFUND'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 0
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PERCPROVISORIO'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 0
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAFINALPREVISTA'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 186267
        mmTop = 0
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplBenefConcAdiant
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 229394
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORATUAL'
        DataPipeline = pplBenefConcAdiant
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MATRICULA'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel32: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 3175
        mmWidth = 278078
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
        mmHeight = 3440
        mmLeft = 133615
        mmTop = 3175
        mmWidth = 18256
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
        mmLeft = 252413
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 0
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc11'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplBenefConcAdiant
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 4191
        mmLeft = 216281
        mmTop = 0
        mmWidth = 36661
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc12'
        AutoSize = True
        DataField = 'VALORATUAL'
        DataPipeline = pplBenefConcAdiant
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 4191
        mmLeft = 241904
        mmTop = 0
        mmWidth = 36703
        BandType = 7
      end
      object ppDBCalcTotal: TppDBCalc
        OnPrint = ppDBCalcTotalPrint
        UserName = 'DBCalcBenef3'
        AutoSize = True
        DataField = 'CONTADOR'
        DataPipeline = pplBenefConcAdiant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplBenefConcAdiant'
        mmHeight = 4191
        mmLeft = 14944
        mmTop = 0
        mmWidth = 33740
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = pplBenefConcAdiant
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefConcAdiant'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1852
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'PATROCINADORA'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 1852
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'Label101'
          Caption = 'Total  Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 216281
          mmTop = 0
          mmWidth = 36661
          BandType = 5
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Total por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 241904
          mmTop = 0
          mmWidth = 36703
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcPatro: TppDBCalc
          OnPrint = ppDBCalcPatroPrint
          UserName = 'DBCalcBenef2'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 14944
          mmTop = 0
          mmWidth = 33740
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplBenefConcAdiant
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefConcAdiant'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'NOMEPLANO'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 1588
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label10'
          Caption = 'Total Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 216281
          mmTop = 0
          mmWidth = 36661
          BandType = 5
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label102'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 27252
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 241904
          mmTop = 0
          mmWidth = 36703
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalcPlano: TppDBCalc
          OnPrint = ppDBCalcPlanoPrint
          UserName = 'DBCalcBenef1'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 14944
          mmTop = 0
          mmWidth = 33740
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = pplBenefConcAdiant
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefConcAdiant'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'NOMEBENEF'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 0
          mmWidth = 22754
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label4'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 6085
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label5'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 59531
          mmTop = 6085
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label6'
          Caption = 'DIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 134938
          mmTop = 6085
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label7'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 161925
          mmTop = 6085
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Data Limite Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 186267
          mmTop = 6085
          mmWidth = 36513
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label12'
          Caption = 'Valor Integral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 231775
          mmTop = 6085
          mmWidth = 21167
          BandType = 3
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 261144
          mmTop = 6085
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label8'
          Caption = 'Total Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 20638
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 216281
          mmTop = 0
          mmWidth = 36661
          BandType = 5
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total por Benefício :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 34660
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefConcAdiant
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 241904
          mmTop = 0
          mmWidth = 36703
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalcBenef: TppDBCalc
          OnPrint = ppDBCalcBenefPrint
          UserName = 'DBCalcBenef'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefConcAdiant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefConcAdiant'
          mmHeight = 4191
          mmLeft = 14944
          mmTop = 0
          mmWidth = 33740
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryBenefConcAdiant: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      
        '1 AS CONTADOR, BENEF.NOME AS BENEFICIARIO, PATR.NOME AS PATROCIN' +
        'ADORA,'
      'B.NOME AS NOMEBENEF, PL.NOME AS NOMEPLANO ,'
      'D.MATRICULA, BE.DATAINICIOFUND, BE.DATACONCESSAO, '
      
        'BE.PERCPROVISORIO, BE.DATAFINALPREVISTA ,BE.VALORTOTAL, BE.VALOR' +
        'ATUAL'
      'FROM  PESSOA BENEF, PESSOA PATR, PATRO , '
      '      DEPENTIT D, BENEFICIO B, PLANPREV PL, BENEFBFCIARIO BE'
      'WHERE PATRO.IDPESSOA =  PATR.IDPESSOA'
      '      AND PATRO.IDPESSOA  = BE.IDPESSJUR'
      '      AND BENEF.IDPESSOA  = D.IDPESSOA'
      '      AND D.IDPESSOA   = BE.IDPESSOA'
      '      AND B.IDBENEFICIO   = BE.IDBENEFICIO'
      '      AND PL.IDPLANOPREV = BE.IDPLANOPREV'
      '      AND ROWNUM < 10'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 49
  end
  object dsBenefConcAdiant: TwwDataSource
    DataSet = qryBenefConcAdiant
    Left = 50
    Top = 50
  end
  object pplBenefConcAdiant: TppBDEPipeline
    DataSource = dsBenefConcAdiant
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'pplBenefConcAdiant'
    Left = 106
    Top = 50
    object pplBenefConcAdiantppField1: TppField
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField2: TppField
      FieldAlias = 'BENEFICIARIO'
      FieldName = 'BENEFICIARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField4: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField5: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField7: TppField
      FieldAlias = 'DATAINICIOFUND'
      FieldName = 'DATAINICIOFUND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField8: TppField
      FieldAlias = 'DATACONCESSAO'
      FieldName = 'DATACONCESSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField9: TppField
      FieldAlias = 'PERCPROVISORIO'
      FieldName = 'PERCPROVISORIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField10: TppField
      FieldAlias = 'DATAFINALPREVISTA'
      FieldName = 'DATAFINALPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField11: TppField
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplBenefConcAdiantppField12: TppField
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 288
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 256
    Top = 10
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 224
    Top = 8
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object rpBenefAdiantPgtoIntegral: TppReport
    AutoStop = False
    DataPipeline = pplBenefAdiantPgtoIntegral
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 153
    Top = 100
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBenefAdiantPgtoIntegral'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'Label11'
        Caption = 
          'Relatório de Benefícios de Adiantamento Concedidos em Pagamento ' +
          'Integral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65881
        mmTop = 26194
        mmWidth = 156104
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'rpBoletasDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'rpBoletasDBText32'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 95779
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'rpBoletasDBText33'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'rpBoletasDBText34'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'rpBoletasDBText35'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'LabelMesRef'
        Caption = 'Mês de Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 232040
        mmTop = 27252
        mmWidth = 33338
        BandType = 0
      end
      object pplMesReferenciaPgtoInt: TppLabel
        UserName = 'Label13'
        Caption = 'Label13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265378
        mmTop = 27252
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText19: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'BENEFICIARIO'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAINICIOFUND'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 0
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PERCPROVISORIO'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 0
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'DATAFINALPREVISTA'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 186267
        mmTop = 0
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplBenefAdiantPgtoIntegral
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 229394
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORATUAL'
        DataPipeline = pplBenefAdiantPgtoIntegral
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'MATRICULA'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
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
      object ppLabel22: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 3175
        mmWidth = 198702
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
        mmHeight = 3440
        mmLeft = 138377
        mmTop = 3175
        mmWidth = 18256
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
        mmLeft = 252678
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 0
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc102'
        AutoSize = True
        DataField = 'VALORATUAL'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 4191
        mmLeft = 241396
        mmTop = 0
        mmWidth = 37211
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc103'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 4191
        mmLeft = 215731
        mmTop = 0
        mmWidth = 37211
        BandType = 7
      end
      object ppDBTotal: TppDBCalc
        OnPrint = ppDBTotalPrint
        UserName = 'DBTotal'
        AutoSize = True
        DataField = 'CONTADOR'
        DataPipeline = pplBenefAdiantPgtoIntegral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplBenefAdiantPgtoIntegral'
        mmHeight = 4191
        mmLeft = 14690
        mmTop = 0
        mmWidth = 33994
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = pplBenefAdiantPgtoIntegral
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefAdiantPgtoIntegral'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel23: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'PATROCINADORA'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 2117
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel24: TppLabel
          UserName = 'Label101'
          Caption = 'Total  Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 215731
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label16'
          Caption = 'Total por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc7'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 241396
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 0
        end
        object ppDBPatro: TppDBCalc
          OnPrint = ppDBPatroPrint
          UserName = 'DBPatro'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 14690
          mmTop = 0
          mmWidth = 33994
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplBenefAdiantPgtoIntegral
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefAdiantPgtoIntegral'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel26: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText27: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'NOMEPLANO'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 1588
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel27: TppLabel
          UserName = 'Label10'
          Caption = 'Total Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 215731
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label102'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 0
          mmWidth = 27252
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 241396
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 1
        end
        object ppDBPlano: TppDBCalc
          OnPrint = ppDBPlanoPrint
          UserName = 'DBPlano'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 14690
          mmTop = 0
          mmWidth = 33994
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = pplBenefAdiantPgtoIntegral
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBenefAdiantPgtoIntegral'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel29: TppLabel
          UserName = 'Label3'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppDBText28: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'NOMEBENEF'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 0
          mmWidth = 22754
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          UserName = 'Label4'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 6085
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel31: TppLabel
          UserName = 'Label5'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 59531
          mmTop = 6085
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel33: TppLabel
          UserName = 'Label6'
          Caption = 'DIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 134673
          mmTop = 6085
          mmWidth = 5821
          BandType = 3
          GroupNo = 2
        end
        object ppLabel34: TppLabel
          UserName = 'Label7'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 161925
          mmTop = 6085
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object ppLabel35: TppLabel
          UserName = 'Label9'
          Caption = 'Data Limite Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 186267
          mmTop = 6085
          mmWidth = 36513
          BandType = 3
          GroupNo = 2
        end
        object ppLabel36: TppLabel
          UserName = 'Label12'
          Caption = 'Valor Integral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 231775
          mmTop = 6085
          mmWidth = 21167
          BandType = 3
          GroupNo = 2
        end
        object ppLabel37: TppLabel
          UserName = 'Label17'
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 261144
          mmTop = 6085
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'Label8'
          Caption = 'Total Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 203730
          mmTop = 0
          mmWidth = 20638
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 215731
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 2
        end
        object ppLabel39: TppLabel
          UserName = 'Label14'
          Caption = 'Total por Benefício :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 34660
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'VALORATUAL'
          DataPipeline = pplBenefAdiantPgtoIntegral
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 241396
          mmTop = 0
          mmWidth = 37211
          BandType = 5
          GroupNo = 2
        end
        object ppDBBenef: TppDBCalc
          OnPrint = ppDBBenefPrint
          UserName = 'DBBenef'
          AutoSize = True
          DataField = 'CONTADOR'
          DataPipeline = pplBenefAdiantPgtoIntegral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplBenefAdiantPgtoIntegral'
          mmHeight = 4191
          mmLeft = 14690
          mmTop = 0
          mmWidth = 33994
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryBenefAdiantPgtoIntegral: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      
        '1 AS CONTADOR, BENEF.NOME AS BENEFICIARIO, PATR.NOME AS PATROCIN' +
        'ADORA,'
      'B.NOME AS NOMEBENEF, PL.NOME AS NOMEPLANO ,'
      'D.MATRICULA, BE.DATAINICIOFUND, BE.DATACONCESSAO, '
      
        'BE.PERCPROVISORIO, BE.DATAFINALPREVISTA ,BE.VALORTOTAL, BE.VALOR' +
        'ATUAL'
      'FROM  PESSOA BENEF, PESSOA PATR, PATRO , '
      '      DEPENTIT D, BENEFICIO B, PLANPREV PL, BENEFBFCIARIO BE'
      'WHERE PATRO.IDPESSOA =  PATR.IDPESSOA'
      '      AND PATRO.IDPESSOA  = BE.IDPESSJUR'
      '      AND BENEF.IDPESSOA  = D.IDPESSOA'
      '      AND D.IDPESSOA   = BE.IDPESSOA'
      '      AND B.IDBENEFICIO   = BE.IDBENEFICIO'
      '      AND PL.IDPLANOPREV = BE.IDPLANOPREV'
      '      AND ROWNUM < 10'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 99
  end
  object dsBenefAdiantPgtoIntegral: TwwDataSource
    DataSet = qryBenefAdiantPgtoIntegral
    Left = 50
    Top = 100
  end
  object pplBenefAdiantPgtoIntegral: TppBDEPipeline
    DataSource = dsBenefAdiantPgtoIntegral
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'pplBenefAdiantPgtoIntegral'
    Left = 106
    Top = 100
    object pplBenefAdiantPgtoIntegralppField1: TppField
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField2: TppField
      FieldAlias = 'BENEFICIARIO'
      FieldName = 'BENEFICIARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField4: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField5: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField7: TppField
      FieldAlias = 'DATAINICIOFUND'
      FieldName = 'DATAINICIOFUND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField8: TppField
      FieldAlias = 'DATACONCESSAO'
      FieldName = 'DATACONCESSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField9: TppField
      FieldAlias = 'PERCPROVISORIO'
      FieldName = 'PERCPROVISORIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField10: TppField
      FieldAlias = 'DATAFINALPREVISTA'
      FieldName = 'DATAFINALPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField11: TppField
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplBenefAdiantPgtoIntegralppField12: TppField
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object rpParticipSituacao: TppReport
    AutoStop = False
    DataPipeline = pplParticipSituacao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 153
    Top = 146
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplParticipSituacao'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Participantes por Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 102129
        mmTop = 26194
        mmWidth = 79375
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'rpBoletasDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'rpBoletasDBText32'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'rpBoletasDBText33'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'rpBoletasDBText34'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'rpBoletasDBText35'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'LabelMesRef'
        Caption = 'Mês de Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 220928
        mmTop = 27252
        mmWidth = 33338
        BandType = 0
      end
      object ppLabelparticipSituacao: TppLabel
        UserName = 'LabelMesRef1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 255059
        mmTop = 27252
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText37: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PARTICIPANTE'
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 73025
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'DESCPART'
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'DESCPLANO'
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel43: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 280723
        BandType = 8
      end
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
        mmHeight = 3440
        mmLeft = 138642
        mmTop = 3175
        mmWidth = 18256
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
        mmLeft = 254530
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 0
        mmWidth = 20902
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc27'
        AutoSize = True
        DataPipeline = pplParticipSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplParticipSituacao'
        mmHeight = 4233
        mmLeft = 44450
        mmTop = 0
        mmWidth = 15081
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel44: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 529
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 44979
          mmTop = 529
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel46: TppLabel
          UserName = 'Label16'
          Caption = 'Total por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc9'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 42333
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel47: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 794
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText45: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 44979
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel49: TppLabel
          UserName = 'Label102'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 27252
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc8'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 42333
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'DESCFUNC'
      DataPipeline = pplParticipSituacao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParticipSituacao'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLabel48: TppLabel
          UserName = 'Label48'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 9790
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 73025
          mmTop = 9790
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          Caption = 'Situação na Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 146579
          mmTop = 9790
          mmWidth = 41804
          BandType = 3
          GroupNo = 1
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'Situação no Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 207698
          mmTop = 9790
          mmWidth = 52388
          BandType = 3
          GroupNo = 1
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Situação na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 37835
          BandType = 3
          GroupNo = 2
        end
        object ppDBText39: TppDBText
          UserName = 'DBText39'
          AutoSize = True
          DataField = 'DESCFUNC'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 44979
          mmTop = 1588
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel55: TppLabel
          UserName = 'Label55'
          Caption = 'Total por Fundação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 34396
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataPipeline = pplParticipSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParticipSituacao'
          mmHeight = 4233
          mmLeft = 42333
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryParticipSituacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      
        'SELECT  1 AS CONTADOR, PLANO.NOME AS PLANO , PART.NOME AS PARTIC' +
        'IPANTE,'
      '       PATRO.NOME AS PATROCINADORA,'
      '       E.MATRICULA, SPART.DESCRICAO AS DESCPART,'
      
        '       SFUNC.DESCRICAO AS DESCFUNC, SPLANO.DESCRICAO AS DESCPLAN' +
        'O'
      ''
      'FROM    PESSOA PATRO, PESSOA PART, ELEGPATRO E, PARTPREVPLAN P,'
      '        SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO,'
      '        EVENTOSPREV EPREV, PLANPREV PLANO'
      ''
      'WHERE PLANO.IDPLANOPREV         = P.IDPLANOPREV'
      '      AND PATRO.IDPESSOA        = P.IDPESSJUR'
      '      AND PART.IDPESSOA         = P.IDPESSOA'
      '      AND E.IDPESSJUR           = P.IDPESSJUR'
      '      AND E.IDPESSOA            = P.IDPESSOA'
      '      AND E.IDSITFUNC           = SFUNC.IDSITFUNC'
      '      AND P.IDSITPART           = SPART.IDSITPART      '
      '      AND P.IDSITPLANOPREV      = SPLANO.IDSITPLANOPREV'
      '      AND P.IDPESSOA            = EPREV.IDPESSOA       '
      '      AND P.IDPESSJUR           = EPREV.IDPESSJUR      '
      '      AND P.IDPLANOPREV         = EPREV.IDPLANOPREV    '
      '      AND P.SEQPROPOSTA         = EPREV.SEQPROPOSTA'
      '      AND ROWNUM < 10'
      ' ')
    ValidateWithMask = True
    Left = 8
    Top = 145
  end
  object dsParticipSituacao: TwwDataSource
    DataSet = qryParticipSituacao
    Left = 50
    Top = 146
  end
  object pplParticipSituacao: TppBDEPipeline
    DataSource = dsParticipSituacao
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'pplParticipSituacao'
    Left = 106
    Top = 146
  end
  object ppConcINSSRegiao: TppBDEPipeline
    DataSource = dsConcINSSRegiao
    UserName = 'ConcINSSRegiao'
    Left = 101
    Top = 192
    object ppConcINSSRegiaoppField1: TppField
      FieldAlias = 'SINONIMO'
      FieldName = 'SINONIMO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppConcINSSRegiaoppField2: TppField
      FieldAlias = 'UFCONCESSOR'
      FieldName = 'UFCONCESSOR'
      FieldLength = 36
      DisplayWidth = 36
      Position = 1
    end
    object ppConcINSSRegiaoppField3: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppConcINSSRegiaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppConcINSSRegiaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORMANT'
      FieldName = 'VALORMANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppConcINSSRegiaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsConcINSSRegiao: TwwDataSource
    DataSet = qryConcINSSRegiao
    Left = 47
    Top = 192
  end
  object qryConcINSSRegiao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UF.SINONIMO,'
      #9'E.CODESTADO||'#39' - '#39'||E.NOMEESTADO AS UFCONCESSOR,'
      #9'D.MESREFERENCIA,'
      
        #9'SUM(DECODE(PD.FLGDESCONTO,0,VALORINSS, - VALORINSS)) AS VALORIN' +
        'SS,'
      
        #9'SUM(DECODE(PD.FLGDESCONTO,0,VALORMANT, - VALORMANT)) AS VALORMA' +
        'NT,'
      #9'SUM(DECODE(PD.FLGDESCONTO,0,VALORINSS, - VALORINSS)) -'
      #9#9'SUM(DECODE(PD.FLGDESCONTO,0,VALORMANT, - VALORMANT)) AS DIF'#9
      'FROM DETCONCINSS D, PROVDESC PD, UFINSS UF, ESTADO E'
      'WHERE D.CODMANTENEDORINSS = UF.CODORGAOLOCAL'
      '  AND D.IDRUBRICA = PD.IDPROVENTO'
      '  AND UF.SIGLA = E.CODESTADO'
      
        'GROUP BY UF.SINONIMO, E.CODESTADO||'#39' - '#39'||E.NOMEESTADO , D.MESRE' +
        'FERENCIA'
      '')
    ValidateWithMask = True
    Left = 2
    Top = 192
  end
  object rpConcINSSRegiao: TppReport
    AutoStop = False
    DataPipeline = ppConcINSSRegiao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 154
    Top = 192
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConcINSSRegiao'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Reembolso do INSS - Conciliação Por Região'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 53446
        mmTop = 29369
        mmWidth = 91546
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ShapeDet: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'VALORINSS'
        DataPipeline = ppConcINSSRegiao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcINSSRegiao'
        mmHeight = 3969
        mmLeft = 53446
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'VALORMANT'
        DataPipeline = ppConcINSSRegiao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcINSSRegiao'
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'DIF'
        DataPipeline = ppConcINSSRegiao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcINSSRegiao'
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppConcINSSRegiao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConcINSSRegiao'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel58: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
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
    object ppGroup10: TppGroup
      BreakName = 'UFCONCESSOR'
      DataPipeline = ppConcINSSRegiao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConcINSSRegiao'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppLabel57: TppLabel
          UserName = 'Label57'
          Caption = 'Órgão Local INSS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 3704
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'DBText52'
          DataField = 'UFCONCESSOR'
          DataPipeline = ppConcINSSRegiao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConcINSSRegiao'
          mmHeight = 4233
          mmLeft = 32544
          mmTop = 3704
          mmWidth = 60061
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          Caption = 'Sinônimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 110067
          mmTop = 3704
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText53: TppDBText
          UserName = 'DBText53'
          DataField = 'SINONIMO'
          DataPipeline = ppConcINSSRegiao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConcINSSRegiao'
          mmHeight = 4233
          mmLeft = 128852
          mmTop = 3704
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label61'
          Caption = 'Valor INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 62706
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'Label62'
          Caption = 'Valor Mantenedora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 12171
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 160338
          mmTop = 12171
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line3'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 15610
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          Caption = 'Mês Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 12171
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Pen.Color = clWindowText
          Pen.Width = 3
          Position = lpBottom
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel64: TppLabel
          UserName = 'Label64'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 1058
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALORINSS'
          DataPipeline = ppConcINSSRegiao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConcINSSRegiao'
          mmHeight = 3969
          mmLeft = 53446
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORMANT'
          DataPipeline = ppConcINSSRegiao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConcINSSRegiao'
          mmHeight = 3969
          mmLeft = 102659
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'DIF'
          DataPipeline = ppConcINSSRegiao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConcINSSRegiao'
          mmHeight = 3969
          mmLeft = 148696
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppConsPartINSS: TppBDEPipeline
    DataSource = dsConsPartINSS
    UserName = 'ConsPartINSS'
    Left = 101
    Top = 243
    object ppConsPartINSSppField1: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppConsPartINSSppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppConsPartINSSppField3: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppConsPartINSSppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORMANT'
      FieldName = 'VALORMANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppConsPartINSSppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBRICAINSS'
      FieldName = 'RUBRICAINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppConsPartINSSppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppConsPartINSSppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODMANTENEDORINSS'
      FieldName = 'CODMANTENEDORINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppConsPartINSSppField8: TppField
      FieldAlias = 'NUMPROCINSS'
      FieldName = 'NUMPROCINSS'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppConsPartINSSppField9: TppField
      FieldAlias = 'MANT'
      FieldName = 'MANT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppConsPartINSSppField10: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppConsPartINSSppField11: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppConsPartINSSppField12: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppConsPartINSSppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppConsPartINSSppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object dsConsPartINSS: TwwDataSource
    DataSet = qryConsPartINSS
    Left = 47
    Top = 243
  end
  object qryConsPartINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(D.VALORMANT,0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(D.VALORINSS,0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      #9'     M.NOME MANT,'
      '        BPP.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFICIARIOPP BPP, MANTENEDORA M, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '  AND M.CODMANTENEDORA = BPP.CODMANTENEDORA'
      '  AND P.IDPESSOA       = D.IDPESSOA'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      ''
      'UNION'
      ''
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(D.VALORMANT,0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(D.VALORINSS,0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      #9'     M.NOME MANT,'
      '        E.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFBFCIARIO BF, MANTENEDORA M, ELEGPATRO E, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND BF.IDPESSOA = D.IDPESSOA'
      '  AND BF.NUMPROCINSS = D.NUMPROCINSS'
      '  AND BF.IDBENEFICIO = D.IDBENEFICIO'
      '  AND E.IDPESSOA     = D.IDPESSOA'
      '  AND P.IDPESSOA     = E.IDPESSOA'
      '  AND M.FLGFUNDACAO = 1'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      ''
      'UNION'
      ''
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(D.VALORMANT,0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(D.VALORINSS,0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      #9'     M.NOME MANT,'
      '        E.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFBFCIARIO BF, MANTENEDORA M, DEPENTIT E, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND BF.IDPESSOA = D.IDPESSOA'
      '  AND BF.NUMPROCINSS = D.NUMPROCINSS'
      '  AND BF.IDBENEFICIO = D.IDBENEFICIO'
      '  AND E.IDPESSOA     = D.IDPESSOA'
      '  AND P.IDPESSOA     = E.IDPESSOA'
      '  AND M.FLGFUNDACAO = 1'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      '')
    ValidateWithMask = True
    Left = 2
    Top = 243
    ParamData = <
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
      end>
  end
  object rpConsPartINSS: TppReport
    AutoStop = False
    DataPipeline = ppConsPartINSS
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 154
    Top = 243
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConsPartINSS'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 54769
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label65'
        Caption = 'Reembolso do INSS - Extrato Individual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 61383
        mmTop = 27781
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label57'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 41804
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label59'
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 35190
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label61'
        Caption = 'Valor INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 48683
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label62'
        Caption = 'Valor Mant'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 152929
        mmTop = 48683
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label63'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 48683
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label60'
        Caption = 'Mês Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 48683
        mmWidth = 25929
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 197380
        BandType = 0
      end
      object lblMatricula: TppLabel
        UserName = 'lblMatricula'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17463
        mmTop = 35190
        mmWidth = 18785
        BandType = 0
      end
      object lblParticipante: TppLabel
        UserName = 'lblParticipante'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11642
        mmTop = 41804
        mmWidth = 78317
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 53711
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Nº Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 41010
        mmTop = 35190
        mmWidth = 21960
        BandType = 0
      end
      object lblNumBenef: TppLabel
        UserName = 'lblMatricula1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 64029
        mmTop = 35190
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'Mantenedora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 35190
        mmWidth = 23283
        BandType = 0
      end
      object lblMant: TppLabel
        UserName = 'lblMatricula2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 113506
        mmTop = 35190
        mmWidth = 33073
        BandType = 0
      end
      object lblOrgaoMant: TppLabel
        UserName = 'lblOrgaoMant'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 35190
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        Caption = 'Órgão Mant.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 35190
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label601'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 29104
        mmTop = 48683
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'Espécie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 95250
        mmTop = 41804
        mmWidth = 14552
        BandType = 0
      end
      object lblEspecie: TppLabel
        UserName = 'lblParticipante1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110331
        mmTop = 41804
        mmWidth = 83079
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText55'
        DataField = 'VALORINSS'
        DataPipeline = ppConsPartINSS
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsPartINSS'
        mmHeight = 3969
        mmLeft = 124884
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText56'
        DataField = 'VALORMANT'
        DataPipeline = ppConsPartINSS
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsPartINSS'
        mmHeight = 3969
        mmLeft = 152400
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText57'
        DataField = 'DIF'
        DataPipeline = ppConsPartINSS
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsPartINSS'
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText54'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppConsPartINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsPartINSS'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'DESCRICAO'
        DataPipeline = ppConsPartINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsPartINSS'
        mmHeight = 3969
        mmLeft = 29104
        mmTop = 0
        mmWidth = 83608
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel68: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 2910
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
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
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppConsPartINSS
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConsPartINSS'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DIF'
          DataPipeline = ppConsPartINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsPartINSS'
          mmHeight = 4233
          mmLeft = 175684
          mmTop = 1323
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VALORMANT'
          DataPipeline = ppConsPartINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsPartINSS'
          mmHeight = 4233
          mmLeft = 150548
          mmTop = 1323
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VALORINSS'
          DataPipeline = ppConsPartINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsPartINSS'
          mmHeight = 4233
          mmLeft = 122767
          mmTop = 1323
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppLabel75: TppLabel
          UserName = 'Label75'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1323
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDsgnINSS: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpConsPartINSS
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 216
    Top = 248
  end
  object ppResultINSS: TppBDEPipeline
    DataSource = dsResultINSS
    UserName = 'ResultINSS'
    Left = 320
    Top = 240
  end
  object dsResultINSS: TwwDataSource
    DataSet = qryResultINSS
    Left = 320
    Top = 224
  end
  object qryResultINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUBSTR(NVL(PL.NOME, M.NOME), 1, 40) AS ENTIDADE,'
      '   D.NUMPROCINSS,'
      '   B.CODBENEFICIO,'
      
        '   NVL(E.MATRICULA, NVL(BPP.MATRICULA, DP.MATRICULA)) AS MATRICU' +
        'LA,'
      '   P.NOME,'
      '   PD.CODPROVDESC,'
      '   RXI.RUBRICAINSS,'
      '   NVL(D.VALORINSS, 0) AS VALORINSS,'
      '   NVL(D.VALORMANT, 0) AS VALORMANT,'
      '   (NVL(D.VALORMANT, 0) - NVL(D.VALORINSS, 0)) AS DIFERENCA'
      ''
      'FROM'
      '   ('
      '   SELECT'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO,'
      '      SUM(NVL(DCI.VALORINSS, 0)) AS VALORINSS,'
      '      SUM(NVL(DCI.VALORMANT, 0)) AS VALORMANT'
      '   FROM'
      '      DETCONCINSS DCI'
      '   WHERE'
      '      DCI.MESREFERENCIA =:PMESREFERENCIA'
      '   GROUP BY'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO'
      '   ) D,'
      ''
      '   PESSOA         P,'
      '   ELEGPATRO      E,'
      '   PARTPREVPLAN   PPP,'
      '   BENEFICIARIOPP BPP,'
      '   DEPENTIT       DP,'
      '   PROVDESC       PD,'
      '   BENEFICIO      B,'
      '   PLANPREV       PL,'
      '   RUBRICAXINSS   RXI,'
      '   MANTENEDORA    M'
      ''
      'WHERE'
      '       SUBSTR(RXI.RUBRICAINSS, 2, 3)  <> '#39'121'#39
      ''
      '   AND NVL(D.VALORINSS,0)       <> NVL(D.VALORMANT,0)'
      '   AND D.IDRUBRICA               = PD.IDPROVENTO'
      '   AND E.IDPESSOA(+)             = D.IDPESSOA'
      '   AND DP.IDPESSOA(+)            = D.IDPESSOA'
      '   AND PPP.IDPESSOA(+)           = DP.IDTITULAR'
      '   AND PL.IDPLANOPREV(+)         = PPP.IDPLANOPREV'
      ''
      '   AND BPP.IDBENEFICIARIOPP(+)   = D.IDPESSOA'
      '   AND M.CODMANTENEDORA(+)       = BPP.CODMANTENEDORA'
      ''
      '   AND P.IDPESSOA                = D.IDPESSOA'
      '   AND D.IDBENEFICIO             = B.IDBENEFICIO'
      '   AND RXI.IDRUBRICA             = D.IDRUBRICA'
      '   AND RXI.FLGRUBCENTRAL         = 1'
      ''
      'ORDER BY'
      '   ENTIDADE, P.NOME')
    ValidateWithMask = True
    Left = 320
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end>
    object qryResultINSSENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Size = 40
    end
    object qryResultINSSNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryResultINSSCODBENEFICIO: TStringField
      FieldName = 'CODBENEFICIO'
      Size = 6
    end
    object qryResultINSSMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryResultINSSNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryResultINSSCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryResultINSSRUBRICAINSS: TFloatField
      FieldName = 'RUBRICAINSS'
    end
    object qryResultINSSVALORINSS: TFloatField
      FieldName = 'VALORINSS'
    end
    object qryResultINSSVALORMANT: TFloatField
      FieldName = 'VALORMANT'
    end
    object qryResultINSSDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
  end
  object rpResultINSS: TppReport
    AutoStop = False
    DataPipeline = ppResultINSS
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 408
    Top = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResultINSS'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBImage5: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText74: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText76: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText77: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText78: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label65'
        Caption = 'Reembolso do INSS - Diferença de Proventos Pagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 91281
        mmTop = 27781
        mmWidth = 105304
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText55'
        DataField = 'CODPROVDESC'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 166423
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText57'
        DataField = 'VALORINSS'
        DataPipeline = ppResultINSS
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 236009
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 60590
        mmTop = 0
        mmWidth = 98161
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        DataField = 'VALORMANT'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        DataField = 'CODBENEFICIO'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3970
        mmLeft = 23813
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText118: TppDBText
        UserName = 'DBText118'
        DataField = 'MATRICULA'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 34925
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText119'
        DataField = 'DIFERENCA'
        DataPipeline = ppResultINSS
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3704
        mmLeft = 261409
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText120'
        DataField = 'RUBRICAINSS'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3969
        mmLeft = 218546
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel100: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBCalc40: TppDBCalc
        UserName = 'DBCalc40'
        DataField = 'DIFERENCA'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3175
        mmLeft = 259028
        mmTop = 0
        mmWidth = 19579
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc401'
        DataField = 'VALORINSS'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3175
        mmLeft = 233098
        mmTop = 0
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc42: TppDBCalc
        UserName = 'DBCalc402'
        DataField = 'VALORMANT'
        DataPipeline = ppResultINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResultINSS'
        mmHeight = 3175
        mmLeft = 180446
        mmTop = 0
        mmWidth = 22754
        BandType = 7
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 0
        mmWidth = 15610
        BandType = 7
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 2381
        mmLeft = 155311
        mmTop = 4498
        mmWidth = 128852
        BandType = 7
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppResultINSS
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResultINSS'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine16: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          Caption = 'Nº Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel84: TppLabel
          UserName = 'Label84'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 60590
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label85'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 167217
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 35190
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel87: TppLabel
          UserName = 'Label87'
          Caption = 'Vlr. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 241036
          mmTop = 6879
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel88: TppLabel
          UserName = 'Label88'
          Caption = 'Vlr Mant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 189442
          mmTop = 6879
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel127: TppLabel
          UserName = 'Label127'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 264055
          mmTop = 6879
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label86'
          Caption = 'Fonte Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 48948
          mmTop = 0
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText80'
          AutoSize = True
          DataField = 'ENTIDADE'
          DataPipeline = ppResultINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppResultINSS'
          mmHeight = 3969
          mmLeft = 81492
          mmTop = 0
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel128: TppLabel
          UserName = 'Label128'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 218282
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel168: TppLabel
          UserName = 'Label168'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object lblMesRefResult: TppLabel
          UserName = 'lblMesRefResult'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 26988
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine27: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2910
          mmLeft = 0
          mmTop = 265
          mmWidth = 283898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc53: TppDBCalc
          UserName = 'DBCalc403'
          DataField = 'DIFERENCA'
          DataPipeline = ppResultINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResultINSS'
          mmHeight = 3175
          mmLeft = 259028
          mmTop = 2381
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc54'
          DataField = 'VALORINSS'
          DataPipeline = ppResultINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResultINSS'
          mmHeight = 3175
          mmLeft = 233098
          mmTop = 2381
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc55: TppDBCalc
          UserName = 'DBCalc55'
          DataField = 'VALORMANT'
          DataPipeline = ppResultINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResultINSS'
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 2381
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppLabel184: TppLabel
          UserName = 'Label184'
          Caption = 'Total Entidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 152665
          mmTop = 2381
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDsgnResultINSS: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpResultINSS
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 408
    Top = 208
  end
  object ppProvProvisionados: TppBDEPipeline
    DataSource = dsProvProvisionados
    UserName = 'ProvProvisionado'
    Left = 109
    Top = 300
  end
  object dsProvProvisionados: TwwDataSource
    DataSet = qryProvProvisionados
    Left = 55
    Top = 300
  end
  object qryProvProvisionados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   PATRO,'
      '         PLANO,'
      '         SIGLA,'
      '         NVL(VLR_PROV,0) VLR_PROV,'
      '         NVL(VLR_GLO,0) VLR_GLO,'
      '         NVL(VLR_CPMF,0) VLR_CPMF'
      'FROM ('
      ''
      '  SELECT PROVENTO.PATRO,'
      '     PROVENTO.PLANO,'
      '     PROVENTO.SIGLA,'
      '     PROVENTO.VALORINSS VLR_PROV,'
      '     GLOSA.VALORINSS VLR_GLO,'
      '     CPMF.VALORINSS VLR_CPMF'
      '  FROM'
      '    (SELECT SUBSTR(PATRO.NOME,1,25) PATRO,'
      '       SUBSTR(PL.NOME,1,25) PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'PROVENTO'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       PARTPREVPLAN PPP,'
      '       PESSOA PATRO'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '      AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '      AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '      AND SUBSTR(RI.RUBRICAINSS,1,1) <> '#39'9'#39
      
        '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, PATRO.NOME) P' +
        'ROVENTO,'
      ''
      '    (SELECT SUBSTR(PATRO.NOME,1,25) PATRO,'
      '       SUBSTR(PL.NOME,1,25) PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'GLOSA'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      ''
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       PARTPREVPLAN PPP,'
      '       PESSOA PATRO'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '      AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '      AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '      AND SUBSTR(RI.RUBRICAINSS,1,1) = '#39'9'#39
      
        '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, PATRO.NOME) G' +
        'LOSA ,'
      ''
      '    (SELECT SUBSTR(PATRO.NOME,1,25) PATRO,'
      '       SUBSTR(PL.NOME,1,25) PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'CPMF'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      ''
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       PARTPREVPLAN PPP,'
      '       PESSOA PATRO'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '      AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '      AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '      AND RI.RUBRICAINSS = (SELECT RUBRICAINSS FROM RUBRICAXINSS'
      
        '          WHERE IDRUBRICA = (SELECT IDRUBRICACPMF FROM PARAMAPRE' +
        'V))'
      
        '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, PATRO.NOME) C' +
        'PMF'
      '    WHERE PROVENTO.PATRO '#9'= GLOSA.PATRO(+)'
      '      AND GLOSA.PATRO'#9#9'= CPMF.PATRO(+)'
      '      AND PROVENTO.PLANO'#9#9'= GLOSA.PLANO(+)'
      '      AND GLOSA.PLANO'#9#9'= CPMF.PLANO(+)'
      '      AND PROVENTO.SIGLA'#9#9'= GLOSA.SIGLA(+)'
      '      AND GLOSA.SIGLA'#9#9'= CPMF.SIGLA(+)'
      '    UNION'
      '    SELECT PROVENTO.PATRO,'
      '       PROVENTO.PLANO,'
      '       PROVENTO.SIGLA,'
      '       PROVENTO.VALORINSS VLR_PROV,'
      '       GLOSA.VALORINSS VLR_GLO,'
      '       CPMF.VALORINSS VLR_CPMF'
      '    FROM'
      '    (SELECT SUBSTR('#39'MATENEDORA '#39'||M.NOME,1,25) PATRO,'
      '       '#39#39' PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'PROVENTO'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       BENEFICIARIOPP BPP,'
      '       MANTENEDORA M'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL(+)'#9'= D.CODMANTENEDORINSS'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '      AND SUBSTR(RI.RUBRICAINSS,1,1) <> '#39'9'#39
      '      AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '      AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      
        '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, M.NOME) PROVE' +
        'NTO,'
      '    (SELECT SUBSTR('#39'MATENEDORA '#39'||M.NOME,1,25) PATRO,'
      '       '#39#39' PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'GLOSA'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       BENEFICIARIOPP BPP,'
      '       MANTENEDORA M'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL(+)'#9'= D.CODMANTENEDORINSS'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '      AND SUBSTR(RI.RUBRICAINSS,1,1) = '#39'9'#39
      '      AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '      AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      
        '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, M.NOME) GLOSA' +
        ' ,'
      '    (SELECT SUBSTR('#39'MATENEDORA '#39'||M.NOME,1,25) PATRO,'
      '       '#39#39' PLANO,'
      '       UF.SIGLA,'
      '       D.CODMANTENEDORINSS,'
      '       '#39'CPMF'#39' AS TIPO,'
      '       SUM(VALORINSS) VALORINSS,'
      '       COUNT(*)'
      '    FROM   DETCONCINSS D,'
      '       UFINSS UF,'
      '       PLANPREV PL,'
      '       RUBRICAXINSS RI,'
      '       BENEFICIARIOPP BPP,'
      '       MANTENEDORA M'
      '    WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '      AND UF.CODORGAOLOCAL(+)'#9'= D.CODMANTENEDORINSS'
      '      AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '      AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      
        '      AND RI.RUBRICAINSS = (SELECT IDRUBRICACPMF FROM PARAMAPREV' +
        ')'
      '      AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '      AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      '    GROUP BY CODMANTENEDORINSS, UF.SIGLA, PL.NOME, M.NOME) CPMF'
      '    WHERE PROVENTO.PATRO '#9'= GLOSA.PATRO(+)'
      '      AND GLOSA.PATRO'#9#9'= CPMF.PATRO(+)'
      '      AND PROVENTO.PLANO'#9#9'= GLOSA.PLANO(+)'
      '      AND GLOSA.PLANO'#9#9'= CPMF.PLANO(+)'
      '      AND PROVENTO.SIGLA'#9#9'= GLOSA.SIGLA(+)'
      '      AND GLOSA.SIGLA'#9#9'= CPMF.SIGLA(+))'
      'ORDER BY'
      '  PATRO ,   PLANO ,   SIGLA'
      ''
      '')
    ValidateWithMask = True
    Left = 10
    Top = 300
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object rpProvProvisionados: TppReport
    AutoStop = False
    DataPipeline = ppProvProvisionados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 154
    Top = 300
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppProvProvisionados'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppDBImage6: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText85: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText86: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText87: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText88: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText89: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText90: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText91: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText92: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label65'
        Caption = 'Reembolso do INSS - Proventos Provisionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 56621
        mmTop = 27781
        mmWidth = 95250
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      AfterPrint = ppDetailBand7AfterPrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object banda1: TppShape
        UserName = 'banda1'
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197909
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'DBText95'
        DataField = 'SIGLA'
        DataPipeline = ppProvProvisionados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppProvProvisionados'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'DBText96'
        DataField = 'VLR_PROV'
        DataPipeline = ppProvProvisionados
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppProvProvisionados'
        mmHeight = 3969
        mmLeft = 49477
        mmTop = 529
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'VLR_GLO'
        DataPipeline = ppProvProvisionados
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppProvProvisionados'
        mmHeight = 3969
        mmLeft = 95250
        mmTop = 529
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'DBText98'
        DataField = 'VLR_CPMF'
        DataPipeline = ppProvProvisionados
        DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppProvProvisionados'
        mmHeight = 3969
        mmLeft = 141288
        mmTop = 529
        mmWidth = 32015
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel97: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 7408
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 7408
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
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
        mmTop = 7408
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSubRelProviResumoSigla: TppSubReport
        UserName = 'SubRelProviResumoSigla'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppProvResumoSigla'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppProvResumoSigla
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
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
          Left = 224
          Top = 304
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppProvResumoSigla'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 27781
            mmPrintPosition = 0
            object ppLabel104: TppLabel
              UserName = 'Label104'
              Caption = 'Sigla'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 22754
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel105: TppLabel
              UserName = 'Label105'
              Caption = 'Valor Provento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 60061
              mmTop = 22754
              mmWidth = 22754
              BandType = 1
            end
            object ppLabel106: TppLabel
              UserName = 'Label106'
              Caption = 'Valor Glosa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 110861
              mmTop = 22754
              mmWidth = 17992
              BandType = 1
            end
            object ppLabel107: TppLabel
              UserName = 'Label107'
              Caption = 'Valor CPMF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 156898
              mmTop = 22754
              mmWidth = 17992
              BandType = 1
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 27252
              mmWidth = 197115
              BandType = 1
            end
            object ppLabel103: TppLabel
              UserName = 'Label103'
              Caption = 'Resumo por Estados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5292
              mmLeft = 78052
              mmTop = 0
              mmWidth = 42598
              BandType = 1
            end
            object ppLabel111: TppLabel
              UserName = 'Label111'
              Caption = 'Referência:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 13494
              mmWidth = 18256
              BandType = 1
            end
            object lblMesRefResumo: TppLabel
              UserName = 'lblMesRefResumo'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 19050
              mmTop = 13494
              mmWidth = 14552
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            AfterPrint = ppDetailBand8AfterPrint
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object Banda2: TppShape
              UserName = 'Banda2'
              Pen.Color = clNone
              Pen.Style = psClear
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 197909
              BandType = 4
            end
            object ppDBText107: TppDBText
              UserName = 'DBText107'
              DataField = 'SIGLA'
              DataPipeline = ppProvResumoSigla
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 0
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText108: TppDBText
              UserName = 'DBText108'
              DataField = 'VLR_PROV'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 50800
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText109: TppDBText
              UserName = 'DBText109'
              DataField = 'VLR_GLO'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 96838
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText110: TppDBText
              UserName = 'DBText110'
              DataField = 'VLR_CPMF'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 142875
              mmTop = 529
              mmWidth = 32015
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'Shape6'
              mmHeight = 5556
              mmLeft = 0
              mmTop = 0
              mmWidth = 197909
              BandType = 7
            end
            object ppDBCalc33: TppDBCalc
              UserName = 'DBCalc33'
              DataField = 'VLR_PROV'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 50536
              mmTop = 794
              mmWidth = 32279
              BandType = 7
            end
            object ppDBCalc34: TppDBCalc
              UserName = 'DBCalc34'
              DataField = 'VLR_GLO'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 96838
              mmTop = 794
              mmWidth = 32015
              BandType = 7
            end
            object ppDBCalc35: TppDBCalc
              UserName = 'DBCalc35'
              DataField = 'VLR_CPMF'
              DataPipeline = ppProvResumoSigla
              DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProvResumoSigla'
              mmHeight = 3969
              mmLeft = 143140
              mmTop = 794
              mmWidth = 31750
              BandType = 7
            end
            object ppLabel102: TppLabel
              UserName = 'Label1'
              Caption = 'Total Geral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 794
              mmTop = 794
              mmWidth = 16933
              BandType = 7
            end
          end
          object ppGroup14: TppGroup
            BreakName = 'SIGLA'
            DataPipeline = ppProvResumoSigla
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group14'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppProvResumoSigla'
            object ppGroupHeaderBand14: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
              object ppLabel108: TppLabel
                UserName = 'Label108'
                Caption = 'Referência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 102394
                mmTop = 0
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel109: TppLabel
                UserName = 'Label109'
                Caption = 'Label109'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 122767
                mmTop = 0
                mmWidth = 13758
                BandType = 3
                GroupNo = 0
              end
              object ppLabel110: TppLabel
                UserName = 'Label110'
                Caption = 'Referência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 106627
                mmTop = 0
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object ppLabel114: TppLabel
                UserName = 'Label114'
                Caption = 'Referência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 116946
                mmTop = 0
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand14: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppProvProvisionados
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProvProvisionados'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel91: TppLabel
          UserName = 'Label91'
          Caption = 'Patrocinadora / Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
        end
        object ppDBText93: TppDBText
          UserName = 'DBText93'
          DataField = 'PATRO'
          DataPipeline = ppProvProvisionados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 52917
          mmTop = 0
          mmWidth = 43127
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'Label1'
          Caption = 'Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 100277
          mmTop = 0
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object lblMesReferencia: TppLabel
          UserName = 'Label2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 120650
          mmTop = 0
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 529
          mmWidth = 197909
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'VLR_PROV'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 49742
          mmTop = 1323
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLR_GLO'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 95515
          mmTop = 1323
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc29'
          DataField = 'VLR_CPMF'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 141552
          mmTop = 1323
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppLabel98: TppLabel
          UserName = 'Label98'
          Caption = 'Total por Patro/Mant.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 7673
          mmTop = 1323
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppProvProvisionados
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProvProvisionados'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15875
        mmPrintPosition = 0
        object ppLabel92: TppLabel
          UserName = 'Label92'
          Caption = 'Plano Previdenciário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 2910
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object ppDBText94: TppDBText
          UserName = 'DBText94'
          DataField = 'PLANO'
          DataPipeline = ppProvProvisionados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 37306
          mmTop = 2910
          mmWidth = 56886
          BandType = 3
          GroupNo = 1
        end
        object ppLabel93: TppLabel
          UserName = 'Label93'
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 10583
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel94: TppLabel
          UserName = 'Label94'
          Caption = 'Valor Provento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 59002
          mmTop = 10583
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object ppLabel95: TppLabel
          UserName = 'Label95'
          Caption = 'Valor Glosa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 109538
          mmTop = 10583
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel96: TppLabel
          UserName = 'Label96'
          Caption = 'Valor CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 155575
          mmTop = 10583
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 15346
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape1'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 197909
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc30'
          DataField = 'VLR_PROV'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 49477
          mmTop = 794
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'DBCalc31'
          DataField = 'VLR_GLO'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 95250
          mmTop = 794
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc32'
          DataField = 'VLR_CPMF'
          DataPipeline = ppProvProvisionados
          DisplayFormat = '###,###,##0.00;(###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProvProvisionados'
          mmHeight = 3969
          mmLeft = 141288
          mmTop = 794
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppLabel99: TppLabel
          UserName = 'Label99'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 7938
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppDsgnProvProvisionados: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpProvProvisionados
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 192
    Top = 305
  end
  object qryProvResumoSigla: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '         SIGLA,'
      '         SUM(NVL(VLR_PROV,0) ) VLR_PROV,'
      '         SUM(NVL(VLR_GLO,0)) VLR_GLO,'
      '         SUM(NVL(VLR_CPMF,0)) VLR_CPMF'
      'FROM ('
      ''
      'SELECT '#9'PROVENTO.SIGLA,'
      #9'PROVENTO.VALORINSS VLR_PROV,'
      #9'GLOSA.VALORINSS VLR_GLO,'
      #9'CPMF.VALORINSS VLR_CPMF'
      ''
      'FROM'
      '(SELECT'#9'UF.SIGLA,'
      #9#39'PROVENTO'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      'FROM   DETCONCINSS D,'
      #9'UFINSS UF,'
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'PARTPREVPLAN PPP,'
      #9'PESSOA PATRO'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '  AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '  AND SUBSTR(RI.RUBRICAINSS,1,1) <> '#39'9'#39
      'GROUP BY UF.SIGLA ) PROVENTO,'
      ''
      '(SELECT '#9'UF.SIGLA,'
      #9#39'GLOSA'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      'FROM   DETCONCINSS D,'
      #9'UFINSS UF,'
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'PARTPREVPLAN PPP,'
      #9'PESSOA PATRO'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '  AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '  AND SUBSTR(RI.RUBRICAINSS,1,1) = '#39'9'#39
      'GROUP BY UF.SIGLA ) GLOSA ,'
      ''
      '(SELECT '#9'UF.SIGLA,'
      #9#39'CPMF'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      ''
      'FROM   DETCONCINSS D,'
      #9'UFINSS UF,'
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'PARTPREVPLAN PPP,'
      #9'PESSOA PATRO'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND PPP.IDPESSOA '#9#9'= D.IDPESSOA'
      '  AND PATRO.IDPESSOA '#9'= PPP.IDPESSJUR'
      '  AND RI.RUBRICAINSS = (SELECT RUBRICAINSS FROM RUBRICAXINSS'
      #9#9'WHERE IDRUBRICA = (SELECT IDRUBRICACPMF FROM PARAMAPREV))'
      'GROUP BY UF.SIGLA) CPMF'
      'WHERE PROVENTO.SIGLA'#9#9'= GLOSA.SIGLA(+)'
      '  AND GLOSA.SIGLA'#9#9'= CPMF.SIGLA(+)'
      ''
      'UNION ALL'
      ''
      'SELECT PROVENTO.SIGLA,'
      #9'PROVENTO.VALORINSS VLR_PROV,'
      #9'GLOSA.VALORINSS VLR_GLO,'
      #9'CPMF.VALORINSS VLR_CPMF'
      'FROM'
      '(SELECT UF.SIGLA,'
      #9#39'PROVENTO'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      'FROM   DETCONCINSS D, '
      #9'UFINSS UF, '
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'BENEFICIARIOPP BPP,'
      #9'MANTENEDORA M'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND SUBSTR(RI.RUBRICAINSS,1,1) <> '#39'9'#39
      '  AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '  AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      'GROUP BY UF.SIGLA ) PROVENTO,'
      ''
      '(SELECT '#9'UF.SIGLA,'
      #9#39'GLOSA'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      'FROM   DETCONCINSS D, '
      #9'UFINSS UF, '
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'BENEFICIARIOPP BPP,'
      #9'MANTENEDORA M'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND SUBSTR(RI.RUBRICAINSS,1,1) = '#39'9'#39
      '  AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '  AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      'GROUP BY UF.SIGLA ) GLOSA ,'
      ''
      '(SELECT '#9'UF.SIGLA,'
      #9#39'CPMF'#39' AS TIPO,'
      #9'SUM(VALORINSS) VALORINSS,'
      #9'COUNT(*)'
      'FROM   DETCONCINSS D, '
      #9'UFINSS UF, '
      #9'PLANPREV PL,'
      #9'RUBRICAXINSS RI,'
      #9'BENEFICIARIOPP BPP,'
      #9'MANTENEDORA M'
      'WHERE D.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND UF.CODORGAOLOCAL '#9'= D.CODMANTENEDORINSS(+)'
      '  AND D.IDPLANOPREV '#9#9'= PL.IDPLANOPREV(+)'
      '  AND RI.IDRUBRICA '#9#9'= D.IDRUBRICA'
      '  AND RI.RUBRICAINSS = (SELECT IDRUBRICACPMF FROM PARAMAPREV)'
      '  AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '  AND M.CODMANTENEDORA'#9'= BPP.CODMANTENEDORA'
      'GROUP BY UF.SIGLA ) CPMF'
      ''
      'WHERE  PROVENTO.SIGLA'#9#9'= GLOSA.SIGLA(+)'
      '  AND GLOSA.SIGLA'#9#9'= CPMF.SIGLA(+)'
      ')'
      'GROUP BY SIGLA'
      'ORDER BY   SIGLA'
      ' ')
    ValidateWithMask = True
    Left = 16
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object dsProvResumoSigla: TwwDataSource
    DataSet = qryProvResumoSigla
    Left = 72
    Top = 352
  end
  object ppProvResumoSigla: TppBDEPipeline
    DataSource = dsProvResumoSigla
    UserName = 'ProvResumoSigla'
    Left = 120
    Top = 352
    object ppProvResumoSiglappField1: TppField
      FieldAlias = 'SIGLA'
      FieldName = 'SIGLA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppProvResumoSiglappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PROV'
      FieldName = 'VLR_PROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppProvResumoSiglappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_GLO'
      FieldName = 'VLR_GLO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppProvResumoSiglappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CPMF'
      FieldName = 'VLR_CPMF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object ppDadosImport: TppBDEPipeline
    DataSource = dsDadosImport
    UserName = 'DadosImport'
    Left = 453
    object ppDadosImportppField1: TppField
      FieldAlias = 'SIGLA'
      FieldName = 'SIGLA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppDadosImportppField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDadosImportppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object ppDadosImportppField4: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDadosImportppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDadosImportppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTOS'
      FieldName = 'PROVENTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDadosImportppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTOS'
      FieldName = 'DESCONTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDadosImportppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDadosImportppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object dsDadosImport: TwwDataSource
    DataSet = qryDadosImport
    Left = 415
  end
  object qryDadosImport: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' '#9'UF.SIGLA,'
      #9'SUBSTR(P.NOME, 1,20) ENTIDADE,'
      #9'SUBSTR(PL.NOME, 1, 20) PLANO,'
      #9'SUBSTR(PD.DESCRICAO, 1, 20) RUBRICA,'
      '  '#9'PD.IDPROVENTO AS IDRUBRICA,'
      #9'SUM(DECODE(PD.FLGDESCONTO,0, D.VALORINSS, 0)) PROVENTOS,'
      #9'SUM(DECODE(PD.FLGDESCONTO,1, D.VALORINSS, 0)) DESCONTOS,'
      #9'COUNT(DISTINCT D.IDPESSOA) TOTAL,'
      '  1 AS GRUPO'
      'FROM'
      '  PESSOA P,'
      '  DETCONCINSS D,'
      '  PARTPREVPLAN PP,'
      '  PROVDESC PD,'
      '  PLANPREV PL,'
      '  UFINSS UF'
      'WHERE'
      #9'D.MESREFERENCIA  = :MESREFERENCIA'
      'AND   PP.IDPESSOA '#9' = D.IDPESSOA'
      'AND   UF.CODORGAOLOCAL   = D.CODMANTENEDORINSS'
      'AND   PL.IDPLANOPREV'#9' = PP.IDPLANOPREV'
      'AND   P.IDPESSOA'#9' = PP.IDPESSJUR'
      'AND   D.IDRUBRICA'#9' = PD.IDPROVENTO'
      'GROUP BY'
      '  UF.SIGLA,'
      '  P.NOME,'
      '  PL.NOME,'
      '  PD.DESCRICAO,'
      '  PD.IDPROVENTO'
      ''
      'UNION ALL'
      ''
      'SELECT'
      #9'UF.SIGLA,'
      #9'SUBSTR(M.NOME, 1, 20) ENTIDADE,'
      
        #9'SUBSTR(DECODE(PL.NOME,NULL,'#39'NÃO ASSOCIADO'#39',PL.NOME), 1, 20) PLA' +
        'NO,'
      #9'SUBSTR(PD.DESCRICAO, 1, 20) RUBRICA,'
      '  '#9'PD.IDPROVENTO AS IDRUBRICA,'
      #9'SUM(DECODE(PD.FLGDESCONTO,0, D.VALORINSS, 0)) PROVENTOS,'
      #9'SUM(DECODE(PD.FLGDESCONTO,1, D.VALORINSS, 0)) DESCONTOS,'
      #9'COUNT(DISTINCT D.IDPESSOA) TOTAL,'
      '  1 AS GRUPO'
      'FROM '
      '  DETCONCINSS D,'
      '  BENEFICIARIOPP BPP,'
      '  PROVDESC PD,'
      '  MANTENEDORA M,'
      '  PLANPREV PL,'
      '  UFINSS UF'
      'WHERE'
      '      D.MESREFERENCIA '#9#9'= :MESREFERENCIA'
      'AND   UF.CODORGAOLOCAL   '#9'= D.CODMANTENEDORINSS'
      'AND   BPP.IDBENEFICIARIOPP '#9'= D.IDPESSOA'
      'AND   M.CODMANTENEDORA '#9#9'= BPP.CODMANTENEDORA'
      'AND   D.IDRUBRICA'#9#9'= PD.IDPROVENTO'
      'AND   PL.IDPLANOPREV '#9#9'= M.IDPLANOPREV'
      'GROUP BY'
      '  UF.SIGLA,'
      '  M.NOME,'
      '  PL.NOME,'
      '  PD.DESCRICAO,'
      '  PD.IDPROVENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 378
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object rbDadosImport: TppReport
    AutoStop = False
    DataPipeline = ppDadosImport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 490
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDadosImport'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppDBImage7: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText99: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText100: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText101: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText102: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText103: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText104: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText105: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText106: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label65'
        Caption = 'Reembolso do INSS - Dados Importados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284428
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 283634
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 34925
        mmWidth = 26988
        BandType = 0
      end
      object lblMesReferencia2: TppLabel
        UserName = 'lblMesReferencia2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 34925
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      AfterPrint = ppDetailBand9AfterPrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object Banda3: TppShape
        UserName = 'Banda3'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 286015
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'DBText111'
        DataField = 'SIGLA'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'DBText112'
        DataField = 'ENTIDADE'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText113: TppDBText
        UserName = 'DBText113'
        DataField = 'PLANO'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3704
        mmLeft = 78052
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText114: TppDBText
        UserName = 'DBText114'
        DataField = 'RUBRICA'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'DBText115'
        DataField = 'PROVENTOS'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3704
        mmLeft = 214842
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText116: TppDBText
        UserName = 'DBText116'
        DataField = 'DESCONTOS'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 3969
        mmLeft = 261938
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 35454
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel115: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 36513
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 36513
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable16: TppSystemVariable
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
        mmTop = 36513
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel124: TppLabel
        UserName = 'Label124'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 185473
        mmTop = 265
        mmWidth = 18785
        BandType = 7
      end
      object ppDBCalc38: TppDBCalc
        UserName = 'DBCalc38'
        DataField = 'PROVENTOS'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 4233
        mmLeft = 211403
        mmTop = 265
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc39: TppDBCalc
        UserName = 'DBCalc39'
        DataField = 'DESCONTOS'
        DataPipeline = ppDadosImport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDadosImport'
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 265
        mmWidth = 21696
        BandType = 7
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'SIGLA'
      DataPipeline = ppDadosImport
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDadosImport'
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = 'GEREG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 265
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Entidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 265
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78581
          mmTop = 265
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134144
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'Line24'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          Caption = 'Proventos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 214578
          mmTop = 265
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'Label1201'
          Caption = 'Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 261144
          mmTop = 265
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine25: TppLine
          UserName = 'Line25'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 265
          mmTop = 0
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = 'Subtotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 189971
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc36'
          DataField = 'PROVENTOS'
          DataPipeline = ppDadosImport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDadosImport'
          mmHeight = 4233
          mmLeft = 210344
          mmTop = 1058
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'DESCONTOS'
          DataPipeline = ppDadosImport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDadosImport'
          mmHeight = 4233
          mmLeft = 257440
          mmTop = 1058
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 1323
          mmLeft = 0
          mmTop = 6350
          mmWidth = 285221
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdsnDadosImport: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rbDadosImport
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 528
  end
  object ppPAB: TppBDEPipeline
    DataSource = dsPAB
    UserName = 'PAB'
    Left = 472
    Top = 144
  end
  object dsPAB: TwwDataSource
    DataSet = qryPAB
    Left = 472
    Top = 128
  end
  object qryPAB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   PL.NOME AS ENTIDADE, BF.DATAINICIOFUND, B.CODBENEFICIO, DP.MA' +
        'TRICULA,'
      
        '   P.NOME, D.NUMPROCINSS, D.VALORINSS, PD.CODPROVDESC, RXI.RUBRI' +
        'CAINSS'
      ''
      'FROM'
      '   ('
      '   SELECT'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO,'
      '      SUM(NVL(DCI.VALORINSS, 0)) AS VALORINSS,'
      '      SUM(NVL(DCI.VALORMANT, 0)) AS VALORMANT'
      '   FROM'
      '      DETCONCINSS DCI'
      '   WHERE'
      '      DCI.MESREFERENCIA =:PMESREFERENCIA'
      '   GROUP BY'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO'
      '   ) D,'
      ''
      '   PESSOA         P,'
      '   BENEFBFCIARIO  BF,'
      '   DEPENTIT       DP,'
      '   PROVDESC       PD,'
      '   RUBRICAXINSS   RXI,'
      '   BENEFICIO      B,'
      '   PLANPREV       PL'
      ''
      'WHERE'
      '       P.IDPESSOA                      = D.IDPESSOA'
      '   AND BF.IDPESSOA                     = D.IDPESSOA'
      '   AND BF.IDBENEFICIO                  = D.IDBENEFICIO'
      '   AND BF.NUMPROCINSS                  = D.NUMPROCINSS'
      '   AND DP.IDPESSOA                     = D.IDPESSOA'
      '   AND D.IDRUBRICA                     = RXI.IDRUBRICA'
      '   AND B.IDBENEFICIO                   = D.IDBENEFICIO'
      '   AND PL.IDPLANOPREV                  = BF.IDPLANOPREV'
      '   AND PD.IDPROVENTO                   = D.IDRUBRICA'
      '   AND SUBSTR(RXI.RUBRICAINSS, 1, 1)   = '#39'4'#39
      ''
      'ORDER BY'
      '   PL.NOME, P.NOME')
    ValidateWithMask = True
    Left = 472
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object ppdsnPAB: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpPAB
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 520
    Top = 128
  end
  object rpPAB: TppReport
    AutoStop = False
    DataPipeline = ppPAB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 520
    Top = 112
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPAB'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBImage8: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText121: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText122: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText123: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText124: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText125: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText126: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText127: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText128: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label65'
        Caption = 'Relatório de Pagamentos de Alteração de Benefício - PAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 83608
        mmTop = 27781
        mmWidth = 116946
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 1588
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBText129: TppDBText
        UserName = 'DBText55'
        DataField = 'RUBRICAINSS'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 202407
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText131: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText132: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 0
        mmWidth = 98161
        BandType = 4
      end
      object ppDBText133: TppDBText
        UserName = 'DBText84'
        DataField = 'VALORINSS'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 220398
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText134: TppDBText
        UserName = 'DBText117'
        DataField = 'CODBENEFICIO'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3970
        mmLeft = 29633
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText135: TppDBText
        UserName = 'DBText118'
        DataField = 'MATRICULA'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 51329
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText130: TppDBText
        UserName = 'DBText130'
        DataField = 'DATAINICIOFUND'
        DataPipeline = ppPAB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLine30: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel132: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable17: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBCalc44: TppDBCalc
        UserName = 'DBCalc401'
        DataField = 'VALORINSS'
        DataPipeline = ppPAB
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPAB'
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 0
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel133: TppLabel
        UserName = 'Label129'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 0
        mmWidth = 15610
        BandType = 7
      end
      object ppLine31: TppLine
        UserName = 'Line28'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 180711
        mmTop = 3704
        mmWidth = 104775
        BandType = 7
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppPAB
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPAB'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine32: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel134: TppLabel
          UserName = 'Label83'
          Caption = 'Nº Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel135: TppLabel
          UserName = 'Label84'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 84931
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel136: TppLabel
          UserName = 'Label85'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 203200
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel137: TppLabel
          UserName = 'Label125'
          Caption = 'Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 29633
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel138: TppLabel
          UserName = 'Label126'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 51594
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel140: TppLabel
          UserName = 'Label88'
          Caption = 'Vlr INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 226484
          mmTop = 6879
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel142: TppLabel
          UserName = 'Label86'
          Caption = 'Fonte Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 48419
          mmTop = 1058
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText138: TppDBText
          UserName = 'DBText80'
          DataField = 'ENTIDADE'
          DataPipeline = ppPAB
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppPAB'
          mmHeight = 3969
          mmLeft = 80698
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel139: TppLabel
          UserName = 'Label139'
          Caption = 'D.I.B.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 255059
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel167: TppLabel
          UserName = 'Label167'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object lblMesRefPAB: TppLabel
          UserName = 'lblMesRefPAB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 27252
          mmTop = 1058
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine33: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel141: TppLabel
          UserName = 'Label141'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'VALORINSS'
          DataPipeline = ppPAB
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppPAB'
          mmHeight = 3175
          mmLeft = 217488
          mmTop = 1323
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'Line34'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 180711
          mmTop = 5292
          mmWidth = 104775
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppGlosa: TppBDEPipeline
    DataSource = dsGlosa
    UserName = 'Glosa'
    Left = 640
    Top = 240
  end
  object dsGlosa: TwwDataSource
    DataSet = qryGlosa
    Left = 640
    Top = 224
  end
  object qryGlosa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PL.NOME AS ENTIDADE, B.CODBENEFICIO, DP.MATRICULA,'
      
        '   P.NOME, D.NUMPROCINSS, D.VALORINSS, PD.CODPROVDESC, RXI.RUBRI' +
        'CAINSS,'
      '   :PMESREFERENCIA AS MESREFERENCIA'
      ''
      'FROM'
      '   ('
      '   SELECT'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO,'
      '      SUM(NVL(DCI.VALORINSS, 0)) AS VALORINSS,'
      '      SUM(NVL(DCI.VALORMANT, 0)) AS VALORMANT'
      '   FROM'
      '      DETCONCINSS DCI'
      '   WHERE'
      '      DCI.MESREFERENCIA =:PMESREFERENCIA'
      '   GROUP BY'
      
        '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFI' +
        'CIO'
      '   ) D,'
      ''
      '   PESSOA         P,'
      '   BENEFBFCIARIO  BF,'
      '   DEPENTIT       DP,'
      '   PROVDESC       PD,'
      '   RUBRICAXINSS   RXI,'
      '   BENEFICIO      B,'
      '   PLANPREV       PL'
      ''
      'WHERE'
      '       SUBSTR(RXI.RUBRICAINSS, 1, 1) = '#39'9'#39
      '   AND P.IDPESSOA                    = D.IDPESSOA'
      '   AND BF.IDPESSOA                   = D.IDPESSOA'
      '   AND BF.IDBENEFICIO                = D.IDBENEFICIO'
      '   AND BF.NUMPROCINSS                = D.NUMPROCINSS'
      '   AND DP.IDPESSOA                   = D.IDPESSOA'
      '   AND D.IDRUBRICA                   = RXI.IDRUBRICA'
      '   AND B.IDBENEFICIO                 = D.IDBENEFICIO'
      '   AND PL.IDPLANOPREV                = BF.IDPLANOPREV'
      '   AND PD.IDPROVENTO                 = D.IDRUBRICA'
      ''
      'ORDER BY'
      '   PL.NOME, P.NOME')
    ValidateWithMask = True
    Left = 640
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object ppdsnGlosa: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpGlosa
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 696
    Top = 224
  end
  object rpGlosa: TppReport
    AutoStop = False
    DataPipeline = ppGlosa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 696
    Top = 208
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppGlosa'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBImage9: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText136: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText137: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText139: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText140: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText141: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText142: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText143: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText144: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Valores Glosados Pelo INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 104246
        mmTop = 27781
        mmWidth = 80698
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 1588
        mmTop = 33338
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBText145: TppDBText
        UserName = 'DBText55'
        DataField = 'RUBRICAINSS'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 202407
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText146: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText147: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 0
        mmWidth = 98161
        BandType = 4
      end
      object ppDBText148: TppDBText
        UserName = 'DBText84'
        DataField = 'VALORINSS'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 220398
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText149: TppDBText
        UserName = 'DBText117'
        DataField = 'CODBENEFICIO'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3970
        mmLeft = 29633
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText150: TppDBText
        UserName = 'DBText118'
        DataField = 'MATRICULA'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 51329
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText151: TppDBText
        UserName = 'DBText130'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppGlosa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel145: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable20: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand9: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBCalc45: TppDBCalc
        UserName = 'DBCalc401'
        DataField = 'VALORINSS'
        DataPipeline = ppGlosa
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppGlosa'
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 0
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel146: TppLabel
        UserName = 'Label129'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 0
        mmWidth = 15610
        BandType = 7
      end
      object ppLine37: TppLine
        UserName = 'Line28'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 180711
        mmTop = 3704
        mmWidth = 104775
        BandType = 7
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppGlosa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppGlosa'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine38: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel147: TppLabel
          UserName = 'Label83'
          Caption = 'Nº Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel148: TppLabel
          UserName = 'Label84'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 84931
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel149: TppLabel
          UserName = 'Label85'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 203200
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel150: TppLabel
          UserName = 'Label125'
          Caption = 'Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 29633
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel151: TppLabel
          UserName = 'Label126'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 51594
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel152: TppLabel
          UserName = 'Label88'
          Caption = 'Vlr. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 225425
          mmTop = 6879
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel153: TppLabel
          UserName = 'Label86'
          Caption = 'Fonte Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47361
          mmTop = 265
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText152: TppDBText
          UserName = 'DBText80'
          DataField = 'ENTIDADE'
          DataPipeline = ppGlosa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppGlosa'
          mmHeight = 3969
          mmLeft = 79375
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel154: TppLabel
          UserName = 'Label139'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 255059
          mmTop = 6879
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel166: TppLabel
          UserName = 'Label166'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 265
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object lblMesRefGlosa: TppLabel
          UserName = 'lblMesRefGlosa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 265
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine39: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel155: TppLabel
          UserName = 'Label141'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'VALORINSS'
          DataPipeline = ppGlosa
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppGlosa'
          mmHeight = 3175
          mmLeft = 217488
          mmTop = 1323
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'Line34'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 180711
          mmTop = 5292
          mmWidth = 104775
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppNLocalizados: TppBDEPipeline
    DataSource = dsNLocalizados
    UserName = 'NLocalizados'
    Left = 480
    Top = 48
  end
  object dsNLocalizados: TwwDataSource
    DataSet = qryNLocalizados
    Left = 424
    Top = 48
  end
  object qryNLocalizados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  NUMPROCINSS, ESPECIE, NOME, MOTIVO'
      'FROM'
      '  TEMPCONCINSS'
      'WHERE'
      '  MESPROCESSAMENTO = :MESREFERENCIA'
      'ORDER BY'
      '  NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object ppdsnNLocalizados: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpNLocalizados
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 616
    Top = 48
  end
  object rpNLocalizados: TppReport
    AutoStop = False
    DataPipeline = ppNLocalizados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 544
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppNLocalizados'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 49742
      mmPrintPosition = 0
      object ppDBImage10: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText153: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText154: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText155: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText156: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText157: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText158: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText159: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText160: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = 'Relação do Beneficiário Não Localizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 27781
        mmWidth = 196850
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 265
        mmTop = 33338
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label160'
        Caption = 'Num. Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 43127
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label161'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 29633
        mmTop = 43127
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label162'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 46038
        mmTop = 43127
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'Label163'
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 135996
        mmTop = 43127
        mmWidth = 11377
        BandType = 0
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 47890
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel165: TppLabel
        UserName = 'Label165'
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 36777
        mmWidth = 26988
        BandType = 0
      end
      object lblMesRefNIden: TppLabel
        UserName = 'lblMesRefNIden'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 28575
        mmTop = 36777
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 4
      end
      object ppDBText162: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppNLocalizados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppNLocalizados'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText163: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppNLocalizados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppNLocalizados'
        mmHeight = 3969
        mmLeft = 46038
        mmTop = 0
        mmWidth = 82286
        BandType = 4
      end
      object ppDBText165: TppDBText
        UserName = 'DBText117'
        DataField = 'ESPECIE'
        DataPipeline = ppNLocalizados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppNLocalizados'
        mmHeight = 3969
        mmLeft = 29633
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText166: TppDBText
        UserName = 'DBText118'
        DataField = 'MOTIVO'
        DataPipeline = ppNLocalizados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppNLocalizados'
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 0
        mmWidth = 56621
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel158: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 197115
        BandType = 8
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable22: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object ppEspecie: TppBDEPipeline
    DataSource = dsEspecie
    UserName = 'Especie'
    Left = 496
    Top = 240
  end
  object dsEspecie: TwwDataSource
    DataSet = qryEspecie
    Left = 496
    Top = 224
  end
  object qryEspecie: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PL.NOME ENTIDADE,'
      '        BF.DATAINICIOFUND,'
      '        B.CODBENEFICIO,'
      '        DP.MATRICULA,'
      '        P.NOME,'
      '        D.NUMPROCINSS,'
      '        D.VALORINSS,'
      '        PD.CODPROVDESC,'
      '        RXI.RUBRICAINSS'
      '        '
      'FROM  PESSOA P,                 '
      '      DETCONCINSS D, '
      '      BENEFBFCIARIO BF,'
      '      DEPENTIT DP,'
      '      PROVDESC PD,'
      '      RUBRICAXINSS RXI,'
      '      BENEFICIO B,'
      '      PLANPREV PL'
      'WHERE D.MESREFERENCIA         = :MESREFERENCIA'
      '  AND B.CODBENEFICIO          IN(:CODBENEFICIO)'
      '  AND P.IDPESSOA              = D.IDPESSOA'
      '  AND BF.IDPESSOA             = D.IDPESSOA'
      '  AND BF.IDBENEFICIO          = D.IDBENEFICIO'
      '  AND BF.NUMPROCINSS          = D.NUMPROCINSS'
      '  AND DP.IDPESSOA             = D.IDPESSOA'
      '  AND D.IDRUBRICA             = RXI.IDRUBRICA'
      '  AND B.IDBENEFICIO           = D.IDBENEFICIO'
      '  AND PL.IDPLANOPREV          = BF.IDPLANOPREV'
      '  AND PD.IDPROVENTO           = D.IDRUBRICA'
      'ORDER BY PL.NOME, P.NOME'
      '')
    ValidateWithMask = True
    Left = 496
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object ppdsnEspecie: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpEspecie
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 568
    Top = 224
  end
  object rpEspecie: TppReport
    AutoStop = False
    DataPipeline = ppEspecie
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 568
    Top = 208
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEspecie'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBImage11: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText169: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText170: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 76994
        BandType = 0
      end
      object ppDBText171: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText172: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText173: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText174: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText175: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 794
        BandType = 0
      end
      object ppLabel169: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText176: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Beneficiários com Espécie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107950
        mmTop = 27781
        mmWidth = 79111
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 1588
        mmTop = 33338
        mmWidth = 283898
        BandType = 0
      end
      object lblTituloEspecie: TppLabel
        UserName = 'lblTituloEspecie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 188119
        mmTop = 27781
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBText177: TppDBText
        UserName = 'DBText55'
        DataField = 'RUBRICAINSS'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 202407
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText178: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText179: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 0
        mmWidth = 98161
        BandType = 4
      end
      object ppDBText180: TppDBText
        UserName = 'DBText84'
        DataField = 'VALORINSS'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 220398
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText181: TppDBText
        UserName = 'DBText117'
        DataField = 'CODBENEFICIO'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3970
        mmLeft = 29633
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText182: TppDBText
        UserName = 'DBText118'
        DataField = 'MATRICULA'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 51329
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText183: TppDBText
        UserName = 'DBText130'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine48: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel171: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable24: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand11: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBCalc49: TppDBCalc
        UserName = 'DBCalc401'
        DataField = 'VALORINSS'
        DataPipeline = ppEspecie
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEspecie'
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 0
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel172: TppLabel
        UserName = 'Label129'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 0
        mmWidth = 15610
        BandType = 7
      end
      object ppLine49: TppLine
        UserName = 'Line28'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 180711
        mmTop = 3704
        mmWidth = 104775
        BandType = 7
      end
    end
    object ppGroup20: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppEspecie
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEspecie'
      object ppGroupHeaderBand20: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine50: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel173: TppLabel
          UserName = 'Label83'
          Caption = 'Nº Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel174: TppLabel
          UserName = 'Label84'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 84931
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel175: TppLabel
          UserName = 'Label85'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 203200
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel176: TppLabel
          UserName = 'Label125'
          Caption = 'Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 29633
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel177: TppLabel
          UserName = 'Label126'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 51594
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel178: TppLabel
          UserName = 'Label88'
          Caption = 'Vlr. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 225425
          mmTop = 6879
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel179: TppLabel
          UserName = 'Label86'
          Caption = 'Fonte Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 51594
          mmTop = 794
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText184: TppDBText
          UserName = 'DBText80'
          DataField = 'ENTIDADE'
          DataPipeline = ppEspecie
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEspecie'
          mmHeight = 3969
          mmLeft = 82550
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel180: TppLabel
          UserName = 'Label139'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 255059
          mmTop = 6879
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel164: TppLabel
          UserName = 'Label164'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 0
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object lblMesRefEpecie: TppLabel
          UserName = 'lblMesRefEpecie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 26194
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand20: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine51: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel181: TppLabel
          UserName = 'Label141'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'VALORINSS'
          DataPipeline = ppEspecie
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEspecie'
          mmHeight = 3175
          mmLeft = 217488
          mmTop = 1323
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppLine52: TppLine
          UserName = 'Line34'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 180711
          mmTop = 5292
          mmWidth = 104775
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppRubrica: TppBDEPipeline
    DataSource = dsRubrica
    UserName = 'Rubrica'
    Left = 320
    Top = 144
  end
  object dsRubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 320
    Top = 128
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PL.NOME ENTIDADE,'
      '        BF.DATAINICIOFUND,'
      '        B.CODBENEFICIO,'
      '        DP.MATRICULA,'
      '        P.NOME,'
      '        D.NUMPROCINSS,'
      '        D.VALORINSS,'
      '        PD.CODPROVDESC,'
      '        RXI.RUBRICAINSS'
      '        '
      'FROM  PESSOA P,                 '
      '      DETCONCINSS D, '
      '      BENEFBFCIARIO BF,'
      '      DEPENTIT DP,'
      '      PROVDESC PD,'
      '      RUBRICAXINSS RXI,'
      '      BENEFICIO B,'
      '      PLANPREV PL'
      'WHERE D.MESREFERENCIA         = :MESREFERENCIA'
      '  AND SUBSTR(RXI.RUBRICAINSS,2,3) IN (:RUBRICAINSS)'
      '  AND P.IDPESSOA              = D.IDPESSOA'
      '  AND BF.IDPESSOA             = D.IDPESSOA'
      '  AND BF.IDBENEFICIO          = D.IDBENEFICIO'
      '  AND BF.NUMPROCINSS          = D.NUMPROCINSS'
      '  AND DP.IDPESSOA             = D.IDPESSOA'
      '  AND D.IDRUBRICA             = RXI.IDRUBRICA'
      '  AND B.IDBENEFICIO           = D.IDBENEFICIO'
      '  AND PL.IDPLANOPREV          = BF.IDPLANOPREV'
      '  AND PD.IDPROVENTO           = D.IDRUBRICA'
      'ORDER BY PL.NOME, P.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RUBRICAINSS'
        ParamType = ptUnknown
      end>
  end
  object ppdsnRubrica: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpRubrica
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 384
    Top = 128
  end
  object rpRubrica: TppReport
    AutoStop = False
    DataPipeline = ppRubrica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 392
    Top = 112
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRubrica'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBImage12: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText185: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText186: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText187: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText188: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText189: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText190: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText191: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel182: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText192: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Beneficiários com Rubricas INSS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 85725
        mmTop = 27517
        mmWidth = 92075
        BandType = 0
      end
      object ppLine53: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 1588
        mmTop = 33338
        mmWidth = 283898
        BandType = 0
      end
      object lblTituloRubrica: TppLabel
        UserName = 'lblTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 179388
        mmTop = 27517
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'ShapeDet'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppDBText194: TppDBText
        UserName = 'DBText54'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText195: TppDBText
        UserName = 'DBText70'
        DataField = 'NOME'
        DataPipeline = ppRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 0
        mmWidth = 83344
        BandType = 4
      end
      object ppDBText197: TppDBText
        UserName = 'DBText117'
        DataField = 'CODBENEFICIO'
        DataPipeline = ppRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3970
        mmLeft = 23813
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText198: TppDBText
        UserName = 'DBText118'
        DataField = 'MATRICULA'
        DataPipeline = ppRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3969
        mmLeft = 36513
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText161: TppDBText
        UserName = 'DBText161'
        DataField = 'RUBRICAINSS'
        DataPipeline = ppRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText164: TppDBText
        UserName = 'DBText164'
        DataField = 'VALORINSS'
        DataPipeline = ppRubrica
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3969
        mmLeft = 175419
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine54: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel185: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable25: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
    end
    object ppSummaryBand12: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel186: TppLabel
        UserName = 'Label129'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 265
        mmWidth = 15610
        BandType = 7
      end
      object ppLine55: TppLine
        UserName = 'Line28'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 127265
        mmTop = 3969
        mmWidth = 71173
        BandType = 7
      end
      object ppDBCalc48: TppDBCalc
        UserName = 'DBCalc48'
        DataField = 'VALORINSS'
        DataPipeline = ppRubrica
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubrica'
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 265
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup21: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppRubrica
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubrica'
      object ppGroupHeaderBand21: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine56: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel187: TppLabel
          UserName = 'Label83'
          Caption = 'Nº Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel188: TppLabel
          UserName = 'Label84'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 59002
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel190: TppLabel
          UserName = 'Label125'
          Caption = 'Esp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel191: TppLabel
          UserName = 'Label126'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 36777
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel193: TppLabel
          UserName = 'Label86'
          Caption = 'Fonte Mantenedora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 42863
          mmTop = 794
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText200: TppDBText
          UserName = 'DBText80'
          DataField = 'ENTIDADE'
          DataPipeline = ppRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppRubrica'
          mmHeight = 3969
          mmLeft = 74613
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel159: TppLabel
          UserName = 'Label159'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 794
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object lblMesRefRub: TppLabel
          UserName = 'lblMesRefRub'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 794
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel189: TppLabel
          UserName = 'Label189'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 153988
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel192: TppLabel
          UserName = 'Label192'
          Caption = 'Vlr. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 178859
          mmTop = 6879
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine57: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 1058
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel195: TppLabel
          UserName = 'Label141'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 131498
          mmTop = 1058
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppLine58: TppLine
          UserName = 'Line34'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 127265
          mmTop = 4498
          mmWidth = 71173
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc47'
          DataField = 'VALORINSS'
          DataPipeline = ppRubrica
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup21
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRubrica'
          mmHeight = 3175
          mmLeft = 175419
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppValorMant: TppBDEPipeline
    DataSource = dsValorMant
    UserName = 'ValorMant'
    Left = 608
    Top = 144
  end
  object dsValorMant: TwwDataSource
    DataSet = qryValorMant
    Left = 608
    Top = 128
  end
  object qryValorMant: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLANO, SIGLA,'
      '   SUM(CREDITO) CREDITO,'
      '   SUM(DESCONTO) DESCONTO,'
      '   (SUM(CREDITO) - SUM(DESCONTO) - SUM(GLOSA)) LIQUIDO,'
      '   SUM(CRED_REF) CRED_REF,'
      '   SUM(DESC_REF) DESC_REF,'
      '   SUM(CRED_ANT_REF) CRED_ANT_REF,'
      '   SUM(DESC_ANT_REF) DESC_ANT_REF,'
      '   SUM(GLOSA) GLOSA'
      'FROM'
      '   ('
      '   --CREDITO BRUTO'
      '   SELECT'
      '      SIGLA SIGLA,'
      '      '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '      SUM(VLRRUBRICA1) CREDITO,'
      '      0 DESCONTO,'
      '      0 CRED_REF,'
      '      0 DESC_REF,'
      '      0 CRED_ANT_REF,'
      '      0 DESC_ANT_REF,'
      '      0 GLOSA,'
      '     COUNT(*)'
      '   FROM'
      '      TEMPCONCINSS,'
      '      UFINSS'
      '   WHERE'
      '          MESPROCESSAMENTO =:mescobranca'
      
        '      AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCA' +
        'L(+)'
      '      AND (    (SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '            OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '            OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '            OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '      AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '             SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '      AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '        SUM(VLRRUBRICA2) CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '        SUM(VLRRUBRICA3) CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      ''
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '        SUM(VLRRUBRICA4) CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   --CREDITO NA REF.'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         SUM(VLRRUBRICA1) CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         SUM(VLRRUBRICA2) CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         SUM(VLRRUBRICA3) CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         SUM(VLRRUBRICA4) CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   --CREDITO ANTERIOR A REF.'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         SUM(VLRRUBRICA1) CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         SUM(VLRRUBRICA2) CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         SUM(VLRRUBRICA3) CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         SUM(VLRRUBRICA4) CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   -- DESCONTO BRUTO'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         SUM(VLRRUBRICA1) DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         SUM(VLRRUBRICA2) DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         SUM(VLRRUBRICA3) DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         SUM(VLRRUBRICA4) DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   --DESCONTO NA REF.'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         SUM(VLRRUBRICA1) DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         SUM(VLRRUBRICA2) DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         SUM(VLRRUBRICA3) DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         SUM(VLRRUBRICA4) DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   --DESCONTO ANTERIOR A REF.'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         SUM(VLRRUBRICA1) DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(CODRUBRICA1,2,1) <> '#39'9'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         SUM(VLRRUBRICA2) DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(CODRUBRICA2,2,1) <> '#39'9'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         SUM(VLRRUBRICA3) DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(CODRUBRICA3,2,1) <> '#39'9'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         SUM(VLRRUBRICA4) DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      '     AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '       OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '       OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '     AND (SUBSTR(CODRUBRICA4,2,1) <> '#39'9'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   -- GLOSA'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      
        '          SUM(DECODE(SUBSTR(CODRUBRICA1,2,1),'#39'1'#39',VLRRUBRICA1,'#39'2'#39 +
        ',-VLRRUBRICA1))  GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(CODRUBRICA1,1,1) = '#39'9'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      
        '         SUM(DECODE(SUBSTR(CODRUBRICA2,2,1),'#39'1'#39',VLRRUBRICA2,'#39'2'#39',' +
        '-VLRRUBRICA2))  GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO =  :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '     AND (SUBSTR(CODRUBRICA2,1,1) = '#39'9'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      
        '         SUM(DECODE(SUBSTR(CODRUBRICA3,2,1),'#39'1'#39',VLRRUBRICA3,'#39'2'#39',' +
        '-VLRRUBRICA3))  GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '     AND (SUBSTR(CODRUBRICA3,1,1) = '#39'9'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   SELECT SIGLA SIGLA,'
      '     '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      '         0 CREDITO,'
      '         0 DESCONTO,'
      '         0 CRED_REF,'
      '         0 DESC_REF,'
      '         0 CRED_ANT_REF,'
      '         0 DESC_ANT_REF,'
      
        '         SUM(DECODE(SUBSTR(CODRUBRICA4,2,1),'#39'1'#39',VLRRUBRICA4,'#39'2'#39',' +
        '-VLRRUBRICA4))  GLOSA,'
      '        COUNT(*)'
      '   FROM TEMPCONCINSS, UFINSS'
      '   WHERE MESPROCESSAMENTO = :mescobranca'
      
        '     AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL' +
        '(+)'
      '     AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '     AND (SUBSTR(CODRUBRICA4,1,1) = '#39'9'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY SIGLA, '#39'NÃO IDENTIFICADOS'#39
      '   UNION'
      '   /* VALOR POR MANT. MONTANDO'
      '      PATROCINADORA I'
      '   */'
      '   -- CRÉDITO BRUTO'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME PLANO,'
      '        SUM(D.VALORINSS) CREDITO,'
      '        0 DESCONTO,'
      '        0 CRED_REF,'
      '        0 DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- GLOSA'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        0 DESCONTO,'
      '        0 CRED_REF,'
      '        0 DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      
        '        SUM(DECODE(SUBSTR(D.RUBRICAINSS,2,1),  '#39'1'#39',D.VALORINSS,'#39 +
        '2'#39',-D.VALORINSS)) GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) =  '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- CREDITO - NA REF.'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        0 DESCONTO,'
      '        SUM(D.VALORINSS) CRED_REF,'
      '        0 DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- CREDITO - ANTERIOR A REF.'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        0 DESCONTO,'
      '        0 CRED_REF,'
      '        0 DESC_REF,'
      '        SUM(D.VALORINSS) CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- DESCONTO BRUTO'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        SUM(D.VALORINSS) DESCONTO,'
      '        0 CRED_REF,'
      '        0 DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- DESCONTO - NA REF.'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        0 DESCONTO,'
      '        0 CRED_REF,'
      '        SUM(D.VALORINSS) DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        0 DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   -- DESCONTO - ANTERIOR A REF.'
      '   SELECT UF.SIGLA SIGLA,'
      '     M.NOME,'
      '        0 CREDITO,'
      '        0 DESCONTO,'
      '        0 CRED_REF,'
      '        0 DESC_REF,'
      '        0 CRED_ANT_REF,'
      '        SUM(D.VALORINSS) DESC_ANT_REF,'
      '        0 GLOSA,'
      '        COUNT(*)'
      '   FROM DETCONCINSS D,'
      '      MANTENEDORA M,'
      '      UFINSS UF'
      '   WHERE 1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '     AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <' +
        '> 14))'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      '     AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY UF.SIGLA, M.NOME'
      '   UNION'
      '   /* VALOR POR MANT. MONTANDO PATROCINADORA II */'
      ''
      '   -- CRÉDITO BRUTO'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_RE' +
        'F, 0 CRED_ANT_REF,'
      '     0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      ''
      '   UNION'
      ''
      '   -- GLOSA'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_R' +
        'EF, 0 DESC_ANT_REF,'
      
        '     SUM(DECODE(SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1),  '#39'1'#39',D' +
        '.VALORINSS,'#39'2'#39',-VALORINSS)) GLOSA,'
      '     COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) = '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      '     '
      ''
      '   UNION'
      ''
      '   -- CRÉDITO NA REF.'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_RE' +
        'F, 0 CRED_ANT_REF,'
      '     0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA = D.MESREFERENCIA'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      ''
      '   UNION'
      ''
      '   -- CRÉDITO ANTERIOR A REF.'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALORI' +
        'NSS) CRED_ANT_REF,'
      '     0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA > D.MESREFERENCIA'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      '     '
      ''
      '   UNION'
      ''
      '   -- DESCONTO BRUTO'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_RE' +
        'F, 0 CRED_ANT_REF,'
      '     0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      '     '
      ''
      '   UNION'
      ''
      '   -- DESCONTO NA REF.'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_RE' +
        'F, 0 CRED_ANT_REF,'
      '     0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA = D.MESREFERENCIA'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39'  AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      '     '
      ''
      '   UNION'
      ''
      '   -- DESCONTO ANTERIOR A REF.'
      '   SELECT'
      '     UF.SIGLA SIGLA,'
      '     --//PL.NOME, AUGUSTO 28/07/2005'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END AS NOME,'
      
        '     0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_R' +
        'EF,'
      '     SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '   FROM'
      '     DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '   WHERE'
      '         1 = 1'
      '     AND D.MESCOBRANCA =  :mescobranca'
      '     AND D.MESCOBRANCA > D.MESREFERENCIA'
      '     AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '     AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '     AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAO' +
        'LOCAL(+)'
      
        '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '     AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '          SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '     AND ((:PFLGMANUAL IS NULL) OR (FLGMANUAL =:PFLGMANUAL))'
      '   GROUP BY'
      '     UF.SIGLA,'
      '     CASE'
      
        '       WHEN D.IDPLANOPREV =  2 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REG/REPLAN (MIGRADO)'#39
      
        '       WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66 THEN '#39 +
        'REPLAN EX/PREVHAB (MIGRADO)'#39
      '     ELSE'
      '       PL.NOME'
      '     END'
      ')'
      'GROUP BY'
      '  PLANO, SIGLA'
      'ORDER BY'
      '  PLANO DESC , SIGLA ASC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 608
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
        Value = '2003/12'
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptUnknown
      end>
  end
  object ppdsnValorMant: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rbValorMant
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 688
    Top = 128
  end
  object rbValorMant: TppReport
    AutoStop = False
    DataPipeline = ppValorMant
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 688
    Top = 112
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppValorMant'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 7673
        mmLeft = 0
        mmTop = 35190
        mmWidth = 45244
        BandType = 0
      end
      object ppDBImage13: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText167: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText168: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText196: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText199: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText201: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText202: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel194: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText203: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object rptValorMant_lblTitulo: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Valores Por Entidade / Mantenedora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 95515
        mmTop = 27517
        mmWidth = 96309
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel205: TppLabel
        UserName = 'Label159'
        Caption = 'Mês Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36777
        mmWidth = 25400
        BandType = 0
      end
      object lblMesRefVlrMant: TppLabel
        UserName = 'lblMesRefRub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 36777
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object BandaVM: TppShape
        UserName = 'BandaVM'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 4
      end
      object ppDBText204: TppDBText
        UserName = 'DBText204'
        DataField = 'SIGLA'
        DataPipeline = ppValorMant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText206: TppDBText
        UserName = 'DBText206'
        DataField = 'DESCONTO'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 100542
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText207: TppDBText
        UserName = 'DBText207'
        DataField = 'CREDITO'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText208: TppDBText
        UserName = 'DBText208'
        DataField = 'CRED_REF'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText209: TppDBText
        UserName = 'DBText209'
        DataField = 'DESC_REF'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText210: TppDBText
        UserName = 'DBText210'
        DataField = 'CRED_ANT_REF'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 198173
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText211: TppDBText
        UserName = 'DBText2101'
        DataField = 'DESC_ANT_REF'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 231246
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText222: TppDBText
        UserName = 'DBText222'
        DataField = 'Glosa'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 3969
        mmLeft = 258498
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel198: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
    end
    object ppSummaryBand10: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 14803425
        Pen.Color = clWhite
        mmHeight = 5821
        mmLeft = 0
        mmTop = 264
        mmWidth = 284957
        BandType = 7
      end
      object ppLabel216: TppLabel
        UserName = 'Label216'
        Caption = 'Líquido Apurado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 1058
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc68: TppDBCalc
        UserName = 'DBCalc601'
        DataField = 'CREDITO'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 4233
        mmLeft = 67998
        mmTop = 1058
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc69: TppDBCalc
        UserName = 'DBCalc69'
        DataField = 'DESCONTO'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 1058
        mmWidth = 24077
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5556
        mmWidth = 284692
        BandType = 7
      end
      object ppDBCalc70: TppDBCalc
        UserName = 'DBCalc70'
        DataField = 'LIQUIDO'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 1058
        mmWidth = 24077
        BandType = 7
      end
      object ppLabel217: TppLabel
        UserName = 'Label217'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 97367
        mmTop = 1058
        mmWidth = 1058
        BandType = 7
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161132
        mmTop = 1058
        mmWidth = 2117
        BandType = 7
      end
      object ppLabel256: TppLabel
        UserName = 'Label256'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 128852
        mmTop = 1058
        mmWidth = 1058
        BandType = 7
      end
      object ppDBCalc77: TppDBCalc
        UserName = 'DBCalc77'
        DataField = 'GLOSA'
        DataPipeline = ppValorMant
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMant'
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 1058
        mmWidth = 24077
        BandType = 7
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'TIPO'
      DataPipeline = ppValorMant
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppValorMant'
      object ppGroupHeaderBand19: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel209: TppLabel
          UserName = 'Label2002'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 79640
          mmTop = 265
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel200: TppLabel
          UserName = 'Label200'
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 108479
          mmTop = 265
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel203: TppLabel
          UserName = 'Label2001'
          Caption = 'Créd. Na Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 265
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel204: TppLabel
          UserName = 'Label204'
          Caption = 'Desc. Na Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 167217
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel207: TppLabel
          UserName = 'Label207'
          Caption = 'Créd. Mês Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 197380
          mmTop = 265
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel208: TppLabel
          UserName = 'Label208'
          Caption = 'Desc. Mês Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 230188
          mmTop = 265
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel215: TppLabel
          UserName = 'Label215'
          Caption = 'Glosa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 272786
          mmTop = 265
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLine59: TppLine
          UserName = 'Line13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppLabel199: TppLabel
          UserName = 'Label199'
          Caption = 'Entidade Contábil / Mantenedora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'Shape12'
          Brush.Color = 14803425
          Pen.Color = clWhite
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 284957
          BandType = 5
          GroupNo = 0
        end
        object ppLabel201: TppLabel
          UserName = 'Label201'
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 44186
          mmTop = 529
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc60: TppDBCalc
          UserName = 'DBCalc60'
          DataField = 'CREDITO'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 67998
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc61: TppDBCalc
          UserName = 'DBCalc61'
          DataField = 'DESCONTO'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc62: TppDBCalc
          UserName = 'DBCalc62'
          DataField = 'CRED_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc63: TppDBCalc
          UserName = 'DBCalc63'
          DataField = 'DESC_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 165629
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc64: TppDBCalc
          UserName = 'DBCalc64'
          DataField = 'CRED_ANT_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 198173
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc65: TppDBCalc
          UserName = 'DBCalc65'
          DataField = 'DESC_ANT_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 231246
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppLine61: TppLine
          UserName = 'Line61'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284692
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc67: TppDBCalc
          UserName = 'DBCalc67'
          DataField = 'Glosa'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 258498
          mmTop = 529
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup22: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppValorMant
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppValorMant'
      object ppGroupHeaderBand22: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText205: TppDBText
          UserName = 'DBText205'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppValorMant
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 4233
          mmLeft = 265
          mmTop = 265
          mmWidth = 48419
          BandType = 3
          GroupNo = 1
        end
        object ppLine66: TppLine
          UserName = 'Line66'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5291
          mmWidth = 284957
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand22: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'BandaVM1'
          Brush.Color = 14803425
          Pen.Color = clWhite
          mmHeight = 11113
          mmLeft = 0
          mmTop = 265
          mmWidth = 284957
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc51: TppDBCalc
          UserName = 'DBCalc51'
          DataField = 'CREDITO'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 67998
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLine60: TppLine
          UserName = 'Line27'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 1
        end
        object ppLabel202: TppLabel
          UserName = 'Label202'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 53711
          mmTop = 1323
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc52: TppDBCalc
          UserName = 'DBCalc52'
          DataField = 'DESCONTO'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc56: TppDBCalc
          UserName = 'DBCalc56'
          DataField = 'CRED_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc57: TppDBCalc
          UserName = 'DBCalc57'
          DataField = 'DESC_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 165629
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc58: TppDBCalc
          UserName = 'DBCalc58'
          DataField = 'CRED_ANT_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 198173
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc59: TppDBCalc
          UserName = 'DBCalc59'
          DataField = 'DESC_ANT_REF'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 231246
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 10583
          mmWidth = 284957
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc66: TppDBCalc
          UserName = 'DBCalc66'
          DataField = 'Glosa'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 258498
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc76: TppDBCalc
          UserName = 'DBCalc76'
          DataField = 'LIQUIDO'
          DataPipeline = ppValorMant
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMant'
          mmHeight = 3969
          mmLeft = 67998
          mmTop = 5821
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLabel255: TppLabel
          UserName = 'Label255'
          Caption = 'Líquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 50006
          mmTop = 5821
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppListaExcecoes: TppBDEPipeline
    DataSource = dsListaExcecoes
    UserName = 'ListaExcecoes'
    Left = 485
    Top = 354
  end
  object dsListaExcecoes: TwwDataSource
    DataSet = qryListaExcecoes
    Left = 431
    Top = 354
  end
  object qryListaExcecoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOTIVO, COUNT(*) OCORRENCIA'
      'FROM  TEMPCONCINSS'
      'WHERE (MESREFERENCIA = :MESREFERENCIA)  AND'
      '               (MOTIVO IS NOT NULL)'
      'GROUP BY MOTIVO'
      'ORDER BY MOTIVO')
    ValidateWithMask = True
    Left = 370
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
  end
  object ppdsnListaExcecoes: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpListaExcecoes
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 624
    Top = 356
  end
  object rpListaExcecoes: TppReport
    AutoStop = False
    DataPipeline = ppListaExcecoes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 549
    Top = 356
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppListaExcecoes'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51594
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'Shape13'
        mmHeight = 7673
        mmLeft = 0
        mmTop = 35190
        mmWidth = 42863
        BandType = 0
      end
      object ppDBImage14: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText212: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 66675
        BandType = 0
      end
      object ppDBText213: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 47361
        BandType = 0
      end
      object ppDBText214: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText215: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText216: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3440
        BandType = 0
      end
      object ppDBText217: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText218: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText219: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label65'
        Caption = 'Lista de Exceções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 27517
        mmWidth = 195792
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'Label159'
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36777
        mmWidth = 26988
        BandType = 0
      end
      object lblTituloListaExcecoes: TppLabel
        UserName = 'lblMesRefRub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 36777
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 46038
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        Caption = 'Ocorrências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 85990
        mmTop = 46038
        mmWidth = 20638
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 50800
        mmWidth = 196057
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText220: TppDBText
        UserName = 'DBText220'
        DataField = 'MOTIVO'
        DataPipeline = ppListaExcecoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppListaExcecoes'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 82021
        BandType = 4
      end
      object ppDBText221: TppDBText
        UserName = 'DBText221'
        DataField = 'OCORRENCIA'
        DataPipeline = ppListaExcecoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppListaExcecoes'
        mmHeight = 3175
        mmLeft = 89429
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine63: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel213: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
    end
    object ppSummaryBand13: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
    end
  end
  object ppListagemRubricas: TppBDEPipeline
    DataSource = dsListagemRubricas
    UserName = 'ListagemRubricas'
    Left = 376
    Top = 448
  end
  object dsListagemRubricas: TwwDataSource
    DataSet = qryListagemRubricas
    Left = 376
    Top = 432
  end
  object qryListagemRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   1 AS GRUPO, RUB, SUM(VALOR), SUM(QTD) QTD'
      ''
      'FROM'
      ''
      '   ('
      '   SELECT'
      '      R.RUBRICAINSS RUB, R.VALOR, SUM(QTD) QTD'
      '   FROM'
      '      RUBRICAXINSS RXI,'
      #9'   ('
      '      SELECT'
      '         RXI.RUBRICAINSS,'
      
        '         SUM(DECODE(PD.FLGDESCONTO, 0, D.VALORINSS, 1, -1 * D.VA' +
        'LORINSS, 0)) VALOR,'
      #9#9'   COUNT(*) QTD'
      #9'   FROM'
      '         DETCONCINSS  D,'
      '         RUBRICAXINSS RXI,'
      '         PROVDESC     PD'
      #9'   WHERE'
      '             D.MESCOBRANCA = :MESCOBRANCA'
      #9'      AND RXI.IDRUBRICA = D.IDRUBRICA'
      #9'      AND PD.IDPROVENTO = RXI.IDRUBRICA'
      #9'   GROUP BY'
      '         RXI.RUBRICAINSS'
      '      ) R'
      '   WHERE'
      '      RXI.RUBRICAINSS = R.RUBRICAINSS'
      '   GROUP BY'
      '      R.RUBRICAINSS, R.VALOR'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA1 RUB, SUM(VLRRUBRICA1) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'92'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA1'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA2 RUB, SUM(VLRRUBRICA2) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'92'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA2'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA3 RUB, SUM(VLRRUBRICA3) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'92'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA3'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA4 RUB, SUM(VLRRUBRICA4) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'92'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA4'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA1 RUB, SUM(- VLRRUBRICA1) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'91'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA1'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA2 RUB, SUM(- VLRRUBRICA2) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39') OR'
      '          (SUBSTR(CODRUBRICA2,1,2) = '#39'91'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA2'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA3 RUB, SUM(- VLRRUBRICA3) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39') OR'
      '          (SUBSTR(CODRUBRICA3,1,2) = '#39'91'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA3'
      ''
      ''
      '   UNION'
      ''
      ''
      '   SELECT'
      '      CODRUBRICA4 RUB, SUM(- VLRRUBRICA4) VALOR, COUNT(*) QTD'
      '   FROM'
      '      TEMPCONCINSS T'
      '   WHERE'
      '          T.MESPROCESSAMENTO = :MESCOBRANCA'
      '      AND ('
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39') OR'
      '          (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39') OR'
      '          (SUBSTR(CODRUBRICA4,1,2) = '#39'91'#39')'
      '          )'
      '   GROUP BY'
      '      CODRUBRICA4'
      ''
      '   ) R'
      ''
      'GROUP BY'
      '   1, RUB')
    ValidateWithMask = True
    Left = 376
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
        Value = '2003/08'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object dsnppListagemRubricas: TppDesigner
    Caption = 'Listagem das Rubricas'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpListagemRubricas
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 632
    Top = 432
  end
  object rpListagemRubricas: TppReport
    AutoStop = False
    DataPipeline = ppListagemRubricas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 632
    Top = 416
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppListagemRubricas'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51594
      mmPrintPosition = 0
      object ppShape16: TppShape
        UserName = 'Shape13'
        mmHeight = 7673
        mmLeft = 0
        mmTop = 35190
        mmWidth = 45773
        BandType = 0
      end
      object ppDBImage15: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText223: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText224: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText225: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText226: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText227: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText228: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText229: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel197: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText230: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel219: TppLabel
        UserName = 'Label65'
        Caption = 'Listagem de Rubricas Importadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65881
        mmTop = 27517
        mmWidth = 68263
        BandType = 0
      end
      object ppLine67: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel220: TppLabel
        UserName = 'Label159'
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36777
        mmWidth = 26988
        BandType = 0
      end
      object lblMesAnoListagemRubricas: TppLabel
        UserName = 'lblMesRefRub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 36777
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel222: TppLabel
        UserName = 'Label212'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 45508
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel223: TppLabel
        UserName = 'Label214'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 97631
        mmTop = 45508
        mmWidth = 8996
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line64'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 50271
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel221: TppLabel
        UserName = 'Label221'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 45508
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText231: TppDBText
        UserName = 'DBText231'
        DataField = 'RUB'
        DataPipeline = ppListagemRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppListagemRubricas'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText232: TppDBText
        UserName = 'DBText232'
        AutoSize = True
        DataField = 'SUM(VALOR)'
        DataPipeline = ppListagemRubricas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppListagemRubricas'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText236: TppDBText
        UserName = 'DBText236'
        DataField = 'QTD'
        DataPipeline = ppListagemRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppListagemRubricas'
        mmHeight = 3175
        mmLeft = 38894
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine69: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel224: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2381
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable28: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2646
        mmWidth = 197381
        BandType = 8
      end
    end
    object ppSummaryBand14: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup24: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppListagemRubricas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group24'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppListagemRubricas'
      object ppGroupHeaderBand24: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand24: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc71: TppDBCalc
          UserName = 'DBCalc71'
          AutoSize = True
          DataField = 'SUM(VALOR)'
          DataPipeline = ppListagemRubricas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppListagemRubricas'
          mmHeight = 3387
          mmLeft = 77925
          mmTop = 1323
          mmWidth = 28702
          BandType = 5
          GroupNo = 0
        end
        object ppLabel225: TppLabel
          UserName = 'Label225'
          Caption = 'Total Líquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 1323
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLine70: TppLine
          UserName = 'Line70'
          Pen.Color = clWindowText
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 1058
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppLine72: TppLine
          UserName = 'Line72'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc72: TppDBCalc
          UserName = 'DBCalc72'
          AutoSize = True
          DataField = 'QTD'
          DataPipeline = ppListagemRubricas
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppListagemRubricas'
          mmHeight = 3387
          mmLeft = 39455
          mmTop = 1323
          mmWidth = 16637
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppSubListagemRubricas: TppBDEPipeline
    DataSource = dsSubListagemRubricas
    UserName = 'ListagemRubricas1'
    Left = 504
    Top = 448
    MasterDataPipelineName = 'ppListagemRubricas'
  end
  object dsSubListagemRubricas: TwwDataSource
    DataSet = qrySubListagemRubricas
    Left = 504
    Top = 432
  end
  object qrySubListagemRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RXI.RUBRICAINSS RUBRICA, RXI1.RUBRICAINSS DOGRUPO, PD.DES' +
        'CRICAO'
      'FROM RUBRICAXINSS RXI,'
      #9' RUBRICAXINSS RXI1,'
      #9' PROVDESC PD'
      'WHERE'
      '-- RXI.FLGRUBCENTRAL = 1  AND'
      '  RXI.IDRUBRICA = RXI1.IDRUBRICA'
      '  AND RXI.RUBRICAINSS <> RXI1.RUBRICAINSS'
      '  AND RXI.IDRUBRICA = PD.IDPROVENTO'
      'ORDER BY RXI.RUBRICAINSS, RXI1.RUBRICAINSS   '
      ''
      '')
    ValidateWithMask = True
    Left = 504
    Top = 416
  end
  object qryDifReembINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  33 AS IDPLANOPREV, '#39'REPLAN                        '#39' AS NOMEPLA' +
        'NO,'
      
        '  '#39'000.840.225/6'#39' AS NB, 21 AS ESPECIE, '#39'968.071/7'#39' AS MATRICULA' +
        ','
      
        '  '#39'SINEIDE SANTOS DO NASCIMENTO LIMA'#39' AS NOMEBENEF, 2188 AS RUBF' +
        'UNCEF,'
      
        '  123231.99 AS VALORFUNCEF, 2101 AS RUBINSS, 133400.88 AS  VALOR' +
        'INSS, 65900.99 AS DIFERENCA ,'
      '  0 AS VALORINSSSINAL, 0 AS VALORPROVENTOSINAL,'
      '  '#39'(-)'#39' AS SINALDESEMB,  '#39'(-)'#39' AS SINALREEMB ,'
      '  1 AS ORDEMCONTABIL'
      'FROM'
      '  DUAL'
      'where 1=2'
      'ORDER BY NOMEPLANO, NB, ESPECIE'
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 74
    Top = 463
  end
  object dsDifReembINSS: TwwDataSource
    DataSet = cdsDifReemb
    Left = 119
    Top = 463
  end
  object ppDifReembINSS: TppBDEPipeline
    DataSource = dsDifReembINSS
    UserName = 'ValorMant1'
    Left = 165
    Top = 463
  end
  object pprDifReembINSS: TppReport
    AutoStop = False
    DataPipeline = ppDifReembINSS
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 205
    Top = 465
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDifReembINSS'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppShape17: TppShape
        UserName = 'Shape13'
        mmHeight = 7673
        mmLeft = 0
        mmTop = 35190
        mmWidth = 63236
        BandType = 0
      end
      object ppDBImage16: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText233: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText234: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText235: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText237: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText238: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText239: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText240: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel226: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText241: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel227: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Diferença dos Proventos Pagos por Conta do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 83873
        mmTop = 27517
        mmWidth = 125942
        BandType = 0
      end
      object ppLine71: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel228: TppLabel
        UserName = 'Label159'
        Caption = 'Mês Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36777
        mmWidth = 25400
        BandType = 0
      end
      object pplMesCobranca: TppLabel
        UserName = 'lblMesRefRub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 36777
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      AfterPrint = ppDetailBand18AfterPrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape18: TppShape
        UserName = 'BandaVM'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 4
      end
      object ppDBText242: TppDBText
        UserName = 'DBText242'
        DataField = 'NB'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText243: TppDBText
        UserName = 'DBText243'
        DataField = 'ESPECIE'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 31221
        mmTop = 265
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText244: TppDBText
        UserName = 'DBText244'
        DataField = 'MATRICULA'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText245: TppDBText
        UserName = 'DBText245'
        DataField = 'NOMEBENEF'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 64294
        mmTop = 265
        mmWidth = 94986
        BandType = 4
      end
      object ppDBText246: TppDBText
        UserName = 'DBText246'
        DataField = 'RUBFUNCEF'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 161132
        mmTop = 265
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText247: TppDBText
        UserName = 'DBText247'
        DataField = 'VALORFUNCEF'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 176477
        mmTop = 265
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText248: TppDBText
        UserName = 'DBText248'
        DataField = 'RUBINSS'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 216694
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText249: TppDBText
        UserName = 'DBText249'
        DataField = 'VALORINSS'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 229923
        mmTop = 265
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText251: TppDBText
        UserName = 'DBText251'
        DataField = 'DIFERENCA'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 260880
        mmTop = 265
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText275: TppDBText
        UserName = 'DBText275'
        DataField = 'SINALDESEMB'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 202936
        mmTop = 265
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText276: TppDBText
        UserName = 'DBText276'
        DataField = 'SINALREEMB'
        DataPipeline = ppDifReembINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 3969
        mmLeft = 253471
        mmTop = 265
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine73: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel230: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable29: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable30: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 256646
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand15: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppShape19: TppShape
        UserName = 'Shape15'
        Brush.Color = clMenu
        Pen.Color = clWhite
        mmHeight = 5821
        mmLeft = 0
        mmTop = 264
        mmWidth = 284957
        BandType = 7
      end
      object ppLine74: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5556
        mmWidth = 284692
        BandType = 7
      end
      object ppDBCalc74: TppDBCalc
        UserName = 'DBCalc74'
        DataField = 'VALORINSSSINAL'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc75: TppDBCalc
        UserName = 'DBCalc75'
        DataField = 'DIFERENCA'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 4233
        mmLeft = 258234
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc73: TppDBCalc
        UserName = 'DBCalc73'
        DataField = 'VALORPROVENTOSINAL'
        DataPipeline = ppDifReembINSS
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifReembINSS'
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 1058
        mmWidth = 28310
        BandType = 7
      end
    end
    object ppGroup26: TppGroup
      BreakName = 'IDPLANOPREV'
      DataPipeline = ppDifReembINSS
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group26'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDifReembINSS'
      object ppGroupHeaderBand26: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15610
        mmPrintPosition = 0
        object ppLabel234: TppLabel
          UserName = 'Label234'
          Caption = 'Fonte Mantenedora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 265
          mmWidth = 32544
          BandType = 3
          GroupNo = 0
        end
        object ppDBText250: TppDBText
          UserName = 'DBText250'
          DataField = 'NOMEPLANO'
          DataPipeline = ppDifReembINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDifReembINSS'
          mmHeight = 3969
          mmLeft = 41010
          mmTop = 265
          mmWidth = 101336
          BandType = 3
          GroupNo = 0
        end
        object ppLabel235: TppLabel
          UserName = 'Label235'
          Caption = 'Núm. Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 3704
          mmTop = 5556
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLine75: TppLine
          UserName = 'Line75'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine76: TppLine
          UserName = 'Line76'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 14021
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel236: TppLabel
          UserName = 'Label236'
          Caption = 'Espécie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 30427
          mmTop = 5556
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel237: TppLabel
          UserName = 'Label237'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 266965
          mmTop = 5556
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel238: TppLabel
          UserName = 'Label238'
          Caption = 'Valor INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 236273
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel239: TppLabel
          UserName = 'Label239'
          Caption = 'Valor Mantenedora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 175155
          mmTop = 5556
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel240: TppLabel
          UserName = 'Label240'
          Caption = 'Rubrica Funcef'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 161132
          mmTop = 5556
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel241: TppLabel
          UserName = 'Label241'
          Caption = 'Rubrica INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 215900
          mmTop = 5556
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel242: TppLabel
          UserName = 'Label242'
          Caption = 'Nome do Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 64294
          mmTop = 5556
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppLabel243: TppLabel
          UserName = 'Label243'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 44450
          mmTop = 5556
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand26: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppdDifReembINSS: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprDifReembINSS
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 256
    Top = 465
  end
  object updDifReembINSS: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  NB = :NB,'
      '  ESPECIE = :ESPECIE,'
      '  MATRICULA = :MATRICULA,'
      '  NOMEBENEF = :NOMEBENEF,'
      '  RUBFUNCEF = :RUBFUNCEF,'
      '  VALORFUNCEF = :VALORFUNCEF,'
      '  RUBINSS = :RUBINSS,'
      '  VALORINSS = :VALORINSS,'
      '  DIFERENCA = :DIFERENCA'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDPLANOPREV, NOMEPLANO, NB, ESPECIE, MATRICULA, NOMEBENEF, RU' +
        'BFUNCEF, '
      '   VALORFUNCEF, RUBINSS, VALORINSS, DIFERENCA)'
      'values'
      
        '  (:IDPLANOPREV, :NOMEPLANO, :NB, :ESPECIE, :MATRICULA, :NOMEBEN' +
        'EF, :RUBFUNCEF, '
      '   :VALORFUNCEF, :RUBINSS, :VALORINSS, :DIFERENCA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA')
    Left = 32
    Top = 464
  end
  object updExtrIndiv: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  DIB = :DIB,'
      '  MANTENEDORA = :MANTENEDORA,'
      '  NB = :NB,'
      '  ESPECIE = :ESPECIE,'
      '  MATRICULA = :MATRICULA,'
      '  NOMEBENEF = :NOMEBENEF,'
      '  RUBFUNCEF = :RUBFUNCEF,'
      '  VALORFUNCEF = :VALORFUNCEF,'
      '  RUBINSS = :RUBINSS,'
      '  VALORINSS = :VALORINSS,'
      '  DIFERENCA = :DIFERENCA,'
      '  MESCOBREEMB = :MESCOBREEMB,'
      '  MESREFREEMB = :MESREFREEMB,'
      '  RMREAJ = :RMREAJ,'
      '  IDPLANOPREVREEMB = :IDPLANOPREVREEMB,'
      '  PERFILINVEST = :PERFILINVEST'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  PERFILINVEST = :OLD_PERFILINVEST')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (MESCOBRANCA, MESREFERENCIA, IDPLANOPREV, NOMEPLANO, DIB, MANT' +
        'ENEDORA, '
      
        '   NB, ESPECIE, MATRICULA, NOMEBENEF, RUBFUNCEF, VALORFUNCEF, RU' +
        'BINSS, '
      
        '   VALORINSS, DIFERENCA, MESCOBREEMB, MESREFREEMB, RMREAJ, IDPLA' +
        'NOPREVREEMB, PERFILINVEST)'
      'values'
      
        '  (:MESCOBRANCA, :MESREFERENCIA, :IDPLANOPREV, :NOMEPLANO, :DIB,' +
        ' :MANTENEDORA, '
      
        '   :NB, :ESPECIE, :MATRICULA, :NOMEBENEF, :RUBFUNCEF, :VALORFUNC' +
        'EF, :RUBINSS, '
      
        '   :VALORINSS, :DIFERENCA, :MESCOBREEMB, :MESREFREEMB, :RMREAJ, ' +
        ':IDPLANOPREVREEMB, :PERFILINVEST)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  PERFILINVEST = :OLD_PERFILINVEST')
    Left = 15
    Top = 404
  end
  object qryExtrIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'2004/01'#39' AS MESCOBRANCA, '#39'200/4/01'#39' AS MESREFERENCIA,'
      
        '  33 AS IDPLANOPREV, '#39'REPLAN                        '#39' AS NOMEPLA' +
        'NO,'
      
        '  TO_DATE('#39'20/01/2004'#39','#39'DD/MM/YYYY'#39') AS DIB, '#39'CAIXA ECONOMICA FE' +
        'DERAL       '#39' AS MANTENEDORA,'
      
        '  '#39'000.840.225/6'#39' AS NB, 21 AS ESPECIE, '#39'968.071/7'#39' AS MATRICULA' +
        ','
      
        '  '#39'SINEIDE SANTOS DO NASCIMENTO LIMA'#39' AS NOMEBENEF, 2188 AS RUBF' +
        'UNCEF,'
      
        '  123231.99 AS VALORFUNCEF, 2101 AS RUBINSS, 133400.88 AS  VALOR' +
        'INSS, 65900.99 AS DIFERENCA,'
      
        '  '#39'2004/01'#39' AS MESCOBREEMB, '#39'200/4/01'#39' AS MESREFREEMB, 123.89 AS' +
        ' RMREAJ,'
      '  33 AS IDPLANOPREVREEMB,'
      
        '  '#39'                              '#39' AS NOMEPLANOPREV,  '#39'XXX - NOM' +
        'E de Descrição do Plano'#39' as PERFINV'
      'FROM'
      '  DUAL'
      'WHERE'
      '  1=2'
      'ORDER BY'
      '  MESCOBRANCA,IDPLANOPREV, NB, ESPECIE'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updExtrIndiv
    ValidateWithMask = True
    Left = 57
    Top = 403
  end
  object dsExtrIndiv: TwwDataSource
    DataSet = qryExtrIndiv
    Left = 102
    Top = 403
  end
  object ppExtrIndiv: TppBDEPipeline
    DataSource = dsExtrIndiv
    UserName = 'ExtrIndiv'
    Left = 144
    Top = 403
    object ppExtrIndivppField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppExtrIndivppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppExtrIndivppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppExtrIndivppField4: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppExtrIndivppField5: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppExtrIndivppField6: TppField
      FieldAlias = 'MANTENEDORA'
      FieldName = 'MANTENEDORA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppExtrIndivppField7: TppField
      FieldAlias = 'NB'
      FieldName = 'NB'
      FieldLength = 13
      DisplayWidth = 13
      Position = 6
    end
    object ppExtrIndivppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppExtrIndivppField9: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 9
      DisplayWidth = 9
      Position = 8
    end
    object ppExtrIndivppField10: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 33
      DisplayWidth = 33
      Position = 9
    end
    object ppExtrIndivppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBFUNCEF'
      FieldName = 'RUBFUNCEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppExtrIndivppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORFUNCEF'
      FieldName = 'VALORFUNCEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppExtrIndivppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBINSS'
      FieldName = 'RUBINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppExtrIndivppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINSS'
      FieldName = 'VALORINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppExtrIndivppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppExtrIndivppField16: TppField
      FieldAlias = 'MESCOBREEMB'
      FieldName = 'MESCOBREEMB'
      FieldLength = 7
      DisplayWidth = 7
      Position = 15
    end
    object ppExtrIndivppField17: TppField
      FieldAlias = 'MESREFREEMB'
      FieldName = 'MESREFREEMB'
      FieldLength = 8
      DisplayWidth = 8
      Position = 16
    end
    object ppExtrIndivppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'RMREAJ'
      FieldName = 'RMREAJ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppExtrIndivppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREVREEMB'
      FieldName = 'IDPLANOPREVREEMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppExtrIndivppField20: TppField
      FieldAlias = 'NOMEPLANOPREV'
      FieldName = 'NOMEPLANOPREV'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object ppExtrIndivppField21: TppField
      FieldAlias = 'PERFINV'
      FieldName = 'PERFINV'
      FieldLength = 32
      DisplayWidth = 32
      Position = 20
    end
  end
  object pprExtrIndiv: TppReport
    AutoStop = False
    DataPipeline = ppExtrIndiv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 180
    Top = 405
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtrIndiv'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 62706
      mmPrintPosition = 0
      object ppDBImage17: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText252: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 19981
        BandType = 0
      end
      object ppDBText253: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4191
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 91186
        BandType = 0
      end
      object ppDBText254: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 9398
        BandType = 0
      end
      object ppDBText255: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 7832
        BandType = 0
      end
      object ppDBText256: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3768
        BandType = 0
      end
      object ppDBText257: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 9313
        BandType = 0
      end
      object ppDBText258: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 7832
        BandType = 0
      end
      object ppLabel229: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText259: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 10964
        BandType = 0
      end
      object ppLabel231: TppLabel
        UserName = 'Label65'
        Caption = 'Extrato Individual de Reembolso INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 56886
        mmTop = 26458
        mmWidth = 76729
        BandType = 0
      end
      object ppLine77: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel246: TppLabel
        UserName = 'Label235'
        Caption = 'Núm. Benefício :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 40481
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel247: TppLabel
        UserName = 'Label236'
        Caption = 'Espécie :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 45245
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel254: TppLabel
        UserName = 'Label243'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 40481
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel253: TppLabel
        UserName = 'Label242'
        Caption = 'Nome do Beneficiário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 35190
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel251: TppLabel
        UserName = 'Label240'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 37306
        mmTop = 56621
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel250: TppLabel
        UserName = 'Label239'
        Caption = 'Valor Mantenedora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51065
        mmTop = 56621
        mmWidth = 29898
        BandType = 0
      end
      object ppLine81: TppLine
        UserName = 'Line76'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 61648
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel252: TppLabel
        UserName = 'Label241'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 118269
        mmTop = 56621
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel249: TppLabel
        UserName = 'Label238'
        Caption = 'Valor INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 56621
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText260: TppDBText
        UserName = 'DBText242'
        DataField = 'NB'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 40481
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText262: TppDBText
        UserName = 'DBText244'
        DataField = 'MATRICULA'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 77523
        mmTop = 40481
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText261: TppDBText
        UserName = 'DBText243'
        DataField = 'ESPECIE'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 45244
        mmWidth = 6085
        BandType = 0
      end
      object ppDBText263: TppDBText
        UserName = 'DBText245'
        DataField = 'NOMEBENEF'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 39423
        mmTop = 35190
        mmWidth = 94986
        BandType = 0
      end
      object ppLabel232: TppLabel
        UserName = 'Label232'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 56621
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel233: TppLabel
        UserName = 'Label233'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 56621
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel245: TppLabel
        UserName = 'Label245'
        Caption = 'Entidade Contábil :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 105040
        mmTop = 40481
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText273: TppDBText
        UserName = 'DBText273'
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 135202
        mmTop = 40481
        mmWidth = 57415
        BandType = 0
      end
      object ppLine80: TppLine
        UserName = 'Line80'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 49477
        mmWidth = 197381
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 1852
        mmTop = 51065
        mmWidth = 79111
        BandType = 0
      end
      object ppLabel257: TppLabel
        UserName = 'Label257'
        Caption = 'DESEMBOLSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 32544
        mmTop = 51329
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel258: TppLabel
        UserName = 'Label258'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 56621
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel259: TppLabel
        UserName = 'Label259'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100013
        mmTop = 56621
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel260: TppLabel
        UserName = 'Label260'
        Caption = 'Entidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 132557
        mmTop = 56621
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel261: TppLabel
        UserName = 'Label261'
        Caption = 'RMREAJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 56621
        mmWidth = 14552
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape201'
        Brush.Color = clMenu
        mmHeight = 4498
        mmLeft = 83344
        mmTop = 51065
        mmWidth = 114036
        BandType = 0
      end
      object ppLabel262: TppLabel
        UserName = 'Label262'
        Caption = 'REEMBOLSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132821
        mmTop = 51329
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel263: TppLabel
        UserName = 'Label263'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31221
        mmTop = 45245
        mmWidth = 32544
        BandType = 0
      end
      object ppDBText277: TppDBText
        UserName = 'DBText277'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 65088
        mmTop = 45245
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel275: TppLabel
        UserName = 'Label275'
        Caption = 'Perfil de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 100013
        mmTop = 45245
        mmWidth = 34756
        BandType = 0
      end
      object ppDBText286: TppDBText
        UserName = 'DBText286'
        DataField = 'PERFINV'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 135202
        mmTop = 45245
        mmWidth = 56621
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape21: TppShape
        UserName = 'BandaVM'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197381
        BandType = 4
      end
      object ppDBText264: TppDBText
        UserName = 'DBText246'
        DataField = 'RUBFUNCEF'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 37571
        mmTop = 265
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText265: TppDBText
        UserName = 'DBText247'
        DataField = 'VALORFUNCEF'
        DataPipeline = ppExtrIndiv
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 55827
        mmTop = 265
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText266: TppDBText
        UserName = 'DBText248'
        DataField = 'RUBINSS'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 119327
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText267: TppDBText
        UserName = 'DBText249'
        DataField = 'VALORINSS'
        DataPipeline = ppExtrIndiv
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText269: TppDBText
        UserName = 'DBText269'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText270: TppDBText
        UserName = 'DBText270'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText268: TppDBText
        UserName = 'DBText268'
        DataField = 'MESCOBREEMB'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText271: TppDBText
        UserName = 'DBText271'
        DataField = 'MESREFREEMB'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 100542
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText272: TppDBText
        UserName = 'DBText272'
        DataField = 'IDPLANOPREVREEMB'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 131763
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText274: TppDBText
        UserName = 'DBText274'
        DataField = 'RMREAJ'
        DataPipeline = ppExtrIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtrIndiv'
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine78: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel244: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 193146
        BandType = 8
      end
      object ppSystemVariable31: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 97896
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable32: TppSystemVariable
        UserName = 'SystemVariable32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand16: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppShape22: TppShape
        UserName = 'Shape15'
        Brush.Color = 14803425
        Pen.Color = clWhite
        mmHeight = 16669
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 7
      end
      object ppLine79: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 10319
        mmWidth = 197381
        BandType = 7
      end
      object ppLabel248: TppLabel
        UserName = 'Label248'
        Caption = 'Dif.='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 5556
        mmWidth = 7673
        BandType = 7
      end
      object lblTotalFuncef: TppLabel
        UserName = 'lblTotalFuncef'
        AutoSize = False
        Caption = 'lblTotalFuncef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57944
        mmTop = 5556
        mmWidth = 23019
        BandType = 7
      end
      object lblTotalReemb: TppLabel
        UserName = 'lblTotalReemb'
        AutoSize = False
        Caption = 'lblTotalReemb'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 143669
        mmTop = 5556
        mmWidth = 21167
        BandType = 7
      end
      object lblDiferenca: TppLabel
        UserName = 'lblDiferenca'
        AutoSize = False
        Caption = 'lblDiferenca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 5556
        mmWidth = 20108
        BandType = 7
      end
      object ppLabel196: TppLabel
        UserName = 'lblTotalFuncef1'
        AutoSize = False
        Caption = 'Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 5556
        mmWidth = 23019
        BandType = 7
      end
      object ppLabel266: TppLabel
        UserName = 'lblTotalReemb1'
        AutoSize = False
        Caption = 'Reembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 5556
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel267: TppLabel
        UserName = 'Label267'
        Caption = 'Glosa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 163248
        mmTop = 11642
        mmWidth = 10848
        BandType = 7
      end
      object lblGlosa: TppLabel
        UserName = 'lblDiferenca1'
        AutoSize = False
        Caption = 'lblGlosa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 11642
        mmWidth = 20108
        BandType = 7
      end
    end
  end
  object ppdExtrIndiv: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprExtrIndiv
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 223
    Top = 405
  end
  object CMSqlDifReemb: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  33 AS IDPLANOPREV, '#39'REPLAN                        '#39' AS NOMEPLA' +
        'NO,'
      
        '  '#39'000.840.225/6'#39' AS NB, 21 AS ESPECIE, '#39'968.071/7'#39' AS MATRICULA' +
        ','
      
        '  '#39'SINEIDE SANTOS DO NASCIMENTO LIMA'#39' AS NOMEBENEF, 2188 AS RUBF' +
        'UNCEF,'
      
        '  123231.99 AS VALORFUNCEF, 2101 AS RUBINSS, 133400.88 AS  VALOR' +
        'INSS, 65900.99 AS DIFERENCA ,'
      '  0 AS VALORINSSSINAL, 0 AS VALORPROVENTOSINAL,'
      '  '#39'(-)'#39' AS SINALDESEMB,  '#39'(-)'#39' AS SINALREEMB ,'
      '  1 AS ORDEMCONTABIL'
      'FROM'
      '  DUAL'
      'where 1=2'
      'ORDER BY NOMEPLANO, NB, ESPECIE'
      '')
    ClientDataSet = cdsDifReemb
    Left = 248
    Top = 352
  end
  object cdsDifReemb: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CMClientDataSet1Index1'
      end>
    IndexFieldNames = 'NOMEPLANO; NB; ESPECIE'
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 384
  end
  object ppdINSSFBSINT: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppINSSFBSINT
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 632
    Top = 305
  end
  object ppINSSFBSINT: TppReport
    AutoStop = False
    DataPipeline = ppbdeINSSFBSINT
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 589
    Top = 305
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppbdeINSSFBSINT'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppDBImage18: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText278: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText279: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText280: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText281: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText282: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText283: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText284: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel264: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText285: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel265: TppLabel
        UserName = 'Label65'
        Caption = 
          'Relação de Diferença dos Proventos Pagos por Conta do INSS - sin' +
          'tético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 74348
        mmTop = 27517
        mmWidth = 147373
        BandType = 0
      end
      object ppLine82: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      AfterPrint = ppDetailBand18AfterPrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape25: TppShape
        UserName = 'BandaVM'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine83: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel268: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable33: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable34: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 256646
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand17: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppShape26: TppShape
        UserName = 'Shape15'
        Brush.Color = clMenu
        Pen.Color = clWhite
        mmHeight = 5821
        mmLeft = 0
        mmTop = 264
        mmWidth = 284957
        BandType = 7
      end
      object ppLine84: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5556
        mmWidth = 284692
        BandType = 7
      end
      object ppDBCalc78: TppDBCalc
        UserName = 'DBCalc74'
        DataField = 'VALORINSSSINAL'
        DataPipeline = ppbdeINSSFBSINT
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdeINSSFBSINT'
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc79: TppDBCalc
        UserName = 'DBCalc75'
        DataField = 'DIFERENCA'
        DataPipeline = ppbdeINSSFBSINT
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdeINSSFBSINT'
        mmHeight = 4233
        mmLeft = 258234
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc80: TppDBCalc
        UserName = 'DBCalc73'
        DataField = 'VALORPROVENTOSINAL'
        DataPipeline = ppbdeINSSFBSINT
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppbdeINSSFBSINT'
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 1058
        mmWidth = 28310
        BandType = 7
      end
    end
    object ppGroup23: TppGroup
      BreakName = 'IDPLANOPREV'
      DataPipeline = ppbdeINSSFBSINT
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group26'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppbdeINSSFBSINT'
      object ppGroupHeaderBand23: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15610
        mmPrintPosition = 0
        object ppLabel269: TppLabel
          UserName = 'Label234'
          Caption = 'Fonte Mantenedora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 265
          mmWidth = 32544
          BandType = 3
          GroupNo = 0
        end
        object ppDBText297: TppDBText
          UserName = 'DBText250'
          DataField = 'NOMEPLANO'
          DataPipeline = ppbdeINSSFBSINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 41010
          mmTop = 265
          mmWidth = 101336
          BandType = 3
          GroupNo = 0
        end
        object ppLabel270: TppLabel
          UserName = 'Label235'
          Caption = 'Núm. Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 3704
          mmTop = 5556
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLine85: TppLine
          UserName = 'Line75'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine86: TppLine
          UserName = 'Line76'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 14021
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel271: TppLabel
          UserName = 'Label236'
          Caption = 'Espécie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 30427
          mmTop = 5556
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel272: TppLabel
          UserName = 'Label237'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 266965
          mmTop = 5556
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel273: TppLabel
          UserName = 'Label238'
          Caption = 'Valor INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 236273
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel274: TppLabel
          UserName = 'Label239'
          Caption = 'Valor Mantenedora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 175155
          mmTop = 5556
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel277: TppLabel
          UserName = 'Label242'
          Caption = 'Nome do Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 64294
          mmTop = 5556
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppLabel278: TppLabel
          UserName = 'Label243'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 44450
          mmTop = 5556
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand23: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup25: TppGroup
      BreakName = 'NB'
      DataPipeline = ppbdeINSSFBSINT
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group25'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppbdeINSSFBSINT'
      object ppGroupHeaderBand25: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand25: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText298: TppDBText
          UserName = 'DBText298'
          DataField = 'NB'
          DataPipeline = ppbdeINSSFBSINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          SuppressRepeatedValues = True
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 4233
          mmTop = 0
          mmWidth = 24871
          BandType = 5
          GroupNo = 1
        end
        object ppDBText299: TppDBText
          UserName = 'DBText299'
          DataField = 'ESPECIE'
          DataPipeline = ppbdeINSSFBSINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 32015
          mmTop = 0
          mmWidth = 6085
          BandType = 5
          GroupNo = 1
        end
        object ppDBText300: TppDBText
          UserName = 'DBText300'
          DataField = 'MATRICULA'
          DataPipeline = ppbdeINSSFBSINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          SuppressRepeatedValues = True
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 45244
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBText301: TppDBText
          UserName = 'DBText301'
          DataField = 'NOMEBENEF'
          DataPipeline = ppbdeINSSFBSINT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          SuppressRepeatedValues = True
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 65088
          mmTop = 0
          mmWidth = 94986
          BandType = 5
          GroupNo = 1
        end
        object ppDBText308: TppDBText
          UserName = 'DBText308'
          DataField = 'DIFERENCA'
          DataPipeline = ppbdeINSSFBSINT
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 261409
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc81: TppDBCalc
          UserName = 'DBCalc81'
          DataField = 'VALORFUNCEF'
          DataPipeline = ppbdeINSSFBSINT
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup25
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 165894
          mmTop = 0
          mmWidth = 39158
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc82: TppDBCalc
          UserName = 'DBCalc82'
          DataField = 'VALORINSSSINAL'
          DataPipeline = ppbdeINSSFBSINT
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup25
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppbdeINSSFBSINT'
          mmHeight = 3969
          mmLeft = 215900
          mmTop = 0
          mmWidth = 36513
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppbdeINSSFBSINT: TppBDEPipeline
    DataSource = dsINSSFBSINT
    UserName = 'bdeINSSFBSINT'
    Left = 549
    Top = 303
  end
  object dsINSSFBSINT: TwwDataSource
    DataSet = CMdsINSSFBSINT
    Left = 503
    Top = 303
  end
  object qryINSSFBSINT: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  33 AS IDPLANOPREV, '#39'REPLAN                        '#39' AS NOMEPLA' +
        'NO,'
      
        '  '#39'000.840.225/6'#39' AS NB, 21 AS ESPECIE, '#39'968.071/7'#39' AS MATRICULA' +
        ','
      
        '  '#39'SINEIDE SANTOS DO NASCIMENTO LIMA'#39' AS NOMEBENEF, 2188 AS RUBF' +
        'UNCEF,'
      
        '  123231.99 AS VALORFUNCEF, 2101 AS RUBINSS, 133400.88 AS  VALOR' +
        'INSS, 65900.99 AS DIFERENCA ,'
      '  0 AS VALORINSSSINAL, 0 AS VALORPROVENTOSINAL,'
      '  '#39'(-)'#39' AS SINALDESEMB,  '#39'(-)'#39' AS SINALREEMB ,'
      '  1 AS ORDEMCONTABIL'
      'FROM'
      '  DUAL'
      'where 1=2'
      'ORDER BY NOMEPLANO, NB, ESPECIE'
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDifReembINSS
    ValidateWithMask = True
    Left = 426
    Top = 303
  end
  object updINSSFBSINT: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  NB = :NB,'
      '  ESPECIE = :ESPECIE,'
      '  MATRICULA = :MATRICULA,'
      '  NOMEBENEF = :NOMEBENEF,'
      '  RUBFUNCEF = :RUBFUNCEF,'
      '  VALORFUNCEF = :VALORFUNCEF,'
      '  RUBINSS = :RUBINSS,'
      '  VALORINSS = :VALORINSS,'
      '  DIFERENCA = :DIFERENCA'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDPLANOPREV, NOMEPLANO, NB, ESPECIE, MATRICULA, NOMEBENEF, RU' +
        'BFUNCEF, '
      '   VALORFUNCEF, RUBINSS, VALORINSS, DIFERENCA)'
      'values'
      
        '  (:IDPLANOPREV, :NOMEPLANO, :NB, :ESPECIE, :MATRICULA, :NOMEBEN' +
        'EF, :RUBFUNCEF, '
      '   :VALORFUNCEF, :RUBINSS, :VALORINSS, :DIFERENCA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NB = :OLD_NB and'
      '  ESPECIE = :OLD_ESPECIE and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  NOMEBENEF = :OLD_NOMEBENEF and'
      '  RUBFUNCEF = :OLD_RUBFUNCEF and'
      '  VALORFUNCEF = :OLD_VALORFUNCEF and'
      '  RUBINSS = :OLD_RUBINSS and'
      '  VALORINSS = :OLD_VALORINSS and'
      '  DIFERENCA = :OLD_DIFERENCA')
    Left = 368
    Top = 304
  end
  object cmsqlINSSFBSINT: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  33 AS IDPLANOPREV, '#39'REPLAN                        '#39' AS NOMEPLA' +
        'NO,'
      
        '  '#39'000.840.225/6'#39' AS NB, 21 AS ESPECIE, '#39'968.071/7'#39' AS MATRICULA' +
        ','
      
        '  '#39'SINEIDE SANTOS DO NASCIMENTO LIMA'#39' AS NOMEBENEF, 2188 AS RUBF' +
        'UNCEF,'
      
        '  123231.99 AS VALORFUNCEF, 2101 AS RUBINSS, 133400.88 AS  VALOR' +
        'INSS, 65900.99 AS DIFERENCA ,'
      '  0 AS VALORINSSSINAL, 0 AS VALORPROVENTOSINAL,'
      '  '#39'(-)'#39' AS SINALDESEMB,  '#39'(-)'#39' AS SINALREEMB ,'
      '  1 AS ORDEMCONTABIL'
      'FROM'
      '  DUAL'
      'where 1=2'
      'ORDER BY NOMEPLANO, NB, ESPECIE'
      '')
    ClientDataSet = CMdsINSSFBSINT
    Left = 736
    Top = 328
  end
  object CMdsINSSFBSINT: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'NOMEPLANO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NB'
        Attributes = [faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'ESPECIE'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 9
      end
      item
        Name = 'NOMEBENEF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 33
      end
      item
        Name = 'RUBFUNCEF'
        DataType = ftFloat
      end
      item
        Name = 'VALORFUNCEF'
        DataType = ftFloat
      end
      item
        Name = 'RUBINSS'
        DataType = ftFloat
      end
      item
        Name = 'VALORINSS'
        DataType = ftFloat
      end
      item
        Name = 'DIFERENCA'
        DataType = ftFloat
      end
      item
        Name = 'VALORINSSSINAL'
        DataType = ftFloat
      end
      item
        Name = 'VALORPROVENTOSINAL'
        DataType = ftFloat
      end
      item
        Name = 'SINALDESEMB'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'SINALREEMB'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ORDEMCONTABIL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CMClientDataSet1Index1'
      end>
    IndexFieldNames = 'NOMEPLANO; NB; ESPECIE'
    Params = <>
    StoreDefs = True
    Left = 736
    Top = 312
  end
end
