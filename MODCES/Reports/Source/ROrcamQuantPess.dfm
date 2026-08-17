inherited RptOrcamQuantPess: TRptOrcamQuantPess
  Left = 221
  Top = 174
  Height = 276
  Caption = 'RptOrcamQuantPess'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpOrcamQuantPess
  end
  object rpOrcamQuantPess: TppReport
    AutoStop = False
    DataPipeline = ppOrcamQuantPess
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lista de Presença'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppOrcamQuantPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 86254
        mmTop = 529
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ANO'
        DataPipeline = ppOrcamQuantPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 7673
        mmWidth = 7673
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
        mmLeft = 162719
        mmTop = 3175
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
        mmLeft = 157692
        mmTop = 7408
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
        mmLeft = 173302
        mmTop = 3175
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
        mmLeft = 173302
        mmTop = 7408
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Estabelecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 15610
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 66675
        mmTop = 15610
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 15610
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Quantidade de Pessoal (Manpower) - Orçado x Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 51329
        mmTop = 6879
        mmWidth = 103981
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Jan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 22225
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Ano:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 7673
        mmWidth = 7938
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 2646
        mmTop = 27252
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 52123
        mmTop = 22225
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Mar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 65352
        mmTop = 22225
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Abr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 78846
        mmTop = 22225
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label101'
        Caption = 'Mai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91546
        mmTop = 22225
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Jun'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 104511
        mmTop = 22225
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Jul'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 22225
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Ago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 131234
        mmTop = 22225
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Set'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 22225
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Out'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 22225
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Nov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 170921
        mmTop = 22225
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Dez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 184415
        mmTop = 22225
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ESTABELECIMENTO'
        DataPipeline = ppOrcamQuantPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 62177
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2646
        mmTop = 22490
        mmWidth = 190500
        BandType = 4
      end
      object ppDBTextTeor: TppDBText
        UserName = 'DBTextTeor'
        DataField = 'DIF1'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 37042
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBTextTeor1'
        DataField = 'DIF2'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DIF4'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBTextTeor2'
        DataField = 'DIF3'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DIF8'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DIF7'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBTextTeor3'
        DataField = 'DIF5'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DIF6'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DIF12'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DIF11'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBTextTeor4'
        DataField = 'DIF9'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DIF10'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 17463
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText20'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppOrcamQuantPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 66675
        mmTop = 1588
        mmWidth = 62177
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText202'
        DataField = 'CARGO'
        DataPipeline = ppOrcamQuantPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 1588
        mmWidth = 62177
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBTextTeor5'
        DataField = 'REA1'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 37042
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'REA2'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REA4'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText201'
        DataField = 'REA3'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText101'
        DataField = 'REA8'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'REA7'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'REA5'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'REA6'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'REA12'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'REA11'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'REA9'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'REA10'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 12171
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'ORC1'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 37042
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'ORC2'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'ORC4'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'ORC3'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'ORC8'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'ORC7'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'ORC5'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'ORC6'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'ORC12'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'ORC11'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'ORC9'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'ORC10'
        DataPipeline = ppOrcamQuantPess2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 6879
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label8'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 6879
        mmWidth = 11642
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = 'Real / Projetado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 12171
        mmWidth = 25135
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label19'
        Caption = 'Diferença (Real - Orç)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 17463
        mmWidth = 34396
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
    end
  end
  object ppOrcamQuantPess: TppBDEPipeline
    DataSource = dsOrcamQuantPess
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'OrcamQuantPess'
    Left = 215
    Top = 57
  end
  object dsOrcamQuantPess: TwwDataSource
    AutoEdit = False
    DataSet = CdsOrcamQuantPess
    Left = 215
    Top = 103
  end
  object CdsOrcamQuantPess: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 148
  end
  object sqlOrcamQuantPess: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ESTABELECIMENTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      '  0 AS ANO,'
      
        '  0 AS ORC1, 0 AS ORC2, 0 AS ORC3, 0 AS ORC4, 0 AS ORC5, 0 AS OR' +
        'C6,'
      
        '  0 AS ORC7, 0 AS ORC8, 0 AS ORC9, 0 AS ORC10, 0 AS ORC11, 0 AS ' +
        'ORC12,'
      
        '  0 AS REA1, 0 AS REA2, 0 AS REA3, 0 AS REA4, 0 AS REA5, 0 AS RE' +
        'A6,'
      
        '  0 AS REA7, 0 AS REA8, 0 AS REA9, 0 AS REA10, 0 AS REA11, 0 AS ' +
        'REA12,'
      
        '  0 AS DIF1, 0 AS DIF2, 0 AS DIF3, 0 AS DIF4, 0 AS DIF5, 0 AS DI' +
        'F6,'
      
        '  0 AS DIF7, 0 AS DIF8, 0 AS DIF9, 0 AS DIF10, 0 AS DIF11, 0 AS ' +
        'DIF12'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsOrcamQuantPess
    Left = 215
    Top = 200
  end
  object ppOrcamQuantPess2: TppBDEPipeline
    DataSource = dsOrcamQuantPess2
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'OrcamQuantPess2'
    Left = 95
    Top = 57
  end
  object dsOrcamQuantPess2: TwwDataSource
    AutoEdit = False
    DataSet = CdsOrcamQuantPess2
    Left = 95
    Top = 103
  end
  object CdsOrcamQuantPess2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 148
  end
  object sqlOrcamQuantPess2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ESTABELECIMENTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      '  0 AS ANO,'
      
        '  0 AS ORC1, 0 AS ORC2, 0 AS ORC3, 0 AS ORC4, 0 AS ORC5, 0 AS OR' +
        'C6,'
      
        '  0 AS ORC7, 0 AS ORC8, 0 AS ORC9, 0 AS ORC10, 0 AS ORC11, 0 AS ' +
        'ORC12,'
      
        '  0 AS REA1, 0 AS REA2, 0 AS REA3, 0 AS REA4, 0 AS REA5, 0 AS RE' +
        'A6,'
      
        '  0 AS REA7, 0 AS REA8, 0 AS REA9, 0 AS REA10, 0 AS REA11, 0 AS ' +
        'REA12,'
      
        '  0 AS DIF1, 0 AS DIF2, 0 AS DIF3, 0 AS DIF4, 0 AS DIF5, 0 AS DI' +
        'F6,'
      
        '  0 AS DIF7, 0 AS DIF8, 0 AS DIF9, 0 AS DIF10, 0 AS DIF11, 0 AS ' +
        'DIF12'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsOrcamQuantPess2
    Left = 95
    Top = 200
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  0 AS ORC1, 0 AS REA1, 0 AS DIF1,'
      '  0 AS ORC2, 0 AS REA2, 0 AS DIF2,'
      '  0 AS ORC3, 0 AS REA3, 0 AS DIF3,'
      '  0 AS ORC4, 0 AS REA4, 0 AS DIF4,'
      '  0 AS ORC5, 0 AS REA5, 0 AS DIF5,'
      '  0 AS ORC6, 0 AS REA6, 0 AS DIF6,'
      '  0 AS ORC7, 0 AS REA7, 0 AS DIF7,'
      '  0 AS ORC8, 0 AS REA8, 0 AS DIF8,'
      '  0 AS ORC9, 0 AS REA9, 0 AS DIF9,'
      '  0 AS ORC10, 0 AS REA10, 0 AS DIF10,'
      '  0 AS ORC11, 0 AS REA11, 0 AS DIF11,'
      '  0 AS ORC12, 0 AS REA12, 0 AS DIF12'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsOrcamQuantPess2
    Left = 15
    Top = 184
  end
end
