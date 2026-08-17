inherited dtmRelItensEnvioSint: TdtmRelItensEnvioSint
  Left = 368
  Top = 236
  Width = 266
  Height = 167
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
  inherited dsExemplo: TwwDataSource
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplItensEnvioSint: TppBDEPipeline
    DataSource = dtsItensEnvioSint
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplItensEnvioSintppField1: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplItensEnvioSintppField2: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplItensEnvioSintppField3: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplItensEnvioSintppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_PATRO'
      FieldName = 'QUANT_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplItensEnvioSintppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PATRO'
      FieldName = 'VLR_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplItensEnvioSintppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REC_PATRO'
      FieldName = 'VLR_REC_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplItensEnvioSintppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_BENEF'
      FieldName = 'QUANT_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplItensEnvioSintppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_BENEF'
      FieldName = 'VLR_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplItensEnvioSintppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REC_BENEF'
      FieldName = 'VLR_REC_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplItensEnvioSintppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_CAR'
      FieldName = 'QUANT_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplItensEnvioSintppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CAR'
      FieldName = 'VLR_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplItensEnvioSintppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REC_CAR'
      FieldName = 'VLR_REC_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplItensEnvioSintppField13: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
  end
  object dtsItensEnvioSint: TwwDataSource
    DataSet = qryItensEnvioSint
    Left = 120
    Top = 68
  end
  object rptItensEnviadosSint: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Itens Enviados (Sintético)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 120
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31221
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Valores Enviados/Recebidos por Patrocinadora (sintético por Item' +
          ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object lblMesCobranca: TppLabel
        UserName = 'Label3'
        Caption = 'lblMesCobranca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 19844
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 19844
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Datas Efetivas entre:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 23813
        mmWidth = 30163
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'lblDataIni'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 23813
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = ' e '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 23548
        mmWidth = 3175
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 23813
        mmWidth = 15081
        BandType = 0
      end
      object lblPositivoNegativo: TppLabel
        UserName = 'lblPositivoNegativo'
        AutoSize = False
        Caption = 'Valores negativos tratados como Positivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 202142
        mmTop = 23813
        mmWidth = 67204
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensEnvioSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 1058
        mmWidth = 90488
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'QUANT_PATRO'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 1058
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_PATRO'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 114565
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_REC_PATRO'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 135732
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT_BENEF'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 160073
        mmTop = 1058
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_BENEF'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_REC_BENEF'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 192882
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23813
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
        mmLeft = 87842
        mmTop = 3175
        mmWidth = 94986
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
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 1588
        mmWidth = 270542
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 80169
        mmTop = 7408
        mmWidth = 18256
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 98161
        mmTop = 6085
        mmWidth = 116946
        BandType = 7
      end
      object ppDBCalc55: TppDBCalc
        UserName = 'DBCalc55'
        DataField = 'QUANT_PATRO'
        DataPipeline = pplItensEnvioSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 7408
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLR_PATRO'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 114565
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLR_REC_PATRO'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 135732
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'QUANT_BENEF'
        DataPipeline = pplItensEnvioSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 160073
        mmTop = 7408
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLR_BENEF'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLR_REC_BENEF'
        DataPipeline = pplItensEnvioSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 192882
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplItensEnvioSint
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 6879
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 1588
          mmWidth = 61648
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplItensEnvioSint
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 83608
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label2'
          Caption = 'Total Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 69321
          mmTop = 1323
          mmWidth = 29898
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 6350
          mmLeft = 98954
          mmTop = 0
          mmWidth = 115888
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'QUANT_PATRO'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 102923
          mmTop = 1323
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLR_PATRO'
          DataPipeline = pplItensEnvioSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 114565
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'VLR_REC_PATRO'
          DataPipeline = pplItensEnvioSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 135732
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'QUANT_BENEF'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 160073
          mmTop = 1323
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLR_BENEF'
          DataPipeline = pplItensEnvioSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VLR_REC_BENEF'
          DataPipeline = pplItensEnvioSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 192882
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplItensEnvioSint
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 11113
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 5556
          mmWidth = 92604
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10583
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label1'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105040
          mmTop = 5556
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 119592
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 102923
          mmTop = 4763
          mmWidth = 53446
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Folha da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 114565
          mmTop = 794
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 139171
          mmTop = 5556
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162190
          mmTop = 5556
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 160073
          mmTop = 4763
          mmWidth = 53446
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176742
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196321
          mmTop = 5556
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Folha de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176742
          mmTop = 794
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 83608
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
      end
    end
  end
  object qryItensEnvioSint: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryItensEnvioSintBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '   '#39'                                                            ' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS PATRO,'
      
        '   '#39'                                                            ' +
        #39' AS TCEDESCRICAO,'
      
        '   '#39'                                                            ' +
        #39' AS ITEDESCRICAO,'
      ''
      '           0 AS QUANT_PATRO,'
      '           0 AS VLR_PATRO,'
      '           0 AS VLR_REC_PATRO,'
      ''
      '           0 AS QUANT_BENEF,'
      '           0 AS VLR_BENEF,'
      '           0 AS VLR_REC_BENEF,'
      ''
      '           0 AS QUANT_CAR,'
      '           0 AS VLR_CAR,'
      '           0 AS VLR_REC_CAR'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryItensEnvioSintDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintQUANT_PATRO: TFloatField
      FieldName = 'QUANT_PATRO'
    end
    object qryItensEnvioSintVLR_PATRO: TFloatField
      FieldName = 'VLR_PATRO'
    end
    object qryItensEnvioSintVLR_REC_PATRO: TFloatField
      FieldName = 'VLR_REC_PATRO'
    end
    object qryItensEnvioSintQUANT_BENEF: TFloatField
      FieldName = 'QUANT_BENEF'
    end
    object qryItensEnvioSintVLR_BENEF: TFloatField
      FieldName = 'VLR_BENEF'
    end
    object qryItensEnvioSintVLR_REC_BENEF: TFloatField
      FieldName = 'VLR_REC_BENEF'
    end
    object qryItensEnvioSintQUANT_CAR: TFloatField
      FieldName = 'QUANT_CAR'
    end
    object qryItensEnvioSintVLR_CAR: TFloatField
      FieldName = 'VLR_CAR'
    end
    object qryItensEnvioSintVLR_REC_CAR: TFloatField
      FieldName = 'VLR_REC_CAR'
    end
    object qryItensEnvioSintPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 60
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (DESCTIPOEMPTMO, TCEDESCRICAO, ITEDESCRICAO, QUANT_PATRO, '
      'VLR_PATRO, '
      '   VLR_REC_PATRO, QUANT_BENEF, VLR_BENEF, VLR_REC_BENEF, '
      'QUANT_CAR, VLR_CAR, '
      '   VLR_REC_CAR)'
      'values'
      '  (:DESCTIPOEMPTMO, :TCEDESCRICAO, :ITEDESCRICAO, :QUANT_PATRO, '
      ':VLR_PATRO, '
      '   :VLR_REC_PATRO, :QUANT_BENEF, :VLR_BENEF, :VLR_REC_BENEF, '
      ':QUANT_CAR, '
      '   :VLR_CAR, :VLR_REC_CAR)')
    Left = 208
    Top = 56
  end
end
