inherited RptListaPresenca: TRptListaPresenca
  Left = 245
  Top = 228
  Width = 288
  Height = 276
  Caption = 'RptListaPresenca'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpListaPresenca
  end
  object rpListaPresenca: TppReport
    AutoStop = False
    DataPipeline = ppListaPresenca
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lista de Presença'
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 129911
        mmTop = 1588
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 129382
        mmTop = 13758
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Lista de Presença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 124090
        mmTop = 8202
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DATA1'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 82021
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DATA2'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DATA3'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 121444
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'DATA4'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 141023
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DATA5'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 160602
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'DATA6'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText101'
        DataField = 'DATA7'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 199496
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'DATA8'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 219340
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'DATA9'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 238919
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'DATA10'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 258498
        mmTop = 37571
        mmWidth = 17463
        BandType = 0
      end
      object rpTabCursosLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 10319
        mmWidth = 9790
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 238390
        mmTop = 14552
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 10319
        mmWidth = 7938
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 14552
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText20'
        DataField = 'ENTIDADE'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 21696
        mmWidth = 137319
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText201'
        DataField = 'INSTRUTOR'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 21696
        mmWidth = 97102
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Instrutor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 21696
        mmWidth = 15610
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2381
        mmTop = 42333
        mmWidth = 274373
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'SEM1'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 82021
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'SEM2'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'SEM3'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 121444
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'SEM4'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 141023
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'SEM5'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 160602
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'SEM6'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'SEM7'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 199496
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'SEM8'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 219340
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'SEM9'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 238919
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'SEM10'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 258498
        mmTop = 33338
        mmWidth = 17463
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 80963
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 100542
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 120121
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 139700
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 159279
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 178859
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 198438
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 218017
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 237861
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 257440
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10160
        mmLeft = 276755
        mmTop = 33338
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Nome do Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 37571
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText202'
        DataField = 'LOCAL'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 27252
        mmWidth = 137319
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'CARGAHORARIA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 27252
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Carga Hor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 27252
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMPREGADO'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 1588
        mmWidth = 77258
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DIA1'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 82021
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DIA2'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DIA3'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 121444
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DIA4'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 141023
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DIA5'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 160602
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DIA6'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DIA7'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 199496
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DIA8'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 219340
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DIA9'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 238919
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DIA10'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 258498
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2381
        mmTop = 6879
        mmWidth = 274373
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 80963
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 100542
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 120121
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 139700
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 159279
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 178859
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 198438
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 218017
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 237861
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 257440
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7145
        mmLeft = 276755
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppListaPresenca: TppBDEPipeline
    DataSource = dsListaPresenca
    SkipWhenNoRecords = False
    UserName = 'ppListaPresenca'
    Left = 215
    Top = 57
    object ppListaPresencappField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppListaPresencappField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppListaPresencappField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppListaPresencappField4: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppListaPresencappField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppListaPresencappField6: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppListaPresencappField7: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppListaPresencappField8: TppField
      FieldAlias = 'CARGAHORARIA'
      FieldName = 'CARGAHORARIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppListaPresencappField9: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppListaPresencappField10: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppListaPresencappField11: TppField
      FieldAlias = 'DIA1'
      FieldName = 'DIA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppListaPresencappField12: TppField
      FieldAlias = 'DIA2'
      FieldName = 'DIA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppListaPresencappField13: TppField
      FieldAlias = 'DIA3'
      FieldName = 'DIA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppListaPresencappField14: TppField
      FieldAlias = 'DIA4'
      FieldName = 'DIA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppListaPresencappField15: TppField
      FieldAlias = 'DIA5'
      FieldName = 'DIA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppListaPresencappField16: TppField
      FieldAlias = 'DIA6'
      FieldName = 'DIA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppListaPresencappField17: TppField
      FieldAlias = 'DIA7'
      FieldName = 'DIA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppListaPresencappField18: TppField
      FieldAlias = 'DIA8'
      FieldName = 'DIA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppListaPresencappField19: TppField
      FieldAlias = 'DIA9'
      FieldName = 'DIA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppListaPresencappField20: TppField
      FieldAlias = 'DIA10'
      FieldName = 'DIA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppListaPresencappField21: TppField
      FieldAlias = 'SEM1'
      FieldName = 'SEM1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppListaPresencappField22: TppField
      FieldAlias = 'SEM2'
      FieldName = 'SEM2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppListaPresencappField23: TppField
      FieldAlias = 'SEM3'
      FieldName = 'SEM3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppListaPresencappField24: TppField
      FieldAlias = 'SEM4'
      FieldName = 'SEM4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object ppListaPresencappField25: TppField
      FieldAlias = 'SEM5'
      FieldName = 'SEM5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppListaPresencappField26: TppField
      FieldAlias = 'SEM6'
      FieldName = 'SEM6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppListaPresencappField27: TppField
      FieldAlias = 'SEM7'
      FieldName = 'SEM7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppListaPresencappField28: TppField
      FieldAlias = 'SEM8'
      FieldName = 'SEM8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object ppListaPresencappField29: TppField
      FieldAlias = 'SEM9'
      FieldName = 'SEM9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object ppListaPresencappField30: TppField
      FieldAlias = 'SEM10'
      FieldName = 'SEM10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppListaPresencappField31: TppField
      FieldAlias = 'DATA1'
      FieldName = 'DATA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppListaPresencappField32: TppField
      FieldAlias = 'DATA2'
      FieldName = 'DATA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppListaPresencappField33: TppField
      FieldAlias = 'DATA3'
      FieldName = 'DATA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object ppListaPresencappField34: TppField
      FieldAlias = 'DATA4'
      FieldName = 'DATA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
    object ppListaPresencappField35: TppField
      FieldAlias = 'DATA5'
      FieldName = 'DATA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object ppListaPresencappField36: TppField
      FieldAlias = 'DATA6'
      FieldName = 'DATA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object ppListaPresencappField37: TppField
      FieldAlias = 'DATA7'
      FieldName = 'DATA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 36
    end
    object ppListaPresencappField38: TppField
      FieldAlias = 'DATA8'
      FieldName = 'DATA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppListaPresencappField39: TppField
      FieldAlias = 'DATA9'
      FieldName = 'DATA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppListaPresencappField40: TppField
      FieldAlias = 'DATA10'
      FieldName = 'DATA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 39
    end
  end
  object dsListaPresenca: TwwDataSource
    AutoEdit = False
    DataSet = CdsListaPresenca
    Left = 215
    Top = 103
  end
  object CdsListaPresenca: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 148
    Data = {
      020800009619E0BD010000001800000028000000000003000000020807454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200460009454D5052454741444F0100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200460009494E5354
      5255544F5201004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020046000944455343524943414F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      4802000200460005434152474F01004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002004600054C4F43414C01
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020046000C4341524741484F52415249410100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02000A000744415441494E490100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00074441544146494D
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000444494131010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00044449
      413201004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A00044449413301004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0004
      4449413401004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A0004444941350100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      00044449413601004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000444494137010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A00044449413801004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A00044449413901004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A0005444941313001004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000453454D3101004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002000A000453454D3201004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000A000453454D330100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A000453454D340100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A000453454D35
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000453454D36010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00045345
      4D3701004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000453454D3801004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0004
      53454D3901004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A000553454D313001004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0A0005444154413101004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A00054441544132010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      020002000A000544415441330100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A000544415441340100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A0005444154413501004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A0005444154
      413601004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A00054441544137010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      05444154413801004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000544415441390100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02000A000644415441313001004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000100044C4349440400
      010009080000}
  end
  object sqlListaPresenca: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      '  '#39'1234567890'#39' AS CARGAHORARIA,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  '#39'1234567890'#39' AS DIA1,'
      '  '#39'1234567890'#39' AS DIA2,'
      '  '#39'1234567890'#39' AS DIA3,'
      '  '#39'1234567890'#39' AS DIA4,'
      '  '#39'1234567890'#39' AS DIA5,'
      '  '#39'1234567890'#39' AS DIA6,'
      '  '#39'1234567890'#39' AS DIA7,'
      '  '#39'1234567890'#39' AS DIA8,'
      '  '#39'1234567890'#39' AS DIA9,'
      '  '#39'1234567890'#39' AS DIA10,'
      '  '#39'1234567890'#39' AS SEM1,'
      '  '#39'1234567890'#39' AS SEM2,'
      '  '#39'1234567890'#39' AS SEM3,'
      '  '#39'1234567890'#39' AS SEM4,'
      '  '#39'1234567890'#39' AS SEM5,'
      '  '#39'1234567890'#39' AS SEM6,'
      '  '#39'1234567890'#39' AS SEM7,'
      '  '#39'1234567890'#39' AS SEM8,'
      '  '#39'1234567890'#39' AS SEM9,'
      '  '#39'1234567890'#39' AS SEM10,'
      '  '#39'1234567890'#39' AS DATA1,'
      '  '#39'1234567890'#39' AS DATA2,'
      '  '#39'1234567890'#39' AS DATA3,'
      '  '#39'1234567890'#39' AS DATA4,'
      '  '#39'1234567890'#39' AS DATA5,'
      '  '#39'1234567890'#39' AS DATA6,'
      '  '#39'1234567890'#39' AS DATA7,'
      '  '#39'1234567890'#39' AS DATA8,'
      '  '#39'1234567890'#39' AS DATA9,'
      '  '#39'1234567890'#39' AS DATA10'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' ')
    ClientDataSet = CdsListaPresenca
    Left = 215
    Top = 200
  end
end
