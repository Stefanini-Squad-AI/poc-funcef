inherited DmRelHistCota: TDmRelHistCota
  Height = 206
  Caption = 'DmRelHistCota'
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
    DataPipelineName = 'pplExemplo'
  end
  object RptHistoricoCota: TppReport
    AutoStop = False
    DataPipeline = BdeHistoricoCota
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Evolução da Cota'
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
    Left = 218
    Top = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeHistoricoCota'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'Consulta do Histórico de Cota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 50536
        BandType = 0
      end
      object ppLabel10: TppLabel
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
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppRepExeDireitoShape1: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197909
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object ppLData: TppLabel
        UserName = 'LData'
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
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 25400
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'Patrimônio Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 25400
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 60325
        mmTop = 25400
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Quantidade de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 120121
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'Quantidade Aplicada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 151342
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = 'Quantidade Resgatada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 180711
        mmTop = 20902
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Índice IBOVESPA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 87048
        mmTop = 20902
        mmWidth = 14023
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
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
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 193146
        mmTop = 19844
        mmWidth = 4498
        BandType = 0
      end
      object ppLine56: TppLine
        UserName = 'Line56'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 0
        mmTop = 19844
        mmWidth = 4498
        BandType = 0
      end
      object ppLine58: TppLine
        UserName = 'Line58'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 12171
        mmTop = 19844
        mmWidth = 5556
        BandType = 0
      end
      object ppLine60: TppLine
        UserName = 'Line60'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 41010
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'Line601'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 73290
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line62'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 95779
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine63: TppLine
        UserName = 'Line63'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 129911
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 161132
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object lblCartGerenc: TppLabel
        UserName = 'lblCartGerenc'
        Caption = 'lblCartGerenc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 14023
        mmWidth = 19579
        BandType = 0
      end
      object lblPlan: TppLabel
        UserName = 'lblPlan'
        Caption = 'lblPlan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 184680
        mmTop = 8996
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object pspHistCota: TppShape
        OnPrint = pspHistCotaPrint
        UserName = 'pspHistCota'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197909
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DATA'
        DataPipeline = BdeHistoricoCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'SALDO'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'COTA'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'QUANTIDADE'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'QTDEAPL'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 135732
        mmTop = 529
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'QTDERES'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'INDICEEQM'
        DataPipeline = BdeHistoricoCota
        DisplayFormat = '###,###,###,###0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHistoricoCota'
        mmHeight = 3175
        mmLeft = 78846
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine55: TppLine
        UserName = 'Line55'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 193146
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 0
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object ppLine59: TppLine
        UserName = 'Line59'
        Position = lpRight
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 14552
        mmTop = 265
        mmWidth = 3175
        BandType = 4
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 43656
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine66: TppLine
        UserName = 'Line66'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 75936
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine67: TppLine
        UserName = 'Line67'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 98425
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 132557
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine69: TppLine
        UserName = 'Line69'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 163777
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel11: TppLabel
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
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 16933
        mmWidth = 32279
        BandType = 7
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 16933
        mmWidth = 39423
        BandType = 7
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 16933
        mmWidth = 60854
        BandType = 7
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        mmHeight = 10583
        mmLeft = 0
        mmTop = 265
        mmWidth = 197644
        BandType = 7
      end
      object ppShape33: TppShape
        UserName = 'Shape302'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 10848
        mmWidth = 39423
        BandType = 7
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 10848
        mmWidth = 32279
        BandType = 7
      end
      object lblTitPersInd: TppLabel
        UserName = 'lblTitPersInd'
        AutoSize = False
        Caption = '% sobre Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 12435
        mmWidth = 29104
        BandType = 7
      end
      object ppLabel260: TppLabel
        UserName = 'Label260'
        AutoSize = False
        Caption = 'Rentabilidade da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 12435
        mmWidth = 34925
        BandType = 7
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 0
        mmTop = 10848
        mmWidth = 96573
        BandType = 7
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        AutoSize = False
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 12435
        mmWidth = 20902
        BandType = 7
      end
      object lblIndicador: TppLabel
        UserName = 'lblIndicador'
        Caption = 'lblIndicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 8731
        mmTop = 17992
        mmWidth = 19844
        BandType = 7
      end
      object lblValorizacao: TppLabel
        UserName = 'lblValorizacao'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 141552
        mmTop = 18521
        mmWidth = 22754
        BandType = 7
      end
      object lblPerIndicador: TppLabel
        UserName = 'lblPerIndicador'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 18521
        mmWidth = 25665
        BandType = 7
      end
      object lblPerSind: TppLabel
        UserName = 'lblPerSind'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 18521
        mmWidth = 24606
        BandType = 7
      end
      object ppLine121: TppLine
        UserName = 'Line121'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197300
        BandType = 7
      end
      object ppLine122: TppLine
        UserName = 'Line122'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23018
        mmWidth = 197300
        BandType = 7
      end
      object ppLine125: TppLine
        UserName = 'Line125'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 0
        mmTop = 10848
        mmWidth = 5027
        BandType = 7
      end
      object ppLabel261: TppLabel
        UserName = 'Label261'
        Caption = 'VARIAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 85725
        mmTop = 2117
        mmWidth = 25400
        BandType = 7
      end
      object ppLine130: TppLine
        UserName = 'Line130'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 96309
        mmTop = 10848
        mmWidth = 30163
        BandType = 7
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Indicador + Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 96838
        mmTop = 12700
        mmWidth = 28046
        BandType = 7
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 96309
        mmTop = 17198
        mmWidth = 529
        BandType = 7
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 60590
        mmTop = 11113
        mmWidth = 2646
        BandType = 7
      end
      object lblEqmCab: TppLabel
        UserName = 'lblEqmCab'
        Caption = 'EQM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 12965
        mmWidth = 6615
        BandType = 7
      end
      object lblEQM: TppLabel
        UserName = 'lblPerIndicador1'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 72496
        mmTop = 18521
        mmWidth = 23019
        BandType = 7
      end
    end
  end
  object BdeHistoricoCota: TppBDEPipeline
    DataSource = DsHistoricoCota
    UserName = 'BdeHistoricoCota'
    Left = 157
    Top = 96
    object BdeHitoricoCotappField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object BdeHitoricoCotappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 1
    end
    object BdeHitoricoCotappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTA'
      FieldName = 'COTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object BdeHitoricoCotappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICEEQM'
      FieldName = 'INDICEEQM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 3
    end
    object BdeHitoricoCotappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 4
    end
    object BdeHitoricoCotappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEAPL'
      FieldName = 'QTDEAPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 5
    end
    object BdeHitoricoCotappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDERES'
      FieldName = 'QTDERES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 6
    end
    object BdeHitoricoCotappField8: TppField
      FieldAlias = 'CARTEIRA'
      FieldName = 'CARTEIRA'
      FieldLength = 79
      DisplayWidth = 30
      Position = 7
    end
  end
  object DsHistoricoCota: TwwDataSource
    DataSet = frmConsHistCota.Qry
    Left = 93
    Top = 96
  end
end
