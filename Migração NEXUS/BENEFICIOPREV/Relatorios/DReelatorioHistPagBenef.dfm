inherited dtmRelatorioHistPagBenef: TdtmRelatorioHistPagBenef
  Left = 475
  Top = 203
  Width = 587
  Height = 298
  Caption = 'dtmRelatorioHistPagBenef'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  inherited rpExemplo: TppReport
    Left = 226
    DataPipelineName = 'pplExemplo'
  end
  object rpHistPagBeneficio: TppReport
    AutoStop = False
    DataPipeline = ppHistPagBeneficio
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
    BeforePrint = rpHistPagBeneficioBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 417
    Top = 90
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppHistPagBeneficio'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 62706
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Histórico de Pagamento de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 102616
        mmTop = 26194
        mmWidth = 77343
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1852
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
      object rpDBText1: TppDBText
        UserName = 'rpDBText1'
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
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpDBText2: TppDBText
        UserName = 'rpDBText2'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 48048
        BandType = 0
      end
      object rpDBText31: TppDBText
        UserName = 'rpDBText31'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 57415
        BandType = 0
      end
      object rpDBText32: TppDBText
        UserName = 'rpDBText32'
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
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpDBText33: TppDBText
        UserName = 'rpDBText33'
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
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpDBText34: TppDBText
        UserName = 'rpDBText34'
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
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object rpDBText35: TppDBText
        UserName = 'rpDBText35'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 35454
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object rpDBText36: TppDBText
        UserName = 'rpDBText36'
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
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 0
        mmTop = 53975
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Beneficio Atual :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120386
        mmTop = 46567
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 4498
        mmTop = 34131
        mmWidth = 14012
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label4'
        Caption = 'Plano Previdenciârio :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 46567
        mmWidth = 27517
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 55827
        mmWidth = 284300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 60853
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label6'
        Caption = 'Mês Ref.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 56621
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Mês Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 24342
        mmTop = 56621
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label17'
        Caption = 'Período Referência Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 40217
        mmWidth = 35454
        BandType = 0
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 40217
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Período Referência Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 91017
        mmTop = 40217
        mmWidth = 35454
        BandType = 0
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 40217
        mmWidth = 35719
        BandType = 0
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19315
        mmTop = 34131
        mmWidth = 25400
        BandType = 0
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        CalcOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 32808
        mmTop = 46567
        mmWidth = 84931
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label12'
        Caption = 'Nome Beneficiário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 33867
        mmWidth = 24077
        BandType = 0
      end
      object ppVariable12: TppVariable
        UserName = 'Variable12'
        CalcOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 127794
        mmTop = 33867
        mmWidth = 77258
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 46038
        mmWidth = 133086
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Rub. Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 166688
        mmTop = 56886
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3387
        mmLeft = 193411
        mmTop = 56886
        mmWidth = 19578
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Vlr. Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 258763
        mmTop = 56621
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Rub. Benefício'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 51858
        mmTop = 56886
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 78317
        mmTop = 56886
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Vlr. Benefício'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 56356
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MESREF'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'MESCOBR'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 26194
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCRUBBENEF'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 529
        mmWidth = 61383
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALPAGBENEF'
        DataPipeline = ppHistPagBeneficio
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 143404
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VALPAGCONTRIB'
        DataPipeline = ppHistPagBeneficio
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 259028
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'RUBBENEF'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'RUBCONTRIB'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCRUBCONTRIB'
        DataPipeline = ppHistPagBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficio'
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 529
        mmWidth = 61913
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
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Benefício Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
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
        mmHeight = 3387
        mmLeft = 134191
        mmTop = 3175
        mmWidth = 18161
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppHistPagBeneficio: TppBDEPipeline
    DataSource = dsHistPagBeneficio
    UserName = 'lHistPagBeneficio'
    Left = 298
    Top = 82
    object ppHistPagBeneficioppField1: TppField
      FieldAlias = 'MESREF'
      FieldName = 'MESREF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object ppHistPagBeneficioppField2: TppField
      FieldAlias = 'MESCOBR'
      FieldName = 'MESCOBR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppHistPagBeneficioppField3: TppField
      FieldAlias = 'DESCRUBBENEF'
      FieldName = 'DESCRUBBENEF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppHistPagBeneficioppField4: TppField
      FieldAlias = 'RUBBENEF'
      FieldName = 'RUBBENEF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppHistPagBeneficioppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALPAGBENEF'
      FieldName = 'VALPAGBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppHistPagBeneficioppField6: TppField
      FieldAlias = 'DESCRUBCONTRIB'
      FieldName = 'DESCRUBCONTRIB'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppHistPagBeneficioppField7: TppField
      FieldAlias = 'RUBCONTRIB'
      FieldName = 'RUBCONTRIB'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppHistPagBeneficioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALPAGCONTRIB'
      FieldName = 'VALPAGCONTRIB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
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
    Left = 408
    Top = 27
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
    Left = 352
    Top = 26
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 288
    Top = 16
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
  object dsHistPagBeneficio: TwwDataSource
    AutoEdit = False
    DataSet = qryHistPagBeneficio
    Left = 167
    Top = 82
  end
  object qryHistPagBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '       '#39' '#39' MESREF,'
      '       '#39' '#39' MESCOBR,'
      '       '#39' '#39' DESCRUBBENEF,   '
      '       '#39' '#39'  RUBBENEF,   '
      '      0  VALPAGBENEF,'
      '       '#39' '#39' DESCRUBCONTRIB, '
      '       '#39' '#39' RUBCONTRIB, '
      '      0  VALPAGCONTRIB'
      ''
      'from dual')
    ValidateWithMask = True
    Left = 34
    Top = 82
    object qryHistPagBeneficioMESREF: TStringField
      FieldName = 'MESREF'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioMESCOBR: TStringField
      FieldName = 'MESCOBR'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioDESCRUBBENEF: TStringField
      FieldName = 'DESCRUBBENEF'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioRUBBENEF: TStringField
      FieldName = 'RUBBENEF'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioVALPAGBENEF: TFloatField
      FieldName = 'VALPAGBENEF'
    end
    object qryHistPagBeneficioDESCRUBCONTRIB: TStringField
      FieldName = 'DESCRUBCONTRIB'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioRUBCONTRIB: TStringField
      FieldName = 'RUBCONTRIB'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioVALPAGCONTRIB: TFloatField
      FieldName = 'VALPAGCONTRIB'
    end
  end
  object qryHistPagBeneficioAgrupa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ''
      #39' '#39' MES, '
      '0 VALPAGBENEF,  '
      '0 VALPAGCONTRIB'
      ''
      'FROM dual')
    ValidateWithMask = True
    Left = 34
    Top = 154
    object qryHistPagBeneficioAgrupaMES: TStringField
      FieldName = 'MES'
      FixedChar = True
      Size = 1
    end
    object qryHistPagBeneficioAgrupaVALPAGBENEF: TFloatField
      FieldName = 'VALPAGBENEF'
    end
    object qryHistPagBeneficioAgrupaVALPAGCONTRIB: TFloatField
      FieldName = 'VALPAGCONTRIB'
    end
  end
  object DSHistPagBeneficioAgrupa: TwwDataSource
    AutoEdit = False
    DataSet = qryHistPagBeneficioAgrupa
    Left = 175
    Top = 154
  end
  object ppHistPagBeneficioAgrupa: TppBDEPipeline
    DataSource = DSHistPagBeneficioAgrupa
    UserName = 'lHistPagBeneficio1'
    Left = 322
    Top = 154
    object ppHistPagBeneficioAgrupappField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppHistPagBeneficioAgrupappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALPAGBENEF'
      FieldName = 'VALPAGBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppHistPagBeneficioAgrupappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALPAGCONTRIB'
      FieldName = 'VALPAGCONTRIB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object rpHistPagBeneficioAgrupa: TppReport
    AutoStop = False
    DataPipeline = ppHistPagBeneficioAgrupa
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
    BeforePrint = rpHistPagBeneficioAgrupaBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 481
    Top = 154
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppHistPagBeneficioAgrupa'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 62442
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label11'
        Caption = 'Histórico de Pagamento de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 102616
        mmTop = 26194
        mmWidth = 77343
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1852
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
      object ppDBText13: TppDBText
        UserName = 'rpDBText1'
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
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'rpDBText2'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 48048
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'rpDBText31'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 57415
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'rpDBText32'
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
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'rpDBText33'
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
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'rpDBText34'
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
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'rpDBText35'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'rpDBText36'
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
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 0
        mmTop = 52652
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label1'
        Caption = 'Beneficiário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 96044
        mmTop = 33867
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 33867
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label4'
        Caption = 'Plano Previdenciârio :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 5292
        mmTop = 44979
        mmWidth = 29887
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 53711
        mmWidth = 284300
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 59796
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label6'
        Caption = 'Mês Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 54769
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Valor Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 61383
        mmTop = 54769
        mmWidth = 20373
        BandType = 0
      end
      object ppVariable6: TppVariable
        UserName = 'Variable6'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 34131
        mmWidth = 78317
        BandType = 0
      end
      object ppVariable7: TppVariable
        UserName = 'Variable7'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 39688
        mmWidth = 21431
        BandType = 0
      end
      object ppVariable8: TppVariable
        UserName = 'Variable8'
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35454
        mmTop = 45244
        mmWidth = 64029
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Período Referência Inicial: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 39423
        mmWidth = 38100
        BandType = 0
      end
      object ppVariable9: TppVariable
        UserName = 'Variable9'
        CalcOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21167
        mmTop = 34131
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Período Referência Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 96309
        mmTop = 39423
        mmWidth = 37042
        BandType = 0
      end
      object ppVariable10: TppVariable
        UserName = 'Variable10'
        CalcOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 39423
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Benefício Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 128059
        mmTop = 44979
        mmWidth = 23283
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'ppMemo2'
        Caption = 'ppMemo2'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 44186
        mmWidth = 133086
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'Valor Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 91281
        mmTop = 54769
        mmWidth = 25135
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText4'
        DataField = 'MES'
        DataPipeline = ppHistPagBeneficioAgrupa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficioAgrupa'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText7'
        DataField = 'VALPAGBENEF'
        DataPipeline = ppHistPagBeneficioAgrupa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficioAgrupa'
        mmHeight = 3175
        mmLeft = 52123
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText8'
        DataField = 'VALPAGCONTRIB'
        DataPipeline = ppHistPagBeneficioAgrupa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistPagBeneficioAgrupa'
        mmHeight = 3175
        mmLeft = 82021
        mmTop = 265
        mmWidth = 34660
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel29: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Benefício Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
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
        mmHeight = 3387
        mmLeft = 134191
        mmTop = 3175
        mmWidth = 18161
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'MES'
      DataPipeline = ppHistPagBeneficioAgrupa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistPagBeneficioAgrupa'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object daDataModule2: TdaDataModule
    end
  end
end
